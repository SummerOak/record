### root	原理
root的本质就是在系统中植入一个带s位的，owner 用户为root，并且普通用户有可执行权限的 ```su``` 文件：

```
chiron:/ $ ll /system/xbin/su
-rwsr-x--x 1 root shell 1370576 2019-06-19 13:32 /system/xbin/su
```
* 带 s 位是为了让任何用户执行 su 起来的进程的uid 是 root；
* 一般 root 工具把 su 植入后，还有个 app 来管理授权，当有app执行 su 尝试取得 root 权限时， su 会询问 app 是否给与授权。 

* 接下来我们分别来分析 su 这个可执行文件，然后再看 su 是怎么和权限管理 app 交互的。

### su 

可执行文件 ```/system/xbin/su``` 有2种启动模式

* 第一种： ```daemon``` 模式启动，通过 init的配置启动 ，起来后监听客户端发送过来的请求：

	external/koush/Superuser/init.superuser.rc
	
	```
	# su daemon
	service su_daemon /system/xbin/su --daemon
	    seclabel u:r:su:s0
	    oneshot
	```

	```
	int main(int argc, char *argv[]) {
	    return su_main(argc, argv, 1);
	}
	
	int su_main(int argc, char *argv[], int need_client) {
		 // start up in daemon mode if prompted
	    if (argc == 2 && strcmp(argv[1], "--daemon") == 0) {
	        return run_daemon();
	    }
		...
	}
	
	int run_daemon() {
		...
		if (bind(fd, (struct sockaddr*)&sun, sizeof(sun)) < 0) {
		    PLOGE("daemon bind");
		    goto err;
		}
		
		if (listen(fd, 10) < 0) {
		    PLOGE("daemon listen");
		    goto err;
		}
			
		int client;
		while ((client = accept(fd, NULL, NULL)) > 0) {
			if (fork_zero_fucks() == 0) { // fork 一个孙进程并让 init 领养
			    close(fd);
			    return daemon_accept(client); // 被 init 领养的孙进程
			} else {
			    close(client);
			}
		}
		...
	}
	
	```
* 另外一种是客户端模式启动，也就是其他app要请求 root 权限时执行 su 这种场景。 这种启动模式，启动后解析参数， 把参数发送给 ```daemon``` ：

	```
	int su_main(int argc, char *argv[], int need_client) {
		// start up in daemon mode if prompted
		if (argc == 2 && strcmp(argv[1], "--daemon") == 0) {
		    return run_daemon();
		}
		...//参数解析部分省略
		if (need_client) {
		    // attempt to use the daemon client if not root,
		    // or this is api 18 and adb shell (/data is not readable even as root)
		    // or just always use it on API 19+ (ART)
		    if ((geteuid() != AID_ROOT && getuid() != AID_ROOT) ||
		        (get_api_version() >= 18 && getuid() == AID_SHELL) ||
		        get_api_version() >= 19) {
		        // attempt to connect to daemon...
		        LOGD("starting daemon client %d %d", getuid(), geteuid());
		        return connect_daemon(argc, argv, ppid);
		    }
		}
		...
	}
	```

### 授权过程

* 客户端执行 su 后，会把请求参数通过 socket 发送给 daemon ， 发送的内容除了参数外，还发送了 ```STDIN_FILENO``` ```STDOUT_FILENO``` ```STDERR_FILENO``` 这些标准输入输出文件句柄，这样 daemon 这边代理执行目标命令时，能够把结果输送回客户端进程；

* su --daemon 收到请求后，会 fork 一个孙进程让 init 进程领养，这个孙进程解析请求参数后，再 fork 一个子进程来最终执行目标命令。 

	```
	static int daemon_accept(int fd) {
		.../读取并解析参数
		write_int(fd, 1); //ack
		int child = fork();
		if (child != 0) {
			...
			return code;
		}
		
		close (fd);

		// Become session leader
		if (setsid() == (pid_t) -1) {
			PLOGE("setsid");
		}
		...
		return run_daemon_child(infd, outfd, errfd, argc, argv);
	}
	
	static int run_daemon_child(int infd, int outfd, int errfd, int argc, char** argv) {
		...
		return su_main(argc, argv, 0);
	}
	```

	su_main 里面决定给客户端 su 权限后，调用allow 来做最终的授权。设置好目标用户的uid和gid 后通过 execvp 系统调用执行最终的请求命令：
	
	```
	static __attribute__ ((noreturn)) void allow(struct su_context *ctx) {
		.../解析参数
		populate_environment(ctx);
    	set_identity(ctx->to.uid);
    	...
    	execvp(binary, ctx->to.argv + argc);
    	...
	}
	
	void set_identity(unsigned int uid) {
		/*
		 * Set effective uid back to root, otherwise setres[ug]id will fail
		 * if uid isn't root.
		 */
		if (seteuid(0)) {
		    PLOGE("seteuid (root)");
		    exit(EXIT_FAILURE);
		}
		if (setresgid(uid, uid, uid)) {
		    PLOGE("setresgid (%u)", uid);
		    exit(EXIT_FAILURE);
		}
		if (setresuid(uid, uid, uid)) {
		    PLOGE("setresuid (%u)", uid);
		    exit(EXIT_FAILURE);
		}
	}
	```
	
