#### 进程fork前后， mutex 的状态如何维护？

通过`pthread_atfork `注册回调，在fork 前获取锁，然后fork完成后分别在子进程和父进程释放锁。但是 `vfork` 不会有这个回调。比如 `je_malloc` 这个库：

```
malloc_init
	malloc_init_hard
		malloc_init_hard_recursible
			pthread_atfork
				jemalloc_prefork
					
```

#### vfork 之后父进程会挂起（包括有线程），直到子进程退出或者 exec。

#### Exec 具体做了什么，为什么 vfork 可以和 它一起使用， 进程的内存空间不是共享的吗？