MAGIC:
oat
131

LOCATION:
base.odex

CHECKSUM:
0xb39f1726

INSTRUCTION SET:
X86_64

INSTRUCTION SET FEATURES:
-ssse3,-sse4.1,-sse4.2,-avx,-avx2,-popcnt

DEX FILE COUNT:
1

EXECUTABLE OFFSET:
0x00001000

INTERPRETER TO INTERPRETER BRIDGE OFFSET:
0x00000000

INTERPRETER TO COMPILED CODE BRIDGE OFFSET:
0x00000000

JNI DLSYM LOOKUP OFFSET:
0x00000000

QUICK GENERIC JNI TRAMPOLINE OFFSET:
0x00000000

QUICK IMT CONFLICT TRAMPOLINE OFFSET:
0x00000000

QUICK RESOLUTION TRAMPOLINE OFFSET:
0x00000000

QUICK TO INTERPRETER BRIDGE OFFSET:
0x00000000

IMAGE PATCH DELTA:
-7573504 (0xff8c7000)

IMAGE FILE LOCATION OAT CHECKSUM:
0xab230dd9

IMAGE FILE LOCATION OAT BEGIN:
0x70323000

KEY VALUE STORE:
classpath = PCL[]
compiler-filter = speed
concurrent-copying = true
debuggable = true
dex2oat-cmdline = --zip-fd=14 --zip-location=base.apk --input-vdex-fd=-1 --output-vdex-fd=16 --oat-fd=15 --oat-location=/data/app/com.netease.arttest-nUVFQMjuHYL64hZkP7QkTw==/oat/x86_64/base.odex --instruction-set=x86_64 --instruction-set-variant=x86_64 --instruction-set-features=default --runtime-arg -Xms64m --runtime-arg -Xmx512m --compiler-filter=speed --swap-fd=17 --debuggable --classpath-dir=/data/app/com.netease.arttest-nUVFQMjuHYL64hZkP7QkTw== --class-loader-context=PCL[]
dex2oat-host = X86
image-location = /data/dalvik-cache/x86_64/system@framework@boot.art:/data/dalvik-cache/x86_64/system@framework@boot-core-libart.art:/data/dalvik-cache/x86_64/system@framework@boot-conscrypt.art:/data/dalvik-cache/x86_64/system@framework@boot-okhttp.art:/data/dalvik-cache/x86_64/system@framework@boot-bouncycastle.art:/data/dalvik-cache/x86_64/system@framework@boot-apache-xml.art:/data/dalvik-cache/x86_64/system@framework@boot-legacy-test.art:/data/dalvik-cache/x86_64/system@framework@boot-ext.art:/data/dalvik-cache/x86_64/system@framework@boot-framework.art:/data/dalvik-cache/x86_64/system@framework@boot-telephony-common.art:/data/dalvik-cache/x86_64/system@framework@boot-voip-common.art:/data/dalvik-cache/x86_64/system@framework@boot-ims-common.art:/data/dalvik-cache/x86_64/system@framework@boot-org.apache.http.legacy.boot.art:/data/dalvik-cache/x86_64/system@framework@boot-android.hidl.base-V1.0-java.art:/data/dalvik-cache/x86_64/system@framework@boot-android.hidl.manager-V1.0-java.art
native-debuggable = false
pic = false

SIZE:
4748

Dex file data for base.apk
Num string ids: 51
Num method ids: 14
Num field ids: 8
Num type ids: 19
Num class defs: 5
Unique strings loaded from dex code: 1
Total strings loaded from dex code: 1
Number of unique dex code items: 7
Total number of dex code bytes: 92

Layout data
SectionTypeCode:LayoutTypeSometimesUsed(0-0) LayoutTypeStartupOnly(0-0) LayoutTypeHot(0-0) LayoutTypeUsedOnce(0-0) LayoutTypeUnused(0-0) 
SectionTypeStrings:LayoutTypeSometimesUsed(0-0) LayoutTypeStartupOnly(0-0) LayoutTypeHot(0-0) LayoutTypeUsedOnce(0-0) LayoutTypeUnused(0-0) 

