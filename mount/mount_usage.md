### mount

1. 容器内Mount为什么会导致mountinfo过大？
	
	总共出现过3次mountinfo 暴增问题：
	1. 非zygote 进程进行bind mount;
	2. webview sandbox 进程，触发了 Mount;
	3. logdumper 服务不断重启（原理和1一样）；

	以上原因是：
	
	```
	1. 非zygote 进程，比如 shell 里面执行 am/wm 等命令， 它的mount namespace 不是独立的，和 init 进程所处的一致，在它里面执行bind mount 直接影响系统的默认命名空间，因此多次在shell 里面执行 am/wm 会导致系统的mountpoint 成指数级增长。
	2. 
	```
2. mountpoint 检测一个路径是否是挂载点，它不能检测出同个文件系统下的 bind mount，不同文件系统下的可以。


2. /etc/fstab 是什么，android里面没有？
	
	android里面对应的是 /proc/mounts

* 跟随 source 移动
	
* bind 自己，一般用来设置挂载点的 propogation

	```
	mount --bind /mnt /mnt
	mount --make-shared /mnt
	```
	
* MS_REC

	首先创建一些目录：
	
	```
	chiron:/ # mkdir 1 2 3 2/4 3/f
	```
	
	然后按顺序这样mount：
	
	```
	chiron:/ # mount --bind 2 1
	chiron:/ # mount --bind 3 2/4
	```
	此时 1/4/f 是个合法路径，但如果mount的顺序调换过来，1/4/f 将不是合法路径：
	
	```
	chiron:/ # mount --bind 3 2/4
	chiron:/ # mount --bind 2 1
	chiron:/ # ls 1/4/f
	ls: 1/4/f: No such file or directory
	```	
	也就是 mount --bind 2 1 默认只有 2 这层目录生效，2 下面的子目录中的mount对 1 来说是不可见的。如果要可见那需要加 MS_REC 这个参数
	
	```
	By default, when a directory is bind mounted, only that directory is
   mounted; if there are any submounts under the directory tree, they
   are not bind mounted.  If the MS_REC flag is also specified, then a
   recursive bind mount operation is performed: all submounts under the
   source subtree (other than unbindable mounts) are also bind mounted
   at the corresponding location in the target subtree.
	```
	
	在 ubuntu 上测试是正常，但android上却不行，后面发现android里面实现的mount 和linux 的不同，它自动识别--bind/--rbind类型，并且不带 MS_REC 。
	
	
* 缠绕

	```
	chiron:/ # mount --bind /data/tmp /data/tmp/1/2
	chiron:/ # ll /data/tmp/1/2/1/2/
	total 0
	
	chiron:/ # mount --bind /data/tmp/1/2 /data/tmp
	chiron:/ # ll /data/tmp/
	total 0
	```
	
#### Android app 进程
* 它的子进程都将和父进程共享mount的空间；
* 