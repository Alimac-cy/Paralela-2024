
ejercicio7simd:     file format elf64-x86-64


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
    10b3:	c5 f9 6f 05 55 0f 00 	vmovdqa 0xf55(%rip),%xmm0        # 2010 <_IO_stdin_used+0x10>
    10ba:	00 
    10bb:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    10c2:	00 00 
    10c4:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    10c9:	31 c0                	xor    %eax,%eax
    10cb:	c5 f9 7f 04 24       	vmovdqa %xmm0,(%rsp)
    10d0:	c5 f9 6f 05 48 0f 00 	vmovdqa 0xf48(%rip),%xmm0        # 2020 <_IO_stdin_used+0x20>
    10d7:	00 
    10d8:	48 89 e3             	mov    %rsp,%rbx
    10db:	c5 f9 7f 44 24 10    	vmovdqa %xmm0,0x10(%rsp)
    10e1:	4c 8d 64 24 20       	lea    0x20(%rsp),%r12
    10e6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    10ed:	00 00 00 
    10f0:	8b 13                	mov    (%rbx),%edx
    10f2:	48 89 ee             	mov    %rbp,%rsi
    10f5:	bf 01 00 00 00       	mov    $0x1,%edi
    10fa:	31 c0                	xor    %eax,%eax
    10fc:	48 83 c3 04          	add    $0x4,%rbx
    1100:	e8 8b ff ff ff       	call   1090 <__printf_chk@plt>
    1105:	4c 39 e3             	cmp    %r12,%rbx
    1108:	75 e6                	jne    10f0 <main+0x50>
    110a:	bf 0a 00 00 00       	mov    $0xa,%edi
    110f:	e8 5c ff ff ff       	call   1070 <putchar@plt>
    1114:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
    1119:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    1120:	00 00 
    1122:	75 0b                	jne    112f <main+0x8f>
    1124:	48 83 c4 30          	add    $0x30,%rsp
    1128:	5b                   	pop    %rbx
    1129:	5d                   	pop    %rbp
    112a:	31 c0                	xor    %eax,%eax
    112c:	41 5c                	pop    %r12
    112e:	c3                   	ret    
    112f:	e8 4c ff ff ff       	call   1080 <__stack_chk_fail@plt>
    1134:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    113b:	00 00 00 
    113e:	66 90                	xchg   %ax,%ax

