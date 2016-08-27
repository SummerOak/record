容器内加载某些网页，比如 'game.163.com' 时，它会把横屏判断为竖屏，竖屏判断为横屏。看页面代码是通过 window.orientation 这个变量来判断的：

```
if (90 == window.orientation || -90 == window.orientation){
    $("#forhorview").css("display", "-webkit-box")
} else {
    $("#forhorview").css("display", "none")
}
```
	
为什么容器内，webview 加载网页中 window.orientation 这个值会反了呢？ 原因是这样：
根据android规则：

* 宽大于高，自然态是 landscape， portrait 对应的 rotation 是 90/270；
* 宽小于高，自然态是 portrait ，landscape 对应的 rotation 是 90/270；

容器的显示设备宽高是 1280x720，宽大于高，因此自然态是横屏，旋转90/270°之后才是竖屏，而真机和pad的屏幕都是宽小于高，虽然pad看起来自然态是横屏，实际上却不是，因为它的宽大于高（通过 wm size 可以查看）


解决这个问题，有几个想法：

* 修改设备的宽高比，和真机保持一致；
* 修改 webview 组件；
* 加载页面时注入 js 强改 window.orientation;
	
	
下面是3种方法尝试的过程：

#### 修改设备宽高比

容器默认 Display 信息是初始化过程是这样：

```	
	SurfaceFlinger::init
		new HWComposer()
			loadFbHalModule
				framebuffer_open(module, &mFbDev) //这里初始化了 mFbDev
```
初始化 mFbDev 之后，把宽高信息保存下来：

```
DisplayData& disp(mDisplayData[HWC_DISPLAY_PRIMARY]);
disp.connected = true;
disp.format = mFbDev->format;
DisplayConfig config = DisplayConfig();
config.width = mFbDev->width; //可以在这里改。 但改完之后推流也得跟着改，代价比较大。
config.height = mFbDev->height;
config.xdpi = mFbDev->xdpi;
config.ydpi = mFbDev->ydpi;
config.refresh = nsecs_t(1e9 / mFbDev->fps);
disp.configs.push_back(config);
```

这里保存好显示设备信息后，PhoneWindowManager 在初始化屏幕方向信息时会根据宽高比来设定自然态：

```
@Override
public void setInitialDisplaySize(Display display, int width, int height, int density) {
    ...
    if (width > height) {
        shortSize = height;
        longSize = width;
        mLandscapeRotation = Surface.ROTATION_0; // 横屏设为自然态
        mSeascapeRotation = Surface.ROTATION_180;
        ...
    } else {
        shortSize = width;
        longSize = height;
        mPortraitRotation = Surface.ROTATION_0; // 竖屏设为自然态
        mUpsideDownRotation = Surface.ROTATION_180;
	     ...
    }
    ...
}
```

#### 修改 webview 组件

* 首先我们知道用 android.view.WebView 这控件加载网页的时候，最终是用 /system/app/webview/webview.apk 这个组件来加载网页的，WebView的loadUrl调用的是 mProvider.loadUrl ，这个 mProvider 是个 `WebViewFactoryProvider` 接口，它的实现在 /system/app/webview/webview.apk 里面， 应用进程通过动态加载这个apk的代码来使用webview的功能：
```
mProvider=WebViewFactory.getProvider().createWebView(this, new PrivateAccess())
```	


* 查看当前webview 版本

	```
	$ dumpsys webviewupdate
	Current WebView Update Service state
	Fallback logic enabled: true
	Multiprocess enabled: true
	Current WebView package (name, version): (com.android.webview, 61.0.3163.98)
	Minimum WebView version code: 316409860
	Number of relros started: 2
	Number of relros finished: 2
	WebView package dirty: false
	Any WebView package installed: true
	Preferred WebView package (name, version): (com.android.webview, 61.0.3163.98)
	WebView packages:
	Valid package com.android.webview (versionName: 61.0.3163.98, versionCode: 316409860, targetSdkVersion: 27) is  installed/enabled for all users
	```

