
ejercicio8_O3:     file format elf64-x86-64


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
    10af:	48 83 ec 20          	sub    $0x20,%rsp
    10b3:	66 0f 6f 05 55 0f 00 	movdqa 0xf55(%rip),%xmm0        # 2010 <_IO_stdin_used+0x10>
    10ba:	00 
    10bb:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    10c2:	00 00 
    10c4:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    10c9:	31 c0                	xor    %eax,%eax
    10cb:	48 89 e3             	mov    %rsp,%rbx
    10ce:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
    10d3:	0f 29 04 24          	movaps %xmm0,(%rsp)
    10d7:	8b 13                	mov    (%rbx),%edx
    10d9:	48 89 ee             	mov    %rbp,%rsi
    10dc:	bf 01 00 00 00       	mov    $0x1,%edi
    10e1:	31 c0                	xor    %eax,%eax
    10e3:	48 83 c3 04          	add    $0x4,%rbx
    10e7:	e8 a4 ff ff ff       	call   1090 <__printf_chk@plt>
    10ec:	4c 39 e3             	cmp    %r12,%rbx
    10ef:	75 e6                	jne    10d7 <main+0x37>
    10f1:	bf 0a 00 00 00       	mov    $0xa,%edi
    10f6:	e8 75 ff ff ff       	call   1070 <putchar@plt>
    10fb:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    1100:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    1107:	00 00 
    1109:	75 0b                	jne    1116 <main+0x76>
    110b:	48 83 c4 20          	add    $0x20,%rsp
    110f:	31 c0                	xor    %eax,%eax
    1111:	5b                   	pop    %rbx
    1112:	5d                   	pop    %rbp
    1113:	41 5c                	pop    %r12
    1115:	c3                   	ret    
    1116:	e8 65 ff ff ff       	call   1080 <__stack_chk_fail@plt>
    111b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001120 <_start>:
    1120:	f3 0f 1e fa          	endbr64 
    1124:	31 ed                	xor    %ebp,%ebp
    1126:	49 89 d1             	mov    %rdx,%r9
    1129:	5e                   	pop    %rsi
    112a:	48 89 e2             	mov    %rsp,%rdx
    112d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1131:	50                   	push   %rax
    1132:	54                   	push   %rsp
    1133:	45 31 c0             	xor    %r8d,%r8d
    1136:	31 c9                	xor    %ecx,%ecx
    1138:	48 8d 3d 61 ff ff ff 	lea    -0x9f(%rip),%rdi        # 10a0 <main>
    113f:	ff 15 93 2e 00 00    	call   *0x2e93(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    1145:	f4                   	hlt    
    1146:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    114d:	00 00 00 

0000000000001150 <deregister_tm_clones>:
    1150:	48 8d 3d b9 2e 00 00 	lea    0x2eb9(%rip),%rdi        # 4010 <__TMC_END__>
    1157:	48 8d 05 b2 2e 00 00 	lea    0x2eb2(%rip),%rax        # 4010 <__TMC_END__>
    115e:	48 39 f8             	cmp    %rdi,%rax
    1161:	74 15                	je     1178 <deregister_tm_clones+0x28>
    1163:	48 8b 05 76 2e 00 00 	mov    0x2e76(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    116a:	48 85 c0             	test   %rax,%rax
    116d:	74 09                	je     1178 <deregister_tm_clones+0x28>
    116f:	ff e0                	jmp    *%rax
    1171:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1178:	c3                   	ret    
    1179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001180 <register_tm_clones>:
    1180:	48 8d 3d 89 2e 00 00 	lea    0x2e89(%rip),%rdi        # 4010 <__TMC_END__>
    1187:	48 8d 35 82 2e 00 00 	lea    0x2e82(%rip),%rsi        # 4010 <__TMC_END__>
    118e:	48 29 fe             	sub    %rdi,%rsi
    1191:	48 89 f0             	mov    %rsi,%rax
    1194:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1198:	48 c1 f8 03          	sar    $0x3,%rax
    119c:	48 01 c6             	add    %rax,%rsi
    119f:	48 d1 fe             	sar    %rsi
    11a2:	74 14                	je     11b8 <register_tm_clones+0x38>
    11a4:	48 8b 05 45 2e 00 00 	mov    0x2e45(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    11ab:	48 85 c0             	test   %rax,%rax
    11ae:	74 08                	je     11b8 <register_tm_clones+0x38>
    11b0:	ff e0                	jmp    *%rax
    11b2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    11b8:	c3                   	ret    
    11b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011c0 <__do_global_dtors_aux>:
    11c0:	f3 0f 1e fa          	endbr64 
    11c4:	80 3d 45 2e 00 00 00 	cmpb   $0x0,0x2e45(%rip)        # 4010 <__TMC_END__>
    11cb:	75 2b                	jne    11f8 <__do_global_dtors_aux+0x38>
    11cd:	55                   	push   %rbp
    11ce:	48 83 3d 22 2e 00 00 	cmpq   $0x0,0x2e22(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    11d5:	00 
    11d6:	48 89 e5             	mov    %rsp,%rbp
    11d9:	74 0c                	je     11e7 <__do_global_dtors_aux+0x27>
    11db:	48 8b 3d 26 2e 00 00 	mov    0x2e26(%rip),%rdi        # 4008 <__dso_handle>
    11e2:	e8 79 fe ff ff       	call   1060 <__cxa_finalize@plt>
    11e7:	e8 64 ff ff ff       	call   1150 <deregister_tm_clones>
    11ec:	c6 05 1d 2e 00 00 01 	movb   $0x1,0x2e1d(%rip)        # 4010 <__TMC_END__>
    11f3:	5d                   	pop    %rbp
    11f4:	c3                   	ret    
    11f5:	0f 1f 00             	nopl   (%rax)
    11f8:	c3                   	ret    
    11f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001200 <frame_dummy>:
    1200:	f3 0f 1e fa          	endbr64 
    1204:	e9 77 ff ff ff       	jmp    1180 <register_tm_clones>
    1209:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001210 <add_vectors>:
    1210:	f3 0f 1e fa          	endbr64 
    1214:	85 c9                	test   %ecx,%ecx
    1216:	0f 8e d9 00 00 00    	jle    12f5 <add_vectors+0xe5>
    121c:	4c 8d 46 04          	lea    0x4(%rsi),%r8
    1220:	48 89 d0             	mov    %rdx,%rax
    1223:	4c 29 c0             	sub    %r8,%rax
    1226:	48 83 f8 08          	cmp    $0x8,%rax
    122a:	41 0f 97 c0          	seta   %r8b
    122e:	83 f9 01             	cmp    $0x1,%ecx
    1231:	0f 95 c0             	setne  %al
    1234:	41 84 c0             	test   %al,%r8b
    1237:	0f 84 9b 00 00 00    	je     12d8 <add_vectors+0xc8>
    123d:	4c 8d 47 04          	lea    0x4(%rdi),%r8
    1241:	48 89 d0             	mov    %rdx,%rax
    1244:	4c 29 c0             	sub    %r8,%rax
    1247:	48 83 f8 08          	cmp    $0x8,%rax
    124b:	0f 86 87 00 00 00    	jbe    12d8 <add_vectors+0xc8>
    1251:	8d 41 ff             	lea    -0x1(%rcx),%eax
    1254:	41 89 c9             	mov    %ecx,%r9d
    1257:	83 f8 02             	cmp    $0x2,%eax
    125a:	0f 86 96 00 00 00    	jbe    12f6 <add_vectors+0xe6>
    1260:	41 89 c8             	mov    %ecx,%r8d
    1263:	31 c0                	xor    %eax,%eax
    1265:	41 c1 e8 02          	shr    $0x2,%r8d
    1269:	49 c1 e0 04          	shl    $0x4,%r8
    126d:	0f 1f 00             	nopl   (%rax)
    1270:	f3 0f 6f 04 07       	movdqu (%rdi,%rax,1),%xmm0
    1275:	f3 0f 6f 14 06       	movdqu (%rsi,%rax,1),%xmm2
    127a:	66 0f fe c2          	paddd  %xmm2,%xmm0
    127e:	0f 11 04 02          	movups %xmm0,(%rdx,%rax,1)
    1282:	48 83 c0 10          	add    $0x10,%rax
    1286:	49 39 c0             	cmp    %rax,%r8
    1289:	75 e5                	jne    1270 <add_vectors+0x60>
    128b:	41 89 c8             	mov    %ecx,%r8d
    128e:	41 83 e0 fc          	and    $0xfffffffc,%r8d
    1292:	44 89 c0             	mov    %r8d,%eax
    1295:	44 39 c1             	cmp    %r8d,%ecx
    1298:	74 5b                	je     12f5 <add_vectors+0xe5>
    129a:	44 29 c1             	sub    %r8d,%ecx
    129d:	41 89 c9             	mov    %ecx,%r9d
    12a0:	83 f9 01             	cmp    $0x1,%ecx
    12a3:	74 23                	je     12c8 <add_vectors+0xb8>
    12a5:	44 89 c1             	mov    %r8d,%ecx
    12a8:	f3 0f 7e 04 8f       	movq   (%rdi,%rcx,4),%xmm0
    12ad:	f3 0f 7e 0c 8e       	movq   (%rsi,%rcx,4),%xmm1
    12b2:	66 0f fe c1          	paddd  %xmm1,%xmm0
    12b6:	66 0f d6 04 8a       	movq   %xmm0,(%rdx,%rcx,4)
    12bb:	44 89 c9             	mov    %r9d,%ecx
    12be:	83 e1 fe             	and    $0xfffffffe,%ecx
    12c1:	01 c8                	add    %ecx,%eax
    12c3:	41 39 c9             	cmp    %ecx,%r9d
    12c6:	74 2d                	je     12f5 <add_vectors+0xe5>
    12c8:	48 98                	cltq   
    12ca:	8b 0c 86             	mov    (%rsi,%rax,4),%ecx
    12cd:	03 0c 87             	add    (%rdi,%rax,4),%ecx
    12d0:	89 0c 82             	mov    %ecx,(%rdx,%rax,4)
    12d3:	c3                   	ret    
    12d4:	0f 1f 40 00          	nopl   0x0(%rax)
    12d8:	48 63 c9             	movslq %ecx,%rcx
    12db:	31 c0                	xor    %eax,%eax
    12dd:	0f 1f 00             	nopl   (%rax)
    12e0:	44 8b 04 86          	mov    (%rsi,%rax,4),%r8d
    12e4:	44 03 04 87          	add    (%rdi,%rax,4),%r8d
    12e8:	44 89 04 82          	mov    %r8d,(%rdx,%rax,4)
    12ec:	48 83 c0 01          	add    $0x1,%rax
    12f0:	48 39 c8             	cmp    %rcx,%rax
    12f3:	75 eb                	jne    12e0 <add_vectors+0xd0>
    12f5:	c3                   	ret    
    12f6:	45 31 c0             	xor    %r8d,%r8d
    12f9:	31 c0                	xor    %eax,%eax
    12fb:	eb a8                	jmp    12a5 <add_vectors+0x95>

Disassembly of section .fini:

0000000000001300 <_fini>:
    1300:	f3 0f 1e fa          	endbr64 
    1304:	48 83 ec 08          	sub    $0x8,%rsp
    1308:	48 83 c4 08          	add    $0x8,%rsp
    130c:	c3                   	ret    
