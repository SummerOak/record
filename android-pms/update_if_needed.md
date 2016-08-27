动态替换 framework 之后，系统的启动速度变慢了。 其中替换framework的操作是把新编译出来的 `framework` `priv-app` `app` 替换到系统的 `system`目录下面：

```
adb push out/target/product/x86_64/system/framework /system/
adb push out/target/product/x86_64/system/priv-app /system/
adb push out/target/product/x86_64/system/app /system/
```

#### 耗时情况
* `/data` 为空的情况下，耗时 `~24s`，通过日志发现大量的app被重编了：

	```
	06-19 09:30:45.130   405   405 I zygote  : Pruning dalvik-cache since we are relocating an image and will need to recompile
06-19 09:30:45.130   405   405 I zygote  : RelocateImage: /system/bin/patchoat --input-image-location=/system/framework/boot.art --output-image-file=/data/dalvik-cache/x86/system@framework@boot.art --instruction-set=x86 --base-offset-delta=6737920
	```
* `/data`目录下有内容，并且就是`system` 生成的， 耗时 `2~5s`:   
* `/data`目录下有内容，但不是 `system` 生成的， 耗时 `~15s`；

#### 触发重编的条件
系统启动后会判断是否需要更新，更新其实就是通过`dex2oat` 编译/优化 apk的dex:, 代码是`PMS#updatePackagesIfNeeded`，要更新的情景有3个：

```
public void updatePackagesIfNeeded() {
	boolean causeUpgrade = isUpgrade();
	boolean causeFirstBoot = isFirstBoot() || mIsPreNUpgrade;
	boolean causePrunedCache = VMRuntime.didPruneDalvikCache();
	
	if (!causeUpgrade && !causeFirstBoot && !causePrunedCache) {
	    return;
	}
	...
	final int[] stats = performDexOptUpgrade(...);
	...
}    
```

* 第一种情况，`isUpgrade` 的条件比较简单，只要 `Build.FINGERPRINT`变了满足该条件。
* 第二种情况，首次开机(`/data/system/packages.xml`解析失败)或者升级到 N 版本。
* 第三种情况， `/data/dalvik-cache/` 下的东西被清除了，能触发这个条件的情景比较多，其中一个是art虚拟机的启动镜像文件 `boot.art` 需要重定位。

镜像替换导致重编的原因就是第三种，因为`/system` 下面的 `boot.art` 和`/data`下面的 `boot.art` 不一样了，这种情况系统会优先使用`/system`下的启动镜像，LoadImage 的时候会判断是否需要重定位，默认的art虚拟机配置是需要重定位的，因此会执行 image_space.cc 里面的 `RelocateImage` 。

#### RelocateImage 

出于安全性的考虑，把 boot.art 映射到内存的地址做了随机偏移，防止恶意应用猜测地址和内存结构。这个方法直接调用了 `patchoat`  这个命令来完成重定位。

通过 art 虚拟机启动参数可以控制是否开启重定位， `-Xrelocate` 和 `-Xnorelocate` 分别指定重定向和非重定向，如果没有指定，默认值是 true ，也就是默认会重定向。


#### 会重编哪些app

* 系统 app 无条件全部重编；
* 有监听启动事件(`ACTION_PRE_BOOT_COMPLETED`)的app要重编；
* 有代码被其他app引用的 app 要重编，一般用户自己装的app代码不会被其他app依赖；
* 以最后一次使用的app时间点往后再推7天，这7天内使用过的app都会重编；
	如果无法获得最后一次使用app的时间点，那么就全部编译；
	
#### dex2oat 简单说明
* 它其实就是一个编译器，把 apk 里面的 dex 编译成 oat 文件， oat 文件一般是 dex 中的字节码对应的本地机器指令， 根据`--compiler-filter` 来决定编译的程度，当它的值等于 `speed` 的时候会把dex里面的字节码编译成本地机器指令。 编译本地指令的过程需要链接 `boot.art`， 所以如果修改 framework 代码，新生成的 `boot.art` 变了之后，之前链接的 oat 文件就需要再次重新链接；
* `dex2oat` 有三个使用情景：  
	* 安装应用程序会启动`dex2oat`进程， 并会在此进程创建一个ART虚拟机，加载 `boot.art`启动镜像， 此时 `dex2oat` 的编译选项由系统属性 `pm.dexopt.install` 控制，默认值是 `quicken`;
	* 系统启动时，有些app需要重新编译；
	* `BackgroundDexoptService` 执行后台dex优化；
	
* 对比 不同版本的 boot.art 生成的 oat 文件，有差别，但竟然能够正常运行。 @todo  


#### boot.art 文件

* The runtime introduces three different memory regions into the app's processs space. 
	* The first one is `classes.dex` file, which contains the app's logic. The file name has a legacy which was inherited from the Dalvik runtime, but it is actual in the oat format.	
	* The second region is the `system@framework@boot.oat` (ART boot code). This region contains the compiled executable code of all android framework bytecode.
	* The third region is a data area and it does not contain any executable code. It is mapped with the `system@framework@boot.art` (ART boot image) file which contains all necessary objects for bootstrapping the ART runtime. Basically, it provides a mapping table between a framework function and its the real address of the exectuable code. To invoke a framework function in the app, the code will first query the `boot.art` mapping table, then call the actual code in the text section in `boot.oat`. For the ART runtime, 

*  boot.art boot.oat  *.vdex *.odex


#### oat 文件

* oat 文件是以 elf 格式为外壳，里面导出了3个符号：`oatdata`和`oatlastword`分别指定了oat文件在elf文件中的头和尾的位置，符号`oatexec`指向可执行段的位置；
* 对于包含oat的elf文件来说，如果是Boot Oat，则其是要被加载到一个固定的地址上的，具体来说是紧接着Image文件之后。而对于普通应用程序的oat文件来说，可以被加载到内存中的任何位置；
* oat文件有自己的头和格式，并且其内部包含了一个或多个完整的dex文件。
* oat里面的本地指令是地址无关的？

#### 编译配置

(配置)[https://source.android.com/devices/tech/dalvik/configure]  

* 云游戏场景中，玩家共享`system`，因此把系统app事先 dex2oat并存放到 `system`下不仅可以加速启动还能节省玩家data空间(从原来110M+ 减少到 30M左右)。

	通过配置项指定预编译的模块： `PRODUCT_DEXPREOPT_SPEED_APPS`， 另外注意，如果编译eng版本，配置会被eng 版本默认开启的 `WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY` 所覆盖，因此需要把eng下的这个配置去掉。
