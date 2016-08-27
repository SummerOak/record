
base.odex:     file format elf64-x86-64


Disassembly of section .rodata:

0000000000001000 <oatdata>:
    1000:	6f                   	outsl  %ds:(%rsi),(%dx)
    1001:	61                   	(bad)  
    1002:	74 0a                	je     100e <oatdata+0xe>
    1004:	31 33                	xor    %esi,(%rbx)
    1006:	31 00                	xor    %eax,(%rax)
    1008:	d0 e3                	shl    %bl
    100a:	79 d9                	jns    fe5 <oatdata-0x1b>
    100c:	05 00 00 00 00       	add    $0x0,%eax
    1011:	00 00                	add    %al,(%rax)
    1013:	00 01                	add    %al,(%rcx)
    1015:	00 00                	add    %al,(%rax)
    1017:	00 6c 03 00          	add    %ch,0x0(%rbx,%rax,1)
    101b:	00 00                	add    %al,(%rax)
    101d:	10 00                	adc    %al,(%rax)
	...
    1047:	00 67 02             	add    %ah,0x2(%rdi)
    104a:	00 00                	add    %al,(%rax)
    104c:	63 6c 61 73          	movslq 0x73(%rcx,%riz,2),%ebp
    1050:	73 70                	jae    10c2 <oatdata+0xc2>
    1052:	61                   	(bad)  
    1053:	74 68                	je     10bd <oatdata+0xbd>
    1055:	00 50 43             	add    %dl,0x43(%rax)
    1058:	4c 5b                	rex.WR pop %rbx
    105a:	5d                   	pop    %rbp
    105b:	00 63 6f             	add    %ah,0x6f(%rbx)
    105e:	6d                   	insl   (%dx),%es:(%rdi)
    105f:	70 69                	jo     10ca <oatdata+0xca>
    1061:	6c                   	insb   (%dx),%es:(%rdi)
    1062:	65 72 2d             	gs jb  1092 <oatdata+0x92>
    1065:	66 69 6c 74 65 72 00 	imul   $0x72,0x65(%rsp,%rsi,2),%bp
    106c:	65 78 74             	gs js  10e3 <oatdata+0xe3>
    106f:	72 61                	jb     10d2 <oatdata+0xd2>
    1071:	63 74 00 63          	movslq 0x63(%rax,%rax,1),%esi
    1075:	6f                   	outsl  %ds:(%rsi),(%dx)
    1076:	6e                   	outsb  %ds:(%rsi),(%dx)
    1077:	63 75 72             	movslq 0x72(%rbp),%esi
    107a:	72 65                	jb     10e1 <oatdata+0xe1>
    107c:	6e                   	outsb  %ds:(%rsi),(%dx)
    107d:	74 2d                	je     10ac <oatdata+0xac>
    107f:	63 6f 70             	movslq 0x70(%rdi),%ebp
    1082:	79 69                	jns    10ed <oatdata+0xed>
    1084:	6e                   	outsb  %ds:(%rsi),(%dx)
    1085:	67 00 74 72 75       	add    %dh,0x75(%edx,%esi,2)
    108a:	65 00 64 65 62       	add    %ah,%gs:0x62(%rbp,%riz,2)
    108f:	75 67                	jne    10f8 <oatdata+0xf8>
    1091:	67 61                	addr32 (bad) 
    1093:	62                   	(bad)  
    1094:	6c                   	insb   (%dx),%es:(%rdi)
    1095:	65 00 74 72 75       	add    %dh,%gs:0x75(%rdx,%rsi,2)
    109a:	65 00 64 65 78       	add    %ah,%gs:0x78(%rbp,%riz,2)
    109f:	32 6f 61             	xor    0x61(%rdi),%ch
    10a2:	74 2d                	je     10d1 <oatdata+0xd1>
    10a4:	63 6d 64             	movslq 0x64(%rbp),%ebp
    10a7:	6c                   	insb   (%dx),%es:(%rdi)
    10a8:	69 6e 65 00 2d 2d 7a 	imul   $0x7a2d2d00,0x65(%rsi),%ebp
    10af:	69 70 2d 66 64 3d 31 	imul   $0x313d6466,0x2d(%rax),%esi
    10b6:	34 20                	xor    $0x20,%al
    10b8:	2d 2d 7a 69 70       	sub    $0x70697a2d,%eax
    10bd:	2d 6c 6f 63 61       	sub    $0x61636f6c,%eax
    10c2:	74 69                	je     112d <oatdata+0x12d>
    10c4:	6f                   	outsl  %ds:(%rsi),(%dx)
    10c5:	6e                   	outsb  %ds:(%rsi),(%dx)
    10c6:	3d 62 61 73 65       	cmp    $0x65736162,%eax
    10cb:	2e 61                	cs (bad) 
    10cd:	70 6b                	jo     113a <oatdata+0x13a>
    10cf:	20 2d 2d 69 6e 70    	and    %ch,0x706e692d(%rip)        # 706e7a02 <oatbsslastword+0x706e5636>
    10d5:	75 74                	jne    114b <oatdata+0x14b>
    10d7:	2d 76 64 65 78       	sub    $0x78656476,%eax
    10dc:	2d 66 64 3d 31       	sub    $0x313d6466,%eax
    10e1:	36 20 2d 2d 6f 75 74 	and    %ch,%ss:0x74756f2d(%rip)        # 74758015 <oatbsslastword+0x74755c49>
    10e8:	70 75                	jo     115f <oatdata+0x15f>
    10ea:	74 2d                	je     1119 <oatdata+0x119>
    10ec:	76 64                	jbe    1152 <oatdata+0x152>
    10ee:	65 78 2d             	gs js  111e <oatdata+0x11e>
    10f1:	66 64 3d 31 36       	fs cmp $0x3631,%ax
    10f6:	20 2d 2d 6f 61 74    	and    %ch,0x74616f2d(%rip)        # 74618029 <oatbsslastword+0x74615c5d>
    10fc:	2d 66 64 3d 31       	sub    $0x313d6466,%eax
    1101:	35 20 2d 2d 6f       	xor    $0x6f2d2d20,%eax
    1106:	61                   	(bad)  
    1107:	74 2d                	je     1136 <oatdata+0x136>
    1109:	6c                   	insb   (%dx),%es:(%rdi)
    110a:	6f                   	outsl  %ds:(%rsi),(%dx)
    110b:	63 61 74             	movslq 0x74(%rcx),%esp
    110e:	69 6f 6e 3d 2f 64 61 	imul   $0x61642f3d,0x6e(%rdi),%ebp
    1115:	74 61                	je     1178 <oatdata+0x178>
    1117:	2f                   	(bad)  
    1118:	61                   	(bad)  
    1119:	70 70                	jo     118b <oatdata+0x18b>
    111b:	2f                   	(bad)  
    111c:	63 6f 6d             	movslq 0x6d(%rdi),%ebp
    111f:	2e 6e                	outsb  %cs:(%rsi),(%dx)
    1121:	65 74 65             	gs je  1189 <oatdata+0x189>
    1124:	61                   	(bad)  
    1125:	73 65                	jae    118c <oatdata+0x18c>
    1127:	2e 61                	cs (bad) 
    1129:	72 74                	jb     119f <oatdata+0x19f>
    112b:	74 65                	je     1192 <oatdata+0x192>
    112d:	73 74                	jae    11a3 <oatdata+0x1a3>
    112f:	2d 6d 6f 76 55       	sub    $0x55766f6d,%eax
    1134:	33 58 76             	xor    0x76(%rax),%ebx
    1137:	34 77                	xor    $0x77,%al
    1139:	32 58 4e             	xor    0x4e(%rax),%bl
    113c:	43 2d 50 35 6f 41    	rex.XB sub $0x416f3550,%eax
    1142:	36 65 77 51          	ss gs ja 1197 <oatdata+0x197>
    1146:	3d 3d 2f 6f 61       	cmp    $0x616f2f3d,%eax
    114b:	74 2f                	je     117c <oatdata+0x17c>
    114d:	78 38                	js     1187 <oatdata+0x187>
    114f:	36 5f                	ss pop %rdi
    1151:	36 34 2f             	ss xor $0x2f,%al
    1154:	62 61                	(bad)  
    1156:	73 65                	jae    11bd <oatdata+0x1bd>
    1158:	2e 6f                	outsl  %cs:(%rsi),(%dx)
    115a:	64 65 78 20          	fs gs js 117e <oatdata+0x17e>
    115e:	2d 2d 69 6e 73       	sub    $0x736e692d,%eax
    1163:	74 72                	je     11d7 <oatdata+0x1d7>
    1165:	75 63                	jne    11ca <oatdata+0x1ca>
    1167:	74 69                	je     11d2 <oatdata+0x1d2>
    1169:	6f                   	outsl  %ds:(%rsi),(%dx)
    116a:	6e                   	outsb  %ds:(%rsi),(%dx)
    116b:	2d 73 65 74 3d       	sub    $0x3d746573,%eax
    1170:	78 38                	js     11aa <oatdata+0x1aa>
    1172:	36 5f                	ss pop %rdi
    1174:	36 34 20             	ss xor $0x20,%al
    1177:	2d 2d 69 6e 73       	sub    $0x736e692d,%eax
    117c:	74 72                	je     11f0 <oatdata+0x1f0>
    117e:	75 63                	jne    11e3 <oatdata+0x1e3>
    1180:	74 69                	je     11eb <oatdata+0x1eb>
    1182:	6f                   	outsl  %ds:(%rsi),(%dx)
    1183:	6e                   	outsb  %ds:(%rsi),(%dx)
    1184:	2d 73 65 74 2d       	sub    $0x2d746573,%eax
    1189:	76 61                	jbe    11ec <oatdata+0x1ec>
    118b:	72 69                	jb     11f6 <oatdata+0x1f6>
    118d:	61                   	(bad)  
    118e:	6e                   	outsb  %ds:(%rsi),(%dx)
    118f:	74 3d                	je     11ce <oatdata+0x1ce>
    1191:	78 38                	js     11cb <oatdata+0x1cb>
    1193:	36 5f                	ss pop %rdi
    1195:	36 34 20             	ss xor $0x20,%al
    1198:	2d 2d 69 6e 73       	sub    $0x736e692d,%eax
    119d:	74 72                	je     1211 <oatdata+0x211>
    119f:	75 63                	jne    1204 <oatdata+0x204>
    11a1:	74 69                	je     120c <oatdata+0x20c>
    11a3:	6f                   	outsl  %ds:(%rsi),(%dx)
    11a4:	6e                   	outsb  %ds:(%rsi),(%dx)
    11a5:	2d 73 65 74 2d       	sub    $0x2d746573,%eax
    11aa:	66 65 61             	data16 gs (bad) 
    11ad:	74 75                	je     1224 <oatdata+0x224>
    11af:	72 65                	jb     1216 <oatdata+0x216>
    11b1:	73 3d                	jae    11f0 <oatdata+0x1f0>
    11b3:	64 65 66 61          	fs gs data16 (bad) 
    11b7:	75 6c                	jne    1225 <oatdata+0x225>
    11b9:	74 20                	je     11db <oatdata+0x1db>
    11bb:	2d 2d 72 75 6e       	sub    $0x6e75722d,%eax
    11c0:	74 69                	je     122b <oatdata+0x22b>
    11c2:	6d                   	insl   (%dx),%es:(%rdi)
    11c3:	65 2d 61 72 67 20    	gs sub $0x20677261,%eax
    11c9:	2d 58 6d 73 36       	sub    $0x36736d58,%eax
    11ce:	34 6d                	xor    $0x6d,%al
    11d0:	20 2d 2d 72 75 6e    	and    %ch,0x6e75722d(%rip)        # 6e758403 <oatbsslastword+0x6e756037>
    11d6:	74 69                	je     1241 <oatdata+0x241>
    11d8:	6d                   	insl   (%dx),%es:(%rdi)
    11d9:	65 2d 61 72 67 20    	gs sub $0x20677261,%eax
    11df:	2d 58 6d 78 35       	sub    $0x35786d58,%eax
    11e4:	31 32                	xor    %esi,(%rdx)
    11e6:	6d                   	insl   (%dx),%es:(%rdi)
    11e7:	20 2d 2d 63 6f 6d    	and    %ch,0x6d6f632d(%rip)        # 6d6f751a <oatbsslastword+0x6d6f514e>
    11ed:	70 69                	jo     1258 <oatdata+0x258>
    11ef:	6c                   	insb   (%dx),%es:(%rdi)
    11f0:	65 72 2d             	gs jb  1220 <oatdata+0x220>
    11f3:	66 69 6c 74 65 72 3d 	imul   $0x3d72,0x65(%rsp,%rsi,2),%bp
    11fa:	65 78 74             	gs js  1271 <oatdata+0x271>
    11fd:	72 61                	jb     1260 <oatdata+0x260>
    11ff:	63 74 20 2d          	movslq 0x2d(%rax,%riz,1),%esi
    1203:	2d 73 77 61 70       	sub    $0x70617773,%eax
    1208:	2d 66 64 3d 31       	sub    $0x313d6466,%eax
    120d:	37                   	(bad)  
    120e:	20 2d 2d 64 65 62    	and    %ch,0x6265642d(%rip)        # 62657641 <oatbsslastword+0x62655275>
    1214:	75 67                	jne    127d <oatdata+0x27d>
    1216:	67 61                	addr32 (bad) 
    1218:	62                   	(bad)  
    1219:	6c                   	insb   (%dx),%es:(%rdi)
    121a:	65 20 2d 2d 63 6c 61 	and    %ch,%gs:0x616c632d(%rip)        # 616c754e <oatbsslastword+0x616c5182>
    1221:	73 73                	jae    1296 <oatdata+0x296>
    1223:	70 61                	jo     1286 <oatdata+0x286>
    1225:	74 68                	je     128f <oatdata+0x28f>
    1227:	2d 64 69 72 3d       	sub    $0x3d726964,%eax
    122c:	2f                   	(bad)  
    122d:	64 61                	fs (bad) 
    122f:	74 61                	je     1292 <oatdata+0x292>
    1231:	2f                   	(bad)  
    1232:	61                   	(bad)  
    1233:	70 70                	jo     12a5 <oatdata+0x2a5>
    1235:	2f                   	(bad)  
    1236:	63 6f 6d             	movslq 0x6d(%rdi),%ebp
    1239:	2e 6e                	outsb  %cs:(%rsi),(%dx)
    123b:	65 74 65             	gs je  12a3 <oatdata+0x2a3>
    123e:	61                   	(bad)  
    123f:	73 65                	jae    12a6 <oatdata+0x2a6>
    1241:	2e 61                	cs (bad) 
    1243:	72 74                	jb     12b9 <oatdata+0x2b9>
    1245:	74 65                	je     12ac <oatdata+0x2ac>
    1247:	73 74                	jae    12bd <oatdata+0x2bd>
    1249:	2d 6d 6f 76 55       	sub    $0x55766f6d,%eax
    124e:	33 58 76             	xor    0x76(%rax),%ebx
    1251:	34 77                	xor    $0x77,%al
    1253:	32 58 4e             	xor    0x4e(%rax),%bl
    1256:	43 2d 50 35 6f 41    	rex.XB sub $0x416f3550,%eax
    125c:	36 65 77 51          	ss gs ja 12b1 <oatdata+0x2b1>
    1260:	3d 3d 20 2d 2d       	cmp    $0x2d2d203d,%eax
    1265:	63 6c 61 73          	movslq 0x73(%rcx,%riz,2),%ebp
    1269:	73 2d                	jae    1298 <oatdata+0x298>
    126b:	6c                   	insb   (%dx),%es:(%rdi)
    126c:	6f                   	outsl  %ds:(%rsi),(%dx)
    126d:	61                   	(bad)  
    126e:	64 65 72 2d          	fs gs jb 129f <oatdata+0x29f>
    1272:	63 6f 6e             	movslq 0x6e(%rdi),%ebp
    1275:	74 65                	je     12dc <oatdata+0x2dc>
    1277:	78 74                	js     12ed <oatdata+0x2ed>
    1279:	3d 50 43 4c 5b       	cmp    $0x5b4c4350,%eax
    127e:	5d                   	pop    %rbp
    127f:	00 64 65 78          	add    %ah,0x78(%rbp,%riz,2)
    1283:	32 6f 61             	xor    0x61(%rdi),%ch
    1286:	74 2d                	je     12b5 <oatdata+0x2b5>
    1288:	68 6f 73 74 00       	pushq  $0x74736f
    128d:	58                   	pop    %rax
    128e:	38 36                	cmp    %dh,(%rsi)
    1290:	00 6e 61             	add    %ch,0x61(%rsi)
    1293:	74 69                	je     12fe <oatdata+0x2fe>
    1295:	76 65                	jbe    12fc <oatdata+0x2fc>
    1297:	2d 64 65 62 75       	sub    $0x75626564,%eax
    129c:	67 67 61             	addr32 addr32 (bad) 
    129f:	62                   	(bad)  
    12a0:	6c                   	insb   (%dx),%es:(%rdi)
    12a1:	65 00 66 61          	add    %ah,%gs:0x61(%rsi)
    12a5:	6c                   	insb   (%dx),%es:(%rdi)
    12a6:	73 65                	jae    130d <oatdata+0x30d>
    12a8:	00 70 69             	add    %dh,0x69(%rax)
    12ab:	63 00                	movslq (%rax),%eax
    12ad:	66 61                	data16 (bad) 
    12af:	6c                   	insb   (%dx),%es:(%rdi)
    12b0:	73 65                	jae    1317 <oatdata+0x317>
    12b2:	00 00                	add    %al,(%rax)
    12b4:	5e                   	pop    %rsi
    12b5:	05 00 00 03 62       	add    $0x62030000,%eax
    12ba:	00 00                	add    %al,(%rax)
    12bc:	7e 05                	jle    12c3 <oatdata+0x2c3>
    12be:	00 00                	add    %al,(%rax)
    12c0:	24 e1                	and    $0xe1,%al
	...
    12ca:	00 00                	add    %al,(%rax)
    12cc:	f5                   	cmc    
    12cd:	04 00                	add    $0x0,%al
    12cf:	00 00                	add    %al,(%rax)
    12d1:	14 01                	adc    $0x1,%al
    12d3:	00 18                	add    %bl,(%rax)
    12d5:	05 00 00 39 b7       	add    $0xb7390000,%eax
    12da:	01 00                	add    %eax,(%rax)
    12dc:	3c 05                	cmp    $0x5,%al
    12de:	00 00                	add    %al,(%rax)
    12e0:	92                   	xchg   %eax,%edx
    12e1:	3d 00 00 00 00       	cmp    $0x0,%eax
	...
    1342:	00 00                	add    %al,(%rax)
    1344:	58                   	pop    %rax
    1345:	03 00                	add    (%rax),%eax
    1347:	00 5c 03 00          	add    %bl,0x0(%rbx,%rax,1)
    134b:	00 60 03             	add    %ah,0x3(%rax)
    134e:	00 00                	add    %al,(%rax)
    1350:	64 03 00             	add    %fs:(%rax),%eax
    1353:	00 68 03             	add    %ch,0x3(%rax)
    1356:	00 00                	add    %al,(%rax)
    1358:	00 00                	add    %al,(%rax)
    135a:	02 00                	add    (%rax),%al
    135c:	00 00                	add    %al,(%rax)
    135e:	02 00                	add    (%rax),%al
    1360:	00 00                	add    %al,(%rax)
    1362:	02 00                	add    (%rax),%al
    1364:	00 00                	add    %al,(%rax)
    1366:	02 00                	add    (%rax),%al
    1368:	00 00                	add    %al,(%rax)
    136a:	02 00                	add    (%rax),%al
    136c:	08 00                	or     %al,(%rax)
    136e:	00 00                	add    %al,(%rax)
    1370:	62 61                	(bad)  
    1372:	73 65                	jae    13d9 <oatdata+0x3d9>
    1374:	2e 61                	cs (bad) 
    1376:	70 6b                	jo     13e3 <oatdata+0x3e3>
    1378:	d1 40 23             	roll   0x23(%rax)
    137b:	52                   	push   %rdx
    137c:	1c 00                	sbb    $0x0,%al
    137e:	00 00                	add    %al,(%rax)
    1380:	44 03 00             	add    (%rax),%r8d
    1383:	00 b4 02 00 00 f4 02 	add    %dh,0x2f40000(%rdx,%rax,1)
	...