Cumulative dex file data
Num string ids: 51
Num method ids: 14
Num field ids: 8
Num type ids: 19
Num class defs: 5
Unique strings loaded from dex code: 1
Total strings loaded from dex code: 1
Number of unique dex code items: 7
Total number of dex code bytes: 92

Dependencies of base.apk:
  Landroid/app/Activity; must be assignable to Landroid/content/Context;
  Landroid/widget/TextView; must be assignable to Landroid/view/View;
  Landroid/app/Activity; must be resolved  with access flags 1
  Landroid/os/Bundle; must be resolved  with access flags 1
  Landroid/widget/TextView; must be resolved  with access flags 1
  Ljava/lang/Boolean; must be resolved  with access flags 1
  Ljava/lang/Object; must be resolved  with access flags 1
  Landroid/app/Activity;-><init>()V is expected to be in class Landroid/app/Activity;, have the access flags 1
  Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V is expected to be in class Landroid/app/Activity;, have the access flags 4
  Landroid/widget/TextView;-><init>(Landroid/content/Context;)V is expected to be in class Landroid/widget/TextView;, have the access flags 1
  Landroid/widget/TextView;->setText(I)V is expected to be in class Landroid/widget/TextView;, have the access flags 1
  Lcom/netease/arttest/MainActivity;->setContentView(Landroid/view/View;)V is expected to be in class Landroid/app/Activity;, have the access flags 1
  Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z is expected to be in class Ljava/lang/Boolean;, have the access flags 9
  Ljava/lang/Object;-><init>()V is expected to be in class Ljava/lang/Object;, have the access flags 1
