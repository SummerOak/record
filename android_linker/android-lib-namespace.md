

#### dlopen 的过程

dlopen 要完成的事情： 把so 装载到内存,bss 段内存分配，以及它的依赖， 重定向;

* do_dlopen 接收要装载库的信息： ```const char* name, int flags,
                const android_dlextinfo* extinfo,
                const void* caller_addr```;
* 通过调用者地址找到调用者的 soinfo 和调用者所在的 namespace， 要加载的so将和调用者的命名空间一致；
* 根据命名空间、调用者的soinfo和命名空间构建一个LoadTask，放到装载任务队列： load_tasks;
* 遍历 load_tasks ， 对于每个task：
	* 查询这个so是否已经装载过， 查询范围是： 当前namespace 和 当前namespace 链接的 namespace；
	* 如果 namespace 中还没有这个 so 的信息，会做2件事情（`load_library`所做的事情）：
		* 打开和解析so内部的 dynamic 段，解析它的依赖并加入 load_tasks 队列中；
		* 构建这个 so 对应的 soinfo ，并把它加入 ns ；
* 递归完所有的依赖后， 打乱装载的顺序;
* 调用 LoadTask 的 load 把so装载到内存：
	* 确定装载的内存位置和大小
	* 通过mmap64调用把每一段都加载到内存，其中也包括 bss 段的内存分配和初始化为0；
* soinfo#prelink_image 解析so中各个段的信息，比如。。。
* 


```
dlopen@libdl.c  
__loader_dlopen@libdl.c //链接时被替换为 __dlopen@dlfcn.cpp  
__dlopen@dlfcn.cpp  
dlopen_ext@dlfcn.cpp
do_dlopen@linker.cpp//根据调用者地址，找到它的so，以及它所在的namespace
	find_library@linker.cpp//返回 si
	find_libraries@linker.cpp
		find_library_internal
			load_library//读取解析(read)头和段信息，用这些信息构建 si
		task->load()
			elf_reader.Load//真正把 so 装载(mmap)到内存
				ReserveAddressSpace
				LoadSegments
				FindPhdr
		si->prelink_image
		linked_ns->add_soinfo(si)//命名空间相关处理
		find_libraries//递归调用，？？？
		si->link_image// 重定位
			relocate
	si->to_handle()
	si->call_constructors()//调用
```

```
load_library
	soinfo_alloc
		task->set_soinfo
		task->read//读取解析头和段信息
			elf_reader.Read
				ReadElfHeader
				VerifyElfHeader
				ReadProgramHeaders
				ReadSectionHeaders
				ReadDynamicSection
		si->set_dt_runpath//解析 dynamic 段，把依赖的库也添加进来
		si->set_soname
		for_each_dt_needed
		load_tasks->push_back

si->prelink_image

```

dlfcn.cpp 里面，函数映射： 


