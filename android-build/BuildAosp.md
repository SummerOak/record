
### 导入厂商硬件驱动

根据aosp 的版本，在[这里](https://source.android.com/setup/start/build-numbers#source-code-tags-and-builds)找到对应 build id， 比如 `refs/tags/android-7.1.0_r7` 对应的是 `NDE63X `，根据这个，到[这里](https://developers.google.com/android/drivers) 下载对应的驱动。它也有对应的[出厂镜像](https://developers.google.com/android/images#sailfish);

下载好驱动后，放到aosp 的根目录，解压后是2个脚本，执行即可，它会把内容解压在`vendor` 下。


### 编译

`make -jN` 执行编译， AOSP 中已经包含预编译好的 `kernel` 所以一般无需自己再手动编译，如果需要改代码然后手动编译，可以参考[这里](https://source.android.com/setup/build/building-kernels)


### 刷机

编译成功后，用`fastboot ` 这个命令把编译的产物 `system.img` `vendor.img` `boot.img` 等分区刷入设备。 


### wifi

ifconfig wlan0 hw ether ac:37:43:49:f4:cc

logcat [-b]

dmesg

strace


#### debug