0000000000001140 <_start>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	31 ed                	xor    %ebp,%ebp
    1146:	49 89 d1             	mov    %rdx,%r9
    1149:	5e                   	pop    %rsi
    114a:	48 89 e2             	mov    %rsp,%rdx
    114d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1151:	50                   	push   %rax
    1152:	54                   	push   %rsp
    1153:	45 31 c0             	xor    %r8d,%r8d
    1156:	31 c9                	xor    %ecx,%ecx
    1158:	48 8d 3d 41 ff ff ff 	lea    -0xbf(%rip),%rdi        # 10a0 <main>
    115f:	ff 15 73 2e 00 00    	call   *0x2e73(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    1165:	f4                   	hlt    
    1166:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    116d:	00 00 00 

0000000000001170 <deregister_tm_clones>:
    1170:	48 8d 3d 99 2e 00 00 	lea    0x2e99(%rip),%rdi        # 4010 <__TMC_END__>
    1177:	48 8d 05 92 2e 00 00 	lea    0x2e92(%rip),%rax        # 4010 <__TMC_END__>
    117e:	48 39 f8             	cmp    %rdi,%rax
    1181:	74 15                	je     1198 <deregister_tm_clones+0x28>
    1183:	48 8b 05 56 2e 00 00 	mov    0x2e56(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    118a:	48 85 c0             	test   %rax,%rax
    118d:	74 09                	je     1198 <deregister_tm_clones+0x28>
    118f:	ff e0                	jmp    *%rax
    1191:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1198:	c3                   	ret    
    1199:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011a0 <register_tm_clones>:
    11a0:	48 8d 3d 69 2e 00 00 	lea    0x2e69(%rip),%rdi        # 4010 <__TMC_END__>
    11a7:	48 8d 35 62 2e 00 00 	lea    0x2e62(%rip),%rsi        # 4010 <__TMC_END__>
    11ae:	48 29 fe             	sub    %rdi,%rsi
    11b1:	48 89 f0             	mov    %rsi,%rax
    11b4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    11b8:	48 c1 f8 03          	sar    $0x3,%rax
    11bc:	48 01 c6             	add    %rax,%rsi
    11bf:	48 d1 fe             	sar    %rsi
    11c2:	74 14                	je     11d8 <register_tm_clones+0x38>
    11c4:	48 8b 05 25 2e 00 00 	mov    0x2e25(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    11cb:	48 85 c0             	test   %rax,%rax
    11ce:	74 08                	je     11d8 <register_tm_clones+0x38>
    11d0:	ff e0                	jmp    *%rax
    11d2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    11d8:	c3                   	ret    
    11d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011e0 <__do_global_dtors_aux>:
    11e0:	f3 0f 1e fa          	endbr64 
    11e4:	80 3d 25 2e 00 00 00 	cmpb   $0x0,0x2e25(%rip)        # 4010 <__TMC_END__>
    11eb:	75 2b                	jne    1218 <__do_global_dtors_aux+0x38>
    11ed:	55                   	push   %rbp
    11ee:	48 83 3d 02 2e 00 00 	cmpq   $0x0,0x2e02(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    11f5:	00 
    11f6:	48 89 e5             	mov    %rsp,%rbp
    11f9:	74 0c                	je     1207 <__do_global_dtors_aux+0x27>
    11fb:	48 8b 3d 06 2e 00 00 	mov    0x2e06(%rip),%rdi        # 4008 <__dso_handle>
    1202:	e8 59 fe ff ff       	call   1060 <__cxa_finalize@plt>
    1207:	e8 64 ff ff ff       	call   1170 <deregister_tm_clones>
    120c:	c6 05 fd 2d 00 00 01 	movb   $0x1,0x2dfd(%rip)        # 4010 <__TMC_END__>
    1213:	5d                   	pop    %rbp
    1214:	c3                   	ret    
    1215:	0f 1f 00             	nopl   (%rax)
    1218:	c3                   	ret    
    1219:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001220 <frame_dummy>:
    1220:	f3 0f 1e fa          	endbr64 
    1224:	e9 77 ff ff ff       	jmp    11a0 <register_tm_clones>
    1229:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001230 <multiplicacion_escalar_SIMD>:
    1230:	f3 0f 1e fa          	endbr64 
    1234:	c5 f9 6e d2          	vmovd  %edx,%xmm2
    1238:	41 89 d0             	mov    %edx,%r8d
    123b:	c5 f9 70 ca 00       	vpshufd $0x0,%xmm2,%xmm1
    1240:	48 83 fe 03          	cmp    $0x3,%rsi
    1244:	0f 86 b6 00 00 00    	jbe    1300 <multiplicacion_escalar_SIMD+0xd0>
    124a:	48 8d 56 fc          	lea    -0x4(%rsi),%rdx
    124e:	48 89 d1             	mov    %rdx,%rcx
    1251:	48 c1 e9 02          	shr    $0x2,%rcx
    1255:	48 c1 e1 04          	shl    $0x4,%rcx
    1259:	48 89 f8             	mov    %rdi,%rax
    125c:	48 8d 4c 0f 10       	lea    0x10(%rdi,%rcx,1),%rcx
    1261:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1268:	c4 e2 71 40 00       	vpmulld (%rax),%xmm1,%xmm0
    126d:	48 83 c0 10          	add    $0x10,%rax
    1271:	c5 fa 7f 40 f0       	vmovdqu %xmm0,-0x10(%rax)
    1276:	48 39 c8             	cmp    %rcx,%rax
    1279:	75 ed                	jne    1268 <multiplicacion_escalar_SIMD+0x38>
    127b:	48 83 e2 fc          	and    $0xfffffffffffffffc,%rdx
    127f:	48 8d 42 04          	lea    0x4(%rdx),%rax
    1283:	48 39 c6             	cmp    %rax,%rsi
    1286:	76 6f                	jbe    12f7 <multiplicacion_escalar_SIMD+0xc7>
    1288:	48 89 f2             	mov    %rsi,%rdx
    128b:	48 29 c2             	sub    %rax,%rdx
    128e:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
    1292:	48 83 f9 02          	cmp    $0x2,%rcx
    1296:	76 1c                	jbe    12b4 <multiplicacion_escalar_SIMD+0x84>
    1298:	48 8d 0c 87          	lea    (%rdi,%rax,4),%rcx
    129c:	c4 e2 71 40 09       	vpmulld (%rcx),%xmm1,%xmm1
    12a1:	c5 fa 7f 09          	vmovdqu %xmm1,(%rcx)
    12a5:	48 89 d1             	mov    %rdx,%rcx
    12a8:	48 83 e1 fc          	and    $0xfffffffffffffffc,%rcx
    12ac:	48 01 c8             	add    %rcx,%rax
    12af:	48 39 d1             	cmp    %rdx,%rcx
    12b2:	74 43                	je     12f7 <multiplicacion_escalar_SIMD+0xc7>
    12b4:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    12bb:	00 
    12bc:	48 8d 0c 17          	lea    (%rdi,%rdx,1),%rcx
    12c0:	44 8b 09             	mov    (%rcx),%r9d
    12c3:	45 0f af c8          	imul   %r8d,%r9d
    12c7:	44 89 09             	mov    %r9d,(%rcx)
    12ca:	48 8d 48 01          	lea    0x1(%rax),%rcx
    12ce:	48 39 ce             	cmp    %rcx,%rsi
    12d1:	76 24                	jbe    12f7 <multiplicacion_escalar_SIMD+0xc7>
    12d3:	48 8d 4c 17 04       	lea    0x4(%rdi,%rdx,1),%rcx
    12d8:	44 8b 09             	mov    (%rcx),%r9d
    12db:	48 83 c0 02          	add    $0x2,%rax
    12df:	45 0f af c8          	imul   %r8d,%r9d
    12e3:	44 89 09             	mov    %r9d,(%rcx)
    12e6:	48 39 c6             	cmp    %rax,%rsi
    12e9:	76 0c                	jbe    12f7 <multiplicacion_escalar_SIMD+0xc7>
    12eb:	48 8d 44 17 08       	lea    0x8(%rdi,%rdx,1),%rax
    12f0:	44 0f af 00          	imul   (%rax),%r8d
    12f4:	44 89 00             	mov    %r8d,(%rax)
    12f7:	c3                   	ret    
    12f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    12ff:	00 
    1300:	31 c0                	xor    %eax,%eax
    1302:	e9 7c ff ff ff       	jmp    1283 <multiplicacion_escalar_SIMD+0x53>

Disassembly of section .fini:

0000000000001308 <_fini>:
    1308:	f3 0f 1e fa          	endbr64 
    130c:	48 83 ec 08          	sub    $0x8,%rsp
    1310:	48 83 c4 08          	add    $0x8,%rsp
    1314:	c3                   	ret    