0000000000001ffc <oatlastword>:
    1ffc:	00 00                	add    %al,(%rax)
	...

Disassembly of section .bss:

0000000000002000 <.bss>:
	...

Disassembly of section .dynsym:

0000000000003038 <.dynsym>:
	...
    3050:	01 00                	add    %eax,(%rax)
    3052:	00 00                	add    %al,(%rax)
    3054:	11 00                	adc    %eax,(%rax)
    3056:	01 00                	add    %eax,(%rax)
    3058:	00 10                	add    %dl,(%rax)
    305a:	00 00                	add    %al,(%rax)
    305c:	00 00                	add    %al,(%rax)
    305e:	00 00                	add    %al,(%rax)
    3060:	00 10                	add    %dl,(%rax)
    3062:	00 00                	add    %al,(%rax)
    3064:	00 00                	add    %al,(%rax)
    3066:	00 00                	add    %al,(%rax)
    3068:	09 00                	or     %eax,(%rax)
    306a:	00 00                	add    %al,(%rax)
    306c:	11 00                	adc    %eax,(%rax)
    306e:	01 00                	add    %eax,(%rax)
    3070:	fc                   	cld    
    3071:	1f                   	(bad)  
    3072:	00 00                	add    %al,(%rax)
    3074:	00 00                	add    %al,(%rax)
    3076:	00 00                	add    %al,(%rax)
    3078:	04 00                	add    $0x0,%al
    307a:	00 00                	add    %al,(%rax)
    307c:	00 00                	add    %al,(%rax)
    307e:	00 00                	add    %al,(%rax)
    3080:	15 00 00 00 11       	adc    $0x11000000,%eax
    3085:	00 02                	add    %al,(%rdx)
    3087:	00 00                	add    %al,(%rax)
    3089:	20 00                	and    %al,(%rax)
    308b:	00 00                	add    %al,(%rax)
    308d:	00 00                	add    %al,(%rax)
    308f:	00 d0                	add    %dl,%al
    3091:	03 00                	add    (%rax),%eax
    3093:	00 00                	add    %al,(%rax)
    3095:	00 00                	add    %al,(%rax)
    3097:	00 1c 00             	add    %bl,(%rax,%rax,1)
    309a:	00 00                	add    %al,(%rax)
    309c:	11 00                	adc    %eax,(%rax)
    309e:	02 00                	add    (%rax),%al
    30a0:	cc                   	int3   
    30a1:	23 00                	and    (%rax),%eax
    30a3:	00 00                	add    %al,(%rax)
    30a5:	00 00                	add    %al,(%rax)
    30a7:	00 04 00             	add    %al,(%rax,%rax,1)
    30aa:	00 00                	add    %al,(%rax)
    30ac:	00 00                	add    %al,(%rax)
	...

