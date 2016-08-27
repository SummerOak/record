#### IDA 动态调试 app

* 启动 android_server；

	```
	android_server -p23946
	```
	注意： -p选项后面没有空格

* 端口转发，这个端口是用来 ida 和 android server 之间发送调试指令的：

	```
	adb forward tcp:$host_port tcp:$device_port
	adb forward tcp:23946 tcp:23946
	```
	
	把host上端口的tcp包转发给手机设备里面的端口，这个端口也就是 android server 监听的端口。 这样ida上的调试指令就可以发给设备上的 android_server 执行。
	
	如果要在app启动时就开始调试，先以debug方式启动app， app以debug方式启动后，虚拟机会等待被调试，在这段时间里，就有足够的时间用 ida 去attach 这个进程， 打好断点后再让虚拟机恢复执行就可以了：

	```
	adb shell am start -D -n $pkg
	adb forward tcp:8700 jdwp:$pid
	
	ida 断好点之后，再恢复执行：
	jdb -connect com.sun.jdi.SocketAttach:hostname=localhost,port=$8700
	```
	
	有时会报错误，比如：
	
	```
	java.io.IOException: handshake failed - connection prematurally closed
	at com.sun.tools.jdi.SocketTransportService.handshake(SocketTransportService.java:136)
	at com.sun.tools.jdi.SocketTransportService.attach(SocketTransportService.java:232)
	at com.sun.tools.jdi.GenericAttachingConnector.attach(GenericAttachingConnector.java:116)
	at com.sun.tools.jdi.SocketAttachingConnector.attach(SocketAttachingConnector.java:90)
	at com.sun.tools.example.debug.tty.VMConnection.attachTarget(VMConnection.java:519)
	at com.sun.tools.example.debug.tty.VMConnection.open(VMConnection.java:328)
	at com.sun.tools.example.debug.tty.Env.init(Env.java:63)
	at com.sun.tools.example.debug.tty.TTY.main(TTY.java:1082)
	```
	可能是端口被 android_studio 占用了，关闭 as 试试。
	有时后会遇到异常，可以ignore 试试:
	```
	ignore uncaught java.lang.Throwable
	```
 
* 调试过程可以用 idc 脚本来实现各种复杂的操作，比如某个地方执行多少次之后断点：

		```
		extern bpcount;
		bpcount++;
		Message(form("%d. hit\n"), bpcount);
		return (bpcount>500);
		```	

#### gdb 动态调试 app

[参考](https://wladimir-tm4pda.github.io/porting/debugging_gdb.html)

整个调试过程涉及2个部分，一个是 `gdbserver`， 在设备端， 另外一个是 `gdb`, 在 pc 端。 运作模式是 `gdb`向 `gdbserver`发送调试指令，`gdbserver` 接收和处理调试指令；

* 把 ndk 的 `gdbserver` push 到手机端，如果设备里面已有自带的，可以忽略这步:

    ```
	/**如果设备没有自带 gdbserver ，从 Ndk 复制**/
	adb push $NDK/prebuilt/android-x86/gdbserver/gdbserver /system/bin/
	adb forward tcp:5039 tcp:7777
	```
* 在手机里面启动 `gdbserver` ，开始调试进程：

    ```
	gdbserver --attach :5039 $(pidof com.summer.arttester)
	```
	
	如果是自己写的一个 jar 那么：
	
	```
	export CLASSPATH=/system/framework/nbtest.jar
	gdbserver :5039 app_process32 -Xforce-nb-testing /system/bin com.summer.nbtest.Main
	```

* 在宿主这边启动 `gdb`， 然后连接到指定的进程：

    ```
	$NDK/prebuilt/darwin-x86_64/bin/gdb
	/***如果自己编的系统, 可以把带symbol的库载入，更方便调试***/
	prebuilt/darwin-x86_64/bin/gdb out/target/product/product-name/symbols/system/bin/app_process
	set solib-absolute-prefix /.../out/target/product/product-name/symbols
	set solib-search-path /.../out/target/product/product-name/symbols/system/lib
	
	
	target remote :7777
	```

###### x86 环境下 gdbserver 总是报错：`Unknown register zmm16h requested` 改用这个 [gdbserver](https://chromium.googlesource.com/android_tools/+/56b3d3e8ce785e468eac3262cd6b107ebe569e94/ndk/prebuilt/android-x86/gdbserver/gdbserver) 就可以了： 	
 	
#### gdb 调试命令

* 单步跳过执行 `si N` / `stepi N` 
* 单步执行 `ni N` / `nexti N`
* 设置断点 `break *0xE878626C`
* 查看内存 `x 0xE878626C`
* 查看寄存器， i r
* 
* dump 指定位置的内存：

	```
	(gdb) dump memory ~/Downloads/1.txt 0xe1a4e000 0xe1e67000
	```
* 监听内存, 比如监听内存地址为0xE878626C上的数据变化： `watch *0xE878626C`，等数据变化时， 通过 `x $eip ` 可以知道改变数据的那一条指令


在加载指定库时断点:

1. 通过 linker 定位到 do_dlopen 函数的位置`$linker_base + $do_dlopen_offset`(androidx86 上是80F0),假设是 0xED0810F0 

```
b *0xED0810F0 if $_streq((char*)(*(int*)($sp+4)), "/system/lib/libhoudini.so") == 1
```











