### Unity

* license


### unity\_builtin_extra

1. 里面带有unity 的版本信息；
2. 这里面大部分内容是加了密的 shader 脚本


### Mono 
	
是运行 C#、UnityScript 的虚拟机，执行方式是 JIT，而下面这个 il2cpp 是 AOT

### libil2cpp.so
	
```
	IL2CPP (Intermediate Language To C++) is a Unity-developed scripting backend
	 which you can use as an alternative to Mono when building projects for various platforms. When building a project using IL2CPP, Unity converts IL code from scripts
	 and assemblies to C++, before creating a native binary file (.exe, apk, .xap, for example) for your chosen platform. 
```
也就是把 C#, UnityScript 这些语言编译后生成的中间产物(Imediate Language）转成 c++ 语言。 转成 C++ 后就可以直接通过 C++ 的编译器编成机器语言了 libil2cpp.so。 
	


### assets\bin\Data\Managed\Metadata\global-metadata.dat

这个文件保存了 libil2cpp.so 中的所用到的字符串、类名、函数名称
