
###音频输入

先说一下framework层，提供的录音功能是如何使用的。

* 创建AudioRecord 对象，构建参数如下：

	```
	AudioRecord(int audioSource, //音频来源
	int sampleRateInHz,  //采样率一般是 44100
	int channelConfig,  // 左声道/右声道/立体声等
	int audioFormat, //PCM/AAC/AC/MP3 等格式
	int bufferSizeInBytes) 
	```
* 构建好 AudioRecord 后， 调用 startRecording 就开始录音了，接下来音频数据可以通过 AudioRecord 的 read 方法来读取。
* 调用 stop 方法停止录音，调用 release 方法释放 native 层的对象资源。


 ##### 创建 AudioRecord 的过程：

 ```
new AudioRecord // Java 
	android_media_AudioRecord_setup
		new AudioRecord
		AudioRecord#set
		AudioRecord#openRecord_l
			AudioFlinger#openRecord
			AudioFlinger#checkRecordThread_l // get coresponding RecordThread
			RecordThread#createRecordTrack_l // create a RecordTrack
			new RecordHandle(recordTrack) // create a RecordHandle
 ```


 ##### 开始录音

 ```
AudioRecord#startRecording // java
AudioRecord#native_start
	android_media_AudioRecord_start
	IAudioRecord#start // RecordHandle#start in AudioFlinger
		RecordTrack#start
			RecordThread#start
			RecordThread#threadLoop
				mInput->stream->read// = AudioStreamIn.stream(StreamInHalLocal)
```

 ##### RecordThread 创建

 ```
	AudioPolicyService()
		createAudioPolicyManager
			new AudioPolicyManager
			ConfigParsingUtils::loadConfig(AUDIO_POLICY_VENDOR_CONFIG_FILE, config)
			mpClientInterface->openInput// =AudioFlinger::openInput
			AudioFlinger::openInput_l
				findSuitableHwDev_l// return AudioHwDevice
				loadHwModule_l// load audio hal
				inHwHal->openInputStream // 
				new RecordThread//只是创建好线程，并没有启动
	```


```
AudioPolicyManager::getInputForDevice
```
	
```
RecordThread::threadLoop
	
```

##### AudioFlinger 加载音频设备

* 通过 DevicesFactoryHalInterface#openDevice 获取  DeviceHalInterface 接口，openDevice 有2种方式，一种是本地调用，另外是通过 hidl 调用获取到一个远端的 IDevice 接口， 这里是后者。获取到这个音频设备后，做些初始化，然后把它保存到 mAudioHwDevs。

	```
	audio_module_handle_t AudioFlinger::loadHwModule_l(const char *name){
		sp<DeviceHalInterface> dev;
		int rc = mDevicesFactoryHal->openDevice(name, &dev);
		
		mAudioHwDevs.add(handle, new AudioHwDevice(handle, name, dev, flags));
	}
	```
* AudioHwDevice 内部持有 AudioFlinger 打开的 DeviceHalInterface 音频设备接口，
	
#### 结束录音

void AudioFlinger::closeInputFinish(const sp<RecordThread>& thread)
	
	
#### 架构

* audioserver
* android.hardware.audio@2.0-service
	
	读取的时候会起一个线程 reader， 读完之后就结束；
	

	
	
#### pipe-pcm

```
out_write
	pipe_pcm_write
		open_pipe
		write_fully
	
```


```
out_write
	start_output_stream
		my_pipe_pcm_open
			pipe_pcm_open
	
```








