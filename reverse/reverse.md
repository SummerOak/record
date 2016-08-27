### 日志输出

	const-string v8, "Summer"
	invoke-static {v8, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
	

### 堆栈

	new-instance v8, Ljava/lang/Throwable;
	invoke-direct {v8}, Ljava/lang/Throwable;-><init>()V
	invoke-static {v8}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;
	move-result-object v9
	const-string v8, "Summer"
	invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
	
	
	
### 查看最近改动文件

	find . -path $exclude -prune -o -type f -exec stat -c '%Y %n' {} \; | sort -nr | head -n 15
	
	
### tencent

	12-25 19:53:03.015 13864 13864 I TXSystem: IsSysRooted(null:77)device is Rooted

#### 系统启动时间

```
/proc/uptime
```	

### Disassemble Kernel

```
dd if=k skip=`grep -a -b -o -m 1 -e $'\x1f\x8b\x08\x00' k | cut -d: -f 1` bs=1 | zcat > kk
```

### ptrace


```
/proc/sys/kernel/yama/ptrace_scope
/proc/sys/fs/suid_dumpable
```

### coredump

```
art 开启coredump:
art/runtime/native/dalvik_system_ZygoteHooks.cc

echo 1 > /proc/sys/fs/suid_dumpable


```

#### 如何找到 java 被哪个库调用过来

* strings *.so 过滤每个so里面的字符串字符串


#### 修改二进制

```
:%!xxd
:%!xxd -r
:wq
```
#### 非法指令

```
0x00de
```
	
### IDA 伪代码

* BL 后的指令被忽略

伪代码：

```
void *__fastcall sub_6D08(JNIEnv *env, int array, int start, signed int length, int buff)
{
  signed int v5; // r4
  void *result; // r0
  char v7; // [sp+14h] [bp-24h]

  v5 = length;
  result = (void *)OriGetByteArrayRegion(env, array, start, length, buff);
  if ( v5 > 8 )
    result = j_memcpy(&v7, (const void *)buff, 8u);
  return result;
}
```	

指令是这样的：

```
.text:00006D08 ; =============== S U B R O U T I N E =======================================
.text:00006D08
.text:00006D08
.text:00006D08 ; void *__fastcall sub_6D08(JNIEnv *env, int array, int start, signed int length, int buff)
.text:00006D08 sub_6D08                                ; DATA XREF: sub_6D08+5C↓o
.text:00006D08                                         ; .text:off_6D90↓o ...
.text:00006D08
.text:00006D08 var_38          = -0x38
.text:00006D08 var_30          = -0x30
.text:00006D08 var_2C          = -0x2C
.text:00006D08 var_24          = -0x24
.text:00006D08 var_1C          = -0x1C
.text:00006D08 buff            =  0
.text:00006D08
.text:00006D08 ; __unwind {
.text:00006D08                 PUSH    {R4-R7,LR}
.text:00006D0A                 LDR     R7, =(__stack_chk_guard_ptr - 0x6D14)
.text:00006D0C                 MOVS    R4, R3
.text:00006D0E                 SUB     SP, SP, #0x24
.text:00006D10                 ADD     R7, PC          ; __stack_chk_guard_ptr
.text:00006D12                 LDR     R7, [R7]        ; __stack_chk_guard
.text:00006D14                 STR     R2, [SP,#0x38+var_2C]
.text:00006D16                 LDR     R2, [SP,#0x38+buff]
.text:00006D18                 LDR     R3, [R7]
.text:00006D1A                 MOVS    R6, R0
.text:00006D1C                 STR     R2, [SP,#0x38+var_38]
.text:00006D1E                 STR     R3, [SP,#0x38+var_1C]
.text:00006D20                 LDR     R3, =(OriGetByteArrayRegion_ptr - 0x6D2A)
.text:00006D22                 STR     R2, [SP,#0x38+var_30]
.text:00006D24                 LDR     R2, [SP,#0x38+var_2C]
.text:00006D26                 ADD     R3, PC          ; OriGetByteArrayRegion_ptr
.text:00006D28                 LDR     R3, [R3]        ; OriGetByteArrayRegion
.text:00006D2A                 LDR     R5, [R3]
.text:00006D2C                 MOVS    R3, R4
.text:00006D2E                 BLX     R5
.text:00006D30                 CMP     R4, #8
.text:00006D32                 BLE     loc_6D74
.text:00006D34                 ADD     R5, SP, #0x38+var_24
.text:00006D36                 LDR     R1, [SP,#0x38+var_30]
.text:00006D38                 MOVS    R2, #8
.text:00006D3A                 MOVS    R0, R5
.text:00006D3C                 BL      j_memcpy
.text:00006D40 ; ---------------------------------------------------------------------------
.text:00006D40                 MOVS    R1, #8          ; unsigned int
.text:00006D42                 MOVS    R2, #0          ; unsigned int
.text:00006D44                 MOVS    R0, R5          ; void *
.text:00006D46                 BL      _Z8XorArrayPvjj ; XorArray(void *,uint,uint)
.text:00006D4A                 LDR     R1, =(aDex - 0x6D54)
.text:00006D4C                 MOVS    R0, R5
.text:00006D4E                 MOVS    R2, #4
.text:00006D50                 ADD     R1, PC          ; "dex\n"
.text:00006D52                 BL      j_memcmp
.text:00006D56                 CMP     R0, #0
.text:00006D58                 BNE     loc_6D74
.text:00006D5A                 LDR     R2, [R6]
.text:00006D5C                 MOVS    R3, #0x320
.text:00006D60                 LDR     R2, [R2,R3]
.text:00006D62                 LDR     R3, =(sub_6D08+1 - 0x6D68)
.text:00006D64                 ADD     R3, PC          ; sub_6D08
.text:00006D66                 CMP     R2, R3
.text:00006D68                 BNE     loc_6D74
.text:00006D6A                 LDR     R0, [SP,#0x38+var_30] ; void *
.text:00006D6C                 MOVS    R1, R4          ; unsigned int
.text:00006D6E                 LDR     R2, [SP,#0x38+var_2C] ; unsigned int
.text:00006D70                 BL      _Z8XorArrayPvjj ; XorArray(void *,uint,uint)
.text:00006D74
.text:00006D74 loc_6D74                                ; CODE XREF: sub_6D08+2A↑j
.text:00006D74                                         ; sub_6D08+50↑j ...
.text:00006D74                 LDR     R2, [SP,#0x38+var_1C]
.text:00006D76                 LDR     R3, [R7]
.text:00006D78                 CMP     R2, R3
.text:00006D7A                 BEQ     loc_6D80
.text:00006D7C                 BL      j___stack_chk_fail
.text:00006D80 ; ---------------------------------------------------------------------------
.text:00006D80
.text:00006D80 loc_6D80                                ; CODE XREF: sub_6D08+72↑j
.text:00006D80                 ADD     SP, SP, #0x24
.text:00006D82                 POP     {R4-R7,PC}
.text:00006D82 ; End of function sub_6D08
```

	