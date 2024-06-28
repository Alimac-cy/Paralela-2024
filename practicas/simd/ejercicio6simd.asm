
ejercicio6simd:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 92 2f 00 00    	push   0x2f92(%rip)        # 3fb8 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 93 2f 00 00 	bnd jmp *0x2f93(%rip)        # 3fc0 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	push   $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    104f:	90                   	nop

Disassembly of section .plt.got:

0000000000001050 <__cxa_finalize@plt>:
    1050:	f3 0f 1e fa          	endbr64 
    1054:	f2 ff 25 9d 2f 00 00 	bnd jmp *0x2f9d(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    105b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001060 <__stack_chk_fail@plt>:
    1060:	f3 0f 1e fa          	endbr64 
    1064:	f2 ff 25 5d 2f 00 00 	bnd jmp *0x2f5d(%rip)        # 3fc8 <__stack_chk_fail@GLIBC_2.4>
    106b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001070 <__printf_chk@plt>:
    1070:	f3 0f 1e fa          	endbr64 
    1074:	f2 ff 25 55 2f 00 00 	bnd jmp *0x2f55(%rip)        # 3fd0 <__printf_chk@GLIBC_2.3.4>
    107b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000001080 <main>:
    1080:	f3 0f 1e fa          	endbr64 
    1084:	55                   	push   %rbp
    1085:	be 09 00 00 00       	mov    $0x9,%esi
    108a:	48 89 e5             	mov    %rsp,%rbp
    108d:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
    1091:	48 83 ec 40          	sub    $0x40,%rsp
    1095:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    109c:	00 00 
    109e:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
    10a3:	31 c0                	xor    %eax,%eax
    10a5:	c5 fd 6f 05 93 0f 00 	vmovdqa 0xf93(%rip),%ymm0        # 2040 <_IO_stdin_used+0x40>
    10ac:	00 
    10ad:	48 89 e7             	mov    %rsp,%rdi
    10b0:	c7 44 24 20 0b 00 00 	movl   $0xb,0x20(%rsp)
    10b7:	00 
    10b8:	c5 fd 7f 04 24       	vmovdqa %ymm0,(%rsp)
    10bd:	c5 f8 77             	vzeroupper 
    10c0:	e8 2b 01 00 00       	call   11f0 <maximo_SIMD>
    10c5:	89 c2                	mov    %eax,%edx
    10c7:	48 8d 35 36 0f 00 00 	lea    0xf36(%rip),%rsi        # 2004 <_IO_stdin_used+0x4>
    10ce:	31 c0                	xor    %eax,%eax
    10d0:	bf 01 00 00 00       	mov    $0x1,%edi
    10d5:	e8 96 ff ff ff       	call   1070 <__printf_chk@plt>
    10da:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
    10df:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    10e6:	00 00 
    10e8:	75 04                	jne    10ee <main+0x6e>
    10ea:	31 c0                	xor    %eax,%eax
    10ec:	c9                   	leave  
    10ed:	c3                   	ret    
    10ee:	e8 6d ff ff ff       	call   1060 <__stack_chk_fail@plt>
    10f3:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    10fa:	00 00 00 
    10fd:	0f 1f 00             	nopl   (%rax)

0000000000001100 <_start>:
    1100:	f3 0f 1e fa          	endbr64 
    1104:	31 ed                	xor    %ebp,%ebp
    1106:	49 89 d1             	mov    %rdx,%r9
    1109:	5e                   	pop    %rsi
    110a:	48 89 e2             	mov    %rsp,%rdx
    110d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1111:	50                   	push   %rax
    1112:	54                   	push   %rsp
    1113:	45 31 c0             	xor    %r8d,%r8d
    1116:	31 c9                	xor    %ecx,%ecx
    1118:	48 8d 3d 61 ff ff ff 	lea    -0x9f(%rip),%rdi        # 1080 <main>
    111f:	ff 15 b3 2e 00 00    	call   *0x2eb3(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    1125:	f4                   	hlt    
    1126:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    112d:	00 00 00 

0000000000001130 <deregister_tm_clones>:
    1130:	48 8d 3d d9 2e 00 00 	lea    0x2ed9(%rip),%rdi        # 4010 <__TMC_END__>
    1137:	48 8d 05 d2 2e 00 00 	lea    0x2ed2(%rip),%rax        # 4010 <__TMC_END__>
    113e:	48 39 f8             	cmp    %rdi,%rax
    1141:	74 15                	je     1158 <deregister_tm_clones+0x28>
    1143:	48 8b 05 96 2e 00 00 	mov    0x2e96(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    114a:	48 85 c0             	test   %rax,%rax
    114d:	74 09                	je     1158 <deregister_tm_clones+0x28>
    114f:	ff e0                	jmp    *%rax
    1151:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1158:	c3                   	ret    
    1159:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001160 <register_tm_clones>:
    1160:	48 8d 3d a9 2e 00 00 	lea    0x2ea9(%rip),%rdi        # 4010 <__TMC_END__>
    1167:	48 8d 35 a2 2e 00 00 	lea    0x2ea2(%rip),%rsi        # 4010 <__TMC_END__>
    116e:	48 29 fe             	sub    %rdi,%rsi
    1171:	48 89 f0             	mov    %rsi,%rax
    1174:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1178:	48 c1 f8 03          	sar    $0x3,%rax
    117c:	48 01 c6             	add    %rax,%rsi
    117f:	48 d1 fe             	sar    %rsi
    1182:	74 14                	je     1198 <register_tm_clones+0x38>
    1184:	48 8b 05 65 2e 00 00 	mov    0x2e65(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    118b:	48 85 c0             	test   %rax,%rax
    118e:	74 08                	je     1198 <register_tm_clones+0x38>
    1190:	ff e0                	jmp    *%rax
    1192:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1198:	c3                   	ret    
    1199:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011a0 <__do_global_dtors_aux>:
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	80 3d 65 2e 00 00 00 	cmpb   $0x0,0x2e65(%rip)        # 4010 <__TMC_END__>
    11ab:	75 2b                	jne    11d8 <__do_global_dtors_aux+0x38>
    11ad:	55                   	push   %rbp
    11ae:	48 83 3d 42 2e 00 00 	cmpq   $0x0,0x2e42(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    11b5:	00 
    11b6:	48 89 e5             	mov    %rsp,%rbp
    11b9:	74 0c                	je     11c7 <__do_global_dtors_aux+0x27>
    11bb:	48 8b 3d 46 2e 00 00 	mov    0x2e46(%rip),%rdi        # 4008 <__dso_handle>
    11c2:	e8 89 fe ff ff       	call   1050 <__cxa_finalize@plt>
    11c7:	e8 64 ff ff ff       	call   1130 <deregister_tm_clones>
    11cc:	c6 05 3d 2e 00 00 01 	movb   $0x1,0x2e3d(%rip)        # 4010 <__TMC_END__>
    11d3:	5d                   	pop    %rbp
    11d4:	c3                   	ret    
    11d5:	0f 1f 00             	nopl   (%rax)
    11d8:	c3                   	ret    
    11d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011e0 <frame_dummy>:
    11e0:	f3 0f 1e fa          	endbr64 
    11e4:	e9 77 ff ff ff       	jmp    1160 <register_tm_clones>
    11e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011f0 <maximo_SIMD>:
    11f0:	f3 0f 1e fa          	endbr64 
    11f4:	48 83 fe 03          	cmp    $0x3,%rsi
    11f8:	0f 86 ba 01 00 00    	jbe    13b8 <maximo_SIMD+0x1c8>
    11fe:	48 8d 56 fc          	lea    -0x4(%rsi),%rdx
    1202:	48 89 d1             	mov    %rdx,%rcx
    1205:	48 c1 e9 02          	shr    $0x2,%rcx
    1209:	48 c1 e1 04          	shl    $0x4,%rcx
    120d:	c5 f9 6f 0d fb 0d 00 	vmovdqa 0xdfb(%rip),%xmm1        # 2010 <_IO_stdin_used+0x10>
    1214:	00 
    1215:	48 89 f8             	mov    %rdi,%rax
    1218:	48 8d 4c 0f 10       	lea    0x10(%rdi,%rcx,1),%rcx
    121d:	0f 1f 00             	nopl   (%rax)
    1220:	c4 e2 71 3d 00       	vpmaxsd (%rax),%xmm1,%xmm0
    1225:	48 83 c0 10          	add    $0x10,%rax
    1229:	c5 f9 6f c8          	vmovdqa %xmm0,%xmm1
    122d:	48 39 c8             	cmp    %rcx,%rax
    1230:	75 ee                	jne    1220 <maximo_SIMD+0x30>
    1232:	c5 f1 73 d8 0c       	vpsrldq $0xc,%xmm0,%xmm1
    1237:	c4 e3 79 21 d0 0e    	vinsertps $0xe,%xmm0,%xmm0,%xmm2
    123d:	c4 e3 71 21 c9 0e    	vinsertps $0xe,%xmm1,%xmm1,%xmm1
    1243:	c4 e2 71 3d ca       	vpmaxsd %xmm2,%xmm1,%xmm1
    1248:	c5 e9 73 d8 04       	vpsrldq $0x4,%xmm0,%xmm2
    124d:	c4 e3 69 21 d2 0e    	vinsertps $0xe,%xmm2,%xmm2,%xmm2
    1253:	c5 f9 73 d8 08       	vpsrldq $0x8,%xmm0,%xmm0
    1258:	c4 e2 71 3d ca       	vpmaxsd %xmm2,%xmm1,%xmm1
    125d:	c4 e3 79 21 c0 0e    	vinsertps $0xe,%xmm0,%xmm0,%xmm0
    1263:	48 83 e2 fc          	and    $0xfffffffffffffffc,%rdx
    1267:	c4 e2 71 3d c0       	vpmaxsd %xmm0,%xmm1,%xmm0
    126c:	48 83 c2 04          	add    $0x4,%rdx
    1270:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    1274:	48 39 f2             	cmp    %rsi,%rdx
    1277:	0f 83 36 01 00 00    	jae    13b3 <maximo_SIMD+0x1c3>
    127d:	49 89 f0             	mov    %rsi,%r8
    1280:	49 29 d0             	sub    %rdx,%r8
    1283:	49 8d 48 ff          	lea    -0x1(%r8),%rcx
    1287:	48 83 f9 06          	cmp    $0x6,%rcx
    128b:	76 6e                	jbe    12fb <maximo_SIMD+0x10b>
    128d:	4c 89 c1             	mov    %r8,%rcx
    1290:	48 c1 e9 03          	shr    $0x3,%rcx
    1294:	c5 f9 6e c8          	vmovd  %eax,%xmm1
    1298:	48 c1 e1 05          	shl    $0x5,%rcx
    129c:	48 8d 04 97          	lea    (%rdi,%rdx,4),%rax
    12a0:	c4 e2 7d 58 c9       	vpbroadcastd %xmm1,%ymm1
    12a5:	48 01 c1             	add    %rax,%rcx
    12a8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    12af:	00 
    12b0:	c4 e2 75 3d 08       	vpmaxsd (%rax),%ymm1,%ymm1
    12b5:	48 83 c0 20          	add    $0x20,%rax
    12b9:	48 39 c1             	cmp    %rax,%rcx
    12bc:	75 f2                	jne    12b0 <maximo_SIMD+0xc0>
    12be:	c4 e3 7d 39 c8 01    	vextracti128 $0x1,%ymm1,%xmm0
    12c4:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    12c9:	c5 f1 73 d8 08       	vpsrldq $0x8,%xmm0,%xmm1
    12ce:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    12d3:	c5 f1 73 d8 04       	vpsrldq $0x4,%xmm0,%xmm1
    12d8:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    12dd:	4c 89 c1             	mov    %r8,%rcx
    12e0:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    12e4:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    12e8:	c5 f9 6e c0          	vmovd  %eax,%xmm0
    12ec:	48 01 ca             	add    %rcx,%rdx
    12ef:	4c 39 c1             	cmp    %r8,%rcx
    12f2:	0f 84 b8 00 00 00    	je     13b0 <maximo_SIMD+0x1c0>
    12f8:	c5 f8 77             	vzeroupper 
    12fb:	c5 f9 6e 0c 97       	vmovd  (%rdi,%rdx,4),%xmm1
    1300:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    1305:	4c 8d 42 01          	lea    0x1(%rdx),%r8
    1309:	48 8d 0c 95 00 00 00 	lea    0x0(,%rdx,4),%rcx
    1310:	00 
    1311:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    1315:	4c 39 c6             	cmp    %r8,%rsi
    1318:	0f 86 95 00 00 00    	jbe    13b3 <maximo_SIMD+0x1c3>
    131e:	c5 f9 6e 4c 0f 04    	vmovd  0x4(%rdi,%rcx,1),%xmm1
    1324:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    1329:	4c 8d 42 02          	lea    0x2(%rdx),%r8
    132d:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    1331:	4c 39 c6             	cmp    %r8,%rsi
    1334:	76 7d                	jbe    13b3 <maximo_SIMD+0x1c3>
    1336:	c5 f9 6e 4c 0f 08    	vmovd  0x8(%rdi,%rcx,1),%xmm1
    133c:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    1341:	4c 8d 42 03          	lea    0x3(%rdx),%r8
    1345:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    1349:	49 39 f0             	cmp    %rsi,%r8
    134c:	73 65                	jae    13b3 <maximo_SIMD+0x1c3>
    134e:	c5 f9 6e 4c 0f 0c    	vmovd  0xc(%rdi,%rcx,1),%xmm1
    1354:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    1359:	4c 8d 42 04          	lea    0x4(%rdx),%r8
    135d:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    1361:	4c 39 c6             	cmp    %r8,%rsi
    1364:	76 4d                	jbe    13b3 <maximo_SIMD+0x1c3>
    1366:	c5 f9 6e 4c 0f 10    	vmovd  0x10(%rdi,%rcx,1),%xmm1
    136c:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    1371:	4c 8d 42 05          	lea    0x5(%rdx),%r8
    1375:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    1379:	4c 39 c6             	cmp    %r8,%rsi
    137c:	76 35                	jbe    13b3 <maximo_SIMD+0x1c3>
    137e:	c5 f9 6e 4c 0f 14    	vmovd  0x14(%rdi,%rcx,1),%xmm1
    1384:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    1389:	48 83 c2 06          	add    $0x6,%rdx
    138d:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    1391:	48 39 d6             	cmp    %rdx,%rsi
    1394:	76 1d                	jbe    13b3 <maximo_SIMD+0x1c3>
    1396:	c5 f9 6e 4c 0f 18    	vmovd  0x18(%rdi,%rcx,1),%xmm1
    139c:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    13a1:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    13a5:	c3                   	ret    
    13a6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    13ad:	00 00 00 
    13b0:	c5 f8 77             	vzeroupper 
    13b3:	c3                   	ret    
    13b4:	0f 1f 40 00          	nopl   0x0(%rax)
    13b8:	c5 f9 6f 05 60 0c 00 	vmovdqa 0xc60(%rip),%xmm0        # 2020 <_IO_stdin_used+0x20>
    13bf:	00 
    13c0:	31 d2                	xor    %edx,%edx
    13c2:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    13c6:	e9 a9 fe ff ff       	jmp    1274 <maximo_SIMD+0x84>

Disassembly of section .fini:

00000000000013cc <_fini>:
    13cc:	f3 0f 1e fa          	endbr64 
    13d0:	48 83 ec 08          	sub    $0x8,%rsp
    13d4:	48 83 c4 08          	add    $0x8,%rsp
    13d8:	c3                   	ret    
