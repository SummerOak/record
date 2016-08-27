## Android 逆向记录
             

#### 反编译APK

		java -jar apktool.jar d tartget.apk -o out
 
#### Smali 插桩
	
为了确定 smali 执行路径，一般会插入 log 来验证， 注意使用的本地变量不要影响正常的程序逻辑:

		const-string/jumbo v5, "SummerDbg"
		const-string/jumbo v6, "arriving here."
		invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I


```
new-instance v0, Ljava/lang/Throwable;
    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;
    move-result-object v1
    const-string/jumbo v0, "SummerDbg"
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    move-result v0
```


```
new-instance v2, Ljava/lang/StringBuilder;
invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

const-string v3, "append "
invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

move-result-object v2
invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
move-result-object v0
```

#### 二次打包

	java -jar apktool.jar b out -f -o target_unsigned.apk
	jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore m.keystore -signedjar target_unsigned.apk target_signed.apk alias1

#### 替换安装

* 取消安装时签名校验，修改代码： services/core/java/com/android/server/pm/PackageManagerService.java
    
		static int compareSignatures(Signature[] s1, Signature[] s2){
			return PackageManager.SIGNATURE_MATCH;
		}
		
		private void verifySignaturesLP(PackageSetting pkgSetting, PackageParser.Package pkg)
            throws PackageManagerException {
            return;
  		}
    

* 为避免目标应用安全性校验，安装的时候还是安装原包，然后修改应用启动时包加载路径，优先加载二次包，修改代码： frameworks/base/core/java/android/app/LoadedApk.java
		
		
		public ClassLoader getClassLoader() {
			...
			if(new File(mAppDir+".hack").exists()){
	        	zipPaths.add(mAppDir+".hack");
			}else{
				zipPaths.add(mAppDir);
			}
			...
		}
	

* 为避免重新打包镜像， 我们只替换framework：
	
		adb push ~/android-x86/out/target/product/x86_64/system/framework /system/framework
		adb push ~/android-x86/out/target/product/x86_64/system/priv-app /system/priv-app
		adb push ~/android-x86/out/target/product/x86_64/system/app /system/app


#### 跟踪Native方法

这部分内容较多，目前本人经验也不多，先记下大概知识点，后续补充。

* IDA 动态调试 android ： 参考：https://finn.svbtle.com/remotely-debugging-android-binaries-in-ida-pro
* arm 调用惯例
* x86 调用惯例
* 从java 到 Native
* 从 Native 回到 java

	