Disassembly of section .dynstr:

0000000000003000 <.dynstr>:
    3000:	00 6f 61             	add    %ch,0x61(%rdi)
    3003:	74 64                	je     3069 <oatbsslastword+0xc9d>
    3005:	61                   	(bad)  
    3006:	74 61                	je     3069 <oatbsslastword+0xc9d>
    3008:	00 6f 61             	add    %ch,0x61(%rdi)
    300b:	74 6c                	je     3079 <oatbsslastword+0xcad>
    300d:	61                   	(bad)  
    300e:	73 74                	jae    3084 <oatbsslastword+0xcb8>
    3010:	77 6f                	ja     3081 <oatbsslastword+0xcb5>
    3012:	72 64                	jb     3078 <oatbsslastword+0xcac>
    3014:	00 6f 61             	add    %ch,0x61(%rdi)
    3017:	74 62                	je     307b <oatbsslastword+0xcaf>
    3019:	73 73                	jae    308e <oatbsslastword+0xcc2>
    301b:	00 6f 61             	add    %ch,0x61(%rdi)
    301e:	74 62                	je     3082 <oatbsslastword+0xcb6>
    3020:	73 73                	jae    3095 <oatbsslastword+0xcc9>
    3022:	6c                   	insb   (%dx),%es:(%rdi)
    3023:	61                   	(bad)  
    3024:	73 74                	jae    309a <oatbsslastword+0xcce>
    3026:	77 6f                	ja     3097 <oatbsslastword+0xccb>
    3028:	72 64                	jb     308e <oatbsslastword+0xcc2>
    302a:	00 62 61             	add    %ah,0x61(%rdx)
    302d:	73 65                	jae    3094 <oatbsslastword+0xcc8>
    302f:	2e 6f                	outsl  %cs:(%rsi),(%dx)
    3031:	64 65 78 00          	fs gs js 3035 <oatbsslastword+0xc69>