* 编译webview

 1. 首先选择要编译的版本：参考[这里](https://chromiumdash.appspot.com/releases?platform=Android)
 2. 然后拉取对应版本的代码： 参考[这里](https://www.chromium.org/developers/how-tos/get-the-code/working-with-release-branches)
 3. 最后编译，并集成到aosp： 参考 [webview 编译](https://www.chromium.org/developers/how-tos/build-instructions-android-webview) 和
[webview 集成到aosp](https://chromium.googlesource.com/chromium/src/+/HEAD/android_webview/docs/aosp-system-integration.md)

    
编译参数存放到 `out/$brand/args.gn`

```
target_os="android"
is_debug=false
is_official_build=true
is_chrome_branded=false
use_official_google_api_keys=false
exclude_unwind_tables=true
enable_resource_whitelist_generation=true
ffmpeg_branding="Chrome"
proprietary_codecs=true
enable_remoting=true
is_component_build=false
android_channel="stable"
system_webview_package_name="com.android.webview"
```

默认选项 `is_component_build = true` 会把 so 分库到各个文件，如果要合到一个 libwebviewchromium.so 把这个值改成 `is_component_build = false`;


* 整个 webview 组件的代码很复杂，从正面去分析很花时间。 因为它要获取当前屏幕的方向，必然会通过 Display 的getRotation来获取，所以在这里把调用堆栈打一下，就能大概知道它的调用关系，整个调用堆栈如下：

```
at android.view.Display.getRotation(Display.java:728)
	at org.chromium.ui.display.PhysicalDisplayAndroid.updateFromDisplay(PhysicalDisplayAndroid.java:45)
	at org.chromium.ui.display.DisplayAndroidManager.addDisplay(DisplayAndroidManager.java:40)
	at org.chromium.ui.display.DisplayAndroidManager.getInstance(DisplayAndroidManager.java:19)
	at org.chromium.ui.display.DisplayAndroidManager.onNativeSideCreated(DisplayAndroidManager.java:27)
	at org.chromium.content.browser.BrowserStartupController.nativeFlushStartupTasks(Native Method)
	at org.chromium.content.browser.BrowserStartupController.flushStartupTasks(
	at org.chromium.android_webview.AwBrowserProcess$1.run(AwBrowserProcess.java:59)
	at org.chromium.base.ThreadUtils.runOnUiThreadBlocking(ThreadUtils.java:10)
	at com.android.webview.chromium.WebViewChromiumFactoryProvider.startChromiumLocked(
	at com.android.webview.chromium.WebViewChromiumFactoryProviderForO.startChromiumLocked(
	at com.android.webview.chromium.WebViewChromiumFactoryProvider.ensureChromiumStartedLocked(
	at com.android.webview.chromium.WebViewChromiumFactoryProvider.startYourEngines(
	at com.android.webview.chromium.WebViewChromium.init(WebViewChromium.java:30)
	at android.webkit.WebView.<init>(WebView.java:659)
	at android.webkit.WebView.<init>(WebView.java:589)
	at android.webkit.WebView.<init>(WebView.java:572)
	at android.webkit.WebView.<init>(WebView.java:559)
	at android.webkit.WebView.<init>(WebView.java:549)
	at com.netease.test.MainActivity.initWebView(MainActivity.java:80)
	at com.netease.test.MainActivity.onCreate(MainActivity.java:35)
	at android.app.Activity.performCreate(Activity.java:7019)
	at android.app.Activity.performCreate(Activity.java:7010)
	at android.app.Instrumentation.callActivityOnCreate(Instrumentation.java:1214)
	at android.app.ActivityThread.performLaunchActivity(ActivityThread.java:2731)
	at android.app.ActivityThread.handleLaunchActivity(ActivityThread.java:2856)
	at android.app.ActivityThread.-wrap11(Unknown Source:0)
	at android.app.ActivityThread$H.handleMessage(ActivityThread.java:1589)
	at android.os.Handler.dispatchMessage(Handler.java:106)
	at android.os.Looper.loop(Looper.java:164)
	at android.app.ActivityThread.main(ActivityThread.java:6494)
	at java.lang.reflect.Method.invoke(Native Method)
	at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:463)
	at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:807)
```

经过粗略分析，这个方法是我们的修改目标： `WebContentsImpl#onRotationChanged` 编译一下 webview 组件太耗时了，没有进一步尝试。


#### js 注入强改属性

代码如下，改变 window.orientation 后要补发一次事件，让网页把UI调整为新的属性值：

```
mWebView.loadUrl("javascript:(function() {" +
                    "Object.defineProperty(window, 'orientation', {value: 0, writable:false}); " +
                    "window.dispatchEvent(new Event('orientationchange'));" +
                    "})()");
```