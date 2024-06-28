
ejercicio7Trad:     file format elf64-x86-64


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
    1020:	ff 35 8a 2f 00 00    	push   0x2f8a(%rip)        # 3fb0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 8b 2f 00 00 	bnd jmp *0x2f8b(%rip)        # 3fb8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	push   $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	push   $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    105f:	90                   	nop

Disassembly of section .plt.got:

0000000000001060 <__cxa_finalize@plt>:
    1060:	f3 0f 1e fa          	endbr64 
    1064:	f2 ff 25 8d 2f 00 00 	bnd jmp *0x2f8d(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    106b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001070 <putchar@plt>:
    1070:	f3 0f 1e fa          	endbr64 
    1074:	f2 ff 25 45 2f 00 00 	bnd jmp *0x2f45(%rip)        # 3fc0 <putchar@GLIBC_2.2.5>
    107b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001080 <__stack_chk_fail@plt>:
    1080:	f3 0f 1e fa          	endbr64 
    1084:	f2 ff 25 3d 2f 00 00 	bnd jmp *0x2f3d(%rip)        # 3fc8 <__stack_chk_fail@GLIBC_2.4>
    108b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001090 <__printf_chk@plt>:
    1090:	f3 0f 1e fa          	endbr64 
    1094:	f2 ff 25 35 2f 00 00 	bnd jmp *0x2f35(%rip)        # 3fd0 <__printf_chk@GLIBC_2.3.4>
    109b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000010a0 <main>:
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	55                   	push   %rbp
    10a5:	48 89 e5             	mov    %rsp,%rbp
    10a8:	41 55                	push   %r13
    10aa:	41 54                	push   %r12
    10ac:	4c 8d 25 51 0f 00 00 	lea    0xf51(%rip),%r12        # 2004 <_IO_stdin_used+0x4>
    10b3:	53                   	push   %rbx
    10b4:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
    10b8:	48 83 ec 40          	sub    $0x40,%rsp
    10bc:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    10c3:	00 00 
    10c5:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
    10ca:	31 c0                	xor    %eax,%eax
    10cc:	c5 fd 6f 05 4c 0f 00 	vmovdqa 0xf4c(%rip),%ymm0        # 2020 <_IO_stdin_used+0x20>
    10d3:	00 
    10d4:	48 89 e3             	mov    %rsp,%rbx
    10d7:	4c 8d 6c 24 20       	lea    0x20(%rsp),%r13
    10dc:	c5 fd 7f 04 24       	vmovdqa %ymm0,(%rsp)
    10e1:	c5 f8 77             	vzeroupper 
    10e4:	0f 1f 40 00          	nopl   0x0(%rax)
    10e8:	8b 13                	mov    (%rbx),%edx
    10ea:	4c 89 e6             	mov    %r12,%rsi
    10ed:	bf 01 00 00 00       	mov    $0x1,%edi
    10f2:	31 c0                	xor    %eax,%eax
    10f4:	48 83 c3 04          	add    $0x4,%rbx
    10f8:	e8 93 ff ff ff       	call   1090 <__printf_chk@plt>
    10fd:	4c 39 eb             	cmp    %r13,%rbx
    1100:	75 e6                	jne    10e8 <main+0x48>
    1102:	bf 0a 00 00 00       	mov    $0xa,%edi
    1107:	e8 64 ff ff ff       	call   1070 <putchar@plt>
    110c:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
    1111:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    1118:	00 00 
    111a:	75 0d                	jne    1129 <main+0x89>
    111c:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
    1120:	5b                   	pop    %rbx
    1121:	41 5c                	pop    %r12
    1123:	41 5d                	pop    %r13
    1125:	31 c0                	xor    %eax,%eax
    1127:	5d                   	pop    %rbp
    1128:	c3                   	ret    
    1129:	e8 52 ff ff ff       	call   1080 <__stack_chk_fail@plt>
    112e:	66 90                	xchg   %ax,%ax

0000000000001130 <_start>:
    1130:	f3 0f 1e fa          	endbr64 
    1134:	31 ed                	xor    %ebp,%ebp
    1136:	49 89 d1             	mov    %rdx,%r9
    1139:	5e                   	pop    %rsi
    113a:	48 89 e2             	mov    %rsp,%rdx
    113d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1141:	50                   	push   %rax
    1142:	54                   	push   %rsp
    1143:	45 31 c0             	xor    %r8d,%r8d
    1146:	31 c9                	xor    %ecx,%ecx
    1148:	48 8d 3d 51 ff ff ff 	lea    -0xaf(%rip),%rdi        # 10a0 <main>
    114f:	ff 15 83 2e 00 00    	call   *0x2e83(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    1155:	f4                   	hlt    
    1156:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    115d:	00 00 00 

0000000000001160 <deregister_tm_clones>:
    1160:	48 8d 3d a9 2e 00 00 	lea    0x2ea9(%rip),%rdi        # 4010 <__TMC_END__>
    1167:	48 8d 05 a2 2e 00 00 	lea    0x2ea2(%rip),%rax        # 4010 <__TMC_END__>
    116e:	48 39 f8             	cmp    %rdi,%rax
    1171:	74 15                	je     1188 <deregister_tm_clones+0x28>
    1173:	48 8b 05 66 2e 00 00 	mov    0x2e66(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    117a:	48 85 c0             	test   %rax,%rax
    117d:	74 09                	je     1188 <deregister_tm_clones+0x28>
    117f:	ff e0                	jmp    *%rax
    1181:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1188:	c3                   	ret    
    1189:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001190 <register_tm_clones>:
    1190:	48 8d 3d 79 2e 00 00 	lea    0x2e79(%rip),%rdi        # 4010 <__TMC_END__>
    1197:	48 8d 35 72 2e 00 00 	lea    0x2e72(%rip),%rsi        # 4010 <__TMC_END__>
    119e:	48 29 fe             	sub    %rdi,%rsi
    11a1:	48 89 f0             	mov    %rsi,%rax
    11a4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    11a8:	48 c1 f8 03          	sar    $0x3,%rax
    11ac:	48 01 c6             	add    %rax,%rsi
    11af:	48 d1 fe             	sar    %rsi
    11b2:	74 14                	je     11c8 <register_tm_clones+0x38>
    11b4:	48 8b 05 35 2e 00 00 	mov    0x2e35(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    11bb:	48 85 c0             	test   %rax,%rax
    11be:	74 08                	je     11c8 <register_tm_clones+0x38>
    11c0:	ff e0                	jmp    *%rax
    11c2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    11c8:	c3                   	ret    
    11c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011d0 <__do_global_dtors_aux>:
    11d0:	f3 0f 1e fa          	endbr64 
    11d4:	80 3d 35 2e 00 00 00 	cmpb   $0x0,0x2e35(%rip)        # 4010 <__TMC_END__>
    11db:	75 2b                	jne    1208 <__do_global_dtors_aux+0x38>
    11dd:	55                   	push   %rbp
    11de:	48 83 3d 12 2e 00 00 	cmpq   $0x0,0x2e12(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    11e5:	00 
    11e6:	48 89 e5             	mov    %rsp,%rbp
    11e9:	74 0c                	je     11f7 <__do_global_dtors_aux+0x27>
    11eb:	48 8b 3d 16 2e 00 00 	mov    0x2e16(%rip),%rdi        # 4008 <__dso_handle>
    11f2:	e8 69 fe ff ff       	call   1060 <__cxa_finalize@plt>
    11f7:	e8 64 ff ff ff       	call   1160 <deregister_tm_clones>
    11fc:	c6 05 0d 2e 00 00 01 	movb   $0x1,0x2e0d(%rip)        # 4010 <__TMC_END__>
    1203:	5d                   	pop    %rbp
    1204:	c3                   	ret    
    1205:	0f 1f 00             	nopl   (%rax)
    1208:	c3                   	ret    
    1209:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001210 <frame_dummy>:
    1210:	f3 0f 1e fa          	endbr64 
    1214:	e9 77 ff ff ff       	jmp    1190 <register_tm_clones>
    1219:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001220 <multiplicacion_escalar_tradicional>:
    1220:	f3 0f 1e fa          	endbr64 
    1224:	48 89 f1             	mov    %rsi,%rcx
    1227:	89 d6                	mov    %edx,%esi
    1229:	48 85 c9             	test   %rcx,%rcx
    122c:	0f 84 cb 00 00 00    	je     12fd <multiplicacion_escalar_tradicional+0xdd>
    1232:	48 8d 41 ff          	lea    -0x1(%rcx),%rax
    1236:	48 83 f8 06          	cmp    $0x6,%rax
    123a:	0f 86 c4 00 00 00    	jbe    1304 <multiplicacion_escalar_tradicional+0xe4>
    1240:	c5 f9 6e ca          	vmovd  %edx,%xmm1
    1244:	48 89 ca             	mov    %rcx,%rdx
    1247:	48 c1 ea 03          	shr    $0x3,%rdx
    124b:	48 c1 e2 05          	shl    $0x5,%rdx
    124f:	c4 e2 7d 58 c9       	vpbroadcastd %xmm1,%ymm1
    1254:	48 89 f8             	mov    %rdi,%rax
    1257:	48 01 fa             	add    %rdi,%rdx
    125a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1260:	c4 e2 75 40 00       	vpmulld (%rax),%ymm1,%ymm0
    1265:	48 83 c0 20          	add    $0x20,%rax
    1269:	c5 fe 7f 40 e0       	vmovdqu %ymm0,-0x20(%rax)
    126e:	48 39 c2             	cmp    %rax,%rdx
    1271:	75 ed                	jne    1260 <multiplicacion_escalar_tradicional+0x40>
    1273:	48 89 c8             	mov    %rcx,%rax
    1276:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
    127a:	f6 c1 07             	test   $0x7,%cl
    127d:	0f 84 7d 00 00 00    	je     1300 <multiplicacion_escalar_tradicional+0xe0>
    1283:	c5 f8 77             	vzeroupper 
    1286:	48 89 ca             	mov    %rcx,%rdx
    1289:	48 29 c2             	sub    %rax,%rdx
    128c:	4c 8d 42 ff          	lea    -0x1(%rdx),%r8
    1290:	49 83 f8 02          	cmp    $0x2,%r8
    1294:	76 26                	jbe    12bc <multiplicacion_escalar_tradicional+0x9c>
    1296:	c5 f9 6e d6          	vmovd  %esi,%xmm2
    129a:	4c 8d 04 87          	lea    (%rdi,%rax,4),%r8
    129e:	c5 f9 70 c2 00       	vpshufd $0x0,%xmm2,%xmm0
    12a3:	c4 c2 79 40 00       	vpmulld (%r8),%xmm0,%xmm0
    12a8:	c4 c1 7a 7f 00       	vmovdqu %xmm0,(%r8)
    12ad:	49 89 d0             	mov    %rdx,%r8
    12b0:	49 83 e0 fc          	and    $0xfffffffffffffffc,%r8
    12b4:	4c 01 c0             	add    %r8,%rax
    12b7:	4c 39 c2             	cmp    %r8,%rdx
    12ba:	74 41                	je     12fd <multiplicacion_escalar_tradicional+0xdd>
    12bc:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    12c3:	00 
    12c4:	4c 8d 04 17          	lea    (%rdi,%rdx,1),%r8
    12c8:	45 8b 08             	mov    (%r8),%r9d
    12cb:	44 0f af ce          	imul   %esi,%r9d
    12cf:	45 89 08             	mov    %r9d,(%r8)
    12d2:	4c 8d 40 01          	lea    0x1(%rax),%r8
    12d6:	4c 39 c1             	cmp    %r8,%rcx
    12d9:	76 22                	jbe    12fd <multiplicacion_escalar_tradicional+0xdd>
    12db:	4c 8d 44 17 04       	lea    0x4(%rdi,%rdx,1),%r8
    12e0:	45 8b 08             	mov    (%r8),%r9d
    12e3:	48 83 c0 02          	add    $0x2,%rax
    12e7:	44 0f af ce          	imul   %esi,%r9d
    12eb:	45 89 08             	mov    %r9d,(%r8)
    12ee:	48 39 c1             	cmp    %rax,%rcx
    12f1:	76 0a                	jbe    12fd <multiplicacion_escalar_tradicional+0xdd>
    12f3:	48 8d 44 17 08       	lea    0x8(%rdi,%rdx,1),%rax
    12f8:	0f af 30             	imul   (%rax),%esi
    12fb:	89 30                	mov    %esi,(%rax)
    12fd:	c3                   	ret    
    12fe:	66 90                	xchg   %ax,%ax
    1300:	c5 f8 77             	vzeroupper 
    1303:	c3                   	ret    
    1304:	31 c0                	xor    %eax,%eax
    1306:	e9 7b ff ff ff       	jmp    1286 <multiplicacion_escalar_tradicional+0x66>

Disassembly of section .fini:

000000000000130c <_fini>:
    130c:	f3 0f 1e fa          	endbr64 
    1310:	48 83 ec 08          	sub    $0x8,%rsp
    1314:	48 83 c4 08          	add    $0x8,%rsp
    1318:	c3                   	ret    
