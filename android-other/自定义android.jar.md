## 自定义android.jar

* 编译android 源码 aosp 或者 android-x86;
* 提取 out/target/common/obj/JAVA_LIBRARIES/framework_intermediates/classes.jar;
* 解压原 ${androidsdk}/platforms/android-${ver}/android.jar;
* 解压 classes.jar， 把需要访问的那些类替换到 android.jar 里面；
* 重新压缩android.jar；注意这里不能用tar命令，需要用zip;


参考 <br>
http://mshockwave.blogspot.com/2015/01/how-to-use-android-internal-apis.html