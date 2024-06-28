
ejercicio6Tradicional_O3:     file format elf64-x86-64


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
    1020:	ff 35 9a 2f 00 00    	push   0x2f9a(%rip)        # 3fc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 9b 2f 00 00 	bnd jmp *0x2f9b(%rip)        # 3fc8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    103f:	90                   	nop

Disassembly of section .plt.got:

0000000000001040 <__cxa_finalize@plt>:
    1040:	f3 0f 1e fa          	endbr64 
    1044:	f2 ff 25 ad 2f 00 00 	bnd jmp *0x2fad(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    104b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001050 <__printf_chk@plt>:
    1050:	f3 0f 1e fa          	endbr64 
    1054:	f2 ff 25 75 2f 00 00 	bnd jmp *0x2f75(%rip)        # 3fd0 <__printf_chk@GLIBC_2.3.4>
    105b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000001060 <main>:
    1060:	f3 0f 1e fa          	endbr64 
    1064:	48 83 ec 08          	sub    $0x8,%rsp
    1068:	ba 0d 00 00 00       	mov    $0xd,%edx
    106d:	bf 01 00 00 00       	mov    $0x1,%edi
    1072:	31 c0                	xor    %eax,%eax
    1074:	48 8d 35 89 0f 00 00 	lea    0xf89(%rip),%rsi        # 2004 <_IO_stdin_used+0x4>
    107b:	e8 d0 ff ff ff       	call   1050 <__printf_chk@plt>
    1080:	31 c0                	xor    %eax,%eax
    1082:	48 83 c4 08          	add    $0x8,%rsp
    1086:	c3                   	ret    
    1087:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    108e:	00 00 

0000000000001090 <_start>:
    1090:	f3 0f 1e fa          	endbr64 
    1094:	31 ed                	xor    %ebp,%ebp
    1096:	49 89 d1             	mov    %rdx,%r9
    1099:	5e                   	pop    %rsi
    109a:	48 89 e2             	mov    %rsp,%rdx
    109d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    10a1:	50                   	push   %rax
    10a2:	54                   	push   %rsp
    10a3:	45 31 c0             	xor    %r8d,%r8d
    10a6:	31 c9                	xor    %ecx,%ecx
    10a8:	48 8d 3d b1 ff ff ff 	lea    -0x4f(%rip),%rdi        # 1060 <main>
    10af:	ff 15 23 2f 00 00    	call   *0x2f23(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    10b5:	f4                   	hlt    
    10b6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    10bd:	00 00 00 

00000000000010c0 <deregister_tm_clones>:
    10c0:	48 8d 3d 49 2f 00 00 	lea    0x2f49(%rip),%rdi        # 4010 <__TMC_END__>
    10c7:	48 8d 05 42 2f 00 00 	lea    0x2f42(%rip),%rax        # 4010 <__TMC_END__>
    10ce:	48 39 f8             	cmp    %rdi,%rax
    10d1:	74 15                	je     10e8 <deregister_tm_clones+0x28>
    10d3:	48 8b 05 06 2f 00 00 	mov    0x2f06(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    10da:	48 85 c0             	test   %rax,%rax
    10dd:	74 09                	je     10e8 <deregister_tm_clones+0x28>
    10df:	ff e0                	jmp    *%rax
    10e1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10e8:	c3                   	ret    
    10e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010f0 <register_tm_clones>:
    10f0:	48 8d 3d 19 2f 00 00 	lea    0x2f19(%rip),%rdi        # 4010 <__TMC_END__>
    10f7:	48 8d 35 12 2f 00 00 	lea    0x2f12(%rip),%rsi        # 4010 <__TMC_END__>
    10fe:	48 29 fe             	sub    %rdi,%rsi
    1101:	48 89 f0             	mov    %rsi,%rax
    1104:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1108:	48 c1 f8 03          	sar    $0x3,%rax
    110c:	48 01 c6             	add    %rax,%rsi
    110f:	48 d1 fe             	sar    %rsi
    1112:	74 14                	je     1128 <register_tm_clones+0x38>
    1114:	48 8b 05 d5 2e 00 00 	mov    0x2ed5(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    111b:	48 85 c0             	test   %rax,%rax
    111e:	74 08                	je     1128 <register_tm_clones+0x38>
    1120:	ff e0                	jmp    *%rax
    1122:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1128:	c3                   	ret    
    1129:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001130 <__do_global_dtors_aux>:
    1130:	f3 0f 1e fa          	endbr64 
    1134:	80 3d d5 2e 00 00 00 	cmpb   $0x0,0x2ed5(%rip)        # 4010 <__TMC_END__>
    113b:	75 2b                	jne    1168 <__do_global_dtors_aux+0x38>
    113d:	55                   	push   %rbp
    113e:	48 83 3d b2 2e 00 00 	cmpq   $0x0,0x2eb2(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1145:	00 
    1146:	48 89 e5             	mov    %rsp,%rbp
    1149:	74 0c                	je     1157 <__do_global_dtors_aux+0x27>
    114b:	48 8b 3d b6 2e 00 00 	mov    0x2eb6(%rip),%rdi        # 4008 <__dso_handle>
    1152:	e8 e9 fe ff ff       	call   1040 <__cxa_finalize@plt>
    1157:	e8 64 ff ff ff       	call   10c0 <deregister_tm_clones>
    115c:	c6 05 ad 2e 00 00 01 	movb   $0x1,0x2ead(%rip)        # 4010 <__TMC_END__>
    1163:	5d                   	pop    %rbp
    1164:	c3                   	ret    
    1165:	0f 1f 00             	nopl   (%rax)
    1168:	c3                   	ret    
    1169:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001170 <frame_dummy>:
    1170:	f3 0f 1e fa          	endbr64 
    1174:	e9 77 ff ff ff       	jmp    10f0 <register_tm_clones>
    1179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001180 <maximo_tradicional>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	48 89 f9             	mov    %rdi,%rcx
    1187:	48 85 f6             	test   %rsi,%rsi
    118a:	0f 84 e0 00 00 00    	je     1270 <maximo_tradicional+0xf0>
    1190:	48 8d 46 ff          	lea    -0x1(%rsi),%rax
    1194:	48 83 f8 02          	cmp    $0x2,%rax
    1198:	0f 86 e3 00 00 00    	jbe    1281 <maximo_tradicional+0x101>
    119e:	48 89 f2             	mov    %rsi,%rdx
    11a1:	66 0f 6f 15 77 0e 00 	movdqa 0xe77(%rip),%xmm2        # 2020 <_IO_stdin_used+0x20>
    11a8:	00 
    11a9:	48 89 f8             	mov    %rdi,%rax
    11ac:	48 c1 ea 02          	shr    $0x2,%rdx
    11b0:	48 c1 e2 04          	shl    $0x4,%rdx
    11b4:	48 01 fa             	add    %rdi,%rdx
    11b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    11be:	00 00 
    11c0:	f3 0f 6f 00          	movdqu (%rax),%xmm0
    11c4:	48 83 c0 10          	add    $0x10,%rax
    11c8:	66 0f 6f c8          	movdqa %xmm0,%xmm1
    11cc:	66 0f 66 ca          	pcmpgtd %xmm2,%xmm1
    11d0:	66 0f db c1          	pand   %xmm1,%xmm0
    11d4:	66 0f df ca          	pandn  %xmm2,%xmm1
    11d8:	66 0f 6f d1          	movdqa %xmm1,%xmm2
    11dc:	66 0f eb d0          	por    %xmm0,%xmm2
    11e0:	48 39 d0             	cmp    %rdx,%rax
    11e3:	75 db                	jne    11c0 <maximo_tradicional+0x40>
    11e5:	66 0f 6f c2          	movdqa %xmm2,%xmm0
    11e9:	48 89 f2             	mov    %rsi,%rdx
    11ec:	66 0f 73 d8 08       	psrldq $0x8,%xmm0
    11f1:	48 83 e2 fc          	and    $0xfffffffffffffffc,%rdx
    11f5:	66 0f 6f c8          	movdqa %xmm0,%xmm1
    11f9:	66 0f 66 ca          	pcmpgtd %xmm2,%xmm1
    11fd:	66 0f db c1          	pand   %xmm1,%xmm0
    1201:	66 0f df ca          	pandn  %xmm2,%xmm1
    1205:	66 0f eb c8          	por    %xmm0,%xmm1
    1209:	66 0f 6f d1          	movdqa %xmm1,%xmm2
    120d:	66 0f 73 da 04       	psrldq $0x4,%xmm2
    1212:	66 0f 6f c2          	movdqa %xmm2,%xmm0
    1216:	66 0f 66 c1          	pcmpgtd %xmm1,%xmm0
    121a:	66 0f db d0          	pand   %xmm0,%xmm2
    121e:	66 0f df c1          	pandn  %xmm1,%xmm0
    1222:	66 0f eb c2          	por    %xmm2,%xmm0
    1226:	66 0f 7e c0          	movd   %xmm0,%eax
    122a:	40 f6 c6 03          	test   $0x3,%sil
    122e:	74 50                	je     1280 <maximo_tradicional+0x100>
    1230:	8b 3c 91             	mov    (%rcx,%rdx,4),%edi
    1233:	4c 8d 04 95 00 00 00 	lea    0x0(,%rdx,4),%r8
    123a:	00 
    123b:	39 f8                	cmp    %edi,%eax
    123d:	0f 4c c7             	cmovl  %edi,%eax
    1240:	48 8d 7a 01          	lea    0x1(%rdx),%rdi
    1244:	48 39 fe             	cmp    %rdi,%rsi
    1247:	76 2c                	jbe    1275 <maximo_tradicional+0xf5>
    1249:	42 8b 7c 01 04       	mov    0x4(%rcx,%r8,1),%edi
    124e:	39 f8                	cmp    %edi,%eax
    1250:	0f 4c c7             	cmovl  %edi,%eax
    1253:	48 83 c2 02          	add    $0x2,%rdx
    1257:	48 39 d6             	cmp    %rdx,%rsi
    125a:	76 19                	jbe    1275 <maximo_tradicional+0xf5>
    125c:	42 8b 54 01 08       	mov    0x8(%rcx,%r8,1),%edx
    1261:	39 d0                	cmp    %edx,%eax
    1263:	0f 4c c2             	cmovl  %edx,%eax
    1266:	c3                   	ret    
    1267:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    126e:	00 00 
    1270:	b8 00 00 00 80       	mov    $0x80000000,%eax
    1275:	c3                   	ret    
    1276:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    127d:	00 00 00 
    1280:	c3                   	ret    
    1281:	31 d2                	xor    %edx,%edx
    1283:	b8 00 00 00 80       	mov    $0x80000000,%eax
    1288:	eb a6                	jmp    1230 <maximo_tradicional+0xb0>

Disassembly of section .fini:

000000000000128c <_fini>:
    128c:	f3 0f 1e fa          	endbr64 
    1290:	48 83 ec 08          	sub    $0x8,%rsp
    1294:	48 83 c4 08          	add    $0x8,%rsp
    1298:	c3                   	ret    
