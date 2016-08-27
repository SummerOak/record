### 事件来源
1. 通过 InputManager#injectInputEvent 上层接口注入；

	```
	InputManager#injectInputEvent
	InputManagerService#injectInputEvent
	InputManagerService#injectInputEventInternal
		nativeInjectInputEvent
			InputDispatcher::injectInputEvent
			InputDispatcher::enqueueInboundEventLocked	```

2. 由硬件产生，InputReader 通过 EventHub 从设备文件/dev/input/xxx读取：  
	
	```
	InputReader::loopOnce  
		EventHub::getEvents
	InputReader::processEventsLocked   
	InputReader::processEventsForDeviceLocked   
		InputDevice::process  
			TouchInputMapper::process   
			TouchInputMapper::sync   
			TouchInputMapper::processRawTouches   
			TouchInputMapper::cookAndDispatch   
			TouchInputMapper::dispatchPointerUsage
			TouchInputMapper::dispatchPointerGestures
			TouchInputMapper::dispatchMotion
		QueuedInputListener::notifyMotion
	InputDispatcher::notifyMotion
	InputDispatcher::enqueueInboundEventLocked
	```
	
		
可以看到，2种方式最终都通过 InputDispatcher::enqueueInboundEventLocked 装入 InputDispatcher::mInboundQueue


### 事件分发

InputDispatcherThread 从 mInboundQueue 取出 EventEntry ， 找到事件对应的接收者，把 EventEntry 封装成 DispatchEntry 装入接受者对应的连接的队列中： Connection#outboundQueue

```
InputDispatcherThread::threadLoop
InputDispatcher::dispatchOnce
dispatchOnceInnerLocked
dispatchMotionLocked
	findFocusedWindowTargetsLocked//找到事件对应的目标
dispatchEventLocked
prepareDispatchCycleLocked
enqueueDispatchEntriesLocked
enqueueDispatchEntryLocked
```
		

到目前为止，事件还在system_server进程，已经装载到每个接收者的队列中。
最后，通过 Connection::inputPublisher 的 publishMotionEvent 方法通过 socket 发送给到接收者进程。


### 本地事件分发

首先，注册事件服务端InputChannel：

```
ViewRootImpl#setView  
	mInputChannel = new InputChannel();//后面的openInputChannel 后会填充这里面的内容  
	Session#addToDisplay  
	WindowManagerService#addWindow  
	WindowState#openInputChannel  
	InputChannel#openInputChannelPair	  	InputManagerSerivce#registerInputChannel  
	NativeInputManager::registerInputChannel  
	InputDispatcher::registerInputChannel  
		new Connection(inputChannel, inputWindowHandle, monitor);  
	 	int fd = inputChannel->getFd();
	 	mConnectionsByFd.add(fd, connection);
	 	mLooper->addFd(fd, 0, ALOOPER_EVENT_INPUT, handleReceiveCallback, this);//注册事件接收结果回调 handleReceiveCallback，客户端事件处理完成后，会回传处理信息。
```

InputChannel#openInputChannelPair会返回2个InputChannel，每个InputChannel包含一个socket的fd，这2个socket 是通过 socketpair 创建的。 
 
   * 其中一个InputChannel注册到InputDispatcher:: mConnectionsByFd，上面所说的Connection::inputPublisher中publishMotionEvent方法所用到的socket就是这个。
   * 另外一个留给客户端进程，也就是ViewRootImpl 里的 mInputChannel。

接着ViewRootImpl#setView 封装客户端 mInputChannel：

```
mInputEventReceiver = new WindowInputEventReceiver(mInputChannel,Looper.myLooper());  
	InputEventReceiver#nativeInit  
		new NativeInputEventReceiver  
		NativeInputEventReceiver::initialize  
			setFdEvents(ALOOPER_EVENT_INPUT);
```

                
	
	
	
	
	
	
	
	
	