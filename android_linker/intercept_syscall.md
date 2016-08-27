[preload](https://serializethoughts.com/2017/04/01/working-of-ld_preload-for-android-applications-and-its-anti-re-technique)

### `--invoke-with`

在向 zygote 发送fork app应用进程时，可以在请求参数中增加 `--invoke-with` 选项。 加了这个选项后， zygote fork 进程会通过 `/system/bin/sh` 来执行 `app_process`， `--invoke-with` 携带的参数会透传到 shell 里面：

```
frameworks/base/core/java/com/android/internal/os/WrapperInit.java
public static void execApplication(String invokeWith, String niceName,
	int targetSdkVersion, String instructionSet, FileDescriptor pipeFd,
	String[] args) {
	StringBuilder command = new StringBuilder(invokeWith);
	
	final String appProcess;
	if (VMRuntime.is64BitInstructionSet(instructionSet)) {
		appProcess = "/system/bin/app_process64";
	} else {
		appProcess = "/system/bin/app_process32";
	}
	command.append(' ');
	command.append(appProcess);
	...
	Zygote.appendQuotedShellArgs(command, args);
	preserveCapabilities();
	Zygote.execShell(command.toString());
}

frameworks/base/core/java/com/android/internal/os/Zygote.java
public static void execShell(String command) {
	String[] args = { "/system/bin/sh", "-c", command };
	...
	Os.execv(args[0], args);
	...
}
```

一般情况下 AMS 在请求 Zygote 启动App进程时，不会带这个选项。但zygote 还提供了另外一个方式：通过设置`wrap.$pkg` 这样的系统属性，zygote 检测到有这种系统属性时，会自动把属性的值当做 `--invoke-with` 的调用：

```
frameworks/base/core/java/com/android/internal/os/ZygoteConnection.java
public static void applyInvokeWithSystemProperty(Arguments args) {
    if (args.invokeWith == null && args.niceName != null) {
        String property = "wrap." + args.niceName;
        args.invokeWith = SystemProperties.get(property);
        if (args.invokeWith != null && args.invokeWith.length() == 0) {
            args.invokeWith = null;
        }
    }
}
```

比如：

`setprop wrap.com.foo.bar LD_PRELOAD=/data/local/tmp/libpreload.so`

### hook 所有app系统库调用

修改 `init.zygote64_32.rc` , 启动 zygote 时增加环境变量 `setenv LD_PRELOAD /system/lib64/libmylibc.so`。 

问题：

* 32位的app启动后会执行 exec shell 脚本，而shell 脚本是 64 位的， 这个时候 LD_PRELOAD 这个环境变量带过去后会导致 shell 执行失败。
* 如果hook `malloc` ，zygote 启动会报错： 
 
 ```
 LOG(ERROR) << "Unsupported AF_UNIX socket (fd=" << fd << ") with empty path.";
 ...
 frameworks/base/core/jni/com_android_internal_os_Zygote.cpp:529: Unable to construct file descriptor table.
 ```