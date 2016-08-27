
zygote 是 init 进程 fork 的， init 进程通过解析 init.rc 文件来启动。

其中有以下几种：

* zygote32.rc
* zygote64_32.rc

上面的2个文件只会启用一个， 根据 `ro.zygote` 这个系统属性来决定用哪个；

以及webview 使用的：

* webview_zygote32.rc
* webview_zygote64.rc


* zygote 的socket 普通进程可以连接上去，向她发指令么？