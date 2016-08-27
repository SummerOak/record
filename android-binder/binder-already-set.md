binder 的释放流程是这样：

* `binder_fops.release` 也就是 `binder_release` 这个方法；
* `binder_release` 向 `workerqueue` 提交 `binder_deferred_func` 异步任务来执行真正释放: `binder_deferred_release`；
* `binder_deferred_func` 除了释放 binder 还会调用 `put_files_struct` 释放其他的驱动，比如amdgpu；

amdgpu驱动的释放过程卡住影响了 binder 的释放， amdgpu 的堆栈如下：

```
kern  :info  : [Fri Mar 12 16:51:56 2021] Workqueue: events binder_deferred_func
kern  :warn  : [Fri Mar 12 16:51:56 2021] Call trace:
kern  :warn  : [Fri Mar 12 16:51:56 2021]  __switch_to+0xf4/0x158
kern  :warn  : [Fri Mar 12 16:51:56 2021]  __schedule+0x2a4/0x958
kern  :warn  : [Fri Mar 12 16:51:56 2021]  schedule+0x3c/0xa0
kern  :warn  : [Fri Mar 12 16:51:56 2021]  drm_sched_entity_flush+0x1a8/0x1f0 [gpu_sched]
kern  :warn  : [Fri Mar 12 16:51:56 2021]  amdgpu_ctx_mgr_entity_flush+0xa0/0x110 [amdgpu]
kern  :warn  : [Fri Mar 12 16:51:56 2021]  amdgpu_flush+0x28/0x38 [amdgpu]
kern  :warn  : [Fri Mar 12 16:51:56 2021]  filp_close+0x44/0x98
kern  :warn  : [Fri Mar 12 16:51:56 2021]  put_files_struct+0xfc/0x100
kern  :warn  : [Fri Mar 12 16:51:56 2021]  binder_deferred_func+0x138/0x5e0
kern  :warn  : [Fri Mar 12 16:51:56 2021]  process_one_work+0x1c0/0x428
kern  :warn  : [Fri Mar 12 16:51:56 2021]  worker_thread+0x50/0x408
kern  :warn  : [Fri Mar 12 16:51:56 2021]  kthread+0x124/0x160
kern  :warn  : [Fri Mar 12 16:51:56 2021]  ret_from_fork+0x10/0x18
```