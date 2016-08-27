### Issue

容器启动时概率性没有网络，异常信息如下：
```
	04-30 09:25:47.894   248   319 E ConnectivityService: Exception adding interface: java.lang.IllegalStateException: command '30 network interface add 101 eth0' failed with '400 30 addInterfaceToNetwork() failed (Device or resource busy)'
```
	
netd 在添加eth0时报错了，原因是 eth0 已经被添加了。从日志来看，eth0 这个链接会反复的进行 connect 和 disconnect，正常情况下，最后一次的connect后不会再disconnect， 此后网络可以用了。

异常情况下 最后一次connect 时，会失败，原因是上一次connect 的eth0还没完全清理干净（或者正在清理的途中）， netd 里面还保留上一次的eth0 记录。 新的eth0 没有成功注册，所以等上一次的 eth0 清理完之后，eth0 就没了。

### Solution

onIpLayerStoped 后需要等待 上一次的 NetworkAgent 完全清理后才继续 startIpManager。

### ConnectivityService 和 Ethernet 之间的调用关系
![](/Users/summer/Workspace/record/flow_of_eth0.png)


这里有2个关键逻辑注意下:
1. onIpLayerStoped 后，会 stopIpManager 然后立马尝试 startIpManager;
2. stopIpManager 会把 NetworkAgent 设置为 DISCONNECT 并通知 ConnectivityService 把它清除；

因此只要1中 startIpManager 后速度够快，在 ConnectivityService 清理结束前触发了 onIpLayerStarted，那就会出现以上问题。

### Netd

![](/Users/summer/Workspace/record/netd_arch.png)


 * Start NetlinkManager and NetlinkManager will register uevents to kernel:
 		
	* NETLINK_KOBJECT_UEVENT
	* NETLINK_ROUTE
	* NETLINK_NFLOG
	* NETLINK_NETFILTER

* Those event will be handle in NetlinkHandler#onEvent and be notify to clients through socket.

* 负责 Dns 相关

* 负责流量管理

##### DNS

* 每个进程还可以设置进程特定的DNS服务器地址。它们通过诸如"net.dns1."或"net.dns2."的系统属性来表达。
* 不同的网络设备也有对应的DNS服务器地址，例如通过wlan接口发起的网络操作，其对应的DNS服务器由系统属性“net.wlan.dns1”表示。



```
1. 读取 /proc/net/dev 可以解析流量
2. 通过设置iptable 控制单个uid（app) 的网络访问
```


### Questions

1. NetworkRequest 是干什么的？
1. IpManager 为什么会不断的 onProvisioningSuccess & onProvisioningFailure


libpcap
pcap(Packet Capture Process) roughly means to grab a copy of packets off the wire before they are processed by the operating system.
libpcap is a c/c++ library of procedures which we will use to grab packets as they come out of the network interface card.
But this still feels a little vague, let us see if we can make this clearer with the following statements.
Capturing packets means collecting data being transmitted on the network. Every time a network card receives an Ethernet frame, it checks if its destination MAC address matches its own. If it does, it generates an interrupt request. The routine that handles this interrupt is the network card’s driver.
It copies the data from the card buffer to kernel space, then checks the ethertype field of the Ethernet header to determine the type of the packet, and passes it to the appropriate handler in the protocol stack. The data is passed up the layers until it reaches the user-space application, which consumes it.
When we are sniffing packets, the network driver also sends a copy of each received packet to the packet filter.