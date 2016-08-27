#### 设置 wifi 代理
Android&Ios 设备中， 开启wifi的代理功能，可以把本机的 http 请求代理到指定的代理服务器。Android app可以通过下面的代码获取到当前的代理情况：

 ```
 ProxySelector.getDefault().select(URI.create($url));
 ```
 
 如果app想绕过这个代理， 可以在创建 `Socket` 或者 `openConnection` 时 指定 [`Proxy.NO_PROXY`] (https://developer.android.com/reference/java/net/URL.html#openConnection%28java.net.Proxy%29) ，这样底层的实现就不会走代理。
 
#### ssh socks代理

通过 `ssh` 可以实现 `SOCKS` 协议的代理，比如:

 ```
 ssh -p$pwd -NTD 0.0.0.0:8866 $user@$ip
 ``` 
 这样就在本地起了 8866 这个端口，然后把这个端口的连接以 `SOCKS` 的协议代理到 ssh 的服务器。
 
#### 修改 iptables
如果app设置了`NO_PROXY`，底层实现不走代理，上面的方法就抓取不到数据。 如果有root权限，可以更改 `iptables` 来实现


### 自建vpn

```
The IPsec setup provides the confidentiality of the network communication and the client (system) authentication

With L2TP a tunnel is set up so that the VPN traffic goes over IPsec in a transparent manner

The PPP (Point-to-Point Protocol) setup manages the authentication of the users
```

#### 安装
* `ppp` 
* `xl2tpd` 

	xl2tpd is a FREE implementation of the `L2TP`(Layer 2 Tunneling Protocol) 是隧道传输协议的一个实现

* `fail2ban`
	
	防止  brute-force attacks 

* 下载编译安装 `libreswan` 

#### 配置这些文件
* `/etc/ipsec.conf`
* `/etc/ipsec.secrets`
* `/etc/xl2tpd/xl2tpd.conf`
* `/etc/ppp/options.xl2tpd`
* `/etc/ppp/chap-secrets`
* `/etc/ipsec.d/passwd`

##### 修改 `/etc/sysctl.conf`

```
kernel.msgmnb = 65536
kernel.msgmax = 65536

net.ipv4.ip_forward = 1
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.all.rp_filter = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.default.rp_filter = 0
net.ipv4.conf.$NET_IFACE.send_redirects = 0
net.ipv4.conf.$NET_IFACE.rp_filter = 0

net.core.wmem_max = 12582912
net.core.rmem_max = 12582912
net.ipv4.tcp_rmem = 10240 87380 12582912
net.ipv4.tcp_wmem = 10240 87380 12582912
```
##### 修改 iptables

```
iptables -I INPUT 1 -p udp --dport 1701 -m policy --dir in --pol none -j DROP
iptables -I INPUT 2 -m conntrack --ctstate INVALID -j DROP
iptables -I INPUT 3 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -I INPUT 4 -p udp -m multiport --dports 500,4500 -j ACCEPT
iptables -I INPUT 5 -p udp --dport 1701 -m policy --dir in --pol ipsec -j ACCEPT
iptables -I INPUT 6 -p udp --dport 1701 -j DROP
iptables -I FORWARD 1 -m conntrack --ctstate INVALID -j DROP
iptables -I FORWARD 2 -i "$NET_IFACE" -o ppp+ -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -I FORWARD 3 -i ppp+ -o "$NET_IFACE" -j ACCEPT
iptables -I FORWARD 4 -i ppp+ -o ppp+ -s "$L2TP_NET" -d "$L2TP_NET" -j ACCEPT
iptables -I FORWARD 5 -i "$NET_IFACE" -d "$XAUTH_NET" -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -I FORWARD 6 -s "$XAUTH_NET" -o "$NET_IFACE" -j ACCEPT
# Uncomment to disallow traffic between VPN clients
# iptables -I FORWARD 2 -i ppp+ -o ppp+ -s "$L2TP_NET" -d "$L2TP_NET" -j DROP
# iptables -I FORWARD 3 -s "$XAUTH_NET" -d "$XAUTH_NET" -j DROP
iptables -A FORWARD -j DROP
iptables -t nat -I POSTROUTING -s "$XAUTH_NET" -o "$NET_IFACE" -m policy --dir out --pol none -j MASQUERADE
iptables -t nat -I POSTROUTING -s "$L2TP_NET" -o "$NET_IFACE" -j MASQUERADE
```

##### 创建服务加载 iptables

`/etc/systemd/system/load-iptables-rules.service`

加载 iptables:

```
iptables-restore < /etc/iptables.rules
```

##### enable 服务： fail2ban ipsec xl2tpd

```
# Added by hwdsl2 VPN script
(sleep 15
service ipsec restart
service xl2tpd restart
echo 1 > /proc/sys/net/ipv4/ip_forward)&
exit 0
```

##### 查看日志

```
sudo tcpdump -i ppp0
sudo tail -f /var/log/auth.log
sudo tail -f /var/log/syslog
```






