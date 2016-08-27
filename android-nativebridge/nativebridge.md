#### Question
2. oat 里面的jni调用是怎么实现的？

#### NativeBridge 

 要用到 `NativeBridge` 的进程分3类：
 
   * Zygote 进程 fork 出来的，也就是普通的app进程； 
   * 直接通过 `app_process` 启动的进程，比如 am/wm 这些可执行jar文件； 
   * arm架构的可执行二进制文件，比如通过`Process.exec` 或者native代码 fork 后 exec 可执行文件；

   前面2种最为常见，他们都基于ART虚拟机，houdini 也是在ART虚拟机启动时被加载/初始化。ART的启动入口有`app_process``dex2oat``patchoat`。启动场景有： 1）Zygote 进程启动； 2）通过 `app_process` 执行java代码，比如am/wm等。system_server 和 app 进程是共用 Zygote 的虚拟机的；

* 虚拟机启动时， `AndroidRuntime` 获取系统属性 `ro.dalvik.vm.native.bridge` 的值，也就是`/system/lib/libnb.so`(代码在 `device/generic/common/nativebridge/src/libnb.cpp`)，通过 `NativeBridge` 这个art启动参数传给将启动的art， art虚拟机调用 LoadNativeBridge（最终是`dlopen`） 加载它，然后 `dlsym` 获取 它导出的 `NativeBridgeItf` 接口；libnb.so 这个库只是做了层封装，它 `dlopen /system/lib/libhoudini.so` 后获取里面的 `NativeBridgeItf` 接口，所有来自 art 的调用直接转接给 houdini ；整个调用过程如下：
	
	```
	AndroidRuntime::startVm //frameworks/base/core/jni/AndroidRuntime.cpp
		JNI_CreateJavaVM // art/runtime/java_vm_ext.cc
			Runtime::Create(options, ignore_unrecognized)
				Runtime::Init
					LoadNativeBridge//加载 libnb.so, art/runtime/native_bridge_art_interface.cc
						LoadNativeBridge//system/core/libnativebridge/native_bridge.cc
							dlopen
							dlsym
							isCompatibleWith// 这里会触发 libnb.so 去加载 libhoudini.so 
				Runtime::Start
	```
	
* 等 `Runtime:Init` 完成后，libnb.so 已经加载好，但在使用前要调用`NativeBridgeCallbacks::initialize` 初始化。初始化时机和虚拟机的启动场景有关： 
	* 如果是Zygote 启动的虚拟机，在虚拟机启动时不需要初始化houdini，因为 zygote 进程里面的库本来就是 x86 的；而它的子进程才可能需要用到houdini。所以houdini 初始化在子进程里面做：

	 ```
	Zygote#forkAndSpecialize
		Zygote#nativeForkAndSpecialize
			ForkAndSpecializeCommon//com_android_internal_os_Zygote.cpp
				PreInitializeNativeBridge
				Zygote#callPostForkChildHooks
					ZygoteHooks#postForkChild
						ZygoteHooks#nativePostForkChild
							Runtime::InitNonZygoteOrPostFork//system_server 不需要初始化
	```

	* 对于`app_process`执行java代码的场景，默认是不启用 nativebridge 的，一般能够通过 app_process 启动的代码，都是系统或者厂家的。 但也可以通过`-Xforce-nb-testing` 强制开启，开启后 Runtime::Start 时初始化houdini：
	
		```
		Runtime::Start
			PreInitializeNativeBridge("."); //这里面只mount 了 cpuinfo ，而且只在 app 进程做；
			InitNonZygoteOrPostFork
				InitializeNativeBridge//art/runtime/native_bridge_art_interface.cc
					android::InitializeNativeBridge
						callbacks->initialize(...)
				AddSpecialSignalHandlerFn //给houdini 注册信号处理器
	```
	
#### houdini 

houdini 是intel 开发的一款转码器，总体转码思路是解析arm指令，通过模拟来转码，所以当程序崩溃时，堆栈只有houdini，看不到app的堆栈。	
	
* 整个功能打包成一个文件： houdini.sys。 下载后mount到 `/system/lib/arm` 目录下面;
* mount 成功后 `/system/lib/arm` 下面包含：
	* 157 个库文件
	* 1 houdini 的可执行文件
	* 1 个 nb 文件夹， nb文件夹包含 40 个so；
	
	也就是有些so，比如 libc.so 存在3个版本：  
	
	* `/system/lib` 
	* `/system/lib/arm` 
	* `/system/lib/arm/nb`   

   根据赵牛分析，houdini 里面的 so 是给游戏打开的，如果游戏调用 dlopen ，那其实打开的是 houdini 的 arm 库，随后的 dlsym 返回的也是这些库被装载到内存后的地址。
