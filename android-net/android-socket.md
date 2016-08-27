Android 提供了 LocalServerSocket ，用字符串创建服务端socket：

```
mServerSocket = new LocalServerSocket("test-server");
```

客户端可以这样连接：

```
struct sockaddr_un addr;
memset(&addr, 0, sizeof(struct sockaddr_un));
addr.sun_family = AF_LOCAL;
addr.sun_path[0] = '\0';
strcpy(&addr.sun_path[1], "test-server");

int fd = socket(AF_LOCAL, SOCK_STREAM, 0);
if(fd < 0){
    LOGE(TAG, "init socket failed %s", strerror(errno));
    return;
}

socklen_t len = offsetof(struct sockaddr_un, sun_path) + 1 + strlen(&addr.sun_path[1]);
if (connect(fd, (struct sockaddr *) &addr, len) < 0) {
    LOGE(TAG, "failed to connect to server, %s", strerror(errno));
    return;
}
```