
base.odex:     file format elf64-x86-64


Disassembly of section .rodata:

0000000000001000 <oatdata>:
    1000:	6f                   	outsl  %ds:(%rsi),(%dx)
    1001:	61                   	(bad)  
    1002:	74 0a                	je     100e <oatdata+0xe>
    1004:	31 33                	xor    %esi,(%rbx)
    1006:	31 00                	xor    %eax,(%rax)
    1008:	ac                   	lods   %ds:(%rsi),%al
    1009:	55                   	push   %rbp
    100a:	72 d2                	jb     fde <oatdata-0x22>
    100c:	05 00 00 00 00       	add    $0x0,%eax
    1011:	00 00                	add    %al,(%rax)
    1013:	00 01                	add    %al,(%rcx)
    1015:	00 00                	add    %al,(%rax)
    1017:	00 54 07 00          	add    %dl,0x0(%rdi,%rax,1)
    101b:	00 00                	add    %al,(%rax)
    101d:	10 00                	adc    %al,(%rax)
	...
    103b:	00 00                	add    %al,(%rax)
    103d:	d0                   	(bad)  
    103e:	f6 ff                	idiv   %bh
    1040:	ce                   	(bad)  
    1041:	0e                   	(bad)  
    1042:	4c 27                	rex.WR (bad) 
    1044:	00 90 9c 70 50 06    	add    %dl,0x650709c(%rax)
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
    106c:	71 75                	jno    10e3 <oatdata+0xe3>
    106e:	69 63 6b 65 6e 00 63 	imul   $0x63006e65,0x6b(%rbx),%esp
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
    10dc:	2d 66 64 3d 2d       	sub    $0x2d3d6466,%eax
    10e1:	31 20                	xor    %esp,(%rax)
    10e3:	2d 2d 6f 75 74       	sub    $0x74756f2d,%eax
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
    112f:	2d 55 58 6d 7a       	sub    $0x7a6d5855,%eax
    1134:	51                   	push   %rcx
    1135:	74 58                	je     118f <oatdata+0x18f>
    1137:	4a 5a                	rex.WX pop %rdx
    1139:	54                   	push   %rsp
    113a:	71 52                	jno    118e <oatdata+0x18e>
    113c:	53                   	push   %rbx
    113d:	55                   	push   %rbp
    113e:	4e 6a 43             	rex.WRX pushq $0x43
    1141:	6b 52 31 41          	imul   $0x41,0x31(%rdx),%edx
    1145:	51                   	push   %rcx
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
    11fa:	71 75                	jno    1271 <oatdata+0x271>
    11fc:	69 63 6b 65 6e 20 2d 	imul   $0x2d206e65,0x6b(%rbx),%esp
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
    1249:	2d 55 58 6d 7a       	sub    $0x7a6d5855,%eax
    124e:	51                   	push   %rcx
    124f:	74 58                	je     12a9 <oatdata+0x2a9>
    1251:	4a 5a                	rex.WX pop %rdx
    1253:	54                   	push   %rsp
    1254:	71 52                	jno    12a8 <oatdata+0x2a8>
    1256:	53                   	push   %rbx
    1257:	55                   	push   %rbp
    1258:	4e 6a 43             	rex.WRX pushq $0x43
    125b:	6b 52 31 41          	imul   $0x41,0x31(%rdx),%edx
    125f:	51                   	push   %rcx
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
    1290:	00 69 6d             	add    %ch,0x6d(%rcx)
    1293:	61                   	(bad)  
    1294:	67 65 2d 6c 6f 63 61 	addr32 gs sub $0x61636f6c,%eax
    129b:	74 69                	je     1306 <oatdata+0x306>
    129d:	6f                   	outsl  %ds:(%rsi),(%dx)
    129e:	6e                   	outsb  %ds:(%rsi),(%dx)
    129f:	00 2f                	add    %ch,(%rdi)
    12a1:	64 61                	fs (bad) 
    12a3:	74 61                	je     1306 <oatdata+0x306>
    12a5:	2f                   	(bad)  
    12a6:	64 61                	fs (bad) 
    12a8:	6c                   	insb   (%dx),%es:(%rdi)
    12a9:	76 69                	jbe    1314 <oatdata+0x314>
    12ab:	6b 2d 63 61 63 68 65 	imul   $0x65,0x68636163(%rip),%ebp        # 68637415 <oatbsslastword+0x68635049>
    12b2:	2f                   	(bad)  
    12b3:	78 38                	js     12ed <oatdata+0x2ed>
    12b5:	36 5f                	ss pop %rdi
    12b7:	36 34 2f             	ss xor $0x2f,%al
    12ba:	73 79                	jae    1335 <oatdata+0x335>
    12bc:	73 74                	jae    1332 <oatdata+0x332>
    12be:	65 6d                	gs insl (%dx),%es:(%rdi)
    12c0:	40                   	rex
    12c1:	66 72 61             	data16 jb 1325 <oatdata+0x325>
    12c4:	6d                   	insl   (%dx),%es:(%rdi)
    12c5:	65 77 6f             	gs ja  1337 <oatdata+0x337>
    12c8:	72 6b                	jb     1335 <oatdata+0x335>
    12ca:	40 62                	rex (bad) 
    12cc:	6f                   	outsl  %ds:(%rsi),(%dx)
    12cd:	6f                   	outsl  %ds:(%rsi),(%dx)
    12ce:	74 2e                	je     12fe <oatdata+0x2fe>
    12d0:	61                   	(bad)  
    12d1:	72 74                	jb     1347 <oatdata+0x347>
    12d3:	3a 2f                	cmp    (%rdi),%ch
    12d5:	64 61                	fs (bad) 
    12d7:	74 61                	je     133a <oatdata+0x33a>
    12d9:	2f                   	(bad)  
    12da:	64 61                	fs (bad) 
    12dc:	6c                   	insb   (%dx),%es:(%rdi)
    12dd:	76 69                	jbe    1348 <oatdata+0x348>
    12df:	6b 2d 63 61 63 68 65 	imul   $0x65,0x68636163(%rip),%ebp        # 68637449 <oatbsslastword+0x6863507d>
    12e6:	2f                   	(bad)  
    12e7:	78 38                	js     1321 <oatdata+0x321>
    12e9:	36 5f                	ss pop %rdi
    12eb:	36 34 2f             	ss xor $0x2f,%al
    12ee:	73 79                	jae    1369 <oatdata+0x369>
    12f0:	73 74                	jae    1366 <oatdata+0x366>
    12f2:	65 6d                	gs insl (%dx),%es:(%rdi)
    12f4:	40                   	rex
    12f5:	66 72 61             	data16 jb 1359 <oatdata+0x359>
    12f8:	6d                   	insl   (%dx),%es:(%rdi)
    12f9:	65 77 6f             	gs ja  136b <oatdata+0x36b>
    12fc:	72 6b                	jb     1369 <oatdata+0x369>
    12fe:	40 62                	rex (bad) 
    1300:	6f                   	outsl  %ds:(%rsi),(%dx)
    1301:	6f                   	outsl  %ds:(%rsi),(%dx)
    1302:	74 2d                	je     1331 <oatdata+0x331>
    1304:	63 6f 72             	movslq 0x72(%rdi),%ebp
    1307:	65 2d 6c 69 62 61    	gs sub $0x6162696c,%eax
    130d:	72 74                	jb     1383 <oatdata+0x383>
    130f:	2e 61                	cs (bad) 
    1311:	72 74                	jb     1387 <oatdata+0x387>
    1313:	3a 2f                	cmp    (%rdi),%ch
    1315:	64 61                	fs (bad) 
    1317:	74 61                	je     137a <oatdata+0x37a>
    1319:	2f                   	(bad)  
    131a:	64 61                	fs (bad) 
    131c:	6c                   	insb   (%dx),%es:(%rdi)
    131d:	76 69                	jbe    1388 <oatdata+0x388>
    131f:	6b 2d 63 61 63 68 65 	imul   $0x65,0x68636163(%rip),%ebp        # 68637489 <oatbsslastword+0x686350bd>
    1326:	2f                   	(bad)  
    1327:	78 38                	js     1361 <oatdata+0x361>
    1329:	36 5f                	ss pop %rdi
    132b:	36 34 2f             	ss xor $0x2f,%al
    132e:	73 79                	jae    13a9 <oatdata+0x3a9>
    1330:	73 74                	jae    13a6 <oatdata+0x3a6>
    1332:	65 6d                	gs insl (%dx),%es:(%rdi)
    1334:	40                   	rex
    1335:	66 72 61             	data16 jb 1399 <oatdata+0x399>
    1338:	6d                   	insl   (%dx),%es:(%rdi)
    1339:	65 77 6f             	gs ja  13ab <oatdata+0x3ab>
    133c:	72 6b                	jb     13a9 <oatdata+0x3a9>
    133e:	40 62                	rex (bad) 
    1340:	6f                   	outsl  %ds:(%rsi),(%dx)
    1341:	6f                   	outsl  %ds:(%rsi),(%dx)
    1342:	74 2d                	je     1371 <oatdata+0x371>
    1344:	63 6f 6e             	movslq 0x6e(%rdi),%ebp
    1347:	73 63                	jae    13ac <oatdata+0x3ac>
    1349:	72 79                	jb     13c4 <oatdata+0x3c4>
    134b:	70 74                	jo     13c1 <oatdata+0x3c1>
    134d:	2e 61                	cs (bad) 
    134f:	72 74                	jb     13c5 <oatdata+0x3c5>
    1351:	3a 2f                	cmp    (%rdi),%ch
    1353:	64 61                	fs (bad) 
    1355:	74 61                	je     13b8 <oatdata+0x3b8>
    1357:	2f                   	(bad)  
    1358:	64 61                	fs (bad) 
    135a:	6c                   	insb   (%dx),%es:(%rdi)
    135b:	76 69                	jbe    13c6 <oatdata+0x3c6>
    135d:	6b 2d 63 61 63 68 65 	imul   $0x65,0x68636163(%rip),%ebp        # 686374c7 <oatbsslastword+0x686350fb>
    1364:	2f                   	(bad)  
    1365:	78 38                	js     139f <oatdata+0x39f>
    1367:	36 5f                	ss pop %rdi
    1369:	36 34 2f             	ss xor $0x2f,%al
    136c:	73 79                	jae    13e7 <oatdata+0x3e7>
    136e:	73 74                	jae    13e4 <oatdata+0x3e4>
    1370:	65 6d                	gs insl (%dx),%es:(%rdi)
    1372:	40                   	rex
    1373:	66 72 61             	data16 jb 13d7 <oatdata+0x3d7>
    1376:	6d                   	insl   (%dx),%es:(%rdi)
    1377:	65 77 6f             	gs ja  13e9 <oatdata+0x3e9>
    137a:	72 6b                	jb     13e7 <oatdata+0x3e7>
    137c:	40 62                	rex (bad) 
    137e:	6f                   	outsl  %ds:(%rsi),(%dx)
    137f:	6f                   	outsl  %ds:(%rsi),(%dx)
    1380:	74 2d                	je     13af <oatdata+0x3af>
    1382:	6f                   	outsl  %ds:(%rsi),(%dx)
    1383:	6b 68 74 74          	imul   $0x74,0x74(%rax),%ebp
    1387:	70 2e                	jo     13b7 <oatdata+0x3b7>
    1389:	61                   	(bad)  
    138a:	72 74                	jb     1400 <oatdata+0x400>
    138c:	3a 2f                	cmp    (%rdi),%ch
    138e:	64 61                	fs (bad) 
    1390:	74 61                	je     13f3 <oatdata+0x3f3>
    1392:	2f                   	(bad)  
    1393:	64 61                	fs (bad) 
    1395:	6c                   	insb   (%dx),%es:(%rdi)
    1396:	76 69                	jbe    1401 <oatdata+0x401>
    1398:	6b 2d 63 61 63 68 65 	imul   $0x65,0x68636163(%rip),%ebp        # 68637502 <oatbsslastword+0x68635136>
    139f:	2f                   	(bad)  
    13a0:	78 38                	js     13da <oatdata+0x3da>
    13a2:	36 5f                	ss pop %rdi
    13a4:	36 34 2f             	ss xor $0x2f,%al
    13a7:	73 79                	jae    1422 <oatdata+0x422>
    13a9:	73 74                	jae    141f <oatdata+0x41f>
    13ab:	65 6d                	gs insl (%dx),%es:(%rdi)
    13ad:	40                   	rex
    13ae:	66 72 61             	data16 jb 1412 <oatdata+0x412>
    13b1:	6d                   	insl   (%dx),%es:(%rdi)
    13b2:	65 77 6f             	gs ja  1424 <oatdata+0x424>
    13b5:	72 6b                	jb     1422 <oatdata+0x422>
    13b7:	40 62                	rex (bad) 
    13b9:	6f                   	outsl  %ds:(%rsi),(%dx)
    13ba:	6f                   	outsl  %ds:(%rsi),(%dx)
    13bb:	74 2d                	je     13ea <oatdata+0x3ea>
    13bd:	62                   	(bad)  
    13be:	6f                   	outsl  %ds:(%rsi),(%dx)
    13bf:	75 6e                	jne    142f <oatdata+0x42f>
    13c1:	63 79 63             	movslq 0x63(%rcx),%edi
    13c4:	61                   	(bad)  
    13c5:	73 74                	jae    143b <oatdata+0x43b>
    13c7:	6c                   	insb   (%dx),%es:(%rdi)
    13c8:	65 2e 61             	gs cs (bad) 
    13cb:	72 74                	jb     1441 <oatdata+0x441>
    13cd:	3a 2f                	cmp    (%rdi),%ch
    13cf:	64 61                	fs (bad) 
    13d1:	74 61                	je     1434 <oatdata+0x434>
    13d3:	2f                   	(bad)  
    13d4:	64 61                	fs (bad) 
    13d6:	6c                   	insb   (%dx),%es:(%rdi)
    13d7:	76 69                	jbe    1442 <oatdata+0x442>
    13d9:	6b 2d 63 61 63 68 65 	imul   $0x65,0x68636163(%rip),%ebp        # 68637543 <oatbsslastword+0x68635177>
    13e0:	2f                   	(bad)  
    13e1:	78 38                	js     141b <oatdata+0x41b>
    13e3:	36 5f                	ss pop %rdi
    13e5:	36 34 2f             	ss xor $0x2f,%al
    13e8:	73 79                	jae    1463 <oatdata+0x463>
    13ea:	73 74                	jae    1460 <oatdata+0x460>
    13ec:	65 6d                	gs insl (%dx),%es:(%rdi)
    13ee:	40                   	rex
    13ef:	66 72 61             	data16 jb 1453 <oatdata+0x453>
    13f2:	6d                   	insl   (%dx),%es:(%rdi)
    13f3:	65 77 6f             	gs ja  1465 <oatdata+0x465>
    13f6:	72 6b                	jb     1463 <oatdata+0x463>
    13f8:	40 62                	rex (bad) 
    13fa:	6f                   	outsl  %ds:(%rsi),(%dx)
    13fb:	6f                   	outsl  %ds:(%rsi),(%dx)
    13fc:	74 2d                	je     142b <oatdata+0x42b>
    13fe:	61                   	(bad)  
    13ff:	70 61                	jo     1462 <oatdata+0x462>
    1401:	63 68 65             	movslq 0x65(%rax),%ebp
    1404:	2d 78 6d 6c 2e       	sub    $0x2e6c6d78,%eax
    1409:	61                   	(bad)  
    140a:	72 74                	jb     1480 <oatdata+0x480>
    140c:	3a 2f                	cmp    (%rdi),%ch
    140e:	64 61                	fs (bad) 
    1410:	74 61                	je     1473 <oatdata+0x473>
    1412:	2f                   	(bad)  
    1413:	64 61                	fs (bad) 
    1415:	6c                   	insb   (%dx),%es:(%rdi)
    1416:	76 69                	jbe    1481 <oatdata+0x481>
    1418:	6b 2d 63 61 63 68 65 	imul   $0x65,0x68636163(%rip),%ebp        # 68637582 <oatbsslastword+0x686351b6>
    141f:	2f                   	(bad)  
    1420:	78 38                	js     145a <oatdata+0x45a>
    1422:	36 5f                	ss pop %rdi
    1424:	36 34 2f             	ss xor $0x2f,%al
    1427:	73 79                	jae    14a2 <oatdata+0x4a2>
    1429:	73 74                	jae    149f <oatdata+0x49f>
    142b:	65 6d                	gs insl (%dx),%es:(%rdi)
    142d:	40                   	rex
    142e:	66 72 61             	data16 jb 1492 <oatdata+0x492>
    1431:	6d                   	insl   (%dx),%es:(%rdi)
    1432:	65 77 6f             	gs ja  14a4 <oatdata+0x4a4>
    1435:	72 6b                	jb     14a2 <oatdata+0x4a2>
    1437:	40 62                	rex (bad) 
    1439:	6f                   	outsl  %ds:(%rsi),(%dx)
    143a:	6f                   	outsl  %ds:(%rsi),(%dx)
    143b:	74 2d                	je     146a <oatdata+0x46a>
    143d:	6c                   	insb   (%dx),%es:(%rdi)
    143e:	65 67 61             	gs addr32 (bad) 
    1441:	63 79 2d             	movslq 0x2d(%rcx),%edi
    1444:	74 65                	je     14ab <oatdata+0x4ab>
    1446:	73 74                	jae    14bc <oatdata+0x4bc>
    1448:	2e 61                	cs (bad) 
    144a:	72 74                	jb     14c0 <oatdata+0x4c0>
    144c:	3a 2f                	cmp    (%rdi),%ch
    144e:	64 61                	fs (bad) 
    1450:	74 61                	je     14b3 <oatdata+0x4b3>
    1452:	2f                   	(bad)  
    1453:	64 61                	fs (bad) 
    1455:	6c                   	insb   (%dx),%es:(%rdi)
    1456:	76 69                	jbe    14c1 <oatdata+0x4c1>
    1458:	6b 2d 63 61 63 68 65 	imul   $0x65,0x68636163(%rip),%ebp        # 686375c2 <oatbsslastword+0x686351f6>
    145f:	2f                   	(bad)  
    1460:	78 38                	js     149a <oatdata+0x49a>
    1462:	36 5f                	ss pop %rdi
    1464:	36 34 2f             	ss xor $0x2f,%al
    1467:	73 79                	jae    14e2 <oatdata+0x4e2>
    1469:	73 74                	jae    14df <oatdata+0x4df>
    146b:	65 6d                	gs insl (%dx),%es:(%rdi)
    146d:	40                   	rex
    146e:	66 72 61             	data16 jb 14d2 <oatdata+0x4d2>
    1471:	6d                   	insl   (%dx),%es:(%rdi)
    1472:	65 77 6f             	gs ja  14e4 <oatdata+0x4e4>
    1475:	72 6b                	jb     14e2 <oatdata+0x4e2>
    1477:	40 62                	rex (bad) 
    1479:	6f                   	outsl  %ds:(%rsi),(%dx)
    147a:	6f                   	outsl  %ds:(%rsi),(%dx)
    147b:	74 2d                	je     14aa <oatdata+0x4aa>
    147d:	65 78 74             	gs js  14f4 <oatdata+0x4f4>
    1480:	2e 61                	cs (bad) 
    1482:	72 74                	jb     14f8 <oatdata+0x4f8>
    1484:	3a 2f                	cmp    (%rdi),%ch
    1486:	64 61                	fs (bad) 
    1488:	74 61                	je     14eb <oatdata+0x4eb>
    148a:	2f                   	(bad)  
    148b:	64 61                	fs (bad) 
    148d:	6c                   	insb   (%dx),%es:(%rdi)
    148e:	76 69                	jbe    14f9 <oatdata+0x4f9>
    1490:	6b 2d 63 61 63 68 65 	imul   $0x65,0x68636163(%rip),%ebp        # 686375fa <oatbsslastword+0x6863522e>
    1497:	2f                   	(bad)  
    1498:	78 38                	js     14d2 <oatdata+0x4d2>
    149a:	36 5f                	ss pop %rdi
    149c:	36 34 2f             	ss xor $0x2f,%al
    149f:	73 79                	jae    151a <oatdata+0x51a>
    14a1:	73 74                	jae    1517 <oatdata+0x517>
    14a3:	65 6d                	gs insl (%dx),%es:(%rdi)
    14a5:	40                   	rex
    14a6:	66 72 61             	data16 jb 150a <oatdata+0x50a>
    14a9:	6d                   	insl   (%dx),%es:(%rdi)
    14aa:	65 77 6f             	gs ja  151c <oatdata+0x51c>
    14ad:	72 6b                	jb     151a <oatdata+0x51a>
    14af:	40 62                	rex (bad) 
    14b1:	6f                   	outsl  %ds:(%rsi),(%dx)
    14b2:	6f                   	outsl  %ds:(%rsi),(%dx)
    14b3:	74 2d                	je     14e2 <oatdata+0x4e2>
    14b5:	66 72 61             	data16 jb 1519 <oatdata+0x519>
    14b8:	6d                   	insl   (%dx),%es:(%rdi)
    14b9:	65 77 6f             	gs ja  152b <oatdata+0x52b>
    14bc:	72 6b                	jb     1529 <oatdata+0x529>
    14be:	2e 61                	cs (bad) 
    14c0:	72 74                	jb     1536 <oatdata+0x536>
    14c2:	3a 2f                	cmp    (%rdi),%ch
    14c4:	64 61                	fs (bad) 
    14c6:	74 61                	je     1529 <oatdata+0x529>
    14c8:	2f                   	(bad)  
    14c9:	64 61                	fs (bad) 
    14cb:	6c                   	insb   (%dx),%es:(%rdi)
    14cc:	76 69                	jbe    1537 <oatdata+0x537>
    14ce:	6b 2d 63 61 63 68 65 	imul   $0x65,0x68636163(%rip),%ebp        # 68637638 <oatbsslastword+0x6863526c>
    14d5:	2f                   	(bad)  
    14d6:	78 38                	js     1510 <oatdata+0x510>
    14d8:	36 5f                	ss pop %rdi
    14da:	36 34 2f             	ss xor $0x2f,%al
    14dd:	73 79                	jae    1558 <oatdata+0x558>
    14df:	73 74                	jae    1555 <oatdata+0x555>
    14e1:	65 6d                	gs insl (%dx),%es:(%rdi)
    14e3:	40                   	rex
    14e4:	66 72 61             	data16 jb 1548 <oatdata+0x548>
    14e7:	6d                   	insl   (%dx),%es:(%rdi)
    14e8:	65 77 6f             	gs ja  155a <oatdata+0x55a>
    14eb:	72 6b                	jb     1558 <oatdata+0x558>
    14ed:	40 62                	rex (bad) 
    14ef:	6f                   	outsl  %ds:(%rsi),(%dx)
    14f0:	6f                   	outsl  %ds:(%rsi),(%dx)
    14f1:	74 2d                	je     1520 <oatdata+0x520>
    14f3:	74 65                	je     155a <oatdata+0x55a>
    14f5:	6c                   	insb   (%dx),%es:(%rdi)
    14f6:	65 70 68             	gs jo  1561 <oatdata+0x561>
    14f9:	6f                   	outsl  %ds:(%rsi),(%dx)
    14fa:	6e                   	outsb  %ds:(%rsi),(%dx)
    14fb:	79 2d                	jns    152a <oatdata+0x52a>
    14fd:	63 6f 6d             	movslq 0x6d(%rdi),%ebp
    1500:	6d                   	insl   (%dx),%es:(%rdi)
    1501:	6f                   	outsl  %ds:(%rsi),(%dx)
    1502:	6e                   	outsb  %ds:(%rsi),(%dx)
    1503:	2e 61                	cs (bad) 
    1505:	72 74                	jb     157b <oatdata+0x57b>
    1507:	3a 2f                	cmp    (%rdi),%ch
    1509:	64 61                	fs (bad) 
    150b:	74 61                	je     156e <oatdata+0x56e>
    150d:	2f                   	(bad)  
    150e:	64 61                	fs (bad) 
    1510:	6c                   	insb   (%dx),%es:(%rdi)
    1511:	76 69                	jbe    157c <oatdata+0x57c>
    1513:	6b 2d 63 61 63 68 65 	imul   $0x65,0x68636163(%rip),%ebp        # 6863767d <oatbsslastword+0x686352b1>
    151a:	2f                   	(bad)  
    151b:	78 38                	js     1555 <oatdata+0x555>
    151d:	36 5f                	ss pop %rdi
    151f:	36 34 2f             	ss xor $0x2f,%al
    1522:	73 79                	jae    159d <oatdata+0x59d>
    1524:	73 74                	jae    159a <oatdata+0x59a>
    1526:	65 6d                	gs insl (%dx),%es:(%rdi)
    1528:	40                   	rex
    1529:	66 72 61             	data16 jb 158d <oatdata+0x58d>
    152c:	6d                   	insl   (%dx),%es:(%rdi)
    152d:	65 77 6f             	gs ja  159f <oatdata+0x59f>
    1530:	72 6b                	jb     159d <oatdata+0x59d>
    1532:	40 62                	rex (bad) 
    1534:	6f                   	outsl  %ds:(%rsi),(%dx)
    1535:	6f                   	outsl  %ds:(%rsi),(%dx)
    1536:	74 2d                	je     1565 <oatdata+0x565>
    1538:	76 6f                	jbe    15a9 <oatdata+0x5a9>
    153a:	69 70 2d 63 6f 6d 6d 	imul   $0x6d6d6f63,0x2d(%rax),%esi
    1541:	6f                   	outsl  %ds:(%rsi),(%dx)
    1542:	6e                   	outsb  %ds:(%rsi),(%dx)
    1543:	2e 61                	cs (bad) 
    1545:	72 74                	jb     15bb <oatdata+0x5bb>
    1547:	3a 2f                	cmp    (%rdi),%ch
    1549:	64 61                	fs (bad) 
    154b:	74 61                	je     15ae <oatdata+0x5ae>
    154d:	2f                   	(bad)  
    154e:	64 61                	fs (bad) 
    1550:	6c                   	insb   (%dx),%es:(%rdi)
    1551:	76 69                	jbe    15bc <oatdata+0x5bc>
    1553:	6b 2d 63 61 63 68 65 	imul   $0x65,0x68636163(%rip),%ebp        # 686376bd <oatbsslastword+0x686352f1>
    155a:	2f                   	(bad)  
    155b:	78 38                	js     1595 <oatdata+0x595>
    155d:	36 5f                	ss pop %rdi
    155f:	36 34 2f             	ss xor $0x2f,%al
    1562:	73 79                	jae    15dd <oatdata+0x5dd>
    1564:	73 74                	jae    15da <oatdata+0x5da>
    1566:	65 6d                	gs insl (%dx),%es:(%rdi)
    1568:	40                   	rex
    1569:	66 72 61             	data16 jb 15cd <oatdata+0x5cd>
    156c:	6d                   	insl   (%dx),%es:(%rdi)
    156d:	65 77 6f             	gs ja  15df <oatdata+0x5df>
    1570:	72 6b                	jb     15dd <oatdata+0x5dd>
    1572:	40 62                	rex (bad) 
    1574:	6f                   	outsl  %ds:(%rsi),(%dx)
    1575:	6f                   	outsl  %ds:(%rsi),(%dx)
    1576:	74 2d                	je     15a5 <oatdata+0x5a5>
    1578:	69 6d 73 2d 63 6f 6d 	imul   $0x6d6f632d,0x73(%rbp),%ebp
    157f:	6d                   	insl   (%dx),%es:(%rdi)
    1580:	6f                   	outsl  %ds:(%rsi),(%dx)
    1581:	6e                   	outsb  %ds:(%rsi),(%dx)
    1582:	2e 61                	cs (bad) 
    1584:	72 74                	jb     15fa <oatdata+0x5fa>
    1586:	3a 2f                	cmp    (%rdi),%ch
    1588:	64 61                	fs (bad) 
    158a:	74 61                	je     15ed <oatdata+0x5ed>
    158c:	2f                   	(bad)  
    158d:	64 61                	fs (bad) 
    158f:	6c                   	insb   (%dx),%es:(%rdi)
    1590:	76 69                	jbe    15fb <oatdata+0x5fb>
    1592:	6b 2d 63 61 63 68 65 	imul   $0x65,0x68636163(%rip),%ebp        # 686376fc <oatbsslastword+0x68635330>
    1599:	2f                   	(bad)  
    159a:	78 38                	js     15d4 <oatdata+0x5d4>
    159c:	36 5f                	ss pop %rdi
    159e:	36 34 2f             	ss xor $0x2f,%al
    15a1:	73 79                	jae    161c <oatdata+0x61c>
    15a3:	73 74                	jae    1619 <oatdata+0x619>
    15a5:	65 6d                	gs insl (%dx),%es:(%rdi)
    15a7:	40                   	rex
    15a8:	66 72 61             	data16 jb 160c <oatdata+0x60c>
    15ab:	6d                   	insl   (%dx),%es:(%rdi)
    15ac:	65 77 6f             	gs ja  161e <oatdata+0x61e>
    15af:	72 6b                	jb     161c <oatdata+0x61c>
    15b1:	40 62                	rex (bad) 
    15b3:	6f                   	outsl  %ds:(%rsi),(%dx)
    15b4:	6f                   	outsl  %ds:(%rsi),(%dx)
    15b5:	74 2d                	je     15e4 <oatdata+0x5e4>
    15b7:	6f                   	outsl  %ds:(%rsi),(%dx)
    15b8:	72 67                	jb     1621 <oatdata+0x621>
    15ba:	2e 61                	cs (bad) 
    15bc:	70 61                	jo     161f <oatdata+0x61f>
    15be:	63 68 65             	movslq 0x65(%rax),%ebp
    15c1:	2e 68 74 74 70 2e    	cs pushq $0x2e707474
    15c7:	6c                   	insb   (%dx),%es:(%rdi)
    15c8:	65 67 61             	gs addr32 (bad) 
    15cb:	63 79 2e             	movslq 0x2e(%rcx),%edi
    15ce:	62                   	(bad)  
    15cf:	6f                   	outsl  %ds:(%rsi),(%dx)
    15d0:	6f                   	outsl  %ds:(%rsi),(%dx)
    15d1:	74 2e                	je     1601 <oatdata+0x601>
    15d3:	61                   	(bad)  
    15d4:	72 74                	jb     164a <oatdata+0x64a>
    15d6:	3a 2f                	cmp    (%rdi),%ch
    15d8:	64 61                	fs (bad) 
    15da:	74 61                	je     163d <oatdata+0x63d>
    15dc:	2f                   	(bad)  
    15dd:	64 61                	fs (bad) 
    15df:	6c                   	insb   (%dx),%es:(%rdi)
    15e0:	76 69                	jbe    164b <oatdata+0x64b>
    15e2:	6b 2d 63 61 63 68 65 	imul   $0x65,0x68636163(%rip),%ebp        # 6863774c <oatbsslastword+0x68635380>
    15e9:	2f                   	(bad)  
    15ea:	78 38                	js     1624 <oatdata+0x624>
    15ec:	36 5f                	ss pop %rdi
    15ee:	36 34 2f             	ss xor $0x2f,%al
    15f1:	73 79                	jae    166c <oatdata+0x66c>
    15f3:	73 74                	jae    1669 <oatdata+0x669>
    15f5:	65 6d                	gs insl (%dx),%es:(%rdi)
    15f7:	40                   	rex
    15f8:	66 72 61             	data16 jb 165c <oatdata+0x65c>
    15fb:	6d                   	insl   (%dx),%es:(%rdi)
    15fc:	65 77 6f             	gs ja  166e <oatdata+0x66e>
    15ff:	72 6b                	jb     166c <oatdata+0x66c>
    1601:	40 62                	rex (bad) 
    1603:	6f                   	outsl  %ds:(%rsi),(%dx)
    1604:	6f                   	outsl  %ds:(%rsi),(%dx)
    1605:	74 2d                	je     1634 <oatdata+0x634>
    1607:	61                   	(bad)  
    1608:	6e                   	outsb  %ds:(%rsi),(%dx)
    1609:	64 72 6f             	fs jb  167b <oatdata+0x67b>
    160c:	69 64 2e 68 69 64 6c 	imul   $0x2e6c6469,0x68(%rsi,%rbp,1),%esp
    1613:	2e 
    1614:	62 61                	(bad)  
    1616:	73 65                	jae    167d <oatdata+0x67d>
    1618:	2d 56 31 2e 30       	sub    $0x302e3156,%eax
    161d:	2d 6a 61 76 61       	sub    $0x6176616a,%eax
    1622:	2e 61                	cs (bad) 
    1624:	72 74                	jb     169a <oatdata+0x69a>
    1626:	3a 2f                	cmp    (%rdi),%ch
    1628:	64 61                	fs (bad) 
    162a:	74 61                	je     168d <oatdata+0x68d>
    162c:	2f                   	(bad)  
    162d:	64 61                	fs (bad) 
    162f:	6c                   	insb   (%dx),%es:(%rdi)
    1630:	76 69                	jbe    169b <oatdata+0x69b>
    1632:	6b 2d 63 61 63 68 65 	imul   $0x65,0x68636163(%rip),%ebp        # 6863779c <oatbsslastword+0x686353d0>
    1639:	2f                   	(bad)  
    163a:	78 38                	js     1674 <oatdata+0x674>
    163c:	36 5f                	ss pop %rdi
    163e:	36 34 2f             	ss xor $0x2f,%al
    1641:	73 79                	jae    16bc <oatdata+0x6bc>
    1643:	73 74                	jae    16b9 <oatdata+0x6b9>
    1645:	65 6d                	gs insl (%dx),%es:(%rdi)
    1647:	40                   	rex
    1648:	66 72 61             	data16 jb 16ac <oatdata+0x6ac>
    164b:	6d                   	insl   (%dx),%es:(%rdi)
    164c:	65 77 6f             	gs ja  16be <oatdata+0x6be>
    164f:	72 6b                	jb     16bc <oatdata+0x6bc>
    1651:	40 62                	rex (bad) 
    1653:	6f                   	outsl  %ds:(%rsi),(%dx)
    1654:	6f                   	outsl  %ds:(%rsi),(%dx)
    1655:	74 2d                	je     1684 <oatdata+0x684>
    1657:	61                   	(bad)  
    1658:	6e                   	outsb  %ds:(%rsi),(%dx)
    1659:	64 72 6f             	fs jb  16cb <oatdata+0x6cb>
    165c:	69 64 2e 68 69 64 6c 	imul   $0x2e6c6469,0x68(%rsi,%rbp,1),%esp
    1663:	2e 
    1664:	6d                   	insl   (%dx),%es:(%rdi)
    1665:	61                   	(bad)  
    1666:	6e                   	outsb  %ds:(%rsi),(%dx)
    1667:	61                   	(bad)  
    1668:	67 65 72 2d          	addr32 gs jb 1699 <oatdata+0x699>
    166c:	56                   	push   %rsi
    166d:	31 2e                	xor    %ebp,(%rsi)
    166f:	30 2d 6a 61 76 61    	xor    %ch,0x6176616a(%rip)        # 617677df <oatbsslastword+0x61765413>
    1675:	2e 61                	cs (bad) 
    1677:	72 74                	jb     16ed <oatdata+0x6ed>
    1679:	00 6e 61             	add    %ch,0x61(%rsi)
    167c:	74 69                	je     16e7 <oatdata+0x6e7>
    167e:	76 65                	jbe    16e5 <oatdata+0x6e5>
    1680:	2d 64 65 62 75       	sub    $0x75626564,%eax
    1685:	67 67 61             	addr32 addr32 (bad) 
    1688:	62                   	(bad)  
    1689:	6c                   	insb   (%dx),%es:(%rdi)
    168a:	65 00 66 61          	add    %ah,%gs:0x61(%rsi)
    168e:	6c                   	insb   (%dx),%es:(%rdi)
    168f:	73 65                	jae    16f6 <oatdata+0x6f6>
    1691:	00 70 69             	add    %dh,0x69(%rax)
    1694:	63 00                	movslq (%rax),%eax
    1696:	66 61                	data16 (bad) 
    1698:	6c                   	insb   (%dx),%es:(%rdi)
    1699:	73 65                	jae    1700 <oatdata+0x700>
    169b:	00 5e 05             	add    %bl,0x5(%rsi)
    169e:	00 00                	add    %al,(%rax)
    16a0:	03 62 00             	add    0x0(%rdx),%esp
    16a3:	00 7e 05             	add    %bh,0x5(%rsi)
    16a6:	00 00                	add    %al,(%rax)
    16a8:	24 e1                	and    $0xe1,%al
	...
    16b2:	00 00                	add    %al,(%rax)
    16b4:	f5                   	cmc    
    16b5:	04 00                	add    $0x0,%al
    16b7:	00 00                	add    %al,(%rax)
    16b9:	14 01                	adc    $0x1,%al
    16bb:	00 18                	add    %bl,(%rax)
    16bd:	05 00 00 39 b7       	add    $0xb7390000,%eax
    16c2:	01 00                	add    %eax,(%rax)
    16c4:	3c 05                	cmp    $0x5,%al
    16c6:	00 00                	add    %al,(%rax)
    16c8:	92                   	xchg   %eax,%edx
    16c9:	3d 00 00 00 00       	cmp    $0x0,%eax
	...
    172a:	00 00                	add    %al,(%rax)
    172c:	40 07                	rex (bad) 
    172e:	00 00                	add    %al,(%rax)
    1730:	44 07                	rex.R (bad) 
    1732:	00 00                	add    %al,(%rax)
    1734:	48 07                	rex.W (bad) 
    1736:	00 00                	add    %al,(%rax)
    1738:	4c 07                	rex.WR (bad) 
    173a:	00 00                	add    %al,(%rax)
    173c:	50                   	push   %rax
    173d:	07                   	(bad)  
    173e:	00 00                	add    %al,(%rax)
    1740:	09 00                	or     %eax,(%rax)
    1742:	02 00                	add    (%rax),%al
    1744:	09 00                	or     %eax,(%rax)
    1746:	02 00                	add    (%rax),%al
    1748:	09 00                	or     %eax,(%rax)
    174a:	02 00                	add    (%rax),%al
    174c:	09 00                	or     %eax,(%rax)
    174e:	02 00                	add    (%rax),%al
    1750:	0b 00                	or     (%rax),%eax
    1752:	02 00                	add    (%rax),%al
    1754:	08 00                	or     %al,(%rax)
    1756:	00 00                	add    %al,(%rax)
    1758:	62 61                	(bad)  
    175a:	73 65                	jae    17c1 <oatdata+0x7c1>
    175c:	2e 61                	cs (bad) 
    175e:	70 6b                	jo     17cb <oatdata+0x7cb>
    1760:	d1 40 23             	roll   0x23(%rax)
    1763:	52                   	push   %rdx
    1764:	1c 00                	sbb    $0x0,%al
    1766:	00 00                	add    %al,(%rax)
    1768:	2c 07                	sub    $0x7,%al
    176a:	00 00                	add    %al,(%rax)
    176c:	9c                   	pushfq 
    176d:	06                   	(bad)  
    176e:	00 00                	add    %al,(%rax)
    1770:	dc 06                	faddl  (%rsi)
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
