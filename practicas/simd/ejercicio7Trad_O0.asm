
ejercicio7Trad_O0:     file format elf64-x86-64


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

0000000000001090 <printf@plt>:
    1090:	f3 0f 1e fa          	endbr64 
    1094:	f2 ff 25 35 2f 00 00 	bnd jmp *0x2f35(%rip)        # 3fd0 <printf@GLIBC_2.2.5>
    109b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000010a0 <_start>:
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	31 ed                	xor    %ebp,%ebp
    10a6:	49 89 d1             	mov    %rdx,%r9
    10a9:	5e                   	pop    %rsi
    10aa:	48 89 e2             	mov    %rsp,%rdx
    10ad:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    10b1:	50                   	push   %rax
    10b2:	54                   	push   %rsp
    10b3:	45 31 c0             	xor    %r8d,%r8d
    10b6:	31 c9                	xor    %ecx,%ecx
    10b8:	48 8d 3d 28 01 00 00 	lea    0x128(%rip),%rdi        # 11e7 <main>
    10bf:	ff 15 13 2f 00 00    	call   *0x2f13(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    10c5:	f4                   	hlt    
    10c6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    10cd:	00 00 00 

00000000000010d0 <deregister_tm_clones>:
    10d0:	48 8d 3d 39 2f 00 00 	lea    0x2f39(%rip),%rdi        # 4010 <__TMC_END__>
    10d7:	48 8d 05 32 2f 00 00 	lea    0x2f32(%rip),%rax        # 4010 <__TMC_END__>
    10de:	48 39 f8             	cmp    %rdi,%rax
    10e1:	74 15                	je     10f8 <deregister_tm_clones+0x28>
    10e3:	48 8b 05 f6 2e 00 00 	mov    0x2ef6(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    10ea:	48 85 c0             	test   %rax,%rax
    10ed:	74 09                	je     10f8 <deregister_tm_clones+0x28>
    10ef:	ff e0                	jmp    *%rax
    10f1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10f8:	c3                   	ret    
    10f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001100 <register_tm_clones>:
    1100:	48 8d 3d 09 2f 00 00 	lea    0x2f09(%rip),%rdi        # 4010 <__TMC_END__>
    1107:	48 8d 35 02 2f 00 00 	lea    0x2f02(%rip),%rsi        # 4010 <__TMC_END__>
    110e:	48 29 fe             	sub    %rdi,%rsi
    1111:	48 89 f0             	mov    %rsi,%rax
    1114:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1118:	48 c1 f8 03          	sar    $0x3,%rax
    111c:	48 01 c6             	add    %rax,%rsi
    111f:	48 d1 fe             	sar    %rsi
    1122:	74 14                	je     1138 <register_tm_clones+0x38>
    1124:	48 8b 05 c5 2e 00 00 	mov    0x2ec5(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    112b:	48 85 c0             	test   %rax,%rax
    112e:	74 08                	je     1138 <register_tm_clones+0x38>
    1130:	ff e0                	jmp    *%rax
    1132:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1138:	c3                   	ret    
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001140 <__do_global_dtors_aux>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	80 3d c5 2e 00 00 00 	cmpb   $0x0,0x2ec5(%rip)        # 4010 <__TMC_END__>
    114b:	75 2b                	jne    1178 <__do_global_dtors_aux+0x38>
    114d:	55                   	push   %rbp
    114e:	48 83 3d a2 2e 00 00 	cmpq   $0x0,0x2ea2(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1155:	00 
    1156:	48 89 e5             	mov    %rsp,%rbp
    1159:	74 0c                	je     1167 <__do_global_dtors_aux+0x27>
    115b:	48 8b 3d a6 2e 00 00 	mov    0x2ea6(%rip),%rdi        # 4008 <__dso_handle>
    1162:	e8 f9 fe ff ff       	call   1060 <__cxa_finalize@plt>
    1167:	e8 64 ff ff ff       	call   10d0 <deregister_tm_clones>
    116c:	c6 05 9d 2e 00 00 01 	movb   $0x1,0x2e9d(%rip)        # 4010 <__TMC_END__>
    1173:	5d                   	pop    %rbp
    1174:	c3                   	ret    
    1175:	0f 1f 00             	nopl   (%rax)
    1178:	c3                   	ret    
    1179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001180 <frame_dummy>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	e9 77 ff ff ff       	jmp    1100 <register_tm_clones>

0000000000001189 <multiplicacion_escalar_tradicional>:
    1189:	f3 0f 1e fa          	endbr64 
    118d:	55                   	push   %rbp
    118e:	48 89 e5             	mov    %rsp,%rbp
    1191:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1195:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    1199:	89 55 dc             	mov    %edx,-0x24(%rbp)
    119c:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    11a3:	00 
    11a4:	eb 33                	jmp    11d9 <multiplicacion_escalar_tradicional+0x50>
    11a6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11aa:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    11b1:	00 
    11b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11b6:	48 01 d0             	add    %rdx,%rax
    11b9:	8b 00                	mov    (%rax),%eax
    11bb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    11bf:	48 8d 0c 95 00 00 00 	lea    0x0(,%rdx,4),%rcx
    11c6:	00 
    11c7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    11cb:	48 01 ca             	add    %rcx,%rdx
    11ce:	0f af 45 dc          	imul   -0x24(%rbp),%eax
    11d2:	89 02                	mov    %eax,(%rdx)
    11d4:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    11d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11dd:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
    11e1:	72 c3                	jb     11a6 <multiplicacion_escalar_tradicional+0x1d>
    11e3:	90                   	nop
    11e4:	90                   	nop
    11e5:	5d                   	pop    %rbp
    11e6:	c3                   	ret    

00000000000011e7 <main>:
    11e7:	f3 0f 1e fa          	endbr64 
    11eb:	55                   	push   %rbp
    11ec:	48 89 e5             	mov    %rsp,%rbp
    11ef:	48 83 ec 50          	sub    $0x50,%rsp
    11f3:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    11fa:	00 00 
    11fc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1200:	31 c0                	xor    %eax,%eax
    1202:	c7 45 d0 01 00 00 00 	movl   $0x1,-0x30(%rbp)
    1209:	c7 45 d4 02 00 00 00 	movl   $0x2,-0x2c(%rbp)
    1210:	c7 45 d8 03 00 00 00 	movl   $0x3,-0x28(%rbp)
    1217:	c7 45 dc 04 00 00 00 	movl   $0x4,-0x24(%rbp)
    121e:	c7 45 e0 05 00 00 00 	movl   $0x5,-0x20(%rbp)
    1225:	c7 45 e4 06 00 00 00 	movl   $0x6,-0x1c(%rbp)
    122c:	c7 45 e8 07 00 00 00 	movl   $0x7,-0x18(%rbp)
    1233:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%rbp)
    123a:	48 c7 45 c8 08 00 00 	movq   $0x8,-0x38(%rbp)
    1241:	00 
    1242:	c7 45 bc 02 00 00 00 	movl   $0x2,-0x44(%rbp)
    1249:	8b 55 bc             	mov    -0x44(%rbp),%edx
    124c:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    1250:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    1254:	48 89 ce             	mov    %rcx,%rsi
    1257:	48 89 c7             	mov    %rax,%rdi
    125a:	e8 2a ff ff ff       	call   1189 <multiplicacion_escalar_tradicional>
    125f:	48 c7 45 c0 00 00 00 	movq   $0x0,-0x40(%rbp)
    1266:	00 
    1267:	eb 23                	jmp    128c <main+0xa5>
    1269:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    126d:	8b 44 85 d0          	mov    -0x30(%rbp,%rax,4),%eax
    1271:	89 c6                	mov    %eax,%esi
    1273:	48 8d 05 8a 0d 00 00 	lea    0xd8a(%rip),%rax        # 2004 <_IO_stdin_used+0x4>
    127a:	48 89 c7             	mov    %rax,%rdi
    127d:	b8 00 00 00 00       	mov    $0x0,%eax
    1282:	e8 09 fe ff ff       	call   1090 <printf@plt>
    1287:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
    128c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1290:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
    1294:	72 d3                	jb     1269 <main+0x82>
    1296:	bf 0a 00 00 00       	mov    $0xa,%edi
    129b:	e8 d0 fd ff ff       	call   1070 <putchar@plt>
    12a0:	b8 00 00 00 00       	mov    $0x0,%eax
    12a5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    12a9:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
    12b0:	00 00 
    12b2:	74 05                	je     12b9 <main+0xd2>
    12b4:	e8 c7 fd ff ff       	call   1080 <__stack_chk_fail@plt>
    12b9:	c9                   	leave  
    12ba:	c3                   	ret    

Disassembly of section .fini:

00000000000012bc <_fini>:
    12bc:	f3 0f 1e fa          	endbr64 
    12c0:	48 83 ec 08          	sub    $0x8,%rsp
    12c4:	48 83 c4 08          	add    $0x8,%rsp
    12c8:	c3                   	ret    