```
static const char ANDROID_LIBDL_STRTAB[] =
  // 0000000000111111 11112222222222333 333333344444444 44555555555566666 6666677777777778 8888888889999999999
  // 0123456789012345 67890123456789012 345678901234567 89012345678901234 5678901234567890 1234567890123456789
    "__loader_dlopen\0__loader_dlclose\0__loader_dlsym\0__loader_dlerror\0__loader_dladdr\0__loader_android_up"
  // 1*
  // 000000000011111111112 2222222223333333333444444444455555555 5566666666667777777777888 88888889999999999
  // 012345678901234567890 1234567890123456789012345678901234567 8901234567890123456789012 34567890123456789
    "date_LD_LIBRARY_PATH\0__loader_android_get_LD_LIBRARY_PATH\0__loader_dl_iterate_phdr\0__loader_android_"
  // 2*
  // 00000000001 1111111112222222222333333333344444444445555555555666 6666666777777777788888888889999999999
  // 01234567890 1234567890123456789012345678901234567890123456789012 3456789012345678901234567890123456789
    "dlopen_ext\0__loader_android_set_application_target_sdk_version\0__loader_android_get_application_targ"
  // 3*
  // 000000000011111 111112222222222333333333344444444445555555 5556666666666777777777788888888889 999999999
  // 012345678901234 567890123456789012345678901234567890123456 7890123456789012345678901234567890 123456789
    "et_sdk_version\0__loader_android_init_anonymous_namespace\0__loader_android_create_namespace\0__loader_"
  // 4*
  // 0000000 000111111111122222222223333 333333444444444455 555555556666666666777777777788888 888889999999999
  // 0123456 789012345678901234567890123 456789012345678901 234567890123456789012345678901234 567890123456789
    "dlvsym\0__loader_android_dlwarning\0__loader_cfi_fail\0__loader_android_link_namespaces\0__loader_androi"
  // 5*
  // 0000000000111111111122222 22222
  // 0123456789012345678901234 56789
    "d_get_exported_namespace\0"
#if defined(__arm__)
  // 525
    "__loader_dl_unwind_find_exidx\0"
#endif
    ;

static ElfW(Sym) g_libdl_symtab[] = {
  // Total length of libdl_info.strtab, including trailing 0.
  // This is actually the STH_UNDEF entry. Technically, it's
  // supposed to have st_name == 0, but instead, it points to an index
  // in the strtab with a \0 to make iterating through the symtab easier.
  ELFW(SYM_INITIALIZER)(sizeof(ANDROID_LIBDL_STRTAB) - 1, nullptr, 0),
  ELFW(SYM_INITIALIZER)(  0, &__dlopen, 1),
  ELFW(SYM_INITIALIZER)( 16, &__dlclose, 1),
  ELFW(SYM_INITIALIZER)( 33, &__dlsym, 1),
  ELFW(SYM_INITIALIZER)( 48, &__dlerror, 1),
  ELFW(SYM_INITIALIZER)( 65, &__dladdr, 1),
  ELFW(SYM_INITIALIZER)( 81, &__android_update_LD_LIBRARY_PATH, 1),
  ELFW(SYM_INITIALIZER)(121, &__android_get_LD_LIBRARY_PATH, 1),
  ELFW(SYM_INITIALIZER)(158, &dl_iterate_phdr, 1),
  ELFW(SYM_INITIALIZER)(183, &__android_dlopen_ext, 1),
  ELFW(SYM_INITIALIZER)(211, &__android_set_application_target_sdk_version, 1),
  ELFW(SYM_INITIALIZER)(263, &__android_get_application_target_sdk_version, 1),
  ELFW(SYM_INITIALIZER)(315, &__android_init_anonymous_namespace, 1),
  ELFW(SYM_INITIALIZER)(357, &__android_create_namespace, 1),
  ELFW(SYM_INITIALIZER)(391, &__dlvsym, 1),
  ELFW(SYM_INITIALIZER)(407, &__android_dlwarning, 1),
  ELFW(SYM_INITIALIZER)(434, &__cfi_fail, 1),
  ELFW(SYM_INITIALIZER)(452, &__android_link_namespaces, 1),
  ELFW(SYM_INITIALIZER)(485, &__android_get_exported_namespace, 1),
#if defined(__arm__)
  ELFW(SYM_INITIALIZER)(525, &__dl_unwind_find_exidx, 1),
#endif
};
```

#### Namespace

```
CreateJavaVM
	InitializeNativeLoader
		g_namespaces->Initialize
			dlopen(/system/etc/public.libraries.txt)
			system_llndk_libraries_ = ReadConfig(/system/etc/llndk.libraries.txt)
			system_vndksp_libraries_ = ReadConfig(/system/etc/vndksp.libraries.txt)
			vendor_public_libraries_ = ReadConfig(/vendor/etc/public.libraries.txt)
```


```
static LibraryNamespaces* g_namespaces = new LibraryNamespaces;

CreateClassLoaderNamespace/OpenNativeLibrary
	LibraryNamespaces::Create
		LibraryNamespaces::InitPublicNamespace
			__android_init_anonymous_namespace
				init_anonymous_namespace
					create_namespace
			NativeBridgeInitAnonymousNamespace
		android_create_namespace/NativeBridgeCreateNamespace
			__android_create_namespace
				create_namespace
		
```