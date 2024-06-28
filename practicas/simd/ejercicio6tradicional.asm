
ejercicio6Tradicional:     file format elf64-x86-64


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
    106d:	48 8d 35 90 0f 00 00 	lea    0xf90(%rip),%rsi        # 2004 <_IO_stdin_used+0x4>
    1074:	bf 01 00 00 00       	mov    $0x1,%edi
    1079:	31 c0                	xor    %eax,%eax
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
    1184:	48 89 f2             	mov    %rsi,%rdx
    1187:	48 85 f6             	test   %rsi,%rsi
    118a:	0f 84 28 01 00 00    	je     12b8 <maximo_tradicional+0x138>
    1190:	48 8d 46 ff          	lea    -0x1(%rsi),%rax
    1194:	48 83 f8 06          	cmp    $0x6,%rax
    1198:	0f 86 26 01 00 00    	jbe    12c4 <maximo_tradicional+0x144>
    119e:	48 89 f1             	mov    %rsi,%rcx
    11a1:	48 c1 e9 03          	shr    $0x3,%rcx
    11a5:	48 c1 e1 05          	shl    $0x5,%rcx
    11a9:	c5 fd 6f 0d 6f 0e 00 	vmovdqa 0xe6f(%rip),%ymm1        # 2020 <_IO_stdin_used+0x20>
    11b0:	00 
    11b1:	48 89 f8             	mov    %rdi,%rax
    11b4:	48 01 f9             	add    %rdi,%rcx
    11b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    11be:	00 00 
    11c0:	c4 e2 75 3d 08       	vpmaxsd (%rax),%ymm1,%ymm1
    11c5:	48 83 c0 20          	add    $0x20,%rax
    11c9:	48 39 c8             	cmp    %rcx,%rax
    11cc:	75 f2                	jne    11c0 <maximo_tradicional+0x40>
    11ce:	c4 e3 7d 39 c8 01    	vextracti128 $0x1,%ymm1,%xmm0
    11d4:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    11d9:	c5 f1 73 d8 08       	vpsrldq $0x8,%xmm0,%xmm1
    11de:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    11e3:	c5 f1 73 d8 04       	vpsrldq $0x4,%xmm0,%xmm1
    11e8:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    11ed:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    11f1:	48 89 d1             	mov    %rdx,%rcx
    11f4:	c5 f9 6e c0          	vmovd  %eax,%xmm0
    11f8:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    11fc:	f6 c2 07             	test   $0x7,%dl
    11ff:	0f 84 bb 00 00 00    	je     12c0 <maximo_tradicional+0x140>
    1205:	c5 f8 77             	vzeroupper 
    1208:	c5 f9 6e 0c 8f       	vmovd  (%rdi,%rcx,4),%xmm1
    120d:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    1212:	4c 8d 41 01          	lea    0x1(%rcx),%r8
    1216:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    121d:	00 
    121e:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    1222:	4c 39 c2             	cmp    %r8,%rdx
    1225:	0f 86 92 00 00 00    	jbe    12bd <maximo_tradicional+0x13d>
    122b:	c5 f9 6e 4c 37 04    	vmovd  0x4(%rdi,%rsi,1),%xmm1
    1231:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    1236:	4c 8d 41 02          	lea    0x2(%rcx),%r8
    123a:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    123e:	4c 39 c2             	cmp    %r8,%rdx
    1241:	76 7a                	jbe    12bd <maximo_tradicional+0x13d>
    1243:	c5 f9 6e 4c 37 08    	vmovd  0x8(%rdi,%rsi,1),%xmm1
    1249:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    124e:	4c 8d 41 03          	lea    0x3(%rcx),%r8
    1252:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    1256:	4c 39 c2             	cmp    %r8,%rdx
    1259:	76 62                	jbe    12bd <maximo_tradicional+0x13d>
    125b:	c5 f9 6e 4c 37 0c    	vmovd  0xc(%rdi,%rsi,1),%xmm1
    1261:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    1266:	4c 8d 41 04          	lea    0x4(%rcx),%r8
    126a:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    126e:	4c 39 c2             	cmp    %r8,%rdx
    1271:	76 4a                	jbe    12bd <maximo_tradicional+0x13d>
    1273:	c5 f9 6e 4c 37 10    	vmovd  0x10(%rdi,%rsi,1),%xmm1
    1279:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    127e:	4c 8d 41 05          	lea    0x5(%rcx),%r8
    1282:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    1286:	4c 39 c2             	cmp    %r8,%rdx
    1289:	76 32                	jbe    12bd <maximo_tradicional+0x13d>
    128b:	c5 f9 6e 4c 37 14    	vmovd  0x14(%rdi,%rsi,1),%xmm1
    1291:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    1296:	48 83 c1 06          	add    $0x6,%rcx
    129a:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    129e:	48 39 ca             	cmp    %rcx,%rdx
    12a1:	76 1a                	jbe    12bd <maximo_tradicional+0x13d>
    12a3:	c5 f9 6e 4c 37 18    	vmovd  0x18(%rdi,%rsi,1),%xmm1
    12a9:	c4 e2 79 3d c1       	vpmaxsd %xmm1,%xmm0,%xmm0
    12ae:	c5 f9 7e c0          	vmovd  %xmm0,%eax
    12b2:	c3                   	ret    
    12b3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    12b8:	b8 00 00 00 80       	mov    $0x80000000,%eax
    12bd:	c3                   	ret    
    12be:	66 90                	xchg   %ax,%ax
    12c0:	c5 f8 77             	vzeroupper 
    12c3:	c3                   	ret    
    12c4:	c5 f9 6f 05 74 0d 00 	vmovdqa 0xd74(%rip),%xmm0        # 2040 <_IO_stdin_used+0x40>
    12cb:	00 
    12cc:	31 c9                	xor    %ecx,%ecx
    12ce:	e9 35 ff ff ff       	jmp    1208 <maximo_tradicional+0x88>

Disassembly of section .fini:

00000000000012d4 <_fini>:
    12d4:	f3 0f 1e fa          	endbr64 
    12d8:	48 83 ec 08          	sub    $0x8,%rsp
    12dc:	48 83 c4 08          	add    $0x8,%rsp
    12e0:	c3                   	ret    