OatDexFile:
location: base.apk
checksum: 0x522340d1
dex-file: 0x0000001c..0x00000a53
type-table: 0x00000698..0x000006d7
0: Lcom/netease/arttest/BuildConfig; (offset=0x0000073c) (type_idx=6) (StatusSuperclassValidated) (OatClassSomeCompiled)
  0: void com.netease.arttest.BuildConfig.<clinit>() (dex_method_idx=4)
    DEX CODE:
      0x0000: 1a00 2f00                	| const-string v0, "true" // string@47
      0x0002: 7110 0c00 0000           	| invoke-static {v0}, boolean java.lang.Boolean.parseBoolean(java.lang.String) // method@12
      0x0005: 0a00                     	| move-result v0
      0x0006: 6a00 0200                	| sput-boolean v0, Z com.netease.arttest.BuildConfig.DEBUG // field@2
      0x0008: 0e00                     	| return-void
    OatMethodOffsets (offset=0x00000000)
      code_offset: 0x00000000 
    OatQuickMethodHeader (offset=0x00000000)
      vmap_table: (offset=0x00000000)
    QuickMethodFrameInfo
      frame_size_in_bytes: 0
      core_spill_mask: 0x00000000 
      fp_spill_mask: 0x00000000 
      vr_stack_locations:
      	locals: v0[sp + #4294967288]
      	method*: v1[sp + #0]
      	outs: v0[sp + #8]
    CODE: (code_offset=0x00000000 size_offset=0x00000000 size=0)
      NO CODE!
  1: void com.netease.arttest.BuildConfig.<init>() (dex_method_idx=5)
    DEX CODE:
      0x0000: 7010 0d00 0000           	| invoke-direct {v0}, void java.lang.Object.<init>() // method@13
      0x0003: 0e00                     	| return-void
    OatMethodOffsets (offset=0x00000748)
      code_offset: 0x00001020 
    OatQuickMethodHeader (offset=0x00001008)
      vmap_table: (offset=0x000008b0)
        Optimized CodeInfo (number_of_dex_registers=1, number_of_stack_maps=3)
          StackMapEncoding (native_pc_bit_offset=0, dex_pc_bit_offset=6, dex_register_map_bit_offset=7, inline_info_bit_offset=10, register_mask_bit_offset=10, stack_mask_index_bit_offset=12, total_bit_size=13)
          DexRegisterLocationCatalog (number_of_entries=2, size_in_bytes=2)
            entry 0: in register (3)
            entry 1: in register (6)
    QuickMethodFrameInfo
      frame_size_in_bytes: 32
      core_spill_mask: 0x00010008 (r3, r16)
      fp_spill_mask: 0x00000000 
      vr_stack_locations:
      	ins: v0[sp + #40]
      	method*: v1[sp + #0]
      	outs: v0[sp + #8]
    CODE: (code_offset=0x00001020 size_offset=0x0000101c size=60)...
      0x00001020:       4885842400E0FFFF    	       testq rax, [rsp + -8192]
        StackMap [native_pc=0x1028] [entry_size=0xd bits] (dex_pc=0x0, native_pc_offset=0x8, dex_register_map_offset=0xffffffff, inline_info_offset=0xffffffff, register_mask=0x0, stack_mask=0b)
      0x00001028:                     53    	       push rbx
      0x00001029:               4883EC10    	       subq rsp, 16
      0x0000102d:               48893C24    	       movq [rsp], rdi
      0x00001031:   6566833C250000000000    	       cmpw gs:[0], 0  ; state_and_flags
      0x0000103b:           0F8511000000    	       jnz/ne +17 (0x00001052)
      0x00001041:                 4889F3    	       movq rbx, rsi
      0x00001044:             BFA8C5A76F    	       mov edi, 1873266088
      0x00001049:                 FF5728    	       call [rdi + 40]
        StackMap [native_pc=0x104c] [entry_size=0xd bits] (dex_pc=0x0, native_pc_offset=0x2c, dex_register_map_offset=0x0, inline_info_offset=0xffffffff, register_mask=0x8, stack_mask=0b)
          v0: in register (3)	[entry 0]
      0x0000104c:               4883C410    	       addq rsp, 16
      0x00001050:                     5B    	       pop rbx
      0x00001051:                     C3    	       ret 
      0x00001052:       65FF1425F0040000    	       call gs:[1264]  ; pTestSuspend
        StackMap [native_pc=0x105a] [entry_size=0xd bits] (dex_pc=0x0, native_pc_offset=0x3a, dex_register_map_offset=0x2, inline_info_offset=0xffffffff, register_mask=0x40, stack_mask=0b)
          v0: in register (6)	[entry 1]
      0x0000105a:                   EBE5    	       jmp -27 (0x00001041)
1: Lcom/netease/arttest/MainActivity; (offset=0x0000074c) (type_idx=7) (StatusSuperclassValidated) (OatClassAllCompiled)
  0: void com.netease.arttest.MainActivity.<init>() (dex_method_idx=6)
    DEX CODE:
      0x0000: 7010 0000 0000           	| invoke-direct {v0}, void android.app.Activity.<init>() // method@0
      0x0003: 0e00                     	| return-void
    OatMethodOffsets (offset=0x00000750)
      code_offset: 0x00001080 
    OatQuickMethodHeader (offset=0x00001068)
      vmap_table: (offset=0x00000910)
        Optimized CodeInfo (number_of_dex_registers=1, number_of_stack_maps=3)
          StackMapEncoding (native_pc_bit_offset=0, dex_pc_bit_offset=6, dex_register_map_bit_offset=7, inline_info_bit_offset=10, register_mask_bit_offset=10, stack_mask_index_bit_offset=12, total_bit_size=13)
          DexRegisterLocationCatalog (number_of_entries=2, size_in_bytes=2)
            entry 0: in register (3)
            entry 1: in register (6)
    QuickMethodFrameInfo
      frame_size_in_bytes: 32
      core_spill_mask: 0x00010008 (r3, r16)
      fp_spill_mask: 0x00000000 
      vr_stack_locations:
      	ins: v0[sp + #40]
      	method*: v1[sp + #0]
      	outs: v0[sp + #8]
    CODE: (code_offset=0x00001080 size_offset=0x0000107c size=60)...
      0x00001080:       4885842400E0FFFF    	       testq rax, [rsp + -8192]
        StackMap [native_pc=0x1088] [entry_size=0xd bits] (dex_pc=0x0, native_pc_offset=0x8, dex_register_map_offset=0xffffffff, inline_info_offset=0xffffffff, register_mask=0x0, stack_mask=0b)
      0x00001088:                     53    	       push rbx
      0x00001089:               4883EC10    	       subq rsp, 16
      0x0000108d:               48893C24    	       movq [rsp], rdi
      0x00001091:   6566833C250000000000    	       cmpw gs:[0], 0  ; state_and_flags
      0x0000109b:           0F8511000000    	       jnz/ne +17 (0x000010b2)
      0x000010a1:                 4889F3    	       movq rbx, rsi
      0x000010a4:             BF38DC1970    	       mov edi, 1880742968
      0x000010a9:                 FF5728    	       call [rdi + 40]
        StackMap [native_pc=0x10ac] [entry_size=0xd bits] (dex_pc=0x0, native_pc_offset=0x2c, dex_register_map_offset=0x0, inline_info_offset=0xffffffff, register_mask=0x8, stack_mask=0b)
          v0: in register (3)	[entry 0]
      0x000010ac:               4883C410    	       addq rsp, 16
      0x000010b0:                     5B    	       pop rbx
      0x000010b1:                     C3    	       ret 
      0x000010b2:       65FF1425F0040000    	       call gs:[1264]  ; pTestSuspend
        StackMap [native_pc=0x10ba] [entry_size=0xd bits] (dex_pc=0x0, native_pc_offset=0x3a, dex_register_map_offset=0x2, inline_info_offset=0xffffffff, register_mask=0x40, stack_mask=0b)
          v0: in register (6)	[entry 1]
      0x000010ba:                   EBE5    	       jmp -27 (0x000010a1)
  1: void com.netease.arttest.MainActivity.onCreate(android.os.Bundle) (dex_method_idx=7)
    DEX CODE:
      0x0000: 6f20 0100 3200           	| invoke-super {v2, v3}, void android.app.Activity.onCreate(android.os.Bundle) // method@1
      0x0003: 2200 0500                	| new-instance v0, android.widget.TextView // type@TypeIndex[5]
      0x0005: 7020 0200 2000           	| invoke-direct {v0, v2}, void android.widget.TextView.<init>(android.content.Context) // method@2
      0x0008: 1501 027f                	| const/high16 v1, #int +2130837504 // 0x7f020000
      0x000a: 6e20 0300 1000           	| invoke-virtual {v0, v1}, void android.widget.TextView.setText(int) // method@3
      0x000d: 6e20 0800 0200           	| invoke-virtual {v2, v0}, void com.netease.arttest.MainActivity.setContentView(android.view.View) // method@8
      0x0010: 0e00                     	| return-void
    OatMethodOffsets (offset=0x00000754)
      code_offset: 0x000010e0 
    OatQuickMethodHeader (offset=0x000010c8)
      vmap_table: (offset=0x0000094f)
        Optimized CodeInfo (number_of_dex_registers=4, number_of_stack_maps=7)
          StackMapEncoding (native_pc_bit_offset=0, dex_pc_bit_offset=8, dex_register_map_bit_offset=12, inline_info_bit_offset=16, register_mask_bit_offset=16, stack_mask_index_bit_offset=19, total_bit_size=20)
          DexRegisterLocationCatalog (number_of_entries=6, size_in_bytes=10)
            entry 0: in register (3)
            entry 1: in register (5)
            entry 2: in register (12)
            entry 3: as constant (large value) (2130837504)
            entry 4: in register (6)
            entry 5: in register (2)
    QuickMethodFrameInfo
      frame_size_in_bytes: 48
      core_spill_mask: 0x00011028 (r3, r5, r12, r16)
      fp_spill_mask: 0x00000000 
      vr_stack_locations:
      	locals: v0[sp + #4] v1[sp + #8]
      	ins: v2[sp + #56] v3[sp + #60]
      	method*: v4[sp + #0]
      	outs: v0[sp + #8] v1[sp + #12]
    CODE: (code_offset=0x000010e0 size_offset=0x000010dc size=137)...
      0x000010e0:       4885842400E0FFFF    	       testq rax, [rsp + -8192]
        StackMap [native_pc=0x10e8] [entry_size=0x14 bits] (dex_pc=0x0, native_pc_offset=0x8, dex_register_map_offset=0xffffffff, inline_info_offset=0xffffffff, register_mask=0x0, stack_mask=0b)
      0x000010e8:                   4154    	       push r12
      0x000010ea:                     55    	       push rbp
      0x000010eb:                     53    	       push rbx
      0x000010ec:               4883EC10    	       subq rsp, 16
      0x000010f0:               48893C24    	       movq [rsp], rdi
      0x000010f4:   6566833C250000000000    	       cmpw gs:[0], 0  ; state_and_flags
      0x000010fe:           0F855B000000    	       jnz/ne +91 (0x0000115f)
      0x00001104:                 4889F3    	       movq rbx, rsi
      0x00001107:                 4889D5    	       movq rbp, rdx
      0x0000110a:             BFA8F61970    	       mov edi, 1880749736
      0x0000110f:                 FF5728    	       call [rdi + 40]
        StackMap [native_pc=0x1112] [entry_size=0x14 bits] (dex_pc=0x0, native_pc_offset=0x32, dex_register_map_offset=0x0, inline_info_offset=0xffffffff, register_mask=0x28, stack_mask=0b)
          v2: in register (3)	[entry 0]
          v3: in register (5)	[entry 1]
      0x00001112:             BFB05CCB6F    	       mov edi, 1875598512
      0x00001117:       65FF1425F0010000    	       call gs:[496]  ; pAllocObjectInitialized
        StackMap [native_pc=0x111f] [entry_size=0x14 bits] (dex_pc=0x3, native_pc_offset=0x3f, dex_register_map_offset=0x0, inline_info_offset=0xffffffff, register_mask=0x28, stack_mask=0b)
          v2: in register (3)	[entry 0]
          v3: in register (5)	[entry 1]
      0x0000111f:                 4889DA    	       movq rdx, rbx
      0x00001122:                 4889C6    	       movq rsi, rax
      0x00001125:                 4989C4    	       movq r12, rax
      0x00001128:             BF58570770    	       mov edi, 1879529304
      0x0000112d:                 FF5728    	       call [rdi + 40]
        StackMap [native_pc=0x1130] [entry_size=0x14 bits] (dex_pc=0x5, native_pc_offset=0x50, dex_register_map_offset=0x2, inline_info_offset=0xffffffff, register_mask=0x1028, stack_mask=0b)
          v0: in register (12)	[entry 2]
          v2: in register (3)	[entry 0]
          v3: in register (5)	[entry 1]
      0x00001130:                 4C89E6    	       movq rsi, r12
      0x00001133:             BA0000027F    	       mov edx, 2130837504
      0x00001138:                   8B3E    	       mov edi, [rsi]
      0x0000113a:         488BBFB0200000    	       movq rdi, [rdi + 8368]
      0x00001141:                 FF5728    	       call [rdi + 40]
        StackMap [native_pc=0x1144] [entry_size=0x14 bits] (dex_pc=0xa, native_pc_offset=0x64, dex_register_map_offset=0x5, inline_info_offset=0xffffffff, register_mask=0x1028, stack_mask=0b)
          v0: in register (12)	[entry 2]
          v1: as constant (large value) (2130837504)	[entry 3]
          v2: in register (3)	[entry 0]
          v3: in register (5)	[entry 1]
      0x00001144:                 4889DE    	       movq rsi, rbx
      0x00001147:                 4C89E2    	       movq rdx, r12
      0x0000114a:                   8B3E    	       mov edi, [rsi]
      0x0000114c:         488BBF400D0000    	       movq rdi, [rdi + 3392]
      0x00001153:                 FF5728    	       call [rdi + 40]
        StackMap [native_pc=0x1156] [entry_size=0x14 bits] (dex_pc=0xd, native_pc_offset=0x76, dex_register_map_offset=0x5, inline_info_offset=0xffffffff, register_mask=0x1028, stack_mask=0b)
          v0: in register (12)	[entry 2]
          v1: as constant (large value) (2130837504)	[entry 3]
          v2: in register (3)	[entry 0]
          v3: in register (5)	[entry 1]
      0x00001156:               4883C410    	       addq rsp, 16
      0x0000115a:                     5B    	       pop rbx
      0x0000115b:                     5D    	       pop rbp
      0x0000115c:                   415C    	       pop r12
      0x0000115e:                     C3    	       ret 
      0x0000115f:       65FF1425F0040000    	       call gs:[1264]  ; pTestSuspend
        StackMap [native_pc=0x1167] [entry_size=0x14 bits] (dex_pc=0x0, native_pc_offset=0x87, dex_register_map_offset=0x8, inline_info_offset=0xffffffff, register_mask=0x44, stack_mask=0b)
          v2: in register (6)	[entry 4]
          v3: in register (2)	[entry 5]
      0x00001167:                   EB9B    	       jmp -101 (0x00001104)
2: Lcom/netease/arttest/R$drawable; (offset=0x00000758) (type_idx=8) (StatusSuperclassValidated) (OatClassAllCompiled)
  0: void com.netease.arttest.R$drawable.<init>() (dex_method_idx=9)
    DEX CODE:
      0x0000: 7010 0d00 0000           	| invoke-direct {v0}, void java.lang.Object.<init>() // method@13
      0x0003: 0e00                     	| return-void
    OatMethodOffsets (offset=0x0000075c)
      code_offset: 0x00001190 
    OatQuickMethodHeader (offset=0x00001178)
      vmap_table: (offset=0x00000a20)
        Optimized CodeInfo (number_of_dex_registers=1, number_of_stack_maps=3)
          StackMapEncoding (native_pc_bit_offset=0, dex_pc_bit_offset=6, dex_register_map_bit_offset=7, inline_info_bit_offset=10, register_mask_bit_offset=10, stack_mask_index_bit_offset=12, total_bit_size=13)
          DexRegisterLocationCatalog (number_of_entries=2, size_in_bytes=2)
            entry 0: in register (3)
            entry 1: in register (6)
    QuickMethodFrameInfo
      frame_size_in_bytes: 32
      core_spill_mask: 0x00010008 (r3, r16)
      fp_spill_mask: 0x00000000 
      vr_stack_locations:
      	ins: v0[sp + #40]
      	method*: v1[sp + #0]
      	outs: v0[sp + #8]
    CODE: (code_offset=0x00001190 size_offset=0x0000118c size=60)...
      0x00001190:       4885842400E0FFFF    	       testq rax, [rsp + -8192]
        StackMap [native_pc=0x1198] [entry_size=0xd bits] (dex_pc=0x0, native_pc_offset=0x8, dex_register_map_offset=0xffffffff, inline_info_offset=0xffffffff, register_mask=0x0, stack_mask=0b)
      0x00001198:                     53    	       push rbx
      0x00001199:               4883EC10    	       subq rsp, 16
      0x0000119d:               48893C24    	       movq [rsp], rdi
      0x000011a1:   6566833C250000000000    	       cmpw gs:[0], 0  ; state_and_flags
      0x000011ab:           0F8511000000    	       jnz/ne +17 (0x000011c2)
      0x000011b1:                 4889F3    	       movq rbx, rsi
      0x000011b4:             BFA8C5A76F    	       mov edi, 1873266088
      0x000011b9:                 FF5728    	       call [rdi + 40]
        StackMap [native_pc=0x11bc] [entry_size=0xd bits] (dex_pc=0x0, native_pc_offset=0x2c, dex_register_map_offset=0x0, inline_info_offset=0xffffffff, register_mask=0x8, stack_mask=0b)
          v0: in register (3)	[entry 0]
      0x000011bc:               4883C410    	       addq rsp, 16
      0x000011c0:                     5B    	       pop rbx
      0x000011c1:                     C3    	       ret 
      0x000011c2:       65FF1425F0040000    	       call gs:[1264]  ; pTestSuspend
        StackMap [native_pc=0x11ca] [entry_size=0xd bits] (dex_pc=0x0, native_pc_offset=0x3a, dex_register_map_offset=0x2, inline_info_offset=0xffffffff, register_mask=0x40, stack_mask=0b)
          v0: in register (6)	[entry 1]
      0x000011ca:                   EBE5    	       jmp -27 (0x000011b1)
3: Lcom/netease/arttest/R$string; (offset=0x00000760) (type_idx=9) (StatusSuperclassValidated) (OatClassAllCompiled)
  0: void com.netease.arttest.R$string.<init>() (dex_method_idx=10)
    DEX CODE:
      0x0000: 7010 0d00 0000           	| invoke-direct {v0}, void java.lang.Object.<init>() // method@13
      0x0003: 0e00                     	| return-void
    OatMethodOffsets (offset=0x00000764)
      code_offset: 0x000011f0 
    OatQuickMethodHeader (offset=0x000011d8)
      vmap_table: (offset=0x00000a80)
        Optimized CodeInfo (number_of_dex_registers=1, number_of_stack_maps=3)
          StackMapEncoding (native_pc_bit_offset=0, dex_pc_bit_offset=6, dex_register_map_bit_offset=7, inline_info_bit_offset=10, register_mask_bit_offset=10, stack_mask_index_bit_offset=12, total_bit_size=13)
          DexRegisterLocationCatalog (number_of_entries=2, size_in_bytes=2)
            entry 0: in register (3)
            entry 1: in register (6)
    QuickMethodFrameInfo
      frame_size_in_bytes: 32
      core_spill_mask: 0x00010008 (r3, r16)
      fp_spill_mask: 0x00000000 
      vr_stack_locations:
      	ins: v0[sp + #40]
      	method*: v1[sp + #0]
      	outs: v0[sp + #8]
    CODE: (code_offset=0x000011f0 size_offset=0x000011ec size=60)...
      0x000011f0:       4885842400E0FFFF    	       testq rax, [rsp + -8192]
        StackMap [native_pc=0x11f8] [entry_size=0xd bits] (dex_pc=0x0, native_pc_offset=0x8, dex_register_map_offset=0xffffffff, inline_info_offset=0xffffffff, register_mask=0x0, stack_mask=0b)
      0x000011f8:                     53    	       push rbx
      0x000011f9:               4883EC10    	       subq rsp, 16
      0x000011fd:               48893C24    	       movq [rsp], rdi
      0x00001201:   6566833C250000000000    	       cmpw gs:[0], 0  ; state_and_flags
      0x0000120b:           0F8511000000    	       jnz/ne +17 (0x00001222)
      0x00001211:                 4889F3    	       movq rbx, rsi
      0x00001214:             BFA8C5A76F    	       mov edi, 1873266088
      0x00001219:                 FF5728    	       call [rdi + 40]
        StackMap [native_pc=0x121c] [entry_size=0xd bits] (dex_pc=0x0, native_pc_offset=0x2c, dex_register_map_offset=0x0, inline_info_offset=0xffffffff, register_mask=0x8, stack_mask=0b)
          v0: in register (3)	[entry 0]
      0x0000121c:               4883C410    	       addq rsp, 16
      0x00001220:                     5B    	       pop rbx
      0x00001221:                     C3    	       ret 
      0x00001222:       65FF1425F0040000    	       call gs:[1264]  ; pTestSuspend
        StackMap [native_pc=0x122a] [entry_size=0xd bits] (dex_pc=0x0, native_pc_offset=0x3a, dex_register_map_offset=0x2, inline_info_offset=0xffffffff, register_mask=0x40, stack_mask=0b)
          v0: in register (6)	[entry 1]
      0x0000122a:                   EBE5    	       jmp -27 (0x00001211)
4: Lcom/netease/arttest/R; (offset=0x00000768) (type_idx=10) (StatusInitialized) (OatClassAllCompiled)
  0: void com.netease.arttest.R.<init>() (dex_method_idx=11)
    DEX CODE:
      0x0000: 7010 0d00 0000           	| invoke-direct {v0}, void java.lang.Object.<init>() // method@13
      0x0003: 0e00                     	| return-void
    OatMethodOffsets (offset=0x0000076c)
      code_offset: 0x00001250 
    OatQuickMethodHeader (offset=0x00001238)
      vmap_table: (offset=0x00000ae0)
        Optimized CodeInfo (number_of_dex_registers=1, number_of_stack_maps=3)
          StackMapEncoding (native_pc_bit_offset=0, dex_pc_bit_offset=6, dex_register_map_bit_offset=7, inline_info_bit_offset=10, register_mask_bit_offset=10, stack_mask_index_bit_offset=12, total_bit_size=13)
          DexRegisterLocationCatalog (number_of_entries=2, size_in_bytes=2)
            entry 0: in register (3)
            entry 1: in register (6)
    QuickMethodFrameInfo
      frame_size_in_bytes: 32
      core_spill_mask: 0x00010008 (r3, r16)
      fp_spill_mask: 0x00000000 
      vr_stack_locations:
      	ins: v0[sp + #40]
      	method*: v1[sp + #0]
      	outs: v0[sp + #8]
    CODE: (code_offset=0x00001250 size_offset=0x0000124c size=60)...
      0x00001250:       4885842400E0FFFF    	       testq rax, [rsp + -8192]
        StackMap [native_pc=0x1258] [entry_size=0xd bits] (dex_pc=0x0, native_pc_offset=0x8, dex_register_map_offset=0xffffffff, inline_info_offset=0xffffffff, register_mask=0x0, stack_mask=0b)
      0x00001258:                     53    	       push rbx
      0x00001259:               4883EC10    	       subq rsp, 16
      0x0000125d:               48893C24    	       movq [rsp], rdi
      0x00001261:   6566833C250000000000    	       cmpw gs:[0], 0  ; state_and_flags
      0x0000126b:           0F8511000000    	       jnz/ne +17 (0x00001282)
      0x00001271:                 4889F3    	       movq rbx, rsi
      0x00001274:             BFA8C5A76F    	       mov edi, 1873266088
      0x00001279:                 FF5728    	       call [rdi + 40]
        StackMap [native_pc=0x127c] [entry_size=0xd bits] (dex_pc=0x0, native_pc_offset=0x2c, dex_register_map_offset=0x0, inline_info_offset=0xffffffff, register_mask=0x8, stack_mask=0b)
          v0: in register (3)	[entry 0]
      0x0000127c:               4883C410    	       addq rsp, 16
      0x00001280:                     5B    	       pop rbx
      0x00001281:                     C3    	       ret 
      0x00001282:       65FF1425F0040000    	       call gs:[1264]  ; pTestSuspend
        StackMap [native_pc=0x128a] [entry_size=0xd bits] (dex_pc=0x0, native_pc_offset=0x3a, dex_register_map_offset=0x2, inline_info_offset=0xffffffff, register_mask=0x40, stack_mask=0b)
          v0: in register (6)	[entry 1]
      0x0000128a:                   EBE5    	       jmp -27 (0x00001271)

OAT FILE STATS:
Dumping cumulative use of 705 accounted bytes
Code                             =      437 (62% of total)
QuickMethodHeader                =      168 (24% of total)
CodeInfoEncoding                 =       38 ( 5% of total)
CodeInfoLocationCatalog          =       12 ( 2% of total)
CodeInfoDexRegisterMap           =       19 ( 3% of total)
CodeInfoStackMasks               =        0 ( 0% of total)
CodeInfoRegisterMasks            =        9 ( 1% of total)
CodeInfoInvokeInfo               =        0 ( 0% of total)
CodeInfoStackMap                 =       22 ( 3% of total)
  StackMapNativePc               =        9 (41% of stack map)
  StackMapDexPcEncoding          =        3 (17% of stack map)
  StackMapDexRegisterMap         =        4 (21% of stack map)
  StackMapInlineInfoIndex        =        0 ( 0% of stack map)
  StackMapRegisterMaskIndex      =        3 (15% of stack map)
  StackMapStackMaskIndex         =        1 ( 6% of stack map)
CodeInfoInlineInfo               =        0 ( 0% of total)
  InlineInfoMethodIndexIdx       =        0 (-nan% of inline info)
  InlineInfoDexPc                =        3 (inf% of inline info)
  InlineInfoExtraData            =        0 (-nan% of inline info)
  InlineInfoDexRegisterMap       =        0 (-nan% of inline info)
  InlineInfoIsLast               =        0 (-nan% of inline info)