* 最后看个例子，执行 adb shell 后进入普通用户权限的shell控制台，在里面执行 ```su root ./test.sh```，后进程的关系如下：

	```
	shell        27483     1 0 20:14:27 ?     00:00:00 adbd --root_seclabel=u:r:su:s0
	shell        30009 27483 0 20:40:37 pts/3 00:00:00 sh -
	root         30018 30009 0 20:40:49 136:3 00:00:00 su root ./test.sh
	root         30019 30018 0 20:40:49 136:3 00:00:00 su root ./test.sh
	root         30024     1 0 20:40:49 ?     00:00:00 su --daemon
	root         30032 30024 0 20:40:49 136:4 00:00:00 su --daemon
	root         30037 30032 0 20:40:49 136:4 00:00:00 sh ./test.sh
	```
	
	
### Apk 部分

* 在 ```android-x86``` 中， Settings(```packages/apps/Settings```) 通过引入 koush 这个第三方库来实现 su 权限的管理：

	Settings 的 Android.mk:
	
	```
	LOCAL_SRC_FILES := $(call all-java-files-under, src) \
    $(call all-java-files-under,../../../external/koush/Widgets/Widgets/src) \
    $(call all-java-files-under,../../../external/koush/Superuser/Superuser/src)
	```
	
* su daemon 在决定是否给客户端授权时有个查库过程，这个数据库正是 apk 管理的： ```/data/data/$pkg/databases/su.sqlite```：

	```
	policy_t database_check(struct su_context *ctx) {
		sqlite3 *db = NULL;
		    
		char query[512];
		snprintf(query, sizeof(query), "select policy, until, command from uid_policy where uid=%d", ctx->from.uid);
		int ret = sqlite3_open_v2(ctx->user.database_path, &db, SQLITE_OPEN_READONLY, NULL);
		...
		int result;
		char *err = NULL;
		struct callback_data_t data;
		data.ctx = ctx;
		data.policy = INTERACTIVE;
		ret = sqlite3_exec(db, query, database_callback, &data, &err);
		sqlite3_close(db);
		if (err != NULL) {
		    LOGE("sqlite3_exec: %s", err);
		    return DENY;
		}
			
		return data.policy;
	}
	```
	
* 从上面代码看出，当一个客户端请求 su 权限时，如果这个数据库文件不再，或者没有对应这个客户端的授权记录，默认为 ``` INTERACTIVE```，也就是会弹窗询问。 询问过程大致是：
	
	1. su daemone 创建一个 sever 端的 socket，通过 am 命令启动 ```com.koushikdutta.superuser.RequestActivity``` 并把socket 路径传递过去；
	2. ```RequestActivity``` 启动后，连上 daemon 的 socket，daemon 把 su 申请信息发送过去：
	
		```
		static int socket_send_request(int fd, const struct su_context *ctx) {
			...
			write_token(fd, "version", PROTO_VERSION);
			write_token(fd, "binary.version", VERSION_CODE);
			write_token(fd, "pid", ctx->from.pid);
			write_string_data(fd, "from.name", ctx->from.name);
			write_string_data(fd, "to.name", ctx->to.name);
			write_token(fd, "from.uid", ctx->from.uid);
			write_token(fd, "to.uid", ctx->to.uid);
			write_string_data(fd, "from.bin", ctx->from.bin);
			// TODO: Fix issue where not using -c does not result a in a command
			write_string_data(fd, "command", get_command(&ctx->to));
			write_token(fd, "eof", PROTO_VERSION);
			...
		}
		```
		
	3. ```RequestActivity``` 拿到这些数据后，根据这些信息决定是不是直接拒绝、授权或者弹窗让用户来决定。 最终判决下来后，把结果保存到刚才那个数据库中，并回复 daemon 判决结果：
	
		```
		void handleAction(boolean action, Integer until) {
			...
			try {
			    mSocket.getOutputStream().write((action ? "socket:ALLOW" : "socket:DENY").getBytes());
			}
			catch (Exception ex) {
			}
			try {
			    ...
			        UidPolicy policy = new UidPolicy();
			        policy.policy = action ? UidPolicy.ALLOW : UidPolicy.DENY;
			        policy.uid = mCallerUid;
			        policy.command = null;
			        policy.until = until;
			        policy.desiredUid = mDesiredUid;
			        SuDatabaseHelper.setPolicy(this, policy);
			    ...
			}
			catch (Exception ex) {
			}
			finish();
    	}
		```
	4. daemon 拿到判决结果后，根据结果执行 allow 或者 deny。 不论是 allow 或者 deny ，最终都会通知 apk 里面的 ```com.koushikdutta.superuser.SuReceiver```， apk 在这里可以弹一些对应的toast或者输出一些日志。

		```
		int send_result(struct su_context *ctx, policy_t policy) {
			...
			char *result_command[] = {
			    AM_PATH,
			    ACTION_RESULT,//SuReciver
			    "--ei",
			    "binary_version",
			    binary_version,
			    "--es",
			    "from_name",
			    ctx->from.name,
			    "--es",
			    "desired_name",
			    ctx->to.name,
			    "--ei",
			    "uid",
			    uid,
			    "--ei",
			    "desired_uid",
			    desired_uid,
			    "--es",
			    "command",
			    get_command(&ctx->to),
			    "--es",
			    "action",
			    policy == ALLOW ? "allow" : "deny",
			    user[0] ? "--user" : NULL,
			    user,
			    NULL
			};
			return silent_run(result_command);
		}
		```







