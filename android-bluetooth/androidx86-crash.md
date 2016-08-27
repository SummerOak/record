```
alarm_new_internal#CHECK(false)@system/bt/osi/src/alarm.cc
```

```
10-21 09:51:06.600   971   973 F libc    : Fatal signal 11 (SIGSEGV), code 1, fault addr 0xe0 in tid 973 (Binder:971_1), pid 971 (cmd)
10-21 09:51:07.428  1054  1151 F         : [1021/095107:FATAL:alarm.cc(178)] Check failed: false.
10-21 09:51:07.429  1054  1151 F libc    : Fatal signal 6 (SIGABRT), code -6 in tid 1151 (stack_manager), pid 1054 (droid.bluetooth)
10-21 09:51:07.456  1177  1177 F DEBUG   : *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
10-21 09:51:07.456  1177  1177 F DEBUG   : Build fingerprint: 'Android-x86/android_x86_64/x86_64:8.1.0/OPM8.190105.002/wk09251554:eng/test-keys'
10-21 09:51:07.456  1177  1177 F DEBUG   : Revision: '0'
10-21 09:51:07.456  1177  1177 F DEBUG   : ABI: 'arm64'
10-21 09:51:07.456  1177  1177 F DEBUG   : pid: 1054, tid: 1151, name: stack_manager  >>> com.android.bluetooth <<<
10-21 09:51:07.456  1177  1177 F DEBUG   : signal 6 (SIGABRT), code -6 (SI_TKILL), fault addr --------
10-21 09:51:07.457  1177  1177 F DEBUG   : Abort message: '[1021/095107:FATAL:alarm.cc(178)] Check failed: false.
10-21 09:51:07.457  1177  1177 F DEBUG   : '
10-21 09:51:07.457  1177  1177 F DEBUG   :     x0   0000000000000000  x1   000000000000047f  x2   0000000000000006  x3   0000000000000008
10-21 09:51:07.458  1177  1177 F DEBUG   :     x4   39302f313230315b  x5   39302f313230315b  x6   39302f313230315b  x7   5441463a37303135
10-21 09:51:07.458  1177  1177 F DEBUG   :     x8   0000000000000083  x9   c98553cd197764df  x10  0000000000000000  x11  0000000000000001
10-21 09:51:07.458  1177  1177 F DEBUG   :     x12  ffffffffffffffff  x13  0a202e65736c6166  x14  ffffffffffffffff  x15  0000000000000000
10-21 09:51:07.458  1177  1177 F DEBUG   :     x16  0000ba685880cfa8  x17  0000fb7319def068  x18  0000fb728c4b5548  x19  000000000000041e
10-21 09:51:07.458  1177  1177 F DEBUG   :     x20  000000000000047f  x21  0000000000000000  x22  0000fb728233a588  x23  0000fb72825d6000
10-21 09:51:07.458  1177  1177 F DEBUG   :     x24  0000fb72823392c1  x25  0000000000000004  x26  0000fb72823398e1  x27  0000000000000000
10-21 09:51:07.458  1177  1177 F DEBUG   :     x28  0000fb72823398e1  x29  0000fb7282339280  x30  0000fb7319da3b78
10-21 09:51:07.458  1177  1177 F DEBUG   :     sp   0000fb7282339240  pc   0000fb7319da3b94  pstate 0000000060000000
10-21 09:51:07.479  1177  1177 F DEBUG   :
10-21 09:51:07.479  1177  1177 F DEBUG   : backtrace:
10-21 09:51:07.479  1177  1177 F DEBUG   :     #00 pc 000000000001db94  /system/lib64/libc.so (abort+104)
10-21 09:51:07.479  1177  1177 F DEBUG   :     #01 pc 0000000000083438  /system/lib64/libchrome.so (base::debug::BreakDebugger()+20)
10-21 09:51:07.479  1177  1177 F DEBUG   :     #02 pc 000000000009aefc  /system/lib64/libchrome.so (logging::LogMessage::~LogMessage()+1072)
10-21 09:51:07.479  1177  1177 F DEBUG   :     #03 pc 0000000000198388  /system/lib64/hw/bluetooth.default.so (alarm_new_internal(char const*, bool)+684)
10-21 09:51:07.479  1177  1177 F DEBUG   :     #04 pc 000000000008abd8  /system/lib64/hw/bluetooth.default.so (init()+1220)
10-21 09:51:07.479  1177  1177 F DEBUG   :     #05 pc 00000000001974a8  /system/lib64/hw/bluetooth.default.so (module_init(module_t const*)+132)
10-21 09:51:07.479  1177  1177 F DEBUG   :     #06 pc 00000000000ced48  /system/lib64/hw/bluetooth.default.so (event_init_stack(void*)+148)
10-21 09:51:07.479  1177  1177 F DEBUG   :     #07 pc 00000000001a35a4  /system/lib64/hw/bluetooth.default.so (work_queue_read_cb(void*)+92)
10-21 09:51:07.479  1177  1177 F DEBUG   :     #08 pc 00000000001a1804  /system/lib64/hw/bluetooth.default.so (run_reactor(reactor_t*, int)+316)
10-21 09:51:07.479  1177  1177 F DEBUG   :     #09 pc 00000000001a169c  /system/lib64/hw/bluetooth.default.so (reactor_start(reactor_t*)+84)
10-21 09:51:07.479  1177  1177 F DEBUG   :     #10 pc 00000000001a303c  /system/lib64/hw/bluetooth.default.so (run_thread(void*)+184)
10-21 09:51:07.479  1177  1177 F DEBUG   :     #11 pc 00000000000688e0  /system/lib64/libc.so (__pthread_start(void*)+36)
10-21 09:51:07.479  1177  1177 F DEBUG   :     #12 pc 000000000001efc0  /system/lib64/libc.so (__start_thread+68)
```