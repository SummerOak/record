### 20191117 Pixel wifi
 * Question: wifi keep disconnecting while download started?
 * Solution: Router singale channel change to 1-9.
 
 1. Firtly, I assume someting wrong in the rom built by myself, since I didn't build aosp with pixel vendor binaries so some hardware may doesn't work properly, such as camera/fingerprint and wifi;
 2. So I download specific verdor binaries and built it again but flash failed, and I can't boot up my pixel anymore; Both "make clean" and "make clobber" I have tried, So I flash a factory image to recover everything and flash my build result again. Now I can boot my pixel and Camera works properly, but wifi&fingerprint still not working;
 3. Flash back to factory image, and it doesnt worked neither! So the problem exist between router and pixel wifi receiver and other people may encounter this either.
 4. So search it online, and found the solution: [ this ]( http://tieba.baidu.com/p/5219947094 ). 

 
### Iterm2 ssh后中文乱码

1. 首先需要去设置下iterm，的终端编码方式为utf-8
检查方案为：iterm - > perferences - > Terminal ->Character Encoding 为:UTF-8
2. 打开/etc/ssh_config文件SendEnv LANG LC_*为SendEnv LANG LC_ALL=en.US.UFT-8
3. 关闭iterm再次打开后查看中文是否还显示为乱码，如果还显示乱码，再次修改下linux字符集为utf-8，终端直接输入命令：LANG=“en_US.UTF-8"