Disassembly of section .hash:

00000000000030b0 <.hash>:
    30b0:	01 00                	add    %eax,(%rax)
    30b2:	00 00                	add    %al,(%rax)
    30b4:	05 00 00 00 01       	add    $0x1000000,%eax
    30b9:	00 00                	add    %al,(%rax)
    30bb:	00 00                	add    %al,(%rax)
    30bd:	00 00                	add    %al,(%rax)
    30bf:	00 02                	add    %al,(%rdx)
    30c1:	00 00                	add    %al,(%rax)
    30c3:	00 03                	add    %al,(%rbx)
    30c5:	00 00                	add    %al,(%rax)
    30c7:	00 04 00             	add    %al,(%rax,%rax,1)
    30ca:	00 00                	add    %al,(%rax)
    30cc:	00 00                	add    %al,(%rax)
	...

Disassembly of section .dynamic:

0000000000004000 <.dynamic>:
    4000:	04 00                	add    $0x0,%al
    4002:	00 00                	add    %al,(%rax)
    4004:	00 00                	add    %al,(%rax)
    4006:	00 00                	add    %al,(%rax)
    4008:	b0 30                	mov    $0x30,%al
    400a:	00 00                	add    %al,(%rax)
    400c:	00 00                	add    %al,(%rax)
    400e:	00 00                	add    %al,(%rax)
    4010:	05 00 00 00 00       	add    $0x0,%eax
    4015:	00 00                	add    %al,(%rax)
    4017:	00 00                	add    %al,(%rax)
    4019:	30 00                	xor    %al,(%rax)
    401b:	00 00                	add    %al,(%rax)
    401d:	00 00                	add    %al,(%rax)
    401f:	00 06                	add    %al,(%rsi)
    4021:	00 00                	add    %al,(%rax)
    4023:	00 00                	add    %al,(%rax)
    4025:	00 00                	add    %al,(%rax)
    4027:	00 38                	add    %bh,(%rax)
    4029:	30 00                	xor    %al,(%rax)
    402b:	00 00                	add    %al,(%rax)
    402d:	00 00                	add    %al,(%rax)
    402f:	00 0b                	add    %cl,(%rbx)
    4031:	00 00                	add    %al,(%rax)
    4033:	00 00                	add    %al,(%rax)
    4035:	00 00                	add    %al,(%rax)
    4037:	00 18                	add    %bl,(%rax)
    4039:	00 00                	add    %al,(%rax)
    403b:	00 00                	add    %al,(%rax)
    403d:	00 00                	add    %al,(%rax)
    403f:	00 0a                	add    %cl,(%rdx)
    4041:	00 00                	add    %al,(%rax)
    4043:	00 00                	add    %al,(%rax)
    4045:	00 00                	add    %al,(%rax)
    4047:	00 35 00 00 00 00    	add    %dh,0x0(%rip)        # 404d <oatbsslastword+0x1c81>
    404d:	00 00                	add    %al,(%rax)
    404f:	00 0e                	add    %cl,(%rsi)
    4051:	00 00                	add    %al,(%rax)
    4053:	00 00                	add    %al,(%rax)
    4055:	00 00                	add    %al,(%rax)
    4057:	00 2b                	add    %ch,(%rbx)
	...
