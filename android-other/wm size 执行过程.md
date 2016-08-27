### wm size 执行过程

```

wm#runDisplaySize
	wms#setForcedDisplaySize
	wms#setForcedDisplaySizeLocked
		mDisplayContent.updateBaseDisplayMetrics
		wms.reconfigureDisplayLocked
			wms.configureDisplayPolicyLocked
				mPolicy.setInitialDisplaySize
				mPolicy.setDisplayOverscan
			wms#startFreezingDisplayLocked
				mInputMonitor.freezeInputDispatchingLw
			mWindowPlacerLocked#performSurfacePlacement
			
		
```


```
wms#sendNewConfiguration
	ams#updateDisplayOverrideConfiguration
		wms#computeNewConfiguration
		ams#updateDisplayOverrideConfigurationLocked
		wms#deferSurfaceLayout
		ams#updateGlobalConfiguration
			mStackSupervisor.onConfigurationChanged
			mHandler.sendMessage(UPDATE_CONFIGURATION_MS)
			app.thread.scheduleConfigurationChanged
			broadcastIntentLocked(Intent.ACTION_CONFIGURATION_CHANGED)
			ams#performDisplayOverrideConfigUpdate
		ams#ensureConfigAndVisibilityAfterUpdate
```