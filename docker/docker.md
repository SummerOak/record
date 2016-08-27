### 删除 docker register 

	
	#!/bin/bash

	while read -r line || [ -n "$line" ] ; do
	  digest=`curl -sD - -o /dev/null -H "Accept: application/vnd.docker.distribution.manifest.v2+json" -X GET http://42.186.33.246:65000/v2/online/manifests/$line | grep Docker-Content-Digest | awk '{print $2}'`
	  echo "curl -X DELETE http://42.186.33.246:65000/v2/online/manifests/$digest"
	done < rmlist
	
清除镜像:

```
docker system prune -a --filter "until=120h"
```	
	
* 计算镜像的层数

 `docker inspect $1 | grep -E "^\s+\"sha256:" | wc -l`
 
 
* 容器启动失败

	```	
	endpoint with name XX already exists in network
	```
	
	```
	docker network disconnect -f bridge <container>
	```
	
### 引入镜像 tar包

```
docker import x86_tempfs_0927151953.tar 14.152.57.88:65000/test:0927_init2
```


#### 容器内 VPN 配置

默认情况下，这个值是1： `/proc/sys/net/ipv4/conf/*/rp_filter` 这样 vpn 的包在往会传的时候会被丢弃，导致vpn不能正常使用， 所以要把这个值设为0：

```
for f in /proc/sys/net/ipv4/conf/*/rp_filter ; do echo 0 > $f ; done
```

包被丢弃时好像会打印 dmesg 或者通过 tcpdump 可以看到。