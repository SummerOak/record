#### 手动编译

Android.mk 指定产物位置：

```
NDK_APP_DST_DIR := ../../../libs/$(TARGET_ARCH_ABI)
```

build.gradle指定 so 的位置以及abi，打包的时候才能到打进去

```
android {
	...
	sourceSets {
	    main {
	        jniLibs.srcDirs = ['libs']
	    }
	}
	
	defaultConfig {
        ndk {
            abiFilters 'armeabi-v7a'
        }
    }
	...
}
```

#### ndkBuild 

build.gradle

```
android {
    externalNativeBuild {
        ndkBuild{
            path "src/main/jni/Android.mk"
        }
    }
}
```

#### CMake