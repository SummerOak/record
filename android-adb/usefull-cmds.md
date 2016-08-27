+ 开启UI布局边界
	```
	setprop debug.layout true && service check SurfaceFlinger
	```
+ 允许app模拟定位
	```
	appops set com.example.my.package android:mock_location allow
	```
+ 签名
	
	```
	jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 
	-keystore ~/Workspace/keystore/wangyihuyu-AOSP.KEYSTORE 
	-signedjar ns.apk s.apk wangyihuyu-system-key
	```