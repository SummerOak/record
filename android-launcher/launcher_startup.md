android 桌面启动逻辑整理

#### 系统启动

* 系统首次启动的场景下，有挺多事情要做的，这些事情分散在多个 Activity 组件里面执行，这些组件都注册了响应HOME的事件。各个组件完成自己的事情后，把自己这个组件设为 disable，退出。每个组件退出后， AMS 通过 `startHomeActivityLocked` 寻找下一个接受 HOME 事件的Activity， 执行下一个开机流程。第一次触发 `startHomeActivityLocked`时机是这里:

 ```
	at com.android.server.am.ActivityManagerService.startHomeActivityLocked(ActivityManagerService.java:4083)
	at com.android.server.am.ActivityManagerService.systemReady(ActivityManagerService.java:14318)
	at com.android.server.SystemServer.startOtherServices(SystemServer.java:1678)
	```
	
	会命中2个组件：
	
	```
	com.android.settings/.CryptKeeper p=10
	com.android.settings/.FallbackHome p=-1000
	```
	
	这里启动 CryptKeeper, 等它退出后再启动 com.android.settings/.FallbackHome：

	```
	at com.android.server.am.ActivityManagerService.startHomeActivityLocked(ActivityManagerService.java:4083)
	at com.android.server.am.ActivityStackSupervisor.resumeHomeStackTask(ActivityStackSupervisor.java:772)
	at com.android.server.am.ActivityStack.resumeTopActivityInNextFocusableStack(ActivityStack.java:2754)
	at com.android.server.am.ActivityStack.resumeTopActivityInnerLocked(ActivityStack.java:2315)
	at com.android.server.am.ActivityStack.resumeTopActivityUncheckedLocked(ActivityStack.java:2257)
	at com.android.server.am.ActivityStackSupervisor.resumeFocusedStackTopActivityLocked(ActivityStackSupervisor.java:2098)
	at com.android.server.am.ActivityStackSupervisor.resumeFocusedStackTopActivityLocked(ActivityStackSupervisor.java:2082)
	at com.android.server.am.ActivityStack.finishCurrentActivityLocked(ActivityStack.java:3905)
	at com.android.server.am.ActivityStack.completePauseLocked(ActivityStack.java:1447)
	at com.android.server.am.ActivityStack.activityPausedLocked(ActivityStack.java:1415)
	at com.android.server.am.ActivityManagerService.activityPaused(ActivityManagerService.java:7470)
	```
* com.android.settings/.FallbackHome
	
	它应该是除了首次开启外，整个系统第一个被启动的Activity， 定义在 Settings apk里面，界面是 “Android is starting”、下面一个进度条。它启动后会判断是否存在其他的桌面组件，如果存在，自己就退让给它。如果没有，就会一直等待，直到有人接管桌面。在 aosp8.1 中接下来接管桌面的是：
	
* org.zeroxlab.util.tscal/.TSCalibrationStartup 
 
  它的功能是校准屏幕，把校准结果存放到： /data/misc/tscal/pointercal。这个流程结束后，通过 `PMS#setComponentEnabledSetting` 把自身 disable 并杀掉，PMS会把这个事件通过广播发送给 AMS。接着查找下一个开机流程：

* com.android.provision/.DefaultActivity
	
	这个 Activity 很简单， 只做了2件事情，就退出了：
	
	```
	Settings.Global.putInt(getContentResolver(), Settings.Global.DEVICE_PROVISIONED, 1);
	Settings.Secure.putInt(getContentResolver(), Settings.Secure.USER_SETUP_COMPLETE, 1);
	```
	没有处理流程后，真正的桌面就起来了。首次开机启动的整个流程是比较复杂的，它经过了4个Activity的跳转：
	
	```
	com.android.settings/.CryptKeeper
	com.android.settings/.FallbackHome
	org.zeroxlab.util.tscal/.TSCalibrationStartup
	com.android.provision/.DefaultActivity
	```

* 非首次启动的场景下， 第一次 `startHomeActivityLocked` 会命中 FallbackHome，它退出后直接启动真正的桌面。


##### directBootAware

 从 Android 7开始，引入 `android:directBootAware` 参数，这个参数标识改组件是否能够再用户未解锁的情况下被启动。如果桌面组件没有声明这个参数，在第一次 startHomeActivityLocked 时 resolveIntent 会被过滤。具体逻辑是，在 `PMS#updateFlagsForResolve` 中，会根据用户是否解锁来添加 PackageManager.MATCH_DIRECT_BOOT_AWARE 或者 PackageManager.MATCH_DIRECT_BOOT_UNAWARE 的过滤条件。 如果用户未解锁，那只有声明了 `android:directBootAware="true"` 的组件才能够使用。没有声明的或者声明为 false 的都会别过滤掉。 过滤的地方在PMS 的内部类对象 mActivityes 里面（和 mActivityes 并肩的有 mReceivers/mServicesm/Providers 分别负责查询 intent 对应的四大组件，他们的父类都是IntentResolver。） mActivities 在生成返回结果时，有这么个判断：

```
PMS#mActivities:
@Override
protected ResolveInfo newResult(PackageParser.ActivityIntentInfo info,
        int match, int userId) {
	if (!mSettings.isEnabledAndMatchLPr(info.activity.info, mFlags, userId)) {
		return null;
	}
}
	
PackageUserState.java
public boolean isMatch(ComponentInfo componentInfo, int flags) {
	final boolean matchesUnaware = ((flags & MATCH_DIRECT_BOOT_UNAWARE) != 0)
	        && !componentInfo.directBootAware;
	final boolean matchesAware = ((flags & MATCH_DIRECT_BOOT_AWARE) != 0)
	        && componentInfo.directBootAware;
	return matchesUnaware || matchesAware;
}
```

#### 按home键

 当用户按下home键时，执行逻辑如下：
 
 ```
at com.android.server.policy.PhoneWindowManager.startActivityAsUser(PhoneWindowManager.java:4084)
at com.android.server.policy.PhoneWindowManager.startDockOrHome(PhoneWindowManager.java:7732)
at com.android.server.policy.PhoneWindowManager.launchHomeFromHotKey(PhoneWindowManager.java:4208)
at com.android.server.policy.PhoneWindowManager.launchHomeFromHotKey(PhoneWindowManager.java:4160)
at com.android.server.policy.PhoneWindowManager.handleShortPressOnHome(PhoneWindowManager.java:1739)
at com.android.server.policy.PhoneWindowManager.interceptKeyBeforeDispatching(PhoneWindowManager.java:3439)
at com.android.server.wm.InputMonitor.interceptKeyBeforeDispatching(InputMonitor.java:466)
at com.android.server.input.InputManagerService.interceptKeyBeforeDispatching(InputManagerService.java:2002)
 ```

#### 遗留问题：
* 每个开机流程的Activity 是怎么保证依次启动的？
* FallbackHome 没有声明 'android:directBootAware' 但能够被 resoleIntent命中，为什么？//TODO
* 为了默认只启用某个包名的桌面，指定了intent 的包名， 当指定包名后桌面却起不来了！因为指定包名后 FallbackHome 不再被选中，而真正的桌面又没有声明 directBootAware 所以系统就无法启动了（卡在哪了？//TODO）。

* 为了加快桌面的启动，把在桌面组件增加了 'android:directBootAware'， 但因为真正桌面启动后， 首次启动场景下要做的事情被跳过了，导致一些设置没有完成。比如： user_setup_complete 没有被正确赋值，导致HOME键桌面返回不了。

* com.android.internal.app.ResolverActivity


 
 
 