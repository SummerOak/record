#### 线程和进程

JNIEnv 为什么不能多个线程共享？

#### apk 安装时 dex2oat

* 安装流程

  ```
	PMS#installPackageLI
	PackageDexOptimizer#performDexOpt
	PackageDexOptimizer#performDexOptLI
	PackageDexOptimizer#dexOptPath
		Installer#dexopt
			InstalldNativeService::dexopt
				fork
				run_dex2oat
				execv("/system/bin/dex2oat")
	```
	
* dex2oat 的执行流程  
	
	```
	main//dex2oat.cc
		Dex2oat
			dex2oat::Setup
				dex2oat::PrepareRuntimeOptions
				dex2oat::CreateRuntime
	```
	
	安装过程中会执行 `dex2oat` ，但编译的选项`compile-filter`是 `quicken`， 所以生成的 oat 文件并没有本地机器指令。可以通过改变系统属性`pm.dexopt.install` 来控制编译选项，比如改成 `speed` 就可以编译生成本地机器指令。
* 根据安装时指定的abi，dex2oat 时会生成对应abi的oat。 通过系统属性 `ro.dalvik.vm.isa.*` 可以改变/映射到别的abi，比如 android-x86 上面通过这2个属性，在生成 oat 时直接指定了 x86/x86_64 的abi：

  ```
	[ro.dalvik.vm.isa.arm]: [x86]
	[ro.dalvik.vm.isa.arm64]: [x86_64]
  ```

#### Android 进程生命周期

Android 进程是承载于art虚拟机的，所以虚拟机的生命周期就是整个 android 进程的生命周期。  

```
app_process
AndroidRuntime::start
	AndroidRuntime::startVm// JNIEnv,JavaVM
		JNI_CreateJavaVM//art/runtime/java_vm_ext.cc
			Runtime::Create
				Runtime::Init
					new gc::Heap(...)
						space::ImageSpace::LoadBootImage
							ImageSpace::CreateBootImage
					JavaVMExt::Create
					Thread::Attach("main"...)// Thread 里面包含很多信息，比如各种函数跳转表
					class_linker_ = new ClassLinker(intern_table_)
					class_linker_->InitFromBootImage
					LoadNativeBridge//这个用来本地指令转译
				Runtime::Start
	env->FindClass(...)
	env->GetStaticMethodID("main");
	env->CallStaticVoidMethod(...)//大部分时间在这里执行
	mJavaVM->DetachCurrentThread()
	mJavaVM->DestroyJavaVM()
```

#### 虚拟机堆

一个运行环境，必然包含一些基础库，比如像 `libc.so` 这样的库，它在可执行程序装载前就需要被 linker 装载好。 对于art虚拟机来说，`boot.art` 就是这样的基础库，不一样的是它包含 java 和 framework 的代码打包出来的，给app调用的一个基础库。`boot.art` 这个库在 art 初始化时，由 `Heap` 来装载。另外 Heap 还负责垃圾回收。

基础镜像的装载调用逻辑：  

```
Heap::Heap
	ImageSpace::LoadBootImage//加载 boot.art 文件
		ImageSpace::CreateBootImage
			ImageSpaceLoader::Load
				ImageSpaceLoader::Init// 解析 boot.art 头部
					LoadImageFile//压缩格式处理
						MemMap::MapFileAtAddress
							MemMap::MapInternal
							mmap
							return new MemMap(...)
```

* framework 的代码最终会编译成

#### C/C++ 调用 Java
 
 ```
 CallStaticVoidMethod@art/runtime/check_jni.cc
 	CallStaticVoidMethod@art/runtime/jni_internal.cc
 		InvokeWithVarArgs@art/runtime/reflection.cc
 			ArtMethod* method = jni::DecodeArtMethod(mid);
 			InvokeWithArgArray(method)
 				method->Invoke
 					ArtMethod::art_quick_invoke_stub@art/runtime/art_method.cc
 						art_quick_invoke_stub //这个方法和cpu架构相关，各个cpu架构不一样

 ```
 
比如 arm32 下：

```
 quick_invoke_reg_setup@art/runtime/arch/arm/quick_entrypoints_cc_arm.cc
```
 
 
 
 
 
 
 
 
