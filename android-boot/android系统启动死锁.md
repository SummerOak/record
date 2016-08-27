#### android系统启动死锁


去掉KeyGuard 后，android系统启动有几率发生死锁，堆栈如下，2个线程互相持有对方的锁：

* 线程1：

```
"main" prio=5 tid=1 Blocked
  | group="main" sCount=1 dsCount=0 flags=1 obj=0x73c935f0 self=0x7ea98ccbea00
  | sysTid=138 nice=-4 cgrp=docker/108bf48db0b13d26585e17591d5a024a3481770289f1ef4752b4f6d9ab7b5612 sched=0/0 handle=0
  | state=S schedstat=( 7978838118 2007142088 2900 ) utm=72 stm=724 core=2 HZ=100
  | stack=0x7ffcfe7ea000-0x7ffcfe7ec000 stackSize=8MB
  | held mutexes=
  at com.android.server.policy.PhoneWindowManager.isScreenOn(PhoneWindowManager.java:6925)
  - waiting to lock <0x004bbcaf> (a java.lang.Object) held by thread 21
  at com.android.server.wm.WindowManagerService.startFreezingDisplayLocked(WindowManagerService.java:6062)
  at com.android.server.wm.WindowManagerService.reconfigureDisplayLocked(WindowManagerService.java:5744)
  at com.android.server.wm.DisplayContent.onConfigurationChanged(DisplayContent.java:1479)
  at com.android.server.wm.WindowContainer.onConfigurationChanged(WindowContainer.java:302)
  at com.android.server.wm.RootWindowContainer.onConfigurationChanged(RootWindowContainer.java:387)
  at com.android.server.wm.RootWindowContainer.setGlobalConfigurationIfNeeded(RootWindowContainer.java:380)
  at com.android.server.wm.RootWindowContainer.setDisplayOverrideConfigurationIfNeeded(RootWindowContainer.java:369)
  at com.android.server.wm.WindowManagerService.setNewDisplayOverrideConfiguration(WindowManagerService.java:2637)
  - locked <0x0216d8bc> (a com.android.server.wm.WindowHashMap)
  at com.android.server.am.ActivityManagerService.performDisplayOverrideConfigUpdate(ActivityManagerService.java:20632
  at com.android.server.am.ActivityManagerService.updateGlobalConfiguration(ActivityManagerService.java:20516)
  at com.android.server.am.ActivityManagerService.updateConfigurationLocked(ActivityManagerService.java:20394)
  at com.android.server.am.ActivityManagerService.updateConfigurationLocked(ActivityManagerService.java:20369)
  at com.android.server.am.ActivityManagerService.updateConfigurationLocked(ActivityManagerService.java:20360)
  at com.android.server.am.ActivityManagerService.updateConfigurationLocked(ActivityManagerService.java:20354)
  at com.android.server.am.ActivityManagerService.retrieveSettings(ActivityManagerService.java:14152)
  - locked <0x072bc045> (a com.android.server.am.ActivityManagerService)
  at com.android.server.am.ActivityManagerService.systemReady(ActivityManagerService.java:14276)
  at com.android.server.SystemServer.startOtherServices(SystemServer.java:1678)
  at com.android.server.SystemServer.run(SystemServer.java:393)
  at com.android.server.SystemServer.main(SystemServer.java:269)
  at java.lang.reflect.Method.invoke(Native method)
  at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:463)
  at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:787)
```

* 线程2：

```
"PowerManagerService" prio=5 tid=21 Blocked
  | group="main" sCount=1 dsCount=0 flags=1 obj=0x12f010c8 self=0x7ea972a7e200
  | sysTid=266 nice=-4 cgrp=docker/108bf48db0b13d26585e17591d5a024a3481770289f1ef4752b4f6d9ab7b5612 sched=0/0 handle=0
  | state=S schedstat=( 17470812 24630178 11 ) utm=0 stm=1 core=0 HZ=100
  | stack=0x7ea9724e9000-0x7ea9724eb000 stackSize=1037KB
  | held mutexes=
  at com.android.server.wm.WindowManagerService$LocalService.waitForAllWindowsDrawn(WindowManagerService.java:7481)
  - waiting to lock <0x0216d8bc> (a com.android.server.wm.WindowHashMap) held by thread 1
  at com.android.server.policy.PhoneWindowManager.finishKeyguardDrawn(PhoneWindowManager.java:6758)
  at com.android.server.policy.PhoneWindowManager.screenTurningOn(PhoneWindowManager.java:6811)
  - locked <0x004bbcaf> (a java.lang.Object)
  at com.android.server.display.DisplayPowerController.setScreenState(DisplayPowerController.java:965)
  at com.android.server.display.DisplayPowerController.setScreenState(DisplayPowerController.java:906)
  at com.android.server.display.DisplayPowerController.animateScreenStateChange(DisplayPowerController.java:1038)
  at com.android.server.display.DisplayPowerController.updatePowerState(DisplayPowerController.java:675)
  at com.android.server.display.DisplayPowerController.-wrap6(DisplayPowerController.java:-1)
  at com.android.server.display.DisplayPowerController$DisplayControllerHandler.handleMessage(DisplayPowerController.j
  at android.os.Handler.dispatchMessage(Handler.java:106)
  at android.os.Looper.loop(Looper.java:164)
  at android.os.HandlerThread.run(HandlerThread.java:65)
  at com.android.server.ServiceThread.run(ServiceThread.java:46)```
```

产生死锁的代码：

frameworks/base/services/core/java/com/android/server/policy/PhoneWindowManager.java

```
	// Called on the DisplayManager's DisplayPowerController thread.
	@Override
    public void screenTurningOn(final ScreenOnListener screenOnListener) {
        if (DEBUG_WAKEUP) Slog.i(TAG, "Screen turning on...");

        updateScreenOffSleepToken(false);
        synchronized (mLock) {
            mScreenOnEarly = true;
            mScreenOnFully = false;
            mKeyguardDrawComplete = false;
            mWindowManagerDrawComplete = false;
            mScreenOnListener = screenOnListener;

            if (mKeyguardDelegate != null) {
                mHandler.removeMessages(MSG_KEYGUARD_DRAWN_TIMEOUT);
                mHandler.sendEmptyMessageDelayed(MSG_KEYGUARD_DRAWN_TIMEOUT,
                        getKeyguardDrawnTimeout());
                mKeyguardDelegate.onScreenTurningOn(mKeyguardDrawnCallback);
            } else {
                if (DEBUG_WAKEUP) Slog.d(TAG,
                        "null mKeyguardDelegate: setting mKeyguardDrawComplete.");
                finishKeyguardDrawn();
            }
        }
    }
```

其中finishKeyguardDrawn 只能在主线程调用，如果子线程调用就会有死锁的概率。去掉KeyGuard 就有几率触发这个问题。


