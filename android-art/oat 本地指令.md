#### oat 本地指令
	
```
 protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    TextView t = new TextView(this);
    t.setTextSize(33);
    t.setText("Hello ART");
    setContentView(t);

    new ImplClass().absMethod(1, TAG, "hello art~");
}
```
最终dex2oat 后， 它的本地指令如下，比较多，省略了中间部分：

```
0x00002104: f5ad5c00	sub     r12, sp, #8192
0x00002108: f8dcc000	ldr.w   r12, [r12, #0]

0x0000210c: e92d4de0	push    {r5, r6, r7, r8, r10, r11, lr}
0x00002110: b08d    	sub     sp, sp, #52
0x00002112: 9000    	str     r0, [sp, #0]
0x00002114: f8b9c000	ldrh.w  r12, [r9, #0]  ; state_and_flags
0x00002118: f1bc0f00	cmp.w   r12, #0
0x0000211c: d15d    	bne     +186 (0x000021da)
0x0000211e: 4605    	mov     r5, r0
0x00002120: 460e    	mov     r6, r1
0x00002122: 4617    	mov     r7, r2
0x00002124: 6968    	ldr     r0, [r5, #20]
0x00002126: 6840    	ldr     r0, [r0, #4]
0x00002128: f8d0e020	ldr.w   lr, [r0, #32]
0x0000212c: 47f0    	blx     lr
0x0000212e: 4629    	mov     r1, r5
0x00002130: 2007    	movs    r0, #7
0x00002132: f8d9e11c	ldr.w   lr, [r9, #284]  ; pAllocObject
0x00002136: 47f0    	blx     lr
...
0x00002210: 4683    	mov     r11, r0
0x00002212: 9b05    	ldr     r3, [sp, #20]
0x00002214: e7d3    	b       -90 (0x000021be)
```

