
ejercicio7Trad_O3:     file format elf64-x86-64


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
    10a4:	41 54                	push   %r12
    10a6:	55                   	push   %rbp
    10a7:	48 8d 2d 56 0f 00 00 	lea    0xf56(%rip),%rbp        # 2004 <_IO_stdin_used+0x4>
    10ae:	53                   	push   %rbx
    10af:	48 83 ec 30          	sub    $0x30,%rsp
    10b3:	66 0f 6f 05 55 0f 00 	movdqa 0xf55(%rip),%xmm0        # 2010 <_IO_stdin_used+0x10>
    10ba:	00 
    10bb:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    10c2:	00 00 
    10c4:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    10c9:	31 c0                	xor    %eax,%eax
    10cb:	48 89 e3             	mov    %rsp,%rbx
    10ce:	4c 8d 64 24 20       	lea    0x20(%rsp),%r12
    10d3:	0f 29 04 24          	movaps %xmm0,(%rsp)
    10d7:	66 0f 6f 05 41 0f 00 	movdqa 0xf41(%rip),%xmm0        # 2020 <_IO_stdin_used+0x20>
    10de:	00 
    10df:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
    10e4:	0f 1f 40 00          	nopl   0x0(%rax)
    10e8:	8b 13                	mov    (%rbx),%edx
    10ea:	48 89 ee             	mov    %rbp,%rsi
    10ed:	bf 01 00 00 00       	mov    $0x1,%edi
    10f2:	31 c0                	xor    %eax,%eax
    10f4:	48 83 c3 04          	add    $0x4,%rbx
    10f8:	e8 93 ff ff ff       	call   1090 <__printf_chk@plt>
    10fd:	4c 39 e3             	cmp    %r12,%rbx
    1100:	75 e6                	jne    10e8 <main+0x48>
    1102:	bf 0a 00 00 00       	mov    $0xa,%edi
    1107:	e8 64 ff ff ff       	call   1070 <putchar@plt>
    110c:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
    1111:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    1118:	00 00 
    111a:	75 0b                	jne    1127 <main+0x87>
    111c:	48 83 c4 30          	add    $0x30,%rsp
    1120:	31 c0                	xor    %eax,%eax
    1122:	5b                   	pop    %rbx
    1123:	5d                   	pop    %rbp
    1124:	41 5c                	pop    %r12
    1126:	c3                   	ret    
    1127:	e8 54 ff ff ff       	call   1080 <__stack_chk_fail@plt>
    112c:	0f 1f 40 00          	nopl   0x0(%rax)

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
    1227:	49 89 f8             	mov    %rdi,%r8
    122a:	89 d6                	mov    %edx,%esi
    122c:	48 85 c9             	test   %rcx,%rcx
    122f:	0f 84 b8 00 00 00    	je     12ed <multiplicacion_escalar_tradicional+0xcd>
    1235:	48 8d 41 ff          	lea    -0x1(%rcx),%rax
    1239:	48 83 f8 02          	cmp    $0x2,%rax
    123d:	0f 86 ae 00 00 00    	jbe    12f1 <multiplicacion_escalar_tradicional+0xd1>
    1243:	66 0f 6e e2          	movd   %edx,%xmm4
    1247:	48 89 ca             	mov    %rcx,%rdx
    124a:	48 89 f8             	mov    %rdi,%rax
    124d:	66 0f 70 d4 00       	pshufd $0x0,%xmm4,%xmm2
    1252:	48 c1 ea 02          	shr    $0x2,%rdx
    1256:	48 c1 e2 04          	shl    $0x4,%rdx
    125a:	66 0f 6f da          	movdqa %xmm2,%xmm3
    125e:	48 01 fa             	add    %rdi,%rdx
    1261:	66 0f 73 d3 20       	psrlq  $0x20,%xmm3
    1266:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    126d:	00 00 00 
    1270:	f3 0f 6f 00          	movdqu (%rax),%xmm0
    1274:	f3 0f 6f 08          	movdqu (%rax),%xmm1
    1278:	48 83 c0 10          	add    $0x10,%rax
    127c:	66 0f 73 d0 20       	psrlq  $0x20,%xmm0
    1281:	66 0f f4 ca          	pmuludq %xmm2,%xmm1
    1285:	66 0f f4 c3          	pmuludq %xmm3,%xmm0
    1289:	66 0f 70 c9 08       	pshufd $0x8,%xmm1,%xmm1
    128e:	66 0f 70 c0 08       	pshufd $0x8,%xmm0,%xmm0
    1293:	66 0f 62 c8          	punpckldq %xmm0,%xmm1
    1297:	0f 11 48 f0          	movups %xmm1,-0x10(%rax)
    129b:	48 39 d0             	cmp    %rdx,%rax
    129e:	75 d0                	jne    1270 <multiplicacion_escalar_tradicional+0x50>
    12a0:	48 89 c8             	mov    %rcx,%rax
    12a3:	48 83 e0 fc          	and    $0xfffffffffffffffc,%rax
    12a7:	f6 c1 03             	test   $0x3,%cl
    12aa:	74 44                	je     12f0 <multiplicacion_escalar_tradicional+0xd0>
    12ac:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    12b3:	00 
    12b4:	49 8d 3c 10          	lea    (%r8,%rdx,1),%rdi
    12b8:	44 8b 0f             	mov    (%rdi),%r9d
    12bb:	44 0f af ce          	imul   %esi,%r9d
    12bf:	44 89 0f             	mov    %r9d,(%rdi)
    12c2:	48 8d 78 01          	lea    0x1(%rax),%rdi
    12c6:	48 39 f9             	cmp    %rdi,%rcx
    12c9:	76 22                	jbe    12ed <multiplicacion_escalar_tradicional+0xcd>
    12cb:	49 8d 7c 10 04       	lea    0x4(%r8,%rdx,1),%rdi
    12d0:	48 83 c0 02          	add    $0x2,%rax
    12d4:	44 8b 0f             	mov    (%rdi),%r9d
    12d7:	44 0f af ce          	imul   %esi,%r9d
    12db:	44 89 0f             	mov    %r9d,(%rdi)
    12de:	48 39 c1             	cmp    %rax,%rcx
    12e1:	76 0a                	jbe    12ed <multiplicacion_escalar_tradicional+0xcd>
    12e3:	49 8d 44 10 08       	lea    0x8(%r8,%rdx,1),%rax
    12e8:	0f af 30             	imul   (%rax),%esi
    12eb:	89 30                	mov    %esi,(%rax)
    12ed:	c3                   	ret    
    12ee:	66 90                	xchg   %ax,%ax
    12f0:	c3                   	ret    
    12f1:	31 c0                	xor    %eax,%eax
    12f3:	eb b7                	jmp    12ac <multiplicacion_escalar_tradicional+0x8c>

Disassembly of section .fini:

00000000000012f8 <_fini>:
    12f8:	f3 0f 1e fa          	endbr64 
    12fc:	48 83 ec 08          	sub    $0x8,%rsp
    1300:	48 83 c4 08          	add    $0x8,%rsp
    1304:	c3                   	ret    
