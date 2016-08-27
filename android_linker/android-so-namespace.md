
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

