	.file	"main.prof"
	.text
	.globl	BZ2_blockSort
	.align	16, 0x90
	.type	BZ2_blockSort,@function
BZ2_blockSort:                          # @BZ2_blockSort
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$88, %rsp
.Ltmp1:
	.cfi_def_cfa_offset 96
	incl	EdgeProfCounters(%rip)
	movq	%rdi, 80(%rsp)
	movq	56(%rdi), %rax
	movq	%rax, 72(%rsp)
	movq	80(%rsp), %rax
	movq	64(%rax), %rax
	movq	%rax, 64(%rsp)
	movq	80(%rsp), %rax
	movq	40(%rax), %rax
	movq	%rax, 56(%rsp)
	movq	80(%rsp), %rax
	movl	108(%rax), %eax
	movl	%eax, 52(%rsp)
	movq	80(%rsp), %rax
	movl	656(%rax), %eax
	movl	%eax, 48(%rsp)
	movq	80(%rsp), %rax
	movl	88(%rax), %eax
	movl	%eax, 44(%rsp)
	cmpl	$9999, 52(%rsp)         # imm = 0x270F
	jg	.LBB0_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+4(%rip)
	movq	80(%rsp), %rax
	movq	24(%rax), %rdi
	movq	32(%rax), %rsi
	movl	48(%rsp), %r8d
	movl	52(%rsp), %ecx
	movq	56(%rsp), %rdx
	callq	fallbackSort
	incl	EdgeProfCounters+12(%rip)
	jmp	.LBB0_24
.LBB0_2:                                # %if.else
	incl	EdgeProfCounters+8(%rip)
	movl	52(%rsp), %eax
	addl	$34, %eax
	movl	%eax, 20(%rsp)
	testb	$1, 20(%rsp)
	je	.LBB0_3
# BB#4:                                 # %if.then5
	incl	EdgeProfCounters+16(%rip)
	incl	20(%rsp)
	incl	EdgeProfCounters+24(%rip)
	jmp	.LBB0_5
.LBB0_3:                                # %if.else.if.end_crit_edge
	incl	EdgeProfCounters+20(%rip)
.LBB0_5:                                # %if.end
	movslq	20(%rsp), %rax
	addq	64(%rsp), %rax
	movq	%rax, 32(%rsp)
	cmpl	$0, 44(%rsp)
	jle	.LBB0_7
# BB#6:                                 # %if.end.if.end8_crit_edge
	incl	EdgeProfCounters+32(%rip)
	jmp	.LBB0_8
.LBB0_7:                                # %if.then7
	incl	EdgeProfCounters+28(%rip)
	movl	$1, 44(%rsp)
	incl	EdgeProfCounters+36(%rip)
.LBB0_8:                                # %if.end8
	cmpl	$100, 44(%rsp)
	jle	.LBB0_9
# BB#10:                                # %if.then10
	incl	EdgeProfCounters+40(%rip)
	movl	$100, 44(%rsp)
	incl	EdgeProfCounters+48(%rip)
	jmp	.LBB0_11
.LBB0_9:                                # %if.end8.if.end11_crit_edge
	incl	EdgeProfCounters+44(%rip)
.LBB0_11:                               # %if.end11
	movl	44(%rsp), %eax
	decl	%eax
	movslq	%eax, %rax
	imulq	$1431655766, %rax, %rax # imm = 0x55555556
	movq	%rax, %rcx
	shrq	$63, %rcx
	shrq	$32, %rax
	addl	%ecx, %eax
	leaq	28(%rsp), %r10
	imull	52(%rsp), %eax
	movl	%eax, 24(%rsp)
	movl	%eax, 28(%rsp)
	movl	48(%rsp), %r9d
	movl	52(%rsp), %r8d
	movq	56(%rsp), %rcx
	movq	32(%rsp), %rdx
	movq	64(%rsp), %rsi
	movq	72(%rsp), %rdi
	movq	%r10, (%rsp)
	callq	mainSort
	cmpl	$2, 48(%rsp)
	jle	.LBB0_12
# BB#13:                                # %if.then13
	incl	EdgeProfCounters+52(%rip)
	movl	24(%rsp), %edx
	subl	28(%rsp), %edx
	cvtsi2ss	%edx, %xmm0
	movl	52(%rsp), %ecx
	movq	stderr(%rip), %rdi
	testl	%ecx, %ecx
	je	.LBB0_14
# BB#15:                                # %cond.false
	incl	EdgeProfCounters+64(%rip)
	movl	52(%rsp), %eax
	incl	EdgeProfCounters+72(%rip)
	jmp	.LBB0_16
.LBB0_12:                               # %if.end11.if.end21_crit_edge
	incl	EdgeProfCounters+56(%rip)
	jmp	.LBB0_17
.LBB0_14:                               # %cond.true
	incl	EdgeProfCounters+60(%rip)
	incl	EdgeProfCounters+68(%rip)
	movl	$1, %eax
.LBB0_16:                               # %cond.end
	cvtsi2ss	%eax, %xmm1
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str, %esi
	movb	$1, %al
	callq	fprintf
	incl	EdgeProfCounters+76(%rip)
.LBB0_17:                               # %if.end21
	cmpl	$0, 28(%rsp)
	js	.LBB0_19
# BB#18:                                # %if.end21.if.end32_crit_edge
	incl	EdgeProfCounters+84(%rip)
	jmp	.LBB0_23
.LBB0_19:                               # %if.then24
	incl	EdgeProfCounters+80(%rip)
	cmpl	$1, 48(%rsp)
	jle	.LBB0_20
# BB#21:                                # %if.then27
	incl	EdgeProfCounters+88(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str1, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+96(%rip)
	jmp	.LBB0_22
.LBB0_20:                               # %if.then24.if.end29_crit_edge
	incl	EdgeProfCounters+92(%rip)
.LBB0_22:                               # %if.end29
	movq	80(%rsp), %rax
	movq	24(%rax), %rdi
	movq	32(%rax), %rsi
	movl	48(%rsp), %r8d
	movl	52(%rsp), %ecx
	movq	56(%rsp), %rdx
	callq	fallbackSort
	incl	EdgeProfCounters+100(%rip)
.LBB0_23:                               # %if.end32
	incl	EdgeProfCounters+104(%rip)
.LBB0_24:                               # %if.end33
	movq	80(%rsp), %rax
	movl	$-1, 48(%rax)
	movl	$0, 20(%rsp)
	incl	EdgeProfCounters+108(%rip)
	jmp	.LBB0_25
	.align	16, 0x90
.LBB0_31:                               # %if.end43
                                        #   in Loop: Header=BB0_25 Depth=1
	incl	EdgeProfCounters+124(%rip)
	incl	EdgeProfCounters+132(%rip)
	incl	20(%rsp)
	incl	EdgeProfCounters+136(%rip)
.LBB0_25:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	80(%rsp), %rax
	movl	20(%rsp), %ecx
	cmpl	108(%rax), %ecx
	jge	.LBB0_26
# BB#29:                                # %for.body
                                        #   in Loop: Header=BB0_25 Depth=1
	incl	EdgeProfCounters+112(%rip)
	movslq	20(%rsp), %rax
	movq	72(%rsp), %rcx
	cmpl	$0, (%rcx,%rax,4)
	jne	.LBB0_31
# BB#30:                                # %if.then41
	incl	EdgeProfCounters+120(%rip)
	movq	80(%rsp), %rax
	movl	20(%rsp), %ecx
	movl	%ecx, 48(%rax)
	incl	EdgeProfCounters+128(%rip)
	jmp	.LBB0_27
.LBB0_26:                               # %for.cond.for.end_crit_edge
	incl	EdgeProfCounters+116(%rip)
.LBB0_27:                               # %for.end
	movq	80(%rsp), %rax
	cmpl	$-1, 48(%rax)
	je	.LBB0_32
# BB#28:                                # %for.end.if.end49_crit_edge
	incl	EdgeProfCounters+140(%rip)
	addq	$88, %rsp
	ret
.LBB0_32:                               # %if.then48
	incl	EdgeProfCounters+144(%rip)
	movl	$1003, %edi             # imm = 0x3EB
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+148(%rip)
	addq	$88, %rsp
	ret
.Ltmp2:
	.size	BZ2_blockSort, .Ltmp2-BZ2_blockSort
	.cfi_endproc

	.align	16, 0x90
	.type	fallbackSort,@function
fallbackSort:                           # @fallbackSort
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp5:
	.cfi_def_cfa_offset 16
	subq	$2144, %rsp             # imm = 0x860
.Ltmp6:
	.cfi_def_cfa_offset 2160
.Ltmp7:
	.cfi_offset %rbx, -16
	incl	EdgeProfCounters+152(%rip)
	movq	%rdi, 2136(%rsp)
	movq	%rsi, 2128(%rsp)
	movq	%rdx, 2120(%rsp)
	movl	%ecx, 2116(%rsp)
	movl	%r8d, 2112(%rsp)
	movq	2128(%rsp), %rax
	movq	%rax, (%rsp)
	cmpl	$3, 2112(%rsp)
	jle	.LBB1_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+156(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str3, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+164(%rip)
	jmp	.LBB1_3
.LBB1_1:                                # %entry.if.end_crit_edge
	incl	EdgeProfCounters+160(%rip)
.LBB1_3:                                # %if.end
	movl	$0, 40(%rsp)
	incl	EdgeProfCounters+168(%rip)
	jmp	.LBB1_4
	.align	16, 0x90
.LBB1_5:                                # %for.body
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+172(%rip)
	movslq	40(%rsp), %rax
	movl	$0, 1072(%rsp,%rax,4)
	incl	EdgeProfCounters+180(%rip)
	incl	40(%rsp)
	incl	EdgeProfCounters+184(%rip)
.LBB1_4:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$256, 40(%rsp)          # imm = 0x100
	jle	.LBB1_5
# BB#6:                                 # %for.end
	incl	EdgeProfCounters+176(%rip)
	movl	$0, 40(%rsp)
	incl	EdgeProfCounters+188(%rip)
	jmp	.LBB1_7
	.align	16, 0x90
.LBB1_8:                                # %for.body4
                                        #   in Loop: Header=BB1_7 Depth=1
	incl	EdgeProfCounters+192(%rip)
	movslq	40(%rsp), %rax
	movq	(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	incl	1072(%rsp,%rax,4)
	incl	EdgeProfCounters+200(%rip)
	incl	40(%rsp)
	incl	EdgeProfCounters+204(%rip)
.LBB1_7:                                # %for.cond2
                                        # =>This Inner Loop Header: Depth=1
	movl	40(%rsp), %eax
	cmpl	2116(%rsp), %eax
	jl	.LBB1_8
# BB#9:                                 # %for.end12
	incl	EdgeProfCounters+196(%rip)
	movl	$0, 40(%rsp)
	incl	EdgeProfCounters+208(%rip)
	jmp	.LBB1_10
	.align	16, 0x90
.LBB1_11:                               # %for.body15
                                        #   in Loop: Header=BB1_10 Depth=1
	incl	EdgeProfCounters+212(%rip)
	movslq	40(%rsp), %rax
	movl	1072(%rsp,%rax,4), %ecx
	movl	%ecx, 48(%rsp,%rax,4)
	incl	EdgeProfCounters+220(%rip)
	incl	40(%rsp)
	incl	EdgeProfCounters+224(%rip)
.LBB1_10:                               # %for.cond13
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$255, 40(%rsp)
	jle	.LBB1_11
# BB#12:                                # %for.end22
	incl	EdgeProfCounters+216(%rip)
	movl	$1, 40(%rsp)
	incl	EdgeProfCounters+228(%rip)
	jmp	.LBB1_13
	.align	16, 0x90
.LBB1_14:                               # %for.body25
                                        #   in Loop: Header=BB1_13 Depth=1
	incl	EdgeProfCounters+232(%rip)
	movslq	40(%rsp), %rax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movl	1072(%rsp,%rcx,4), %ecx
	addl	%ecx, 1072(%rsp,%rax,4)
	incl	EdgeProfCounters+240(%rip)
	incl	40(%rsp)
	incl	EdgeProfCounters+244(%rip)
.LBB1_13:                               # %for.cond23
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$256, 40(%rsp)          # imm = 0x100
	jle	.LBB1_14
# BB#15:                                # %for.end32
	incl	EdgeProfCounters+236(%rip)
	movl	$0, 40(%rsp)
	incl	EdgeProfCounters+248(%rip)
	jmp	.LBB1_16
	.align	16, 0x90
.LBB1_17:                               # %for.body35
                                        #   in Loop: Header=BB1_16 Depth=1
	incl	EdgeProfCounters+252(%rip)
	movslq	40(%rsp), %rax
	movq	(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	movl	%eax, 36(%rsp)
	movslq	36(%rsp), %rax
	movl	1072(%rsp,%rax,4), %eax
	decl	%eax
	movl	%eax, 32(%rsp)
	movslq	36(%rsp), %rcx
	movl	%eax, 1072(%rsp,%rcx,4)
	movq	2136(%rsp), %rax
	movslq	32(%rsp), %rcx
	movl	40(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	EdgeProfCounters+260(%rip)
	incl	40(%rsp)
	incl	EdgeProfCounters+264(%rip)
.LBB1_16:                               # %for.cond33
                                        # =>This Inner Loop Header: Depth=1
	movl	40(%rsp), %eax
	cmpl	2116(%rsp), %eax
	jl	.LBB1_17
# BB#18:                                # %for.end47
	incl	EdgeProfCounters+256(%rip)
	movl	2116(%rsp), %ecx
	movl	%ecx, %eax
	sarl	$31, %eax
	shrl	$27, %eax
	addl	%ecx, %eax
	sarl	$5, %eax
	addl	$2, %eax
	movl	%eax, 8(%rsp)
	movl	$0, 40(%rsp)
	incl	EdgeProfCounters+268(%rip)
	jmp	.LBB1_19
	.align	16, 0x90
.LBB1_20:                               # %for.body52
                                        #   in Loop: Header=BB1_19 Depth=1
	incl	EdgeProfCounters+272(%rip)
	movq	2120(%rsp), %rax
	movslq	40(%rsp), %rcx
	movl	$0, (%rax,%rcx,4)
	incl	EdgeProfCounters+280(%rip)
	incl	40(%rsp)
	incl	EdgeProfCounters+284(%rip)
.LBB1_19:                               # %for.cond49
                                        # =>This Inner Loop Header: Depth=1
	movl	40(%rsp), %eax
	cmpl	8(%rsp), %eax
	jl	.LBB1_20
# BB#21:                                # %for.end57
	incl	EdgeProfCounters+276(%rip)
	movl	$0, 40(%rsp)
	incl	EdgeProfCounters+288(%rip)
	jmp	.LBB1_22
	.align	16, 0x90
.LBB1_23:                               # %for.body61
                                        #   in Loop: Header=BB1_22 Depth=1
	incl	EdgeProfCounters+292(%rip)
	movslq	40(%rsp), %rax
	movl	1072(%rsp,%rax,4), %ecx
	movl	$1, %eax
	shll	%cl, %eax
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2120(%rsp), %rdx
	orl	%eax, (%rdx,%rcx,4)
	incl	EdgeProfCounters+300(%rip)
	incl	40(%rsp)
	incl	EdgeProfCounters+304(%rip)
.LBB1_22:                               # %for.cond58
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$255, 40(%rsp)
	jle	.LBB1_23
# BB#24:                                # %for.end70
	incl	EdgeProfCounters+296(%rip)
	movl	$0, 40(%rsp)
	incl	EdgeProfCounters+308(%rip)
	jmp	.LBB1_25
	.align	16, 0x90
.LBB1_26:                               # %for.body74
                                        #   in Loop: Header=BB1_25 Depth=1
	incl	EdgeProfCounters+312(%rip)
	movl	40(%rsp), %ecx
	addl	%ecx, %ecx
	addl	2116(%rsp), %ecx
	movl	$1, %eax
	shll	%cl, %eax
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2120(%rsp), %rdx
	orl	%eax, (%rdx,%rcx,4)
	movl	40(%rsp), %eax
	movl	2116(%rsp), %ecx
	leal	1(%rcx,%rax,2), %ecx
	movl	%ecx, %eax
	sarl	$5, %eax
	movslq	%eax, %rax
                                        # kill: CL<def> CL<kill> ECX<kill>
	movl	$1, %edx
	shll	%cl, %edx
	notl	%edx
	movq	2120(%rsp), %rcx
	andl	%edx, (%rcx,%rax,4)
	incl	EdgeProfCounters+320(%rip)
	incl	40(%rsp)
	incl	EdgeProfCounters+324(%rip)
.LBB1_25:                               # %for.cond71
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$31, 40(%rsp)
	jle	.LBB1_26
# BB#27:                                # %for.end98
	incl	EdgeProfCounters+316(%rip)
	movl	$1, 44(%rsp)
	incl	EdgeProfCounters+328(%rip)
	movl	$1, %ebx
	jmp	.LBB1_28
	.align	16, 0x90
.LBB1_104:                              # %if.end267
                                        #   in Loop: Header=BB1_28 Depth=1
	incl	EdgeProfCounters+632(%rip)
	incl	EdgeProfCounters+640(%rip)
.LBB1_28:                               # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_32 Depth 2
                                        #     Child Loop BB1_41 Depth 2
                                        #       Child Loop BB1_42 Depth 3
                                        #       Child Loop BB1_50 Depth 3
                                        #       Child Loop BB1_53 Depth 3
                                        #       Child Loop BB1_59 Depth 3
                                        #       Child Loop BB1_67 Depth 3
                                        #       Child Loop BB1_70 Depth 3
                                        #       Child Loop BB1_80 Depth 3
	cmpl	$3, 2112(%rsp)
	jle	.LBB1_29
# BB#30:                                # %if.then101
                                        #   in Loop: Header=BB1_28 Depth=1
	incl	EdgeProfCounters+332(%rip)
	movl	44(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str6, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+340(%rip)
	jmp	.LBB1_31
	.align	16, 0x90
.LBB1_29:                               # %while.body.if.end103_crit_edge
                                        #   in Loop: Header=BB1_28 Depth=1
	incl	EdgeProfCounters+336(%rip)
.LBB1_31:                               # %if.end103
                                        #   in Loop: Header=BB1_28 Depth=1
	movl	$0, 36(%rsp)
	movl	$0, 40(%rsp)
	incl	EdgeProfCounters+344(%rip)
	jmp	.LBB1_32
	.align	16, 0x90
.LBB1_39:                               # %if.end123
                                        #   in Loop: Header=BB1_32 Depth=2
	movq	2128(%rsp), %rax
	movslq	32(%rsp), %rcx
	movl	36(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	EdgeProfCounters+380(%rip)
	incl	40(%rsp)
	incl	EdgeProfCounters+384(%rip)
.LBB1_32:                               # %for.cond104
                                        #   Parent Loop BB1_28 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	40(%rsp), %eax
	cmpl	2116(%rsp), %eax
	jge	.LBB1_40
# BB#33:                                # %for.body107
                                        #   in Loop: Header=BB1_32 Depth=2
	incl	EdgeProfCounters+348(%rip)
	movl	40(%rsp), %eax
	movl	%eax, %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2120(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	btl	%eax, %ecx
	jae	.LBB1_34
# BB#35:                                # %if.then114
                                        #   in Loop: Header=BB1_32 Depth=2
	incl	EdgeProfCounters+356(%rip)
	movl	40(%rsp), %eax
	movl	%eax, 36(%rsp)
	incl	EdgeProfCounters+364(%rip)
	jmp	.LBB1_36
	.align	16, 0x90
.LBB1_34:                               # %for.body107.if.end115_crit_edge
                                        #   in Loop: Header=BB1_32 Depth=2
	incl	EdgeProfCounters+360(%rip)
.LBB1_36:                               # %if.end115
                                        #   in Loop: Header=BB1_32 Depth=2
	movslq	40(%rsp), %rax
	movq	2136(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	subl	44(%rsp), %eax
	movl	%eax, 32(%rsp)
	jns	.LBB1_37
# BB#38:                                # %if.then121
                                        #   in Loop: Header=BB1_32 Depth=2
	incl	EdgeProfCounters+368(%rip)
	movl	2116(%rsp), %eax
	addl	%eax, 32(%rsp)
	incl	EdgeProfCounters+376(%rip)
	jmp	.LBB1_39
	.align	16, 0x90
.LBB1_37:                               # %if.end115.if.end123_crit_edge
                                        #   in Loop: Header=BB1_32 Depth=2
	incl	EdgeProfCounters+372(%rip)
	jmp	.LBB1_39
	.align	16, 0x90
.LBB1_40:                               # %for.end128
                                        #   in Loop: Header=BB1_28 Depth=1
	incl	EdgeProfCounters+352(%rip)
	movl	$0, 12(%rsp)
	movl	$-1, 24(%rsp)
	incl	EdgeProfCounters+388(%rip)
	jmp	.LBB1_41
	.align	16, 0x90
.LBB1_78:                               # %if.end226.if.end254_crit_edge
                                        #   in Loop: Header=BB1_41 Depth=2
	incl	EdgeProfCounters+564(%rip)
	incl	EdgeProfCounters+604(%rip)
.LBB1_41:                               # %while.body130
                                        #   Parent Loop BB1_28 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_42 Depth 3
                                        #       Child Loop BB1_50 Depth 3
                                        #       Child Loop BB1_53 Depth 3
                                        #       Child Loop BB1_59 Depth 3
                                        #       Child Loop BB1_67 Depth 3
                                        #       Child Loop BB1_70 Depth 3
                                        #       Child Loop BB1_80 Depth 3
	movl	24(%rsp), %eax
	incl	%eax
	movl	%eax, 32(%rsp)
	incl	EdgeProfCounters+392(%rip)
	jmp	.LBB1_42
	.align	16, 0x90
.LBB1_46:                               # %while.body142
                                        #   in Loop: Header=BB1_42 Depth=3
	incl	EdgeProfCounters+408(%rip)
	incl	32(%rsp)
	incl	EdgeProfCounters+416(%rip)
.LBB1_42:                               # %while.cond132
                                        #   Parent Loop BB1_28 Depth=1
                                        #     Parent Loop BB1_41 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	32(%rsp), %eax
	movl	%eax, %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2120(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	btl	%eax, %ecx
	jae	.LBB1_43
# BB#44:                                # %land.rhs
                                        #   in Loop: Header=BB1_42 Depth=3
	incl	EdgeProfCounters+396(%rip)
	movl	32(%rsp), %eax
	incl	EdgeProfCounters+404(%rip)
	testb	$31, %al
	setne	%al
	jmp	.LBB1_45
	.align	16, 0x90
.LBB1_43:                               # %while.cond132.land.end_crit_edge
                                        #   in Loop: Header=BB1_42 Depth=3
	incl	EdgeProfCounters+400(%rip)
	xorb	%al, %al
.LBB1_45:                               # %land.end
                                        #   in Loop: Header=BB1_42 Depth=3
	cmpb	$1, %al
	je	.LBB1_46
# BB#47:                                # %while.end
                                        #   in Loop: Header=BB1_41 Depth=2
	incl	EdgeProfCounters+412(%rip)
	movl	32(%rsp), %eax
	movl	%eax, %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2120(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	btl	%eax, %ecx
	jae	.LBB1_48
# BB#49:                                # %if.then151
                                        #   in Loop: Header=BB1_41 Depth=2
	incl	EdgeProfCounters+420(%rip)
	incl	EdgeProfCounters+428(%rip)
	jmp	.LBB1_50
	.align	16, 0x90
.LBB1_51:                               # %while.body158
                                        #   in Loop: Header=BB1_50 Depth=3
	incl	EdgeProfCounters+432(%rip)
	addl	$32, 32(%rsp)
	incl	EdgeProfCounters+440(%rip)
.LBB1_50:                               # %while.cond152
                                        #   Parent Loop BB1_28 Depth=1
                                        #     Parent Loop BB1_41 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	32(%rsp), %eax
	sarl	$5, %eax
	movslq	%eax, %rax
	movq	2120(%rsp), %rcx
	cmpl	$-1, (%rcx,%rax,4)
	je	.LBB1_51
# BB#52:                                # %while.end160
                                        #   in Loop: Header=BB1_41 Depth=2
	incl	EdgeProfCounters+436(%rip)
	incl	EdgeProfCounters+444(%rip)
	jmp	.LBB1_53
	.align	16, 0x90
.LBB1_54:                               # %while.body169
                                        #   in Loop: Header=BB1_53 Depth=3
	incl	EdgeProfCounters+448(%rip)
	incl	32(%rsp)
	incl	EdgeProfCounters+456(%rip)
.LBB1_53:                               # %while.cond161
                                        #   Parent Loop BB1_28 Depth=1
                                        #     Parent Loop BB1_41 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	32(%rsp), %eax
	movl	%eax, %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2120(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	btl	%eax, %ecx
	jb	.LBB1_54
# BB#55:                                # %while.end171
                                        #   in Loop: Header=BB1_41 Depth=2
	incl	EdgeProfCounters+452(%rip)
	incl	EdgeProfCounters+460(%rip)
	jmp	.LBB1_56
	.align	16, 0x90
.LBB1_48:                               # %while.end.if.end172_crit_edge
                                        #   in Loop: Header=BB1_41 Depth=2
	incl	EdgeProfCounters+424(%rip)
.LBB1_56:                               # %if.end172
                                        #   in Loop: Header=BB1_41 Depth=2
	movl	32(%rsp), %eax
	decl	%eax
	movl	%eax, 28(%rsp)
	cmpl	2116(%rsp), %eax
	jge	.LBB1_57
# BB#58:                                # %if.end177
                                        #   in Loop: Header=BB1_41 Depth=2
	incl	EdgeProfCounters+468(%rip)
	incl	EdgeProfCounters+476(%rip)
	jmp	.LBB1_59
	.align	16, 0x90
.LBB1_63:                               # %while.body190
                                        #   in Loop: Header=BB1_59 Depth=3
	incl	EdgeProfCounters+492(%rip)
	incl	32(%rsp)
	incl	EdgeProfCounters+500(%rip)
.LBB1_59:                               # %while.cond178
                                        #   Parent Loop BB1_28 Depth=1
                                        #     Parent Loop BB1_41 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	32(%rsp), %eax
	movl	%eax, %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2120(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	btl	%eax, %ecx
	jae	.LBB1_61
# BB#60:                                # %while.cond178.land.end189_crit_edge
                                        #   in Loop: Header=BB1_59 Depth=3
	incl	EdgeProfCounters+480(%rip)
	xorb	%al, %al
	jmp	.LBB1_62
	.align	16, 0x90
.LBB1_61:                               # %land.rhs186
                                        #   in Loop: Header=BB1_59 Depth=3
	incl	EdgeProfCounters+484(%rip)
	movl	32(%rsp), %eax
	incl	EdgeProfCounters+488(%rip)
	testb	$31, %al
	setne	%al
.LBB1_62:                               # %land.end189
                                        #   in Loop: Header=BB1_59 Depth=3
	cmpb	$1, %al
	je	.LBB1_63
# BB#64:                                # %while.end192
                                        #   in Loop: Header=BB1_41 Depth=2
	incl	EdgeProfCounters+496(%rip)
	movl	32(%rsp), %eax
	movl	%eax, %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2120(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	btl	%eax, %ecx
	jae	.LBB1_66
# BB#65:                                # %while.end192.if.end221_crit_edge
                                        #   in Loop: Header=BB1_41 Depth=2
	incl	EdgeProfCounters+504(%rip)
	jmp	.LBB1_73
	.align	16, 0x90
.LBB1_66:                               # %if.then200
                                        #   in Loop: Header=BB1_41 Depth=2
	incl	EdgeProfCounters+508(%rip)
	incl	EdgeProfCounters+512(%rip)
	jmp	.LBB1_67
	.align	16, 0x90
.LBB1_68:                               # %while.body207
                                        #   in Loop: Header=BB1_67 Depth=3
	incl	EdgeProfCounters+516(%rip)
	addl	$32, 32(%rsp)
	incl	EdgeProfCounters+524(%rip)
.LBB1_67:                               # %while.cond201
                                        #   Parent Loop BB1_28 Depth=1
                                        #     Parent Loop BB1_41 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	32(%rsp), %eax
	sarl	$5, %eax
	movslq	%eax, %rax
	movq	2120(%rsp), %rcx
	cmpl	$0, (%rcx,%rax,4)
	je	.LBB1_68
# BB#69:                                # %while.end209
                                        #   in Loop: Header=BB1_41 Depth=2
	incl	EdgeProfCounters+520(%rip)
	incl	EdgeProfCounters+528(%rip)
	jmp	.LBB1_70
	.align	16, 0x90
.LBB1_71:                               # %while.body218
                                        #   in Loop: Header=BB1_70 Depth=3
	incl	EdgeProfCounters+532(%rip)
	incl	32(%rsp)
	incl	EdgeProfCounters+540(%rip)
.LBB1_70:                               # %while.cond210
                                        #   Parent Loop BB1_28 Depth=1
                                        #     Parent Loop BB1_41 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	32(%rsp), %eax
	movl	%eax, %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2120(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	btl	%eax, %ecx
	jae	.LBB1_71
# BB#72:                                # %while.end220
                                        #   in Loop: Header=BB1_41 Depth=2
	incl	EdgeProfCounters+536(%rip)
	incl	EdgeProfCounters+544(%rip)
.LBB1_73:                               # %if.end221
                                        #   in Loop: Header=BB1_41 Depth=2
	movl	32(%rsp), %eax
	decl	%eax
	movl	%eax, 24(%rsp)
	cmpl	2116(%rsp), %eax
	jge	.LBB1_74
# BB#77:                                # %if.end226
                                        #   in Loop: Header=BB1_41 Depth=2
	incl	EdgeProfCounters+552(%rip)
	movl	24(%rsp), %eax
	cmpl	28(%rsp), %eax
	jle	.LBB1_78
# BB#79:                                # %if.then229
                                        #   in Loop: Header=BB1_41 Depth=2
	incl	EdgeProfCounters+560(%rip)
	movl	24(%rsp), %eax
	subl	28(%rsp), %eax
	movl	12(%rsp), %ecx
	leal	1(%rax,%rcx), %eax
	movl	%eax, 12(%rsp)
	movl	24(%rsp), %ecx
	movl	28(%rsp), %edx
	movq	2128(%rsp), %rsi
	movq	2136(%rsp), %rdi
	callq	fallbackQSort3
	movl	$-1, 20(%rsp)
	movl	28(%rsp), %eax
	movl	%eax, 40(%rsp)
	incl	EdgeProfCounters+568(%rip)
	jmp	.LBB1_80
	.align	16, 0x90
.LBB1_84:                               # %if.end250
                                        #   in Loop: Header=BB1_80 Depth=3
	incl	EdgeProfCounters+592(%rip)
	incl	40(%rsp)
	incl	EdgeProfCounters+596(%rip)
.LBB1_80:                               # %for.cond233
                                        #   Parent Loop BB1_28 Depth=1
                                        #     Parent Loop BB1_41 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	40(%rsp), %eax
	cmpl	24(%rsp), %eax
	jg	.LBB1_85
# BB#81:                                # %for.body236
                                        #   in Loop: Header=BB1_80 Depth=3
	incl	EdgeProfCounters+572(%rip)
	movslq	40(%rsp), %rax
	movq	2136(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movq	2128(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 16(%rsp)
	cmpl	%eax, 20(%rsp)
	je	.LBB1_82
# BB#83:                                # %if.then243
                                        #   in Loop: Header=BB1_80 Depth=3
	incl	EdgeProfCounters+580(%rip)
	movl	40(%rsp), %ecx
	movl	%ebx, %eax
	shll	%cl, %eax
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2120(%rsp), %rdx
	orl	%eax, (%rdx,%rcx,4)
	movl	16(%rsp), %eax
	movl	%eax, 20(%rsp)
	incl	EdgeProfCounters+588(%rip)
	jmp	.LBB1_84
	.align	16, 0x90
.LBB1_82:                               # %for.body236.if.end250_crit_edge
                                        #   in Loop: Header=BB1_80 Depth=3
	incl	EdgeProfCounters+584(%rip)
	jmp	.LBB1_84
	.align	16, 0x90
.LBB1_85:                               # %for.end253
                                        #   in Loop: Header=BB1_41 Depth=2
	incl	EdgeProfCounters+576(%rip)
	incl	EdgeProfCounters+600(%rip)
	incl	EdgeProfCounters+604(%rip)
	jmp	.LBB1_41
	.align	16, 0x90
.LBB1_57:                               # %if.then176
                                        #   in Loop: Header=BB1_28 Depth=1
	incl	EdgeProfCounters+464(%rip)
	incl	EdgeProfCounters+472(%rip)
	jmp	.LBB1_75
	.align	16, 0x90
.LBB1_74:                               # %if.then225
                                        #   in Loop: Header=BB1_28 Depth=1
	incl	EdgeProfCounters+548(%rip)
	incl	EdgeProfCounters+556(%rip)
.LBB1_75:                               # %while.end255
                                        #   in Loop: Header=BB1_28 Depth=1
	cmpl	$3, 2112(%rsp)
	jle	.LBB1_76
# BB#86:                                # %if.then258
                                        #   in Loop: Header=BB1_28 Depth=1
	incl	EdgeProfCounters+608(%rip)
	movl	12(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str7, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+616(%rip)
	jmp	.LBB1_87
	.align	16, 0x90
.LBB1_76:                               # %while.end255.if.end260_crit_edge
                                        #   in Loop: Header=BB1_28 Depth=1
	incl	EdgeProfCounters+612(%rip)
.LBB1_87:                               # %if.end260
                                        #   in Loop: Header=BB1_28 Depth=1
	movl	44(%rsp), %eax
	addl	%eax, %eax
	movl	%eax, 44(%rsp)
	cmpl	2116(%rsp), %eax
	jg	.LBB1_88
# BB#89:                                # %lor.lhs.false
                                        #   in Loop: Header=BB1_28 Depth=1
	incl	EdgeProfCounters+624(%rip)
	cmpl	$0, 12(%rsp)
	jne	.LBB1_104
# BB#90:                                # %lor.lhs.false.if.then266_crit_edge
	incl	EdgeProfCounters+628(%rip)
	jmp	.LBB1_91
.LBB1_88:                               # %if.end260.if.then266_crit_edge
	incl	EdgeProfCounters+620(%rip)
.LBB1_91:                               # %lor.lhs.false.if.then266_crit_edge
	incl	EdgeProfCounters+636(%rip)
	cmpl	$3, 2112(%rsp)
	jle	.LBB1_92
# BB#93:                                # %if.then271
	incl	EdgeProfCounters+644(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str8, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+652(%rip)
	jmp	.LBB1_94
.LBB1_92:                               # %while.end268.if.end273_crit_edge
	incl	EdgeProfCounters+648(%rip)
.LBB1_94:                               # %if.end273
	movl	$0, 36(%rsp)
	movl	$0, 40(%rsp)
	incl	EdgeProfCounters+656(%rip)
	jmp	.LBB1_95
	.align	16, 0x90
.LBB1_99:                               # %while.end284
                                        #   in Loop: Header=BB1_95 Depth=1
	incl	EdgeProfCounters+676(%rip)
	movslq	36(%rsp), %rax
	decl	48(%rsp,%rax,4)
	movslq	40(%rsp), %rax
	movq	2136(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movq	(%rsp), %rcx
	movb	36(%rsp), %dl
	movb	%dl, (%rcx,%rax)
	incl	EdgeProfCounters+684(%rip)
	incl	40(%rsp)
	incl	EdgeProfCounters+688(%rip)
.LBB1_95:                               # %for.cond274
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_97 Depth 2
	movl	40(%rsp), %eax
	cmpl	2116(%rsp), %eax
	jge	.LBB1_100
# BB#96:                                # %for.body277
                                        #   in Loop: Header=BB1_95 Depth=1
	incl	EdgeProfCounters+660(%rip)
	incl	EdgeProfCounters+668(%rip)
	jmp	.LBB1_97
	.align	16, 0x90
.LBB1_98:                               # %while.body282
                                        #   in Loop: Header=BB1_97 Depth=2
	incl	EdgeProfCounters+672(%rip)
	incl	36(%rsp)
	incl	EdgeProfCounters+680(%rip)
.LBB1_97:                               # %while.cond
                                        #   Parent Loop BB1_95 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	36(%rsp), %rax
	cmpl	$0, 48(%rsp,%rax,4)
	jne	.LBB1_99
	jmp	.LBB1_98
.LBB1_100:                              # %for.end294
	incl	EdgeProfCounters+664(%rip)
	cmpl	$255, 36(%rsp)
	jg	.LBB1_102
# BB#101:                               # %for.end294.if.end298_crit_edge
	incl	EdgeProfCounters+692(%rip)
	jmp	.LBB1_103
.LBB1_102:                              # %if.then297
	incl	EdgeProfCounters+696(%rip)
	movl	$1005, %edi             # imm = 0x3ED
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+700(%rip)
.LBB1_103:                              # %if.end298
	addq	$2144, %rsp             # imm = 0x860
	popq	%rbx
	ret
.Ltmp8:
	.size	fallbackSort, .Ltmp8-fallbackSort
	.cfi_endproc

	.align	16, 0x90
	.type	mainSort,@function
mainSort:                               # @mainSort
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp11:
	.cfi_def_cfa_offset 16
	subq	$3472, %rsp             # imm = 0xD90
.Ltmp12:
	.cfi_def_cfa_offset 3488
.Ltmp13:
	.cfi_offset %rbx, -16
	incl	EdgeProfCounters+704(%rip)
	movq	%rdi, 3464(%rsp)
	movq	%rsi, 3456(%rsp)
	movq	%rdx, 3448(%rsp)
	movq	%rcx, 3440(%rsp)
	movl	%r8d, 3436(%rsp)
	movl	%r9d, 3432(%rsp)
	movq	3488(%rsp), %rax
	movq	%rax, 3424(%rsp)
	cmpl	$3, 3432(%rsp)
	jle	.LBB2_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+708(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str2, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+716(%rip)
	jmp	.LBB2_3
.LBB2_1:                                # %entry.if.end_crit_edge
	incl	EdgeProfCounters+712(%rip)
.LBB2_3:                                # %if.end
	movl	$65536, 3420(%rsp)      # imm = 0x10000
	incl	EdgeProfCounters+720(%rip)
	jmp	.LBB2_4
	.align	16, 0x90
.LBB2_5:                                # %for.inc
                                        #   in Loop: Header=BB2_4 Depth=1
	incl	EdgeProfCounters+724(%rip)
	movq	3440(%rsp), %rax
	movslq	3420(%rsp), %rcx
	movl	$0, (%rax,%rcx,4)
	incl	EdgeProfCounters+732(%rip)
	decl	3420(%rsp)
	incl	EdgeProfCounters+736(%rip)
.LBB2_4:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 3420(%rsp)
	jns	.LBB2_5
# BB#6:                                 # %for.end
	incl	EdgeProfCounters+728(%rip)
	movq	3456(%rsp), %rax
	movzbl	(%rax), %eax
	shll	$8, %eax
	movl	%eax, 3416(%rsp)
	movl	3436(%rsp), %eax
	decl	%eax
	movl	%eax, 3420(%rsp)
	incl	EdgeProfCounters+740(%rip)
	jmp	.LBB2_7
	.align	16, 0x90
.LBB2_8:                                # %for.inc58
                                        #   in Loop: Header=BB2_7 Depth=1
	incl	EdgeProfCounters+744(%rip)
	movq	3448(%rsp), %rax
	movslq	3420(%rsp), %rcx
	movw	$0, (%rax,%rcx,2)
	movslq	3420(%rsp), %rax
	movq	3456(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	shll	$8, %eax
	movl	3416(%rsp), %ecx
	sarl	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, 3416(%rsp)
	movq	3440(%rsp), %rax
	movslq	3416(%rsp), %rcx
	incl	(%rax,%rcx,4)
	movl	3420(%rsp), %eax
	decl	%eax
	movslq	%eax, %rax
	movq	3448(%rsp), %rcx
	movw	$0, (%rcx,%rax,2)
	movl	3420(%rsp), %eax
	decl	%eax
	movslq	%eax, %rax
	movq	3456(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	shll	$8, %eax
	movl	3416(%rsp), %ecx
	sarl	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, 3416(%rsp)
	movq	3440(%rsp), %rax
	movslq	3416(%rsp), %rcx
	incl	(%rax,%rcx,4)
	movl	3420(%rsp), %eax
	addl	$-2, %eax
	movslq	%eax, %rax
	movq	3448(%rsp), %rcx
	movw	$0, (%rcx,%rax,2)
	movl	3420(%rsp), %eax
	addl	$-2, %eax
	movslq	%eax, %rax
	movq	3456(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	shll	$8, %eax
	movl	3416(%rsp), %ecx
	sarl	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, 3416(%rsp)
	movq	3440(%rsp), %rax
	movslq	3416(%rsp), %rcx
	incl	(%rax,%rcx,4)
	movl	3420(%rsp), %eax
	addl	$-3, %eax
	movslq	%eax, %rax
	movq	3448(%rsp), %rcx
	movw	$0, (%rcx,%rax,2)
	movl	3420(%rsp), %eax
	addl	$-3, %eax
	movslq	%eax, %rax
	movq	3456(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	shll	$8, %eax
	movl	3416(%rsp), %ecx
	sarl	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, 3416(%rsp)
	movq	3440(%rsp), %rax
	movslq	3416(%rsp), %rcx
	incl	(%rax,%rcx,4)
	incl	EdgeProfCounters+752(%rip)
	addl	$-4, 3420(%rsp)
	incl	EdgeProfCounters+756(%rip)
.LBB2_7:                                # %for.cond3
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$3, 3420(%rsp)
	jge	.LBB2_8
# BB#9:                                 # %for.end60
	incl	EdgeProfCounters+748(%rip)
	incl	EdgeProfCounters+760(%rip)
	jmp	.LBB2_10
	.align	16, 0x90
.LBB2_11:                               # %for.inc77
                                        #   in Loop: Header=BB2_10 Depth=1
	incl	EdgeProfCounters+764(%rip)
	movq	3448(%rsp), %rax
	movslq	3420(%rsp), %rcx
	movw	$0, (%rax,%rcx,2)
	movslq	3420(%rsp), %rax
	movq	3456(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	shll	$8, %eax
	movl	3416(%rsp), %ecx
	sarl	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, 3416(%rsp)
	movq	3440(%rsp), %rax
	movslq	3416(%rsp), %rcx
	incl	(%rax,%rcx,4)
	incl	EdgeProfCounters+772(%rip)
	decl	3420(%rsp)
	incl	EdgeProfCounters+776(%rip)
.LBB2_10:                               # %for.cond61
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 3420(%rsp)
	jns	.LBB2_11
# BB#12:                                # %for.end79
	incl	EdgeProfCounters+768(%rip)
	movl	$0, 3420(%rsp)
	incl	EdgeProfCounters+780(%rip)
	jmp	.LBB2_13
	.align	16, 0x90
.LBB2_14:                               # %for.inc91
                                        #   in Loop: Header=BB2_13 Depth=1
	incl	EdgeProfCounters+784(%rip)
	movslq	3420(%rsp), %rax
	movq	3456(%rsp), %rcx
	movb	(%rcx,%rax), %dl
	addl	3436(%rsp), %eax
	movslq	%eax, %rax
	movb	%dl, (%rcx,%rax)
	movl	3436(%rsp), %eax
	addl	3420(%rsp), %eax
	movslq	%eax, %rax
	movq	3448(%rsp), %rcx
	movw	$0, (%rcx,%rax,2)
	incl	EdgeProfCounters+792(%rip)
	incl	3420(%rsp)
	incl	EdgeProfCounters+796(%rip)
.LBB2_13:                               # %for.cond80
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$33, 3420(%rsp)
	jle	.LBB2_14
# BB#15:                                # %for.end93
	incl	EdgeProfCounters+788(%rip)
	cmpl	$3, 3432(%rsp)
	jle	.LBB2_16
# BB#17:                                # %if.then96
	incl	EdgeProfCounters+800(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str3, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+808(%rip)
	jmp	.LBB2_18
.LBB2_16:                               # %for.end93.if.end98_crit_edge
	incl	EdgeProfCounters+804(%rip)
.LBB2_18:                               # %if.end98
	movl	$1, 3420(%rsp)
	incl	EdgeProfCounters+812(%rip)
	jmp	.LBB2_19
	.align	16, 0x90
.LBB2_20:                               # %for.inc109
                                        #   in Loop: Header=BB2_19 Depth=1
	incl	EdgeProfCounters+816(%rip)
	movslq	3420(%rsp), %rax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movq	3440(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	addl	%ecx, (%rdx,%rax,4)
	incl	EdgeProfCounters+824(%rip)
	incl	3420(%rsp)
	incl	EdgeProfCounters+828(%rip)
.LBB2_19:                               # %for.cond99
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$65536, 3420(%rsp)      # imm = 0x10000
	jle	.LBB2_20
# BB#21:                                # %for.end111
	incl	EdgeProfCounters+820(%rip)
	movq	3456(%rsp), %rax
	movzbl	(%rax), %eax
	shll	$8, %eax
	movw	%ax, 54(%rsp)
	movl	3436(%rsp), %eax
	decl	%eax
	movl	%eax, 3420(%rsp)
	incl	EdgeProfCounters+832(%rip)
	jmp	.LBB2_22
	.align	16, 0x90
.LBB2_23:                               # %for.inc187
                                        #   in Loop: Header=BB2_22 Depth=1
	incl	EdgeProfCounters+836(%rip)
	movslq	3420(%rsp), %rax
	movq	3456(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	shll	$8, %eax
	movzwl	54(%rsp), %ecx
	shrl	$8, %ecx
	orl	%eax, %ecx
	movw	%cx, 54(%rsp)
	movzwl	54(%rsp), %eax
	movq	3440(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	decl	%eax
	movl	%eax, 3416(%rsp)
	movq	3440(%rsp), %rcx
	movzwl	54(%rsp), %edx
	movl	%eax, (%rcx,%rdx,4)
	movq	3464(%rsp), %rax
	movslq	3416(%rsp), %rcx
	movl	3420(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	3420(%rsp), %eax
	decl	%eax
	movslq	%eax, %rax
	movq	3456(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	shll	$8, %eax
	movzwl	54(%rsp), %ecx
	shrl	$8, %ecx
	orl	%eax, %ecx
	movw	%cx, 54(%rsp)
	movzwl	54(%rsp), %eax
	movq	3440(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	decl	%eax
	movl	%eax, 3416(%rsp)
	movq	3440(%rsp), %rcx
	movzwl	54(%rsp), %edx
	movl	%eax, (%rcx,%rdx,4)
	movl	3420(%rsp), %eax
	decl	%eax
	movq	3464(%rsp), %rcx
	movslq	3416(%rsp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	movl	3420(%rsp), %eax
	addl	$-2, %eax
	movslq	%eax, %rax
	movq	3456(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	shll	$8, %eax
	movzwl	54(%rsp), %ecx
	shrl	$8, %ecx
	orl	%eax, %ecx
	movw	%cx, 54(%rsp)
	movzwl	54(%rsp), %eax
	movq	3440(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	decl	%eax
	movl	%eax, 3416(%rsp)
	movq	3440(%rsp), %rcx
	movzwl	54(%rsp), %edx
	movl	%eax, (%rcx,%rdx,4)
	movl	3420(%rsp), %eax
	addl	$-2, %eax
	movq	3464(%rsp), %rcx
	movslq	3416(%rsp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	movl	3420(%rsp), %eax
	addl	$-3, %eax
	movslq	%eax, %rax
	movq	3456(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	shll	$8, %eax
	movzwl	54(%rsp), %ecx
	shrl	$8, %ecx
	orl	%eax, %ecx
	movw	%cx, 54(%rsp)
	movzwl	54(%rsp), %eax
	movq	3440(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	decl	%eax
	movl	%eax, 3416(%rsp)
	movq	3440(%rsp), %rcx
	movzwl	54(%rsp), %edx
	movl	%eax, (%rcx,%rdx,4)
	movl	3420(%rsp), %eax
	addl	$-3, %eax
	movq	3464(%rsp), %rcx
	movslq	3416(%rsp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	incl	EdgeProfCounters+844(%rip)
	addl	$-4, 3420(%rsp)
	incl	EdgeProfCounters+848(%rip)
.LBB2_22:                               # %for.cond117
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$3, 3420(%rsp)
	jge	.LBB2_23
# BB#24:                                # %for.end189
	incl	EdgeProfCounters+840(%rip)
	incl	EdgeProfCounters+852(%rip)
	jmp	.LBB2_25
	.align	16, 0x90
.LBB2_26:                               # %for.inc209
                                        #   in Loop: Header=BB2_25 Depth=1
	incl	EdgeProfCounters+856(%rip)
	movslq	3420(%rsp), %rax
	movq	3456(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	shll	$8, %eax
	movzwl	54(%rsp), %ecx
	shrl	$8, %ecx
	orl	%eax, %ecx
	movw	%cx, 54(%rsp)
	movzwl	54(%rsp), %eax
	movq	3440(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	decl	%eax
	movl	%eax, 3416(%rsp)
	movq	3440(%rsp), %rcx
	movzwl	54(%rsp), %edx
	movl	%eax, (%rcx,%rdx,4)
	movq	3464(%rsp), %rax
	movslq	3416(%rsp), %rcx
	movl	3420(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	EdgeProfCounters+864(%rip)
	decl	3420(%rsp)
	incl	EdgeProfCounters+868(%rip)
.LBB2_25:                               # %for.cond190
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 3420(%rsp)
	jns	.LBB2_26
# BB#27:                                # %for.end211
	incl	EdgeProfCounters+860(%rip)
	movl	$0, 3420(%rsp)
	incl	EdgeProfCounters+872(%rip)
	jmp	.LBB2_28
	.align	16, 0x90
.LBB2_29:                               # %for.inc220
                                        #   in Loop: Header=BB2_28 Depth=1
	incl	EdgeProfCounters+876(%rip)
	movslq	3420(%rsp), %rax
	movb	$0, 2112(%rsp,%rax)
	movslq	3420(%rsp), %rax
	movl	%eax, 2368(%rsp,%rax,4)
	incl	EdgeProfCounters+884(%rip)
	incl	3420(%rsp)
	incl	EdgeProfCounters+888(%rip)
.LBB2_28:                               # %for.cond212
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$255, 3420(%rsp)
	jle	.LBB2_29
# BB#30:                                # %for.end222
	incl	EdgeProfCounters+880(%rip)
	movl	$1, 44(%rsp)
	incl	EdgeProfCounters+892(%rip)
	jmp	.LBB2_31
	.align	16, 0x90
.LBB2_32:                               # %do.cond.do.body_crit_edge
                                        #   in Loop: Header=BB2_31 Depth=1
	incl	EdgeProfCounters+900(%rip)
.LBB2_31:                               # %do.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	44(%rsp), %eax
	leal	1(%rax,%rax,2), %eax
	movl	%eax, 44(%rsp)
	incl	EdgeProfCounters+896(%rip)
	cmpl	$256, 44(%rsp)          # imm = 0x100
	jle	.LBB2_32
# BB#33:                                # %do.end
	incl	EdgeProfCounters+904(%rip)
	incl	EdgeProfCounters+908(%rip)
	jmp	.LBB2_34
	.align	16, 0x90
.LBB2_44:                               # %do.cond273.do.body226_crit_edge
                                        #   in Loop: Header=BB2_34 Depth=1
	incl	EdgeProfCounters+968(%rip)
.LBB2_34:                               # %do.body226
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_35 Depth 2
                                        #       Child Loop BB2_37 Depth 3
	movslq	44(%rsp), %rax
	imulq	$1431655766, %rax, %rax # imm = 0x55555556
	movq	%rax, %rcx
	shrq	$63, %rcx
	shrq	$32, %rax
	addl	%ecx, %eax
	movl	%eax, 44(%rsp)
	movl	%eax, 3420(%rsp)
	incl	EdgeProfCounters+912(%rip)
	jmp	.LBB2_35
	.align	16, 0x90
.LBB2_42:                               # %for.inc270
                                        #   in Loop: Header=BB2_35 Depth=2
	movslq	3416(%rsp), %rax
	movl	48(%rsp), %ecx
	movl	%ecx, 2368(%rsp,%rax,4)
	incl	EdgeProfCounters+956(%rip)
	incl	3420(%rsp)
	incl	EdgeProfCounters+960(%rip)
.LBB2_35:                               # %for.cond227
                                        #   Parent Loop BB2_34 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_37 Depth 3
	cmpl	$255, 3420(%rsp)
	jg	.LBB2_43
# BB#36:                                # %for.body230
                                        #   in Loop: Header=BB2_35 Depth=2
	incl	EdgeProfCounters+916(%rip)
	movslq	3420(%rsp), %rax
	movl	2368(%rsp,%rax,4), %eax
	movl	%eax, 48(%rsp)
	movl	3420(%rsp), %eax
	movl	%eax, 3416(%rsp)
	incl	EdgeProfCounters+924(%rip)
	jmp	.LBB2_37
	.align	16, 0x90
.LBB2_40:                               # %if.end267
                                        #   in Loop: Header=BB2_37 Depth=3
	incl	EdgeProfCounters+940(%rip)
	incl	EdgeProfCounters+948(%rip)
.LBB2_37:                               # %while.cond
                                        #   Parent Loop BB2_34 Depth=1
                                        #     Parent Loop BB2_35 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	48(%rsp), %edx
	leal	1(%rdx), %eax
	shll	$8, %eax
	movslq	%eax, %rcx
	movq	3440(%rsp), %rax
	movl	(%rax,%rcx,4), %ecx
	movl	3416(%rsp), %esi
	subl	44(%rsp), %esi
	movslq	%esi, %rsi
	movl	2368(%rsp,%rsi,4), %esi
	shll	$8, %edx
	movslq	%edx, %rdx
	subl	(%rax,%rdx,4), %ecx
	leal	1(%rsi), %edx
	shll	$8, %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %edx
	shll	$8, %esi
	movslq	%esi, %rsi
	subl	(%rax,%rsi,4), %edx
	cmpl	%ecx, %edx
	jbe	.LBB2_41
# BB#38:                                # %while.body
                                        #   in Loop: Header=BB2_37 Depth=3
	incl	EdgeProfCounters+928(%rip)
	movslq	3416(%rsp), %rax
	movl	44(%rsp), %edx
	movl	%eax, %ecx
	subl	%edx, %ecx
	movslq	%ecx, %rcx
	movl	2368(%rsp,%rcx,4), %ecx
	movl	%ecx, 2368(%rsp,%rax,4)
	movl	3416(%rsp), %eax
	subl	44(%rsp), %eax
	movl	%eax, 3416(%rsp)
	movl	44(%rsp), %ecx
	decl	%ecx
	cmpl	%ecx, %eax
	jg	.LBB2_40
# BB#39:                                # %if.then266
                                        #   in Loop: Header=BB2_35 Depth=2
	incl	EdgeProfCounters+936(%rip)
	incl	EdgeProfCounters+944(%rip)
	jmp	.LBB2_42
	.align	16, 0x90
.LBB2_41:                               # %while.end
                                        #   in Loop: Header=BB2_35 Depth=2
	incl	EdgeProfCounters+932(%rip)
	incl	EdgeProfCounters+952(%rip)
	jmp	.LBB2_42
	.align	16, 0x90
.LBB2_43:                               # %do.cond273
                                        #   in Loop: Header=BB2_34 Depth=1
	incl	EdgeProfCounters+920(%rip)
	incl	EdgeProfCounters+964(%rip)
	cmpl	$1, 44(%rsp)
	jne	.LBB2_44
# BB#45:                                # %do.end276
	incl	EdgeProfCounters+972(%rip)
	movl	$0, 56(%rsp)
	movl	$0, 3420(%rsp)
	incl	EdgeProfCounters+976(%rip)
	movl	$-2097153, %ebx         # imm = 0xFFFFFFFFFFDFFFFF
	jmp	.LBB2_46
	.align	16, 0x90
.LBB2_113:                              # %for.inc506
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1308(%rip)
	incl	3420(%rsp)
	incl	EdgeProfCounters+1312(%rip)
.LBB2_46:                               # %for.cond277
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_48 Depth 2
                                        #     Child Loop BB2_68 Depth 2
                                        #     Child Loop BB2_71 Depth 2
                                        #     Child Loop BB2_80 Depth 2
                                        #     Child Loop BB2_96 Depth 2
                                        #     Child Loop BB2_101 Depth 2
                                        #     Child Loop BB2_104 Depth 2
	cmpl	$255, 3420(%rsp)
	jg	.LBB2_114
# BB#47:                                # %for.body280
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+980(%rip)
	movslq	3420(%rsp), %rax
	movl	2368(%rsp,%rax,4), %eax
	movl	%eax, 3408(%rsp)
	movl	$0, 3416(%rsp)
	incl	EdgeProfCounters+988(%rip)
	jmp	.LBB2_48
	.align	16, 0x90
.LBB2_63:                               # %for.inc326
                                        #   in Loop: Header=BB2_48 Depth=2
	incl	EdgeProfCounters+1060(%rip)
	incl	3416(%rsp)
	incl	EdgeProfCounters+1064(%rip)
.LBB2_48:                               # %for.cond283
                                        #   Parent Loop BB2_46 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$255, 3416(%rsp)
	jg	.LBB2_64
# BB#49:                                # %for.body286
                                        #   in Loop: Header=BB2_48 Depth=2
	incl	EdgeProfCounters+992(%rip)
	movl	3416(%rsp), %eax
	cmpl	3408(%rsp), %eax
	je	.LBB2_50
# BB#51:                                # %if.then289
                                        #   in Loop: Header=BB2_48 Depth=2
	incl	EdgeProfCounters+1000(%rip)
	movl	3408(%rsp), %eax
	shll	$8, %eax
	addl	3416(%rsp), %eax
	movl	%eax, 3404(%rsp)
	movslq	3404(%rsp), %rax
	movq	3440(%rsp), %rcx
	testb	$32, 2(%rcx,%rax,4)
	je	.LBB2_53
# BB#52:                                # %if.then289.if.end321_crit_edge
                                        #   in Loop: Header=BB2_48 Depth=2
	incl	EdgeProfCounters+1008(%rip)
	jmp	.LBB2_62
	.align	16, 0x90
.LBB2_50:                               # %for.body286.if.end325_crit_edge
                                        #   in Loop: Header=BB2_48 Depth=2
	incl	EdgeProfCounters+1004(%rip)
	jmp	.LBB2_63
	.align	16, 0x90
.LBB2_53:                               # %if.then294
                                        #   in Loop: Header=BB2_48 Depth=2
	incl	EdgeProfCounters+1012(%rip)
	movslq	3404(%rsp), %rax
	movq	3440(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	andl	%ebx, %eax
	movl	%eax, 40(%rsp)
	movl	3404(%rsp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	3440(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	andl	%ebx, %eax
	decl	%eax
	movl	%eax, 36(%rsp)
	cmpl	40(%rsp), %eax
	jle	.LBB2_54
# BB#55:                                # %if.then305
                                        #   in Loop: Header=BB2_48 Depth=2
	incl	EdgeProfCounters+1016(%rip)
	cmpl	$3, 3432(%rsp)
	jle	.LBB2_56
# BB#57:                                # %if.then308
                                        #   in Loop: Header=BB2_48 Depth=2
	incl	EdgeProfCounters+1024(%rip)
	movl	36(%rsp), %r9d
	subl	40(%rsp), %r9d
	movl	56(%rsp), %r8d
	movl	3416(%rsp), %ecx
	movl	3408(%rsp), %edx
	movq	stderr(%rip), %rdi
	incl	%r9d
	movl	$.L.str4, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+1032(%rip)
	jmp	.LBB2_58
.LBB2_54:                               # %if.then294.if.end320_crit_edge
                                        #   in Loop: Header=BB2_48 Depth=2
	incl	EdgeProfCounters+1020(%rip)
	jmp	.LBB2_61
.LBB2_56:                               # %if.then305.if.end312_crit_edge
                                        #   in Loop: Header=BB2_48 Depth=2
	incl	EdgeProfCounters+1028(%rip)
.LBB2_58:                               # %if.end312
                                        #   in Loop: Header=BB2_48 Depth=2
	movl	36(%rsp), %r9d
	movl	40(%rsp), %r8d
	movl	3436(%rsp), %ecx
	movq	3448(%rsp), %rdx
	movq	3456(%rsp), %rsi
	movq	3464(%rsp), %rdi
	movq	3424(%rsp), %rax
	movq	%rax, 8(%rsp)
	movl	$2, (%rsp)
	callq	mainQSort3
	movl	36(%rsp), %eax
	subl	40(%rsp), %eax
	movl	56(%rsp), %ecx
	leal	1(%rax,%rcx), %eax
	movl	%eax, 56(%rsp)
	movq	3424(%rsp), %rax
	cmpl	$0, (%rax)
	js	.LBB2_59
# BB#60:                                # %if.end319
                                        #   in Loop: Header=BB2_48 Depth=2
	incl	EdgeProfCounters+1040(%rip)
	incl	EdgeProfCounters+1048(%rip)
.LBB2_61:                               # %if.end320
                                        #   in Loop: Header=BB2_48 Depth=2
	incl	EdgeProfCounters+1052(%rip)
.LBB2_62:                               # %if.end321
                                        #   in Loop: Header=BB2_48 Depth=2
	movq	3440(%rsp), %rax
	movslq	3404(%rsp), %rcx
	orl	$2097152, (%rax,%rcx,4) # imm = 0x200000
	incl	EdgeProfCounters+1056(%rip)
	jmp	.LBB2_63
	.align	16, 0x90
.LBB2_64:                               # %for.end328
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+996(%rip)
	movslq	3408(%rsp), %rax
	cmpb	$0, 2112(%rsp,%rax)
	je	.LBB2_65
# BB#66:                                # %if.then332
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1068(%rip)
	movl	$1006, %edi             # imm = 0x3EE
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+1076(%rip)
	jmp	.LBB2_67
	.align	16, 0x90
.LBB2_65:                               # %for.end328.if.end333_crit_edge
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1072(%rip)
.LBB2_67:                               # %if.end333
                                        #   in Loop: Header=BB2_46 Depth=1
	movl	$0, 3416(%rsp)
	incl	EdgeProfCounters+1080(%rip)
	jmp	.LBB2_68
	.align	16, 0x90
.LBB2_69:                               # %for.inc354
                                        #   in Loop: Header=BB2_68 Depth=2
	incl	EdgeProfCounters+1084(%rip)
	movslq	3416(%rsp), %rax
	movl	%eax, %ecx
	shll	$8, %ecx
	addl	3408(%rsp), %ecx
	movslq	%ecx, %rcx
	movq	3440(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	andl	%ebx, %ecx
	movl	%ecx, 1088(%rsp,%rax,4)
	movslq	3416(%rsp), %rax
	movl	%eax, %ecx
	shll	$8, %ecx
	movl	3408(%rsp), %edx
	leal	1(%rcx,%rdx), %ecx
	movslq	%ecx, %rcx
	movq	3440(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	andl	%ebx, %ecx
	decl	%ecx
	movl	%ecx, 64(%rsp,%rax,4)
	incl	EdgeProfCounters+1092(%rip)
	incl	3416(%rsp)
	incl	EdgeProfCounters+1096(%rip)
.LBB2_68:                               # %for.cond334
                                        #   Parent Loop BB2_46 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$255, 3416(%rsp)
	jle	.LBB2_69
# BB#70:                                # %for.end356
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1088(%rip)
	movl	3408(%rsp), %eax
	shll	$8, %eax
	movslq	%eax, %rax
	movq	3440(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	andl	%ebx, %eax
	movl	%eax, 3416(%rsp)
	incl	EdgeProfCounters+1100(%rip)
	jmp	.LBB2_71
	.align	16, 0x90
.LBB2_78:                               # %for.inc387
                                        #   in Loop: Header=BB2_71 Depth=2
	incl	EdgeProfCounters+1136(%rip)
	incl	3416(%rsp)
	incl	EdgeProfCounters+1140(%rip)
.LBB2_71:                               # %for.cond361
                                        #   Parent Loop BB2_46 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	3408(%rsp), %rax
	movl	3416(%rsp), %ecx
	cmpl	1088(%rsp,%rax,4), %ecx
	jge	.LBB2_79
# BB#72:                                # %for.body366
                                        #   in Loop: Header=BB2_71 Depth=2
	incl	EdgeProfCounters+1104(%rip)
	movslq	3416(%rsp), %rax
	movq	3464(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	decl	%eax
	movl	%eax, 3412(%rsp)
	jns	.LBB2_73
# BB#74:                                # %if.then372
                                        #   in Loop: Header=BB2_71 Depth=2
	incl	EdgeProfCounters+1112(%rip)
	movl	3436(%rsp), %eax
	addl	%eax, 3412(%rsp)
	incl	EdgeProfCounters+1120(%rip)
	jmp	.LBB2_75
	.align	16, 0x90
.LBB2_73:                               # %for.body366.if.end374_crit_edge
                                        #   in Loop: Header=BB2_71 Depth=2
	incl	EdgeProfCounters+1116(%rip)
.LBB2_75:                               # %if.end374
                                        #   in Loop: Header=BB2_71 Depth=2
	movslq	3412(%rsp), %rax
	movq	3456(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, 63(%rsp)
	movzbl	63(%rsp), %eax
	cmpb	$0, 2112(%rsp,%rax)
	je	.LBB2_77
# BB#76:                                # %if.end374.if.end386_crit_edge
                                        #   in Loop: Header=BB2_71 Depth=2
	incl	EdgeProfCounters+1124(%rip)
	jmp	.LBB2_78
	.align	16, 0x90
.LBB2_77:                               # %if.then380
                                        #   in Loop: Header=BB2_71 Depth=2
	incl	EdgeProfCounters+1128(%rip)
	movzbl	63(%rsp), %ecx
	movslq	1088(%rsp,%rcx,4), %rax
	leal	1(%rax), %esi
	movl	3412(%rsp), %edx
	movl	%esi, 1088(%rsp,%rcx,4)
	movq	3464(%rsp), %rcx
	movl	%edx, (%rcx,%rax,4)
	incl	EdgeProfCounters+1132(%rip)
	jmp	.LBB2_78
	.align	16, 0x90
.LBB2_79:                               # %for.end389
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1108(%rip)
	movl	3408(%rsp), %eax
	incl	%eax
	shll	$8, %eax
	movslq	%eax, %rax
	movq	3440(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	andl	%ebx, %eax
	decl	%eax
	movl	%eax, 3416(%rsp)
	incl	EdgeProfCounters+1144(%rip)
	jmp	.LBB2_80
	.align	16, 0x90
.LBB2_87:                               # %for.inc422
                                        #   in Loop: Header=BB2_80 Depth=2
	incl	EdgeProfCounters+1180(%rip)
	decl	3416(%rsp)
	incl	EdgeProfCounters+1184(%rip)
.LBB2_80:                               # %for.cond396
                                        #   Parent Loop BB2_46 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	3408(%rsp), %rax
	movl	3416(%rsp), %ecx
	cmpl	64(%rsp,%rax,4), %ecx
	jle	.LBB2_88
# BB#81:                                # %for.body401
                                        #   in Loop: Header=BB2_80 Depth=2
	incl	EdgeProfCounters+1148(%rip)
	movslq	3416(%rsp), %rax
	movq	3464(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	decl	%eax
	movl	%eax, 3412(%rsp)
	jns	.LBB2_82
# BB#83:                                # %if.then407
                                        #   in Loop: Header=BB2_80 Depth=2
	incl	EdgeProfCounters+1156(%rip)
	movl	3436(%rsp), %eax
	addl	%eax, 3412(%rsp)
	incl	EdgeProfCounters+1164(%rip)
	jmp	.LBB2_84
	.align	16, 0x90
.LBB2_82:                               # %for.body401.if.end409_crit_edge
                                        #   in Loop: Header=BB2_80 Depth=2
	incl	EdgeProfCounters+1160(%rip)
.LBB2_84:                               # %if.end409
                                        #   in Loop: Header=BB2_80 Depth=2
	movslq	3412(%rsp), %rax
	movq	3456(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, 63(%rsp)
	movzbl	63(%rsp), %eax
	cmpb	$0, 2112(%rsp,%rax)
	je	.LBB2_86
# BB#85:                                # %if.end409.if.end421_crit_edge
                                        #   in Loop: Header=BB2_80 Depth=2
	incl	EdgeProfCounters+1168(%rip)
	jmp	.LBB2_87
	.align	16, 0x90
.LBB2_86:                               # %if.then415
                                        #   in Loop: Header=BB2_80 Depth=2
	incl	EdgeProfCounters+1172(%rip)
	movzbl	63(%rsp), %ecx
	movslq	64(%rsp,%rcx,4), %rax
	leal	-1(%rax), %esi
	movl	3412(%rsp), %edx
	movl	%esi, 64(%rsp,%rcx,4)
	movq	3464(%rsp), %rcx
	movl	%edx, (%rcx,%rax,4)
	incl	EdgeProfCounters+1176(%rip)
	jmp	.LBB2_87
	.align	16, 0x90
.LBB2_88:                               # %for.end424
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1152(%rip)
	movslq	3408(%rsp), %rax
	movl	1088(%rsp,%rax,4), %ecx
	decl	%ecx
	cmpl	64(%rsp,%rax,4), %ecx
	jne	.LBB2_90
# BB#89:                                # %for.end424.if.end442_crit_edge
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1188(%rip)
	jmp	.LBB2_95
	.align	16, 0x90
.LBB2_90:                               # %lor.lhs.false
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1192(%rip)
	movslq	3408(%rsp), %rax
	cmpl	$0, 1088(%rsp,%rax,4)
	jne	.LBB2_91
# BB#92:                                # %land.lhs.true
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1196(%rip)
	movl	3436(%rsp), %eax
	decl	%eax
	movslq	3408(%rsp), %rcx
	cmpl	%eax, 64(%rsp,%rcx,4)
	jne	.LBB2_93
# BB#118:                               # %land.lhs.true.if.end442_crit_edge
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1204(%rip)
	jmp	.LBB2_95
	.align	16, 0x90
.LBB2_91:                               # %lor.lhs.false.if.then441_crit_edge
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1200(%rip)
	jmp	.LBB2_94
.LBB2_93:                               # %land.lhs.true.if.then441_crit_edge
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1208(%rip)
.LBB2_94:                               # %if.then441
                                        #   in Loop: Header=BB2_46 Depth=1
	movl	$1007, %edi             # imm = 0x3EF
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+1212(%rip)
.LBB2_95:                               # %if.end442
                                        #   in Loop: Header=BB2_46 Depth=1
	movl	$0, 3416(%rsp)
	incl	EdgeProfCounters+1216(%rip)
	jmp	.LBB2_96
	.align	16, 0x90
.LBB2_97:                               # %for.inc452
                                        #   in Loop: Header=BB2_96 Depth=2
	incl	EdgeProfCounters+1220(%rip)
	movl	3416(%rsp), %eax
	shll	$8, %eax
	addl	3408(%rsp), %eax
	movslq	%eax, %rax
	movq	3440(%rsp), %rcx
	orl	$2097152, (%rcx,%rax,4) # imm = 0x200000
	incl	EdgeProfCounters+1228(%rip)
	incl	3416(%rsp)
	incl	EdgeProfCounters+1232(%rip)
.LBB2_96:                               # %for.cond443
                                        #   Parent Loop BB2_46 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$255, 3416(%rsp)
	jle	.LBB2_97
# BB#98:                                # %for.end454
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1224(%rip)
	movslq	3408(%rsp), %rax
	movb	$1, 2112(%rsp,%rax)
	cmpl	$255, 3420(%rsp)
	jge	.LBB2_99
# BB#100:                               # %if.then459
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1236(%rip)
	movl	3408(%rsp), %eax
	shll	$8, %eax
	movslq	%eax, %rax
	movq	3440(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	andl	%ebx, %eax
	movl	%eax, 32(%rsp)
	movl	3408(%rsp), %ecx
	incl	%ecx
	shll	$8, %ecx
	movslq	%ecx, %rcx
	movq	3440(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	andl	%ebx, %ecx
	subl	%eax, %ecx
	movl	%ecx, 28(%rsp)
	movl	$0, 24(%rsp)
	incl	EdgeProfCounters+1244(%rip)
	jmp	.LBB2_101
	.align	16, 0x90
.LBB2_102:                              # %while.body474
                                        #   in Loop: Header=BB2_101 Depth=2
	incl	EdgeProfCounters+1248(%rip)
	incl	24(%rsp)
	incl	EdgeProfCounters+1256(%rip)
.LBB2_101:                              # %while.cond470
                                        #   Parent Loop BB2_46 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movb	24(%rsp), %cl
	movl	28(%rsp), %eax
	sarl	%cl, %eax
	cmpl	$65535, %eax            # imm = 0xFFFF
	jge	.LBB2_102
# BB#103:                               # %while.end476
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1252(%rip)
	movl	28(%rsp), %eax
	decl	%eax
	movl	%eax, 3416(%rsp)
	incl	EdgeProfCounters+1260(%rip)
	jmp	.LBB2_104
	.align	16, 0x90
.LBB2_108:                              # %for.inc496
                                        #   in Loop: Header=BB2_104 Depth=2
	incl	EdgeProfCounters+1284(%rip)
	decl	3416(%rsp)
	incl	EdgeProfCounters+1288(%rip)
.LBB2_104:                              # %for.cond478
                                        #   Parent Loop BB2_46 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 3416(%rsp)
	js	.LBB2_109
# BB#105:                               # %for.body481
                                        #   in Loop: Header=BB2_104 Depth=2
	incl	EdgeProfCounters+1264(%rip)
	movl	32(%rsp), %eax
	addl	3416(%rsp), %eax
	movslq	%eax, %rax
	movq	3464(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 20(%rsp)
	movb	24(%rsp), %cl
	movl	3416(%rsp), %eax
	sarl	%cl, %eax
	movw	%ax, 18(%rsp)
	movq	3448(%rsp), %rcx
	movslq	20(%rsp), %rdx
	movw	%ax, (%rcx,%rdx,2)
	cmpl	$34, 20(%rsp)
	jge	.LBB2_106
# BB#107:                               # %if.then491
                                        #   in Loop: Header=BB2_104 Depth=2
	incl	EdgeProfCounters+1272(%rip)
	movl	20(%rsp), %eax
	addl	3436(%rsp), %eax
	movslq	%eax, %rax
	movq	3448(%rsp), %rcx
	movw	18(%rsp), %dx
	movw	%dx, (%rcx,%rax,2)
	incl	EdgeProfCounters+1280(%rip)
	jmp	.LBB2_108
	.align	16, 0x90
.LBB2_106:                              # %for.body481.if.end495_crit_edge
                                        #   in Loop: Header=BB2_104 Depth=2
	incl	EdgeProfCounters+1276(%rip)
	jmp	.LBB2_108
	.align	16, 0x90
.LBB2_99:                               # %for.end454.if.end505_crit_edge
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1240(%rip)
	jmp	.LBB2_113
	.align	16, 0x90
.LBB2_109:                              # %for.end498
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1268(%rip)
	movl	28(%rsp), %eax
	decl	%eax
	movb	24(%rsp), %cl
	sarl	%cl, %eax
	cmpl	$65535, %eax            # imm = 0xFFFF
	jg	.LBB2_111
# BB#110:                               # %for.end498.if.end504_crit_edge
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1292(%rip)
	jmp	.LBB2_112
	.align	16, 0x90
.LBB2_111:                              # %if.then503
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1296(%rip)
	movl	$1002, %edi             # imm = 0x3EA
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+1300(%rip)
.LBB2_112:                              # %if.end504
                                        #   in Loop: Header=BB2_46 Depth=1
	incl	EdgeProfCounters+1304(%rip)
	jmp	.LBB2_113
.LBB2_59:                               # %if.then318
	incl	EdgeProfCounters+1036(%rip)
	incl	EdgeProfCounters+1044(%rip)
.LBB2_117:                              # %if.end514
	addq	$3472, %rsp             # imm = 0xD90
	popq	%rbx
	ret
.LBB2_114:                              # %for.end508
	incl	EdgeProfCounters+984(%rip)
	cmpl	$3, 3432(%rsp)
	jle	.LBB2_115
# BB#116:                               # %if.then511
	incl	EdgeProfCounters+1316(%rip)
	movl	56(%rsp), %ecx
	movl	3436(%rsp), %edx
	movl	%edx, %r8d
	subl	%ecx, %r8d
	movq	stderr(%rip), %rdi
	movl	$.L.str5, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+1324(%rip)
	jmp	.LBB2_117
.LBB2_115:                              # %for.end508.if.end514_crit_edge
	incl	EdgeProfCounters+1320(%rip)
	jmp	.LBB2_117
.Ltmp14:
	.size	mainSort, .Ltmp14-mainSort
	.cfi_endproc

	.align	16, 0x90
	.type	mainQSort3,@function
mainQSort3:                             # @mainQSort3
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$1416, %rsp             # imm = 0x588
.Ltmp16:
	.cfi_def_cfa_offset 1424
	incl	EdgeProfCounters+1328(%rip)
	movq	%rdi, 1408(%rsp)
	movq	%rsi, 1400(%rsp)
	movq	%rdx, 1392(%rsp)
	movl	%ecx, 1388(%rsp)
	movl	%r8d, 1384(%rsp)
	movl	%r9d, 1380(%rsp)
	movq	1432(%rsp), %rax
	movl	1424(%rsp), %ecx
	movl	%ecx, 1376(%rsp)
	movq	%rax, 1368(%rsp)
	movl	$0, 1336(%rsp)
	movslq	1336(%rsp), %rax
	movl	1384(%rsp), %ecx
	movl	%ecx, 912(%rsp,%rax,4)
	movslq	1336(%rsp), %rax
	movl	1380(%rsp), %ecx
	movl	%ecx, 512(%rsp,%rax,4)
	movslq	1336(%rsp), %rax
	movl	1376(%rsp), %ecx
	movl	%ecx, 112(%rsp,%rax,4)
	incl	1336(%rsp)
	incl	EdgeProfCounters+1332(%rip)
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_13:                               # %if.end17
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1376(%rip)
	incl	EdgeProfCounters+1384(%rip)
.LBB3_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_15 Depth 2
                                        #       Child Loop BB3_16 Depth 3
                                        #       Child Loop BB3_23 Depth 3
                                        #     Child Loop BB3_37 Depth 2
                                        #     Child Loop BB3_43 Depth 2
	cmpl	$0, 1336(%rsp)
	jle	.LBB3_2
# BB#4:                                 # %while.body
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1336(%rip)
	cmpl	$99, 1336(%rsp)
	jg	.LBB3_6
# BB#5:                                 # %while.body.if.end_crit_edge
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1344(%rip)
	jmp	.LBB3_7
	.align	16, 0x90
.LBB3_6:                                # %if.then
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1348(%rip)
	movl	$1001, %edi             # imm = 0x3E9
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+1352(%rip)
.LBB3_7:                                # %if.end
                                        #   in Loop: Header=BB3_1 Depth=1
	decl	1336(%rsp)
	movslq	1336(%rsp), %rax
	movl	912(%rsp,%rax,4), %eax
	movl	%eax, 1332(%rsp)
	movslq	1336(%rsp), %rax
	movl	512(%rsp,%rax,4), %eax
	movl	%eax, 1328(%rsp)
	movslq	1336(%rsp), %rax
	movl	112(%rsp,%rax,4), %eax
	movl	%eax, 1324(%rsp)
	movl	1328(%rsp), %eax
	subl	1332(%rsp), %eax
	cmpl	$19, %eax
	jg	.LBB3_9
# BB#8:                                 # %if.end.if.then14_crit_edge
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1356(%rip)
	jmp	.LBB3_11
	.align	16, 0x90
.LBB3_9:                                # %lor.lhs.false
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1360(%rip)
	cmpl	$15, 1324(%rsp)
	jl	.LBB3_14
# BB#10:                                # %lor.lhs.false.if.then14_crit_edge
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1364(%rip)
.LBB3_11:                               # %if.then14
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	1328(%rsp), %r9d
	movl	1332(%rsp), %r8d
	movl	1388(%rsp), %ecx
	movq	1392(%rsp), %rdx
	movq	1400(%rsp), %rsi
	movq	1408(%rsp), %rdi
	movl	1324(%rsp), %r10d
	movq	1368(%rsp), %rax
	movq	%rax, 8(%rsp)
	movl	%r10d, (%rsp)
	callq	mainSimpleSort
	movq	1368(%rsp), %rax
	cmpl	$0, (%rax)
	jns	.LBB3_13
	jmp	.LBB3_12
	.align	16, 0x90
.LBB3_14:                               # %if.end18
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1368(%rip)
	movslq	1332(%rsp), %rdx
	movq	1408(%rsp), %r8
	movl	1324(%rsp), %eax
	movl	(%r8,%rdx,4), %edi
	addl	%eax, %edi
	movslq	1328(%rsp), %r9
	movl	(%r8,%r9,4), %esi
	addl	%eax, %esi
	movq	1400(%rsp), %rcx
	movzbl	(%rcx,%rsi), %esi
	movzbl	(%rcx,%rdi), %edi
	addl	%r9d, %edx
	sarl	%edx
	movslq	%edx, %rdx
	addl	(%r8,%rdx,4), %eax
	movzbl	(%rcx,%rax), %edx
	callq	mmed3
	movzbl	%al, %eax
	movl	%eax, 1340(%rsp)
	movl	1332(%rsp), %eax
	movl	%eax, 1356(%rsp)
	movl	%eax, 1364(%rsp)
	movl	1328(%rsp), %eax
	movl	%eax, 1352(%rsp)
	movl	%eax, 1360(%rsp)
	incl	EdgeProfCounters+1388(%rip)
	jmp	.LBB3_15
	.align	16, 0x90
.LBB3_30:                               # %if.end105
                                        #   in Loop: Header=BB3_15 Depth=2
	incl	EdgeProfCounters+1484(%rip)
	movslq	1364(%rsp), %rax
	movq	1408(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 64(%rsp)
	movslq	1360(%rsp), %rcx
	movq	1408(%rsp), %rax
	movl	(%rax,%rcx,4), %ecx
	movslq	1364(%rsp), %rdx
	movl	%ecx, (%rax,%rdx,4)
	movq	1408(%rsp), %rax
	movslq	1360(%rsp), %rcx
	movl	64(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	1364(%rsp)
	decl	1360(%rsp)
	incl	EdgeProfCounters+1492(%rip)
.LBB3_15:                               # %while.body35
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_16 Depth 3
                                        #       Child Loop BB3_23 Depth 3
	incl	EdgeProfCounters+1392(%rip)
	jmp	.LBB3_16
	.align	16, 0x90
.LBB3_19:                               # %if.then51
                                        #   in Loop: Header=BB3_16 Depth=3
	incl	EdgeProfCounters+1408(%rip)
	movslq	1364(%rsp), %rax
	movq	1408(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 72(%rsp)
	movslq	1356(%rsp), %rcx
	movq	1408(%rsp), %rax
	movl	(%rax,%rcx,4), %ecx
	movslq	1364(%rsp), %rdx
	movl	%ecx, (%rax,%rdx,4)
	movq	1408(%rsp), %rax
	movslq	1356(%rsp), %rcx
	movl	72(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	1356(%rsp)
	incl	1364(%rsp)
	incl	EdgeProfCounters+1416(%rip)
.LBB3_16:                               # %while.body37
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_15 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	1364(%rsp), %eax
	cmpl	1360(%rsp), %eax
	jg	.LBB3_17
# BB#18:                                # %if.end41
                                        #   in Loop: Header=BB3_16 Depth=3
	incl	EdgeProfCounters+1400(%rip)
	movslq	1364(%rsp), %rax
	movq	1408(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	addl	1324(%rsp), %eax
	movq	1400(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	subl	1340(%rsp), %eax
	movl	%eax, 1348(%rsp)
	je	.LBB3_19
# BB#20:                                # %if.end62
                                        #   in Loop: Header=BB3_16 Depth=3
	incl	EdgeProfCounters+1412(%rip)
	cmpl	$0, 1348(%rsp)
	jg	.LBB3_21
# BB#55:                                # %if.end66
                                        #   in Loop: Header=BB3_16 Depth=3
	incl	EdgeProfCounters+1424(%rip)
	incl	1364(%rsp)
	incl	EdgeProfCounters+1432(%rip)
	jmp	.LBB3_16
	.align	16, 0x90
.LBB3_17:                               # %if.then40
                                        #   in Loop: Header=BB3_15 Depth=2
	incl	EdgeProfCounters+1396(%rip)
	incl	EdgeProfCounters+1404(%rip)
	jmp	.LBB3_22
	.align	16, 0x90
.LBB3_21:                               # %if.then65
                                        #   in Loop: Header=BB3_15 Depth=2
	incl	EdgeProfCounters+1420(%rip)
	incl	EdgeProfCounters+1428(%rip)
.LBB3_22:                               # %while.end
                                        #   in Loop: Header=BB3_15 Depth=2
	incl	EdgeProfCounters+1436(%rip)
	jmp	.LBB3_23
	.align	16, 0x90
.LBB3_26:                               # %if.then83
                                        #   in Loop: Header=BB3_23 Depth=3
	incl	EdgeProfCounters+1452(%rip)
	movslq	1360(%rsp), %rax
	movq	1408(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 68(%rsp)
	movslq	1352(%rsp), %rcx
	movq	1408(%rsp), %rax
	movl	(%rax,%rcx,4), %ecx
	movslq	1360(%rsp), %rdx
	movl	%ecx, (%rax,%rdx,4)
	movq	1408(%rsp), %rax
	movslq	1352(%rsp), %rcx
	movl	68(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	decl	1352(%rsp)
	decl	1360(%rsp)
	incl	EdgeProfCounters+1460(%rip)
.LBB3_23:                               # %while.body69
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_15 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	1364(%rsp), %eax
	cmpl	1360(%rsp), %eax
	jg	.LBB3_24
# BB#25:                                # %if.end73
                                        #   in Loop: Header=BB3_23 Depth=3
	incl	EdgeProfCounters+1444(%rip)
	movslq	1360(%rsp), %rax
	movq	1408(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	addl	1324(%rsp), %eax
	movq	1400(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	subl	1340(%rsp), %eax
	movl	%eax, 1348(%rsp)
	je	.LBB3_26
# BB#27:                                # %if.end95
                                        #   in Loop: Header=BB3_23 Depth=3
	incl	EdgeProfCounters+1456(%rip)
	cmpl	$0, 1348(%rsp)
	js	.LBB3_28
# BB#56:                                # %if.end99
                                        #   in Loop: Header=BB3_23 Depth=3
	incl	EdgeProfCounters+1468(%rip)
	decl	1360(%rsp)
	incl	EdgeProfCounters+1476(%rip)
	jmp	.LBB3_23
	.align	16, 0x90
.LBB3_24:                               # %if.then72
                                        #   in Loop: Header=BB3_15 Depth=2
	incl	EdgeProfCounters+1440(%rip)
	incl	EdgeProfCounters+1448(%rip)
	jmp	.LBB3_29
	.align	16, 0x90
.LBB3_28:                               # %if.then98
                                        #   in Loop: Header=BB3_15 Depth=2
	incl	EdgeProfCounters+1464(%rip)
	incl	EdgeProfCounters+1472(%rip)
.LBB3_29:                               # %while.end101
                                        #   in Loop: Header=BB3_15 Depth=2
	movl	1364(%rsp), %eax
	cmpl	1360(%rsp), %eax
	jle	.LBB3_30
# BB#31:                                # %while.end117
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1480(%rip)
	incl	EdgeProfCounters+1488(%rip)
	movl	1352(%rsp), %eax
	cmpl	1356(%rsp), %eax
	jge	.LBB3_33
# BB#32:                                # %if.then120
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1496(%rip)
	movslq	1336(%rsp), %rax
	movl	1332(%rsp), %ecx
	movl	%ecx, 912(%rsp,%rax,4)
	movslq	1336(%rsp), %rax
	movl	1328(%rsp), %ecx
	movl	%ecx, 512(%rsp,%rax,4)
	movl	1324(%rsp), %eax
	incl	%eax
	movslq	1336(%rsp), %rcx
	movl	%eax, 112(%rsp,%rcx,4)
	incl	1336(%rsp)
	incl	EdgeProfCounters+1504(%rip)
	jmp	.LBB3_1
.LBB3_33:                               # %if.end129
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1500(%rip)
	movl	1356(%rsp), %eax
	movl	1364(%rsp), %ecx
	subl	%eax, %ecx
	subl	1332(%rsp), %eax
	cmpl	%ecx, %eax
	jge	.LBB3_35
# BB#34:                                # %cond.true
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1508(%rip)
	movl	1356(%rsp), %eax
	subl	1332(%rsp), %eax
	incl	EdgeProfCounters+1516(%rip)
	jmp	.LBB3_36
.LBB3_35:                               # %cond.false
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1512(%rip)
	movl	1364(%rsp), %eax
	subl	1356(%rsp), %eax
	incl	EdgeProfCounters+1520(%rip)
.LBB3_36:                               # %cond.end
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	%eax, 1348(%rsp)
	movl	1332(%rsp), %eax
	movl	%eax, 60(%rsp)
	movl	1364(%rsp), %eax
	subl	1348(%rsp), %eax
	movl	%eax, 56(%rsp)
	movl	1348(%rsp), %eax
	movl	%eax, 52(%rsp)
	incl	EdgeProfCounters+1524(%rip)
	jmp	.LBB3_37
	.align	16, 0x90
.LBB3_38:                               # %while.body140
                                        #   in Loop: Header=BB3_37 Depth=2
	incl	EdgeProfCounters+1528(%rip)
	movslq	60(%rsp), %rax
	movq	1408(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 48(%rsp)
	movslq	56(%rsp), %rcx
	movq	1408(%rsp), %rax
	movl	(%rax,%rcx,4), %ecx
	movslq	60(%rsp), %rdx
	movl	%ecx, (%rax,%rdx,4)
	movq	1408(%rsp), %rax
	movslq	56(%rsp), %rcx
	movl	48(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	60(%rsp)
	incl	56(%rsp)
	decl	52(%rsp)
	incl	EdgeProfCounters+1536(%rip)
.LBB3_37:                               # %while.cond137
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 52(%rsp)
	jg	.LBB3_38
# BB#39:                                # %while.end153
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1532(%rip)
	movl	1352(%rsp), %eax
	movl	1328(%rsp), %ecx
	subl	%eax, %ecx
	subl	1360(%rsp), %eax
	cmpl	%eax, %ecx
	jge	.LBB3_41
# BB#40:                                # %cond.true158
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1540(%rip)
	movl	1328(%rsp), %eax
	subl	1352(%rsp), %eax
	incl	EdgeProfCounters+1548(%rip)
	jmp	.LBB3_42
.LBB3_41:                               # %cond.false160
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1544(%rip)
	movl	1352(%rsp), %eax
	subl	1360(%rsp), %eax
	incl	EdgeProfCounters+1552(%rip)
.LBB3_42:                               # %cond.end162
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	%eax, 1344(%rsp)
	movl	1364(%rsp), %eax
	movl	%eax, 44(%rsp)
	movl	1328(%rsp), %eax
	subl	1344(%rsp), %eax
	incl	%eax
	movl	%eax, 40(%rsp)
	movl	1344(%rsp), %eax
	movl	%eax, 36(%rsp)
	incl	EdgeProfCounters+1556(%rip)
	jmp	.LBB3_43
	.align	16, 0x90
.LBB3_44:                               # %while.body172
                                        #   in Loop: Header=BB3_43 Depth=2
	incl	EdgeProfCounters+1560(%rip)
	movslq	44(%rsp), %rax
	movq	1408(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 32(%rsp)
	movslq	40(%rsp), %rcx
	movq	1408(%rsp), %rax
	movl	(%rax,%rcx,4), %ecx
	movslq	44(%rsp), %rdx
	movl	%ecx, (%rax,%rdx,4)
	movq	1408(%rsp), %rax
	movslq	40(%rsp), %rcx
	movl	32(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	44(%rsp)
	incl	40(%rsp)
	decl	36(%rsp)
	incl	EdgeProfCounters+1568(%rip)
.LBB3_43:                               # %while.cond169
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 36(%rsp)
	jg	.LBB3_44
# BB#45:                                # %while.end185
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1564(%rip)
	movl	1332(%rsp), %eax
	addl	1364(%rsp), %eax
	subl	1356(%rsp), %eax
	decl	%eax
	movl	%eax, 1348(%rsp)
	movl	1352(%rsp), %eax
	subl	1360(%rsp), %eax
	negl	%eax
	movl	1328(%rsp), %ecx
	leal	1(%rcx,%rax), %eax
	movl	%eax, 1344(%rsp)
	movl	1332(%rsp), %eax
	movl	%eax, 100(%rsp)
	movl	1348(%rsp), %eax
	movl	%eax, 88(%rsp)
	movl	1324(%rsp), %eax
	movl	%eax, 76(%rsp)
	movl	1344(%rsp), %eax
	movl	%eax, 104(%rsp)
	movl	1328(%rsp), %eax
	movl	%eax, 92(%rsp)
	movl	1324(%rsp), %eax
	movl	%eax, 80(%rsp)
	movl	1348(%rsp), %eax
	incl	%eax
	movl	%eax, 108(%rsp)
	movl	1344(%rsp), %eax
	decl	%eax
	movl	%eax, 96(%rsp)
	movl	1324(%rsp), %eax
	incl	%eax
	movl	%eax, 84(%rsp)
	movl	88(%rsp), %eax
	movl	92(%rsp), %ecx
	subl	104(%rsp), %ecx
	subl	100(%rsp), %eax
	cmpl	%ecx, %eax
	jge	.LBB3_46
# BB#47:                                # %if.then212
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1572(%rip)
	movl	100(%rsp), %eax
	movl	%eax, 28(%rsp)
	movl	104(%rsp), %eax
	movl	%eax, 100(%rsp)
	movl	28(%rsp), %eax
	movl	%eax, 104(%rsp)
	movl	88(%rsp), %eax
	movl	%eax, 28(%rsp)
	movl	92(%rsp), %eax
	movl	%eax, 88(%rsp)
	movl	28(%rsp), %eax
	movl	%eax, 92(%rsp)
	movl	76(%rsp), %eax
	movl	%eax, 28(%rsp)
	movl	80(%rsp), %eax
	movl	%eax, 76(%rsp)
	movl	28(%rsp), %eax
	movl	%eax, 80(%rsp)
	incl	EdgeProfCounters+1580(%rip)
	jmp	.LBB3_48
.LBB3_46:                               # %while.end185.if.end225_crit_edge
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1576(%rip)
.LBB3_48:                               # %if.end225
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	92(%rsp), %eax
	movl	96(%rsp), %ecx
	subl	108(%rsp), %ecx
	subl	104(%rsp), %eax
	cmpl	%ecx, %eax
	jge	.LBB3_49
# BB#50:                                # %if.then234
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1584(%rip)
	movl	104(%rsp), %eax
	movl	%eax, 24(%rsp)
	movl	108(%rsp), %eax
	movl	%eax, 104(%rsp)
	movl	24(%rsp), %eax
	movl	%eax, 108(%rsp)
	movl	92(%rsp), %eax
	movl	%eax, 24(%rsp)
	movl	96(%rsp), %eax
	movl	%eax, 92(%rsp)
	movl	24(%rsp), %eax
	movl	%eax, 96(%rsp)
	movl	80(%rsp), %eax
	movl	%eax, 24(%rsp)
	movl	84(%rsp), %eax
	movl	%eax, 80(%rsp)
	movl	24(%rsp), %eax
	movl	%eax, 84(%rsp)
	incl	EdgeProfCounters+1592(%rip)
	jmp	.LBB3_51
.LBB3_49:                               # %if.end225.if.end248_crit_edge
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1588(%rip)
.LBB3_51:                               # %if.end248
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	88(%rsp), %eax
	movl	92(%rsp), %ecx
	subl	104(%rsp), %ecx
	subl	100(%rsp), %eax
	cmpl	%ecx, %eax
	jge	.LBB3_52
# BB#53:                                # %if.then257
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1596(%rip)
	movl	100(%rsp), %eax
	movl	%eax, 20(%rsp)
	movl	104(%rsp), %eax
	movl	%eax, 100(%rsp)
	movl	20(%rsp), %eax
	movl	%eax, 104(%rsp)
	movl	88(%rsp), %eax
	movl	%eax, 20(%rsp)
	movl	92(%rsp), %eax
	movl	%eax, 88(%rsp)
	movl	20(%rsp), %eax
	movl	%eax, 92(%rsp)
	movl	76(%rsp), %eax
	movl	%eax, 20(%rsp)
	movl	80(%rsp), %eax
	movl	%eax, 76(%rsp)
	movl	20(%rsp), %eax
	movl	%eax, 80(%rsp)
	incl	EdgeProfCounters+1604(%rip)
	jmp	.LBB3_54
.LBB3_52:                               # %if.end248.if.end271_crit_edge
                                        #   in Loop: Header=BB3_1 Depth=1
	incl	EdgeProfCounters+1600(%rip)
.LBB3_54:                               # %if.end271
                                        #   in Loop: Header=BB3_1 Depth=1
	movslq	1336(%rsp), %rax
	movl	100(%rsp), %ecx
	movl	%ecx, 912(%rsp,%rax,4)
	movslq	1336(%rsp), %rax
	movl	88(%rsp), %ecx
	movl	%ecx, 512(%rsp,%rax,4)
	movslq	1336(%rsp), %rax
	movl	76(%rsp), %ecx
	movl	%ecx, 112(%rsp,%rax,4)
	incl	1336(%rsp)
	movslq	1336(%rsp), %rax
	movl	104(%rsp), %ecx
	movl	%ecx, 912(%rsp,%rax,4)
	movslq	1336(%rsp), %rax
	movl	92(%rsp), %ecx
	movl	%ecx, 512(%rsp,%rax,4)
	movslq	1336(%rsp), %rax
	movl	80(%rsp), %ecx
	movl	%ecx, 112(%rsp,%rax,4)
	incl	1336(%rsp)
	movslq	1336(%rsp), %rax
	movl	108(%rsp), %ecx
	movl	%ecx, 912(%rsp,%rax,4)
	movslq	1336(%rsp), %rax
	movl	96(%rsp), %ecx
	movl	%ecx, 512(%rsp,%rax,4)
	movslq	1336(%rsp), %rax
	movl	84(%rsp), %ecx
	movl	%ecx, 112(%rsp,%rax,4)
	incl	1336(%rsp)
	incl	EdgeProfCounters+1608(%rip)
	jmp	.LBB3_1
.LBB3_2:                                # %while.cond.while.end302_crit_edge
	incl	EdgeProfCounters+1340(%rip)
	addq	$1416, %rsp             # imm = 0x588
	ret
.LBB3_12:                               # %if.then16
	incl	EdgeProfCounters+1372(%rip)
	incl	EdgeProfCounters+1380(%rip)
	addq	$1416, %rsp             # imm = 0x588
	ret
.Ltmp17:
	.size	mainQSort3, .Ltmp17-mainQSort3
	.cfi_endproc

	.align	16, 0x90
	.type	mainSimpleSort,@function
mainSimpleSort:                         # @mainSimpleSort
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$72, %rsp
.Ltmp19:
	.cfi_def_cfa_offset 80
	incl	EdgeProfCounters+1612(%rip)
	movq	%rdi, 64(%rsp)
	movq	%rsi, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movl	%ecx, 44(%rsp)
	movl	%r8d, 40(%rsp)
	movl	%r9d, 36(%rsp)
	movq	88(%rsp), %rax
	movl	80(%rsp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, 24(%rsp)
	movl	36(%rsp), %eax
	subl	40(%rsp), %eax
	incl	%eax
	movl	%eax, 8(%rsp)
	cmpl	$1, %eax
	jg	.LBB4_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+1616(%rip)
	incl	EdgeProfCounters+1624(%rip)
	addq	$72, %rsp
	ret
.LBB4_2:                                # %if.end
	incl	EdgeProfCounters+1620(%rip)
	movl	$0, 4(%rsp)
	incl	EdgeProfCounters+1628(%rip)
	jmp	.LBB4_3
	.align	16, 0x90
.LBB4_4:                                # %while.body
                                        #   in Loop: Header=BB4_3 Depth=1
	incl	EdgeProfCounters+1632(%rip)
	incl	4(%rsp)
	incl	EdgeProfCounters+1640(%rip)
.LBB4_3:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movslq	4(%rsp), %rax
	movl	incs(,%rax,4), %eax
	cmpl	8(%rsp), %eax
	jl	.LBB4_4
# BB#5:                                 # %while.end
	incl	EdgeProfCounters+1636(%rip)
	decl	4(%rsp)
	incl	EdgeProfCounters+1644(%rip)
	jmp	.LBB4_6
	.align	16, 0x90
.LBB4_26:                               # %while.end96
                                        #   in Loop: Header=BB4_6 Depth=1
	incl	EdgeProfCounters+1796(%rip)
	decl	4(%rsp)
	incl	EdgeProfCounters+1800(%rip)
.LBB4_6:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_10 Depth 2
                                        #       Child Loop BB4_13 Depth 3
                                        #       Child Loop BB4_20 Depth 3
                                        #       Child Loop BB4_28 Depth 3
	cmpl	$0, 4(%rsp)
	js	.LBB4_7
# BB#9:                                 # %for.body
                                        #   in Loop: Header=BB4_6 Depth=1
	incl	EdgeProfCounters+1648(%rip)
	movslq	4(%rsp), %rax
	movl	incs(,%rax,4), %eax
	movl	%eax, 12(%rsp)
	addl	40(%rsp), %eax
	movl	%eax, 20(%rsp)
	incl	EdgeProfCounters+1656(%rip)
	jmp	.LBB4_10
	.align	16, 0x90
.LBB4_34:                               # %if.end95
                                        #   in Loop: Header=BB4_10 Depth=2
	incl	EdgeProfCounters+1784(%rip)
	incl	EdgeProfCounters+1792(%rip)
.LBB4_10:                               # %while.body7
                                        #   Parent Loop BB4_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_13 Depth 3
                                        #       Child Loop BB4_20 Depth 3
                                        #       Child Loop BB4_28 Depth 3
	movl	20(%rsp), %eax
	cmpl	36(%rsp), %eax
	jg	.LBB4_11
# BB#12:                                # %if.end10
                                        #   in Loop: Header=BB4_10 Depth=2
	incl	EdgeProfCounters+1664(%rip)
	movslq	20(%rsp), %rax
	movq	64(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, (%rsp)
	movl	20(%rsp), %eax
	movl	%eax, 16(%rsp)
	incl	EdgeProfCounters+1672(%rip)
	jmp	.LBB4_13
	.align	16, 0x90
.LBB4_35:                               # %if.end30
                                        #   in Loop: Header=BB4_13 Depth=3
	incl	EdgeProfCounters+1688(%rip)
	incl	EdgeProfCounters+1696(%rip)
.LBB4_13:                               # %while.cond13
                                        #   Parent Loop BB4_6 Depth=1
                                        #     Parent Loop BB4_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	16(%rsp), %eax
	subl	12(%rsp), %eax
	movslq	%eax, %rax
	movq	64(%rsp), %rcx
	movl	32(%rsp), %esi
	movl	(%rcx,%rax,4), %edi
	addl	%esi, %edi
	addl	(%rsp), %esi
	movq	24(%rsp), %r9
	movl	44(%rsp), %r8d
	movq	48(%rsp), %rcx
	movq	56(%rsp), %rdx
	callq	mainGtU
	testb	%al, %al
	je	.LBB4_14
# BB#15:                                # %while.body19
                                        #   in Loop: Header=BB4_13 Depth=3
	incl	EdgeProfCounters+1676(%rip)
	movslq	16(%rsp), %rax
	movl	12(%rsp), %edx
	movl	%eax, %ecx
	subl	%edx, %ecx
	movslq	%ecx, %rcx
	movq	64(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	movl	%ecx, (%rdx,%rax,4)
	movl	16(%rsp), %eax
	subl	12(%rsp), %eax
	movl	%eax, 16(%rsp)
	movl	12(%rsp), %ecx
	movl	40(%rsp), %edx
	leal	-1(%rdx,%rcx), %ecx
	cmpl	%ecx, %eax
	jg	.LBB4_35
# BB#16:                                # %if.then29
                                        #   in Loop: Header=BB4_10 Depth=2
	incl	EdgeProfCounters+1684(%rip)
	incl	EdgeProfCounters+1692(%rip)
	jmp	.LBB4_17
	.align	16, 0x90
.LBB4_14:                               # %while.cond13.while.end31_crit_edge
                                        #   in Loop: Header=BB4_10 Depth=2
	incl	EdgeProfCounters+1680(%rip)
.LBB4_17:                               # %while.end31
                                        #   in Loop: Header=BB4_10 Depth=2
	movq	64(%rsp), %rax
	movslq	16(%rsp), %rcx
	movl	(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	20(%rsp), %eax
	incl	%eax
	movl	%eax, 20(%rsp)
	cmpl	36(%rsp), %eax
	jg	.LBB4_18
# BB#19:                                # %if.end37
                                        #   in Loop: Header=BB4_10 Depth=2
	incl	EdgeProfCounters+1704(%rip)
	movslq	20(%rsp), %rax
	movq	64(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, (%rsp)
	movl	20(%rsp), %eax
	movl	%eax, 16(%rsp)
	incl	EdgeProfCounters+1712(%rip)
	jmp	.LBB4_20
	.align	16, 0x90
.LBB4_36:                               # %if.end59
                                        #   in Loop: Header=BB4_20 Depth=3
	incl	EdgeProfCounters+1728(%rip)
	incl	EdgeProfCounters+1736(%rip)
.LBB4_20:                               # %while.cond40
                                        #   Parent Loop BB4_6 Depth=1
                                        #     Parent Loop BB4_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	16(%rsp), %eax
	subl	12(%rsp), %eax
	movslq	%eax, %rax
	movq	64(%rsp), %rcx
	movl	32(%rsp), %esi
	movl	(%rcx,%rax,4), %edi
	addl	%esi, %edi
	addl	(%rsp), %esi
	movq	24(%rsp), %r9
	movl	44(%rsp), %r8d
	movq	48(%rsp), %rcx
	movq	56(%rsp), %rdx
	callq	mainGtU
	testb	%al, %al
	je	.LBB4_21
# BB#22:                                # %while.body48
                                        #   in Loop: Header=BB4_20 Depth=3
	incl	EdgeProfCounters+1716(%rip)
	movslq	16(%rsp), %rax
	movl	12(%rsp), %edx
	movl	%eax, %ecx
	subl	%edx, %ecx
	movslq	%ecx, %rcx
	movq	64(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	movl	%ecx, (%rdx,%rax,4)
	movl	16(%rsp), %eax
	subl	12(%rsp), %eax
	movl	%eax, 16(%rsp)
	movl	12(%rsp), %ecx
	movl	40(%rsp), %edx
	leal	-1(%rdx,%rcx), %ecx
	cmpl	%ecx, %eax
	jg	.LBB4_36
# BB#23:                                # %if.then58
                                        #   in Loop: Header=BB4_10 Depth=2
	incl	EdgeProfCounters+1724(%rip)
	incl	EdgeProfCounters+1732(%rip)
	jmp	.LBB4_24
	.align	16, 0x90
.LBB4_21:                               # %while.cond40.while.end60_crit_edge
                                        #   in Loop: Header=BB4_10 Depth=2
	incl	EdgeProfCounters+1720(%rip)
.LBB4_24:                               # %while.end60
                                        #   in Loop: Header=BB4_10 Depth=2
	movq	64(%rsp), %rax
	movslq	16(%rsp), %rcx
	movl	(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	20(%rsp), %eax
	incl	%eax
	movl	%eax, 20(%rsp)
	cmpl	36(%rsp), %eax
	jg	.LBB4_25
# BB#27:                                # %if.end66
                                        #   in Loop: Header=BB4_10 Depth=2
	incl	EdgeProfCounters+1744(%rip)
	movslq	20(%rsp), %rax
	movq	64(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, (%rsp)
	movl	20(%rsp), %eax
	movl	%eax, 16(%rsp)
	incl	EdgeProfCounters+1752(%rip)
	jmp	.LBB4_28
	.align	16, 0x90
.LBB4_37:                               # %if.end88
                                        #   in Loop: Header=BB4_28 Depth=3
	incl	EdgeProfCounters+1768(%rip)
	incl	EdgeProfCounters+1776(%rip)
.LBB4_28:                               # %while.cond69
                                        #   Parent Loop BB4_6 Depth=1
                                        #     Parent Loop BB4_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	16(%rsp), %eax
	subl	12(%rsp), %eax
	movslq	%eax, %rax
	movq	64(%rsp), %rcx
	movl	32(%rsp), %esi
	movl	(%rcx,%rax,4), %edi
	addl	%esi, %edi
	addl	(%rsp), %esi
	movq	24(%rsp), %r9
	movl	44(%rsp), %r8d
	movq	48(%rsp), %rcx
	movq	56(%rsp), %rdx
	callq	mainGtU
	testb	%al, %al
	je	.LBB4_29
# BB#30:                                # %while.body77
                                        #   in Loop: Header=BB4_28 Depth=3
	incl	EdgeProfCounters+1756(%rip)
	movslq	16(%rsp), %rax
	movl	12(%rsp), %edx
	movl	%eax, %ecx
	subl	%edx, %ecx
	movslq	%ecx, %rcx
	movq	64(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	movl	%ecx, (%rdx,%rax,4)
	movl	16(%rsp), %eax
	subl	12(%rsp), %eax
	movl	%eax, 16(%rsp)
	movl	12(%rsp), %ecx
	movl	40(%rsp), %edx
	leal	-1(%rdx,%rcx), %ecx
	cmpl	%ecx, %eax
	jg	.LBB4_37
# BB#31:                                # %if.then87
                                        #   in Loop: Header=BB4_10 Depth=2
	incl	EdgeProfCounters+1764(%rip)
	incl	EdgeProfCounters+1772(%rip)
	jmp	.LBB4_32
	.align	16, 0x90
.LBB4_29:                               # %while.cond69.while.end89_crit_edge
                                        #   in Loop: Header=BB4_10 Depth=2
	incl	EdgeProfCounters+1760(%rip)
.LBB4_32:                               # %while.end89
                                        #   in Loop: Header=BB4_10 Depth=2
	movq	64(%rsp), %rax
	movslq	16(%rsp), %rcx
	movl	(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	20(%rsp)
	movq	24(%rsp), %rax
	cmpl	$0, (%rax)
	jns	.LBB4_34
	jmp	.LBB4_33
	.align	16, 0x90
.LBB4_11:                               # %if.then9
                                        #   in Loop: Header=BB4_6 Depth=1
	incl	EdgeProfCounters+1660(%rip)
	incl	EdgeProfCounters+1668(%rip)
	jmp	.LBB4_26
	.align	16, 0x90
.LBB4_18:                               # %if.then36
                                        #   in Loop: Header=BB4_6 Depth=1
	incl	EdgeProfCounters+1700(%rip)
	incl	EdgeProfCounters+1708(%rip)
	jmp	.LBB4_26
	.align	16, 0x90
.LBB4_25:                               # %if.then65
                                        #   in Loop: Header=BB4_6 Depth=1
	incl	EdgeProfCounters+1740(%rip)
	incl	EdgeProfCounters+1748(%rip)
	jmp	.LBB4_26
.LBB4_33:                               # %if.then94
	incl	EdgeProfCounters+1780(%rip)
	incl	EdgeProfCounters+1788(%rip)
	addq	$72, %rsp
	ret
.LBB4_7:                                # %for.cond.for.end_crit_edge
	incl	EdgeProfCounters+1652(%rip)
	addq	$72, %rsp
	ret
.Ltmp20:
	.size	mainSimpleSort, .Ltmp20-mainSimpleSort
	.cfi_endproc

	.align	16, 0x90
	.type	mmed3,@function
mmed3:                                  # @mmed3
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+1804(%rip)
	movb	%dil, -1(%rsp)
	movb	%sil, -2(%rsp)
	movb	%dl, -3(%rsp)
	movzbl	-2(%rsp), %eax
	movzbl	-1(%rsp), %ecx
	cmpl	%eax, %ecx
	jle	.LBB5_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+1808(%rip)
	movb	-1(%rsp), %al
	movb	%al, -4(%rsp)
	movb	-2(%rsp), %al
	movb	%al, -1(%rsp)
	movb	-4(%rsp), %al
	movb	%al, -2(%rsp)
	incl	EdgeProfCounters+1816(%rip)
	jmp	.LBB5_3
.LBB5_1:                                # %entry.if.end_crit_edge
	incl	EdgeProfCounters+1812(%rip)
.LBB5_3:                                # %if.end
	movzbl	-3(%rsp), %eax
	movzbl	-2(%rsp), %ecx
	cmpl	%eax, %ecx
	jle	.LBB5_4
# BB#5:                                 # %if.then7
	incl	EdgeProfCounters+1820(%rip)
	movb	-3(%rsp), %al
	movb	%al, -2(%rsp)
	movzbl	-2(%rsp), %eax
	movzbl	-1(%rsp), %ecx
	cmpl	%eax, %ecx
	jle	.LBB5_6
# BB#7:                                 # %if.then12
	incl	EdgeProfCounters+1828(%rip)
	movb	-1(%rsp), %al
	movb	%al, -2(%rsp)
	incl	EdgeProfCounters+1836(%rip)
	jmp	.LBB5_8
.LBB5_4:                                # %if.end.if.end14_crit_edge
	incl	EdgeProfCounters+1824(%rip)
	movzbl	-2(%rsp), %eax
	ret
.LBB5_6:                                # %if.then7.if.end13_crit_edge
	incl	EdgeProfCounters+1832(%rip)
.LBB5_8:                                # %if.end13
	incl	EdgeProfCounters+1840(%rip)
	movzbl	-2(%rsp), %eax
	ret
.Ltmp21:
	.size	mmed3, .Ltmp21-mmed3
	.cfi_endproc

	.align	16, 0x90
	.type	mainGtU,@function
mainGtU:                                # @mainGtU
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+1844(%rip)
	movl	%edi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	%rdx, -24(%rsp)
	movq	%rcx, -32(%rsp)
	movl	%r8d, -36(%rsp)
	movq	%r9, -48(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	je	.LBB6_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+1848(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+1856(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_2:                                # %if.end
	incl	EdgeProfCounters+1852(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	je	.LBB6_4
# BB#3:                                 # %if.then19
	incl	EdgeProfCounters+1860(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+1868(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_4:                                # %if.end25
	incl	EdgeProfCounters+1864(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	je	.LBB6_6
# BB#5:                                 # %if.then36
	incl	EdgeProfCounters+1872(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+1880(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_6:                                # %if.end42
	incl	EdgeProfCounters+1876(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	je	.LBB6_8
# BB#7:                                 # %if.then53
	incl	EdgeProfCounters+1884(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+1892(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_8:                                # %if.end59
	incl	EdgeProfCounters+1888(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	je	.LBB6_10
# BB#9:                                 # %if.then70
	incl	EdgeProfCounters+1896(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+1904(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_10:                               # %if.end76
	incl	EdgeProfCounters+1900(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	je	.LBB6_12
# BB#11:                                # %if.then87
	incl	EdgeProfCounters+1908(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+1916(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_12:                               # %if.end93
	incl	EdgeProfCounters+1912(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	je	.LBB6_14
# BB#13:                                # %if.then104
	incl	EdgeProfCounters+1920(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+1928(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_14:                               # %if.end110
	incl	EdgeProfCounters+1924(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	je	.LBB6_16
# BB#15:                                # %if.then121
	incl	EdgeProfCounters+1932(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+1940(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_16:                               # %if.end127
	incl	EdgeProfCounters+1936(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	je	.LBB6_18
# BB#17:                                # %if.then138
	incl	EdgeProfCounters+1944(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+1952(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_18:                               # %if.end144
	incl	EdgeProfCounters+1948(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	je	.LBB6_20
# BB#19:                                # %if.then155
	incl	EdgeProfCounters+1956(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+1964(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_20:                               # %if.end161
	incl	EdgeProfCounters+1960(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	je	.LBB6_22
# BB#21:                                # %if.then172
	incl	EdgeProfCounters+1968(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+1976(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_22:                               # %if.end178
	incl	EdgeProfCounters+1972(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	je	.LBB6_24
# BB#23:                                # %if.then189
	incl	EdgeProfCounters+1980(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+1988(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_24:                               # %if.end195
	incl	EdgeProfCounters+1984(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-36(%rsp), %eax
	addl	$8, %eax
	movl	%eax, -52(%rsp)
	incl	EdgeProfCounters+1992(%rip)
	jmp	.LBB6_25
.LBB6_64:                               # %do.cond.do.body_crit_edge
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2216(%rip)
.LBB6_25:                               # %do.body
                                        # =>This Inner Loop Header: Depth=1
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	jne	.LBB6_26
# BB#27:                                # %if.end212
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2000(%rip)
	movl	-8(%rsp), %eax
	movq	-32(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, -56(%rsp)
	movl	-12(%rsp), %eax
	movq	-32(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, -58(%rsp)
	movzwl	-58(%rsp), %eax
	movzwl	-56(%rsp), %ecx
	cmpl	%eax, %ecx
	jne	.LBB6_28
# BB#29:                                # %if.end227
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2012(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	jne	.LBB6_30
# BB#31:                                # %if.end244
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2024(%rip)
	movl	-8(%rsp), %eax
	movq	-32(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, -56(%rsp)
	movl	-12(%rsp), %eax
	movq	-32(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, -58(%rsp)
	movzwl	-58(%rsp), %eax
	movzwl	-56(%rsp), %ecx
	cmpl	%eax, %ecx
	jne	.LBB6_32
# BB#33:                                # %if.end259
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2036(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	jne	.LBB6_34
# BB#35:                                # %if.end276
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2048(%rip)
	movl	-8(%rsp), %eax
	movq	-32(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, -56(%rsp)
	movl	-12(%rsp), %eax
	movq	-32(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, -58(%rsp)
	movzwl	-58(%rsp), %eax
	movzwl	-56(%rsp), %ecx
	cmpl	%eax, %ecx
	jne	.LBB6_36
# BB#37:                                # %if.end291
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2060(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	jne	.LBB6_38
# BB#39:                                # %if.end308
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2072(%rip)
	movl	-8(%rsp), %eax
	movq	-32(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, -56(%rsp)
	movl	-12(%rsp), %eax
	movq	-32(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, -58(%rsp)
	movzwl	-58(%rsp), %eax
	movzwl	-56(%rsp), %ecx
	cmpl	%eax, %ecx
	jne	.LBB6_40
# BB#41:                                # %if.end323
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2084(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	jne	.LBB6_42
# BB#43:                                # %if.end340
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2096(%rip)
	movl	-8(%rsp), %eax
	movq	-32(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, -56(%rsp)
	movl	-12(%rsp), %eax
	movq	-32(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, -58(%rsp)
	movzwl	-58(%rsp), %eax
	movzwl	-56(%rsp), %ecx
	cmpl	%eax, %ecx
	jne	.LBB6_44
# BB#45:                                # %if.end355
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2108(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	jne	.LBB6_46
# BB#47:                                # %if.end372
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2120(%rip)
	movl	-8(%rsp), %eax
	movq	-32(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, -56(%rsp)
	movl	-12(%rsp), %eax
	movq	-32(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, -58(%rsp)
	movzwl	-58(%rsp), %eax
	movzwl	-56(%rsp), %ecx
	cmpl	%eax, %ecx
	jne	.LBB6_48
# BB#49:                                # %if.end387
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2132(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	jne	.LBB6_50
# BB#51:                                # %if.end404
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2144(%rip)
	movl	-8(%rsp), %eax
	movq	-32(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, -56(%rsp)
	movl	-12(%rsp), %eax
	movq	-32(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, -58(%rsp)
	movzwl	-58(%rsp), %eax
	movzwl	-56(%rsp), %ecx
	cmpl	%eax, %ecx
	jne	.LBB6_52
# BB#53:                                # %if.end419
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2156(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -53(%rsp)
	movl	-12(%rsp), %eax
	movq	-24(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, -54(%rsp)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	jne	.LBB6_54
# BB#55:                                # %if.end436
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2168(%rip)
	movl	-8(%rsp), %eax
	movq	-32(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, -56(%rsp)
	movl	-12(%rsp), %eax
	movq	-32(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, -58(%rsp)
	movzwl	-58(%rsp), %eax
	movzwl	-56(%rsp), %ecx
	cmpl	%eax, %ecx
	jne	.LBB6_56
# BB#57:                                # %if.end451
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2180(%rip)
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	cmpl	-36(%rsp), %eax
	jb	.LBB6_58
# BB#59:                                # %if.then456
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2188(%rip)
	movl	-36(%rsp), %eax
	subl	%eax, -8(%rsp)
	incl	EdgeProfCounters+2196(%rip)
	jmp	.LBB6_60
.LBB6_58:                               # %if.end451.if.end457_crit_edge
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2192(%rip)
.LBB6_60:                               # %if.end457
                                        #   in Loop: Header=BB6_25 Depth=1
	movl	-12(%rsp), %eax
	cmpl	-36(%rsp), %eax
	jb	.LBB6_61
# BB#62:                                # %if.then460
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2200(%rip)
	movl	-36(%rsp), %eax
	subl	%eax, -12(%rsp)
	incl	EdgeProfCounters+2208(%rip)
	jmp	.LBB6_63
.LBB6_61:                               # %if.end457.if.end462_crit_edge
                                        #   in Loop: Header=BB6_25 Depth=1
	incl	EdgeProfCounters+2204(%rip)
.LBB6_63:                               # %if.end462
                                        #   in Loop: Header=BB6_25 Depth=1
	addl	$-8, -52(%rsp)
	movq	-48(%rsp), %rax
	decl	(%rax)
	incl	EdgeProfCounters+2212(%rip)
	cmpl	$0, -52(%rsp)
	jns	.LBB6_64
# BB#65:                                # %do.end
	incl	EdgeProfCounters+2220(%rip)
	movb	$0, -1(%rsp)
	incl	EdgeProfCounters+2224(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_26:                               # %if.then206
	incl	EdgeProfCounters+1996(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+2004(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_28:                               # %if.then221
	incl	EdgeProfCounters+2008(%rip)
	movzwl	-58(%rsp), %eax
	movzwl	-56(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+2016(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_30:                               # %if.then238
	incl	EdgeProfCounters+2020(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+2028(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_32:                               # %if.then253
	incl	EdgeProfCounters+2032(%rip)
	movzwl	-58(%rsp), %eax
	movzwl	-56(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+2040(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_34:                               # %if.then270
	incl	EdgeProfCounters+2044(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+2052(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_36:                               # %if.then285
	incl	EdgeProfCounters+2056(%rip)
	movzwl	-58(%rsp), %eax
	movzwl	-56(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+2064(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_38:                               # %if.then302
	incl	EdgeProfCounters+2068(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+2076(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_40:                               # %if.then317
	incl	EdgeProfCounters+2080(%rip)
	movzwl	-58(%rsp), %eax
	movzwl	-56(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+2088(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_42:                               # %if.then334
	incl	EdgeProfCounters+2092(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+2100(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_44:                               # %if.then349
	incl	EdgeProfCounters+2104(%rip)
	movzwl	-58(%rsp), %eax
	movzwl	-56(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+2112(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_46:                               # %if.then366
	incl	EdgeProfCounters+2116(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+2124(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_48:                               # %if.then381
	incl	EdgeProfCounters+2128(%rip)
	movzwl	-58(%rsp), %eax
	movzwl	-56(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+2136(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_50:                               # %if.then398
	incl	EdgeProfCounters+2140(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+2148(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_52:                               # %if.then413
	incl	EdgeProfCounters+2152(%rip)
	movzwl	-58(%rsp), %eax
	movzwl	-56(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+2160(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_54:                               # %if.then430
	incl	EdgeProfCounters+2164(%rip)
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+2172(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_56:                               # %if.then445
	incl	EdgeProfCounters+2176(%rip)
	movzwl	-58(%rsp), %eax
	movzwl	-56(%rsp), %ecx
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	incl	EdgeProfCounters+2184(%rip)
	movzbl	-1(%rsp), %eax
	ret
.Ltmp22:
	.size	mainGtU, .Ltmp22-mainGtU
	.cfi_endproc

	.align	16, 0x90
	.type	fallbackQSort3,@function
fallbackQSort3:                         # @fallbackQSort3
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp25:
	.cfi_def_cfa_offset 16
	subq	$928, %rsp              # imm = 0x3A0
.Ltmp26:
	.cfi_def_cfa_offset 944
.Ltmp27:
	.cfi_offset %rbx, -16
	incl	EdgeProfCounters+2228(%rip)
	movq	%rdi, 920(%rsp)
	movq	%rsi, 912(%rsp)
	movl	%edx, 908(%rsp)
	movl	%ecx, 904(%rsp)
	movl	$0, 860(%rsp)
	movl	$0, 876(%rsp)
	movslq	876(%rsp), %rax
	movl	908(%rsp), %ecx
	movl	%ecx, 448(%rsp,%rax,4)
	movslq	876(%rsp), %rax
	movl	904(%rsp), %ecx
	movl	%ecx, 48(%rsp,%rax,4)
	incl	876(%rsp)
	incl	EdgeProfCounters+2232(%rip)
	movl	$2863311531, %ebx       # imm = 0xAAAAAAAB
	jmp	.LBB7_1
	.align	16, 0x90
.LBB7_6:                                # %if.then9
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2256(%rip)
	movl	868(%rsp), %ecx
	movl	872(%rsp), %edx
	movq	912(%rsp), %rsi
	movq	920(%rsp), %rdi
	callq	fallbackSimpleSort
	incl	EdgeProfCounters+2264(%rip)
.LBB7_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_14 Depth 2
                                        #       Child Loop BB7_15 Depth 3
                                        #       Child Loop BB7_22 Depth 3
                                        #     Child Loop BB7_36 Depth 2
                                        #     Child Loop BB7_42 Depth 2
	cmpl	$0, 876(%rsp)
	jle	.LBB7_47
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2236(%rip)
	cmpl	$99, 876(%rsp)
	jg	.LBB7_4
# BB#3:                                 # %while.body.if.end_crit_edge
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2244(%rip)
	jmp	.LBB7_5
	.align	16, 0x90
.LBB7_4:                                # %if.then
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2248(%rip)
	movl	$1004, %edi             # imm = 0x3EC
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+2252(%rip)
.LBB7_5:                                # %if.end
                                        #   in Loop: Header=BB7_1 Depth=1
	decl	876(%rsp)
	movslq	876(%rsp), %rax
	movl	448(%rsp,%rax,4), %eax
	movl	%eax, 872(%rsp)
	movslq	876(%rsp), %rax
	movl	48(%rsp,%rax,4), %eax
	movl	%eax, 868(%rsp)
	subl	872(%rsp), %eax
	cmpl	$9, %eax
	jle	.LBB7_6
# BB#7:                                 # %if.end10
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2260(%rip)
	imull	$7621, 860(%rsp), %eax  # imm = 0x1DC5
	incl	%eax
	andl	$32767, %eax            # imm = 0x7FFF
	movl	%eax, 860(%rsp)
	movq	%rax, %rcx
	imulq	%rbx, %rcx
	shrq	$33, %rcx
	leal	(%rcx,%rcx,2), %ecx
	subl	%ecx, %eax
	movl	%eax, 856(%rsp)
	jne	.LBB7_9
# BB#8:                                 # %if.then13
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2268(%rip)
	movslq	872(%rsp), %rax
	movq	920(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movq	912(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 864(%rsp)
	incl	EdgeProfCounters+2276(%rip)
	jmp	.LBB7_13
	.align	16, 0x90
.LBB7_9:                                # %if.else
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2272(%rip)
	cmpl	$1, 856(%rsp)
	jne	.LBB7_11
# BB#10:                                # %if.then19
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2280(%rip)
	movl	872(%rsp), %eax
	addl	868(%rsp), %eax
	sarl	%eax
	movslq	%eax, %rax
	movq	920(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movq	912(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 864(%rsp)
	incl	EdgeProfCounters+2288(%rip)
	jmp	.LBB7_12
.LBB7_11:                               # %if.else25
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2284(%rip)
	movslq	868(%rsp), %rax
	movq	920(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movq	912(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 864(%rsp)
	incl	EdgeProfCounters+2292(%rip)
.LBB7_12:                               # %if.end30
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2296(%rip)
.LBB7_13:                               # %if.end31
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	872(%rsp), %eax
	movl	%eax, 892(%rsp)
	movl	%eax, 900(%rsp)
	movl	868(%rsp), %eax
	movl	%eax, 888(%rsp)
	movl	%eax, 896(%rsp)
	incl	EdgeProfCounters+2300(%rip)
	jmp	.LBB7_14
	.align	16, 0x90
.LBB7_29:                               # %if.end92
                                        #   in Loop: Header=BB7_14 Depth=2
	incl	EdgeProfCounters+2396(%rip)
	movslq	900(%rsp), %rax
	movq	920(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 36(%rsp)
	movslq	896(%rsp), %rcx
	movq	920(%rsp), %rax
	movl	(%rax,%rcx,4), %ecx
	movslq	900(%rsp), %rdx
	movl	%ecx, (%rax,%rdx,4)
	movq	920(%rsp), %rax
	movslq	896(%rsp), %rcx
	movl	36(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	900(%rsp)
	decl	896(%rsp)
	incl	EdgeProfCounters+2404(%rip)
.LBB7_14:                               # %while.body33
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_15 Depth 3
                                        #       Child Loop BB7_22 Depth 3
	incl	EdgeProfCounters+2304(%rip)
	jmp	.LBB7_15
	.align	16, 0x90
.LBB7_18:                               # %if.then45
                                        #   in Loop: Header=BB7_15 Depth=3
	incl	EdgeProfCounters+2320(%rip)
	movslq	900(%rsp), %rax
	movq	920(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 44(%rsp)
	movslq	892(%rsp), %rcx
	movq	920(%rsp), %rax
	movl	(%rax,%rcx,4), %ecx
	movslq	900(%rsp), %rdx
	movl	%ecx, (%rax,%rdx,4)
	movq	920(%rsp), %rax
	movslq	892(%rsp), %rcx
	movl	44(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	892(%rsp)
	incl	900(%rsp)
	incl	EdgeProfCounters+2328(%rip)
.LBB7_15:                               # %while.body35
                                        #   Parent Loop BB7_1 Depth=1
                                        #     Parent Loop BB7_14 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	900(%rsp), %eax
	cmpl	896(%rsp), %eax
	jg	.LBB7_16
# BB#17:                                # %if.end38
                                        #   in Loop: Header=BB7_15 Depth=3
	incl	EdgeProfCounters+2312(%rip)
	movslq	900(%rsp), %rax
	movq	920(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movq	912(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	subl	864(%rsp), %eax
	movl	%eax, 884(%rsp)
	je	.LBB7_18
# BB#19:                                # %if.end56
                                        #   in Loop: Header=BB7_15 Depth=3
	incl	EdgeProfCounters+2324(%rip)
	cmpl	$0, 884(%rsp)
	jg	.LBB7_20
# BB#48:                                # %if.end59
                                        #   in Loop: Header=BB7_15 Depth=3
	incl	EdgeProfCounters+2336(%rip)
	incl	900(%rsp)
	incl	EdgeProfCounters+2344(%rip)
	jmp	.LBB7_15
	.align	16, 0x90
.LBB7_16:                               # %if.then37
                                        #   in Loop: Header=BB7_14 Depth=2
	incl	EdgeProfCounters+2308(%rip)
	incl	EdgeProfCounters+2316(%rip)
	jmp	.LBB7_21
	.align	16, 0x90
.LBB7_20:                               # %if.then58
                                        #   in Loop: Header=BB7_14 Depth=2
	incl	EdgeProfCounters+2332(%rip)
	incl	EdgeProfCounters+2340(%rip)
.LBB7_21:                               # %while.end
                                        #   in Loop: Header=BB7_14 Depth=2
	incl	EdgeProfCounters+2348(%rip)
	jmp	.LBB7_22
	.align	16, 0x90
.LBB7_25:                               # %if.then72
                                        #   in Loop: Header=BB7_22 Depth=3
	incl	EdgeProfCounters+2364(%rip)
	movslq	896(%rsp), %rax
	movq	920(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 40(%rsp)
	movslq	888(%rsp), %rcx
	movq	920(%rsp), %rax
	movl	(%rax,%rcx,4), %ecx
	movslq	896(%rsp), %rdx
	movl	%ecx, (%rax,%rdx,4)
	movq	920(%rsp), %rax
	movslq	888(%rsp), %rcx
	movl	40(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	decl	888(%rsp)
	decl	896(%rsp)
	incl	EdgeProfCounters+2372(%rip)
.LBB7_22:                               # %while.body62
                                        #   Parent Loop BB7_1 Depth=1
                                        #     Parent Loop BB7_14 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	900(%rsp), %eax
	cmpl	896(%rsp), %eax
	jg	.LBB7_23
# BB#24:                                # %if.end65
                                        #   in Loop: Header=BB7_22 Depth=3
	incl	EdgeProfCounters+2356(%rip)
	movslq	896(%rsp), %rax
	movq	920(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movq	912(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	subl	864(%rsp), %eax
	movl	%eax, 884(%rsp)
	je	.LBB7_25
# BB#26:                                # %if.end84
                                        #   in Loop: Header=BB7_22 Depth=3
	incl	EdgeProfCounters+2368(%rip)
	cmpl	$0, 884(%rsp)
	js	.LBB7_27
# BB#49:                                # %if.end87
                                        #   in Loop: Header=BB7_22 Depth=3
	incl	EdgeProfCounters+2380(%rip)
	decl	896(%rsp)
	incl	EdgeProfCounters+2388(%rip)
	jmp	.LBB7_22
	.align	16, 0x90
.LBB7_23:                               # %if.then64
                                        #   in Loop: Header=BB7_14 Depth=2
	incl	EdgeProfCounters+2352(%rip)
	incl	EdgeProfCounters+2360(%rip)
	jmp	.LBB7_28
	.align	16, 0x90
.LBB7_27:                               # %if.then86
                                        #   in Loop: Header=BB7_14 Depth=2
	incl	EdgeProfCounters+2376(%rip)
	incl	EdgeProfCounters+2384(%rip)
.LBB7_28:                               # %while.end89
                                        #   in Loop: Header=BB7_14 Depth=2
	movl	900(%rsp), %eax
	cmpl	896(%rsp), %eax
	jle	.LBB7_29
# BB#30:                                # %while.end104
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2392(%rip)
	incl	EdgeProfCounters+2400(%rip)
	movl	888(%rsp), %eax
	cmpl	892(%rsp), %eax
	jge	.LBB7_32
# BB#31:                                # %if.then106
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2408(%rip)
	incl	EdgeProfCounters+2416(%rip)
	jmp	.LBB7_1
.LBB7_32:                               # %if.end107
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2412(%rip)
	movl	892(%rsp), %eax
	movl	900(%rsp), %ecx
	subl	%eax, %ecx
	subl	872(%rsp), %eax
	cmpl	%ecx, %eax
	jge	.LBB7_34
# BB#33:                                # %cond.true
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2420(%rip)
	movl	892(%rsp), %eax
	subl	872(%rsp), %eax
	incl	EdgeProfCounters+2428(%rip)
	jmp	.LBB7_35
.LBB7_34:                               # %cond.false
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2424(%rip)
	movl	900(%rsp), %eax
	subl	892(%rsp), %eax
	incl	EdgeProfCounters+2432(%rip)
.LBB7_35:                               # %cond.end
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	%eax, 884(%rsp)
	movl	872(%rsp), %eax
	movl	%eax, 32(%rsp)
	movl	900(%rsp), %eax
	subl	884(%rsp), %eax
	movl	%eax, 28(%rsp)
	movl	884(%rsp), %eax
	movl	%eax, 24(%rsp)
	incl	EdgeProfCounters+2436(%rip)
	jmp	.LBB7_36
	.align	16, 0x90
.LBB7_37:                               # %while.body116
                                        #   in Loop: Header=BB7_36 Depth=2
	incl	EdgeProfCounters+2440(%rip)
	movslq	32(%rsp), %rax
	movq	920(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 20(%rsp)
	movslq	28(%rsp), %rcx
	movq	920(%rsp), %rax
	movl	(%rax,%rcx,4), %ecx
	movslq	32(%rsp), %rdx
	movl	%ecx, (%rax,%rdx,4)
	movq	920(%rsp), %rax
	movslq	28(%rsp), %rcx
	movl	20(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	32(%rsp)
	incl	28(%rsp)
	decl	24(%rsp)
	incl	EdgeProfCounters+2448(%rip)
.LBB7_36:                               # %while.cond114
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 24(%rsp)
	jg	.LBB7_37
# BB#38:                                # %while.end129
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2444(%rip)
	movl	888(%rsp), %eax
	movl	868(%rsp), %ecx
	subl	%eax, %ecx
	subl	896(%rsp), %eax
	cmpl	%eax, %ecx
	jge	.LBB7_40
# BB#39:                                # %cond.true133
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2452(%rip)
	movl	868(%rsp), %eax
	subl	888(%rsp), %eax
	incl	EdgeProfCounters+2460(%rip)
	jmp	.LBB7_41
.LBB7_40:                               # %cond.false135
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2456(%rip)
	movl	888(%rsp), %eax
	subl	896(%rsp), %eax
	incl	EdgeProfCounters+2464(%rip)
.LBB7_41:                               # %cond.end137
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	%eax, 880(%rsp)
	movl	900(%rsp), %eax
	movl	%eax, 16(%rsp)
	movl	868(%rsp), %eax
	subl	880(%rsp), %eax
	incl	%eax
	movl	%eax, 12(%rsp)
	movl	880(%rsp), %eax
	movl	%eax, 8(%rsp)
	incl	EdgeProfCounters+2468(%rip)
	jmp	.LBB7_42
	.align	16, 0x90
.LBB7_43:                               # %while.body146
                                        #   in Loop: Header=BB7_42 Depth=2
	incl	EdgeProfCounters+2472(%rip)
	movslq	16(%rsp), %rax
	movq	920(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 4(%rsp)
	movslq	12(%rsp), %rcx
	movq	920(%rsp), %rax
	movl	(%rax,%rcx,4), %ecx
	movslq	16(%rsp), %rdx
	movl	%ecx, (%rax,%rdx,4)
	movq	920(%rsp), %rax
	movslq	12(%rsp), %rcx
	movl	4(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	16(%rsp)
	incl	12(%rsp)
	decl	8(%rsp)
	incl	EdgeProfCounters+2480(%rip)
.LBB7_42:                               # %while.cond144
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 8(%rsp)
	jg	.LBB7_43
# BB#44:                                # %while.end159
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2476(%rip)
	movl	872(%rsp), %eax
	addl	900(%rsp), %eax
	subl	892(%rsp), %eax
	decl	%eax
	movl	%eax, 884(%rsp)
	movl	888(%rsp), %eax
	subl	896(%rsp), %eax
	negl	%eax
	movl	868(%rsp), %ecx
	leal	1(%rcx,%rax), %ecx
	movl	%ecx, 880(%rsp)
	movl	868(%rsp), %eax
	subl	%ecx, %eax
	movl	884(%rsp), %ecx
	subl	872(%rsp), %ecx
	cmpl	%eax, %ecx
	jle	.LBB7_46
# BB#45:                                # %if.then169
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2484(%rip)
	movslq	876(%rsp), %rax
	movl	872(%rsp), %ecx
	movl	%ecx, 448(%rsp,%rax,4)
	movslq	876(%rsp), %rax
	movl	884(%rsp), %ecx
	movl	%ecx, 48(%rsp,%rax,4)
	incl	876(%rsp)
	movslq	876(%rsp), %rax
	movl	880(%rsp), %ecx
	movl	%ecx, 448(%rsp,%rax,4)
	movslq	876(%rsp), %rax
	movl	868(%rsp), %ecx
	movl	%ecx, 48(%rsp,%rax,4)
	incl	876(%rsp)
	incl	EdgeProfCounters+2492(%rip)
	incl	EdgeProfCounters+2500(%rip)
	jmp	.LBB7_1
.LBB7_46:                               # %if.else180
                                        #   in Loop: Header=BB7_1 Depth=1
	incl	EdgeProfCounters+2488(%rip)
	movslq	876(%rsp), %rax
	movl	880(%rsp), %ecx
	movl	%ecx, 448(%rsp,%rax,4)
	movslq	876(%rsp), %rax
	movl	868(%rsp), %ecx
	movl	%ecx, 48(%rsp,%rax,4)
	incl	876(%rsp)
	movslq	876(%rsp), %rax
	movl	872(%rsp), %ecx
	movl	%ecx, 448(%rsp,%rax,4)
	movslq	876(%rsp), %rax
	movl	884(%rsp), %ecx
	movl	%ecx, 48(%rsp,%rax,4)
	incl	876(%rsp)
	incl	EdgeProfCounters+2496(%rip)
	incl	EdgeProfCounters+2500(%rip)
	jmp	.LBB7_1
.LBB7_47:                               # %while.end192
	incl	EdgeProfCounters+2240(%rip)
	addq	$928, %rsp              # imm = 0x3A0
	popq	%rbx
	ret
.Ltmp28:
	.size	fallbackQSort3, .Ltmp28-fallbackQSort3
	.cfi_endproc

	.align	16, 0x90
	.type	fallbackSimpleSort,@function
fallbackSimpleSort:                     # @fallbackSimpleSort
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+2504(%rip)
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movl	%edx, -20(%rsp)
	movl	%ecx, -24(%rsp)
	cmpl	%ecx, -20(%rsp)
	jne	.LBB8_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+2508(%rip)
	incl	EdgeProfCounters+2516(%rip)
	ret
.LBB8_2:                                # %if.end
	incl	EdgeProfCounters+2512(%rip)
	movl	-24(%rsp), %eax
	subl	-20(%rsp), %eax
	cmpl	$3, %eax
	jle	.LBB8_3
# BB#4:                                 # %if.then3
	incl	EdgeProfCounters+2520(%rip)
	movl	-24(%rsp), %eax
	addl	$-4, %eax
	movl	%eax, -28(%rsp)
	incl	EdgeProfCounters+2528(%rip)
	jmp	.LBB8_5
	.align	16, 0x90
.LBB8_12:                               # %for.end
                                        #   in Loop: Header=BB8_5 Depth=1
	incl	EdgeProfCounters+2560(%rip)
	movl	-32(%rsp), %eax
	addl	$-4, %eax
	movslq	%eax, %rax
	movq	-8(%rsp), %rcx
	movl	-36(%rsp), %edx
	movl	%edx, (%rcx,%rax,4)
	incl	EdgeProfCounters+2572(%rip)
	decl	-28(%rsp)
	incl	EdgeProfCounters+2576(%rip)
.LBB8_5:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_7 Depth 2
	movl	-28(%rsp), %eax
	cmpl	-20(%rsp), %eax
	jl	.LBB8_13
# BB#6:                                 # %for.body
                                        #   in Loop: Header=BB8_5 Depth=1
	incl	EdgeProfCounters+2532(%rip)
	movslq	-28(%rsp), %rax
	movq	-8(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, -36(%rsp)
	movslq	-36(%rsp), %rax
	movq	-16(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, -40(%rsp)
	movl	-28(%rsp), %eax
	addl	$4, %eax
	movl	%eax, -32(%rsp)
	incl	EdgeProfCounters+2540(%rip)
	jmp	.LBB8_7
	.align	16, 0x90
.LBB8_11:                               # %for.body15
                                        #   in Loop: Header=BB8_7 Depth=2
	incl	EdgeProfCounters+2556(%rip)
	movslq	-32(%rsp), %rax
	movq	-8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	addl	$-4, %eax
	movslq	%eax, %rax
	movl	%edx, (%rcx,%rax,4)
	incl	EdgeProfCounters+2564(%rip)
	addl	$4, -32(%rsp)
	incl	EdgeProfCounters+2568(%rip)
.LBB8_7:                                # %for.cond8
                                        #   Parent Loop BB8_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-32(%rsp), %eax
	cmpl	-24(%rsp), %eax
	jg	.LBB8_8
# BB#9:                                 # %land.rhs
                                        #   in Loop: Header=BB8_7 Depth=2
	incl	EdgeProfCounters+2544(%rip)
	movslq	-32(%rsp), %rax
	movq	-8(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movq	-16(%rsp), %rcx
	movl	-40(%rsp), %edx
	cmpl	(%rcx,%rax,4), %edx
	seta	%al
	incl	EdgeProfCounters+2552(%rip)
	jmp	.LBB8_10
	.align	16, 0x90
.LBB8_8:                                # %for.cond8.land.end_crit_edge
                                        #   in Loop: Header=BB8_7 Depth=2
	incl	EdgeProfCounters+2548(%rip)
	xorb	%al, %al
.LBB8_10:                               # %land.end
                                        #   in Loop: Header=BB8_7 Depth=2
	cmpb	$1, %al
	jne	.LBB8_12
	jmp	.LBB8_11
.LBB8_3:                                # %if.end.if.end27_crit_edge
	incl	EdgeProfCounters+2524(%rip)
	jmp	.LBB8_14
.LBB8_13:                               # %for.end26
	incl	EdgeProfCounters+2536(%rip)
	incl	EdgeProfCounters+2580(%rip)
.LBB8_14:                               # %if.end27
	movl	-24(%rsp), %eax
	decl	%eax
	movl	%eax, -28(%rsp)
	incl	EdgeProfCounters+2584(%rip)
	jmp	.LBB8_15
	.align	16, 0x90
.LBB8_24:                               # %for.end53
                                        #   in Loop: Header=BB8_15 Depth=1
	incl	EdgeProfCounters+2616(%rip)
	movl	-32(%rsp), %eax
	decl	%eax
	movslq	%eax, %rax
	movq	-8(%rsp), %rcx
	movl	-36(%rsp), %edx
	movl	%edx, (%rcx,%rax,4)
	incl	EdgeProfCounters+2628(%rip)
	decl	-28(%rsp)
	incl	EdgeProfCounters+2632(%rip)
.LBB8_15:                               # %for.cond29
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_19 Depth 2
	movl	-28(%rsp), %eax
	cmpl	-20(%rsp), %eax
	jl	.LBB8_16
# BB#18:                                # %for.body31
                                        #   in Loop: Header=BB8_15 Depth=1
	incl	EdgeProfCounters+2588(%rip)
	movslq	-28(%rsp), %rax
	movq	-8(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, -36(%rsp)
	movslq	-36(%rsp), %rax
	movq	-16(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, -40(%rsp)
	movl	-28(%rsp), %eax
	incl	%eax
	movl	%eax, -32(%rsp)
	incl	EdgeProfCounters+2596(%rip)
	jmp	.LBB8_19
	.align	16, 0x90
.LBB8_23:                               # %for.body46
                                        #   in Loop: Header=BB8_19 Depth=2
	incl	EdgeProfCounters+2612(%rip)
	movslq	-32(%rsp), %rax
	movq	-8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	decl	%eax
	movslq	%eax, %rax
	movl	%edx, (%rcx,%rax,4)
	incl	EdgeProfCounters+2620(%rip)
	incl	-32(%rsp)
	incl	EdgeProfCounters+2624(%rip)
.LBB8_19:                               # %for.cond37
                                        #   Parent Loop BB8_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-32(%rsp), %eax
	cmpl	-24(%rsp), %eax
	jg	.LBB8_20
# BB#21:                                # %land.rhs39
                                        #   in Loop: Header=BB8_19 Depth=2
	incl	EdgeProfCounters+2600(%rip)
	movslq	-32(%rsp), %rax
	movq	-8(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movq	-16(%rsp), %rcx
	movl	-40(%rsp), %edx
	cmpl	(%rcx,%rax,4), %edx
	seta	%al
	incl	EdgeProfCounters+2608(%rip)
	jmp	.LBB8_22
	.align	16, 0x90
.LBB8_20:                               # %for.cond37.land.end45_crit_edge
                                        #   in Loop: Header=BB8_19 Depth=2
	incl	EdgeProfCounters+2604(%rip)
	xorb	%al, %al
.LBB8_22:                               # %land.end45
                                        #   in Loop: Header=BB8_19 Depth=2
	cmpb	$1, %al
	jne	.LBB8_24
	jmp	.LBB8_23
.LBB8_16:                               # %for.cond29.for.end59_crit_edge
	incl	EdgeProfCounters+2592(%rip)
	ret
.Ltmp29:
	.size	fallbackSimpleSort, .Ltmp29-fallbackSimpleSort
	.cfi_endproc

	.globl	fopen_output_safely
	.align	16, 0x90
	.type	fopen_output_safely,@function
fopen_output_safely:                    # @fopen_output_safely
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp31:
	.cfi_def_cfa_offset 48
	incl	EdgeProfCounters+2636(%rip)
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	24(%rsp), %rdi
	movl	$193, %esi
	movl	$384, %edx              # imm = 0x180
	xorb	%al, %al
	callq	open
	movl	%eax, 4(%rsp)
	cmpl	$-1, %eax
	jne	.LBB9_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+2640(%rip)
	movq	$0, 32(%rsp)
	incl	EdgeProfCounters+2648(%rip)
	jmp	.LBB9_6
.LBB9_2:                                # %if.end
	incl	EdgeProfCounters+2644(%rip)
	movq	16(%rsp), %rsi
	movl	4(%rsp), %edi
	callq	fdopen
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.LBB9_4
# BB#3:                                 # %if.end.if.end5_crit_edge
	incl	EdgeProfCounters+2656(%rip)
	jmp	.LBB9_5
.LBB9_4:                                # %if.then3
	incl	EdgeProfCounters+2652(%rip)
	movl	4(%rsp), %edi
	callq	close
	incl	EdgeProfCounters+2660(%rip)
.LBB9_5:                                # %if.end5
	movq	8(%rsp), %rax
	movq	%rax, 32(%rsp)
	incl	EdgeProfCounters+2664(%rip)
.LBB9_6:                                # %return
	movq	32(%rsp), %rax
	addq	$40, %rsp
	ret
.Ltmp32:
	.size	fopen_output_safely, .Ltmp32-fopen_output_safely
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp35:
	.cfi_def_cfa_offset 16
	subq	$64, %rsp
.Ltmp36:
	.cfi_def_cfa_offset 80
.Ltmp37:
	.cfi_offset %rbx, -16
	movq	%rsi, %rbx
	movl	$EdgeProfCounters, %edx
	movl	$4693, %ecx             # imm = 0x1255
	callq	llvm_start_edge_profiling
	incl	EdgeProfCounters+2668(%rip)
	movl	$0, 60(%rsp)
	movl	%eax, 56(%rsp)
	movq	%rbx, 48(%rsp)
	movq	$0, outputHandleJustInCase(%rip)
	movb	$0, smallMode(%rip)
	movb	$0, keepInputFiles(%rip)
	movb	$0, forceOverwrite(%rip)
	movb	$1, noisy(%rip)
	movl	$0, verbosity(%rip)
	movl	$9, blockSize100k(%rip)
	movb	$0, testFailsExist(%rip)
	movb	$0, unzFailsExist(%rip)
	movl	$0, numFileNames(%rip)
	movl	$0, numFilesProcessed(%rip)
	movl	$30, workFactor(%rip)
	movb	$0, deleteOutputOnInterrupt(%rip)
	movl	$0, exitValue(%rip)
	movl	$0, 40(%rsp)
	movl	$0, 44(%rsp)
	movl	$11, %edi
	movl	$mySIGSEGVorSIGBUScatcher, %esi
	callq	signal
	movl	$7, %edi
	movl	$mySIGSEGVorSIGBUScatcher, %esi
	callq	signal
	movl	$inName, %edi
	movl	$.L.str615, %esi
	callq	copyFileName
	movl	$outName, %edi
	movl	$.L.str615, %esi
	callq	copyFileName
	movq	48(%rsp), %rax
	movq	(%rax), %rsi
	movl	$progNameReally, %edi
	callq	copyFileName
	movq	$progNameReally, progName(%rip)
	movq	$progNameReally, 32(%rsp)
	incl	EdgeProfCounters+2672(%rip)
	jmp	.LBB10_1
	.align	16, 0x90
.LBB10_5:                               # %for.inc
                                        #   in Loop: Header=BB10_1 Depth=1
	incl	EdgeProfCounters+2696(%rip)
	incq	32(%rsp)
	incl	EdgeProfCounters+2700(%rip)
.LBB10_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	32(%rsp), %rax
	movsbl	(%rax), %eax
	testl	%eax, %eax
	je	.LBB10_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB10_1 Depth=1
	incl	EdgeProfCounters+2676(%rip)
	movq	32(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$47, %eax
	jne	.LBB10_3
# BB#4:                                 # %if.then
                                        #   in Loop: Header=BB10_1 Depth=1
	incl	EdgeProfCounters+2684(%rip)
	movq	32(%rsp), %rax
	incq	%rax
	movq	%rax, progName(%rip)
	incl	EdgeProfCounters+2692(%rip)
	jmp	.LBB10_5
	.align	16, 0x90
.LBB10_3:                               # %for.body.if.end_crit_edge
                                        #   in Loop: Header=BB10_1 Depth=1
	incl	EdgeProfCounters+2688(%rip)
	jmp	.LBB10_5
.LBB10_6:                               # %for.end
	incl	EdgeProfCounters+2680(%rip)
	movq	$0, 24(%rsp)
	leaq	24(%rsp), %rbx
	movq	%rbx, %rdi
	movl	$.L.str716, %esi
	callq	addFlagsFromEnvVar
	movq	%rbx, %rdi
	movl	$.L.str817, %esi
	callq	addFlagsFromEnvVar
	movl	$1, 44(%rsp)
	incl	EdgeProfCounters+2704(%rip)
	jmp	.LBB10_7
	.align	16, 0x90
.LBB10_8:                               # %for.inc15
                                        #   in Loop: Header=BB10_7 Depth=1
	incl	EdgeProfCounters+2708(%rip)
	movslq	44(%rsp), %rax
	movq	48(%rsp), %rcx
	movq	(%rcx,%rax,8), %rsi
	movq	24(%rsp), %rdi
	callq	snocString
	movq	%rax, 24(%rsp)
	incl	EdgeProfCounters+2716(%rip)
	incl	44(%rsp)
	incl	EdgeProfCounters+2720(%rip)
.LBB10_7:                               # %for.cond9
                                        # =>This Inner Loop Header: Depth=1
	movl	56(%rsp), %eax
	decl	%eax
	cmpl	%eax, 44(%rsp)
	jle	.LBB10_8
# BB#9:                                 # %for.end16
	incl	EdgeProfCounters+2712(%rip)
	movl	$7, longestFileName(%rip)
	movl	$0, numFileNames(%rip)
	movb	$1, 15(%rsp)
	movq	24(%rsp), %rax
	movq	%rax, 16(%rsp)
	incl	EdgeProfCounters+2724(%rip)
	jmp	.LBB10_10
	.align	16, 0x90
.LBB10_21:                              # %for.inc45
                                        #   in Loop: Header=BB10_10 Depth=1
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 16(%rsp)
	incl	EdgeProfCounters+2784(%rip)
.LBB10_10:                              # %for.cond17
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$0, 16(%rsp)
	je	.LBB10_22
# BB#11:                                # %for.body20
                                        #   in Loop: Header=BB10_10 Depth=1
	incl	EdgeProfCounters+2728(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str918, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_13
# BB#12:                                # %if.then24
                                        #   in Loop: Header=BB10_10 Depth=1
	incl	EdgeProfCounters+2736(%rip)
	movb	$0, 15(%rsp)
	incl	EdgeProfCounters+2744(%rip)
	jmp	.LBB10_21
	.align	16, 0x90
.LBB10_13:                              # %if.end25
                                        #   in Loop: Header=BB10_10 Depth=1
	incl	EdgeProfCounters+2740(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movsbl	(%rax), %eax
	cmpl	$45, %eax
	jne	.LBB10_14
# BB#15:                                # %land.lhs.true
                                        #   in Loop: Header=BB10_10 Depth=1
	incl	EdgeProfCounters+2748(%rip)
	cmpb	$0, 15(%rsp)
	je	.LBB10_16
# BB#233:                               # %if.then32
                                        #   in Loop: Header=BB10_10 Depth=1
	incl	EdgeProfCounters+2756(%rip)
	incl	EdgeProfCounters+2764(%rip)
	jmp	.LBB10_21
	.align	16, 0x90
.LBB10_14:                              # %if.end25.if.end33_crit_edge
                                        #   in Loop: Header=BB10_10 Depth=1
	incl	EdgeProfCounters+2752(%rip)
	jmp	.LBB10_17
.LBB10_16:                              # %land.lhs.true.if.end33_crit_edge
                                        #   in Loop: Header=BB10_10 Depth=1
	incl	EdgeProfCounters+2760(%rip)
.LBB10_17:                              # %if.end33
                                        #   in Loop: Header=BB10_10 Depth=1
	incl	numFileNames(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	longestFileName(%rip), %ebx
	callq	strlen
	cmpl	%eax, %ebx
	jge	.LBB10_18
# BB#19:                                # %if.then40
                                        #   in Loop: Header=BB10_10 Depth=1
	incl	EdgeProfCounters+2768(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	callq	strlen
	movl	%eax, longestFileName(%rip)
	incl	EdgeProfCounters+2776(%rip)
	jmp	.LBB10_20
.LBB10_18:                              # %if.end33.if.end44_crit_edge
                                        #   in Loop: Header=BB10_10 Depth=1
	incl	EdgeProfCounters+2772(%rip)
.LBB10_20:                              # %if.end44
                                        #   in Loop: Header=BB10_10 Depth=1
	incl	EdgeProfCounters+2780(%rip)
	jmp	.LBB10_21
.LBB10_22:                              # %for.end46
	incl	EdgeProfCounters+2732(%rip)
	cmpl	$0, numFileNames(%rip)
	je	.LBB10_23
# BB#24:                                # %if.else
	incl	EdgeProfCounters+2792(%rip)
	movl	$3, srcMode(%rip)
	incl	EdgeProfCounters+2800(%rip)
	jmp	.LBB10_25
.LBB10_23:                              # %if.then49
	incl	EdgeProfCounters+2788(%rip)
	movl	$1, srcMode(%rip)
	incl	EdgeProfCounters+2796(%rip)
.LBB10_25:                              # %if.end50
	movl	$1, opMode(%rip)
	movq	progName(%rip), %rdi
	movl	$.L.str10, %esi
	callq	strstr
	testq	%rax, %rax
	je	.LBB10_27
# BB#26:                                # %if.end50.if.then57_crit_edge
	incl	EdgeProfCounters+2804(%rip)
	jmp	.LBB10_30
.LBB10_27:                              # %lor.lhs.false
	incl	EdgeProfCounters+2808(%rip)
	movq	progName(%rip), %rdi
	movl	$.L.str11, %esi
	callq	strstr
	testq	%rax, %rax
	je	.LBB10_28
# BB#29:                                # %lor.lhs.false.if.then57_crit_edge
	incl	EdgeProfCounters+2812(%rip)
.LBB10_30:                              # %if.then57
	movl	$2, opMode(%rip)
	incl	EdgeProfCounters+2820(%rip)
.LBB10_31:                              # %if.end58
	movq	progName(%rip), %rdi
	movl	$.L.str12, %esi
	callq	strstr
	testq	%rax, %rax
	je	.LBB10_33
# BB#32:                                # %if.end58.if.then74_crit_edge
	incl	EdgeProfCounters+2824(%rip)
	jmp	.LBB10_40
.LBB10_33:                              # %lor.lhs.false62
	incl	EdgeProfCounters+2828(%rip)
	movq	progName(%rip), %rdi
	movl	$.L.str13, %esi
	callq	strstr
	testq	%rax, %rax
	je	.LBB10_35
# BB#34:                                # %lor.lhs.false62.if.then74_crit_edge
	incl	EdgeProfCounters+2832(%rip)
	jmp	.LBB10_40
.LBB10_28:                              # %lor.lhs.false.if.end58_crit_edge
	incl	EdgeProfCounters+2816(%rip)
	jmp	.LBB10_31
.LBB10_35:                              # %lor.lhs.false66
	incl	EdgeProfCounters+2836(%rip)
	movq	progName(%rip), %rdi
	movl	$.L.str14, %esi
	callq	strstr
	testq	%rax, %rax
	je	.LBB10_37
# BB#36:                                # %lor.lhs.false66.if.then74_crit_edge
	incl	EdgeProfCounters+2840(%rip)
	jmp	.LBB10_40
.LBB10_37:                              # %lor.lhs.false70
	incl	EdgeProfCounters+2844(%rip)
	movq	progName(%rip), %rdi
	movl	$.L.str15, %esi
	callq	strstr
	testq	%rax, %rax
	je	.LBB10_38
# BB#39:                                # %lor.lhs.false70.if.then74_crit_edge
	incl	EdgeProfCounters+2848(%rip)
.LBB10_40:                              # %if.then74
	movl	$2, opMode(%rip)
	movl	$1, %eax
	cmpl	$0, numFileNames(%rip)
	je	.LBB10_42
# BB#41:                                # %select.mid
	movl	$2, %eax
.LBB10_42:                              # %select.end
	movl	%eax, srcMode(%rip)
	incl	EdgeProfCounters+2856(%rip)
.LBB10_43:                              # %if.end77
	movq	24(%rsp), %rax
	movq	%rax, 16(%rsp)
	incl	EdgeProfCounters+2860(%rip)
	jmp	.LBB10_44
	.align	16, 0x90
.LBB10_93:                              # %for.inc138
                                        #   in Loop: Header=BB10_44 Depth=1
	incl	EdgeProfCounters+3096(%rip)
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 16(%rsp)
	incl	EdgeProfCounters+3100(%rip)
.LBB10_44:                              # %for.cond78
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB10_58 Depth 2
	cmpq	$0, 16(%rsp)
	je	.LBB10_45
# BB#51:                                # %for.body81
                                        #   in Loop: Header=BB10_44 Depth=1
	incl	EdgeProfCounters+2864(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str918, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB10_52
# BB#53:                                # %if.end87
                                        #   in Loop: Header=BB10_44 Depth=1
	incl	EdgeProfCounters+2876(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movsbl	(%rax), %eax
	cmpl	$45, %eax
	jne	.LBB10_54
# BB#55:                                # %land.lhs.true93
                                        #   in Loop: Header=BB10_44 Depth=1
	incl	EdgeProfCounters+2884(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movsbl	1(%rax), %eax
	cmpl	$45, %eax
	je	.LBB10_56
# BB#57:                                # %if.then99
                                        #   in Loop: Header=BB10_44 Depth=1
	incl	EdgeProfCounters+2892(%rip)
	movl	$1, 40(%rsp)
	incl	EdgeProfCounters+2900(%rip)
	jmp	.LBB10_58
	.align	16, 0x90
.LBB10_91:                              # %for.inc134
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+3084(%rip)
	incl	40(%rsp)
	incl	EdgeProfCounters+3088(%rip)
.LBB10_58:                              # %for.cond100
                                        #   Parent Loop BB10_44 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movslq	40(%rsp), %rcx
	movsbl	(%rax,%rcx), %eax
	testl	%eax, %eax
	je	.LBB10_92
# BB#59:                                # %for.body107
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2904(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movslq	40(%rsp), %rcx
	movsbl	(%rax,%rcx), %eax
	cmpl	$75, %eax
	ja	.LBB10_62
# BB#60:                                # %for.body107
                                        #   in Loop: Header=BB10_58 Depth=2
	addl	$-49, %eax
	cmpl	$8, %eax
	ja	.LBB10_90
# BB#61:                                # %for.body107
                                        #   in Loop: Header=BB10_58 Depth=2
	jmpq	*.LJTI10_1(,%rax,8)
.LBB10_79:                              # %sw.bb119
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2948(%rip)
	movl	$1, blockSize100k(%rip)
	incl	EdgeProfCounters+3032(%rip)
	jmp	.LBB10_91
	.align	16, 0x90
.LBB10_62:                              # %for.body107
                                        #   in Loop: Header=BB10_58 Depth=2
	cmpl	$85, %eax
	ja	.LBB10_66
# BB#63:                                # %for.body107
                                        #   in Loop: Header=BB10_58 Depth=2
	cmpl	$76, %eax
	jne	.LBB10_90
# BB#64:                                # %for.body107.sw.bb128_crit_edge159
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2988(%rip)
	jmp	.LBB10_65
	.align	16, 0x90
.LBB10_66:                              # %for.body107
                                        #   in Loop: Header=BB10_58 Depth=2
	cmpl	$98, %eax
	ja	.LBB10_69
# BB#67:                                # %for.body107
                                        #   in Loop: Header=BB10_58 Depth=2
	cmpl	$86, %eax
	jne	.LBB10_90
# BB#68:                                # %for.body107.sw.bb128_crit_edge
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2984(%rip)
.LBB10_65:                              # %sw.bb128
                                        #   in Loop: Header=BB10_58 Depth=2
	callq	license
	incl	EdgeProfCounters+3068(%rip)
	jmp	.LBB10_91
.LBB10_69:                              # %for.body107
                                        #   in Loop: Header=BB10_58 Depth=2
	addl	$-99, %eax
	cmpl	$23, %eax
	ja	.LBB10_90
# BB#70:                                # %for.body107
                                        #   in Loop: Header=BB10_58 Depth=2
	jmpq	*.LJTI10_0(,%rax,8)
.LBB10_71:                              # %sw.bb
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2916(%rip)
	movl	$2, srcMode(%rip)
	incl	EdgeProfCounters+3000(%rip)
	jmp	.LBB10_91
	.align	16, 0x90
.LBB10_90:                              # %sw.default
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2912(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rcx
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str16, %esi
	xorb	%al, %al
	callq	fprintf
	movq	progName(%rip), %rdi
	callq	usage
	movl	$1, %edi
	callq	exit
	incl	EdgeProfCounters+3080(%rip)
	jmp	.LBB10_91
.LBB10_80:                              # %sw.bb120
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2952(%rip)
	movl	$2, blockSize100k(%rip)
	incl	EdgeProfCounters+3036(%rip)
	jmp	.LBB10_91
.LBB10_81:                              # %sw.bb121
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2956(%rip)
	movl	$3, blockSize100k(%rip)
	incl	EdgeProfCounters+3040(%rip)
	jmp	.LBB10_91
.LBB10_82:                              # %sw.bb122
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2960(%rip)
	movl	$4, blockSize100k(%rip)
	incl	EdgeProfCounters+3044(%rip)
	jmp	.LBB10_91
.LBB10_83:                              # %sw.bb123
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2964(%rip)
	movl	$5, blockSize100k(%rip)
	incl	EdgeProfCounters+3048(%rip)
	jmp	.LBB10_91
.LBB10_84:                              # %sw.bb124
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2968(%rip)
	movl	$6, blockSize100k(%rip)
	incl	EdgeProfCounters+3052(%rip)
	jmp	.LBB10_91
.LBB10_85:                              # %sw.bb125
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2972(%rip)
	movl	$7, blockSize100k(%rip)
	incl	EdgeProfCounters+3056(%rip)
	jmp	.LBB10_91
.LBB10_86:                              # %sw.bb126
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2976(%rip)
	movl	$8, blockSize100k(%rip)
	incl	EdgeProfCounters+3060(%rip)
	jmp	.LBB10_91
.LBB10_87:                              # %sw.bb127
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2980(%rip)
	movl	$9, blockSize100k(%rip)
	incl	EdgeProfCounters+3064(%rip)
	jmp	.LBB10_91
.LBB10_72:                              # %sw.bb112
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2920(%rip)
	movl	$2, opMode(%rip)
	incl	EdgeProfCounters+3004(%rip)
	jmp	.LBB10_91
.LBB10_74:                              # %sw.bb114
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2928(%rip)
	movb	$1, forceOverwrite(%rip)
	incl	EdgeProfCounters+3012(%rip)
	jmp	.LBB10_91
.LBB10_89:                              # %sw.bb131
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2996(%rip)
	movq	progName(%rip), %rdi
	callq	usage
	xorl	%edi, %edi
	callq	exit
	incl	EdgeProfCounters+3076(%rip)
	jmp	.LBB10_91
.LBB10_76:                              # %sw.bb116
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2936(%rip)
	movb	$1, keepInputFiles(%rip)
	incl	EdgeProfCounters+3020(%rip)
	jmp	.LBB10_91
.LBB10_78:                              # %sw.bb118
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2944(%rip)
	movb	$0, noisy(%rip)
	incl	EdgeProfCounters+3028(%rip)
	jmp	.LBB10_91
.LBB10_77:                              # %sw.bb117
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2940(%rip)
	movb	$1, smallMode(%rip)
	incl	EdgeProfCounters+3024(%rip)
	jmp	.LBB10_91
.LBB10_75:                              # %sw.bb115
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2932(%rip)
	movl	$3, opMode(%rip)
	incl	EdgeProfCounters+3016(%rip)
	jmp	.LBB10_91
.LBB10_88:                              # %sw.bb129
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2992(%rip)
	incl	verbosity(%rip)
	incl	EdgeProfCounters+3072(%rip)
	jmp	.LBB10_91
.LBB10_73:                              # %sw.bb113
                                        #   in Loop: Header=BB10_58 Depth=2
	incl	EdgeProfCounters+2924(%rip)
	movl	$1, opMode(%rip)
	incl	EdgeProfCounters+3008(%rip)
	jmp	.LBB10_91
	.align	16, 0x90
.LBB10_54:                              # %if.end87.if.end137_crit_edge
                                        #   in Loop: Header=BB10_44 Depth=1
	incl	EdgeProfCounters+2888(%rip)
	jmp	.LBB10_93
	.align	16, 0x90
.LBB10_56:                              # %land.lhs.true93.if.end137_crit_edge
                                        #   in Loop: Header=BB10_44 Depth=1
	incl	EdgeProfCounters+2896(%rip)
	jmp	.LBB10_93
.LBB10_92:                              # %for.end136
                                        #   in Loop: Header=BB10_44 Depth=1
	incl	EdgeProfCounters+2908(%rip)
	incl	EdgeProfCounters+3092(%rip)
	jmp	.LBB10_93
.LBB10_45:                              # %for.cond78.for.end140_crit_edge
	incl	EdgeProfCounters+2868(%rip)
	jmp	.LBB10_46
.LBB10_52:                              # %if.then86
	incl	EdgeProfCounters+2872(%rip)
	incl	EdgeProfCounters+2880(%rip)
.LBB10_46:                              # %for.end140
	movq	24(%rsp), %rax
	movq	%rax, 16(%rsp)
	incl	EdgeProfCounters+3104(%rip)
	jmp	.LBB10_47
	.align	16, 0x90
.LBB10_150:                             # %for.inc281
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3412(%rip)
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 16(%rsp)
	incl	EdgeProfCounters+3416(%rip)
.LBB10_47:                              # %for.cond141
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$0, 16(%rsp)
	je	.LBB10_48
# BB#94:                                # %for.body144
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3108(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str918, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB10_95
# BB#96:                                # %if.end150
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3120(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str17, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_98
# BB#97:                                # %if.then155
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3128(%rip)
	movl	$2, srcMode(%rip)
	incl	EdgeProfCounters+3136(%rip)
	jmp	.LBB10_150
	.align	16, 0x90
.LBB10_98:                              # %if.else156
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3132(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str18, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_100
# BB#99:                                # %if.then161
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3140(%rip)
	movl	$2, opMode(%rip)
	incl	EdgeProfCounters+3148(%rip)
	jmp	.LBB10_149
	.align	16, 0x90
.LBB10_100:                             # %if.else162
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3144(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str19, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_102
# BB#101:                               # %if.then167
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3152(%rip)
	movl	$1, opMode(%rip)
	incl	EdgeProfCounters+3160(%rip)
	jmp	.LBB10_148
.LBB10_102:                             # %if.else168
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3156(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str20, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_104
# BB#103:                               # %if.then173
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3164(%rip)
	movb	$1, forceOverwrite(%rip)
	incl	EdgeProfCounters+3172(%rip)
	jmp	.LBB10_147
.LBB10_104:                             # %if.else174
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3168(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str21, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_106
# BB#105:                               # %if.then179
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3176(%rip)
	movl	$3, opMode(%rip)
	incl	EdgeProfCounters+3184(%rip)
	jmp	.LBB10_146
.LBB10_106:                             # %if.else180
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3180(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str22, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_108
# BB#107:                               # %if.then185
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3188(%rip)
	movb	$1, keepInputFiles(%rip)
	incl	EdgeProfCounters+3196(%rip)
	jmp	.LBB10_145
.LBB10_108:                             # %if.else186
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3192(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str23, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_110
# BB#109:                               # %if.then191
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3200(%rip)
	movb	$1, smallMode(%rip)
	incl	EdgeProfCounters+3208(%rip)
	jmp	.LBB10_144
.LBB10_110:                             # %if.else192
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3204(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str24, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_112
# BB#111:                               # %if.then197
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3212(%rip)
	movb	$0, noisy(%rip)
	incl	EdgeProfCounters+3220(%rip)
	jmp	.LBB10_143
.LBB10_112:                             # %if.else198
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3216(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str25, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_114
# BB#113:                               # %if.then203
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3224(%rip)
	callq	license
	incl	EdgeProfCounters+3232(%rip)
	jmp	.LBB10_142
.LBB10_114:                             # %if.else204
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3228(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str26, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_116
# BB#115:                               # %if.then209
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3236(%rip)
	callq	license
	incl	EdgeProfCounters+3244(%rip)
	jmp	.LBB10_141
.LBB10_116:                             # %if.else210
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3240(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str27, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_118
# BB#117:                               # %if.then215
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3248(%rip)
	movl	$1, workFactor(%rip)
	incl	EdgeProfCounters+3256(%rip)
	jmp	.LBB10_140
.LBB10_118:                             # %if.else216
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3252(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str28, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_120
# BB#119:                               # %if.then221
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3260(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	callq	redundant
	incl	EdgeProfCounters+3268(%rip)
	jmp	.LBB10_139
.LBB10_120:                             # %if.else223
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3264(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str29, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_122
# BB#121:                               # %if.then228
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3272(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	callq	redundant
	incl	EdgeProfCounters+3280(%rip)
	jmp	.LBB10_138
.LBB10_122:                             # %if.else230
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3276(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str30, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_124
# BB#123:                               # %if.then235
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3284(%rip)
	movl	$1, blockSize100k(%rip)
	incl	EdgeProfCounters+3292(%rip)
	jmp	.LBB10_137
.LBB10_124:                             # %if.else236
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3288(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str31, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_126
# BB#125:                               # %if.then241
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3296(%rip)
	movl	$9, blockSize100k(%rip)
	incl	EdgeProfCounters+3304(%rip)
	jmp	.LBB10_136
.LBB10_126:                             # %if.else242
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3300(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str32, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_128
# BB#127:                               # %if.then247
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3308(%rip)
	incl	verbosity(%rip)
	incl	EdgeProfCounters+3316(%rip)
	jmp	.LBB10_135
.LBB10_128:                             # %if.else249
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3312(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str33, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_130
# BB#129:                               # %if.then254
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3320(%rip)
	movq	progName(%rip), %rdi
	callq	usage
	xorl	%edi, %edi
	callq	exit
	incl	EdgeProfCounters+3328(%rip)
	jmp	.LBB10_134
.LBB10_130:                             # %if.else255
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3324(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str918, %esi
	movl	$2, %edx
	callq	strncmp
	testl	%eax, %eax
	jne	.LBB10_131
# BB#132:                               # %if.then260
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3332(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rcx
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str16, %esi
	xorb	%al, %al
	callq	fprintf
	movq	progName(%rip), %rdi
	callq	usage
	movl	$1, %edi
	callq	exit
	incl	EdgeProfCounters+3340(%rip)
	jmp	.LBB10_133
.LBB10_131:                             # %if.else255.if.end263_crit_edge
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3336(%rip)
.LBB10_133:                             # %if.end263
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3344(%rip)
.LBB10_134:                             # %if.end264
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3348(%rip)
.LBB10_135:                             # %if.end265
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3352(%rip)
.LBB10_136:                             # %if.end266
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3356(%rip)
.LBB10_137:                             # %if.end267
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3360(%rip)
.LBB10_138:                             # %if.end268
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3364(%rip)
.LBB10_139:                             # %if.end269
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3368(%rip)
.LBB10_140:                             # %if.end270
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3372(%rip)
.LBB10_141:                             # %if.end271
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3376(%rip)
.LBB10_142:                             # %if.end272
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3380(%rip)
.LBB10_143:                             # %if.end273
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3384(%rip)
.LBB10_144:                             # %if.end274
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3388(%rip)
.LBB10_145:                             # %if.end275
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3392(%rip)
.LBB10_146:                             # %if.end276
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3396(%rip)
.LBB10_147:                             # %if.end277
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3400(%rip)
.LBB10_148:                             # %if.end278
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3404(%rip)
.LBB10_149:                             # %if.end279
                                        #   in Loop: Header=BB10_47 Depth=1
	incl	EdgeProfCounters+3408(%rip)
	jmp	.LBB10_150
.LBB10_48:                              # %for.cond141.for.end283_crit_edge
	incl	EdgeProfCounters+3112(%rip)
	jmp	.LBB10_49
.LBB10_95:                              # %if.then149
	incl	EdgeProfCounters+3116(%rip)
	incl	EdgeProfCounters+3124(%rip)
.LBB10_49:                              # %for.end283
	cmpl	$4, verbosity(%rip)
	jle	.LBB10_50
# BB#151:                               # %if.then286
	incl	EdgeProfCounters+3420(%rip)
	movl	$4, verbosity(%rip)
	incl	EdgeProfCounters+3428(%rip)
	jmp	.LBB10_152
.LBB10_50:                              # %for.end283.if.end287_crit_edge
	incl	EdgeProfCounters+3424(%rip)
.LBB10_152:                             # %if.end287
	cmpl	$1, opMode(%rip)
	jne	.LBB10_153
# BB#154:                               # %land.lhs.true290
	incl	EdgeProfCounters+3432(%rip)
	cmpb	$0, smallMode(%rip)
	je	.LBB10_155
# BB#156:                               # %land.lhs.true293
	incl	EdgeProfCounters+3440(%rip)
	cmpl	$2, blockSize100k(%rip)
	jle	.LBB10_157
# BB#158:                               # %if.then296
	incl	EdgeProfCounters+3448(%rip)
	movl	$2, blockSize100k(%rip)
	incl	EdgeProfCounters+3456(%rip)
	jmp	.LBB10_159
.LBB10_153:                             # %if.end287.if.end297_crit_edge
	incl	EdgeProfCounters+3436(%rip)
	jmp	.LBB10_159
.LBB10_155:                             # %land.lhs.true290.if.end297_crit_edge
	incl	EdgeProfCounters+3444(%rip)
	jmp	.LBB10_159
.LBB10_157:                             # %land.lhs.true293.if.end297_crit_edge
	incl	EdgeProfCounters+3452(%rip)
.LBB10_159:                             # %if.end297
	cmpl	$3, opMode(%rip)
	jne	.LBB10_160
# BB#161:                               # %land.lhs.true300
	incl	EdgeProfCounters+3460(%rip)
	cmpl	$2, srcMode(%rip)
	jne	.LBB10_162
# BB#163:                               # %if.then303
	incl	EdgeProfCounters+3468(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str34, %esi
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	exit
	incl	EdgeProfCounters+3476(%rip)
	jmp	.LBB10_164
.LBB10_160:                             # %if.end297.if.end305_crit_edge
	incl	EdgeProfCounters+3464(%rip)
	jmp	.LBB10_164
.LBB10_162:                             # %land.lhs.true300.if.end305_crit_edge
	incl	EdgeProfCounters+3472(%rip)
.LBB10_164:                             # %if.end305
	cmpl	$2, srcMode(%rip)
	jne	.LBB10_165
# BB#166:                               # %land.lhs.true308
	incl	EdgeProfCounters+3480(%rip)
	cmpl	$0, numFileNames(%rip)
	je	.LBB10_168
# BB#167:                               # %land.lhs.true308.if.end312_crit_edge
	incl	EdgeProfCounters+3492(%rip)
	jmp	.LBB10_169
.LBB10_165:                             # %if.end305.if.end312_crit_edge
	incl	EdgeProfCounters+3484(%rip)
	jmp	.LBB10_169
.LBB10_168:                             # %if.then311
	incl	EdgeProfCounters+3488(%rip)
	movl	$1, srcMode(%rip)
	incl	EdgeProfCounters+3496(%rip)
.LBB10_169:                             # %if.end312
	cmpl	$1, opMode(%rip)
	je	.LBB10_170
# BB#171:                               # %if.then315
	incl	EdgeProfCounters+3500(%rip)
	movl	$0, blockSize100k(%rip)
	incl	EdgeProfCounters+3508(%rip)
	jmp	.LBB10_172
.LBB10_170:                             # %if.end312.if.end316_crit_edge
	incl	EdgeProfCounters+3504(%rip)
.LBB10_172:                             # %if.end316
	cmpl	$3, srcMode(%rip)
	jne	.LBB10_173
# BB#174:                               # %if.then319
	incl	EdgeProfCounters+3512(%rip)
	movl	$2, %edi
	movl	$mySignalCatcher, %esi
	callq	signal
	movl	$15, %edi
	movl	$mySignalCatcher, %esi
	callq	signal
	movl	$1, %edi
	movl	$mySignalCatcher, %esi
	callq	signal
	incl	EdgeProfCounters+3520(%rip)
	jmp	.LBB10_175
.LBB10_173:                             # %if.end316.if.end323_crit_edge
	incl	EdgeProfCounters+3516(%rip)
.LBB10_175:                             # %if.end323
	cmpl	$1, opMode(%rip)
	jne	.LBB10_189
# BB#176:                               # %if.then326
	incl	EdgeProfCounters+3524(%rip)
	cmpl	$1, srcMode(%rip)
	jne	.LBB10_178
# BB#177:                               # %if.then329
	incl	EdgeProfCounters+3532(%rip)
	xorl	%edi, %edi
	callq	compress
	incl	EdgeProfCounters+3540(%rip)
	incl	EdgeProfCounters+3600(%rip)
	jmp	.LBB10_226
.LBB10_189:                             # %if.else357
	incl	EdgeProfCounters+3528(%rip)
	cmpl	$2, opMode(%rip)
	jne	.LBB10_206
# BB#190:                               # %if.then360
	incl	EdgeProfCounters+3604(%rip)
	movb	$0, unzFailsExist(%rip)
	cmpl	$1, srcMode(%rip)
	jne	.LBB10_192
# BB#191:                               # %if.then363
	incl	EdgeProfCounters+3612(%rip)
	xorl	%edi, %edi
	callq	uncompress
	incl	EdgeProfCounters+3620(%rip)
	jmp	.LBB10_203
.LBB10_178:                             # %if.else330
	incl	EdgeProfCounters+3536(%rip)
	movb	$1, 15(%rsp)
	movq	24(%rsp), %rax
	movq	%rax, 16(%rsp)
	incl	EdgeProfCounters+3544(%rip)
	jmp	.LBB10_179
	.align	16, 0x90
.LBB10_187:                             # %for.inc353
                                        #   in Loop: Header=BB10_179 Depth=1
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 16(%rsp)
	incl	EdgeProfCounters+3592(%rip)
.LBB10_179:                             # %for.cond331
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$0, 16(%rsp)
	je	.LBB10_188
# BB#180:                               # %for.body334
                                        #   in Loop: Header=BB10_179 Depth=1
	incl	EdgeProfCounters+3548(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str918, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_182
# BB#181:                               # %if.then339
                                        #   in Loop: Header=BB10_179 Depth=1
	incl	EdgeProfCounters+3556(%rip)
	movb	$0, 15(%rsp)
	incl	EdgeProfCounters+3564(%rip)
	jmp	.LBB10_187
	.align	16, 0x90
.LBB10_182:                             # %if.end340
                                        #   in Loop: Header=BB10_179 Depth=1
	incl	EdgeProfCounters+3560(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movsbl	(%rax), %eax
	cmpl	$45, %eax
	jne	.LBB10_183
# BB#184:                               # %land.lhs.true346
                                        #   in Loop: Header=BB10_179 Depth=1
	incl	EdgeProfCounters+3568(%rip)
	cmpb	$0, 15(%rsp)
	je	.LBB10_185
# BB#234:                               # %if.then349
                                        #   in Loop: Header=BB10_179 Depth=1
	incl	EdgeProfCounters+3576(%rip)
	incl	EdgeProfCounters+3584(%rip)
	jmp	.LBB10_187
	.align	16, 0x90
.LBB10_183:                             # %if.end340.if.end350_crit_edge
                                        #   in Loop: Header=BB10_179 Depth=1
	incl	EdgeProfCounters+3572(%rip)
	jmp	.LBB10_186
.LBB10_185:                             # %land.lhs.true346.if.end350_crit_edge
                                        #   in Loop: Header=BB10_179 Depth=1
	incl	EdgeProfCounters+3580(%rip)
.LBB10_186:                             # %if.end350
                                        #   in Loop: Header=BB10_179 Depth=1
	incl	numFilesProcessed(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	callq	compress
	incl	EdgeProfCounters+3588(%rip)
	jmp	.LBB10_187
.LBB10_206:                             # %if.else394
	incl	EdgeProfCounters+3608(%rip)
	movb	$0, testFailsExist(%rip)
	cmpl	$1, srcMode(%rip)
	jne	.LBB10_208
# BB#207:                               # %if.then397
	incl	EdgeProfCounters+3696(%rip)
	xorl	%edi, %edi
	callq	testf
	incl	EdgeProfCounters+3704(%rip)
	jmp	.LBB10_219
.LBB10_188:                             # %for.end355
	incl	EdgeProfCounters+3552(%rip)
	incl	EdgeProfCounters+3596(%rip)
	incl	EdgeProfCounters+3600(%rip)
	jmp	.LBB10_226
.LBB10_192:                             # %if.else364
	incl	EdgeProfCounters+3616(%rip)
	movb	$1, 15(%rsp)
	movq	24(%rsp), %rax
	movq	%rax, 16(%rsp)
	incl	EdgeProfCounters+3624(%rip)
	jmp	.LBB10_193
	.align	16, 0x90
.LBB10_201:                             # %for.inc387
                                        #   in Loop: Header=BB10_193 Depth=1
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 16(%rsp)
	incl	EdgeProfCounters+3672(%rip)
.LBB10_193:                             # %for.cond365
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$0, 16(%rsp)
	je	.LBB10_202
# BB#194:                               # %for.body368
                                        #   in Loop: Header=BB10_193 Depth=1
	incl	EdgeProfCounters+3628(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str918, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_196
# BB#195:                               # %if.then373
                                        #   in Loop: Header=BB10_193 Depth=1
	incl	EdgeProfCounters+3636(%rip)
	movb	$0, 15(%rsp)
	incl	EdgeProfCounters+3644(%rip)
	jmp	.LBB10_201
	.align	16, 0x90
.LBB10_196:                             # %if.end374
                                        #   in Loop: Header=BB10_193 Depth=1
	incl	EdgeProfCounters+3640(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movsbl	(%rax), %eax
	cmpl	$45, %eax
	jne	.LBB10_197
# BB#198:                               # %land.lhs.true380
                                        #   in Loop: Header=BB10_193 Depth=1
	incl	EdgeProfCounters+3648(%rip)
	cmpb	$0, 15(%rsp)
	je	.LBB10_199
# BB#235:                               # %if.then383
                                        #   in Loop: Header=BB10_193 Depth=1
	incl	EdgeProfCounters+3656(%rip)
	incl	EdgeProfCounters+3664(%rip)
	jmp	.LBB10_201
	.align	16, 0x90
.LBB10_197:                             # %if.end374.if.end384_crit_edge
                                        #   in Loop: Header=BB10_193 Depth=1
	incl	EdgeProfCounters+3652(%rip)
	jmp	.LBB10_200
.LBB10_199:                             # %land.lhs.true380.if.end384_crit_edge
                                        #   in Loop: Header=BB10_193 Depth=1
	incl	EdgeProfCounters+3660(%rip)
.LBB10_200:                             # %if.end384
                                        #   in Loop: Header=BB10_193 Depth=1
	incl	numFilesProcessed(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	callq	uncompress
	incl	EdgeProfCounters+3668(%rip)
	jmp	.LBB10_201
.LBB10_208:                             # %if.else398
	incl	EdgeProfCounters+3700(%rip)
	movb	$1, 15(%rsp)
	movq	24(%rsp), %rax
	movq	%rax, 16(%rsp)
	incl	EdgeProfCounters+3708(%rip)
	jmp	.LBB10_209
	.align	16, 0x90
.LBB10_217:                             # %for.inc421
                                        #   in Loop: Header=BB10_209 Depth=1
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 16(%rsp)
	incl	EdgeProfCounters+3756(%rip)
.LBB10_209:                             # %for.cond399
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$0, 16(%rsp)
	je	.LBB10_218
# BB#210:                               # %for.body402
                                        #   in Loop: Header=BB10_209 Depth=1
	incl	EdgeProfCounters+3712(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str918, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_212
# BB#211:                               # %if.then407
                                        #   in Loop: Header=BB10_209 Depth=1
	incl	EdgeProfCounters+3720(%rip)
	movb	$0, 15(%rsp)
	incl	EdgeProfCounters+3728(%rip)
	jmp	.LBB10_217
	.align	16, 0x90
.LBB10_212:                             # %if.end408
                                        #   in Loop: Header=BB10_209 Depth=1
	incl	EdgeProfCounters+3724(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movsbl	(%rax), %eax
	cmpl	$45, %eax
	jne	.LBB10_213
# BB#214:                               # %land.lhs.true414
                                        #   in Loop: Header=BB10_209 Depth=1
	incl	EdgeProfCounters+3732(%rip)
	cmpb	$0, 15(%rsp)
	je	.LBB10_215
# BB#236:                               # %if.then417
                                        #   in Loop: Header=BB10_209 Depth=1
	incl	EdgeProfCounters+3740(%rip)
	incl	EdgeProfCounters+3748(%rip)
	jmp	.LBB10_217
	.align	16, 0x90
.LBB10_213:                             # %if.end408.if.end418_crit_edge
                                        #   in Loop: Header=BB10_209 Depth=1
	incl	EdgeProfCounters+3736(%rip)
	jmp	.LBB10_216
.LBB10_215:                             # %land.lhs.true414.if.end418_crit_edge
                                        #   in Loop: Header=BB10_209 Depth=1
	incl	EdgeProfCounters+3744(%rip)
.LBB10_216:                             # %if.end418
                                        #   in Loop: Header=BB10_209 Depth=1
	incl	numFilesProcessed(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	callq	testf
	incl	EdgeProfCounters+3752(%rip)
	jmp	.LBB10_217
.LBB10_202:                             # %for.end389
	incl	EdgeProfCounters+3632(%rip)
	incl	EdgeProfCounters+3676(%rip)
.LBB10_203:                             # %if.end390
	cmpb	$0, unzFailsExist(%rip)
	je	.LBB10_204
# BB#205:                               # %if.then392
	incl	EdgeProfCounters+3680(%rip)
	movl	$2, %edi
	callq	setExit
	movl	exitValue(%rip), %edi
	callq	exit
	incl	EdgeProfCounters+3688(%rip)
	incl	EdgeProfCounters+3692(%rip)
	jmp	.LBB10_225
.LBB10_218:                             # %for.end423
	incl	EdgeProfCounters+3716(%rip)
	incl	EdgeProfCounters+3760(%rip)
.LBB10_219:                             # %if.end424
	cmpb	$0, testFailsExist(%rip)
	je	.LBB10_220
# BB#221:                               # %land.lhs.true427
	incl	EdgeProfCounters+3764(%rip)
	cmpb	$0, noisy(%rip)
	je	.LBB10_222
# BB#223:                               # %if.then430
	incl	EdgeProfCounters+3772(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str35, %esi
	xorb	%al, %al
	callq	fprintf
	movl	$2, %edi
	callq	setExit
	movl	exitValue(%rip), %edi
	callq	exit
	incl	EdgeProfCounters+3780(%rip)
	jmp	.LBB10_224
.LBB10_204:                             # %if.end390.if.end393_crit_edge
	incl	EdgeProfCounters+3684(%rip)
	incl	EdgeProfCounters+3692(%rip)
	jmp	.LBB10_225
.LBB10_220:                             # %if.end424.if.end432_crit_edge
	incl	EdgeProfCounters+3768(%rip)
	jmp	.LBB10_224
.LBB10_222:                             # %land.lhs.true427.if.end432_crit_edge
	incl	EdgeProfCounters+3776(%rip)
.LBB10_224:                             # %if.end432
	incl	EdgeProfCounters+3784(%rip)
.LBB10_225:                             # %if.end433
	incl	EdgeProfCounters+3788(%rip)
.LBB10_226:                             # %if.end434
	movq	24(%rsp), %rax
	movq	%rax, 16(%rsp)
	incl	EdgeProfCounters+3792(%rip)
	jmp	.LBB10_227
	.align	16, 0x90
.LBB10_231:                             # %if.end444
                                        #   in Loop: Header=BB10_227 Depth=1
	movq	16(%rsp), %rdi
	callq	free
	movq	(%rsp), %rax
	movq	%rax, 16(%rsp)
	incl	EdgeProfCounters+3816(%rip)
.LBB10_227:                             # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$0, 16(%rsp)
	je	.LBB10_232
# BB#228:                               # %while.body
                                        #   in Loop: Header=BB10_227 Depth=1
	incl	EdgeProfCounters+3796(%rip)
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, (%rsp)
	movq	16(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB10_229
# BB#230:                               # %if.then442
                                        #   in Loop: Header=BB10_227 Depth=1
	incl	EdgeProfCounters+3804(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	callq	free
	incl	EdgeProfCounters+3812(%rip)
	jmp	.LBB10_231
	.align	16, 0x90
.LBB10_229:                             # %while.body.if.end444_crit_edge
                                        #   in Loop: Header=BB10_227 Depth=1
	incl	EdgeProfCounters+3808(%rip)
	jmp	.LBB10_231
.LBB10_232:                             # %while.end
	incl	EdgeProfCounters+3800(%rip)
	movl	exitValue(%rip), %eax
	addq	$64, %rsp
	popq	%rbx
	ret
.LBB10_38:                              # %lor.lhs.false70.if.end77_crit_edge
	incl	EdgeProfCounters+2852(%rip)
	jmp	.LBB10_43
.Ltmp38:
	.size	main, .Ltmp38-main
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI10_0:
	.quad	.LBB10_71
	.quad	.LBB10_72
	.quad	.LBB10_90
	.quad	.LBB10_74
	.quad	.LBB10_90
	.quad	.LBB10_89
	.quad	.LBB10_90
	.quad	.LBB10_90
	.quad	.LBB10_76
	.quad	.LBB10_90
	.quad	.LBB10_90
	.quad	.LBB10_90
	.quad	.LBB10_90
	.quad	.LBB10_90
	.quad	.LBB10_78
	.quad	.LBB10_90
	.quad	.LBB10_77
	.quad	.LBB10_75
	.quad	.LBB10_90
	.quad	.LBB10_88
	.quad	.LBB10_90
	.quad	.LBB10_90
	.quad	.LBB10_90
	.quad	.LBB10_73
.LJTI10_1:
	.quad	.LBB10_79
	.quad	.LBB10_80
	.quad	.LBB10_81
	.quad	.LBB10_82
	.quad	.LBB10_83
	.quad	.LBB10_84
	.quad	.LBB10_85
	.quad	.LBB10_86
	.quad	.LBB10_87

	.text
	.align	16, 0x90
	.type	mySIGSEGVorSIGBUScatcher,@function
mySIGSEGVorSIGBUScatcher:               # @mySIGSEGVorSIGBUScatcher
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp40:
	.cfi_def_cfa_offset 16
	incl	EdgeProfCounters+3820(%rip)
	movl	%edi, 4(%rsp)
	cmpl	$1, opMode(%rip)
	jne	.LBB11_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+3824(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str106, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+3832(%rip)
	jmp	.LBB11_3
.LBB11_2:                               # %if.else
	incl	EdgeProfCounters+3828(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str107, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+3836(%rip)
.LBB11_3:                               # %if.end
	callq	showFileNames
	cmpl	$1, opMode(%rip)
	jne	.LBB11_5
# BB#4:                                 # %if.then3
	incl	EdgeProfCounters+3840(%rip)
	movl	$3, %edi
	callq	cleanUpAndFail
	incl	EdgeProfCounters+3848(%rip)
	popq	%rax
	ret
.LBB11_5:                               # %if.else4
	incl	EdgeProfCounters+3844(%rip)
	callq	cadvise
	movl	$2, %edi
	callq	cleanUpAndFail
	incl	EdgeProfCounters+3852(%rip)
	popq	%rax
	ret
.Ltmp41:
	.size	mySIGSEGVorSIGBUScatcher, .Ltmp41-mySIGSEGVorSIGBUScatcher
	.cfi_endproc

	.align	16, 0x90
	.type	copyFileName,@function
copyFileName:                           # @copyFileName
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp43:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+3856(%rip)
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rsi, %rdi
	callq	strlen
	cmpq	$1024, %rax             # imm = 0x400
	jbe	.LBB12_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+3860(%rip)
	movq	8(%rsp), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str105, %esi
	movl	$1024, %ecx             # imm = 0x400
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	setExit
	movl	exitValue(%rip), %edi
	callq	exit
	incl	EdgeProfCounters+3868(%rip)
	jmp	.LBB12_3
.LBB12_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+3864(%rip)
.LBB12_3:                               # %if.end
	movq	8(%rsp), %rsi
	movq	16(%rsp), %rdi
	movl	$1024, %edx             # imm = 0x400
	callq	strncpy
	movq	16(%rsp), %rax
	movb	$0, 1024(%rax)
	addq	$24, %rsp
	ret
.Ltmp44:
	.size	copyFileName, .Ltmp44-copyFileName
	.cfi_endproc

	.align	16, 0x90
	.type	addFlagsFromEnvVar,@function
addFlagsFromEnvVar:                     # @addFlagsFromEnvVar
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp47:
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
.Ltmp48:
	.cfi_def_cfa_offset 64
.Ltmp49:
	.cfi_offset %rbx, -16
	incl	EdgeProfCounters+3872(%rip)
	movq	%rdi, 40(%rsp)
	movq	%rsi, 32(%rsp)
	movq	%rsi, %rdi
	callq	getenv
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.LBB13_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+3876(%rip)
	movq	8(%rsp), %rax
	movq	%rax, (%rsp)
	movl	$0, 28(%rsp)
	incl	EdgeProfCounters+3884(%rip)
	jmp	.LBB13_3
	.align	16, 0x90
.LBB13_14:                              # %while.end28.if.end46_crit_edge
                                        #   in Loop: Header=BB13_3 Depth=1
	incl	EdgeProfCounters+3948(%rip)
	incl	EdgeProfCounters+3988(%rip)
.LBB13_3:                               # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB13_5 Depth 2
                                        #     Child Loop BB13_8 Depth 2
                                        #     Child Loop BB13_19 Depth 2
	movslq	28(%rsp), %rax
	movq	(%rsp), %rcx
	movsbl	(%rcx,%rax), %eax
	testl	%eax, %eax
	je	.LBB13_22
# BB#4:                                 # %if.end
                                        #   in Loop: Header=BB13_3 Depth=1
	incl	EdgeProfCounters+3892(%rip)
	movslq	28(%rsp), %rax
	addq	%rax, (%rsp)
	movl	$0, 28(%rsp)
	incl	EdgeProfCounters+3900(%rip)
	jmp	.LBB13_5
	.align	16, 0x90
.LBB13_6:                               # %while.body11
                                        #   in Loop: Header=BB13_5 Depth=2
	incl	EdgeProfCounters+3904(%rip)
	incq	(%rsp)
	incl	EdgeProfCounters+3912(%rip)
.LBB13_5:                               # %while.cond4
                                        #   Parent Loop BB13_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rsp), %rax
	movsbq	(%rax), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	testb	$32, 1(%rax,%rbx,2)
	jne	.LBB13_6
# BB#7:                                 # %while.end
                                        #   in Loop: Header=BB13_3 Depth=1
	incl	EdgeProfCounters+3908(%rip)
	incl	EdgeProfCounters+3916(%rip)
	jmp	.LBB13_8
	.align	16, 0x90
.LBB13_12:                              # %while.body27
                                        #   in Loop: Header=BB13_8 Depth=2
	incl	EdgeProfCounters+3932(%rip)
	incl	28(%rsp)
	incl	EdgeProfCounters+3940(%rip)
.LBB13_8:                               # %while.cond12
                                        #   Parent Loop BB13_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	28(%rsp), %rax
	movq	(%rsp), %rcx
	movsbl	(%rcx,%rax), %eax
	testl	%eax, %eax
	je	.LBB13_9
# BB#10:                                # %land.rhs
                                        #   in Loop: Header=BB13_8 Depth=2
	incl	EdgeProfCounters+3920(%rip)
	movslq	28(%rsp), %rax
	movq	(%rsp), %rcx
	movsbq	(%rcx,%rax), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movzwl	(%rax,%rbx,2), %eax
	testb	$32, %ah
	sete	%al
	incl	EdgeProfCounters+3928(%rip)
	jmp	.LBB13_11
	.align	16, 0x90
.LBB13_9:                               # %while.cond12.land.end_crit_edge
                                        #   in Loop: Header=BB13_8 Depth=2
	incl	EdgeProfCounters+3924(%rip)
	xorb	%al, %al
.LBB13_11:                              # %land.end
                                        #   in Loop: Header=BB13_8 Depth=2
	cmpb	$1, %al
	je	.LBB13_12
# BB#13:                                # %while.end28
                                        #   in Loop: Header=BB13_3 Depth=1
	incl	EdgeProfCounters+3936(%rip)
	cmpl	$0, 28(%rsp)
	jle	.LBB13_14
# BB#15:                                # %if.then31
                                        #   in Loop: Header=BB13_3 Depth=1
	incl	EdgeProfCounters+3944(%rip)
	movl	28(%rsp), %eax
	movl	%eax, 20(%rsp)
	cmpl	$1024, %eax             # imm = 0x400
	jle	.LBB13_16
# BB#17:                                # %if.then34
                                        #   in Loop: Header=BB13_3 Depth=1
	incl	EdgeProfCounters+3952(%rip)
	movl	$1024, 20(%rsp)         # imm = 0x400
	incl	EdgeProfCounters+3960(%rip)
	jmp	.LBB13_18
	.align	16, 0x90
.LBB13_16:                              # %if.then31.if.end35_crit_edge
                                        #   in Loop: Header=BB13_3 Depth=1
	incl	EdgeProfCounters+3956(%rip)
.LBB13_18:                              # %if.end35
                                        #   in Loop: Header=BB13_3 Depth=1
	movl	$0, 24(%rsp)
	incl	EdgeProfCounters+3964(%rip)
	jmp	.LBB13_19
	.align	16, 0x90
.LBB13_20:                              # %for.inc
                                        #   in Loop: Header=BB13_19 Depth=2
	incl	EdgeProfCounters+3968(%rip)
	movslq	24(%rsp), %rax
	movq	(%rsp), %rcx
	movb	(%rcx,%rax), %cl
	movb	%cl, tmpName(%rax)
	incl	EdgeProfCounters+3976(%rip)
	incl	24(%rsp)
	incl	EdgeProfCounters+3980(%rip)
.LBB13_19:                              # %for.cond
                                        #   Parent Loop BB13_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	24(%rsp), %eax
	cmpl	20(%rsp), %eax
	jl	.LBB13_20
# BB#21:                                # %for.end
                                        #   in Loop: Header=BB13_3 Depth=1
	incl	EdgeProfCounters+3972(%rip)
	movslq	20(%rsp), %rax
	movb	$0, tmpName(%rax)
	movq	40(%rsp), %rax
	movq	(%rax), %rdi
	movl	$tmpName, %esi
	callq	snocString
	movq	40(%rsp), %rcx
	movq	%rax, (%rcx)
	incl	EdgeProfCounters+3984(%rip)
	incl	EdgeProfCounters+3988(%rip)
	jmp	.LBB13_3
.LBB13_22:                              # %while.end47
	incl	EdgeProfCounters+3888(%rip)
	incl	EdgeProfCounters+3896(%rip)
	incl	EdgeProfCounters+3992(%rip)
	jmp	.LBB13_23
.LBB13_1:                               # %entry.if.end48_crit_edge
	incl	EdgeProfCounters+3880(%rip)
.LBB13_23:                              # %if.end48
	addq	$48, %rsp
	popq	%rbx
	ret
.Ltmp50:
	.size	addFlagsFromEnvVar, .Ltmp50-addFlagsFromEnvVar
	.cfi_endproc

	.align	16, 0x90
	.type	snocString,@function
snocString:                             # @snocString
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp52:
	.cfi_def_cfa_offset 48
	incl	EdgeProfCounters+3996(%rip)
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	cmpq	$0, 24(%rsp)
	je	.LBB14_1
# BB#2:                                 # %if.else
	incl	EdgeProfCounters+4004(%rip)
	movq	24(%rsp), %rax
	movq	%rax, (%rsp)
	incl	EdgeProfCounters+4012(%rip)
	jmp	.LBB14_3
	.align	16, 0x90
.LBB14_4:                               # %while.body
                                        #   in Loop: Header=BB14_3 Depth=1
	incl	EdgeProfCounters+4016(%rip)
	movq	(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, (%rsp)
	incl	EdgeProfCounters+4024(%rip)
.LBB14_3:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rsp), %rax
	cmpq	$0, 8(%rax)
	jne	.LBB14_4
# BB#5:                                 # %while.end
	incl	EdgeProfCounters+4020(%rip)
	movq	(%rsp), %rax
	movq	8(%rax), %rdi
	movq	16(%rsp), %rsi
	callq	snocString
	movq	(%rsp), %rcx
	movq	%rax, 8(%rcx)
	movq	24(%rsp), %rax
	movq	%rax, 32(%rsp)
	incl	EdgeProfCounters+4028(%rip)
	jmp	.LBB14_6
.LBB14_1:                               # %if.then
	incl	EdgeProfCounters+4000(%rip)
	callq	mkCell
	movq	%rax, 8(%rsp)
	movq	16(%rsp), %rdi
	callq	strlen
	leal	5(%rax), %edi
	callq	myMalloc
	movq	8(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	8(%rsp), %rax
	movq	(%rax), %rdi
	movq	16(%rsp), %rsi
	callq	strcpy
	movq	8(%rsp), %rax
	movq	%rax, 32(%rsp)
	incl	EdgeProfCounters+4008(%rip)
.LBB14_6:                               # %return
	movq	32(%rsp), %rax
	addq	$40, %rsp
	ret
.Ltmp53:
	.size	snocString, .Ltmp53-snocString
	.cfi_endproc

	.align	16, 0x90
	.type	license,@function
license:                                # @license
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp56:
	.cfi_def_cfa_offset 16
.Ltmp57:
	.cfi_offset %rbx, -16
	incl	EdgeProfCounters+4032(%rip)
	movq	stderr(%rip), %rbx
	callq	BZ2_bzlibVersion
	movq	%rbx, %rdi
	movl	$.L.str104, %esi
	movq	%rax, %rdx
	xorb	%al, %al
	callq	fprintf
	popq	%rbx
	ret
.Ltmp58:
	.size	license, .Ltmp58-license
	.cfi_endproc

	.align	16, 0x90
	.type	usage,@function
usage:                                  # @usage
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp61:
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
.Ltmp62:
	.cfi_def_cfa_offset 32
.Ltmp63:
	.cfi_offset %rbx, -16
	incl	EdgeProfCounters+4036(%rip)
	movq	%rdi, 8(%rsp)
	movq	stderr(%rip), %rbx
	callq	BZ2_bzlibVersion
	movq	8(%rsp), %rcx
	movq	%rbx, %rdi
	movl	$.L.str103, %esi
	movq	%rax, %rdx
	xorb	%al, %al
	callq	fprintf
	addq	$16, %rsp
	popq	%rbx
	ret
.Ltmp64:
	.size	usage, .Ltmp64-usage
	.cfi_endproc

	.align	16, 0x90
	.type	redundant,@function
redundant:                              # @redundant
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp66:
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
	incl	EdgeProfCounters+4040(%rip)
	movq	%rax, (%rsp)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str102, %esi
	movq	%rax, %rcx
	xorb	%al, %al
	callq	fprintf
	popq	%rax
	ret
.Ltmp67:
	.size	redundant, .Ltmp67-redundant
	.cfi_endproc

	.align	16, 0x90
	.type	mySignalCatcher,@function
mySignalCatcher:                        # @mySignalCatcher
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp69:
	.cfi_def_cfa_offset 16
	incl	EdgeProfCounters+4044(%rip)
	movl	%edi, 4(%rsp)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str101, %esi
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	cleanUpAndFail
	popq	%rax
	ret
.Ltmp70:
	.size	mySignalCatcher, .Ltmp70-mySignalCatcher
	.cfi_endproc

	.align	16, 0x90
	.type	compress,@function
compress:                               # @compress
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp74:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp75:
	.cfi_def_cfa_offset 24
	subq	$184, %rsp
.Ltmp76:
	.cfi_def_cfa_offset 208
.Ltmp77:
	.cfi_offset %rbx, -24
.Ltmp78:
	.cfi_offset %r14, -16
	incl	EdgeProfCounters+4048(%rip)
	movq	%rdi, 176(%rsp)
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpq	$0, 176(%rsp)
	je	.LBB19_2
# BB#1:                                 # %entry.if.end_crit_edge
	incl	EdgeProfCounters+4056(%rip)
	jmp	.LBB19_5
.LBB19_2:                               # %land.lhs.true
	incl	EdgeProfCounters+4052(%rip)
	cmpl	$1, srcMode(%rip)
	je	.LBB19_3
# BB#4:                                 # %if.then
	incl	EdgeProfCounters+4060(%rip)
	movl	$.L.str92, %edi
	callq	panic
	incl	EdgeProfCounters+4068(%rip)
	jmp	.LBB19_5
.LBB19_3:                               # %land.lhs.true.if.end_crit_edge
	incl	EdgeProfCounters+4064(%rip)
.LBB19_5:                               # %if.end
	movl	srcMode(%rip), %eax
	cmpl	$1, %eax
	je	.LBB19_9
# BB#6:                                 # %if.end
	cmpl	$2, %eax
	jne	.LBB19_7
# BB#11:                                # %sw.bb3
	incl	EdgeProfCounters+4084(%rip)
	movq	176(%rsp), %rsi
	movl	$inName, %edi
	callq	copyFileName
	movl	$outName, %edi
	movl	$.L.str71, %esi
	callq	copyFileName
	incl	EdgeProfCounters+4096(%rip)
	jmp	.LBB19_12
.LBB19_9:                               # %sw.bb
	incl	EdgeProfCounters+4076(%rip)
	movl	$inName, %edi
	movl	$.L.str37, %esi
	callq	copyFileName
	movl	$outName, %edi
	movl	$.L.str71, %esi
	callq	copyFileName
	incl	EdgeProfCounters+4088(%rip)
	jmp	.LBB19_12
.LBB19_7:                               # %if.end
	cmpl	$3, %eax
	jne	.LBB19_8
# BB#10:                                # %sw.bb2
	incl	EdgeProfCounters+4080(%rip)
	movq	176(%rsp), %rsi
	movl	$inName, %edi
	callq	copyFileName
	movq	176(%rsp), %rsi
	movl	$outName, %edi
	callq	copyFileName
	movl	$outName, %edi
	movl	$.L.str9, %esi
	callq	strcat
	incl	EdgeProfCounters+4092(%rip)
	jmp	.LBB19_12
.LBB19_8:                               # %if.end.sw.epilog_crit_edge
	incl	EdgeProfCounters+4072(%rip)
.LBB19_12:                              # %sw.epilog
	cmpl	$1, srcMode(%rip)
	je	.LBB19_13
# BB#16:                                # %land.lhs.true5
	incl	EdgeProfCounters+4100(%rip)
	movl	$inName, %edi
	callq	containsDubiousChars
	testb	%al, %al
	je	.LBB19_17
# BB#18:                                # %if.then7
	incl	EdgeProfCounters+4108(%rip)
	cmpb	$0, noisy(%rip)
	je	.LBB19_19
# BB#20:                                # %if.then9
	incl	EdgeProfCounters+4116(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str38, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+4124(%rip)
	jmp	.LBB19_21
.LBB19_13:                              # %sw.epilog.if.end12_crit_edge
	incl	EdgeProfCounters+4104(%rip)
	jmp	.LBB19_14
.LBB19_17:                              # %land.lhs.true5.if.end12_crit_edge
	incl	EdgeProfCounters+4112(%rip)
.LBB19_14:                              # %if.end12
	cmpl	$1, srcMode(%rip)
	je	.LBB19_15
# BB#22:                                # %land.lhs.true15
	incl	EdgeProfCounters+4132(%rip)
	movl	$inName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB19_109
# BB#23:                                # %land.lhs.true15.if.end22_crit_edge
	incl	EdgeProfCounters+4140(%rip)
	jmp	.LBB19_24
.LBB19_15:                              # %if.end12.if.end22_crit_edge
	incl	EdgeProfCounters+4136(%rip)
.LBB19_24:                              # %if.end22
	movl	$0, 152(%rsp)
	incl	EdgeProfCounters+4152(%rip)
	jmp	.LBB19_25
	.align	16, 0x90
.LBB19_31:                              # %for.inc
                                        #   in Loop: Header=BB19_25 Depth=1
	incl	EdgeProfCounters+4168(%rip)
	incl	EdgeProfCounters+4188(%rip)
	incl	152(%rsp)
	incl	EdgeProfCounters+4192(%rip)
.LBB19_25:                              # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$3, 152(%rsp)
	jg	.LBB19_32
# BB#26:                                # %for.body
                                        #   in Loop: Header=BB19_25 Depth=1
	incl	EdgeProfCounters+4156(%rip)
	movslq	152(%rsp), %rax
	movq	zSuffix(,%rax,8), %rsi
	movl	$inName, %edi
	callq	hasSuffix
	testb	%al, %al
	je	.LBB19_31
# BB#27:                                # %if.then27
	incl	EdgeProfCounters+4164(%rip)
	cmpb	$0, noisy(%rip)
	je	.LBB19_28
# BB#29:                                # %if.then29
	incl	EdgeProfCounters+4172(%rip)
	movslq	152(%rsp), %rax
	movq	zSuffix(,%rax,8), %r8
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str93, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+4180(%rip)
	jmp	.LBB19_30
.LBB19_32:                              # %for.end
	incl	EdgeProfCounters+4160(%rip)
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_34
# BB#33:                                # %for.end.if.then39_crit_edge
	incl	EdgeProfCounters+4196(%rip)
	jmp	.LBB19_37
.LBB19_34:                              # %lor.lhs.false
	incl	EdgeProfCounters+4200(%rip)
	cmpl	$2, srcMode(%rip)
	jne	.LBB19_35
# BB#36:                                # %lor.lhs.false.if.then39_crit_edge
	incl	EdgeProfCounters+4204(%rip)
.LBB19_37:                              # %if.then39
	leaq	8(%rsp), %rsi
	movl	$inName, %edi
	callq	stat
	movl	$61440, %eax            # imm = 0xF000
	andl	32(%rsp), %eax
	cmpl	$16384, %eax            # imm = 0x4000
	jne	.LBB19_39
# BB#38:                                # %if.then43
	incl	EdgeProfCounters+4212(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str40, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4220(%rip)
	jmp	.LBB19_108
.LBB19_109:                             # %if.then18
	incl	EdgeProfCounters+4144(%rip)
	movq	progName(%rip), %r14
	movq	stderr(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movq	%rbx, %rdi
	movl	$.L.str73, %esi
	movq	%r14, %rdx
	movl	$inName, %ecx
	movq	%rax, %r8
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4148(%rip)
	jmp	.LBB19_108
.LBB19_19:                              # %if.then7.if.end11_crit_edge
	incl	EdgeProfCounters+4120(%rip)
.LBB19_21:                              # %if.end11
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4128(%rip)
	jmp	.LBB19_108
.LBB19_39:                              # %if.end45
	incl	EdgeProfCounters+4216(%rip)
	incl	EdgeProfCounters+4224(%rip)
	jmp	.LBB19_40
.LBB19_28:                              # %if.then27.if.end33_crit_edge
	incl	EdgeProfCounters+4176(%rip)
.LBB19_30:                              # %if.end33
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4184(%rip)
.LBB19_108:                             # %return
	addq	$184, %rsp
	popq	%rbx
	popq	%r14
	ret
.LBB19_35:                              # %lor.lhs.false.if.end46_crit_edge
	incl	EdgeProfCounters+4208(%rip)
.LBB19_40:                              # %if.end46
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_41
# BB#44:                                # %land.lhs.true49
	incl	EdgeProfCounters+4228(%rip)
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB19_46
# BB#45:                                # %land.lhs.true49.if.end60_crit_edge
	incl	EdgeProfCounters+4236(%rip)
	jmp	.LBB19_42
.LBB19_41:                              # %if.end46.if.end60_crit_edge
	incl	EdgeProfCounters+4232(%rip)
.LBB19_42:                              # %if.end60
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_43
# BB#52:                                # %land.lhs.true63
	incl	EdgeProfCounters+4268(%rip)
	movl	$outName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB19_53
# BB#54:                                # %if.then67
	incl	EdgeProfCounters+4276(%rip)
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB19_55
# BB#56:                                # %if.end72
	incl	EdgeProfCounters+4284(%rip)
	movl	$outName, %edi
	callq	remove
	incl	EdgeProfCounters+4292(%rip)
	incl	EdgeProfCounters+4300(%rip)
	jmp	.LBB19_57
.LBB19_43:                              # %if.end60.if.end73_crit_edge
	incl	EdgeProfCounters+4272(%rip)
	jmp	.LBB19_57
.LBB19_46:                              # %land.lhs.true51
	incl	EdgeProfCounters+4240(%rip)
	movl	$inName, %edi
	callq	notAStandardFile
	testb	%al, %al
	je	.LBB19_47
# BB#48:                                # %if.then55
	incl	EdgeProfCounters+4244(%rip)
	cmpb	$0, noisy(%rip)
	je	.LBB19_49
# BB#50:                                # %if.then57
	incl	EdgeProfCounters+4252(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str74, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+4260(%rip)
	jmp	.LBB19_51
.LBB19_53:                              # %land.lhs.true63.if.end73_crit_edge
	incl	EdgeProfCounters+4280(%rip)
.LBB19_57:                              # %if.end73
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_58
# BB#61:                                # %land.lhs.true76
	incl	EdgeProfCounters+4304(%rip)
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB19_63
# BB#62:                                # %land.lhs.true76.if.end86_crit_edge
	incl	EdgeProfCounters+4312(%rip)
	jmp	.LBB19_59
.LBB19_58:                              # %if.end73.if.end86_crit_edge
	incl	EdgeProfCounters+4308(%rip)
.LBB19_59:                              # %if.end86
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_60
# BB#68:                                # %if.then89
	incl	EdgeProfCounters+4332(%rip)
	movl	$inName, %edi
	callq	saveInputFileMetaInfo
	incl	EdgeProfCounters+4340(%rip)
	jmp	.LBB19_69
.LBB19_60:                              # %if.end86.if.end90_crit_edge
	incl	EdgeProfCounters+4336(%rip)
.LBB19_69:                              # %if.end90
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	je	.LBB19_83
# BB#70:                                # %if.end90
	cmpl	$2, %eax
	jne	.LBB19_71
# BB#75:                                # %sw.bb99
	incl	EdgeProfCounters+4352(%rip)
	movl	$inName, %edi
	movl	$.L.str43, %esi
	callq	fopen
	movq	%rax, 168(%rsp)
	movq	stdout(%rip), %rax
	movq	%rax, 160(%rsp)
	movq	stdout(%rip), %rdi
	callq	fileno
	movl	%eax, %edi
	callq	isatty
	testl	%eax, %eax
	je	.LBB19_80
# BB#76:                                # %if.then104
	incl	EdgeProfCounters+4376(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str94, %esi
	xorb	%al, %al
	callq	fprintf
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str42, %esi
	movq	%rdx, %rcx
	xorb	%al, %al
	callq	fprintf
	cmpq	$0, 168(%rsp)
	je	.LBB19_77
# BB#78:                                # %if.then109
	incl	EdgeProfCounters+4384(%rip)
	movq	168(%rsp), %rdi
	callq	fclose
	incl	EdgeProfCounters+4392(%rip)
	jmp	.LBB19_79
.LBB19_83:                              # %sw.bb120
	incl	EdgeProfCounters+4356(%rip)
	movl	$inName, %edi
	movl	$.L.str43, %esi
	callq	fopen
	movq	%rax, 168(%rsp)
	movl	$outName, %edi
	movl	$.L.str79, %esi
	callq	fopen_output_safely
	movq	%rax, 160(%rsp)
	testq	%rax, %rax
	je	.LBB19_84
# BB#88:                                # %if.end134
	incl	EdgeProfCounters+4420(%rip)
	cmpq	$0, 168(%rsp)
	je	.LBB19_89
# BB#93:                                # %if.end146
	incl	EdgeProfCounters+4444(%rip)
	incl	EdgeProfCounters+4464(%rip)
	jmp	.LBB19_95
.LBB19_71:                              # %if.end90
	cmpl	$1, %eax
	jne	.LBB19_94
# BB#72:                                # %sw.bb91
	incl	EdgeProfCounters+4348(%rip)
	movq	stdin(%rip), %rax
	movq	%rax, 168(%rsp)
	movq	stdout(%rip), %rax
	movq	%rax, 160(%rsp)
	movq	stdout(%rip), %rdi
	callq	fileno
	movl	%eax, %edi
	callq	isatty
	testl	%eax, %eax
	je	.LBB19_74
# BB#73:                                # %if.then95
	incl	EdgeProfCounters+4360(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str94, %esi
	xorb	%al, %al
	callq	fprintf
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str42, %esi
	movq	%rdx, %rcx
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4368(%rip)
	jmp	.LBB19_108
.LBB19_63:                              # %land.lhs.true78
	incl	EdgeProfCounters+4316(%rip)
	movl	$inName, %edi
	callq	countHardLinks
	movl	%eax, 156(%rsp)
	testl	%eax, %eax
	jle	.LBB19_64
# BB#65:                                # %if.then82
	incl	EdgeProfCounters+4320(%rip)
	movl	$.L.str78, %r9d
	movl	156(%rsp), %r8d
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	cmpl	$1, %r8d
	jg	.LBB19_67
# BB#66:                                # %select.mid
	movl	$.L.str413, %r9d
.LBB19_67:                              # %select.end
	movl	$.L.str77, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4328(%rip)
	jmp	.LBB19_108
.LBB19_94:                              # %sw.default
	incl	EdgeProfCounters+4344(%rip)
	movl	$.L.str95, %edi
	callq	panic
	incl	EdgeProfCounters+4468(%rip)
	jmp	.LBB19_95
.LBB19_55:                              # %if.else
	incl	EdgeProfCounters+4288(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str76, %esi
	movl	$outName, %ecx
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4296(%rip)
	jmp	.LBB19_108
.LBB19_80:                              # %if.end112
	incl	EdgeProfCounters+4380(%rip)
	cmpq	$0, 168(%rsp)
	je	.LBB19_81
# BB#82:                                # %if.end119
	incl	EdgeProfCounters+4404(%rip)
	incl	EdgeProfCounters+4412(%rip)
	jmp	.LBB19_95
.LBB19_84:                              # %if.then125
	incl	EdgeProfCounters+4416(%rip)
	movq	progName(%rip), %r14
	movq	stderr(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movq	%rbx, %rdi
	movl	$.L.str80, %esi
	movq	%r14, %rdx
	movl	$outName, %ecx
	movq	%rax, %r8
	xorb	%al, %al
	callq	fprintf
	cmpq	$0, 168(%rsp)
	je	.LBB19_85
# BB#86:                                # %if.then131
	incl	EdgeProfCounters+4424(%rip)
	movq	168(%rsp), %rdi
	callq	fclose
	incl	EdgeProfCounters+4432(%rip)
	jmp	.LBB19_87
.LBB19_47:                              # %land.lhs.true51.if.end60_crit_edge
	incl	EdgeProfCounters+4248(%rip)
	jmp	.LBB19_42
.LBB19_77:                              # %if.then104.if.end111_crit_edge
	incl	EdgeProfCounters+4388(%rip)
.LBB19_79:                              # %if.end111
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4396(%rip)
	jmp	.LBB19_108
.LBB19_89:                              # %if.then137
	incl	EdgeProfCounters+4440(%rip)
	movq	progName(%rip), %r14
	movq	stderr(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movq	%rbx, %rdi
	movl	$.L.str73, %esi
	movq	%r14, %rdx
	movl	$inName, %ecx
	movq	%rax, %r8
	xorb	%al, %al
	callq	fprintf
	cmpq	$0, 160(%rsp)
	je	.LBB19_90
# BB#91:                                # %if.then143
	incl	EdgeProfCounters+4448(%rip)
	movq	160(%rsp), %rdi
	callq	fclose
	incl	EdgeProfCounters+4456(%rip)
	jmp	.LBB19_92
.LBB19_64:                              # %land.lhs.true78.if.end86_crit_edge
	incl	EdgeProfCounters+4324(%rip)
	jmp	.LBB19_59
.LBB19_49:                              # %if.then55.if.end59_crit_edge
	incl	EdgeProfCounters+4256(%rip)
.LBB19_51:                              # %if.end59
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4264(%rip)
	jmp	.LBB19_108
.LBB19_74:                              # %if.end98
	incl	EdgeProfCounters+4364(%rip)
	incl	EdgeProfCounters+4372(%rip)
.LBB19_95:                              # %sw.epilog147
	cmpl	$0, verbosity(%rip)
	jle	.LBB19_96
# BB#97:                                # %if.then150
	incl	EdgeProfCounters+4472(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str46, %esi
	movl	$inName, %edx
	xorb	%al, %al
	callq	fprintf
	movl	$inName, %edi
	callq	pad
	movq	stderr(%rip), %rdi
	callq	fflush
	incl	EdgeProfCounters+4480(%rip)
	jmp	.LBB19_98
.LBB19_96:                              # %sw.epilog147.if.end153_crit_edge
	incl	EdgeProfCounters+4476(%rip)
.LBB19_98:                              # %if.end153
	movq	160(%rsp), %rax
	movq	%rax, outputHandleJustInCase(%rip)
	movb	$1, deleteOutputOnInterrupt(%rip)
	movq	160(%rsp), %rsi
	movq	168(%rsp), %rdi
	callq	compressStream
	movq	$0, outputHandleJustInCase(%rip)
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_99
# BB#100:                               # %if.then156
	incl	EdgeProfCounters+4484(%rip)
	movl	$outName, %edi
	callq	applySavedMetaInfoToOutputFile
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpb	$0, keepInputFiles(%rip)
	je	.LBB19_102
# BB#101:                               # %if.then156.if.end164_crit_edge
	incl	EdgeProfCounters+4492(%rip)
	jmp	.LBB19_106
.LBB19_99:                              # %if.end153.if.end165_crit_edge
	incl	EdgeProfCounters+4488(%rip)
	jmp	.LBB19_107
.LBB19_102:                             # %if.then158
	incl	EdgeProfCounters+4496(%rip)
	movl	$inName, %edi
	callq	remove
	movl	%eax, 4(%rsp)
	testl	%eax, %eax
	je	.LBB19_103
# BB#104:                               # %if.then162
	incl	EdgeProfCounters+4500(%rip)
	callq	ioError
	incl	EdgeProfCounters+4508(%rip)
	jmp	.LBB19_105
.LBB19_81:                              # %if.then115
	incl	EdgeProfCounters+4400(%rip)
	movq	progName(%rip), %r14
	movq	stderr(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movq	%rbx, %rdi
	movl	$.L.str73, %esi
	movq	%r14, %rdx
	movl	$inName, %ecx
	movq	%rax, %r8
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4408(%rip)
	jmp	.LBB19_108
.LBB19_85:                              # %if.then125.if.end133_crit_edge
	incl	EdgeProfCounters+4428(%rip)
.LBB19_87:                              # %if.end133
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4436(%rip)
	jmp	.LBB19_108
.LBB19_90:                              # %if.then137.if.end145_crit_edge
	incl	EdgeProfCounters+4452(%rip)
.LBB19_92:                              # %if.end145
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4460(%rip)
	jmp	.LBB19_108
.LBB19_103:                             # %if.then158.if.end163_crit_edge
	incl	EdgeProfCounters+4504(%rip)
.LBB19_105:                             # %if.end163
	incl	EdgeProfCounters+4512(%rip)
.LBB19_106:                             # %if.end164
	incl	EdgeProfCounters+4516(%rip)
.LBB19_107:                             # %if.end165
	movb	$0, deleteOutputOnInterrupt(%rip)
	incl	EdgeProfCounters+4520(%rip)
	jmp	.LBB19_108
.Ltmp79:
	.size	compress, .Ltmp79-compress
	.cfi_endproc

	.align	16, 0x90
	.type	uncompress,@function
uncompress:                             # @uncompress
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp83:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp84:
	.cfi_def_cfa_offset 24
	subq	$200, %rsp
.Ltmp85:
	.cfi_def_cfa_offset 224
.Ltmp86:
	.cfi_offset %rbx, -24
.Ltmp87:
	.cfi_offset %r14, -16
	incl	EdgeProfCounters+4524(%rip)
	movq	%rdi, 192(%rsp)
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpq	$0, 192(%rsp)
	je	.LBB20_2
# BB#1:                                 # %entry.if.end_crit_edge
	incl	EdgeProfCounters+4532(%rip)
	jmp	.LBB20_5
.LBB20_2:                               # %land.lhs.true
	incl	EdgeProfCounters+4528(%rip)
	cmpl	$1, srcMode(%rip)
	je	.LBB20_3
# BB#4:                                 # %if.then
	incl	EdgeProfCounters+4536(%rip)
	movl	$.L.str70, %edi
	callq	panic
	incl	EdgeProfCounters+4544(%rip)
	jmp	.LBB20_5
.LBB20_3:                               # %land.lhs.true.if.end_crit_edge
	incl	EdgeProfCounters+4540(%rip)
.LBB20_5:                               # %if.end
	movb	$0, 166(%rsp)
	movl	srcMode(%rip), %eax
	cmpl	$1, %eax
	je	.LBB20_9
# BB#6:                                 # %if.end
	cmpl	$2, %eax
	jne	.LBB20_7
# BB#16:                                # %sw.bb9
	incl	EdgeProfCounters+4560(%rip)
	movq	192(%rsp), %rsi
	movl	$inName, %edi
	callq	copyFileName
	movl	$outName, %edi
	movl	$.L.str71, %esi
	callq	copyFileName
	incl	EdgeProfCounters+4604(%rip)
	jmp	.LBB20_17
.LBB20_9:                               # %sw.bb
	incl	EdgeProfCounters+4552(%rip)
	movl	$inName, %edi
	movl	$.L.str37, %esi
	callq	copyFileName
	movl	$outName, %edi
	movl	$.L.str71, %esi
	callq	copyFileName
	incl	EdgeProfCounters+4564(%rip)
	jmp	.LBB20_17
.LBB20_7:                               # %if.end
	cmpl	$3, %eax
	jne	.LBB20_8
# BB#10:                                # %sw.bb2
	incl	EdgeProfCounters+4556(%rip)
	movq	192(%rsp), %rsi
	movl	$inName, %edi
	callq	copyFileName
	movq	192(%rsp), %rsi
	movl	$outName, %edi
	callq	copyFileName
	movl	$0, 168(%rsp)
	incl	EdgeProfCounters+4568(%rip)
	jmp	.LBB20_11
	.align	16, 0x90
.LBB20_14:                              # %for.inc
                                        #   in Loop: Header=BB20_11 Depth=1
	incl	EdgeProfCounters+4584(%rip)
	incl	EdgeProfCounters+4592(%rip)
	incl	168(%rsp)
	incl	EdgeProfCounters+4596(%rip)
.LBB20_11:                              # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$3, 168(%rsp)
	jg	.LBB20_15
# BB#12:                                # %for.body
                                        #   in Loop: Header=BB20_11 Depth=1
	incl	EdgeProfCounters+4572(%rip)
	movslq	168(%rsp), %rax
	movq	unzSuffix(,%rax,8), %rdx
	movq	zSuffix(,%rax,8), %rsi
	movl	$outName, %edi
	callq	mapSuffix
	testb	%al, %al
	je	.LBB20_14
# BB#13:                                # %if.then6
	incl	EdgeProfCounters+4580(%rip)
	incl	EdgeProfCounters+4588(%rip)
	jmp	.LBB20_18
.LBB20_8:                               # %if.end.sw.epilog_crit_edge
	incl	EdgeProfCounters+4548(%rip)
	jmp	.LBB20_17
.LBB20_15:                              # %for.end
	incl	EdgeProfCounters+4576(%rip)
	movb	$1, 166(%rsp)
	movl	$outName, %edi
	movl	$.L.str72, %esi
	callq	strcat
	incl	EdgeProfCounters+4600(%rip)
.LBB20_17:                              # %sw.epilog
	incl	EdgeProfCounters+4608(%rip)
.LBB20_18:                              # %zzz
	cmpl	$1, srcMode(%rip)
	je	.LBB20_19
# BB#22:                                # %land.lhs.true11
	incl	EdgeProfCounters+4612(%rip)
	movl	$inName, %edi
	callq	containsDubiousChars
	testb	%al, %al
	je	.LBB20_23
# BB#24:                                # %if.then14
	incl	EdgeProfCounters+4620(%rip)
	cmpb	$0, noisy(%rip)
	je	.LBB20_25
# BB#26:                                # %if.then16
	incl	EdgeProfCounters+4628(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str38, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+4636(%rip)
	jmp	.LBB20_27
.LBB20_19:                              # %zzz.if.end19_crit_edge
	incl	EdgeProfCounters+4616(%rip)
	jmp	.LBB20_20
.LBB20_23:                              # %land.lhs.true11.if.end19_crit_edge
	incl	EdgeProfCounters+4624(%rip)
.LBB20_20:                              # %if.end19
	cmpl	$1, srcMode(%rip)
	je	.LBB20_21
# BB#28:                                # %land.lhs.true22
	incl	EdgeProfCounters+4644(%rip)
	movl	$inName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB20_126
# BB#29:                                # %land.lhs.true22.if.end29_crit_edge
	incl	EdgeProfCounters+4652(%rip)
	jmp	.LBB20_30
.LBB20_21:                              # %if.end19.if.end29_crit_edge
	incl	EdgeProfCounters+4648(%rip)
.LBB20_30:                              # %if.end29
	cmpl	$3, srcMode(%rip)
	jne	.LBB20_32
# BB#31:                                # %if.end29.if.then34_crit_edge
	incl	EdgeProfCounters+4664(%rip)
	jmp	.LBB20_35
.LBB20_32:                              # %lor.lhs.false
	incl	EdgeProfCounters+4668(%rip)
	cmpl	$2, srcMode(%rip)
	jne	.LBB20_33
# BB#34:                                # %lor.lhs.false.if.then34_crit_edge
	incl	EdgeProfCounters+4672(%rip)
.LBB20_35:                              # %if.then34
	leaq	16(%rsp), %rsi
	movl	$inName, %edi
	callq	stat
	movl	$61440, %eax            # imm = 0xF000
	andl	40(%rsp), %eax
	cmpl	$16384, %eax            # imm = 0x4000
	jne	.LBB20_37
# BB#36:                                # %if.then38
	incl	EdgeProfCounters+4680(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str40, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4688(%rip)
	jmp	.LBB20_125
.LBB20_37:                              # %if.end40
	incl	EdgeProfCounters+4684(%rip)
	incl	EdgeProfCounters+4692(%rip)
	jmp	.LBB20_38
.LBB20_33:                              # %lor.lhs.false.if.end41_crit_edge
	incl	EdgeProfCounters+4676(%rip)
.LBB20_38:                              # %if.end41
	cmpl	$3, srcMode(%rip)
	jne	.LBB20_39
# BB#42:                                # %land.lhs.true44
	incl	EdgeProfCounters+4696(%rip)
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB20_44
# BB#43:                                # %land.lhs.true44.if.end55_crit_edge
	incl	EdgeProfCounters+4704(%rip)
	jmp	.LBB20_40
.LBB20_39:                              # %if.end41.if.end55_crit_edge
	incl	EdgeProfCounters+4700(%rip)
.LBB20_40:                              # %if.end55
	cmpb	$0, 166(%rsp)
	je	.LBB20_41
# BB#50:                                # %if.then57
	incl	EdgeProfCounters+4736(%rip)
	cmpb	$0, noisy(%rip)
	je	.LBB20_51
# BB#52:                                # %if.then59
	incl	EdgeProfCounters+4744(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str75, %esi
	movl	$inName, %ecx
	movl	$outName, %r8d
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+4752(%rip)
	jmp	.LBB20_53
.LBB20_126:                             # %if.then25
	incl	EdgeProfCounters+4656(%rip)
	movq	progName(%rip), %r14
	movq	stderr(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movq	%rbx, %rdi
	movl	$.L.str73, %esi
	movq	%r14, %rdx
	movl	$inName, %ecx
	movq	%rax, %r8
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4660(%rip)
	jmp	.LBB20_125
.LBB20_25:                              # %if.then14.if.end18_crit_edge
	incl	EdgeProfCounters+4632(%rip)
.LBB20_27:                              # %if.end18
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4640(%rip)
.LBB20_125:                             # %if.end191
	addq	$200, %rsp
	popq	%rbx
	popq	%r14
	ret
.LBB20_41:                              # %if.end55.if.end62_crit_edge
	incl	EdgeProfCounters+4740(%rip)
	jmp	.LBB20_54
.LBB20_51:                              # %if.then57.if.end61_crit_edge
	incl	EdgeProfCounters+4748(%rip)
.LBB20_53:                              # %if.end61
	incl	EdgeProfCounters+4756(%rip)
.LBB20_54:                              # %if.end62
	cmpl	$3, srcMode(%rip)
	jne	.LBB20_55
# BB#56:                                # %land.lhs.true65
	incl	EdgeProfCounters+4760(%rip)
	movl	$outName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB20_57
# BB#58:                                # %if.then69
	incl	EdgeProfCounters+4768(%rip)
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB20_59
# BB#60:                                # %if.end74
	incl	EdgeProfCounters+4776(%rip)
	movl	$outName, %edi
	callq	remove
	incl	EdgeProfCounters+4784(%rip)
	incl	EdgeProfCounters+4792(%rip)
	jmp	.LBB20_61
.LBB20_55:                              # %if.end62.if.end75_crit_edge
	incl	EdgeProfCounters+4764(%rip)
	jmp	.LBB20_61
.LBB20_44:                              # %land.lhs.true46
	incl	EdgeProfCounters+4708(%rip)
	movl	$inName, %edi
	callq	notAStandardFile
	testb	%al, %al
	je	.LBB20_45
# BB#46:                                # %if.then50
	incl	EdgeProfCounters+4712(%rip)
	cmpb	$0, noisy(%rip)
	je	.LBB20_47
# BB#48:                                # %if.then52
	incl	EdgeProfCounters+4720(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str74, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+4728(%rip)
	jmp	.LBB20_49
.LBB20_57:                              # %land.lhs.true65.if.end75_crit_edge
	incl	EdgeProfCounters+4772(%rip)
.LBB20_61:                              # %if.end75
	cmpl	$3, srcMode(%rip)
	jne	.LBB20_62
# BB#65:                                # %land.lhs.true78
	incl	EdgeProfCounters+4796(%rip)
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB20_67
# BB#66:                                # %land.lhs.true78.if.end88_crit_edge
	incl	EdgeProfCounters+4804(%rip)
	jmp	.LBB20_63
.LBB20_62:                              # %if.end75.if.end88_crit_edge
	incl	EdgeProfCounters+4800(%rip)
.LBB20_63:                              # %if.end88
	cmpl	$3, srcMode(%rip)
	jne	.LBB20_64
# BB#72:                                # %if.then91
	incl	EdgeProfCounters+4824(%rip)
	movl	$inName, %edi
	callq	saveInputFileMetaInfo
	incl	EdgeProfCounters+4832(%rip)
	jmp	.LBB20_73
.LBB20_64:                              # %if.end88.if.end92_crit_edge
	incl	EdgeProfCounters+4828(%rip)
.LBB20_73:                              # %if.end92
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	je	.LBB20_85
# BB#74:                                # %if.end92
	cmpl	$2, %eax
	jne	.LBB20_75
# BB#79:                                # %sw.bb101
	incl	EdgeProfCounters+4844(%rip)
	movl	$inName, %edi
	movl	$.L.str43, %esi
	callq	fopen
	movq	%rax, 184(%rsp)
	movq	stdout(%rip), %rax
	movq	%rax, 176(%rsp)
	cmpq	$0, 184(%rsp)
	je	.LBB20_80
# BB#84:                                # %if.end114
	incl	EdgeProfCounters+4872(%rip)
	incl	EdgeProfCounters+4892(%rip)
	jmp	.LBB20_97
.LBB20_85:                              # %sw.bb115
	incl	EdgeProfCounters+4848(%rip)
	movl	$inName, %edi
	movl	$.L.str43, %esi
	callq	fopen
	movq	%rax, 184(%rsp)
	movl	$outName, %edi
	movl	$.L.str79, %esi
	callq	fopen_output_safely
	movq	%rax, 176(%rsp)
	testq	%rax, %rax
	je	.LBB20_86
# BB#90:                                # %if.end129
	incl	EdgeProfCounters+4900(%rip)
	cmpq	$0, 184(%rsp)
	je	.LBB20_91
# BB#95:                                # %if.end141
	incl	EdgeProfCounters+4924(%rip)
	incl	EdgeProfCounters+4944(%rip)
	jmp	.LBB20_97
.LBB20_75:                              # %if.end92
	cmpl	$1, %eax
	jne	.LBB20_96
# BB#76:                                # %sw.bb93
	incl	EdgeProfCounters+4840(%rip)
	movq	stdin(%rip), %rax
	movq	%rax, 184(%rsp)
	movq	stdout(%rip), %rax
	movq	%rax, 176(%rsp)
	movq	stdin(%rip), %rdi
	callq	fileno
	movl	%eax, %edi
	callq	isatty
	testl	%eax, %eax
	je	.LBB20_78
# BB#77:                                # %if.then97
	incl	EdgeProfCounters+4852(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str41, %esi
	xorb	%al, %al
	callq	fprintf
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str42, %esi
	movq	%rdx, %rcx
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4860(%rip)
	jmp	.LBB20_125
.LBB20_67:                              # %land.lhs.true80
	incl	EdgeProfCounters+4808(%rip)
	movl	$inName, %edi
	callq	countHardLinks
	movl	%eax, 172(%rsp)
	testl	%eax, %eax
	jle	.LBB20_68
# BB#69:                                # %if.then84
	incl	EdgeProfCounters+4812(%rip)
	movl	$.L.str78, %r9d
	movl	172(%rsp), %r8d
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	cmpl	$1, %r8d
	jg	.LBB20_71
# BB#70:                                # %select.mid
	movl	$.L.str413, %r9d
.LBB20_71:                              # %select.end
	movl	$.L.str77, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4820(%rip)
	jmp	.LBB20_125
.LBB20_96:                              # %sw.default
	incl	EdgeProfCounters+4836(%rip)
	movl	$.L.str81, %edi
	callq	panic
	incl	EdgeProfCounters+4948(%rip)
	jmp	.LBB20_97
.LBB20_59:                              # %if.else
	incl	EdgeProfCounters+4780(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str76, %esi
	movl	$outName, %ecx
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4788(%rip)
	jmp	.LBB20_125
.LBB20_80:                              # %if.then105
	incl	EdgeProfCounters+4868(%rip)
	movq	progName(%rip), %r14
	movq	stderr(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movq	%rbx, %rdi
	movl	$.L.str44, %esi
	movq	%r14, %rdx
	movl	$inName, %ecx
	movq	%rax, %r8
	xorb	%al, %al
	callq	fprintf
	cmpq	$0, 184(%rsp)
	je	.LBB20_81
# BB#82:                                # %if.then111
	incl	EdgeProfCounters+4876(%rip)
	movq	184(%rsp), %rdi
	callq	fclose
	incl	EdgeProfCounters+4884(%rip)
	jmp	.LBB20_83
.LBB20_86:                              # %if.then120
	incl	EdgeProfCounters+4896(%rip)
	movq	progName(%rip), %r14
	movq	stderr(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movq	%rbx, %rdi
	movl	$.L.str80, %esi
	movq	%r14, %rdx
	movl	$outName, %ecx
	movq	%rax, %r8
	xorb	%al, %al
	callq	fprintf
	cmpq	$0, 184(%rsp)
	je	.LBB20_87
# BB#88:                                # %if.then126
	incl	EdgeProfCounters+4904(%rip)
	movq	184(%rsp), %rdi
	callq	fclose
	incl	EdgeProfCounters+4912(%rip)
	jmp	.LBB20_89
.LBB20_45:                              # %land.lhs.true46.if.end55_crit_edge
	incl	EdgeProfCounters+4716(%rip)
	jmp	.LBB20_40
.LBB20_91:                              # %if.then132
	incl	EdgeProfCounters+4920(%rip)
	movq	progName(%rip), %r14
	movq	stderr(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movq	%rbx, %rdi
	movl	$.L.str73, %esi
	movq	%r14, %rdx
	movl	$inName, %ecx
	movq	%rax, %r8
	xorb	%al, %al
	callq	fprintf
	cmpq	$0, 176(%rsp)
	je	.LBB20_92
# BB#93:                                # %if.then138
	incl	EdgeProfCounters+4928(%rip)
	movq	176(%rsp), %rdi
	callq	fclose
	incl	EdgeProfCounters+4936(%rip)
	jmp	.LBB20_94
.LBB20_68:                              # %land.lhs.true80.if.end88_crit_edge
	incl	EdgeProfCounters+4816(%rip)
	jmp	.LBB20_63
.LBB20_47:                              # %if.then50.if.end54_crit_edge
	incl	EdgeProfCounters+4724(%rip)
.LBB20_49:                              # %if.end54
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4732(%rip)
	jmp	.LBB20_125
.LBB20_78:                              # %if.end100
	incl	EdgeProfCounters+4856(%rip)
	incl	EdgeProfCounters+4864(%rip)
.LBB20_97:                              # %sw.epilog142
	cmpl	$0, verbosity(%rip)
	jle	.LBB20_98
# BB#99:                                # %if.then145
	incl	EdgeProfCounters+4952(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str46, %esi
	movl	$inName, %edx
	xorb	%al, %al
	callq	fprintf
	movl	$inName, %edi
	callq	pad
	movq	stderr(%rip), %rdi
	callq	fflush
	incl	EdgeProfCounters+4960(%rip)
	jmp	.LBB20_100
.LBB20_98:                              # %sw.epilog142.if.end148_crit_edge
	incl	EdgeProfCounters+4956(%rip)
.LBB20_100:                             # %if.end148
	movq	176(%rsp), %rax
	movq	%rax, outputHandleJustInCase(%rip)
	movb	$1, deleteOutputOnInterrupt(%rip)
	movq	176(%rsp), %rsi
	movq	184(%rsp), %rdi
	callq	uncompressStream
	movb	%al, 167(%rsp)
	movq	$0, outputHandleJustInCase(%rip)
	cmpb	$0, 167(%rsp)
	je	.LBB20_110
# BB#101:                               # %if.then151
	incl	EdgeProfCounters+4964(%rip)
	cmpl	$3, srcMode(%rip)
	jne	.LBB20_102
# BB#103:                               # %if.then154
	incl	EdgeProfCounters+4972(%rip)
	movl	$outName, %edi
	callq	applySavedMetaInfoToOutputFile
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpb	$0, keepInputFiles(%rip)
	je	.LBB20_105
# BB#104:                               # %if.then154.if.end162_crit_edge
	incl	EdgeProfCounters+4980(%rip)
	jmp	.LBB20_109
.LBB20_110:                             # %if.else164
	incl	EdgeProfCounters+4968(%rip)
	movb	$1, unzFailsExist(%rip)
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpl	$3, srcMode(%rip)
	jne	.LBB20_111
# BB#112:                               # %if.then167
	incl	EdgeProfCounters+5012(%rip)
	movl	$outName, %edi
	callq	remove
	movl	%eax, 8(%rsp)
	testl	%eax, %eax
	je	.LBB20_113
# BB#114:                               # %if.then172
	incl	EdgeProfCounters+5020(%rip)
	callq	ioError
	incl	EdgeProfCounters+5028(%rip)
	jmp	.LBB20_115
.LBB20_102:                             # %if.then151.if.end163_crit_edge
	incl	EdgeProfCounters+4976(%rip)
	incl	EdgeProfCounters+5008(%rip)
	jmp	.LBB20_117
.LBB20_111:                             # %if.else164.if.end174_crit_edge
	incl	EdgeProfCounters+5016(%rip)
	jmp	.LBB20_116
.LBB20_105:                             # %if.then156
	incl	EdgeProfCounters+4984(%rip)
	movl	$inName, %edi
	callq	remove
	movl	%eax, 12(%rsp)
	testl	%eax, %eax
	je	.LBB20_106
# BB#107:                               # %if.then160
	incl	EdgeProfCounters+4988(%rip)
	callq	ioError
	incl	EdgeProfCounters+4996(%rip)
	jmp	.LBB20_108
.LBB20_81:                              # %if.then105.if.end113_crit_edge
	incl	EdgeProfCounters+4880(%rip)
.LBB20_83:                              # %if.end113
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4888(%rip)
	jmp	.LBB20_125
.LBB20_87:                              # %if.then120.if.end128_crit_edge
	incl	EdgeProfCounters+4908(%rip)
.LBB20_89:                              # %if.end128
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4916(%rip)
	jmp	.LBB20_125
.LBB20_113:                             # %if.then167.if.end173_crit_edge
	incl	EdgeProfCounters+5024(%rip)
.LBB20_115:                             # %if.end173
	incl	EdgeProfCounters+5032(%rip)
.LBB20_116:                             # %if.end174
	incl	EdgeProfCounters+5036(%rip)
	jmp	.LBB20_117
.LBB20_92:                              # %if.then132.if.end140_crit_edge
	incl	EdgeProfCounters+4932(%rip)
.LBB20_94:                              # %if.end140
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+4940(%rip)
	jmp	.LBB20_125
.LBB20_106:                             # %if.then156.if.end161_crit_edge
	incl	EdgeProfCounters+4992(%rip)
.LBB20_108:                             # %if.end161
	incl	EdgeProfCounters+5000(%rip)
.LBB20_109:                             # %if.end162
	incl	EdgeProfCounters+5004(%rip)
	incl	EdgeProfCounters+5008(%rip)
.LBB20_117:                             # %if.end175
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpb	$0, 167(%rsp)
	je	.LBB20_121
# BB#118:                               # %if.then177
	incl	EdgeProfCounters+5040(%rip)
	cmpl	$0, verbosity(%rip)
	jle	.LBB20_119
# BB#120:                               # %if.then180
	incl	EdgeProfCounters+5048(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str82, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+5056(%rip)
	incl	EdgeProfCounters+5060(%rip)
	jmp	.LBB20_125
.LBB20_121:                             # %if.else183
	incl	EdgeProfCounters+5044(%rip)
	movl	$2, %edi
	callq	setExit
	cmpl	$0, verbosity(%rip)
	jle	.LBB20_123
# BB#122:                               # %if.then186
	incl	EdgeProfCounters+5064(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str83, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+5072(%rip)
	jmp	.LBB20_124
.LBB20_119:                             # %if.then177.if.end182_crit_edge
	incl	EdgeProfCounters+5052(%rip)
	incl	EdgeProfCounters+5060(%rip)
	jmp	.LBB20_125
.LBB20_123:                             # %if.else188
	incl	EdgeProfCounters+5068(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str84, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+5076(%rip)
.LBB20_124:                             # %if.end190
	incl	EdgeProfCounters+5080(%rip)
	jmp	.LBB20_125
.Ltmp88:
	.size	uncompress, .Ltmp88-uncompress
	.cfi_endproc

	.align	16, 0x90
	.type	setExit,@function
setExit:                                # @setExit
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+5084(%rip)
	movl	%edi, -4(%rsp)
	cmpl	exitValue(%rip), %edi
	jle	.LBB21_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+5088(%rip)
	movl	-4(%rsp), %eax
	movl	%eax, exitValue(%rip)
	incl	EdgeProfCounters+5096(%rip)
	ret
.LBB21_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+5092(%rip)
	ret
.Ltmp89:
	.size	setExit, .Ltmp89-setExit
	.cfi_endproc

	.align	16, 0x90
	.type	testf,@function
testf:                                  # @testf
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp93:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp94:
	.cfi_def_cfa_offset 24
	subq	$168, %rsp
.Ltmp95:
	.cfi_def_cfa_offset 192
.Ltmp96:
	.cfi_offset %rbx, -24
.Ltmp97:
	.cfi_offset %r14, -16
	incl	EdgeProfCounters+5100(%rip)
	movq	%rdi, 160(%rsp)
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpq	$0, 160(%rsp)
	je	.LBB22_2
# BB#1:                                 # %entry.if.end_crit_edge
	incl	EdgeProfCounters+5108(%rip)
	jmp	.LBB22_5
.LBB22_2:                               # %land.lhs.true
	incl	EdgeProfCounters+5104(%rip)
	cmpl	$1, srcMode(%rip)
	je	.LBB22_3
# BB#4:                                 # %if.then
	incl	EdgeProfCounters+5112(%rip)
	movl	$.L.str36, %edi
	callq	panic
	incl	EdgeProfCounters+5120(%rip)
	jmp	.LBB22_5
.LBB22_3:                               # %land.lhs.true.if.end_crit_edge
	incl	EdgeProfCounters+5116(%rip)
.LBB22_5:                               # %if.end
	movl	$outName, %edi
	movl	$.L.str615, %esi
	callq	copyFileName
	movl	srcMode(%rip), %eax
	cmpl	$1, %eax
	je	.LBB22_9
# BB#6:                                 # %if.end
	cmpl	$2, %eax
	jne	.LBB22_7
# BB#11:                                # %sw.bb3
	incl	EdgeProfCounters+5136(%rip)
	movq	160(%rsp), %rsi
	movl	$inName, %edi
	callq	copyFileName
	incl	EdgeProfCounters+5148(%rip)
	jmp	.LBB22_12
.LBB22_9:                               # %sw.bb
	incl	EdgeProfCounters+5128(%rip)
	movl	$inName, %edi
	movl	$.L.str37, %esi
	callq	copyFileName
	incl	EdgeProfCounters+5140(%rip)
	jmp	.LBB22_12
.LBB22_7:                               # %if.end
	cmpl	$3, %eax
	jne	.LBB22_8
# BB#10:                                # %sw.bb2
	incl	EdgeProfCounters+5132(%rip)
	movq	160(%rsp), %rsi
	movl	$inName, %edi
	callq	copyFileName
	incl	EdgeProfCounters+5144(%rip)
	jmp	.LBB22_12
.LBB22_8:                               # %if.end.sw.epilog_crit_edge
	incl	EdgeProfCounters+5124(%rip)
.LBB22_12:                              # %sw.epilog
	cmpl	$1, srcMode(%rip)
	je	.LBB22_13
# BB#16:                                # %land.lhs.true5
	incl	EdgeProfCounters+5152(%rip)
	movl	$inName, %edi
	callq	containsDubiousChars
	testb	%al, %al
	je	.LBB22_17
# BB#18:                                # %if.then6
	incl	EdgeProfCounters+5160(%rip)
	cmpb	$0, noisy(%rip)
	je	.LBB22_19
# BB#20:                                # %if.then8
	incl	EdgeProfCounters+5168(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str38, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+5176(%rip)
	jmp	.LBB22_21
.LBB22_13:                              # %sw.epilog.if.end11_crit_edge
	incl	EdgeProfCounters+5156(%rip)
	jmp	.LBB22_14
.LBB22_17:                              # %land.lhs.true5.if.end11_crit_edge
	incl	EdgeProfCounters+5164(%rip)
.LBB22_14:                              # %if.end11
	cmpl	$1, srcMode(%rip)
	je	.LBB22_15
# BB#22:                                # %land.lhs.true14
	incl	EdgeProfCounters+5184(%rip)
	movl	$inName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB22_53
# BB#23:                                # %land.lhs.true14.if.end21_crit_edge
	incl	EdgeProfCounters+5192(%rip)
	jmp	.LBB22_24
.LBB22_15:                              # %if.end11.if.end21_crit_edge
	incl	EdgeProfCounters+5188(%rip)
.LBB22_24:                              # %if.end21
	cmpl	$1, srcMode(%rip)
	je	.LBB22_25
# BB#26:                                # %if.then24
	incl	EdgeProfCounters+5204(%rip)
	leaq	(%rsp), %rsi
	movl	$inName, %edi
	callq	stat
	movl	$61440, %eax            # imm = 0xF000
	andl	24(%rsp), %eax
	cmpl	$16384, %eax            # imm = 0x4000
	jne	.LBB22_28
# BB#27:                                # %if.then28
	incl	EdgeProfCounters+5212(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str40, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+5220(%rip)
	jmp	.LBB22_52
.LBB22_25:                              # %if.end21.if.end31_crit_edge
	incl	EdgeProfCounters+5208(%rip)
	jmp	.LBB22_29
.LBB22_28:                              # %if.end30
	incl	EdgeProfCounters+5216(%rip)
	incl	EdgeProfCounters+5224(%rip)
.LBB22_29:                              # %if.end31
	movl	srcMode(%rip), %eax
	cmpl	$1, %eax
	je	.LBB22_33
# BB#30:                                # %if.end31
	cmpl	$2, %eax
	jne	.LBB22_31
# BB#36:                                # %if.end31.sw.bb40_crit_edge
	incl	EdgeProfCounters+5236(%rip)
	jmp	.LBB22_37
.LBB22_33:                              # %sw.bb32
	incl	EdgeProfCounters+5232(%rip)
	movq	stdin(%rip), %rdi
	callq	fileno
	movl	%eax, %edi
	callq	isatty
	testl	%eax, %eax
	je	.LBB22_35
# BB#34:                                # %if.then36
	incl	EdgeProfCounters+5244(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str41, %esi
	xorb	%al, %al
	callq	fprintf
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str42, %esi
	movq	%rdx, %rcx
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+5252(%rip)
	jmp	.LBB22_52
.LBB22_31:                              # %if.end31
	cmpl	$3, %eax
	jne	.LBB22_40
# BB#32:                                # %if.end31.sw.bb40_crit_edge69
	incl	EdgeProfCounters+5240(%rip)
.LBB22_37:                              # %sw.bb40
	movl	$inName, %edi
	movl	$.L.str43, %esi
	callq	fopen
	movq	%rax, 152(%rsp)
	testq	%rax, %rax
	je	.LBB22_38
# BB#39:                                # %if.end48
	incl	EdgeProfCounters+5264(%rip)
	incl	EdgeProfCounters+5272(%rip)
	jmp	.LBB22_41
.LBB22_53:                              # %if.then17
	incl	EdgeProfCounters+5196(%rip)
	movq	progName(%rip), %r14
	movq	stderr(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movq	%rbx, %rdi
	movl	$.L.str39, %esi
	movq	%r14, %rdx
	movl	$inName, %ecx
	movq	%rax, %r8
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+5200(%rip)
	jmp	.LBB22_52
.LBB22_19:                              # %if.then6.if.end10_crit_edge
	incl	EdgeProfCounters+5172(%rip)
.LBB22_21:                              # %if.end10
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+5180(%rip)
	jmp	.LBB22_52
.LBB22_38:                              # %if.then44
	incl	EdgeProfCounters+5260(%rip)
	movq	progName(%rip), %r14
	movq	stderr(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movq	%rbx, %rdi
	movl	$.L.str44, %esi
	movq	%r14, %rdx
	movl	$inName, %ecx
	movq	%rax, %r8
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	setExit
	incl	EdgeProfCounters+5268(%rip)
	jmp	.LBB22_52
.LBB22_40:                              # %sw.default
	incl	EdgeProfCounters+5228(%rip)
	movl	$.L.str45, %edi
	callq	panic
	incl	EdgeProfCounters+5276(%rip)
	jmp	.LBB22_41
.LBB22_35:                              # %if.end39
	incl	EdgeProfCounters+5248(%rip)
	movq	stdin(%rip), %rax
	movq	%rax, 152(%rsp)
	incl	EdgeProfCounters+5256(%rip)
.LBB22_41:                              # %sw.epilog49
	cmpl	$0, verbosity(%rip)
	jle	.LBB22_42
# BB#43:                                # %if.then52
	incl	EdgeProfCounters+5280(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str46, %esi
	movl	$inName, %edx
	xorb	%al, %al
	callq	fprintf
	movl	$inName, %edi
	callq	pad
	movq	stderr(%rip), %rdi
	callq	fflush
	incl	EdgeProfCounters+5288(%rip)
	jmp	.LBB22_44
.LBB22_42:                              # %sw.epilog49.if.end55_crit_edge
	incl	EdgeProfCounters+5284(%rip)
.LBB22_44:                              # %if.end55
	movq	$0, outputHandleJustInCase(%rip)
	movq	152(%rsp), %rdi
	callq	testStream
	movb	%al, 151(%rsp)
	testb	%al, %al
	je	.LBB22_45
# BB#46:                                # %land.lhs.true59
	incl	EdgeProfCounters+5292(%rip)
	cmpl	$0, verbosity(%rip)
	jle	.LBB22_47
# BB#48:                                # %if.then62
	incl	EdgeProfCounters+5300(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str47, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+5308(%rip)
	jmp	.LBB22_49
.LBB22_45:                              # %if.end55.if.end64_crit_edge
	incl	EdgeProfCounters+5296(%rip)
	jmp	.LBB22_49
.LBB22_47:                              # %land.lhs.true59.if.end64_crit_edge
	incl	EdgeProfCounters+5304(%rip)
.LBB22_49:                              # %if.end64
	cmpb	$0, 151(%rsp)
	je	.LBB22_51
# BB#50:                                # %if.end64.if.end67_crit_edge
	incl	EdgeProfCounters+5312(%rip)
	jmp	.LBB22_52
.LBB22_51:                              # %if.then66
	incl	EdgeProfCounters+5316(%rip)
	movb	$1, testFailsExist(%rip)
	incl	EdgeProfCounters+5320(%rip)
.LBB22_52:                              # %if.end67
	addq	$168, %rsp
	popq	%rbx
	popq	%r14
	ret
.Ltmp98:
	.size	testf, .Ltmp98-testf
	.cfi_endproc

	.align	16, 0x90
	.type	panic,@function
panic:                                  # @panic
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp100:
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
	incl	EdgeProfCounters+5324(%rip)
	movq	%rax, (%rsp)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str69, %esi
	movq	%rax, %rcx
	xorb	%al, %al
	callq	fprintf
	callq	showFileNames
	movl	$3, %edi
	callq	cleanUpAndFail
	popq	%rax
	ret
.Ltmp101:
	.size	panic, .Ltmp101-panic
	.cfi_endproc

	.align	16, 0x90
	.type	containsDubiousChars,@function
containsDubiousChars:                   # @containsDubiousChars
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+5328(%rip)
	movq	%rdi, -8(%rsp)
	xorl	%eax, %eax
	ret
.Ltmp102:
	.size	containsDubiousChars, .Ltmp102-containsDubiousChars
	.cfi_endproc

	.align	16, 0x90
	.type	fileExists,@function
fileExists:                             # @fileExists
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp104:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+5332(%rip)
	movq	%rdi, 16(%rsp)
	movl	$.L.str43, %esi
	callq	fopen
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	setne	7(%rsp)
	cmpq	$0, 8(%rsp)
	je	.LBB25_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+5336(%rip)
	movq	8(%rsp), %rdi
	callq	fclose
	incl	EdgeProfCounters+5344(%rip)
	jmp	.LBB25_3
.LBB25_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+5340(%rip)
.LBB25_3:                               # %if.end
	movzbl	7(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp105:
	.size	fileExists, .Ltmp105-fileExists
	.cfi_endproc

	.align	16, 0x90
	.type	pad,@function
pad:                                    # @pad
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp109:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp110:
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
.Ltmp111:
	.cfi_def_cfa_offset 48
.Ltmp112:
	.cfi_offset %rbx, -24
.Ltmp113:
	.cfi_offset %rbp, -16
	incl	EdgeProfCounters+5348(%rip)
	movq	%rdi, 16(%rsp)
	callq	strlen
	cmpl	longestFileName(%rip), %eax
	jl	.LBB26_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+5352(%rip)
	incl	EdgeProfCounters+5360(%rip)
	jmp	.LBB26_5
.LBB26_2:                               # %if.end
	incl	EdgeProfCounters+5356(%rip)
	movl	$1, 12(%rsp)
	incl	EdgeProfCounters+5364(%rip)
	jmp	.LBB26_3
	.align	16, 0x90
.LBB26_6:                               # %for.body
                                        #   in Loop: Header=BB26_3 Depth=1
	incl	EdgeProfCounters+5368(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str68, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+5376(%rip)
	incl	12(%rsp)
	incl	EdgeProfCounters+5380(%rip)
.LBB26_3:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	12(%rsp), %ebx
	movl	longestFileName(%rip), %ebp
	movq	16(%rsp), %rdi
	callq	strlen
	subl	%eax, %ebp
	cmpl	%ebp, %ebx
	jle	.LBB26_6
# BB#4:                                 # %for.cond.for.end_crit_edge
	incl	EdgeProfCounters+5372(%rip)
.LBB26_5:                               # %for.end
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp114:
	.size	pad, .Ltmp114-pad
	.cfi_endproc

	.align	16, 0x90
	.type	testStream,@function
testStream:                             # @testStream
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp121:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp122:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp123:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp124:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp125:
	.cfi_def_cfa_offset 48
	subq	$10096, %rsp            # imm = 0x2770
.Ltmp126:
	.cfi_def_cfa_offset 10144
.Ltmp127:
	.cfi_offset %rbx, -48
.Ltmp128:
	.cfi_offset %r12, -40
.Ltmp129:
	.cfi_offset %r13, -32
.Ltmp130:
	.cfi_offset %r14, -24
.Ltmp131:
	.cfi_offset %r15, -16
	incl	EdgeProfCounters+5384(%rip)
	movq	%rdi, 10080(%rsp)
	movq	$0, 10072(%rsp)
	movl	$0, 28(%rsp)
	movl	$0, 10052(%rsp)
	movq	10080(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB27_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+5388(%rip)
	incl	EdgeProfCounters+5396(%rip)
.LBB27_43:                              # %errhandler_io
	callq	ioError
	incl	EdgeProfCounters+5620(%rip)
	jmp	.LBB27_57
.LBB27_2:                               # %if.end
	incl	EdgeProfCounters+5392(%rip)
	incl	EdgeProfCounters+5400(%rip)
	leaq	10068(%rsp), %rbx
	leaq	32(%rsp), %r14
	leaq	5040(%rsp), %r15
	leaq	16(%rsp), %r12
	leaq	28(%rsp), %r13
	jmp	.LBB27_3
.LBB27_26:                              # %if.end33.if.end40_crit_edge
                                        #   in Loop: Header=BB27_3 Depth=1
	incl	EdgeProfCounters+5512(%rip)
	incl	EdgeProfCounters+5528(%rip)
.LBB27_3:                               # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB27_8 Depth 2
                                        #     Child Loop BB27_20 Depth 2
	movl	28(%rsp), %r9d
	movzbl	smallMode(%rip), %ecx
	movl	verbosity(%rip), %edx
	movq	10080(%rsp), %rsi
	movq	%rbx, %rdi
	movq	%r14, %r8
	callq	BZ2_bzReadOpen
	movq	%rax, 10072(%rsp)
	testq	%rax, %rax
	je	.LBB27_4
# BB#5:                                 # %lor.lhs.false
                                        #   in Loop: Header=BB27_3 Depth=1
	incl	EdgeProfCounters+5408(%rip)
	cmpl	$0, 10068(%rsp)
	jne	.LBB27_6
# BB#7:                                 # %if.end6
                                        #   in Loop: Header=BB27_3 Depth=1
	incl	EdgeProfCounters+5416(%rip)
	incl	10052(%rsp)
	incl	EdgeProfCounters+5424(%rip)
	jmp	.LBB27_8
	.align	16, 0x90
.LBB27_11:                              # %if.end16
                                        #   in Loop: Header=BB27_8 Depth=2
	incl	EdgeProfCounters+5440(%rip)
	incl	EdgeProfCounters+5448(%rip)
.LBB27_8:                               # %while.cond7
                                        #   Parent Loop BB27_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 10068(%rsp)
	jne	.LBB27_12
# BB#9:                                 # %while.body10
                                        #   in Loop: Header=BB27_8 Depth=2
	incl	EdgeProfCounters+5428(%rip)
	movq	10072(%rsp), %rsi
	movq	%rbx, %rdi
	movq	%r15, %rdx
	movl	$5000, %ecx             # imm = 0x1388
	callq	BZ2_bzRead
	movl	%eax, 10056(%rsp)
	cmpl	$-5, 10068(%rsp)
	jne	.LBB27_11
	jmp	.LBB27_10
	.align	16, 0x90
.LBB27_12:                              # %while.end
                                        #   in Loop: Header=BB27_3 Depth=1
	incl	EdgeProfCounters+5432(%rip)
	cmpl	$4, 10068(%rsp)
	jne	.LBB27_13
# BB#16:                                # %if.end20
                                        #   in Loop: Header=BB27_3 Depth=1
	incl	EdgeProfCounters+5456(%rip)
	movq	10072(%rsp), %rsi
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movq	%r13, %rcx
	callq	BZ2_bzReadGetUnused
	cmpl	$0, 10068(%rsp)
	je	.LBB27_17
# BB#18:                                # %if.then23
                                        #   in Loop: Header=BB27_3 Depth=1
	incl	EdgeProfCounters+5464(%rip)
	movl	$.L.str48, %edi
	callq	panic
	incl	EdgeProfCounters+5472(%rip)
	jmp	.LBB27_19
.LBB27_17:                              # %if.end20.if.end24_crit_edge
                                        #   in Loop: Header=BB27_3 Depth=1
	incl	EdgeProfCounters+5468(%rip)
.LBB27_19:                              # %if.end24
                                        #   in Loop: Header=BB27_3 Depth=1
	movq	16(%rsp), %rax
	movq	%rax, 8(%rsp)
	movl	$0, 10048(%rsp)
	incl	EdgeProfCounters+5476(%rip)
	jmp	.LBB27_20
	.align	16, 0x90
.LBB27_21:                              # %for.inc
                                        #   in Loop: Header=BB27_20 Depth=2
	incl	EdgeProfCounters+5480(%rip)
	movslq	10048(%rsp), %rax
	movq	8(%rsp), %rcx
	movb	(%rcx,%rax), %cl
	movb	%cl, 32(%rsp,%rax)
	incl	EdgeProfCounters+5488(%rip)
	incl	10048(%rsp)
	incl	EdgeProfCounters+5492(%rip)
.LBB27_20:                              # %for.cond
                                        #   Parent Loop BB27_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	10048(%rsp), %eax
	cmpl	28(%rsp), %eax
	jl	.LBB27_21
# BB#22:                                # %for.end
                                        #   in Loop: Header=BB27_3 Depth=1
	incl	EdgeProfCounters+5484(%rip)
	movq	10072(%rsp), %rsi
	movq	%rbx, %rdi
	callq	BZ2_bzReadClose
	cmpl	$0, 10068(%rsp)
	je	.LBB27_23
# BB#24:                                # %if.then32
                                        #   in Loop: Header=BB27_3 Depth=1
	incl	EdgeProfCounters+5496(%rip)
	movl	$.L.str48, %edi
	callq	panic
	incl	EdgeProfCounters+5504(%rip)
	jmp	.LBB27_25
.LBB27_23:                              # %for.end.if.end33_crit_edge
                                        #   in Loop: Header=BB27_3 Depth=1
	incl	EdgeProfCounters+5500(%rip)
.LBB27_25:                              # %if.end33
                                        #   in Loop: Header=BB27_3 Depth=1
	cmpl	$0, 28(%rsp)
	jne	.LBB27_26
# BB#27:                                # %land.lhs.true
                                        #   in Loop: Header=BB27_3 Depth=1
	incl	EdgeProfCounters+5508(%rip)
	movq	10080(%rsp), %rdi
	callq	myfeof
	testb	%al, %al
	jne	.LBB27_29
# BB#28:                                # %land.lhs.true.if.end40_crit_edge
                                        #   in Loop: Header=BB27_3 Depth=1
	incl	EdgeProfCounters+5520(%rip)
	incl	EdgeProfCounters+5528(%rip)
	jmp	.LBB27_3
.LBB27_10:                              # %if.then15
	incl	EdgeProfCounters+5436(%rip)
	incl	EdgeProfCounters+5444(%rip)
.LBB27_14:                              # %errhandler
	movq	10072(%rsp), %rsi
	leaq	10064(%rsp), %rdi
	callq	BZ2_bzReadClose
	cmpl	$0, verbosity(%rip)
	je	.LBB27_37
# BB#15:                                # %errhandler.if.end60_crit_edge
	incl	EdgeProfCounters+5576(%rip)
	jmp	.LBB27_38
.LBB27_37:                              # %if.then58
	incl	EdgeProfCounters+5572(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str50, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+5580(%rip)
.LBB27_38:                              # %if.end60
	movl	10068(%rsp), %eax
	addl	$9, %eax
	cmpl	$6, %eax
	ja	.LBB27_56
# BB#39:                                # %if.end60
	jmpq	*.LJTI27_0(,%rax,8)
.LBB27_41:                              # %sw.bb
	incl	EdgeProfCounters+5588(%rip)
	callq	configError
	incl	EdgeProfCounters+5612(%rip)
	jmp	.LBB27_57
.LBB27_56:                              # %sw.default
	incl	EdgeProfCounters+5584(%rip)
	movl	$.L.str55, %edi
	callq	panic
	incl	EdgeProfCounters+5676(%rip)
.LBB27_57:                              # %sw.epilog
	movl	$.L.str56, %edi
	callq	panic
	movb	$1, 10095(%rsp)
	incl	EdgeProfCounters+5680(%rip)
.LBB27_58:                              # %return
	movzbl	10095(%rsp), %eax
	addq	$10096, %rsp            # imm = 0x2770
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.LBB27_40:                              # %if.end60.sw.bb65_crit_edge
	incl	EdgeProfCounters+5604(%rip)
	jmp	.LBB27_46
.LBB27_42:                              # %sw.bb61
	incl	EdgeProfCounters+5592(%rip)
	incl	EdgeProfCounters+5616(%rip)
	jmp	.LBB27_43
.LBB27_47:                              # %sw.bb67
	incl	EdgeProfCounters+5608(%rip)
	movq	10080(%rsp), %rax
	cmpq	stdin(%rip), %rax
	je	.LBB27_48
# BB#49:                                # %if.then70
	incl	EdgeProfCounters+5636(%rip)
	movq	10080(%rsp), %rdi
	callq	fclose
	incl	EdgeProfCounters+5644(%rip)
	jmp	.LBB27_50
.LBB27_44:                              # %sw.bb62
	incl	EdgeProfCounters+5596(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str51, %esi
	xorb	%al, %al
	callq	fprintf
	movb	$0, 10095(%rsp)
	incl	EdgeProfCounters+5624(%rip)
	jmp	.LBB27_58
.LBB27_45:                              # %sw.bb64
	incl	EdgeProfCounters+5600(%rip)
	callq	outOfMemory
	incl	EdgeProfCounters+5628(%rip)
.LBB27_46:                              # %sw.bb65
	movq	stderr(%rip), %rdi
	movl	$.L.str52, %esi
	xorb	%al, %al
	callq	fprintf
	movb	$0, 10095(%rsp)
	incl	EdgeProfCounters+5632(%rip)
	jmp	.LBB27_58
.LBB27_4:                               # %while.body.if.then5_crit_edge
	incl	EdgeProfCounters+5404(%rip)
	incl	EdgeProfCounters+5420(%rip)
	jmp	.LBB27_14
.LBB27_6:                               # %lor.lhs.false.if.then5_crit_edge
	incl	EdgeProfCounters+5412(%rip)
	incl	EdgeProfCounters+5420(%rip)
	jmp	.LBB27_14
.LBB27_13:                              # %if.then19
	incl	EdgeProfCounters+5452(%rip)
	incl	EdgeProfCounters+5460(%rip)
	jmp	.LBB27_14
.LBB27_48:                              # %sw.bb67.if.end72_crit_edge
	incl	EdgeProfCounters+5640(%rip)
.LBB27_50:                              # %if.end72
	cmpl	$1, 10052(%rsp)
	jne	.LBB27_52
# BB#51:                                # %if.then75
	incl	EdgeProfCounters+5648(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str53, %esi
	xorb	%al, %al
	callq	fprintf
	movb	$0, 10095(%rsp)
	incl	EdgeProfCounters+5656(%rip)
	jmp	.LBB27_58
.LBB27_52:                              # %if.else
	incl	EdgeProfCounters+5652(%rip)
	cmpb	$0, noisy(%rip)
	je	.LBB27_53
# BB#54:                                # %if.then78
	incl	EdgeProfCounters+5660(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str54, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+5668(%rip)
	jmp	.LBB27_55
.LBB27_29:                              # %while.end41
	incl	EdgeProfCounters+5516(%rip)
	incl	EdgeProfCounters+5524(%rip)
	movq	10080(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB27_31
# BB#30:                                # %if.then44
	incl	EdgeProfCounters+5532(%rip)
	incl	EdgeProfCounters+5540(%rip)
	jmp	.LBB27_43
.LBB27_53:                              # %if.else.if.end80_crit_edge
	incl	EdgeProfCounters+5664(%rip)
.LBB27_55:                              # %if.end80
	movb	$1, 10095(%rsp)
	incl	EdgeProfCounters+5672(%rip)
	jmp	.LBB27_58
.LBB27_31:                              # %if.end45
	incl	EdgeProfCounters+5536(%rip)
	movq	10080(%rsp), %rdi
	callq	fclose
	movl	%eax, 10060(%rsp)
	cmpl	$-1, %eax
	jne	.LBB27_33
# BB#32:                                # %if.then49
	incl	EdgeProfCounters+5544(%rip)
	incl	EdgeProfCounters+5552(%rip)
	jmp	.LBB27_43
.LBB27_33:                              # %if.end50
	incl	EdgeProfCounters+5548(%rip)
	cmpl	$1, verbosity(%rip)
	jle	.LBB27_34
# BB#35:                                # %if.then53
	incl	EdgeProfCounters+5556(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str49, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+5564(%rip)
	jmp	.LBB27_36
.LBB27_34:                              # %if.end50.if.end55_crit_edge
	incl	EdgeProfCounters+5560(%rip)
.LBB27_36:                              # %if.end55
	movb	$1, 10095(%rsp)
	incl	EdgeProfCounters+5568(%rip)
	jmp	.LBB27_58
.Ltmp132:
	.size	testStream, .Ltmp132-testStream
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI27_0:
	.quad	.LBB27_41
	.quad	.LBB27_56
	.quad	.LBB27_40
	.quad	.LBB27_42
	.quad	.LBB27_47
	.quad	.LBB27_44
	.quad	.LBB27_45

	.text
	.align	16, 0x90
	.type	myfeof,@function
myfeof:                                 # @myfeof
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp134:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+5684(%rip)
	movq	%rdi, 8(%rsp)
	callq	fgetc
	movl	%eax, 4(%rsp)
	cmpl	$-1, %eax
	jne	.LBB28_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+5688(%rip)
	movb	$1, 23(%rsp)
	incl	EdgeProfCounters+5696(%rip)
	jmp	.LBB28_3
.LBB28_2:                               # %if.end
	incl	EdgeProfCounters+5692(%rip)
	movq	8(%rsp), %rsi
	movl	4(%rsp), %edi
	callq	ungetc
	movb	$0, 23(%rsp)
	incl	EdgeProfCounters+5700(%rip)
.LBB28_3:                               # %return
	movzbl	23(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp135:
	.size	myfeof, .Ltmp135-myfeof
	.cfi_endproc

	.align	16, 0x90
	.type	configError,@function
configError:                            # @configError
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp137:
	.cfi_def_cfa_offset 16
	incl	EdgeProfCounters+5704(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str67, %esi
	xorb	%al, %al
	callq	fprintf
	movl	$3, %edi
	callq	setExit
	movl	exitValue(%rip), %edi
	callq	exit
	popq	%rax
	ret
.Ltmp138:
	.size	configError, .Ltmp138-configError
	.cfi_endproc

	.align	16, 0x90
	.type	ioError,@function
ioError:                                # @ioError
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp140:
	.cfi_def_cfa_offset 16
	incl	EdgeProfCounters+5708(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str66, %esi
	xorb	%al, %al
	callq	fprintf
	movq	progName(%rip), %rdi
	callq	perror
	callq	showFileNames
	movl	$1, %edi
	callq	cleanUpAndFail
	popq	%rax
	ret
.Ltmp141:
	.size	ioError, .Ltmp141-ioError
	.cfi_endproc

	.align	16, 0x90
	.type	outOfMemory,@function
outOfMemory:                            # @outOfMemory
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp143:
	.cfi_def_cfa_offset 16
	incl	EdgeProfCounters+5712(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str57, %esi
	xorb	%al, %al
	callq	fprintf
	callq	showFileNames
	movl	$1, %edi
	callq	cleanUpAndFail
	popq	%rax
	ret
.Ltmp144:
	.size	outOfMemory, .Ltmp144-outOfMemory
	.cfi_endproc

	.align	16, 0x90
	.type	showFileNames,@function
showFileNames:                          # @showFileNames
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp146:
	.cfi_def_cfa_offset 16
	incl	EdgeProfCounters+5716(%rip)
	cmpb	$0, noisy(%rip)
	je	.LBB32_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+5720(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str65, %esi
	movl	$inName, %edx
	movl	$outName, %ecx
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+5728(%rip)
	popq	%rax
	ret
.LBB32_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+5724(%rip)
	popq	%rax
	ret
.Ltmp147:
	.size	showFileNames, .Ltmp147-showFileNames
	.cfi_endproc

	.align	16, 0x90
	.type	cleanUpAndFail,@function
cleanUpAndFail:                         # @cleanUpAndFail
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$152, %rsp
.Ltmp149:
	.cfi_def_cfa_offset 160
	incl	EdgeProfCounters+5732(%rip)
	movl	%edi, 148(%rsp)
	cmpl	$3, srcMode(%rip)
	jne	.LBB33_1
# BB#2:                                 # %land.lhs.true
	incl	EdgeProfCounters+5736(%rip)
	cmpl	$3, opMode(%rip)
	je	.LBB33_3
# BB#4:                                 # %land.lhs.true2
	incl	EdgeProfCounters+5744(%rip)
	cmpb	$0, deleteOutputOnInterrupt(%rip)
	je	.LBB33_5
# BB#6:                                 # %if.then
	incl	EdgeProfCounters+5752(%rip)
	leaq	(%rsp), %rsi
	movl	$inName, %edi
	callq	stat
	movl	%eax, 144(%rsp)
	testl	%eax, %eax
	je	.LBB33_7
# BB#16:                                # %if.else
	incl	EdgeProfCounters+5764(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str60, %esi
	xorb	%al, %al
	callq	fprintf
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str61, %esi
	xorb	%al, %al
	callq	fprintf
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str62, %esi
	movl	$outName, %ecx
	xorb	%al, %al
	callq	fprintf
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str63, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+5808(%rip)
	jmp	.LBB33_17
.LBB33_1:                               # %entry.if.end25_crit_edge
	incl	EdgeProfCounters+5740(%rip)
	jmp	.LBB33_18
.LBB33_3:                               # %land.lhs.true.if.end25_crit_edge
	incl	EdgeProfCounters+5748(%rip)
	jmp	.LBB33_18
.LBB33_5:                               # %land.lhs.true2.if.end25_crit_edge
	incl	EdgeProfCounters+5756(%rip)
	jmp	.LBB33_18
.LBB33_7:                               # %if.then5
	incl	EdgeProfCounters+5760(%rip)
	cmpb	$0, noisy(%rip)
	je	.LBB33_8
# BB#9:                                 # %if.then7
	incl	EdgeProfCounters+5768(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str58, %esi
	movl	$outName, %ecx
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+5776(%rip)
	jmp	.LBB33_10
.LBB33_8:                               # %if.then5.if.end_crit_edge
	incl	EdgeProfCounters+5772(%rip)
.LBB33_10:                              # %if.end
	cmpq	$0, outputHandleJustInCase(%rip)
	je	.LBB33_11
# BB#12:                                # %if.then11
	incl	EdgeProfCounters+5780(%rip)
	movq	outputHandleJustInCase(%rip), %rdi
	callq	fclose
	incl	EdgeProfCounters+5788(%rip)
	jmp	.LBB33_13
.LBB33_11:                              # %if.end.if.end13_crit_edge
	incl	EdgeProfCounters+5784(%rip)
.LBB33_13:                              # %if.end13
	movl	$outName, %edi
	callq	remove
	movl	%eax, 144(%rsp)
	testl	%eax, %eax
	je	.LBB33_14
# BB#15:                                # %if.then17
	incl	EdgeProfCounters+5792(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str59, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+5800(%rip)
	incl	EdgeProfCounters+5804(%rip)
	jmp	.LBB33_17
.LBB33_14:                              # %if.end13.if.end19_crit_edge
	incl	EdgeProfCounters+5796(%rip)
	incl	EdgeProfCounters+5804(%rip)
.LBB33_17:                              # %if.end24
	incl	EdgeProfCounters+5812(%rip)
.LBB33_18:                              # %if.end25
	cmpb	$0, noisy(%rip)
	je	.LBB33_19
# BB#20:                                # %land.lhs.true28
	incl	EdgeProfCounters+5816(%rip)
	cmpl	$0, numFileNames(%rip)
	jle	.LBB33_21
# BB#22:                                # %land.lhs.true31
	incl	EdgeProfCounters+5824(%rip)
	movl	numFilesProcessed(%rip), %eax
	cmpl	numFileNames(%rip), %eax
	jge	.LBB33_23
# BB#24:                                # %if.then34
	incl	EdgeProfCounters+5832(%rip)
	movl	numFileNames(%rip), %r8d
	movl	%r8d, %r9d
	subl	numFilesProcessed(%rip), %r9d
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str64, %esi
	movq	%rdx, %rcx
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+5840(%rip)
	jmp	.LBB33_25
.LBB33_19:                              # %if.end25.if.end36_crit_edge
	incl	EdgeProfCounters+5820(%rip)
	jmp	.LBB33_25
.LBB33_21:                              # %land.lhs.true28.if.end36_crit_edge
	incl	EdgeProfCounters+5828(%rip)
	jmp	.LBB33_25
.LBB33_23:                              # %land.lhs.true31.if.end36_crit_edge
	incl	EdgeProfCounters+5836(%rip)
.LBB33_25:                              # %if.end36
	movl	148(%rsp), %edi
	callq	setExit
	movl	exitValue(%rip), %edi
	callq	exit
	addq	$152, %rsp
	ret
.Ltmp150:
	.size	cleanUpAndFail, .Ltmp150-cleanUpAndFail
	.cfi_endproc

	.align	16, 0x90
	.type	mapSuffix,@function
mapSuffix:                              # @mapSuffix
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp153:
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
.Ltmp154:
	.cfi_def_cfa_offset 48
.Ltmp155:
	.cfi_offset %rbx, -16
	incl	EdgeProfCounters+5844(%rip)
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rdx, (%rsp)
	movq	8(%rsp), %rsi
	movq	16(%rsp), %rdi
	callq	hasSuffix
	testb	%al, %al
	je	.LBB34_1
# BB#2:                                 # %if.end
	incl	EdgeProfCounters+5848(%rip)
	movq	16(%rsp), %rdi
	callq	strlen
	movq	%rax, %rbx
	movq	8(%rsp), %rdi
	callq	strlen
	subq	%rax, %rbx
	movq	16(%rsp), %rax
	movb	$0, (%rax,%rbx)
	movq	(%rsp), %rsi
	movq	16(%rsp), %rdi
	callq	strcat
	movb	$1, 31(%rsp)
	incl	EdgeProfCounters+5860(%rip)
	jmp	.LBB34_3
.LBB34_1:                               # %if.then
	incl	EdgeProfCounters+5852(%rip)
	movb	$0, 31(%rsp)
	incl	EdgeProfCounters+5856(%rip)
.LBB34_3:                               # %return
	movzbl	31(%rsp), %eax
	addq	$32, %rsp
	popq	%rbx
	ret
.Ltmp156:
	.size	mapSuffix, .Ltmp156-mapSuffix
	.cfi_endproc

	.align	16, 0x90
	.type	notAStandardFile,@function
notAStandardFile:                       # @notAStandardFile
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$168, %rsp
.Ltmp158:
	.cfi_def_cfa_offset 176
	incl	EdgeProfCounters+5864(%rip)
	movq	%rdi, 152(%rsp)
	leaq	(%rsp), %rsi
	callq	lstat
	movl	%eax, 148(%rsp)
	testl	%eax, %eax
	je	.LBB35_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+5868(%rip)
	movb	$1, 167(%rsp)
	incl	EdgeProfCounters+5876(%rip)
	jmp	.LBB35_5
.LBB35_2:                               # %if.end
	incl	EdgeProfCounters+5872(%rip)
	movl	$61440, %eax            # imm = 0xF000
	andl	24(%rsp), %eax
	cmpl	$32768, %eax            # imm = 0x8000
	jne	.LBB35_4
# BB#3:                                 # %if.then2
	incl	EdgeProfCounters+5880(%rip)
	movb	$0, 167(%rsp)
	incl	EdgeProfCounters+5888(%rip)
	jmp	.LBB35_5
.LBB35_4:                               # %if.end3
	incl	EdgeProfCounters+5884(%rip)
	movb	$1, 167(%rsp)
	incl	EdgeProfCounters+5892(%rip)
.LBB35_5:                               # %return
	movzbl	167(%rsp), %eax
	addq	$168, %rsp
	ret
.Ltmp159:
	.size	notAStandardFile, .Ltmp159-notAStandardFile
	.cfi_endproc

	.align	16, 0x90
	.type	countHardLinks,@function
countHardLinks:                         # @countHardLinks
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$168, %rsp
.Ltmp161:
	.cfi_def_cfa_offset 176
	incl	EdgeProfCounters+5896(%rip)
	movq	%rdi, 152(%rsp)
	leaq	(%rsp), %rsi
	callq	lstat
	movl	%eax, 148(%rsp)
	testl	%eax, %eax
	je	.LBB36_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+5900(%rip)
	movl	$0, 164(%rsp)
	incl	EdgeProfCounters+5908(%rip)
	jmp	.LBB36_3
.LBB36_2:                               # %if.end
	incl	EdgeProfCounters+5904(%rip)
	movl	16(%rsp), %eax
	decl	%eax
	movl	%eax, 164(%rsp)
	incl	EdgeProfCounters+5912(%rip)
.LBB36_3:                               # %return
	movl	164(%rsp), %eax
	addq	$168, %rsp
	ret
.Ltmp162:
	.size	countHardLinks, .Ltmp162-countHardLinks
	.cfi_endproc

	.align	16, 0x90
	.type	saveInputFileMetaInfo,@function
saveInputFileMetaInfo:                  # @saveInputFileMetaInfo
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp164:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+5916(%rip)
	movq	%rdi, 16(%rsp)
	movl	$fileMetaInfo, %esi
	callq	stat
	movl	%eax, 12(%rsp)
	testl	%eax, %eax
	je	.LBB37_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+5920(%rip)
	callq	ioError
	incl	EdgeProfCounters+5928(%rip)
	addq	$24, %rsp
	ret
.LBB37_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+5924(%rip)
	addq	$24, %rsp
	ret
.Ltmp165:
	.size	saveInputFileMetaInfo, .Ltmp165-saveInputFileMetaInfo
	.cfi_endproc

	.align	16, 0x90
	.type	uncompressStream,@function
uncompressStream:                       # @uncompressStream
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp172:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp173:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp174:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp175:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp176:
	.cfi_def_cfa_offset 48
	subq	$10096, %rsp            # imm = 0x2770
.Ltmp177:
	.cfi_def_cfa_offset 10144
.Ltmp178:
	.cfi_offset %rbx, -48
.Ltmp179:
	.cfi_offset %r12, -40
.Ltmp180:
	.cfi_offset %r13, -32
.Ltmp181:
	.cfi_offset %r14, -24
.Ltmp182:
	.cfi_offset %r15, -16
	incl	EdgeProfCounters+5932(%rip)
	movq	%rdi, 10080(%rsp)
	movq	%rsi, 10072(%rsp)
	movq	$0, 10064(%rsp)
	movl	$0, 28(%rsp)
	movl	$0, 10044(%rsp)
	movq	10072(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB38_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+5936(%rip)
	incl	EdgeProfCounters+5944(%rip)
	jmp	.LBB38_76
.LBB38_2:                               # %if.end
	incl	EdgeProfCounters+5940(%rip)
	movq	10080(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB38_4
# BB#3:                                 # %if.then3
	incl	EdgeProfCounters+5948(%rip)
	incl	EdgeProfCounters+5956(%rip)
	jmp	.LBB38_76
.LBB38_4:                               # %if.end4
	incl	EdgeProfCounters+5952(%rip)
	incl	EdgeProfCounters+5960(%rip)
	leaq	10060(%rsp), %r15
	leaq	32(%rsp), %r14
	leaq	5040(%rsp), %rbx
	leaq	16(%rsp), %r12
	leaq	28(%rsp), %r13
	jmp	.LBB38_5
.LBB38_35:                              # %if.end53.if.end61_crit_edge
                                        #   in Loop: Header=BB38_5 Depth=1
	incl	EdgeProfCounters+6112(%rip)
	incl	EdgeProfCounters+6128(%rip)
	.align	16, 0x90
.LBB38_5:                               # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB38_10 Depth 2
                                        #     Child Loop BB38_29 Depth 2
	movl	28(%rsp), %r9d
	movzbl	smallMode(%rip), %ecx
	movl	verbosity(%rip), %edx
	movq	10080(%rsp), %rsi
	movq	%r15, %rdi
	movq	%r14, %r8
	callq	BZ2_bzReadOpen
	movq	%rax, 10064(%rsp)
	testq	%rax, %rax
	je	.LBB38_6
# BB#7:                                 # %lor.lhs.false
                                        #   in Loop: Header=BB38_5 Depth=1
	incl	EdgeProfCounters+5968(%rip)
	cmpl	$0, 10060(%rsp)
	jne	.LBB38_8
# BB#9:                                 # %if.end10
                                        #   in Loop: Header=BB38_5 Depth=1
	incl	EdgeProfCounters+5976(%rip)
	incl	10044(%rsp)
	incl	EdgeProfCounters+5984(%rip)
	jmp	.LBB38_10
	.align	16, 0x90
.LBB38_22:                              # %if.end36
                                        #   in Loop: Header=BB38_10 Depth=2
	incl	EdgeProfCounters+6040(%rip)
	incl	EdgeProfCounters+6048(%rip)
.LBB38_10:                              # %while.cond11
                                        #   Parent Loop BB38_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 10060(%rsp)
	jne	.LBB38_23
# BB#11:                                # %while.body14
                                        #   in Loop: Header=BB38_10 Depth=2
	incl	EdgeProfCounters+5988(%rip)
	movq	10064(%rsp), %rsi
	movq	%r15, %rdi
	movq	%rbx, %rdx
	movl	$5000, %ecx             # imm = 0x1388
	callq	BZ2_bzRead
	movl	%eax, 10048(%rsp)
	cmpl	$-5, 10060(%rsp)
	je	.LBB38_56
# BB#12:                                # %if.end20
                                        #   in Loop: Header=BB38_10 Depth=2
	incl	EdgeProfCounters+6000(%rip)
	cmpl	$0, 10060(%rsp)
	jne	.LBB38_14
# BB#13:                                # %if.end20.land.lhs.true_crit_edge
                                        #   in Loop: Header=BB38_10 Depth=2
	incl	EdgeProfCounters+6008(%rip)
	jmp	.LBB38_17
	.align	16, 0x90
.LBB38_14:                              # %lor.lhs.false23
                                        #   in Loop: Header=BB38_10 Depth=2
	incl	EdgeProfCounters+6012(%rip)
	cmpl	$4, 10060(%rsp)
	jne	.LBB38_15
# BB#16:                                # %lor.lhs.false23.land.lhs.true_crit_edge
                                        #   in Loop: Header=BB38_10 Depth=2
	incl	EdgeProfCounters+6016(%rip)
.LBB38_17:                              # %land.lhs.true
                                        #   in Loop: Header=BB38_10 Depth=2
	cmpl	$0, 10048(%rsp)
	jle	.LBB38_18
# BB#19:                                # %if.then28
                                        #   in Loop: Header=BB38_10 Depth=2
	incl	EdgeProfCounters+6024(%rip)
	movq	10072(%rsp), %rcx
	movslq	10048(%rsp), %rdx
	movq	%rbx, %rdi
	movl	$1, %esi
	callq	fwrite
	incl	EdgeProfCounters+6032(%rip)
	jmp	.LBB38_20
	.align	16, 0x90
.LBB38_18:                              # %land.lhs.true.if.end32_crit_edge
                                        #   in Loop: Header=BB38_10 Depth=2
	incl	EdgeProfCounters+6028(%rip)
	jmp	.LBB38_20
	.align	16, 0x90
.LBB38_15:                              # %lor.lhs.false23.if.end32_crit_edge
                                        #   in Loop: Header=BB38_10 Depth=2
	incl	EdgeProfCounters+6020(%rip)
.LBB38_20:                              # %if.end32
                                        #   in Loop: Header=BB38_10 Depth=2
	movq	10072(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB38_22
	jmp	.LBB38_21
.LBB38_23:                              # %while.end
                                        #   in Loop: Header=BB38_5 Depth=1
	incl	EdgeProfCounters+5992(%rip)
	cmpl	$4, 10060(%rsp)
	jne	.LBB38_24
# BB#25:                                # %if.end40
                                        #   in Loop: Header=BB38_5 Depth=1
	incl	EdgeProfCounters+6056(%rip)
	movq	10064(%rsp), %rsi
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r13, %rcx
	callq	BZ2_bzReadGetUnused
	cmpl	$0, 10060(%rsp)
	je	.LBB38_26
# BB#27:                                # %if.then43
                                        #   in Loop: Header=BB38_5 Depth=1
	incl	EdgeProfCounters+6064(%rip)
	movl	$.L.str85, %edi
	callq	panic
	incl	EdgeProfCounters+6072(%rip)
	jmp	.LBB38_28
.LBB38_26:                              # %if.end40.if.end44_crit_edge
                                        #   in Loop: Header=BB38_5 Depth=1
	incl	EdgeProfCounters+6068(%rip)
.LBB38_28:                              # %if.end44
                                        #   in Loop: Header=BB38_5 Depth=1
	movq	16(%rsp), %rax
	movq	%rax, 8(%rsp)
	movl	$0, 10040(%rsp)
	incl	EdgeProfCounters+6076(%rip)
	jmp	.LBB38_29
	.align	16, 0x90
.LBB38_30:                              # %for.inc
                                        #   in Loop: Header=BB38_29 Depth=2
	incl	EdgeProfCounters+6080(%rip)
	movslq	10040(%rsp), %rax
	movq	8(%rsp), %rcx
	movb	(%rcx,%rax), %cl
	movb	%cl, 32(%rsp,%rax)
	incl	EdgeProfCounters+6088(%rip)
	incl	10040(%rsp)
	incl	EdgeProfCounters+6092(%rip)
.LBB38_29:                              # %for.cond
                                        #   Parent Loop BB38_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	10040(%rsp), %eax
	cmpl	28(%rsp), %eax
	jl	.LBB38_30
# BB#31:                                # %for.end
                                        #   in Loop: Header=BB38_5 Depth=1
	incl	EdgeProfCounters+6084(%rip)
	movq	10064(%rsp), %rsi
	movq	%r15, %rdi
	callq	BZ2_bzReadClose
	cmpl	$0, 10060(%rsp)
	je	.LBB38_32
# BB#33:                                # %if.then52
                                        #   in Loop: Header=BB38_5 Depth=1
	incl	EdgeProfCounters+6096(%rip)
	movl	$.L.str85, %edi
	callq	panic
	incl	EdgeProfCounters+6104(%rip)
	jmp	.LBB38_34
.LBB38_32:                              # %for.end.if.end53_crit_edge
                                        #   in Loop: Header=BB38_5 Depth=1
	incl	EdgeProfCounters+6100(%rip)
.LBB38_34:                              # %if.end53
                                        #   in Loop: Header=BB38_5 Depth=1
	cmpl	$0, 28(%rsp)
	jne	.LBB38_35
# BB#36:                                # %land.lhs.true56
                                        #   in Loop: Header=BB38_5 Depth=1
	incl	EdgeProfCounters+6108(%rip)
	movq	10080(%rsp), %rdi
	callq	myfeof
	testb	%al, %al
	jne	.LBB38_38
# BB#37:                                # %land.lhs.true56.if.end61_crit_edge
                                        #   in Loop: Header=BB38_5 Depth=1
	incl	EdgeProfCounters+6120(%rip)
	incl	EdgeProfCounters+6128(%rip)
	jmp	.LBB38_5
.LBB38_56:                              # %trycat
	incl	EdgeProfCounters+5996(%rip)
	incl	EdgeProfCounters+6004(%rip)
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB38_68
# BB#57:                                # %if.then96
	incl	EdgeProfCounters+6224(%rip)
	movq	10080(%rsp), %rdi
	callq	rewind
	incl	EdgeProfCounters+6232(%rip)
	leaq	5040(%rsp), %rbx
	jmp	.LBB38_58
	.align	16, 0x90
.LBB38_66:                              # %if.end119
                                        #   in Loop: Header=BB38_58 Depth=1
	incl	EdgeProfCounters+6276(%rip)
	incl	EdgeProfCounters+6284(%rip)
.LBB38_58:                              # %while.body97
                                        # =>This Inner Loop Header: Depth=1
	movq	10080(%rsp), %rdi
	callq	myfeof
	testb	%al, %al
	jne	.LBB38_67
# BB#59:                                # %if.end101
                                        #   in Loop: Header=BB38_58 Depth=1
	incl	EdgeProfCounters+6240(%rip)
	movq	10080(%rsp), %rcx
	movq	%rbx, %rdi
	movl	$1, %esi
	movl	$5000, %edx             # imm = 0x1388
	callq	fread
	movl	%eax, 10048(%rsp)
	movq	10080(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB38_60
# BB#61:                                # %if.end108
                                        #   in Loop: Header=BB38_58 Depth=1
	incl	EdgeProfCounters+6252(%rip)
	cmpl	$0, 10048(%rsp)
	jle	.LBB38_62
# BB#63:                                # %if.then111
                                        #   in Loop: Header=BB38_58 Depth=1
	incl	EdgeProfCounters+6260(%rip)
	movq	10072(%rsp), %rcx
	movslq	10048(%rsp), %rdx
	movq	%rbx, %rdi
	movl	$1, %esi
	callq	fwrite
	incl	EdgeProfCounters+6268(%rip)
	jmp	.LBB38_64
.LBB38_62:                              # %if.end108.if.end115_crit_edge
                                        #   in Loop: Header=BB38_58 Depth=1
	incl	EdgeProfCounters+6264(%rip)
.LBB38_64:                              # %if.end115
                                        #   in Loop: Header=BB38_58 Depth=1
	movq	10072(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB38_66
# BB#65:                                # %if.then118
	incl	EdgeProfCounters+6272(%rip)
	incl	EdgeProfCounters+6280(%rip)
	jmp	.LBB38_76
.LBB38_21:                              # %if.then35
	incl	EdgeProfCounters+6036(%rip)
	incl	EdgeProfCounters+6044(%rip)
	jmp	.LBB38_76
.LBB38_68:                              # %if.end121
	incl	EdgeProfCounters+6228(%rip)
	incl	EdgeProfCounters+6292(%rip)
	jmp	.LBB38_69
.LBB38_67:                              # %while.end120
	incl	EdgeProfCounters+6236(%rip)
	incl	EdgeProfCounters+6244(%rip)
	incl	EdgeProfCounters+6288(%rip)
.LBB38_39:                              # %closeok
	movq	10080(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB38_41
# BB#40:                                # %if.then65
	incl	EdgeProfCounters+6136(%rip)
	incl	EdgeProfCounters+6144(%rip)
	jmp	.LBB38_76
.LBB38_60:                              # %if.then107
	incl	EdgeProfCounters+6248(%rip)
	incl	EdgeProfCounters+6256(%rip)
	jmp	.LBB38_76
.LBB38_6:                               # %while.body.if.then9_crit_edge
	incl	EdgeProfCounters+5964(%rip)
	incl	EdgeProfCounters+5980(%rip)
	jmp	.LBB38_69
.LBB38_8:                               # %lor.lhs.false.if.then9_crit_edge
	incl	EdgeProfCounters+5972(%rip)
	incl	EdgeProfCounters+5980(%rip)
	jmp	.LBB38_69
.LBB38_41:                              # %if.end66
	incl	EdgeProfCounters+6140(%rip)
	movq	10080(%rsp), %rdi
	callq	fclose
	movl	%eax, 10052(%rsp)
	cmpl	$-1, %eax
	jne	.LBB38_43
# BB#42:                                # %if.then70
	incl	EdgeProfCounters+6148(%rip)
	incl	EdgeProfCounters+6156(%rip)
	jmp	.LBB38_76
.LBB38_24:                              # %if.then39
	incl	EdgeProfCounters+6052(%rip)
	incl	EdgeProfCounters+6060(%rip)
.LBB38_69:                              # %errhandler
	movq	10064(%rsp), %rsi
	leaq	10056(%rsp), %rdi
	callq	BZ2_bzReadClose
	movl	10060(%rsp), %eax
	addl	$9, %eax
	cmpl	$6, %eax
	ja	.LBB38_92
# BB#70:                                # %errhandler
	jmpq	*.LJTI38_0(,%rax,8)
.LBB38_74:                              # %sw.bb
	incl	EdgeProfCounters+6300(%rip)
	callq	configError
	incl	EdgeProfCounters+6324(%rip)
	jmp	.LBB38_93
.LBB38_92:                              # %sw.default
	incl	EdgeProfCounters+6296(%rip)
	movl	$.L.str87, %edi
	callq	panic
	incl	EdgeProfCounters+6400(%rip)
	jmp	.LBB38_93
.LBB38_43:                              # %if.end71
	incl	EdgeProfCounters+6152(%rip)
	movq	10072(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB38_45
# BB#44:                                # %if.then74
	incl	EdgeProfCounters+6160(%rip)
	incl	EdgeProfCounters+6168(%rip)
	jmp	.LBB38_76
.LBB38_72:                              # %errhandler.sw.bb125_crit_edge
	incl	EdgeProfCounters+6316(%rip)
	jmp	.LBB38_79
.LBB38_75:                              # %sw.bb122
	incl	EdgeProfCounters+6304(%rip)
	incl	EdgeProfCounters+6328(%rip)
	jmp	.LBB38_76
.LBB38_71:                              # %errhandler.sw.bb126_crit_edge
	incl	EdgeProfCounters+6320(%rip)
	jmp	.LBB38_80
.LBB38_77:                              # %sw.bb123
	incl	EdgeProfCounters+6308(%rip)
	callq	crcError
	incl	EdgeProfCounters+6336(%rip)
	jmp	.LBB38_78
.LBB38_73:                              # %errhandler.sw.bb124_crit_edge
	incl	EdgeProfCounters+6312(%rip)
.LBB38_78:                              # %sw.bb124
	callq	outOfMemory
	incl	EdgeProfCounters+6340(%rip)
.LBB38_79:                              # %sw.bb125
	callq	compressedStreamEOF
	incl	EdgeProfCounters+6344(%rip)
.LBB38_80:                              # %sw.bb126
	movq	10080(%rsp), %rax
	cmpq	stdin(%rip), %rax
	je	.LBB38_81
# BB#82:                                # %if.then129
	incl	EdgeProfCounters+6348(%rip)
	movq	10080(%rsp), %rdi
	callq	fclose
	incl	EdgeProfCounters+6356(%rip)
	jmp	.LBB38_83
.LBB38_81:                              # %sw.bb126.if.end131_crit_edge
	incl	EdgeProfCounters+6352(%rip)
.LBB38_83:                              # %if.end131
	movq	10072(%rsp), %rax
	cmpq	stdout(%rip), %rax
	je	.LBB38_84
# BB#85:                                # %if.then134
	incl	EdgeProfCounters+6360(%rip)
	movq	10072(%rsp), %rdi
	callq	fclose
	incl	EdgeProfCounters+6368(%rip)
	jmp	.LBB38_86
.LBB38_84:                              # %if.end131.if.end136_crit_edge
	incl	EdgeProfCounters+6364(%rip)
.LBB38_86:                              # %if.end136
	cmpl	$1, 10044(%rsp)
	jne	.LBB38_88
# BB#87:                                # %if.then139
	incl	EdgeProfCounters+6372(%rip)
	movb	$0, 10095(%rsp)
	incl	EdgeProfCounters+6380(%rip)
	jmp	.LBB38_94
.LBB38_88:                              # %if.else
	incl	EdgeProfCounters+6376(%rip)
	cmpb	$0, noisy(%rip)
	je	.LBB38_89
# BB#90:                                # %if.then141
	incl	EdgeProfCounters+6384(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str86, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+6392(%rip)
	jmp	.LBB38_91
.LBB38_89:                              # %if.else.if.end143_crit_edge
	incl	EdgeProfCounters+6388(%rip)
.LBB38_91:                              # %if.end143
	movb	$1, 10095(%rsp)
	incl	EdgeProfCounters+6396(%rip)
	jmp	.LBB38_94
.LBB38_38:                              # %while.end62
	incl	EdgeProfCounters+6116(%rip)
	incl	EdgeProfCounters+6124(%rip)
	incl	EdgeProfCounters+6132(%rip)
	jmp	.LBB38_39
.LBB38_45:                              # %if.end75
	incl	EdgeProfCounters+6164(%rip)
	movq	10072(%rsp), %rdi
	callq	fflush
	movl	%eax, 10052(%rsp)
	testl	%eax, %eax
	je	.LBB38_47
# BB#46:                                # %if.then79
	incl	EdgeProfCounters+6172(%rip)
	incl	EdgeProfCounters+6180(%rip)
	jmp	.LBB38_76
.LBB38_47:                              # %if.end80
	incl	EdgeProfCounters+6176(%rip)
	movq	10072(%rsp), %rax
	cmpq	stdout(%rip), %rax
	je	.LBB38_48
# BB#49:                                # %if.then83
	incl	EdgeProfCounters+6184(%rip)
	movq	10072(%rsp), %rdi
	callq	fclose
	movl	%eax, 10052(%rsp)
	movq	$0, outputHandleJustInCase(%rip)
	cmpl	$-1, 10052(%rsp)
	jne	.LBB38_51
# BB#50:                                # %if.then87
	incl	EdgeProfCounters+6192(%rip)
	incl	EdgeProfCounters+6200(%rip)
.LBB38_76:                              # %errhandler_io
	callq	ioError
	incl	EdgeProfCounters+6332(%rip)
.LBB38_93:                              # %sw.epilog
	movl	$.L.str88, %edi
	callq	panic
	movb	$1, 10095(%rsp)
	incl	EdgeProfCounters+6404(%rip)
.LBB38_94:                              # %return
	movzbl	10095(%rsp), %eax
	addq	$10096, %rsp            # imm = 0x2770
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.LBB38_48:                              # %if.end80.if.end89_crit_edge
	incl	EdgeProfCounters+6188(%rip)
	jmp	.LBB38_52
.LBB38_51:                              # %if.end88
	incl	EdgeProfCounters+6196(%rip)
	incl	EdgeProfCounters+6204(%rip)
.LBB38_52:                              # %if.end89
	movq	$0, outputHandleJustInCase(%rip)
	cmpl	$1, verbosity(%rip)
	jle	.LBB38_53
# BB#54:                                # %if.then92
	incl	EdgeProfCounters+6208(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str49, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+6216(%rip)
	jmp	.LBB38_55
.LBB38_53:                              # %if.end89.if.end94_crit_edge
	incl	EdgeProfCounters+6212(%rip)
.LBB38_55:                              # %if.end94
	movb	$1, 10095(%rsp)
	incl	EdgeProfCounters+6220(%rip)
	jmp	.LBB38_94
.Ltmp183:
	.size	uncompressStream, .Ltmp183-uncompressStream
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI38_0:
	.quad	.LBB38_74
	.quad	.LBB38_92
	.quad	.LBB38_72
	.quad	.LBB38_75
	.quad	.LBB38_71
	.quad	.LBB38_77
	.quad	.LBB38_73

	.text
	.align	16, 0x90
	.type	applySavedMetaInfoToOutputFile,@function
applySavedMetaInfoToOutputFile:         # @applySavedMetaInfoToOutputFile
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp185:
	.cfi_def_cfa_offset 48
	incl	EdgeProfCounters+6408(%rip)
	movq	%rdi, 32(%rsp)
	movq	fileMetaInfo+72(%rip), %rax
	movq	%rax, 8(%rsp)
	movq	fileMetaInfo+88(%rip), %rax
	movq	%rax, 16(%rsp)
	movl	fileMetaInfo+24(%rip), %esi
	movq	32(%rsp), %rdi
	callq	chmod
	movl	%eax, 28(%rsp)
	testl	%eax, %eax
	je	.LBB39_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+6412(%rip)
	callq	ioError
	incl	EdgeProfCounters+6420(%rip)
	jmp	.LBB39_3
.LBB39_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+6416(%rip)
.LBB39_3:                               # %if.end
	movq	32(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	utime
	movl	%eax, 28(%rsp)
	testl	%eax, %eax
	je	.LBB39_4
# BB#5:                                 # %if.then3
	incl	EdgeProfCounters+6424(%rip)
	callq	ioError
	incl	EdgeProfCounters+6432(%rip)
	jmp	.LBB39_6
.LBB39_4:                               # %if.end.if.end4_crit_edge
	incl	EdgeProfCounters+6428(%rip)
.LBB39_6:                               # %if.end4
	movl	fileMetaInfo+32(%rip), %edx
	movl	fileMetaInfo+28(%rip), %esi
	movq	32(%rsp), %rdi
	callq	chown
	movl	%eax, 28(%rsp)
	addq	$40, %rsp
	ret
.Ltmp186:
	.size	applySavedMetaInfoToOutputFile, .Ltmp186-applySavedMetaInfoToOutputFile
	.cfi_endproc

	.align	16, 0x90
	.type	crcError,@function
crcError:                               # @crcError
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp188:
	.cfi_def_cfa_offset 16
	incl	EdgeProfCounters+6436(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str91, %esi
	xorb	%al, %al
	callq	fprintf
	callq	showFileNames
	callq	cadvise
	movl	$2, %edi
	callq	cleanUpAndFail
	popq	%rax
	ret
.Ltmp189:
	.size	crcError, .Ltmp189-crcError
	.cfi_endproc

	.align	16, 0x90
	.type	compressedStreamEOF,@function
compressedStreamEOF:                    # @compressedStreamEOF
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp191:
	.cfi_def_cfa_offset 16
	incl	EdgeProfCounters+6440(%rip)
	cmpb	$0, noisy(%rip)
	je	.LBB41_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+6444(%rip)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str89, %esi
	xorb	%al, %al
	callq	fprintf
	movq	progName(%rip), %rdi
	callq	perror
	callq	showFileNames
	callq	cadvise
	incl	EdgeProfCounters+6452(%rip)
	jmp	.LBB41_3
.LBB41_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+6448(%rip)
.LBB41_3:                               # %if.end
	movl	$2, %edi
	callq	cleanUpAndFail
	popq	%rax
	ret
.Ltmp192:
	.size	compressedStreamEOF, .Ltmp192-compressedStreamEOF
	.cfi_endproc

	.align	16, 0x90
	.type	cadvise,@function
cadvise:                                # @cadvise
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp194:
	.cfi_def_cfa_offset 16
	incl	EdgeProfCounters+6456(%rip)
	cmpb	$0, noisy(%rip)
	je	.LBB42_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+6460(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str90, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+6468(%rip)
	popq	%rax
	ret
.LBB42_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+6464(%rip)
	popq	%rax
	ret
.Ltmp195:
	.size	cadvise, .Ltmp195-cadvise
	.cfi_endproc

	.align	16, 0x90
	.type	hasSuffix,@function
hasSuffix:                              # @hasSuffix
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp197:
	.cfi_def_cfa_offset 48
	incl	EdgeProfCounters+6472(%rip)
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	24(%rsp), %rdi
	callq	strlen
	movl	%eax, 12(%rsp)
	movq	16(%rsp), %rdi
	callq	strlen
	movl	%eax, 8(%rsp)
	cmpl	%eax, 12(%rsp)
	jge	.LBB43_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+6476(%rip)
	movb	$0, 39(%rsp)
	incl	EdgeProfCounters+6484(%rip)
	jmp	.LBB43_5
.LBB43_2:                               # %if.end
	incl	EdgeProfCounters+6480(%rip)
	movslq	12(%rsp), %rdi
	addq	24(%rsp), %rdi
	movslq	8(%rsp), %rax
	subq	%rax, %rdi
	movq	16(%rsp), %rsi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB43_3
# BB#4:                                 # %if.end10
	incl	EdgeProfCounters+6492(%rip)
	movb	$0, 39(%rsp)
	incl	EdgeProfCounters+6500(%rip)
	jmp	.LBB43_5
.LBB43_3:                               # %if.then9
	incl	EdgeProfCounters+6488(%rip)
	movb	$1, 39(%rsp)
	incl	EdgeProfCounters+6496(%rip)
.LBB43_5:                               # %return
	movzbl	39(%rsp), %eax
	addq	$40, %rsp
	ret
.Ltmp198:
	.size	hasSuffix, .Ltmp198-hasSuffix
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI44_0:
	.quad	4607182418800017408     # double 1.000000e+00
                                        #  (0x3ff0000000000000)
.LCPI44_1:
	.quad	4620693217682128896     # double 8.000000e+00
                                        #  (0x4020000000000000)
.LCPI44_2:
	.quad	4636737291354636288     # double 1.000000e+02
                                        #  (0x4059000000000000)
	.text
	.align	16, 0x90
	.type	compressStream,@function
compressStream:                         # @compressStream
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp203:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp204:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp205:
	.cfi_def_cfa_offset 32
	subq	$5168, %rsp             # imm = 0x1430
.Ltmp206:
	.cfi_def_cfa_offset 5200
.Ltmp207:
	.cfi_offset %rbx, -32
.Ltmp208:
	.cfi_offset %r14, -24
.Ltmp209:
	.cfi_offset %r15, -16
	incl	EdgeProfCounters+6504(%rip)
	movq	%rdi, 5160(%rsp)
	movq	%rsi, 5152(%rsp)
	movq	$0, 5144(%rsp)
	movq	5160(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB44_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+6508(%rip)
	incl	EdgeProfCounters+6516(%rip)
	jmp	.LBB44_48
.LBB44_2:                               # %if.end
	incl	EdgeProfCounters+6512(%rip)
	movq	5152(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB44_4
# BB#3:                                 # %if.then3
	incl	EdgeProfCounters+6520(%rip)
	incl	EdgeProfCounters+6528(%rip)
.LBB44_48:                              # %errhandler_io
	callq	ioError
	incl	EdgeProfCounters+6764(%rip)
.LBB44_50:                              # %sw.epilog
	movl	$.L.str100, %edi
	callq	panic
	incl	EdgeProfCounters+6772(%rip)
.LBB44_51:                              # %return
	addq	$5168, %rsp             # imm = 0x1430
	popq	%rbx
	popq	%r14
	popq	%r15
	ret
.LBB44_4:                               # %if.end4
	incl	EdgeProfCounters+6524(%rip)
	movl	workFactor(%rip), %r8d
	movl	verbosity(%rip), %ecx
	movl	blockSize100k(%rip), %edx
	movq	5152(%rsp), %rsi
	leaq	120(%rsp), %rdi
	callq	BZ2_bzWriteOpen
	movq	%rax, 5144(%rsp)
	cmpl	$0, 120(%rsp)
	je	.LBB44_6
# BB#5:                                 # %if.then6
	incl	EdgeProfCounters+6532(%rip)
	incl	EdgeProfCounters+6540(%rip)
.LBB44_18:                              # %errhandler
	movq	5144(%rsp), %rsi
	leaq	124(%rsp), %rax
	movq	%rax, (%rsp)
	leaq	116(%rsp), %rdi
	leaq	136(%rsp), %rcx
	leaq	132(%rsp), %r8
	leaq	128(%rsp), %r9
	movl	$1, %edx
	callq	BZ2_bzWriteClose64
	movl	120(%rsp), %eax
	cmpl	$-3, %eax
	je	.LBB44_46
# BB#19:                                # %errhandler
	cmpl	$-6, %eax
	jne	.LBB44_20
# BB#47:                                # %sw.bb83
	incl	EdgeProfCounters+6748(%rip)
	incl	EdgeProfCounters+6760(%rip)
	jmp	.LBB44_48
.LBB44_6:                               # %if.end7
	incl	EdgeProfCounters+6536(%rip)
	cmpl	$1, verbosity(%rip)
	jle	.LBB44_7
# BB#8:                                 # %if.then9
	incl	EdgeProfCounters+6544(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str96, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+6552(%rip)
	jmp	.LBB44_9
.LBB44_46:                              # %sw.bb82
	incl	EdgeProfCounters+6744(%rip)
	callq	outOfMemory
	incl	EdgeProfCounters+6756(%rip)
	jmp	.LBB44_50
.LBB44_20:                              # %errhandler
	cmpl	$-9, %eax
	jne	.LBB44_49
# BB#21:                                # %sw.bb
	incl	EdgeProfCounters+6740(%rip)
	callq	configError
	incl	EdgeProfCounters+6752(%rip)
	jmp	.LBB44_50
.LBB44_7:                               # %if.end7.if.end11_crit_edge
	incl	EdgeProfCounters+6548(%rip)
.LBB44_9:                               # %if.end11
	incl	EdgeProfCounters+6556(%rip)
	leaq	144(%rsp), %rbx
	leaq	120(%rsp), %r14
	jmp	.LBB44_10
	.align	16, 0x90
.LBB44_22:                              # %if.end29
                                        #   in Loop: Header=BB44_10 Depth=1
	incl	EdgeProfCounters+6600(%rip)
	incl	EdgeProfCounters+6608(%rip)
.LBB44_10:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	5160(%rsp), %rdi
	callq	myfeof
	testb	%al, %al
	jne	.LBB44_23
# BB#11:                                # %if.end15
                                        #   in Loop: Header=BB44_10 Depth=1
	incl	EdgeProfCounters+6564(%rip)
	movq	5160(%rsp), %rcx
	movq	%rbx, %rdi
	movl	$1, %esi
	movl	$5000, %edx             # imm = 0x1388
	callq	fread
	movl	%eax, 140(%rsp)
	movq	5160(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB44_12
# BB#13:                                # %if.end20
                                        #   in Loop: Header=BB44_10 Depth=1
	incl	EdgeProfCounters+6576(%rip)
	cmpl	$0, 140(%rsp)
	jle	.LBB44_14
# BB#15:                                # %if.then23
                                        #   in Loop: Header=BB44_10 Depth=1
	incl	EdgeProfCounters+6584(%rip)
	movl	140(%rsp), %ecx
	movq	5144(%rsp), %rsi
	movq	%r14, %rdi
	movq	%rbx, %rdx
	callq	BZ2_bzWrite
	incl	EdgeProfCounters+6592(%rip)
	jmp	.LBB44_16
	.align	16, 0x90
.LBB44_14:                              # %if.end20.if.end25_crit_edge
                                        #   in Loop: Header=BB44_10 Depth=1
	incl	EdgeProfCounters+6588(%rip)
.LBB44_16:                              # %if.end25
                                        #   in Loop: Header=BB44_10 Depth=1
	cmpl	$0, 120(%rsp)
	je	.LBB44_22
# BB#17:                                # %if.then28
	incl	EdgeProfCounters+6596(%rip)
	incl	EdgeProfCounters+6604(%rip)
	jmp	.LBB44_18
.LBB44_49:                              # %sw.default
	incl	EdgeProfCounters+6736(%rip)
	movl	$.L.str99, %edi
	callq	panic
	incl	EdgeProfCounters+6768(%rip)
	jmp	.LBB44_50
.LBB44_23:                              # %while.end
	incl	EdgeProfCounters+6560(%rip)
	incl	EdgeProfCounters+6568(%rip)
	movq	5144(%rsp), %rsi
	leaq	124(%rsp), %rax
	movq	%rax, (%rsp)
	leaq	120(%rsp), %rdi
	leaq	136(%rsp), %rcx
	leaq	132(%rsp), %r8
	leaq	128(%rsp), %r9
	xorl	%edx, %edx
	callq	BZ2_bzWriteClose64
	cmpl	$0, 120(%rsp)
	je	.LBB44_25
# BB#24:                                # %if.then32
	incl	EdgeProfCounters+6612(%rip)
	incl	EdgeProfCounters+6620(%rip)
	jmp	.LBB44_18
.LBB44_12:                              # %if.then19
	incl	EdgeProfCounters+6572(%rip)
	incl	EdgeProfCounters+6580(%rip)
	jmp	.LBB44_48
.LBB44_25:                              # %if.end33
	incl	EdgeProfCounters+6616(%rip)
	movq	5152(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB44_27
# BB#26:                                # %if.then36
	incl	EdgeProfCounters+6624(%rip)
	incl	EdgeProfCounters+6632(%rip)
	jmp	.LBB44_48
.LBB44_27:                              # %if.end37
	incl	EdgeProfCounters+6628(%rip)
	movq	5152(%rsp), %rdi
	callq	fflush
	movl	%eax, 112(%rsp)
	cmpl	$-1, %eax
	jne	.LBB44_29
# BB#28:                                # %if.then41
	incl	EdgeProfCounters+6636(%rip)
	incl	EdgeProfCounters+6644(%rip)
	jmp	.LBB44_48
.LBB44_29:                              # %if.end42
	incl	EdgeProfCounters+6640(%rip)
	movq	5152(%rsp), %rax
	cmpq	stdout(%rip), %rax
	je	.LBB44_30
# BB#31:                                # %if.then45
	incl	EdgeProfCounters+6648(%rip)
	movq	5152(%rsp), %rdi
	callq	fclose
	movl	%eax, 112(%rsp)
	movq	$0, outputHandleJustInCase(%rip)
	cmpl	$-1, 112(%rsp)
	jne	.LBB44_33
# BB#32:                                # %if.then49
	incl	EdgeProfCounters+6656(%rip)
	incl	EdgeProfCounters+6664(%rip)
	jmp	.LBB44_48
.LBB44_30:                              # %if.end42.if.end51_crit_edge
	incl	EdgeProfCounters+6652(%rip)
	jmp	.LBB44_34
.LBB44_33:                              # %if.end50
	incl	EdgeProfCounters+6660(%rip)
	incl	EdgeProfCounters+6668(%rip)
.LBB44_34:                              # %if.end51
	movq	$0, outputHandleJustInCase(%rip)
	movq	5160(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB44_36
# BB#35:                                # %if.then54
	incl	EdgeProfCounters+6672(%rip)
	incl	EdgeProfCounters+6680(%rip)
	jmp	.LBB44_48
.LBB44_36:                              # %if.end55
	incl	EdgeProfCounters+6676(%rip)
	movq	5160(%rsp), %rdi
	callq	fclose
	movl	%eax, 112(%rsp)
	cmpl	$-1, %eax
	jne	.LBB44_38
# BB#37:                                # %if.then59
	incl	EdgeProfCounters+6684(%rip)
	incl	EdgeProfCounters+6692(%rip)
	jmp	.LBB44_48
.LBB44_38:                              # %if.end60
	incl	EdgeProfCounters+6688(%rip)
	cmpl	$0, verbosity(%rip)
	jle	.LBB44_39
# BB#40:                                # %if.then63
	incl	EdgeProfCounters+6696(%rip)
	cmpl	$0, 136(%rsp)
	je	.LBB44_42
# BB#41:                                # %if.then63.if.else_crit_edge
	incl	EdgeProfCounters+6708(%rip)
	jmp	.LBB44_44
.LBB44_39:                              # %if.end60.if.end81_crit_edge
	incl	EdgeProfCounters+6700(%rip)
	incl	EdgeProfCounters+6732(%rip)
	jmp	.LBB44_51
.LBB44_42:                              # %land.lhs.true
	incl	EdgeProfCounters+6704(%rip)
	cmpl	$0, 132(%rsp)
	je	.LBB44_52
# BB#43:                                # %land.lhs.true.if.else_crit_edge
	incl	EdgeProfCounters+6716(%rip)
.LBB44_44:                              # %if.else
	movl	132(%rsp), %edx
	movl	136(%rsp), %esi
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	callq	uInt64_from_UInt32s
	movl	124(%rsp), %edx
	movl	128(%rsp), %esi
	leaq	32(%rsp), %rbx
	movq	%rbx, %rdi
	callq	uInt64_from_UInt32s
	movq	%r15, %rdi
	callq	uInt64_to_double
	movsd	%xmm0, 24(%rsp)
	movq	%rbx, %rdi
	callq	uInt64_to_double
	leaq	80(%rsp), %r14
	movsd	%xmm0, 16(%rsp)
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	uInt64_toAscii
	leaq	48(%rsp), %r15
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	uInt64_toAscii
	movsd	.LCPI44_0(%rip), %xmm2
	movsd	16(%rsp), %xmm3
	movsd	24(%rsp), %xmm4
	movaps	%xmm4, %xmm0
	divsd	%xmm3, %xmm0
	movsd	.LCPI44_1(%rip), %xmm1
	mulsd	%xmm3, %xmm1
	divsd	%xmm4, %xmm1
	divsd	%xmm4, %xmm3
	movq	stderr(%rip), %rdi
	subsd	%xmm3, %xmm2
	mulsd	.LCPI44_2(%rip), %xmm2
	movl	$.L.str98, %esi
	movq	%r14, %rdx
	movq	%r15, %rcx
	movb	$3, %al
	callq	fprintf
	incl	EdgeProfCounters+6724(%rip)
	jmp	.LBB44_45
.LBB44_52:                              # %if.then68
	incl	EdgeProfCounters+6712(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str97, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+6720(%rip)
.LBB44_45:                              # %if.end80
	incl	EdgeProfCounters+6728(%rip)
	incl	EdgeProfCounters+6732(%rip)
	jmp	.LBB44_51
.Ltmp210:
	.size	compressStream, .Ltmp210-compressStream
	.cfi_endproc

	.align	16, 0x90
	.type	uInt64_from_UInt32s,@function
uInt64_from_UInt32s:                    # @uInt64_from_UInt32s
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+6776(%rip)
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movl	%edx, -16(%rsp)
	movq	-8(%rsp), %rax
	movb	-13(%rsp), %cl
	movb	%cl, 7(%rax)
	movq	-8(%rsp), %rax
	movb	-14(%rsp), %cl
	movb	%cl, 6(%rax)
	movq	-8(%rsp), %rax
	movb	-15(%rsp), %cl
	movb	%cl, 5(%rax)
	movq	-8(%rsp), %rax
	movb	-16(%rsp), %cl
	movb	%cl, 4(%rax)
	movq	-8(%rsp), %rax
	movb	-9(%rsp), %cl
	movb	%cl, 3(%rax)
	movq	-8(%rsp), %rax
	movb	-10(%rsp), %cl
	movb	%cl, 2(%rax)
	movq	-8(%rsp), %rax
	movb	-11(%rsp), %cl
	movb	%cl, 1(%rax)
	movq	-8(%rsp), %rax
	movb	-12(%rsp), %cl
	movb	%cl, (%rax)
	ret
.Ltmp211:
	.size	uInt64_from_UInt32s, .Ltmp211-uInt64_from_UInt32s
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI46_0:
	.quad	4643211215818981376     # double 2.560000e+02
                                        #  (0x4070000000000000)
	.text
	.align	16, 0x90
	.type	uInt64_to_double,@function
uInt64_to_double:                       # @uInt64_to_double
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+6780(%rip)
	movq	%rdi, -8(%rsp)
	movabsq	$4607182418800017408, %rax # imm = 0x3FF0000000000000
	movq	%rax, -24(%rsp)
	movq	$0, -32(%rsp)
	movl	$0, -12(%rsp)
	incl	EdgeProfCounters+6784(%rip)
	movsd	.LCPI46_0(%rip), %xmm0
	jmp	.LBB46_1
	.align	16, 0x90
.LBB46_2:                               # %for.inc
                                        #   in Loop: Header=BB46_1 Depth=1
	incl	EdgeProfCounters+6788(%rip)
	movslq	-12(%rsp), %rax
	movq	-8(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	cvtsi2sd	%eax, %xmm1
	mulsd	-24(%rsp), %xmm1
	addsd	-32(%rsp), %xmm1
	movsd	%xmm1, -32(%rsp)
	movsd	-24(%rsp), %xmm1
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, -24(%rsp)
	incl	EdgeProfCounters+6796(%rip)
	incl	-12(%rsp)
	incl	EdgeProfCounters+6800(%rip)
.LBB46_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$7, -12(%rsp)
	jle	.LBB46_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+6792(%rip)
	movsd	-32(%rsp), %xmm0
	ret
.Ltmp212:
	.size	uInt64_to_double, .Ltmp212-uInt64_to_double
	.cfi_endproc

	.align	16, 0x90
	.type	uInt64_toAscii,@function
uInt64_toAscii:                         # @uInt64_toAscii
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp215:
	.cfi_def_cfa_offset 16
	subq	$80, %rsp
.Ltmp216:
	.cfi_def_cfa_offset 96
.Ltmp217:
	.cfi_offset %rbx, -16
	incl	EdgeProfCounters+6804(%rip)
	movq	%rdi, 72(%rsp)
	movq	%rsi, 64(%rsp)
	movl	$0, 12(%rsp)
	movq	64(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, (%rsp)
	incl	EdgeProfCounters+6808(%rip)
	leaq	(%rsp), %rbx
	jmp	.LBB47_1
	.align	16, 0x90
.LBB47_2:                               # %do.cond.do.body_crit_edge
                                        #   in Loop: Header=BB47_1 Depth=1
	incl	EdgeProfCounters+6816(%rip)
.LBB47_1:                               # %do.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	uInt64_qrm10
	movl	%eax, 56(%rsp)
	addl	$48, %eax
	movslq	12(%rsp), %rcx
	movb	%al, 16(%rsp,%rcx)
	incl	12(%rsp)
	incl	EdgeProfCounters+6812(%rip)
	movq	%rbx, %rdi
	callq	uInt64_isZero
	testb	%al, %al
	je	.LBB47_2
# BB#3:                                 # %do.end
	incl	EdgeProfCounters+6820(%rip)
	movq	72(%rsp), %rax
	movslq	12(%rsp), %rcx
	movb	$0, (%rax,%rcx)
	movl	$0, 60(%rsp)
	incl	EdgeProfCounters+6824(%rip)
	jmp	.LBB47_4
	.align	16, 0x90
.LBB47_5:                               # %for.body
                                        #   in Loop: Header=BB47_4 Depth=1
	incl	EdgeProfCounters+6828(%rip)
	movslq	60(%rsp), %rax
	movl	12(%rsp), %ecx
	subl	%eax, %ecx
	decl	%ecx
	movslq	%ecx, %rcx
	movb	16(%rsp,%rcx), %cl
	movq	72(%rsp), %rdx
	movb	%cl, (%rdx,%rax)
	incl	EdgeProfCounters+6836(%rip)
	incl	60(%rsp)
	incl	EdgeProfCounters+6840(%rip)
.LBB47_4:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	60(%rsp), %eax
	cmpl	12(%rsp), %eax
	jl	.LBB47_5
# BB#6:                                 # %for.end
	incl	EdgeProfCounters+6832(%rip)
	addq	$80, %rsp
	popq	%rbx
	ret
.Ltmp218:
	.size	uInt64_toAscii, .Ltmp218-uInt64_toAscii
	.cfi_endproc

	.align	16, 0x90
	.type	uInt64_qrm10,@function
uInt64_qrm10:                           # @uInt64_qrm10
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+6844(%rip)
	movq	%rdi, -8(%rsp)
	movl	$0, -12(%rsp)
	movl	$7, -20(%rsp)
	incl	EdgeProfCounters+6848(%rip)
	movl	$3435973837, %eax       # imm = 0xCCCCCCCD
	jmp	.LBB48_1
	.align	16, 0x90
.LBB48_2:                               # %for.inc
                                        #   in Loop: Header=BB48_1 Depth=1
	incl	EdgeProfCounters+6852(%rip)
	movslq	-20(%rsp), %rcx
	movq	-8(%rsp), %rdx
	movzbl	(%rdx,%rcx), %edx
	movl	-12(%rsp), %ecx
	shll	$8, %ecx
	orl	%edx, %ecx
	movl	%ecx, -16(%rsp)
	imulq	%rax, %rcx
	shrq	$35, %rcx
	movq	-8(%rsp), %rdx
	movslq	-20(%rsp), %rsi
	movb	%cl, (%rdx,%rsi)
	movl	-16(%rsp), %ecx
	movq	%rcx, %rdx
	imulq	%rax, %rdx
	shrq	$35, %rdx
	imull	$10, %edx, %edx
	subl	%edx, %ecx
	movl	%ecx, -12(%rsp)
	incl	EdgeProfCounters+6860(%rip)
	decl	-20(%rsp)
	incl	EdgeProfCounters+6864(%rip)
.LBB48_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, -20(%rsp)
	jns	.LBB48_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+6856(%rip)
	movl	-12(%rsp), %eax
	ret
.Ltmp219:
	.size	uInt64_qrm10, .Ltmp219-uInt64_qrm10
	.cfi_endproc

	.align	16, 0x90
	.type	uInt64_isZero,@function
uInt64_isZero:                          # @uInt64_isZero
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+6868(%rip)
	movq	%rdi, -16(%rsp)
	movl	$0, -20(%rsp)
	incl	EdgeProfCounters+6872(%rip)
	jmp	.LBB49_1
	.align	16, 0x90
.LBB49_4:                               # %for.inc
                                        #   in Loop: Header=BB49_1 Depth=1
	incl	EdgeProfCounters+6888(%rip)
	incl	EdgeProfCounters+6896(%rip)
	incl	-20(%rsp)
	incl	EdgeProfCounters+6900(%rip)
.LBB49_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$7, -20(%rsp)
	jg	.LBB49_5
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB49_1 Depth=1
	incl	EdgeProfCounters+6876(%rip)
	movslq	-20(%rsp), %rax
	movq	-16(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	testl	%eax, %eax
	je	.LBB49_4
# BB#3:                                 # %if.then
	incl	EdgeProfCounters+6884(%rip)
	movb	$0, -1(%rsp)
	incl	EdgeProfCounters+6892(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB49_5:                               # %for.end
	incl	EdgeProfCounters+6880(%rip)
	movb	$1, -1(%rsp)
	incl	EdgeProfCounters+6904(%rip)
	movzbl	-1(%rsp), %eax
	ret
.Ltmp220:
	.size	uInt64_isZero, .Ltmp220-uInt64_isZero
	.cfi_endproc

	.align	16, 0x90
	.type	mkCell,@function
mkCell:                                 # @mkCell
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp222:
	.cfi_def_cfa_offset 16
	incl	EdgeProfCounters+6908(%rip)
	movl	$16, %edi
	callq	myMalloc
	movq	%rax, (%rsp)
	movq	$0, (%rax)
	movq	(%rsp), %rax
	movq	$0, 8(%rax)
	movq	(%rsp), %rax
	popq	%rdx
	ret
.Ltmp223:
	.size	mkCell, .Ltmp223-mkCell
	.cfi_endproc

	.align	16, 0x90
	.type	myMalloc,@function
myMalloc:                               # @myMalloc
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp225:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+6912(%rip)
	movl	%edi, 20(%rsp)
	movslq	20(%rsp), %rdi
	callq	malloc
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.LBB51_2
# BB#1:                                 # %entry.if.end_crit_edge
	incl	EdgeProfCounters+6920(%rip)
	jmp	.LBB51_3
.LBB51_2:                               # %if.then
	incl	EdgeProfCounters+6916(%rip)
	callq	outOfMemory
	incl	EdgeProfCounters+6924(%rip)
.LBB51_3:                               # %if.end
	movq	8(%rsp), %rax
	addq	$24, %rsp
	ret
.Ltmp226:
	.size	myMalloc, .Ltmp226-myMalloc
	.cfi_endproc

	.globl	BZ2_bz__AssertH__fail
	.align	16, 0x90
	.type	BZ2_bz__AssertH__fail,@function
BZ2_bz__AssertH__fail:                  # @BZ2_bz__AssertH__fail
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp230:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp231:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp232:
	.cfi_def_cfa_offset 32
.Ltmp233:
	.cfi_offset %rbx, -24
.Ltmp234:
	.cfi_offset %r14, -16
	movl	%edi, %ebx
	incl	EdgeProfCounters+6928(%rip)
	movl	%ebx, 4(%rsp)
	movq	stderr(%rip), %r14
	callq	BZ2_bzlibVersion
	movq	%r14, %rdi
	movl	$.L.str108, %esi
	movl	%ebx, %edx
	movq	%rax, %rcx
	xorb	%al, %al
	callq	fprintf
	cmpl	$1007, 4(%rsp)          # imm = 0x3EF
	jne	.LBB52_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+6932(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str1109, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+6940(%rip)
	jmp	.LBB52_3
.LBB52_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+6936(%rip)
.LBB52_3:                               # %if.end
	movl	$3, %edi
	callq	exit
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	ret
.Ltmp235:
	.size	BZ2_bz__AssertH__fail, .Ltmp235-BZ2_bz__AssertH__fail
	.cfi_endproc

	.globl	BZ2_bzlibVersion
	.align	16, 0x90
	.type	BZ2_bzlibVersion,@function
BZ2_bzlibVersion:                       # @BZ2_bzlibVersion
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+6944(%rip)
	movl	$.L.str5113, %eax
	ret
.Ltmp236:
	.size	BZ2_bzlibVersion, .Ltmp236-BZ2_bzlibVersion
	.cfi_endproc

	.globl	BZ2_bzCompressInit
	.align	16, 0x90
	.type	BZ2_bzCompressInit,@function
BZ2_bzCompressInit:                     # @BZ2_bzCompressInit
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp238:
	.cfi_def_cfa_offset 48
	incl	EdgeProfCounters+6948(%rip)
	movq	%rdi, 24(%rsp)
	movl	%esi, 20(%rsp)
	movl	%edx, 16(%rsp)
	movl	%ecx, 12(%rsp)
	callq	bz_config_ok
	testl	%eax, %eax
	je	.LBB54_1
# BB#2:                                 # %if.end
	incl	EdgeProfCounters+6952(%rip)
	cmpq	$0, 24(%rsp)
	je	.LBB54_3
# BB#4:                                 # %lor.lhs.false
	incl	EdgeProfCounters+6968(%rip)
	cmpl	$0, 20(%rsp)
	jle	.LBB54_5
# BB#6:                                 # %lor.lhs.false2
	incl	EdgeProfCounters+6976(%rip)
	cmpl	$10, 20(%rsp)
	jl	.LBB54_8
# BB#7:                                 # %lor.lhs.false2.if.then8_crit_edge
	incl	EdgeProfCounters+6980(%rip)
	jmp	.LBB54_12
.LBB54_1:                               # %if.then
	incl	EdgeProfCounters+6956(%rip)
	movl	$-9, 36(%rsp)
	incl	EdgeProfCounters+6960(%rip)
	jmp	.LBB54_44
.LBB54_3:                               # %if.end.if.then8_crit_edge
	incl	EdgeProfCounters+6964(%rip)
	jmp	.LBB54_12
.LBB54_5:                               # %lor.lhs.false.if.then8_crit_edge
	incl	EdgeProfCounters+6972(%rip)
	jmp	.LBB54_12
.LBB54_8:                               # %lor.lhs.false4
	incl	EdgeProfCounters+6984(%rip)
	cmpl	$0, 12(%rsp)
	js	.LBB54_9
# BB#10:                                # %lor.lhs.false6
	incl	EdgeProfCounters+6992(%rip)
	cmpl	$251, 12(%rsp)
	jl	.LBB54_13
# BB#11:                                # %lor.lhs.false6.if.then8_crit_edge
	incl	EdgeProfCounters+6996(%rip)
	jmp	.LBB54_12
.LBB54_9:                               # %lor.lhs.false4.if.then8_crit_edge
	incl	EdgeProfCounters+6988(%rip)
.LBB54_12:                              # %if.then8
	movl	$-2, 36(%rsp)
	incl	EdgeProfCounters+7004(%rip)
.LBB54_44:                              # %return
	movl	36(%rsp), %eax
	addq	$40, %rsp
	ret
.LBB54_13:                              # %if.end9
	incl	EdgeProfCounters+7000(%rip)
	cmpl	$0, 12(%rsp)
	je	.LBB54_15
# BB#14:                                # %if.end9.if.end12_crit_edge
	incl	EdgeProfCounters+7012(%rip)
	jmp	.LBB54_16
.LBB54_15:                              # %if.then11
	incl	EdgeProfCounters+7008(%rip)
	movl	$30, 12(%rsp)
	incl	EdgeProfCounters+7016(%rip)
.LBB54_16:                              # %if.end12
	movq	24(%rsp), %rax
	cmpq	$0, 56(%rax)
	je	.LBB54_18
# BB#17:                                # %if.end12.if.end16_crit_edge
	incl	EdgeProfCounters+7024(%rip)
	jmp	.LBB54_19
.LBB54_18:                              # %if.then14
	incl	EdgeProfCounters+7020(%rip)
	movq	24(%rsp), %rax
	movq	$default_bzalloc, 56(%rax)
	incl	EdgeProfCounters+7028(%rip)
.LBB54_19:                              # %if.end16
	movq	24(%rsp), %rax
	cmpq	$0, 64(%rax)
	je	.LBB54_21
# BB#20:                                # %if.end16.if.end20_crit_edge
	incl	EdgeProfCounters+7036(%rip)
	jmp	.LBB54_22
.LBB54_21:                              # %if.then18
	incl	EdgeProfCounters+7032(%rip)
	movq	24(%rsp), %rax
	movq	$default_bzfree, 64(%rax)
	incl	EdgeProfCounters+7040(%rip)
.LBB54_22:                              # %if.end20
	movq	24(%rsp), %rax
	movq	72(%rax), %rdi
	movl	$55768, %esi            # imm = 0xD9D8
	movl	$1, %edx
	callq	*56(%rax)
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.LBB54_23
# BB#24:                                # %if.end25
	incl	EdgeProfCounters+7048(%rip)
	movq	(%rsp), %rax
	movq	24(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	(%rsp), %rax
	movq	$0, 24(%rax)
	movq	(%rsp), %rax
	movq	$0, 32(%rax)
	movq	(%rsp), %rax
	movq	$0, 40(%rax)
	imull	$100000, 20(%rsp), %esi # imm = 0x186A0
	movl	%esi, 8(%rsp)
	movq	24(%rsp), %rax
	movq	72(%rax), %rdi
	shll	$2, %esi
	movl	$1, %edx
	callq	*56(%rax)
	movq	(%rsp), %rcx
	movq	%rax, 24(%rcx)
	movq	24(%rsp), %rax
	movq	72(%rax), %rdi
	movl	8(%rsp), %ecx
	leal	136(,%rcx,4), %esi
	movl	$1, %edx
	callq	*56(%rax)
	movq	(%rsp), %rcx
	movq	%rax, 32(%rcx)
	movq	24(%rsp), %rax
	movq	72(%rax), %rdi
	movl	$262148, %esi           # imm = 0x40004
	movl	$1, %edx
	callq	*56(%rax)
	movq	(%rsp), %rcx
	movq	%rax, 40(%rcx)
	movq	(%rsp), %rax
	cmpq	$0, 24(%rax)
	je	.LBB54_25
# BB#26:                                # %lor.lhs.false47
	incl	EdgeProfCounters+7060(%rip)
	movq	(%rsp), %rax
	cmpq	$0, 32(%rax)
	je	.LBB54_27
# BB#28:                                # %lor.lhs.false51
	incl	EdgeProfCounters+7068(%rip)
	movq	(%rsp), %rax
	cmpq	$0, 40(%rax)
	je	.LBB54_29
# BB#43:                                # %if.end86
	incl	EdgeProfCounters+7076(%rip)
	movq	(%rsp), %rax
	movl	$0, 660(%rax)
	movq	(%rsp), %rax
	movl	$2, 12(%rax)
	movq	(%rsp), %rax
	movl	$2, 8(%rax)
	movq	(%rsp), %rax
	movl	$0, 652(%rax)
	movq	(%rsp), %rax
	movl	20(%rsp), %ecx
	movl	%ecx, 664(%rax)
	imull	$100000, 20(%rsp), %eax # imm = 0x186A0
	addl	$-19, %eax
	movq	(%rsp), %rcx
	movl	%eax, 112(%rcx)
	movq	(%rsp), %rax
	movl	16(%rsp), %ecx
	movl	%ecx, 656(%rax)
	movq	(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%ecx, 88(%rax)
	movq	(%rsp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, 64(%rax)
	movq	(%rsp), %rax
	movq	24(%rax), %rcx
	movq	%rcx, 72(%rax)
	movq	(%rsp), %rax
	movq	$0, 80(%rax)
	movq	(%rsp), %rax
	movq	24(%rax), %rcx
	movq	%rcx, 56(%rax)
	movq	24(%rsp), %rax
	movq	(%rsp), %rcx
	movq	%rcx, 48(%rax)
	movq	24(%rsp), %rax
	movl	$0, 12(%rax)
	movq	24(%rsp), %rax
	movl	$0, 16(%rax)
	movq	24(%rsp), %rax
	movl	$0, 36(%rax)
	movq	24(%rsp), %rax
	movl	$0, 40(%rax)
	movq	(%rsp), %rdi
	callq	init_RL
	movq	(%rsp), %rdi
	callq	prepare_new_block
	movl	$0, 36(%rsp)
	incl	EdgeProfCounters+7132(%rip)
	jmp	.LBB54_44
.LBB54_23:                              # %if.then24
	incl	EdgeProfCounters+7044(%rip)
	movl	$-3, 36(%rsp)
	incl	EdgeProfCounters+7052(%rip)
	jmp	.LBB54_44
.LBB54_25:                              # %if.end25.if.then55_crit_edge
	incl	EdgeProfCounters+7056(%rip)
	jmp	.LBB54_30
.LBB54_27:                              # %lor.lhs.false47.if.then55_crit_edge
	incl	EdgeProfCounters+7064(%rip)
	jmp	.LBB54_30
.LBB54_29:                              # %lor.lhs.false51.if.then55_crit_edge
	incl	EdgeProfCounters+7072(%rip)
.LBB54_30:                              # %if.then55
	movq	(%rsp), %rax
	cmpq	$0, 24(%rax)
	je	.LBB54_31
# BB#32:                                # %if.then59
	incl	EdgeProfCounters+7080(%rip)
	movq	(%rsp), %rax
	movq	24(%rax), %rsi
	movq	24(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
	incl	EdgeProfCounters+7088(%rip)
	jmp	.LBB54_33
.LBB54_31:                              # %if.then55.if.end63_crit_edge
	incl	EdgeProfCounters+7084(%rip)
.LBB54_33:                              # %if.end63
	movq	(%rsp), %rax
	cmpq	$0, 32(%rax)
	je	.LBB54_34
# BB#35:                                # %if.then67
	incl	EdgeProfCounters+7092(%rip)
	movq	(%rsp), %rax
	movq	32(%rax), %rsi
	movq	24(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
	incl	EdgeProfCounters+7100(%rip)
	jmp	.LBB54_36
.LBB54_34:                              # %if.end63.if.end71_crit_edge
	incl	EdgeProfCounters+7096(%rip)
.LBB54_36:                              # %if.end71
	movq	(%rsp), %rax
	cmpq	$0, 40(%rax)
	je	.LBB54_37
# BB#38:                                # %if.then75
	incl	EdgeProfCounters+7104(%rip)
	movq	(%rsp), %rax
	movq	40(%rax), %rsi
	movq	24(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
	incl	EdgeProfCounters+7112(%rip)
	jmp	.LBB54_39
.LBB54_37:                              # %if.end71.if.end79_crit_edge
	incl	EdgeProfCounters+7108(%rip)
.LBB54_39:                              # %if.end79
	cmpq	$0, (%rsp)
	je	.LBB54_40
# BB#41:                                # %if.then82
	incl	EdgeProfCounters+7116(%rip)
	movq	24(%rsp), %rax
	movq	72(%rax), %rdi
	movq	(%rsp), %rsi
	callq	*64(%rax)
	incl	EdgeProfCounters+7124(%rip)
	jmp	.LBB54_42
.LBB54_40:                              # %if.end79.if.end85_crit_edge
	incl	EdgeProfCounters+7120(%rip)
.LBB54_42:                              # %if.end85
	movl	$-3, 36(%rsp)
	incl	EdgeProfCounters+7128(%rip)
	jmp	.LBB54_44
.Ltmp239:
	.size	BZ2_bzCompressInit, .Ltmp239-BZ2_bzCompressInit
	.cfi_endproc

	.align	16, 0x90
	.type	bz_config_ok,@function
bz_config_ok:                           # @bz_config_ok
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+7136(%rip)
	movl	$1, %eax
	ret
.Ltmp240:
	.size	bz_config_ok, .Ltmp240-bz_config_ok
	.cfi_endproc

	.align	16, 0x90
	.type	default_bzalloc,@function
default_bzalloc:                        # @default_bzalloc
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp242:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+7140(%rip)
	movq	%rdi, 16(%rsp)
	movl	%esi, 12(%rsp)
	movl	%edx, 8(%rsp)
	imull	12(%rsp), %edx
	movslq	%edx, %rdi
	callq	malloc
	movq	%rax, (%rsp)
	addq	$24, %rsp
	ret
.Ltmp243:
	.size	default_bzalloc, .Ltmp243-default_bzalloc
	.cfi_endproc

	.align	16, 0x90
	.type	default_bzfree,@function
default_bzfree:                         # @default_bzfree
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp245:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+7144(%rip)
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	testq	%rsi, %rsi
	je	.LBB57_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+7148(%rip)
	movq	8(%rsp), %rdi
	callq	free
	incl	EdgeProfCounters+7156(%rip)
	addq	$24, %rsp
	ret
.LBB57_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+7152(%rip)
	addq	$24, %rsp
	ret
.Ltmp246:
	.size	default_bzfree, .Ltmp246-default_bzfree
	.cfi_endproc

	.align	16, 0x90
	.type	init_RL,@function
init_RL:                                # @init_RL
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+7160(%rip)
	movq	%rdi, -8(%rsp)
	movl	$256, 92(%rdi)          # imm = 0x100
	movq	-8(%rsp), %rax
	movl	$0, 96(%rax)
	ret
.Ltmp247:
	.size	init_RL, .Ltmp247-init_RL
	.cfi_endproc

	.align	16, 0x90
	.type	prepare_new_block,@function
prepare_new_block:                      # @prepare_new_block
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+7164(%rip)
	movq	%rdi, -8(%rsp)
	movl	$0, 108(%rdi)
	movq	-8(%rsp), %rax
	movl	$0, 116(%rax)
	movq	-8(%rsp), %rax
	movl	$0, 120(%rax)
	movq	-8(%rsp), %rax
	movl	$-1, 648(%rax)
	movl	$0, -12(%rsp)
	incl	EdgeProfCounters+7168(%rip)
	jmp	.LBB59_1
	.align	16, 0x90
.LBB59_2:                               # %for.body
                                        #   in Loop: Header=BB59_1 Depth=1
	incl	EdgeProfCounters+7172(%rip)
	movq	-8(%rsp), %rax
	movslq	-12(%rsp), %rcx
	movb	$0, 128(%rax,%rcx)
	incl	EdgeProfCounters+7180(%rip)
	incl	-12(%rsp)
	incl	EdgeProfCounters+7184(%rip)
.LBB59_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$255, -12(%rsp)
	jle	.LBB59_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+7176(%rip)
	movq	-8(%rsp), %rax
	incl	660(%rax)
	ret
.Ltmp248:
	.size	prepare_new_block, .Ltmp248-prepare_new_block
	.cfi_endproc

	.globl	BZ2_bzCompress
	.align	16, 0x90
	.type	BZ2_bzCompress,@function
BZ2_bzCompress:                         # @BZ2_bzCompress
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp250:
	.cfi_def_cfa_offset 48
	incl	EdgeProfCounters+7188(%rip)
	movq	%rdi, 24(%rsp)
	movl	%esi, 20(%rsp)
	cmpq	$0, 24(%rsp)
	je	.LBB60_1
# BB#2:                                 # %if.end
	incl	EdgeProfCounters+7196(%rip)
	movq	24(%rsp), %rax
	movq	48(%rax), %rax
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.LBB60_3
# BB#4:                                 # %if.end3
	incl	EdgeProfCounters+7208(%rip)
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	cmpq	24(%rsp), %rax
	je	.LBB60_6
# BB#5:                                 # %if.then6
	incl	EdgeProfCounters+7216(%rip)
	movl	$-2, 36(%rsp)
	incl	EdgeProfCounters+7224(%rip)
	jmp	.LBB60_44
.LBB60_1:                               # %if.then
	incl	EdgeProfCounters+7192(%rip)
	movl	$-2, 36(%rsp)
	incl	EdgeProfCounters+7200(%rip)
	jmp	.LBB60_44
.LBB60_3:                               # %if.then2
	incl	EdgeProfCounters+7204(%rip)
	movl	$-2, 36(%rsp)
	incl	EdgeProfCounters+7212(%rip)
	jmp	.LBB60_44
.LBB60_6:                               # %if.end7
	incl	EdgeProfCounters+7220(%rip)
	incl	EdgeProfCounters+7228(%rip)
	jmp	.LBB60_7
	.align	16, 0x90
.LBB60_13:                              # %if.then13
                                        #   in Loop: Header=BB60_7 Depth=1
	incl	EdgeProfCounters+7268(%rip)
	movq	24(%rsp), %rax
	movl	8(%rax), %eax
	movq	8(%rsp), %rcx
	movl	%eax, 16(%rcx)
	movq	8(%rsp), %rax
	movl	$3, 8(%rax)
	incl	EdgeProfCounters+7276(%rip)
.LBB60_7:                               # %preswitch
                                        # =>This Inner Loop Header: Depth=1
	movq	8(%rsp), %rax
	movl	8(%rax), %eax
	decl	%eax
	cmpl	$3, %eax
	ja	.LBB60_43
# BB#8:                                 # %preswitch
                                        #   in Loop: Header=BB60_7 Depth=1
	jmpq	*.LJTI60_0(,%rax,8)
.LBB60_10:                              # %sw.bb8
                                        #   in Loop: Header=BB60_7 Depth=1
	incl	EdgeProfCounters+7240(%rip)
	cmpl	$0, 20(%rsp)
	je	.LBB60_11
# BB#12:                                # %if.else
                                        #   in Loop: Header=BB60_7 Depth=1
	incl	EdgeProfCounters+7260(%rip)
	cmpl	$1, 20(%rsp)
	je	.LBB60_13
# BB#14:                                # %if.else15
                                        #   in Loop: Header=BB60_7 Depth=1
	incl	EdgeProfCounters+7272(%rip)
	cmpl	$2, 20(%rsp)
	jne	.LBB60_16
# BB#15:                                # %if.then18
                                        #   in Loop: Header=BB60_7 Depth=1
	incl	EdgeProfCounters+7280(%rip)
	movq	24(%rsp), %rax
	movl	8(%rax), %eax
	movq	8(%rsp), %rcx
	movl	%eax, 16(%rcx)
	movq	8(%rsp), %rax
	movl	$4, 8(%rax)
	incl	EdgeProfCounters+7288(%rip)
	jmp	.LBB60_7
.LBB60_43:                              # %sw.epilog
	incl	EdgeProfCounters+7232(%rip)
	movl	$0, 36(%rsp)
	incl	EdgeProfCounters+7420(%rip)
	jmp	.LBB60_44
.LBB60_11:                              # %if.then10
	incl	EdgeProfCounters+7256(%rip)
	movq	24(%rsp), %rdi
	callq	handle_compress
	movb	%al, 19(%rsp)
	movl	$1, %ecx
	movl	$-2, %edx
	testb	%al, %al
	cmovnel	%ecx, %edx
	movl	%edx, 36(%rsp)
	incl	EdgeProfCounters+7264(%rip)
	jmp	.LBB60_44
.LBB60_16:                              # %if.else22
	incl	EdgeProfCounters+7284(%rip)
	movl	$-2, 36(%rsp)
	incl	EdgeProfCounters+7292(%rip)
	jmp	.LBB60_44
.LBB60_9:                               # %sw.bb
	incl	EdgeProfCounters+7236(%rip)
	movl	$-1, 36(%rsp)
	incl	EdgeProfCounters+7252(%rip)
	jmp	.LBB60_44
.LBB60_17:                              # %sw.bb23
	incl	EdgeProfCounters+7244(%rip)
	cmpl	$1, 20(%rsp)
	je	.LBB60_19
# BB#18:                                # %if.then26
	incl	EdgeProfCounters+7296(%rip)
	movl	$-1, 36(%rsp)
	incl	EdgeProfCounters+7304(%rip)
	jmp	.LBB60_44
.LBB60_29:                              # %sw.bb47
	incl	EdgeProfCounters+7248(%rip)
	cmpl	$2, 20(%rsp)
	je	.LBB60_31
# BB#30:                                # %if.then50
	incl	EdgeProfCounters+7352(%rip)
	movl	$-1, 36(%rsp)
	incl	EdgeProfCounters+7360(%rip)
	jmp	.LBB60_44
.LBB60_19:                              # %if.end27
	incl	EdgeProfCounters+7300(%rip)
	movq	8(%rsp), %rax
	movq	(%rax), %rcx
	movl	16(%rax), %eax
	cmpl	8(%rcx), %eax
	je	.LBB60_21
# BB#20:                                # %if.then33
	incl	EdgeProfCounters+7308(%rip)
	movl	$-1, 36(%rsp)
	incl	EdgeProfCounters+7316(%rip)
	jmp	.LBB60_44
.LBB60_31:                              # %if.end51
	incl	EdgeProfCounters+7356(%rip)
	movq	8(%rsp), %rax
	movq	(%rax), %rcx
	movl	16(%rax), %eax
	cmpl	8(%rcx), %eax
	je	.LBB60_33
# BB#32:                                # %if.then57
	incl	EdgeProfCounters+7364(%rip)
	movl	$-1, 36(%rsp)
	incl	EdgeProfCounters+7372(%rip)
	jmp	.LBB60_44
.LBB60_21:                              # %if.end34
	incl	EdgeProfCounters+7312(%rip)
	movq	24(%rsp), %rdi
	callq	handle_compress
	movb	%al, 19(%rsp)
	movq	8(%rsp), %rax
	cmpl	$0, 16(%rax)
	je	.LBB60_23
# BB#22:                                # %if.end34.if.then44_crit_edge
	incl	EdgeProfCounters+7320(%rip)
	jmp	.LBB60_27
.LBB60_33:                              # %if.end58
	incl	EdgeProfCounters+7368(%rip)
	movq	24(%rsp), %rdi
	callq	handle_compress
	movb	%al, 19(%rsp)
	testb	%al, %al
	je	.LBB60_34
# BB#35:                                # %if.end62
	incl	EdgeProfCounters+7376(%rip)
	movq	8(%rsp), %rax
	cmpl	$0, 16(%rax)
	je	.LBB60_37
# BB#36:                                # %if.end62.if.then74_crit_edge
	incl	EdgeProfCounters+7388(%rip)
	jmp	.LBB60_41
.LBB60_23:                              # %lor.lhs.false
	incl	EdgeProfCounters+7324(%rip)
	movq	8(%rsp), %rdi
	callq	isempty_RL
	testb	%al, %al
	je	.LBB60_24
# BB#25:                                # %lor.lhs.false41
	incl	EdgeProfCounters+7328(%rip)
	movq	8(%rsp), %rax
	movl	120(%rax), %ecx
	cmpl	116(%rax), %ecx
	jge	.LBB60_28
# BB#26:                                # %lor.lhs.false41.if.then44_crit_edge
	incl	EdgeProfCounters+7336(%rip)
	jmp	.LBB60_27
.LBB60_34:                              # %if.then61
	incl	EdgeProfCounters+7380(%rip)
	movl	$-1, 36(%rsp)
	incl	EdgeProfCounters+7384(%rip)
	jmp	.LBB60_44
.LBB60_37:                              # %lor.lhs.false66
	incl	EdgeProfCounters+7392(%rip)
	movq	8(%rsp), %rdi
	callq	isempty_RL
	testb	%al, %al
	je	.LBB60_38
# BB#39:                                # %lor.lhs.false69
	incl	EdgeProfCounters+7396(%rip)
	movq	8(%rsp), %rax
	movl	120(%rax), %ecx
	cmpl	116(%rax), %ecx
	jge	.LBB60_42
# BB#40:                                # %lor.lhs.false69.if.then74_crit_edge
	incl	EdgeProfCounters+7404(%rip)
	jmp	.LBB60_41
.LBB60_24:                              # %lor.lhs.false.if.then44_crit_edge
	incl	EdgeProfCounters+7332(%rip)
.LBB60_27:                              # %if.then44
	movl	$2, 36(%rsp)
	incl	EdgeProfCounters+7344(%rip)
	jmp	.LBB60_44
.LBB60_28:                              # %if.end45
	incl	EdgeProfCounters+7340(%rip)
	movq	8(%rsp), %rax
	movl	$2, 8(%rax)
	movl	$1, 36(%rsp)
	incl	EdgeProfCounters+7348(%rip)
	jmp	.LBB60_44
.LBB60_38:                              # %lor.lhs.false66.if.then74_crit_edge
	incl	EdgeProfCounters+7400(%rip)
.LBB60_41:                              # %if.then74
	movl	$3, 36(%rsp)
	incl	EdgeProfCounters+7412(%rip)
	jmp	.LBB60_44
.LBB60_42:                              # %if.end75
	incl	EdgeProfCounters+7408(%rip)
	movq	8(%rsp), %rax
	movl	$1, 8(%rax)
	movl	$4, 36(%rsp)
	incl	EdgeProfCounters+7416(%rip)
.LBB60_44:                              # %return
	movl	36(%rsp), %eax
	addq	$40, %rsp
	ret
.Ltmp251:
	.size	BZ2_bzCompress, .Ltmp251-BZ2_bzCompress
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI60_0:
	.quad	.LBB60_9
	.quad	.LBB60_10
	.quad	.LBB60_17
	.quad	.LBB60_29

	.text
	.align	16, 0x90
	.type	handle_compress,@function
handle_compress:                        # @handle_compress
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp253:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+7424(%rip)
	movq	%rdi, 16(%rsp)
	movb	$0, 15(%rsp)
	movb	$0, 14(%rsp)
	movq	16(%rsp), %rax
	movq	48(%rax), %rax
	movq	%rax, (%rsp)
	incl	EdgeProfCounters+7428(%rip)
	jmp	.LBB61_1
	.align	16, 0x90
.LBB61_19:                              # %if.end30.if.end65_crit_edge
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7516(%rip)
	incl	EdgeProfCounters+7576(%rip)
.LBB61_1:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rsp), %rax
	cmpl	$1, 12(%rax)
	jne	.LBB61_2
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7432(%rip)
	movq	(%rsp), %rdi
	callq	copy_output_until_stop
	orb	%al, 14(%rsp)
	movq	(%rsp), %rax
	movl	120(%rax), %ecx
	cmpl	116(%rax), %ecx
	jl	.LBB61_4
# BB#5:                                 # %if.end
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7444(%rip)
	movq	(%rsp), %rax
	cmpl	$4, 8(%rax)
	jne	.LBB61_6
# BB#7:                                 # %land.lhs.true
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7452(%rip)
	movq	(%rsp), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB61_8
# BB#9:                                 # %land.lhs.true11
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7460(%rip)
	movq	(%rsp), %rdi
	callq	isempty_RL
	testb	%al, %al
	jne	.LBB61_31
# BB#10:                                # %land.lhs.true11.if.end15_crit_edge
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7472(%rip)
	jmp	.LBB61_11
	.align	16, 0x90
.LBB61_2:                               # %while.body.if.end30_crit_edge
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7436(%rip)
	jmp	.LBB61_18
	.align	16, 0x90
.LBB61_6:                               # %if.end.if.end15_crit_edge
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7456(%rip)
	jmp	.LBB61_11
.LBB61_8:                               # %land.lhs.true.if.end15_crit_edge
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7464(%rip)
.LBB61_11:                              # %if.end15
                                        #   in Loop: Header=BB61_1 Depth=1
	movq	(%rsp), %rdi
	callq	prepare_new_block
	movq	(%rsp), %rax
	movl	$2, 12(%rax)
	movq	(%rsp), %rax
	cmpl	$3, 8(%rax)
	jne	.LBB61_12
# BB#13:                                # %land.lhs.true20
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7480(%rip)
	movq	(%rsp), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB61_14
# BB#15:                                # %land.lhs.true24
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7488(%rip)
	movq	(%rsp), %rdi
	callq	isempty_RL
	testb	%al, %al
	jne	.LBB61_36
# BB#16:                                # %land.lhs.true24.if.end29_crit_edge
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7500(%rip)
	jmp	.LBB61_17
	.align	16, 0x90
.LBB61_12:                              # %if.end15.if.end29_crit_edge
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7484(%rip)
	jmp	.LBB61_17
.LBB61_14:                              # %land.lhs.true20.if.end29_crit_edge
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7492(%rip)
.LBB61_17:                              # %if.end29
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7508(%rip)
.LBB61_18:                              # %if.end30
                                        #   in Loop: Header=BB61_1 Depth=1
	movq	(%rsp), %rax
	cmpl	$2, 12(%rax)
	jne	.LBB61_19
# BB#20:                                # %if.then34
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7512(%rip)
	movq	(%rsp), %rdi
	callq	copy_input_until_stop
	orb	%al, 15(%rsp)
	movq	(%rsp), %rax
	cmpl	$2, 8(%rax)
	je	.LBB61_21
# BB#22:                                # %land.lhs.true43
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7520(%rip)
	movq	(%rsp), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB61_23
# BB#37:                                # %if.then47
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7528(%rip)
	movq	(%rsp), %rdi
	callq	flush_RL
	movq	(%rsp), %rdi
	cmpl	$4, 8(%rdi)
	sete	%al
	movzbl	%al, %esi
	callq	BZ2_compressBlock
	movq	(%rsp), %rax
	movl	$1, 12(%rax)
	incl	EdgeProfCounters+7536(%rip)
	jmp	.LBB61_30
	.align	16, 0x90
.LBB61_21:                              # %if.then34.if.else_crit_edge
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7524(%rip)
	jmp	.LBB61_24
.LBB61_23:                              # %land.lhs.true43.if.else_crit_edge
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7532(%rip)
.LBB61_24:                              # %if.else
                                        #   in Loop: Header=BB61_1 Depth=1
	movq	(%rsp), %rax
	movl	108(%rax), %ecx
	cmpl	112(%rax), %ecx
	jl	.LBB61_26
# BB#25:                                # %if.then55
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7540(%rip)
	movq	(%rsp), %rdi
	xorl	%esi, %esi
	callq	BZ2_compressBlock
	movq	(%rsp), %rax
	movl	$1, 12(%rax)
	incl	EdgeProfCounters+7548(%rip)
	jmp	.LBB61_29
.LBB61_26:                              # %if.else57
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7544(%rip)
	movq	(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB61_27
# BB#28:                                # %if.end62
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7556(%rip)
	incl	EdgeProfCounters+7564(%rip)
.LBB61_29:                              # %if.end63
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7568(%rip)
.LBB61_30:                              # %if.end64
                                        #   in Loop: Header=BB61_1 Depth=1
	incl	EdgeProfCounters+7572(%rip)
	incl	EdgeProfCounters+7576(%rip)
	jmp	.LBB61_1
.LBB61_4:                               # %if.then6
	incl	EdgeProfCounters+7440(%rip)
	incl	EdgeProfCounters+7448(%rip)
	jmp	.LBB61_32
.LBB61_27:                              # %if.then61
	incl	EdgeProfCounters+7552(%rip)
	incl	EdgeProfCounters+7560(%rip)
	jmp	.LBB61_32
.LBB61_31:                              # %if.then14
	incl	EdgeProfCounters+7468(%rip)
	incl	EdgeProfCounters+7476(%rip)
	jmp	.LBB61_32
.LBB61_36:                              # %if.then28
	incl	EdgeProfCounters+7496(%rip)
	incl	EdgeProfCounters+7504(%rip)
.LBB61_32:                              # %while.end
	movzbl	15(%rsp), %eax
	testl	%eax, %eax
	je	.LBB61_34
# BB#33:                                # %while.end.lor.end_crit_edge
	incl	EdgeProfCounters+7580(%rip)
	movb	$1, %al
	jmp	.LBB61_35
.LBB61_34:                              # %lor.rhs
	incl	EdgeProfCounters+7584(%rip)
	cmpb	$0, 14(%rsp)
	setne	%al
	incl	EdgeProfCounters+7588(%rip)
.LBB61_35:                              # %lor.end
	movzbl	%al, %eax
	addq	$24, %rsp
	ret
.Ltmp254:
	.size	handle_compress, .Ltmp254-handle_compress
	.cfi_endproc

	.align	16, 0x90
	.type	isempty_RL,@function
isempty_RL:                             # @isempty_RL
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+7592(%rip)
	movq	%rdi, -16(%rsp)
	cmpl	$256, 92(%rdi)          # imm = 0x100
	jae	.LBB62_1
# BB#2:                                 # %land.lhs.true
	incl	EdgeProfCounters+7596(%rip)
	movq	-16(%rsp), %rax
	cmpl	$0, 96(%rax)
	jle	.LBB62_3
# BB#6:                                 # %if.then
	incl	EdgeProfCounters+7604(%rip)
	movb	$0, -1(%rsp)
	incl	EdgeProfCounters+7612(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB62_1:                               # %entry.if.else_crit_edge
	incl	EdgeProfCounters+7600(%rip)
	jmp	.LBB62_4
.LBB62_3:                               # %land.lhs.true.if.else_crit_edge
	incl	EdgeProfCounters+7608(%rip)
.LBB62_4:                               # %if.else
	movb	$1, -1(%rsp)
	incl	EdgeProfCounters+7616(%rip)
	movzbl	-1(%rsp), %eax
	ret
.Ltmp255:
	.size	isempty_RL, .Ltmp255-isempty_RL
	.cfi_endproc

	.globl	BZ2_bzCompressEnd
	.align	16, 0x90
	.type	BZ2_bzCompressEnd,@function
BZ2_bzCompressEnd:                      # @BZ2_bzCompressEnd
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp257:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+7620(%rip)
	movq	%rdi, 8(%rsp)
	testq	%rdi, %rdi
	je	.LBB63_1
# BB#2:                                 # %if.end
	incl	EdgeProfCounters+7628(%rip)
	movq	8(%rsp), %rax
	movq	48(%rax), %rax
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.LBB63_3
# BB#4:                                 # %if.end3
	incl	EdgeProfCounters+7640(%rip)
	movq	(%rsp), %rax
	movq	(%rax), %rax
	cmpq	8(%rsp), %rax
	je	.LBB63_6
# BB#5:                                 # %if.then6
	incl	EdgeProfCounters+7648(%rip)
	movl	$-2, 20(%rsp)
	incl	EdgeProfCounters+7656(%rip)
	jmp	.LBB63_16
.LBB63_1:                               # %if.then
	incl	EdgeProfCounters+7624(%rip)
	movl	$-2, 20(%rsp)
	incl	EdgeProfCounters+7632(%rip)
	jmp	.LBB63_16
.LBB63_3:                               # %if.then2
	incl	EdgeProfCounters+7636(%rip)
	movl	$-2, 20(%rsp)
	incl	EdgeProfCounters+7644(%rip)
	jmp	.LBB63_16
.LBB63_6:                               # %if.end7
	incl	EdgeProfCounters+7652(%rip)
	movq	(%rsp), %rax
	cmpq	$0, 24(%rax)
	je	.LBB63_7
# BB#8:                                 # %if.then9
	incl	EdgeProfCounters+7660(%rip)
	movq	(%rsp), %rax
	movq	24(%rax), %rsi
	movq	8(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
	incl	EdgeProfCounters+7668(%rip)
	jmp	.LBB63_9
.LBB63_7:                               # %if.end7.if.end11_crit_edge
	incl	EdgeProfCounters+7664(%rip)
.LBB63_9:                               # %if.end11
	movq	(%rsp), %rax
	cmpq	$0, 32(%rax)
	je	.LBB63_10
# BB#11:                                # %if.then13
	incl	EdgeProfCounters+7672(%rip)
	movq	(%rsp), %rax
	movq	32(%rax), %rsi
	movq	8(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
	incl	EdgeProfCounters+7680(%rip)
	jmp	.LBB63_12
.LBB63_10:                              # %if.end11.if.end17_crit_edge
	incl	EdgeProfCounters+7676(%rip)
.LBB63_12:                              # %if.end17
	movq	(%rsp), %rax
	cmpq	$0, 40(%rax)
	je	.LBB63_13
# BB#14:                                # %if.then19
	incl	EdgeProfCounters+7684(%rip)
	movq	(%rsp), %rax
	movq	40(%rax), %rsi
	movq	8(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
	incl	EdgeProfCounters+7692(%rip)
	jmp	.LBB63_15
.LBB63_13:                              # %if.end17.if.end23_crit_edge
	incl	EdgeProfCounters+7688(%rip)
.LBB63_15:                              # %if.end23
	movq	8(%rsp), %rax
	movq	48(%rax), %rsi
	movq	72(%rax), %rdi
	callq	*64(%rax)
	movq	8(%rsp), %rax
	movq	$0, 48(%rax)
	movl	$0, 20(%rsp)
	incl	EdgeProfCounters+7696(%rip)
.LBB63_16:                              # %return
	movl	20(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp258:
	.size	BZ2_bzCompressEnd, .Ltmp258-BZ2_bzCompressEnd
	.cfi_endproc

	.globl	BZ2_bzDecompressInit
	.align	16, 0x90
	.type	BZ2_bzDecompressInit,@function
BZ2_bzDecompressInit:                   # @BZ2_bzDecompressInit
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp260:
	.cfi_def_cfa_offset 48
	incl	EdgeProfCounters+7700(%rip)
	movq	%rdi, 24(%rsp)
	movl	%esi, 20(%rsp)
	movl	%edx, 16(%rsp)
	callq	bz_config_ok
	testl	%eax, %eax
	je	.LBB64_1
# BB#2:                                 # %if.end
	incl	EdgeProfCounters+7704(%rip)
	cmpq	$0, 24(%rsp)
	je	.LBB64_3
# BB#4:                                 # %if.end2
	incl	EdgeProfCounters+7720(%rip)
	cmpl	$0, 16(%rsp)
	je	.LBB64_5
# BB#6:                                 # %land.lhs.true
	incl	EdgeProfCounters+7728(%rip)
	cmpl	$1, 16(%rsp)
	je	.LBB64_7
# BB#23:                                # %if.then5
	incl	EdgeProfCounters+7736(%rip)
	movl	$-2, 36(%rsp)
	incl	EdgeProfCounters+7744(%rip)
	jmp	.LBB64_22
.LBB64_1:                               # %if.then
	incl	EdgeProfCounters+7708(%rip)
	movl	$-9, 36(%rsp)
	incl	EdgeProfCounters+7712(%rip)
	jmp	.LBB64_22
.LBB64_3:                               # %if.then1
	incl	EdgeProfCounters+7716(%rip)
	movl	$-2, 36(%rsp)
	incl	EdgeProfCounters+7724(%rip)
	jmp	.LBB64_22
.LBB64_5:                               # %if.end2.if.end6_crit_edge
	incl	EdgeProfCounters+7732(%rip)
	jmp	.LBB64_8
.LBB64_7:                               # %land.lhs.true.if.end6_crit_edge
	incl	EdgeProfCounters+7740(%rip)
.LBB64_8:                               # %if.end6
	cmpl	$0, 20(%rsp)
	js	.LBB64_9
# BB#10:                                # %lor.lhs.false
	incl	EdgeProfCounters+7752(%rip)
	cmpl	$5, 20(%rsp)
	jl	.LBB64_13
# BB#11:                                # %lor.lhs.false.if.then9_crit_edge
	incl	EdgeProfCounters+7756(%rip)
	jmp	.LBB64_12
.LBB64_9:                               # %if.end6.if.then9_crit_edge
	incl	EdgeProfCounters+7748(%rip)
.LBB64_12:                              # %if.then9
	movl	$-2, 36(%rsp)
	incl	EdgeProfCounters+7764(%rip)
	jmp	.LBB64_22
.LBB64_13:                              # %if.end10
	incl	EdgeProfCounters+7760(%rip)
	movq	24(%rsp), %rax
	cmpq	$0, 56(%rax)
	je	.LBB64_15
# BB#14:                                # %if.end10.if.end14_crit_edge
	incl	EdgeProfCounters+7772(%rip)
	jmp	.LBB64_16
.LBB64_15:                              # %if.then12
	incl	EdgeProfCounters+7768(%rip)
	movq	24(%rsp), %rax
	movq	$default_bzalloc, 56(%rax)
	incl	EdgeProfCounters+7776(%rip)
.LBB64_16:                              # %if.end14
	movq	24(%rsp), %rax
	cmpq	$0, 64(%rax)
	je	.LBB64_18
# BB#17:                                # %if.end14.if.end18_crit_edge
	incl	EdgeProfCounters+7784(%rip)
	jmp	.LBB64_19
.LBB64_18:                              # %if.then16
	incl	EdgeProfCounters+7780(%rip)
	movq	24(%rsp), %rax
	movq	$default_bzfree, 64(%rax)
	incl	EdgeProfCounters+7788(%rip)
.LBB64_19:                              # %if.end18
	movq	24(%rsp), %rax
	movq	72(%rax), %rdi
	movl	$64144, %esi            # imm = 0xFA90
	movl	$1, %edx
	callq	*56(%rax)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.LBB64_20
# BB#21:                                # %if.end23
	incl	EdgeProfCounters+7796(%rip)
	movq	8(%rsp), %rax
	movq	24(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	24(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	%rcx, 48(%rax)
	movq	8(%rsp), %rax
	movl	$10, 8(%rax)
	movq	8(%rsp), %rax
	movl	$0, 36(%rax)
	movq	8(%rsp), %rax
	movl	$0, 32(%rax)
	movq	8(%rsp), %rax
	movl	$0, 3188(%rax)
	movq	24(%rsp), %rax
	movl	$0, 12(%rax)
	movq	24(%rsp), %rax
	movl	$0, 16(%rax)
	movq	24(%rsp), %rax
	movl	$0, 36(%rax)
	movq	24(%rsp), %rax
	movl	$0, 40(%rax)
	movq	8(%rsp), %rax
	movb	16(%rsp), %cl
	movb	%cl, 44(%rax)
	movq	8(%rsp), %rax
	movq	$0, 3168(%rax)
	movq	8(%rsp), %rax
	movq	$0, 3160(%rax)
	movq	8(%rsp), %rax
	movq	$0, 3152(%rax)
	movq	8(%rsp), %rax
	movl	$0, 48(%rax)
	movq	8(%rsp), %rax
	movl	20(%rsp), %ecx
	movl	%ecx, 52(%rax)
	movl	$0, 36(%rsp)
	incl	EdgeProfCounters+7804(%rip)
	jmp	.LBB64_22
.LBB64_20:                              # %if.then22
	incl	EdgeProfCounters+7792(%rip)
	movl	$-3, 36(%rsp)
	incl	EdgeProfCounters+7800(%rip)
.LBB64_22:                              # %return
	movl	36(%rsp), %eax
	addq	$40, %rsp
	ret
.Ltmp261:
	.size	BZ2_bzDecompressInit, .Ltmp261-BZ2_bzDecompressInit
	.cfi_endproc

	.globl	BZ2_indexIntoF
	.align	16, 0x90
	.type	BZ2_indexIntoF,@function
BZ2_indexIntoF:                         # @BZ2_indexIntoF
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+7808(%rip)
	movl	%edi, -4(%rsp)
	movq	%rsi, -16(%rsp)
	movl	$0, -20(%rsp)
	movl	$256, -24(%rsp)         # imm = 0x100
	incl	EdgeProfCounters+7812(%rip)
	jmp	.LBB65_1
	.align	16, 0x90
.LBB65_5:                               # %do.cond.do.body_crit_edge
                                        #   in Loop: Header=BB65_1 Depth=1
	incl	EdgeProfCounters+7836(%rip)
.LBB65_1:                               # %do.body
                                        # =>This Inner Loop Header: Depth=1
	movl	-20(%rsp), %eax
	addl	-24(%rsp), %eax
	sarl	%eax
	movl	%eax, -28(%rsp)
	movslq	-28(%rsp), %rax
	movq	-16(%rsp), %rcx
	movl	-4(%rsp), %edx
	cmpl	(%rcx,%rax,4), %edx
	jl	.LBB65_3
# BB#2:                                 # %if.then
                                        #   in Loop: Header=BB65_1 Depth=1
	incl	EdgeProfCounters+7816(%rip)
	movl	-28(%rsp), %eax
	movl	%eax, -20(%rsp)
	incl	EdgeProfCounters+7824(%rip)
	jmp	.LBB65_4
	.align	16, 0x90
.LBB65_3:                               # %if.else
                                        #   in Loop: Header=BB65_1 Depth=1
	incl	EdgeProfCounters+7820(%rip)
	movl	-28(%rsp), %eax
	movl	%eax, -24(%rsp)
	incl	EdgeProfCounters+7828(%rip)
.LBB65_4:                               # %if.end
                                        #   in Loop: Header=BB65_1 Depth=1
	incl	EdgeProfCounters+7832(%rip)
	movl	-24(%rsp), %eax
	subl	-20(%rsp), %eax
	cmpl	$1, %eax
	jne	.LBB65_5
# BB#6:                                 # %do.end
	incl	EdgeProfCounters+7840(%rip)
	movl	-20(%rsp), %eax
	ret
.Ltmp262:
	.size	BZ2_indexIntoF, .Ltmp262-BZ2_indexIntoF
	.cfi_endproc

	.globl	BZ2_bzDecompress
	.align	16, 0x90
	.type	BZ2_bzDecompress,@function
BZ2_bzDecompress:                       # @BZ2_bzDecompress
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp264:
	.cfi_def_cfa_offset 48
	incl	EdgeProfCounters+7844(%rip)
	movq	%rdi, 24(%rsp)
	testq	%rdi, %rdi
	je	.LBB66_1
# BB#2:                                 # %if.end
	incl	EdgeProfCounters+7852(%rip)
	movq	24(%rsp), %rax
	movq	48(%rax), %rax
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.LBB66_3
# BB#4:                                 # %if.end3
	incl	EdgeProfCounters+7864(%rip)
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	cmpq	24(%rsp), %rax
	je	.LBB66_6
# BB#5:                                 # %if.then6
	incl	EdgeProfCounters+7872(%rip)
	movl	$-2, 36(%rsp)
	incl	EdgeProfCounters+7880(%rip)
	jmp	.LBB66_42
.LBB66_1:                               # %if.then
	incl	EdgeProfCounters+7848(%rip)
	movl	$-2, 36(%rsp)
	incl	EdgeProfCounters+7856(%rip)
	jmp	.LBB66_42
.LBB66_3:                               # %if.then2
	incl	EdgeProfCounters+7860(%rip)
	movl	$-2, 36(%rsp)
	incl	EdgeProfCounters+7868(%rip)
.LBB66_42:                              # %return
	movl	36(%rsp), %eax
	addq	$40, %rsp
	ret
.LBB66_6:                               # %if.end7
	incl	EdgeProfCounters+7876(%rip)
	incl	EdgeProfCounters+7884(%rip)
	jmp	.LBB66_7
	.align	16, 0x90
.LBB66_31:                              # %if.end47.if.end70_crit_edge
                                        #   in Loop: Header=BB66_7 Depth=1
	incl	EdgeProfCounters+8004(%rip)
	incl	EdgeProfCounters+8060(%rip)
.LBB66_7:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	8(%rsp), %rax
	cmpl	$1, 8(%rax)
	je	.LBB66_8
# BB#9:                                 # %if.end11
                                        #   in Loop: Header=BB66_7 Depth=1
	incl	EdgeProfCounters+7892(%rip)
	movq	8(%rsp), %rax
	cmpl	$2, 8(%rax)
	jne	.LBB66_10
# BB#11:                                # %if.then14
                                        #   in Loop: Header=BB66_7 Depth=1
	incl	EdgeProfCounters+7900(%rip)
	movq	8(%rsp), %rax
	cmpb	$0, 44(%rax)
	je	.LBB66_13
# BB#12:                                # %if.then15
                                        #   in Loop: Header=BB66_7 Depth=1
	incl	EdgeProfCounters+7908(%rip)
	movq	8(%rsp), %rdi
	callq	unRLE_obuf_to_output_SMALL
	movb	%al, 23(%rsp)
	incl	EdgeProfCounters+7916(%rip)
	jmp	.LBB66_14
	.align	16, 0x90
.LBB66_10:                              # %if.end11.if.end47_crit_edge
                                        #   in Loop: Header=BB66_7 Depth=1
	incl	EdgeProfCounters+7904(%rip)
	jmp	.LBB66_30
	.align	16, 0x90
.LBB66_13:                              # %if.else
                                        #   in Loop: Header=BB66_7 Depth=1
	incl	EdgeProfCounters+7912(%rip)
	movq	8(%rsp), %rdi
	callq	unRLE_obuf_to_output_FAST
	movb	%al, 23(%rsp)
	incl	EdgeProfCounters+7920(%rip)
.LBB66_14:                              # %if.end17
                                        #   in Loop: Header=BB66_7 Depth=1
	cmpb	$0, 23(%rsp)
	jne	.LBB66_15
# BB#16:                                # %if.end20
                                        #   in Loop: Header=BB66_7 Depth=1
	incl	EdgeProfCounters+7928(%rip)
	movq	8(%rsp), %rcx
	movl	1092(%rcx), %eax
	movl	64080(%rcx), %ecx
	incl	%ecx
	cmpl	%ecx, %eax
	jne	.LBB66_17
# BB#19:                                # %land.lhs.true
                                        #   in Loop: Header=BB66_7 Depth=1
	incl	EdgeProfCounters+7936(%rip)
	movq	8(%rsp), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB66_20
# BB#21:                                # %if.then23
                                        #   in Loop: Header=BB66_7 Depth=1
	incl	EdgeProfCounters+7944(%rip)
	movq	8(%rsp), %rax
	notl	3184(%rax)
	movq	8(%rsp), %rax
	cmpl	$2, 52(%rax)
	jle	.LBB66_22
# BB#23:                                # %if.then26
                                        #   in Loop: Header=BB66_7 Depth=1
	incl	EdgeProfCounters+7952(%rip)
	movq	8(%rsp), %rax
	movl	3176(%rax), %edx
	movl	3184(%rax), %ecx
	movq	stderr(%rip), %rdi
	movl	$.L.str2110, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+7960(%rip)
	jmp	.LBB66_24
	.align	16, 0x90
.LBB66_22:                              # %if.then23.if.end29_crit_edge
                                        #   in Loop: Header=BB66_7 Depth=1
	incl	EdgeProfCounters+7956(%rip)
.LBB66_24:                              # %if.end29
                                        #   in Loop: Header=BB66_7 Depth=1
	movq	8(%rsp), %rax
	cmpl	$1, 52(%rax)
	jle	.LBB66_25
# BB#26:                                # %if.then32
                                        #   in Loop: Header=BB66_7 Depth=1
	incl	EdgeProfCounters+7964(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str3111, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+7972(%rip)
	jmp	.LBB66_27
	.align	16, 0x90
.LBB66_25:                              # %if.end29.if.end34_crit_edge
                                        #   in Loop: Header=BB66_7 Depth=1
	incl	EdgeProfCounters+7968(%rip)
.LBB66_27:                              # %if.end34
                                        #   in Loop: Header=BB66_7 Depth=1
	movq	8(%rsp), %rax
	movl	3184(%rax), %ecx
	cmpl	3176(%rax), %ecx
	jne	.LBB66_28
# BB#29:                                # %if.end46
                                        #   in Loop: Header=BB66_7 Depth=1
	incl	EdgeProfCounters+7980(%rip)
	movq	8(%rsp), %rax
	roll	3188(%rax)
	movq	8(%rsp), %rax
	movl	3184(%rax), %ecx
	xorl	%ecx, 3188(%rax)
	movq	8(%rsp), %rax
	movl	$14, 8(%rax)
	incl	EdgeProfCounters+7988(%rip)
	incl	EdgeProfCounters+7996(%rip)
.LBB66_30:                              # %if.end47
                                        #   in Loop: Header=BB66_7 Depth=1
	movq	8(%rsp), %rax
	cmpl	$9, 8(%rax)
	jle	.LBB66_31
# BB#32:                                # %if.then50
                                        #   in Loop: Header=BB66_7 Depth=1
	incl	EdgeProfCounters+8000(%rip)
	movq	8(%rsp), %rdi
	callq	BZ2_decompress
	movl	%eax, 4(%rsp)
	cmpl	$4, %eax
	je	.LBB66_33
# BB#38:                                # %if.end65
                                        #   in Loop: Header=BB66_7 Depth=1
	incl	EdgeProfCounters+8012(%rip)
	movq	8(%rsp), %rax
	cmpl	$2, 8(%rax)
	jne	.LBB66_39
# BB#40:                                # %if.end69
                                        #   in Loop: Header=BB66_7 Depth=1
	incl	EdgeProfCounters+8048(%rip)
	incl	EdgeProfCounters+8056(%rip)
	incl	EdgeProfCounters+8060(%rip)
	jmp	.LBB66_7
.LBB66_8:                               # %if.then10
	incl	EdgeProfCounters+7888(%rip)
	movl	$-1, 36(%rsp)
	incl	EdgeProfCounters+7896(%rip)
	jmp	.LBB66_42
.LBB66_15:                              # %if.then19
	incl	EdgeProfCounters+7924(%rip)
	movl	$-4, 36(%rsp)
	incl	EdgeProfCounters+7932(%rip)
	jmp	.LBB66_42
.LBB66_17:                              # %if.end20.if.else45_crit_edge
	incl	EdgeProfCounters+7940(%rip)
	jmp	.LBB66_18
.LBB66_20:                              # %land.lhs.true.if.else45_crit_edge
	incl	EdgeProfCounters+7948(%rip)
.LBB66_18:                              # %if.else45
	movl	$0, 36(%rsp)
	incl	EdgeProfCounters+7992(%rip)
	jmp	.LBB66_42
.LBB66_33:                              # %if.then53
	incl	EdgeProfCounters+8008(%rip)
	movq	8(%rsp), %rax
	cmpl	$2, 52(%rax)
	jle	.LBB66_34
# BB#35:                                # %if.then56
	incl	EdgeProfCounters+8016(%rip)
	movq	8(%rsp), %rax
	movl	3180(%rax), %edx
	movl	3188(%rax), %ecx
	movq	stderr(%rip), %rdi
	movl	$.L.str4112, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+8024(%rip)
	jmp	.LBB66_36
.LBB66_39:                              # %if.then68
	incl	EdgeProfCounters+8044(%rip)
	movl	4(%rsp), %eax
	movl	%eax, 36(%rsp)
	incl	EdgeProfCounters+8052(%rip)
	jmp	.LBB66_42
.LBB66_28:                              # %if.then38
	incl	EdgeProfCounters+7976(%rip)
	movl	$-4, 36(%rsp)
	incl	EdgeProfCounters+7984(%rip)
	jmp	.LBB66_42
.LBB66_34:                              # %if.then53.if.end59_crit_edge
	incl	EdgeProfCounters+8020(%rip)
.LBB66_36:                              # %if.end59
	movq	8(%rsp), %rax
	movl	3188(%rax), %ecx
	cmpl	3180(%rax), %ecx
	je	.LBB66_41
# BB#37:                                # %if.then63
	incl	EdgeProfCounters+8028(%rip)
	movl	$-4, 36(%rsp)
	incl	EdgeProfCounters+8036(%rip)
	jmp	.LBB66_42
.LBB66_41:                              # %if.end64
	incl	EdgeProfCounters+8032(%rip)
	movl	4(%rsp), %eax
	movl	%eax, 36(%rsp)
	incl	EdgeProfCounters+8040(%rip)
	jmp	.LBB66_42
.Ltmp265:
	.size	BZ2_bzDecompress, .Ltmp265-BZ2_bzDecompress
	.cfi_endproc

	.align	16, 0x90
	.type	unRLE_obuf_to_output_SMALL,@function
unRLE_obuf_to_output_SMALL:             # @unRLE_obuf_to_output_SMALL
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp267:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+8064(%rip)
	movq	%rdi, 8(%rsp)
	cmpb	$0, 20(%rdi)
	je	.LBB67_66
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+8068(%rip)
	incl	EdgeProfCounters+8076(%rip)
	jmp	.LBB67_2
.LBB67_66:                              # %if.else
	incl	EdgeProfCounters+8072(%rip)
	incl	EdgeProfCounters+8344(%rip)
	jmp	.LBB67_67
	.align	16, 0x90
.LBB67_22:                              # %if.then87
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8172(%rip)
	incl	EdgeProfCounters+8180(%rip)
.LBB67_2:                               # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB67_3 Depth 2
	incl	EdgeProfCounters+8080(%rip)
	jmp	.LBB67_3
	.align	16, 0x90
.LBB67_7:                               # %if.end6.if.end26_crit_edge
                                        #   in Loop: Header=BB67_3 Depth=2
	incl	EdgeProfCounters+8112(%rip)
	incl	EdgeProfCounters+8120(%rip)
.LBB67_3:                               # %while.body2
                                        #   Parent Loop BB67_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 32(%rax)
	je	.LBB67_4
# BB#5:                                 # %if.end
                                        #   in Loop: Header=BB67_3 Depth=2
	incl	EdgeProfCounters+8088(%rip)
	movq	8(%rsp), %rax
	cmpl	$0, 16(%rax)
	je	.LBB67_9
# BB#6:                                 # %if.end6
                                        #   in Loop: Header=BB67_3 Depth=2
	incl	EdgeProfCounters+8100(%rip)
	movq	8(%rsp), %rcx
	movb	12(%rcx), %al
	movq	(%rcx), %rcx
	movq	24(%rcx), %rcx
	movb	%al, (%rcx)
	movq	8(%rsp), %rax
	movzbl	12(%rax), %esi
	movl	3184(%rax), %ecx
	movl	%ecx, %edx
	shrl	$24, %edx
	xorl	%esi, %edx
	shll	$8, %ecx
	xorl	BZ2_crc32Table(,%rdx,4), %ecx
	movl	%ecx, 3184(%rax)
	movq	8(%rsp), %rax
	decl	16(%rax)
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	incq	24(%rax)
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	decl	32(%rax)
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	incl	36(%rax)
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 36(%rax)
	jne	.LBB67_7
# BB#8:                                 # %if.then23
                                        #   in Loop: Header=BB67_3 Depth=2
	incl	EdgeProfCounters+8108(%rip)
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	incl	40(%rax)
	incl	EdgeProfCounters+8116(%rip)
	incl	EdgeProfCounters+8120(%rip)
	jmp	.LBB67_3
	.align	16, 0x90
.LBB67_9:                               # %while.end
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8096(%rip)
	incl	EdgeProfCounters+8104(%rip)
	movq	8(%rsp), %rcx
	movl	1092(%rcx), %eax
	movl	64080(%rcx), %ecx
	incl	%ecx
	cmpl	%ecx, %eax
	je	.LBB67_10
# BB#11:                                # %if.end30
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8128(%rip)
	movq	8(%rsp), %rcx
	movl	1092(%rcx), %eax
	movl	64080(%rcx), %ecx
	incl	%ecx
	cmpl	%ecx, %eax
	jg	.LBB67_12
# BB#13:                                # %if.end37
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8140(%rip)
	movq	8(%rsp), %rax
	movl	$1, 16(%rax)
	movq	8(%rsp), %rax
	movb	64(%rax), %cl
	movb	%cl, 12(%rax)
	movq	8(%rsp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi             # imm = 0x448
	callq	BZ2_indexIntoF
	movb	%al, 7(%rsp)
	movq	8(%rsp), %rax
	movl	60(%rax), %ecx
	movl	%ecx, %esi
	shrl	%esi
	movq	3160(%rax), %rdx
	movq	3168(%rax), %rdi
	movzwl	(%rdx,%rcx,2), %edx
	movzbl	(%rdi,%rsi), %esi
	leal	(,%rcx,4), %ecx
	andb	$4, %cl
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %esi
	andl	$15, %esi
	shll	$16, %esi
	orl	%edx, %esi
	movl	%esi, 60(%rax)
	movq	8(%rsp), %rax
	cmpl	$0, 24(%rax)
	jne	.LBB67_14
# BB#15:                                # %if.then59
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8148(%rip)
	movq	8(%rsp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	8(%rsp), %rax
	incl	28(%rax)
	movq	8(%rsp), %rax
	cmpl	$512, 28(%rax)          # imm = 0x200
	jne	.LBB67_16
# BB#17:                                # %if.then68
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8156(%rip)
	movq	8(%rsp), %rax
	movl	$0, 28(%rax)
	incl	EdgeProfCounters+8164(%rip)
	jmp	.LBB67_18
	.align	16, 0x90
.LBB67_14:                              # %if.end37.if.end71_crit_edge
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8152(%rip)
	jmp	.LBB67_19
.LBB67_16:                              # %if.then59.if.end70_crit_edge
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8160(%rip)
.LBB67_18:                              # %if.end70
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8168(%rip)
.LBB67_19:                              # %if.end71
                                        #   in Loop: Header=BB67_2 Depth=1
	movq	8(%rsp), %rax
	decl	24(%rax)
	movq	8(%rsp), %rcx
	movl	$1, %eax
	cmpl	$1, 24(%rcx)
	je	.LBB67_21
# BB#20:                                # %select.mid
                                        #   in Loop: Header=BB67_2 Depth=1
	xorl	%eax, %eax
.LBB67_21:                              # %select.end
                                        #   in Loop: Header=BB67_2 Depth=1
	movzbl	7(%rsp), %ecx
	xorl	%eax, %ecx
	movb	%cl, 7(%rsp)
	movq	8(%rsp), %rax
	incl	1092(%rax)
	movq	8(%rsp), %rcx
	movl	1092(%rcx), %eax
	movl	64080(%rcx), %ecx
	incl	%ecx
	cmpl	%ecx, %eax
	je	.LBB67_22
# BB#23:                                # %if.end88
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8176(%rip)
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	cmpl	64(%rax), %ecx
	je	.LBB67_25
# BB#24:                                # %if.then93
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8184(%rip)
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	movl	%ecx, 64(%rax)
	incl	EdgeProfCounters+8192(%rip)
	jmp	.LBB67_2
.LBB67_25:                              # %if.end96
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8188(%rip)
	movq	8(%rsp), %rax
	movl	$2, 16(%rax)
	movq	8(%rsp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi             # imm = 0x448
	callq	BZ2_indexIntoF
	movb	%al, 7(%rsp)
	movq	8(%rsp), %rax
	movl	60(%rax), %ecx
	movl	%ecx, %esi
	shrl	%esi
	movq	3160(%rax), %rdx
	movq	3168(%rax), %rdi
	movzwl	(%rdx,%rcx,2), %edx
	movzbl	(%rdi,%rsi), %esi
	leal	(,%rcx,4), %ecx
	andb	$4, %cl
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %esi
	andl	$15, %esi
	shll	$16, %esi
	orl	%edx, %esi
	movl	%esi, 60(%rax)
	movq	8(%rsp), %rax
	cmpl	$0, 24(%rax)
	jne	.LBB67_26
# BB#27:                                # %if.then125
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8196(%rip)
	movq	8(%rsp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	8(%rsp), %rax
	incl	28(%rax)
	movq	8(%rsp), %rax
	cmpl	$512, 28(%rax)          # imm = 0x200
	jne	.LBB67_28
# BB#29:                                # %if.then135
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8204(%rip)
	movq	8(%rsp), %rax
	movl	$0, 28(%rax)
	incl	EdgeProfCounters+8212(%rip)
	jmp	.LBB67_30
.LBB67_26:                              # %if.end96.if.end138_crit_edge
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8200(%rip)
	jmp	.LBB67_31
.LBB67_28:                              # %if.then125.if.end137_crit_edge
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8208(%rip)
.LBB67_30:                              # %if.end137
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8216(%rip)
.LBB67_31:                              # %if.end138
                                        #   in Loop: Header=BB67_2 Depth=1
	movq	8(%rsp), %rax
	decl	24(%rax)
	movq	8(%rsp), %rcx
	movl	$1, %eax
	cmpl	$1, 24(%rcx)
	je	.LBB67_33
# BB#32:                                # %select.mid11
                                        #   in Loop: Header=BB67_2 Depth=1
	xorl	%eax, %eax
.LBB67_33:                              # %select.end10
                                        #   in Loop: Header=BB67_2 Depth=1
	movzbl	7(%rsp), %ecx
	xorl	%eax, %ecx
	movb	%cl, 7(%rsp)
	movq	8(%rsp), %rax
	incl	1092(%rax)
	movq	8(%rsp), %rcx
	movl	1092(%rcx), %eax
	movl	64080(%rcx), %ecx
	incl	%ecx
	cmpl	%ecx, %eax
	jne	.LBB67_35
# BB#34:                                # %if.then155
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8220(%rip)
	incl	EdgeProfCounters+8228(%rip)
	jmp	.LBB67_2
.LBB67_35:                              # %if.end156
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8224(%rip)
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	cmpl	64(%rax), %ecx
	je	.LBB67_37
# BB#36:                                # %if.then161
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8232(%rip)
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	movl	%ecx, 64(%rax)
	incl	EdgeProfCounters+8240(%rip)
	jmp	.LBB67_2
.LBB67_37:                              # %if.end164
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8236(%rip)
	movq	8(%rsp), %rax
	movl	$3, 16(%rax)
	movq	8(%rsp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi             # imm = 0x448
	callq	BZ2_indexIntoF
	movb	%al, 7(%rsp)
	movq	8(%rsp), %rax
	movl	60(%rax), %ecx
	movl	%ecx, %esi
	shrl	%esi
	movq	3160(%rax), %rdx
	movq	3168(%rax), %rdi
	movzwl	(%rdx,%rcx,2), %edx
	movzbl	(%rdi,%rsi), %esi
	leal	(,%rcx,4), %ecx
	andb	$4, %cl
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %esi
	andl	$15, %esi
	shll	$16, %esi
	orl	%edx, %esi
	movl	%esi, 60(%rax)
	movq	8(%rsp), %rax
	cmpl	$0, 24(%rax)
	jne	.LBB67_38
# BB#39:                                # %if.then193
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8244(%rip)
	movq	8(%rsp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	8(%rsp), %rax
	incl	28(%rax)
	movq	8(%rsp), %rax
	cmpl	$512, 28(%rax)          # imm = 0x200
	jne	.LBB67_40
# BB#41:                                # %if.then203
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8252(%rip)
	movq	8(%rsp), %rax
	movl	$0, 28(%rax)
	incl	EdgeProfCounters+8260(%rip)
	jmp	.LBB67_42
.LBB67_38:                              # %if.end164.if.end206_crit_edge
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8248(%rip)
	jmp	.LBB67_43
.LBB67_40:                              # %if.then193.if.end205_crit_edge
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8256(%rip)
.LBB67_42:                              # %if.end205
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8264(%rip)
.LBB67_43:                              # %if.end206
                                        #   in Loop: Header=BB67_2 Depth=1
	movq	8(%rsp), %rax
	decl	24(%rax)
	movq	8(%rsp), %rcx
	movl	$1, %eax
	cmpl	$1, 24(%rcx)
	je	.LBB67_45
# BB#44:                                # %select.mid14
                                        #   in Loop: Header=BB67_2 Depth=1
	xorl	%eax, %eax
.LBB67_45:                              # %select.end13
                                        #   in Loop: Header=BB67_2 Depth=1
	movzbl	7(%rsp), %ecx
	xorl	%eax, %ecx
	movb	%cl, 7(%rsp)
	movq	8(%rsp), %rax
	incl	1092(%rax)
	movq	8(%rsp), %rcx
	movl	1092(%rcx), %eax
	movl	64080(%rcx), %ecx
	incl	%ecx
	cmpl	%ecx, %eax
	jne	.LBB67_47
# BB#46:                                # %if.then223
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8268(%rip)
	incl	EdgeProfCounters+8276(%rip)
	jmp	.LBB67_2
.LBB67_47:                              # %if.end224
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8272(%rip)
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	cmpl	64(%rax), %ecx
	je	.LBB67_49
# BB#48:                                # %if.then229
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8280(%rip)
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	movl	%ecx, 64(%rax)
	incl	EdgeProfCounters+8288(%rip)
	jmp	.LBB67_2
.LBB67_49:                              # %if.end232
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8284(%rip)
	movq	8(%rsp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi             # imm = 0x448
	callq	BZ2_indexIntoF
	movb	%al, 7(%rsp)
	movq	8(%rsp), %rax
	movl	60(%rax), %ecx
	movl	%ecx, %esi
	shrl	%esi
	movq	3160(%rax), %rdx
	movq	3168(%rax), %rdi
	movzwl	(%rdx,%rcx,2), %edx
	movzbl	(%rdi,%rsi), %esi
	leal	(,%rcx,4), %ecx
	andb	$4, %cl
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %esi
	andl	$15, %esi
	shll	$16, %esi
	orl	%edx, %esi
	movl	%esi, 60(%rax)
	movq	8(%rsp), %rax
	cmpl	$0, 24(%rax)
	jne	.LBB67_50
# BB#51:                                # %if.then260
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8292(%rip)
	movq	8(%rsp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	8(%rsp), %rax
	incl	28(%rax)
	movq	8(%rsp), %rax
	cmpl	$512, 28(%rax)          # imm = 0x200
	jne	.LBB67_52
# BB#53:                                # %if.then270
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8300(%rip)
	movq	8(%rsp), %rax
	movl	$0, 28(%rax)
	incl	EdgeProfCounters+8308(%rip)
	jmp	.LBB67_54
.LBB67_50:                              # %if.end232.if.end273_crit_edge
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8296(%rip)
	jmp	.LBB67_55
.LBB67_52:                              # %if.then260.if.end272_crit_edge
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8304(%rip)
.LBB67_54:                              # %if.end272
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8312(%rip)
.LBB67_55:                              # %if.end273
                                        #   in Loop: Header=BB67_2 Depth=1
	movq	8(%rsp), %rax
	decl	24(%rax)
	movq	8(%rsp), %rcx
	movl	$1, %eax
	cmpl	$1, 24(%rcx)
	je	.LBB67_57
# BB#56:                                # %select.mid17
                                        #   in Loop: Header=BB67_2 Depth=1
	xorl	%eax, %eax
.LBB67_57:                              # %select.end16
                                        #   in Loop: Header=BB67_2 Depth=1
	movzbl	7(%rsp), %ecx
	xorl	%eax, %ecx
	movb	%cl, 7(%rsp)
	movq	8(%rsp), %rax
	incl	1092(%rax)
	movzbl	7(%rsp), %eax
	addl	$4, %eax
	movq	8(%rsp), %rcx
	movl	%eax, 16(%rcx)
	movq	8(%rsp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi             # imm = 0x448
	callq	BZ2_indexIntoF
	movq	8(%rsp), %rcx
	movl	%eax, 64(%rcx)
	movq	8(%rsp), %rax
	movl	60(%rax), %ecx
	movl	%ecx, %esi
	shrl	%esi
	movq	3160(%rax), %rdx
	movq	3168(%rax), %rdi
	movzwl	(%rdx,%rcx,2), %edx
	movzbl	(%rdi,%rsi), %esi
	leal	(,%rcx,4), %ecx
	andb	$4, %cl
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %esi
	andl	$15, %esi
	shll	$16, %esi
	orl	%edx, %esi
	movl	%esi, 60(%rax)
	movq	8(%rsp), %rax
	cmpl	$0, 24(%rax)
	jne	.LBB67_58
# BB#59:                                # %if.then315
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8316(%rip)
	movq	8(%rsp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	8(%rsp), %rax
	incl	28(%rax)
	movq	8(%rsp), %rax
	cmpl	$512, 28(%rax)          # imm = 0x200
	jne	.LBB67_60
# BB#61:                                # %if.then325
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8324(%rip)
	movq	8(%rsp), %rax
	movl	$0, 28(%rax)
	incl	EdgeProfCounters+8332(%rip)
	jmp	.LBB67_62
.LBB67_58:                              # %if.end273.if.end328_crit_edge
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8320(%rip)
	jmp	.LBB67_63
.LBB67_60:                              # %if.then315.if.end327_crit_edge
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8328(%rip)
.LBB67_62:                              # %if.end327
                                        #   in Loop: Header=BB67_2 Depth=1
	incl	EdgeProfCounters+8336(%rip)
.LBB67_63:                              # %if.end328
                                        #   in Loop: Header=BB67_2 Depth=1
	movq	8(%rsp), %rax
	decl	24(%rax)
	movq	8(%rsp), %rcx
	movl	$1, %eax
	cmpl	$1, 24(%rcx)
	je	.LBB67_65
# BB#64:                                # %select.mid19
                                        #   in Loop: Header=BB67_2 Depth=1
	xorl	%eax, %eax
.LBB67_65:                              # %select.end18
                                        #   in Loop: Header=BB67_2 Depth=1
	movq	8(%rsp), %rcx
	xorl	%eax, 64(%rcx)
	movq	8(%rsp), %rax
	incl	1092(%rax)
	incl	EdgeProfCounters+8340(%rip)
	jmp	.LBB67_2
.LBB67_4:                               # %if.then3
	incl	EdgeProfCounters+8084(%rip)
	movb	$0, 23(%rsp)
	incl	EdgeProfCounters+8092(%rip)
	jmp	.LBB67_78
.LBB67_80:                              # %if.then437
                                        #   in Loop: Header=BB67_67 Depth=1
	incl	EdgeProfCounters+8416(%rip)
	incl	EdgeProfCounters+8424(%rip)
.LBB67_67:                              # %while.body339
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB67_68 Depth 2
	incl	EdgeProfCounters+8348(%rip)
	jmp	.LBB67_68
	.align	16, 0x90
.LBB67_72:                              # %if.end352.if.end386_crit_edge
                                        #   in Loop: Header=BB67_68 Depth=2
	incl	EdgeProfCounters+8380(%rip)
	incl	EdgeProfCounters+8388(%rip)
.LBB67_68:                              # %while.body341
                                        #   Parent Loop BB67_67 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 32(%rax)
	je	.LBB67_69
# BB#70:                                # %if.end347
                                        #   in Loop: Header=BB67_68 Depth=2
	incl	EdgeProfCounters+8356(%rip)
	movq	8(%rsp), %rax
	cmpl	$0, 16(%rax)
	je	.LBB67_74
# BB#71:                                # %if.end352
                                        #   in Loop: Header=BB67_68 Depth=2
	incl	EdgeProfCounters+8368(%rip)
	movq	8(%rsp), %rcx
	movb	12(%rcx), %al
	movq	(%rcx), %rcx
	movq	24(%rcx), %rcx
	movb	%al, (%rcx)
	movq	8(%rsp), %rax
	movzbl	12(%rax), %esi
	movl	3184(%rax), %ecx
	movl	%ecx, %edx
	shrl	$24, %edx
	xorl	%esi, %edx
	shll	$8, %ecx
	xorl	BZ2_crc32Table(,%rdx,4), %ecx
	movl	%ecx, 3184(%rax)
	movq	8(%rsp), %rax
	decl	16(%rax)
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	incq	24(%rax)
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	decl	32(%rax)
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	incl	36(%rax)
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 36(%rax)
	jne	.LBB67_72
# BB#73:                                # %if.then382
                                        #   in Loop: Header=BB67_68 Depth=2
	incl	EdgeProfCounters+8376(%rip)
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	incl	40(%rax)
	incl	EdgeProfCounters+8384(%rip)
	incl	EdgeProfCounters+8388(%rip)
	jmp	.LBB67_68
	.align	16, 0x90
.LBB67_74:                              # %while.end387
                                        #   in Loop: Header=BB67_67 Depth=1
	incl	EdgeProfCounters+8364(%rip)
	incl	EdgeProfCounters+8372(%rip)
	movq	8(%rsp), %rcx
	movl	1092(%rcx), %eax
	movl	64080(%rcx), %ecx
	incl	%ecx
	cmpl	%ecx, %eax
	je	.LBB67_75
# BB#76:                                # %if.end394
                                        #   in Loop: Header=BB67_67 Depth=1
	incl	EdgeProfCounters+8396(%rip)
	movq	8(%rsp), %rcx
	movl	1092(%rcx), %eax
	movl	64080(%rcx), %ecx
	incl	%ecx
	cmpl	%ecx, %eax
	jg	.LBB67_77
# BB#79:                                # %if.end401
                                        #   in Loop: Header=BB67_67 Depth=1
	incl	EdgeProfCounters+8408(%rip)
	movq	8(%rsp), %rax
	movl	$1, 16(%rax)
	movq	8(%rsp), %rax
	movb	64(%rax), %cl
	movb	%cl, 12(%rax)
	movq	8(%rsp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi             # imm = 0x448
	callq	BZ2_indexIntoF
	movb	%al, 7(%rsp)
	movq	8(%rsp), %rax
	movl	60(%rax), %ecx
	movl	%ecx, %esi
	shrl	%esi
	movq	3160(%rax), %rdx
	movq	3168(%rax), %rdi
	movzwl	(%rdx,%rcx,2), %edx
	movzbl	(%rdi,%rsi), %esi
	leal	(,%rcx,4), %ecx
	andb	$4, %cl
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %esi
	andl	$15, %esi
	shll	$16, %esi
	orl	%edx, %esi
	movl	%esi, 60(%rax)
	movq	8(%rsp), %rax
	incl	1092(%rax)
	movq	8(%rsp), %rcx
	movl	1092(%rcx), %eax
	movl	64080(%rcx), %ecx
	incl	%ecx
	cmpl	%ecx, %eax
	je	.LBB67_80
# BB#81:                                # %if.end438
                                        #   in Loop: Header=BB67_67 Depth=1
	incl	EdgeProfCounters+8420(%rip)
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	cmpl	64(%rax), %ecx
	je	.LBB67_83
# BB#82:                                # %if.then443
                                        #   in Loop: Header=BB67_67 Depth=1
	incl	EdgeProfCounters+8428(%rip)
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	movl	%ecx, 64(%rax)
	incl	EdgeProfCounters+8436(%rip)
	jmp	.LBB67_67
.LBB67_83:                              # %if.end446
                                        #   in Loop: Header=BB67_67 Depth=1
	incl	EdgeProfCounters+8432(%rip)
	movq	8(%rsp), %rax
	movl	$2, 16(%rax)
	movq	8(%rsp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi             # imm = 0x448
	callq	BZ2_indexIntoF
	movb	%al, 7(%rsp)
	movq	8(%rsp), %rax
	movl	60(%rax), %ecx
	movl	%ecx, %esi
	shrl	%esi
	movq	3160(%rax), %rdx
	movq	3168(%rax), %rdi
	movzwl	(%rdx,%rcx,2), %edx
	movzbl	(%rdi,%rsi), %esi
	leal	(,%rcx,4), %ecx
	andb	$4, %cl
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %esi
	andl	$15, %esi
	shll	$16, %esi
	orl	%edx, %esi
	movl	%esi, 60(%rax)
	movq	8(%rsp), %rax
	incl	1092(%rax)
	movq	8(%rsp), %rcx
	movl	1092(%rcx), %eax
	movl	64080(%rcx), %ecx
	incl	%ecx
	cmpl	%ecx, %eax
	jne	.LBB67_85
# BB#84:                                # %if.then479
                                        #   in Loop: Header=BB67_67 Depth=1
	incl	EdgeProfCounters+8440(%rip)
	incl	EdgeProfCounters+8448(%rip)
	jmp	.LBB67_67
.LBB67_85:                              # %if.end480
                                        #   in Loop: Header=BB67_67 Depth=1
	incl	EdgeProfCounters+8444(%rip)
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	cmpl	64(%rax), %ecx
	je	.LBB67_87
# BB#86:                                # %if.then485
                                        #   in Loop: Header=BB67_67 Depth=1
	incl	EdgeProfCounters+8452(%rip)
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	movl	%ecx, 64(%rax)
	incl	EdgeProfCounters+8460(%rip)
	jmp	.LBB67_67
.LBB67_87:                              # %if.end488
                                        #   in Loop: Header=BB67_67 Depth=1
	incl	EdgeProfCounters+8456(%rip)
	movq	8(%rsp), %rax
	movl	$3, 16(%rax)
	movq	8(%rsp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi             # imm = 0x448
	callq	BZ2_indexIntoF
	movb	%al, 7(%rsp)
	movq	8(%rsp), %rax
	movl	60(%rax), %ecx
	movl	%ecx, %esi
	shrl	%esi
	movq	3160(%rax), %rdx
	movq	3168(%rax), %rdi
	movzwl	(%rdx,%rcx,2), %edx
	movzbl	(%rdi,%rsi), %esi
	leal	(,%rcx,4), %ecx
	andb	$4, %cl
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %esi
	andl	$15, %esi
	shll	$16, %esi
	orl	%edx, %esi
	movl	%esi, 60(%rax)
	movq	8(%rsp), %rax
	incl	1092(%rax)
	movq	8(%rsp), %rcx
	movl	1092(%rcx), %eax
	movl	64080(%rcx), %ecx
	incl	%ecx
	cmpl	%ecx, %eax
	jne	.LBB67_89
# BB#88:                                # %if.then521
                                        #   in Loop: Header=BB67_67 Depth=1
	incl	EdgeProfCounters+8464(%rip)
	incl	EdgeProfCounters+8472(%rip)
	jmp	.LBB67_67
.LBB67_89:                              # %if.end522
                                        #   in Loop: Header=BB67_67 Depth=1
	incl	EdgeProfCounters+8468(%rip)
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	cmpl	64(%rax), %ecx
	je	.LBB67_91
# BB#90:                                # %if.then527
                                        #   in Loop: Header=BB67_67 Depth=1
	incl	EdgeProfCounters+8476(%rip)
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	movl	%ecx, 64(%rax)
	incl	EdgeProfCounters+8484(%rip)
	jmp	.LBB67_67
.LBB67_91:                              # %if.end530
                                        #   in Loop: Header=BB67_67 Depth=1
	incl	EdgeProfCounters+8480(%rip)
	movq	8(%rsp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi             # imm = 0x448
	callq	BZ2_indexIntoF
	movb	%al, 7(%rsp)
	movq	8(%rsp), %rax
	movl	60(%rax), %ecx
	movl	%ecx, %esi
	shrl	%esi
	movq	3160(%rax), %rdx
	movq	3168(%rax), %rdi
	movzwl	(%rdx,%rcx,2), %edx
	movzbl	(%rdi,%rsi), %esi
	leal	(,%rcx,4), %ecx
	andb	$4, %cl
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %esi
	andl	$15, %esi
	shll	$16, %esi
	orl	%edx, %esi
	movl	%esi, 60(%rax)
	movq	8(%rsp), %rax
	incl	1092(%rax)
	movzbl	7(%rsp), %eax
	addl	$4, %eax
	movq	8(%rsp), %rcx
	movl	%eax, 16(%rcx)
	movq	8(%rsp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi             # imm = 0x448
	callq	BZ2_indexIntoF
	movq	8(%rsp), %rcx
	movl	%eax, 64(%rcx)
	movq	8(%rsp), %rax
	movl	60(%rax), %ecx
	movl	%ecx, %esi
	shrl	%esi
	movq	3160(%rax), %rdx
	movq	3168(%rax), %rdi
	movzwl	(%rdx,%rcx,2), %edx
	movzbl	(%rdi,%rsi), %esi
	leal	(,%rcx,4), %ecx
	andb	$4, %cl
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %esi
	andl	$15, %esi
	shll	$16, %esi
	orl	%edx, %esi
	movl	%esi, 60(%rax)
	movq	8(%rsp), %rax
	incl	1092(%rax)
	incl	EdgeProfCounters+8488(%rip)
	jmp	.LBB67_67
.LBB67_69:                              # %if.then346
	incl	EdgeProfCounters+8352(%rip)
	movb	$0, 23(%rsp)
	incl	EdgeProfCounters+8360(%rip)
.LBB67_78:                              # %return
	movzbl	23(%rsp), %eax
	addq	$24, %rsp
	ret
.LBB67_10:                              # %if.then29
	incl	EdgeProfCounters+8124(%rip)
	movb	$0, 23(%rsp)
	incl	EdgeProfCounters+8132(%rip)
	jmp	.LBB67_78
.LBB67_12:                              # %if.then36
	incl	EdgeProfCounters+8136(%rip)
	movb	$1, 23(%rsp)
	incl	EdgeProfCounters+8144(%rip)
	jmp	.LBB67_78
.LBB67_75:                              # %if.then393
	incl	EdgeProfCounters+8392(%rip)
	movb	$0, 23(%rsp)
	incl	EdgeProfCounters+8400(%rip)
	jmp	.LBB67_78
.LBB67_77:                              # %if.then400
	incl	EdgeProfCounters+8404(%rip)
	movb	$1, 23(%rsp)
	incl	EdgeProfCounters+8412(%rip)
	jmp	.LBB67_78
.Ltmp268:
	.size	unRLE_obuf_to_output_SMALL, .Ltmp268-unRLE_obuf_to_output_SMALL
	.cfi_endproc

	.align	16, 0x90
	.type	unRLE_obuf_to_output_FAST,@function
unRLE_obuf_to_output_FAST:              # @unRLE_obuf_to_output_FAST
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+8492(%rip)
	movq	%rdi, -16(%rsp)
	cmpb	$0, 20(%rdi)
	je	.LBB68_66
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+8496(%rip)
	incl	EdgeProfCounters+8504(%rip)
	movl	$255, %eax
	jmp	.LBB68_2
.LBB68_66:                              # %if.else
	incl	EdgeProfCounters+8500(%rip)
	movq	-16(%rsp), %rax
	movl	3184(%rax), %eax
	movl	%eax, -24(%rsp)
	movq	-16(%rsp), %rax
	movb	12(%rax), %al
	movb	%al, -25(%rsp)
	movq	-16(%rsp), %rax
	movl	16(%rax), %eax
	movl	%eax, -32(%rsp)
	movq	-16(%rsp), %rax
	movl	1092(%rax), %eax
	movl	%eax, -36(%rsp)
	movq	-16(%rsp), %rax
	movl	64(%rax), %eax
	movl	%eax, -40(%rsp)
	movq	-16(%rsp), %rax
	movq	3152(%rax), %rax
	movq	%rax, -48(%rsp)
	movq	-16(%rsp), %rax
	movl	60(%rax), %eax
	movl	%eax, -52(%rsp)
	movq	-16(%rsp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movq	%rax, -64(%rsp)
	movq	-16(%rsp), %rax
	movq	(%rax), %rax
	movl	32(%rax), %eax
	movl	%eax, -68(%rsp)
	movl	%eax, -72(%rsp)
	movq	-16(%rsp), %rax
	movl	64080(%rax), %eax
	incl	%eax
	movl	%eax, -76(%rsp)
	incl	EdgeProfCounters+8772(%rip)
	jmp	.LBB68_67
	.align	16, 0x90
.LBB68_22:                              # %if.then78
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8600(%rip)
	incl	EdgeProfCounters+8608(%rip)
.LBB68_2:                               # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB68_3 Depth 2
	incl	EdgeProfCounters+8508(%rip)
	jmp	.LBB68_3
	.align	16, 0x90
.LBB68_7:                               # %if.end6.if.end26_crit_edge
                                        #   in Loop: Header=BB68_3 Depth=2
	incl	EdgeProfCounters+8540(%rip)
	incl	EdgeProfCounters+8548(%rip)
.LBB68_3:                               # %while.body2
                                        #   Parent Loop BB68_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-16(%rsp), %rcx
	movq	(%rcx), %rcx
	cmpl	$0, 32(%rcx)
	je	.LBB68_4
# BB#5:                                 # %if.end
                                        #   in Loop: Header=BB68_3 Depth=2
	incl	EdgeProfCounters+8516(%rip)
	movq	-16(%rsp), %rcx
	cmpl	$0, 16(%rcx)
	je	.LBB68_9
# BB#6:                                 # %if.end6
                                        #   in Loop: Header=BB68_3 Depth=2
	incl	EdgeProfCounters+8528(%rip)
	movq	-16(%rsp), %rdx
	movb	12(%rdx), %cl
	movq	(%rdx), %rdx
	movq	24(%rdx), %rdx
	movb	%cl, (%rdx)
	movq	-16(%rsp), %rcx
	movzbl	12(%rcx), %edi
	movl	3184(%rcx), %edx
	movl	%edx, %esi
	shrl	$24, %esi
	xorl	%edi, %esi
	shll	$8, %edx
	xorl	BZ2_crc32Table(,%rsi,4), %edx
	movl	%edx, 3184(%rcx)
	movq	-16(%rsp), %rcx
	decl	16(%rcx)
	movq	-16(%rsp), %rcx
	movq	(%rcx), %rcx
	incq	24(%rcx)
	movq	-16(%rsp), %rcx
	movq	(%rcx), %rcx
	decl	32(%rcx)
	movq	-16(%rsp), %rcx
	movq	(%rcx), %rcx
	incl	36(%rcx)
	movq	-16(%rsp), %rcx
	movq	(%rcx), %rcx
	cmpl	$0, 36(%rcx)
	jne	.LBB68_7
# BB#8:                                 # %if.then23
                                        #   in Loop: Header=BB68_3 Depth=2
	incl	EdgeProfCounters+8536(%rip)
	movq	-16(%rsp), %rcx
	movq	(%rcx), %rcx
	incl	40(%rcx)
	incl	EdgeProfCounters+8544(%rip)
	incl	EdgeProfCounters+8548(%rip)
	jmp	.LBB68_3
	.align	16, 0x90
.LBB68_9:                               # %while.end
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8524(%rip)
	incl	EdgeProfCounters+8532(%rip)
	movq	-16(%rsp), %rdx
	movl	1092(%rdx), %ecx
	movl	64080(%rdx), %edx
	incl	%edx
	cmpl	%edx, %ecx
	je	.LBB68_10
# BB#11:                                # %if.end30
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8556(%rip)
	movq	-16(%rsp), %rdx
	movl	1092(%rdx), %ecx
	movl	64080(%rdx), %edx
	incl	%edx
	cmpl	%edx, %ecx
	jg	.LBB68_12
# BB#13:                                # %if.end37
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8568(%rip)
	movq	-16(%rsp), %rcx
	movl	$1, 16(%rcx)
	movq	-16(%rsp), %rcx
	movb	64(%rcx), %dl
	movb	%dl, 12(%rcx)
	movq	-16(%rsp), %rcx
	movl	60(%rcx), %edx
	movq	3152(%rcx), %rsi
	movl	(%rsi,%rdx,4), %edx
	movl	%edx, 60(%rcx)
	movq	-16(%rsp), %rcx
	movb	60(%rcx), %cl
	movb	%cl, -17(%rsp)
	movq	-16(%rsp), %rcx
	shrl	$8, 60(%rcx)
	movq	-16(%rsp), %rcx
	cmpl	$0, 24(%rcx)
	jne	.LBB68_14
# BB#15:                                # %if.then50
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8576(%rip)
	movq	-16(%rsp), %rcx
	movslq	28(%rcx), %rdx
	movl	BZ2_rNums(,%rdx,4), %edx
	movl	%edx, 24(%rcx)
	movq	-16(%rsp), %rcx
	incl	28(%rcx)
	movq	-16(%rsp), %rcx
	cmpl	$512, 28(%rcx)          # imm = 0x200
	jne	.LBB68_16
# BB#17:                                # %if.then59
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8584(%rip)
	movq	-16(%rsp), %rcx
	movl	$0, 28(%rcx)
	incl	EdgeProfCounters+8592(%rip)
	jmp	.LBB68_18
	.align	16, 0x90
.LBB68_14:                              # %if.end37.if.end62_crit_edge
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8580(%rip)
	jmp	.LBB68_19
.LBB68_16:                              # %if.then50.if.end61_crit_edge
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8588(%rip)
.LBB68_18:                              # %if.end61
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8596(%rip)
.LBB68_19:                              # %if.end62
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	decl	24(%rcx)
	movq	-16(%rsp), %rdx
	movl	$1, %ecx
	cmpl	$1, 24(%rdx)
	je	.LBB68_21
# BB#20:                                # %select.mid
                                        #   in Loop: Header=BB68_2 Depth=1
	xorl	%ecx, %ecx
.LBB68_21:                              # %select.end
                                        #   in Loop: Header=BB68_2 Depth=1
	movzbl	-17(%rsp), %edx
	xorl	%ecx, %edx
	movb	%dl, -17(%rsp)
	movq	-16(%rsp), %rcx
	incl	1092(%rcx)
	movq	-16(%rsp), %rdx
	movl	1092(%rdx), %ecx
	movl	64080(%rdx), %edx
	incl	%edx
	cmpl	%edx, %ecx
	je	.LBB68_22
# BB#23:                                # %if.end79
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8604(%rip)
	movq	-16(%rsp), %rcx
	movzbl	-17(%rsp), %edx
	cmpl	64(%rcx), %edx
	je	.LBB68_25
# BB#24:                                # %if.then84
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8612(%rip)
	movq	-16(%rsp), %rcx
	movzbl	-17(%rsp), %edx
	movl	%edx, 64(%rcx)
	incl	EdgeProfCounters+8620(%rip)
	jmp	.LBB68_2
.LBB68_25:                              # %if.end87
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8616(%rip)
	movq	-16(%rsp), %rcx
	movl	$2, 16(%rcx)
	movq	-16(%rsp), %rcx
	movl	60(%rcx), %edx
	movq	3152(%rcx), %rsi
	movl	(%rsi,%rdx,4), %edx
	movl	%edx, 60(%rcx)
	movq	-16(%rsp), %rcx
	movb	60(%rcx), %cl
	movb	%cl, -17(%rsp)
	movq	-16(%rsp), %rcx
	shrl	$8, 60(%rcx)
	movq	-16(%rsp), %rcx
	cmpl	$0, 24(%rcx)
	jne	.LBB68_26
# BB#27:                                # %if.then102
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8624(%rip)
	movq	-16(%rsp), %rcx
	movslq	28(%rcx), %rdx
	movl	BZ2_rNums(,%rdx,4), %edx
	movl	%edx, 24(%rcx)
	movq	-16(%rsp), %rcx
	incl	28(%rcx)
	movq	-16(%rsp), %rcx
	cmpl	$512, 28(%rcx)          # imm = 0x200
	jne	.LBB68_28
# BB#29:                                # %if.then112
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8632(%rip)
	movq	-16(%rsp), %rcx
	movl	$0, 28(%rcx)
	incl	EdgeProfCounters+8640(%rip)
	jmp	.LBB68_30
.LBB68_26:                              # %if.end87.if.end115_crit_edge
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8628(%rip)
	jmp	.LBB68_31
.LBB68_28:                              # %if.then102.if.end114_crit_edge
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8636(%rip)
.LBB68_30:                              # %if.end114
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8644(%rip)
.LBB68_31:                              # %if.end115
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	decl	24(%rcx)
	movq	-16(%rsp), %rdx
	movl	$1, %ecx
	cmpl	$1, 24(%rdx)
	je	.LBB68_33
# BB#32:                                # %select.mid9
                                        #   in Loop: Header=BB68_2 Depth=1
	xorl	%ecx, %ecx
.LBB68_33:                              # %select.end8
                                        #   in Loop: Header=BB68_2 Depth=1
	movzbl	-17(%rsp), %edx
	xorl	%ecx, %edx
	movb	%dl, -17(%rsp)
	movq	-16(%rsp), %rcx
	incl	1092(%rcx)
	movq	-16(%rsp), %rdx
	movl	1092(%rdx), %ecx
	movl	64080(%rdx), %edx
	incl	%edx
	cmpl	%edx, %ecx
	jne	.LBB68_35
# BB#34:                                # %if.then132
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8648(%rip)
	incl	EdgeProfCounters+8656(%rip)
	jmp	.LBB68_2
.LBB68_35:                              # %if.end133
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8652(%rip)
	movq	-16(%rsp), %rcx
	movzbl	-17(%rsp), %edx
	cmpl	64(%rcx), %edx
	je	.LBB68_37
# BB#36:                                # %if.then138
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8660(%rip)
	movq	-16(%rsp), %rcx
	movzbl	-17(%rsp), %edx
	movl	%edx, 64(%rcx)
	incl	EdgeProfCounters+8668(%rip)
	jmp	.LBB68_2
.LBB68_37:                              # %if.end141
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8664(%rip)
	movq	-16(%rsp), %rcx
	movl	$3, 16(%rcx)
	movq	-16(%rsp), %rcx
	movl	60(%rcx), %edx
	movq	3152(%rcx), %rsi
	movl	(%rsi,%rdx,4), %edx
	movl	%edx, 60(%rcx)
	movq	-16(%rsp), %rcx
	movb	60(%rcx), %cl
	movb	%cl, -17(%rsp)
	movq	-16(%rsp), %rcx
	shrl	$8, 60(%rcx)
	movq	-16(%rsp), %rcx
	cmpl	$0, 24(%rcx)
	jne	.LBB68_38
# BB#39:                                # %if.then156
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8672(%rip)
	movq	-16(%rsp), %rcx
	movslq	28(%rcx), %rdx
	movl	BZ2_rNums(,%rdx,4), %edx
	movl	%edx, 24(%rcx)
	movq	-16(%rsp), %rcx
	incl	28(%rcx)
	movq	-16(%rsp), %rcx
	cmpl	$512, 28(%rcx)          # imm = 0x200
	jne	.LBB68_40
# BB#41:                                # %if.then166
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8680(%rip)
	movq	-16(%rsp), %rcx
	movl	$0, 28(%rcx)
	incl	EdgeProfCounters+8688(%rip)
	jmp	.LBB68_42
.LBB68_38:                              # %if.end141.if.end169_crit_edge
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8676(%rip)
	jmp	.LBB68_43
.LBB68_40:                              # %if.then156.if.end168_crit_edge
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8684(%rip)
.LBB68_42:                              # %if.end168
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8692(%rip)
.LBB68_43:                              # %if.end169
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	decl	24(%rcx)
	movq	-16(%rsp), %rdx
	movl	$1, %ecx
	cmpl	$1, 24(%rdx)
	je	.LBB68_45
# BB#44:                                # %select.mid11
                                        #   in Loop: Header=BB68_2 Depth=1
	xorl	%ecx, %ecx
.LBB68_45:                              # %select.end10
                                        #   in Loop: Header=BB68_2 Depth=1
	movzbl	-17(%rsp), %edx
	xorl	%ecx, %edx
	movb	%dl, -17(%rsp)
	movq	-16(%rsp), %rcx
	incl	1092(%rcx)
	movq	-16(%rsp), %rdx
	movl	1092(%rdx), %ecx
	movl	64080(%rdx), %edx
	incl	%edx
	cmpl	%edx, %ecx
	jne	.LBB68_47
# BB#46:                                # %if.then186
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8696(%rip)
	incl	EdgeProfCounters+8704(%rip)
	jmp	.LBB68_2
.LBB68_47:                              # %if.end187
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8700(%rip)
	movq	-16(%rsp), %rcx
	movzbl	-17(%rsp), %edx
	cmpl	64(%rcx), %edx
	je	.LBB68_49
# BB#48:                                # %if.then192
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8708(%rip)
	movq	-16(%rsp), %rcx
	movzbl	-17(%rsp), %edx
	movl	%edx, 64(%rcx)
	incl	EdgeProfCounters+8716(%rip)
	jmp	.LBB68_2
.LBB68_49:                              # %if.end195
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8712(%rip)
	movq	-16(%rsp), %rcx
	movl	60(%rcx), %edx
	movq	3152(%rcx), %rsi
	movl	(%rsi,%rdx,4), %edx
	movl	%edx, 60(%rcx)
	movq	-16(%rsp), %rcx
	movb	60(%rcx), %cl
	movb	%cl, -17(%rsp)
	movq	-16(%rsp), %rcx
	shrl	$8, 60(%rcx)
	movq	-16(%rsp), %rcx
	cmpl	$0, 24(%rcx)
	jne	.LBB68_50
# BB#51:                                # %if.then209
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8720(%rip)
	movq	-16(%rsp), %rcx
	movslq	28(%rcx), %rdx
	movl	BZ2_rNums(,%rdx,4), %edx
	movl	%edx, 24(%rcx)
	movq	-16(%rsp), %rcx
	incl	28(%rcx)
	movq	-16(%rsp), %rcx
	cmpl	$512, 28(%rcx)          # imm = 0x200
	jne	.LBB68_52
# BB#53:                                # %if.then219
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8728(%rip)
	movq	-16(%rsp), %rcx
	movl	$0, 28(%rcx)
	incl	EdgeProfCounters+8736(%rip)
	jmp	.LBB68_54
.LBB68_50:                              # %if.end195.if.end222_crit_edge
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8724(%rip)
	jmp	.LBB68_55
.LBB68_52:                              # %if.then209.if.end221_crit_edge
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8732(%rip)
.LBB68_54:                              # %if.end221
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8740(%rip)
.LBB68_55:                              # %if.end222
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	decl	24(%rcx)
	movq	-16(%rsp), %rdx
	movl	$1, %ecx
	cmpl	$1, 24(%rdx)
	je	.LBB68_57
# BB#56:                                # %select.mid13
                                        #   in Loop: Header=BB68_2 Depth=1
	xorl	%ecx, %ecx
.LBB68_57:                              # %select.end12
                                        #   in Loop: Header=BB68_2 Depth=1
	movzbl	-17(%rsp), %edx
	xorl	%ecx, %edx
	movb	%dl, -17(%rsp)
	movq	-16(%rsp), %rcx
	incl	1092(%rcx)
	movzbl	-17(%rsp), %ecx
	addl	$4, %ecx
	movq	-16(%rsp), %rdx
	movl	%ecx, 16(%rdx)
	movq	-16(%rsp), %rcx
	movl	60(%rcx), %edx
	movq	3152(%rcx), %rsi
	movl	(%rsi,%rdx,4), %edx
	movl	%edx, 60(%rcx)
	movq	-16(%rsp), %rcx
	movl	60(%rcx), %edx
	andl	%eax, %edx
	movl	%edx, 64(%rcx)
	movq	-16(%rsp), %rcx
	shrl	$8, 60(%rcx)
	movq	-16(%rsp), %rcx
	cmpl	$0, 24(%rcx)
	jne	.LBB68_58
# BB#59:                                # %if.then252
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8744(%rip)
	movq	-16(%rsp), %rcx
	movslq	28(%rcx), %rdx
	movl	BZ2_rNums(,%rdx,4), %edx
	movl	%edx, 24(%rcx)
	movq	-16(%rsp), %rcx
	incl	28(%rcx)
	movq	-16(%rsp), %rcx
	cmpl	$512, 28(%rcx)          # imm = 0x200
	jne	.LBB68_60
# BB#61:                                # %if.then262
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8752(%rip)
	movq	-16(%rsp), %rcx
	movl	$0, 28(%rcx)
	incl	EdgeProfCounters+8760(%rip)
	jmp	.LBB68_62
.LBB68_58:                              # %if.end222.if.end265_crit_edge
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8748(%rip)
	jmp	.LBB68_63
.LBB68_60:                              # %if.then252.if.end264_crit_edge
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8756(%rip)
.LBB68_62:                              # %if.end264
                                        #   in Loop: Header=BB68_2 Depth=1
	incl	EdgeProfCounters+8764(%rip)
.LBB68_63:                              # %if.end265
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	decl	24(%rcx)
	movq	-16(%rsp), %rdx
	movl	$1, %ecx
	cmpl	$1, 24(%rdx)
	je	.LBB68_65
# BB#64:                                # %select.mid15
                                        #   in Loop: Header=BB68_2 Depth=1
	xorl	%ecx, %ecx
.LBB68_65:                              # %select.end14
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rdx
	xorl	%ecx, 64(%rdx)
	movq	-16(%rsp), %rcx
	incl	1092(%rcx)
	incl	EdgeProfCounters+8768(%rip)
	jmp	.LBB68_2
.LBB68_4:                               # %if.then3
	incl	EdgeProfCounters+8512(%rip)
	movb	$0, -1(%rsp)
	incl	EdgeProfCounters+8520(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB68_89:                              # %if.then361
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8884(%rip)
	incl	EdgeProfCounters+8892(%rip)
	.align	16, 0x90
.LBB68_67:                              # %while.body289
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB68_70 Depth 2
	cmpl	$0, -32(%rsp)
	jle	.LBB68_68
# BB#69:                                # %if.then292
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8776(%rip)
	incl	EdgeProfCounters+8784(%rip)
	jmp	.LBB68_70
	.align	16, 0x90
.LBB68_73:                              # %if.end302
                                        #   in Loop: Header=BB68_70 Depth=2
	incl	EdgeProfCounters+8804(%rip)
	movq	-64(%rsp), %rax
	movb	-25(%rsp), %cl
	movb	%cl, (%rax)
	movl	-24(%rsp), %eax
	movl	%eax, %edx
	shrl	$24, %edx
	movzbl	-25(%rsp), %ecx
	xorl	%edx, %ecx
	shll	$8, %eax
	xorl	BZ2_crc32Table(,%rcx,4), %eax
	movl	%eax, -24(%rsp)
	decl	-32(%rsp)
	incq	-64(%rsp)
	decl	-68(%rsp)
	incl	EdgeProfCounters+8812(%rip)
.LBB68_70:                              # %while.body294
                                        #   Parent Loop BB68_67 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, -68(%rsp)
	je	.LBB68_71
# BB#72:                                # %if.end298
                                        #   in Loop: Header=BB68_70 Depth=2
	incl	EdgeProfCounters+8792(%rip)
	cmpl	$1, -32(%rsp)
	jne	.LBB68_73
# BB#74:                                # %while.end313
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8800(%rip)
	incl	EdgeProfCounters+8808(%rip)
	incl	EdgeProfCounters+8816(%rip)
	jmp	.LBB68_75
	.align	16, 0x90
.LBB68_68:                              # %while.body289.if.end327_crit_edge
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8780(%rip)
	jmp	.LBB68_78
	.align	16, 0x90
.LBB68_75:                              # %s_state_out_len_eq_one
                                        #   in Loop: Header=BB68_67 Depth=1
	cmpl	$0, -68(%rsp)
	je	.LBB68_76
# BB#77:                                # %if.end317
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8824(%rip)
	movq	-64(%rsp), %rax
	movb	-25(%rsp), %cl
	movb	%cl, (%rax)
	movl	-24(%rsp), %eax
	movl	%eax, %edx
	shrl	$24, %edx
	movzbl	-25(%rsp), %ecx
	xorl	%edx, %ecx
	shll	$8, %eax
	xorl	BZ2_crc32Table(,%rcx,4), %eax
	movl	%eax, -24(%rsp)
	incq	-64(%rsp)
	decl	-68(%rsp)
	incl	EdgeProfCounters+8832(%rip)
.LBB68_78:                              # %if.end327
                                        #   in Loop: Header=BB68_67 Depth=1
	movl	-36(%rsp), %eax
	cmpl	-76(%rsp), %eax
	jg	.LBB68_79
# BB#80:                                # %if.end331
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8840(%rip)
	movl	-36(%rsp), %eax
	cmpl	-76(%rsp), %eax
	je	.LBB68_81
# BB#84:                                # %if.end335
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8852(%rip)
	movb	-40(%rsp), %al
	movb	%al, -25(%rsp)
	movl	-52(%rsp), %eax
	movq	-48(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, -52(%rsp)
	movb	-52(%rsp), %al
	movb	%al, -17(%rsp)
	shrl	$8, -52(%rsp)
	incl	-36(%rsp)
	movzbl	-17(%rsp), %eax
	cmpl	-40(%rsp), %eax
	je	.LBB68_86
# BB#85:                                # %if.then346
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8860(%rip)
	movzbl	-17(%rsp), %eax
	movl	%eax, -40(%rsp)
	incl	EdgeProfCounters+8868(%rip)
	jmp	.LBB68_75
	.align	16, 0x90
.LBB68_86:                              # %if.end348
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8864(%rip)
	movl	-36(%rsp), %eax
	cmpl	-76(%rsp), %eax
	jne	.LBB68_88
# BB#87:                                # %if.then351
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8872(%rip)
	incl	EdgeProfCounters+8880(%rip)
	jmp	.LBB68_75
.LBB68_88:                              # %if.end352
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8876(%rip)
	movl	$2, -32(%rsp)
	movl	-52(%rsp), %eax
	movq	-48(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, -52(%rsp)
	movb	-52(%rsp), %al
	movb	%al, -17(%rsp)
	shrl	$8, -52(%rsp)
	movl	-36(%rsp), %eax
	incl	%eax
	movl	%eax, -36(%rsp)
	cmpl	-76(%rsp), %eax
	je	.LBB68_89
# BB#90:                                # %if.end362
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8888(%rip)
	movzbl	-17(%rsp), %eax
	cmpl	-40(%rsp), %eax
	je	.LBB68_92
# BB#91:                                # %if.then366
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8896(%rip)
	movzbl	-17(%rsp), %eax
	movl	%eax, -40(%rsp)
	incl	EdgeProfCounters+8904(%rip)
	jmp	.LBB68_67
.LBB68_92:                              # %if.end368
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8900(%rip)
	movl	$3, -32(%rsp)
	movl	-52(%rsp), %eax
	movq	-48(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, -52(%rsp)
	movb	-52(%rsp), %al
	movb	%al, -17(%rsp)
	shrl	$8, -52(%rsp)
	movl	-36(%rsp), %eax
	incl	%eax
	movl	%eax, -36(%rsp)
	cmpl	-76(%rsp), %eax
	jne	.LBB68_94
# BB#93:                                # %if.then377
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8908(%rip)
	incl	EdgeProfCounters+8916(%rip)
	jmp	.LBB68_67
.LBB68_94:                              # %if.end378
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8912(%rip)
	movzbl	-17(%rsp), %eax
	cmpl	-40(%rsp), %eax
	je	.LBB68_96
# BB#95:                                # %if.then382
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8920(%rip)
	movzbl	-17(%rsp), %eax
	movl	%eax, -40(%rsp)
	incl	EdgeProfCounters+8928(%rip)
	jmp	.LBB68_67
.LBB68_96:                              # %if.end384
                                        #   in Loop: Header=BB68_67 Depth=1
	incl	EdgeProfCounters+8924(%rip)
	movl	-52(%rsp), %eax
	movq	-48(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, -52(%rsp)
	movb	-52(%rsp), %al
	movb	%al, -17(%rsp)
	shrl	$8, -52(%rsp)
	incl	-36(%rsp)
	movzbl	-17(%rsp), %eax
	addl	$4, %eax
	movl	%eax, -32(%rsp)
	movl	-52(%rsp), %eax
	movq	-48(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, -52(%rsp)
	movzbl	%al, %eax
	movl	%eax, -40(%rsp)
	shrl	$8, -52(%rsp)
	incl	-36(%rsp)
	incl	EdgeProfCounters+8932(%rip)
	jmp	.LBB68_67
.LBB68_71:                              # %if.then297
	incl	EdgeProfCounters+8788(%rip)
	incl	EdgeProfCounters+8796(%rip)
.LBB68_82:                              # %return_notr
	movq	-16(%rsp), %rax
	movq	(%rax), %rax
	movl	36(%rax), %eax
	movl	%eax, -80(%rsp)
	movq	-16(%rsp), %rax
	movq	(%rax), %rax
	movl	-72(%rsp), %ecx
	subl	-68(%rsp), %ecx
	addl	%ecx, 36(%rax)
	movq	-16(%rsp), %rax
	movq	(%rax), %rax
	movl	36(%rax), %eax
	cmpl	-80(%rsp), %eax
	jae	.LBB68_83
# BB#97:                                # %if.then409
	incl	EdgeProfCounters+8936(%rip)
	movq	-16(%rsp), %rax
	movq	(%rax), %rax
	incl	40(%rax)
	incl	EdgeProfCounters+8944(%rip)
	jmp	.LBB68_98
.LBB68_83:                              # %return_notr.if.end413_crit_edge
	incl	EdgeProfCounters+8940(%rip)
.LBB68_98:                              # %if.end425
	movq	-16(%rsp), %rax
	movl	-24(%rsp), %ecx
	movl	%ecx, 3184(%rax)
	movq	-16(%rsp), %rax
	movb	-25(%rsp), %cl
	movb	%cl, 12(%rax)
	movq	-16(%rsp), %rax
	movl	-32(%rsp), %ecx
	movl	%ecx, 16(%rax)
	movq	-16(%rsp), %rax
	movl	-36(%rsp), %ecx
	movl	%ecx, 1092(%rax)
	movq	-16(%rsp), %rax
	movl	-40(%rsp), %ecx
	movl	%ecx, 64(%rax)
	movq	-16(%rsp), %rax
	movq	-48(%rsp), %rcx
	movq	%rcx, 3152(%rax)
	movq	-16(%rsp), %rax
	movl	-52(%rsp), %ecx
	movl	%ecx, 60(%rax)
	movq	-16(%rsp), %rax
	movq	(%rax), %rax
	movq	-64(%rsp), %rcx
	movq	%rcx, 24(%rax)
	movq	-16(%rsp), %rax
	movq	(%rax), %rax
	movl	-68(%rsp), %ecx
	movl	%ecx, 32(%rax)
	incl	EdgeProfCounters+8948(%rip)
	movb	$0, -1(%rsp)
	incl	EdgeProfCounters+8952(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB68_79:                              # %if.then330
	incl	EdgeProfCounters+8836(%rip)
	movb	$1, -1(%rsp)
	incl	EdgeProfCounters+8844(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB68_81:                              # %if.then334
	incl	EdgeProfCounters+8848(%rip)
	movl	$0, -32(%rsp)
	incl	EdgeProfCounters+8856(%rip)
	jmp	.LBB68_82
.LBB68_10:                              # %if.then29
	incl	EdgeProfCounters+8552(%rip)
	movb	$0, -1(%rsp)
	incl	EdgeProfCounters+8560(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB68_12:                              # %if.then36
	incl	EdgeProfCounters+8564(%rip)
	movb	$1, -1(%rsp)
	incl	EdgeProfCounters+8572(%rip)
	movzbl	-1(%rsp), %eax
	ret
.LBB68_76:                              # %if.then316
	incl	EdgeProfCounters+8820(%rip)
	movl	$1, -32(%rsp)
	incl	EdgeProfCounters+8828(%rip)
	jmp	.LBB68_82
.Ltmp269:
	.size	unRLE_obuf_to_output_FAST, .Ltmp269-unRLE_obuf_to_output_FAST
	.cfi_endproc

	.globl	BZ2_bzDecompressEnd
	.align	16, 0x90
	.type	BZ2_bzDecompressEnd,@function
BZ2_bzDecompressEnd:                    # @BZ2_bzDecompressEnd
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp271:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+8956(%rip)
	movq	%rdi, 8(%rsp)
	testq	%rdi, %rdi
	je	.LBB69_1
# BB#2:                                 # %if.end
	incl	EdgeProfCounters+8964(%rip)
	movq	8(%rsp), %rax
	movq	48(%rax), %rax
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.LBB69_3
# BB#4:                                 # %if.end3
	incl	EdgeProfCounters+8976(%rip)
	movq	(%rsp), %rax
	movq	(%rax), %rax
	cmpq	8(%rsp), %rax
	je	.LBB69_6
# BB#5:                                 # %if.then6
	incl	EdgeProfCounters+8984(%rip)
	movl	$-2, 20(%rsp)
	incl	EdgeProfCounters+8992(%rip)
	jmp	.LBB69_16
.LBB69_1:                               # %if.then
	incl	EdgeProfCounters+8960(%rip)
	movl	$-2, 20(%rsp)
	incl	EdgeProfCounters+8968(%rip)
	jmp	.LBB69_16
.LBB69_3:                               # %if.then2
	incl	EdgeProfCounters+8972(%rip)
	movl	$-2, 20(%rsp)
	incl	EdgeProfCounters+8980(%rip)
	jmp	.LBB69_16
.LBB69_6:                               # %if.end7
	incl	EdgeProfCounters+8988(%rip)
	movq	(%rsp), %rax
	cmpq	$0, 3152(%rax)
	je	.LBB69_7
# BB#8:                                 # %if.then9
	incl	EdgeProfCounters+8996(%rip)
	movq	(%rsp), %rax
	movq	3152(%rax), %rsi
	movq	8(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
	incl	EdgeProfCounters+9004(%rip)
	jmp	.LBB69_9
.LBB69_7:                               # %if.end7.if.end11_crit_edge
	incl	EdgeProfCounters+9000(%rip)
.LBB69_9:                               # %if.end11
	movq	(%rsp), %rax
	cmpq	$0, 3160(%rax)
	je	.LBB69_10
# BB#11:                                # %if.then13
	incl	EdgeProfCounters+9008(%rip)
	movq	(%rsp), %rax
	movq	3160(%rax), %rsi
	movq	8(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
	incl	EdgeProfCounters+9016(%rip)
	jmp	.LBB69_12
.LBB69_10:                              # %if.end11.if.end17_crit_edge
	incl	EdgeProfCounters+9012(%rip)
.LBB69_12:                              # %if.end17
	movq	(%rsp), %rax
	cmpq	$0, 3168(%rax)
	je	.LBB69_13
# BB#14:                                # %if.then19
	incl	EdgeProfCounters+9020(%rip)
	movq	(%rsp), %rax
	movq	3168(%rax), %rsi
	movq	8(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
	incl	EdgeProfCounters+9028(%rip)
	jmp	.LBB69_15
.LBB69_13:                              # %if.end17.if.end23_crit_edge
	incl	EdgeProfCounters+9024(%rip)
.LBB69_15:                              # %if.end23
	movq	8(%rsp), %rax
	movq	48(%rax), %rsi
	movq	72(%rax), %rdi
	callq	*64(%rax)
	movq	8(%rsp), %rax
	movq	$0, 48(%rax)
	movl	$0, 20(%rsp)
	incl	EdgeProfCounters+9032(%rip)
.LBB69_16:                              # %return
	movl	20(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp272:
	.size	BZ2_bzDecompressEnd, .Ltmp272-BZ2_bzDecompressEnd
	.cfi_endproc

	.globl	BZ2_bzWriteOpen
	.align	16, 0x90
	.type	BZ2_bzWriteOpen,@function
BZ2_bzWriteOpen:                        # @BZ2_bzWriteOpen
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$56, %rsp
.Ltmp274:
	.cfi_def_cfa_offset 64
	incl	EdgeProfCounters+9036(%rip)
	movq	%rdi, 40(%rsp)
	movq	%rsi, 32(%rsp)
	movl	%edx, 28(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%r8d, 20(%rsp)
	movq	$0, 8(%rsp)
	cmpq	$0, 40(%rsp)
	je	.LBB70_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+9040(%rip)
	movq	40(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+9048(%rip)
	jmp	.LBB70_3
.LBB70_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+9044(%rip)
.LBB70_3:                               # %if.end
	cmpq	$0, 8(%rsp)
	je	.LBB70_4
# BB#5:                                 # %if.then2
	incl	EdgeProfCounters+9052(%rip)
	movq	8(%rsp), %rax
	movl	$0, 5096(%rax)
	incl	EdgeProfCounters+9060(%rip)
	jmp	.LBB70_6
.LBB70_4:                               # %if.end.if.end3_crit_edge
	incl	EdgeProfCounters+9056(%rip)
.LBB70_6:                               # %if.end3
	cmpq	$0, 32(%rsp)
	je	.LBB70_7
# BB#8:                                 # %lor.lhs.false
	incl	EdgeProfCounters+9068(%rip)
	cmpl	$0, 28(%rsp)
	jle	.LBB70_9
# BB#10:                                # %lor.lhs.false6
	incl	EdgeProfCounters+9076(%rip)
	cmpl	$10, 28(%rsp)
	jl	.LBB70_12
# BB#11:                                # %lor.lhs.false6.if.then16_crit_edge
	incl	EdgeProfCounters+9080(%rip)
	jmp	.LBB70_20
.LBB70_7:                               # %if.end3.if.then16_crit_edge
	incl	EdgeProfCounters+9064(%rip)
	jmp	.LBB70_20
.LBB70_9:                               # %lor.lhs.false.if.then16_crit_edge
	incl	EdgeProfCounters+9072(%rip)
	jmp	.LBB70_20
.LBB70_12:                              # %lor.lhs.false8
	incl	EdgeProfCounters+9084(%rip)
	cmpl	$0, 20(%rsp)
	js	.LBB70_13
# BB#14:                                # %lor.lhs.false10
	incl	EdgeProfCounters+9092(%rip)
	cmpl	$251, 20(%rsp)
	jl	.LBB70_16
# BB#15:                                # %lor.lhs.false10.if.then16_crit_edge
	incl	EdgeProfCounters+9096(%rip)
	jmp	.LBB70_20
.LBB70_13:                              # %lor.lhs.false8.if.then16_crit_edge
	incl	EdgeProfCounters+9088(%rip)
	jmp	.LBB70_20
.LBB70_16:                              # %lor.lhs.false12
	incl	EdgeProfCounters+9100(%rip)
	cmpl	$0, 24(%rsp)
	js	.LBB70_17
# BB#18:                                # %lor.lhs.false14
	incl	EdgeProfCounters+9108(%rip)
	cmpl	$5, 24(%rsp)
	jl	.LBB70_27
# BB#19:                                # %lor.lhs.false14.if.then16_crit_edge
	incl	EdgeProfCounters+9112(%rip)
	jmp	.LBB70_20
.LBB70_17:                              # %lor.lhs.false12.if.then16_crit_edge
	incl	EdgeProfCounters+9104(%rip)
.LBB70_20:                              # %if.then16
	cmpq	$0, 40(%rsp)
	je	.LBB70_21
# BB#22:                                # %if.then18
	incl	EdgeProfCounters+9120(%rip)
	movq	40(%rsp), %rax
	movl	$-2, (%rax)
	incl	EdgeProfCounters+9128(%rip)
	jmp	.LBB70_23
.LBB70_21:                              # %if.then16.if.end19_crit_edge
	incl	EdgeProfCounters+9124(%rip)
.LBB70_23:                              # %if.end19
	cmpq	$0, 8(%rsp)
	je	.LBB70_24
# BB#25:                                # %if.then21
	incl	EdgeProfCounters+9132(%rip)
	movq	8(%rsp), %rax
	movl	$-2, 5096(%rax)
	incl	EdgeProfCounters+9140(%rip)
	jmp	.LBB70_26
.LBB70_24:                              # %if.end19.if.end23_crit_edge
	incl	EdgeProfCounters+9136(%rip)
.LBB70_26:                              # %if.end23
	movq	$0, 48(%rsp)
	incl	EdgeProfCounters+9144(%rip)
.LBB70_61:                              # %return
	movq	48(%rsp), %rax
	addq	$56, %rsp
	ret
.LBB70_27:                              # %if.end24
	incl	EdgeProfCounters+9116(%rip)
	movq	32(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB70_35
# BB#28:                                # %if.then25
	incl	EdgeProfCounters+9148(%rip)
	cmpq	$0, 40(%rsp)
	je	.LBB70_29
# BB#30:                                # %if.then27
	incl	EdgeProfCounters+9156(%rip)
	movq	40(%rsp), %rax
	movl	$-6, (%rax)
	incl	EdgeProfCounters+9164(%rip)
	jmp	.LBB70_31
.LBB70_35:                              # %if.end33
	incl	EdgeProfCounters+9152(%rip)
	movl	$5104, %edi             # imm = 0x13F0
	callq	malloc
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.LBB70_36
# BB#43:                                # %if.end44
	incl	EdgeProfCounters+9188(%rip)
	cmpq	$0, 40(%rsp)
	je	.LBB70_44
# BB#45:                                # %if.then46
	incl	EdgeProfCounters+9220(%rip)
	movq	40(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+9228(%rip)
	jmp	.LBB70_46
.LBB70_29:                              # %if.then25.if.end28_crit_edge
	incl	EdgeProfCounters+9160(%rip)
.LBB70_31:                              # %if.end28
	cmpq	$0, 8(%rsp)
	je	.LBB70_32
# BB#33:                                # %if.then30
	incl	EdgeProfCounters+9168(%rip)
	movq	8(%rsp), %rax
	movl	$-6, 5096(%rax)
	incl	EdgeProfCounters+9176(%rip)
	jmp	.LBB70_34
.LBB70_32:                              # %if.end28.if.end32_crit_edge
	incl	EdgeProfCounters+9172(%rip)
.LBB70_34:                              # %if.end32
	movq	$0, 48(%rsp)
	incl	EdgeProfCounters+9180(%rip)
	jmp	.LBB70_61
.LBB70_36:                              # %if.then36
	incl	EdgeProfCounters+9184(%rip)
	cmpq	$0, 40(%rsp)
	je	.LBB70_37
# BB#38:                                # %if.then38
	incl	EdgeProfCounters+9192(%rip)
	movq	40(%rsp), %rax
	movl	$-3, (%rax)
	incl	EdgeProfCounters+9200(%rip)
	jmp	.LBB70_39
.LBB70_44:                              # %if.end44.if.end47_crit_edge
	incl	EdgeProfCounters+9224(%rip)
.LBB70_46:                              # %if.end47
	cmpq	$0, 8(%rsp)
	je	.LBB70_47
# BB#48:                                # %if.then49
	incl	EdgeProfCounters+9232(%rip)
	movq	8(%rsp), %rax
	movl	$0, 5096(%rax)
	incl	EdgeProfCounters+9240(%rip)
	jmp	.LBB70_49
.LBB70_47:                              # %if.end47.if.end51_crit_edge
	incl	EdgeProfCounters+9236(%rip)
.LBB70_49:                              # %if.end51
	movq	8(%rsp), %rax
	movb	$0, 5100(%rax)
	movq	8(%rsp), %rax
	movl	$0, 5008(%rax)
	movq	8(%rsp), %rax
	movq	32(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	8(%rsp), %rax
	movb	$1, 5012(%rax)
	movq	8(%rsp), %rax
	movq	$0, 5072(%rax)
	movq	8(%rsp), %rax
	movq	$0, 5080(%rax)
	movq	8(%rsp), %rax
	movq	$0, 5088(%rax)
	cmpl	$0, 20(%rsp)
	je	.LBB70_51
# BB#50:                                # %if.end51.if.end56_crit_edge
	incl	EdgeProfCounters+9248(%rip)
	jmp	.LBB70_52
.LBB70_37:                              # %if.then36.if.end39_crit_edge
	incl	EdgeProfCounters+9196(%rip)
.LBB70_39:                              # %if.end39
	cmpq	$0, 8(%rsp)
	je	.LBB70_40
# BB#41:                                # %if.then41
	incl	EdgeProfCounters+9204(%rip)
	movq	8(%rsp), %rax
	movl	$-3, 5096(%rax)
	incl	EdgeProfCounters+9212(%rip)
	jmp	.LBB70_42
.LBB70_51:                              # %if.then55
	incl	EdgeProfCounters+9244(%rip)
	movl	$30, 20(%rsp)
	incl	EdgeProfCounters+9252(%rip)
.LBB70_52:                              # %if.end56
	movl	$5016, %edi             # imm = 0x1398
	addq	8(%rsp), %rdi
	movl	20(%rsp), %ecx
	movl	24(%rsp), %edx
	movl	28(%rsp), %esi
	callq	BZ2_bzCompressInit
	movl	%eax, 16(%rsp)
	testl	%eax, %eax
	je	.LBB70_60
# BB#53:                                # %if.then60
	incl	EdgeProfCounters+9256(%rip)
	cmpq	$0, 40(%rsp)
	je	.LBB70_54
# BB#55:                                # %if.then62
	incl	EdgeProfCounters+9264(%rip)
	movq	40(%rsp), %rax
	movl	16(%rsp), %ecx
	movl	%ecx, (%rax)
	incl	EdgeProfCounters+9272(%rip)
	jmp	.LBB70_56
.LBB70_40:                              # %if.end39.if.end43_crit_edge
	incl	EdgeProfCounters+9208(%rip)
.LBB70_42:                              # %if.end43
	movq	$0, 48(%rsp)
	incl	EdgeProfCounters+9216(%rip)
	jmp	.LBB70_61
.LBB70_60:                              # %if.end68
	incl	EdgeProfCounters+9260(%rip)
	movq	8(%rsp), %rax
	movl	$0, 5024(%rax)
	movq	8(%rsp), %rax
	movb	$1, 5100(%rax)
	movq	8(%rsp), %rax
	movq	%rax, 48(%rsp)
	incl	EdgeProfCounters+9292(%rip)
	jmp	.LBB70_61
.LBB70_54:                              # %if.then60.if.end63_crit_edge
	incl	EdgeProfCounters+9268(%rip)
.LBB70_56:                              # %if.end63
	cmpq	$0, 8(%rsp)
	je	.LBB70_57
# BB#58:                                # %if.then65
	incl	EdgeProfCounters+9276(%rip)
	movq	8(%rsp), %rax
	movl	16(%rsp), %ecx
	movl	%ecx, 5096(%rax)
	incl	EdgeProfCounters+9284(%rip)
	jmp	.LBB70_59
.LBB70_57:                              # %if.end63.if.end67_crit_edge
	incl	EdgeProfCounters+9280(%rip)
.LBB70_59:                              # %if.end67
	movq	8(%rsp), %rdi
	callq	free
	movq	$0, 48(%rsp)
	incl	EdgeProfCounters+9288(%rip)
	jmp	.LBB70_61
.Ltmp275:
	.size	BZ2_bzWriteOpen, .Ltmp275-BZ2_bzWriteOpen
	.cfi_endproc

	.globl	BZ2_bzWrite
	.align	16, 0x90
	.type	BZ2_bzWrite,@function
BZ2_bzWrite:                            # @BZ2_bzWrite
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp278:
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
.Ltmp279:
	.cfi_def_cfa_offset 64
.Ltmp280:
	.cfi_offset %rbx, -16
	incl	EdgeProfCounters+9296(%rip)
	movq	%rdi, 40(%rsp)
	movq	%rsi, 32(%rsp)
	movq	%rdx, 24(%rsp)
	movl	%ecx, 20(%rsp)
	movq	32(%rsp), %rax
	movq	%rax, (%rsp)
	cmpq	$0, 40(%rsp)
	je	.LBB71_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+9300(%rip)
	movq	40(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+9308(%rip)
	jmp	.LBB71_3
.LBB71_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+9304(%rip)
.LBB71_3:                               # %if.end
	cmpq	$0, (%rsp)
	je	.LBB71_4
# BB#5:                                 # %if.then2
	incl	EdgeProfCounters+9312(%rip)
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
	incl	EdgeProfCounters+9320(%rip)
	jmp	.LBB71_6
.LBB71_4:                               # %if.end.if.end3_crit_edge
	incl	EdgeProfCounters+9316(%rip)
.LBB71_6:                               # %if.end3
	cmpq	$0, (%rsp)
	je	.LBB71_7
# BB#8:                                 # %lor.lhs.false
	incl	EdgeProfCounters+9328(%rip)
	cmpq	$0, 24(%rsp)
	je	.LBB71_9
# BB#10:                                # %lor.lhs.false6
	incl	EdgeProfCounters+9336(%rip)
	cmpl	$0, 20(%rsp)
	js	.LBB71_11
# BB#17:                                # %if.end16
	incl	EdgeProfCounters+9344(%rip)
	movq	(%rsp), %rax
	cmpb	$0, 5012(%rax)
	je	.LBB71_18
# BB#24:                                # %if.end25
	incl	EdgeProfCounters+9376(%rip)
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB71_31
# BB#25:                                # %if.then27
	incl	EdgeProfCounters+9412(%rip)
	cmpq	$0, 40(%rsp)
	je	.LBB71_26
# BB#27:                                # %if.then29
	incl	EdgeProfCounters+9420(%rip)
	movq	40(%rsp), %rax
	movl	$-6, (%rax)
	incl	EdgeProfCounters+9428(%rip)
	jmp	.LBB71_28
.LBB71_7:                               # %if.end3.if.then8_crit_edge
	incl	EdgeProfCounters+9324(%rip)
	jmp	.LBB71_12
.LBB71_9:                               # %lor.lhs.false.if.then8_crit_edge
	incl	EdgeProfCounters+9332(%rip)
	jmp	.LBB71_12
.LBB71_11:                              # %lor.lhs.false6.if.then8_crit_edge
	incl	EdgeProfCounters+9340(%rip)
.LBB71_12:                              # %if.then8
	cmpq	$0, 40(%rsp)
	je	.LBB71_13
# BB#14:                                # %if.then10
	incl	EdgeProfCounters+9348(%rip)
	movq	40(%rsp), %rax
	movl	$-2, (%rax)
	incl	EdgeProfCounters+9356(%rip)
	jmp	.LBB71_15
.LBB71_13:                              # %if.then8.if.end11_crit_edge
	incl	EdgeProfCounters+9352(%rip)
.LBB71_15:                              # %if.end11
	cmpq	$0, (%rsp)
	je	.LBB71_16
# BB#67:                                # %if.then13
	incl	EdgeProfCounters+9360(%rip)
	movq	(%rsp), %rax
	movl	$-2, 5096(%rax)
	incl	EdgeProfCounters+9368(%rip)
	jmp	.LBB71_68
.LBB71_16:                              # %if.end11.if.end15_crit_edge
	incl	EdgeProfCounters+9364(%rip)
.LBB71_68:                              # %if.then13
	incl	EdgeProfCounters+9372(%rip)
.LBB71_69:                              # %return
	addq	$48, %rsp
	popq	%rbx
	ret
.LBB71_18:                              # %if.then17
	incl	EdgeProfCounters+9380(%rip)
	cmpq	$0, 40(%rsp)
	je	.LBB71_19
# BB#20:                                # %if.then19
	incl	EdgeProfCounters+9384(%rip)
	movq	40(%rsp), %rax
	movl	$-1, (%rax)
	incl	EdgeProfCounters+9392(%rip)
	jmp	.LBB71_21
.LBB71_31:                              # %if.end35
	incl	EdgeProfCounters+9416(%rip)
	cmpl	$0, 20(%rsp)
	je	.LBB71_32
# BB#38:                                # %if.end45
	incl	EdgeProfCounters+9452(%rip)
	movq	(%rsp), %rax
	movl	20(%rsp), %ecx
	movl	%ecx, 5024(%rax)
	movq	(%rsp), %rax
	movq	24(%rsp), %rcx
	movq	%rcx, 5016(%rax)
	incl	EdgeProfCounters+9484(%rip)
	movl	$5000, %ebx             # imm = 0x1388
	jmp	.LBB71_39
	.align	16, 0x90
.LBB71_66:                              # %if.end105
                                        #   in Loop: Header=BB71_39 Depth=1
	incl	EdgeProfCounters+9584(%rip)
	incl	EdgeProfCounters+9616(%rip)
.LBB71_39:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rsp), %rax
	movl	$5000, 5048(%rax)       # imm = 0x1388
	movq	(%rsp), %rax
	leaq	8(%rax), %rcx
	movq	%rcx, 5040(%rax)
	movq	(%rsp), %rdi
	addq	$5016, %rdi             # imm = 0x1398
	xorl	%esi, %esi
	callq	BZ2_bzCompress
	movl	%eax, 8(%rsp)
	cmpl	$1, %eax
	jne	.LBB71_40
# BB#46:                                # %if.end61
                                        #   in Loop: Header=BB71_39 Depth=1
	incl	EdgeProfCounters+9492(%rip)
	movq	(%rsp), %rax
	cmpl	$5000, 5048(%rax)       # imm = 0x1388
	jae	.LBB71_47
# BB#48:                                # %if.then65
                                        #   in Loop: Header=BB71_39 Depth=1
	incl	EdgeProfCounters+9524(%rip)
	movq	(%rsp), %rax
	movl	%ebx, %ecx
	subl	5048(%rax), %ecx
	movl	%ecx, 16(%rsp)
	movq	(%rsp), %rdi
	movq	(%rdi), %rcx
	movslq	16(%rsp), %rdx
	addq	$8, %rdi
	movl	$1, %esi
	callq	fwrite
	movl	%eax, 12(%rsp)
	cmpl	%eax, 16(%rsp)
	jne	.LBB71_49
# BB#50:                                # %lor.lhs.false75
                                        #   in Loop: Header=BB71_39 Depth=1
	incl	EdgeProfCounters+9536(%rip)
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB71_51
# BB#58:                                # %if.end89
                                        #   in Loop: Header=BB71_39 Depth=1
	incl	EdgeProfCounters+9544(%rip)
	incl	EdgeProfCounters+9576(%rip)
	jmp	.LBB71_59
.LBB71_47:                              # %if.end61.if.end90_crit_edge
                                        #   in Loop: Header=BB71_39 Depth=1
	incl	EdgeProfCounters+9528(%rip)
.LBB71_59:                              # %if.end90
                                        #   in Loop: Header=BB71_39 Depth=1
	movq	(%rsp), %rax
	cmpl	$0, 5024(%rax)
	jne	.LBB71_66
# BB#60:                                # %if.then95
	incl	EdgeProfCounters+9580(%rip)
	cmpq	$0, 40(%rsp)
	je	.LBB71_61
# BB#62:                                # %if.then98
	incl	EdgeProfCounters+9588(%rip)
	movq	40(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+9596(%rip)
	jmp	.LBB71_63
.LBB71_26:                              # %if.then27.if.end30_crit_edge
	incl	EdgeProfCounters+9424(%rip)
.LBB71_28:                              # %if.end30
	cmpq	$0, (%rsp)
	je	.LBB71_29
# BB#30:                                # %if.then32
	incl	EdgeProfCounters+9432(%rip)
	movq	(%rsp), %rax
	movl	$-6, 5096(%rax)
	incl	EdgeProfCounters+9440(%rip)
	incl	EdgeProfCounters+9444(%rip)
	jmp	.LBB71_69
.LBB71_29:                              # %if.end30.if.end34_crit_edge
	incl	EdgeProfCounters+9436(%rip)
	incl	EdgeProfCounters+9444(%rip)
	jmp	.LBB71_69
.LBB71_19:                              # %if.then17.if.end20_crit_edge
	incl	EdgeProfCounters+9388(%rip)
.LBB71_21:                              # %if.end20
	cmpq	$0, (%rsp)
	je	.LBB71_22
# BB#23:                                # %if.then22
	incl	EdgeProfCounters+9396(%rip)
	movq	(%rsp), %rax
	movl	$-1, 5096(%rax)
	incl	EdgeProfCounters+9404(%rip)
	incl	EdgeProfCounters+9408(%rip)
	jmp	.LBB71_69
.LBB71_22:                              # %if.end20.if.end24_crit_edge
	incl	EdgeProfCounters+9400(%rip)
	incl	EdgeProfCounters+9408(%rip)
	jmp	.LBB71_69
.LBB71_32:                              # %if.then37
	incl	EdgeProfCounters+9448(%rip)
	cmpq	$0, 40(%rsp)
	je	.LBB71_33
# BB#34:                                # %if.then39
	incl	EdgeProfCounters+9456(%rip)
	movq	40(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+9464(%rip)
	jmp	.LBB71_35
.LBB71_40:                              # %if.then53
	incl	EdgeProfCounters+9488(%rip)
	cmpq	$0, 40(%rsp)
	je	.LBB71_41
# BB#42:                                # %if.then55
	incl	EdgeProfCounters+9496(%rip)
	movq	40(%rsp), %rax
	movl	8(%rsp), %ecx
	movl	%ecx, (%rax)
	incl	EdgeProfCounters+9504(%rip)
	jmp	.LBB71_43
.LBB71_33:                              # %if.then37.if.end40_crit_edge
	incl	EdgeProfCounters+9460(%rip)
.LBB71_35:                              # %if.end40
	cmpq	$0, (%rsp)
	je	.LBB71_36
# BB#37:                                # %if.then42
	incl	EdgeProfCounters+9468(%rip)
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
	incl	EdgeProfCounters+9476(%rip)
	incl	EdgeProfCounters+9480(%rip)
	jmp	.LBB71_69
.LBB71_36:                              # %if.end40.if.end44_crit_edge
	incl	EdgeProfCounters+9472(%rip)
	incl	EdgeProfCounters+9480(%rip)
	jmp	.LBB71_69
.LBB71_49:                              # %if.then65.if.then79_crit_edge
	incl	EdgeProfCounters+9532(%rip)
	jmp	.LBB71_52
.LBB71_51:                              # %lor.lhs.false75.if.then79_crit_edge
	incl	EdgeProfCounters+9540(%rip)
.LBB71_52:                              # %if.then79
	cmpq	$0, 40(%rsp)
	je	.LBB71_53
# BB#54:                                # %if.then82
	incl	EdgeProfCounters+9548(%rip)
	movq	40(%rsp), %rax
	movl	$-6, (%rax)
	incl	EdgeProfCounters+9556(%rip)
	jmp	.LBB71_55
.LBB71_61:                              # %if.then95.if.end99_crit_edge
	incl	EdgeProfCounters+9592(%rip)
.LBB71_63:                              # %if.end99
	cmpq	$0, (%rsp)
	je	.LBB71_64
# BB#65:                                # %if.then102
	incl	EdgeProfCounters+9600(%rip)
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
	incl	EdgeProfCounters+9608(%rip)
	incl	EdgeProfCounters+9612(%rip)
	jmp	.LBB71_69
.LBB71_41:                              # %if.then53.if.end56_crit_edge
	incl	EdgeProfCounters+9500(%rip)
.LBB71_43:                              # %if.end56
	cmpq	$0, (%rsp)
	je	.LBB71_44
# BB#45:                                # %if.then58
	incl	EdgeProfCounters+9508(%rip)
	movq	(%rsp), %rax
	movl	8(%rsp), %ecx
	movl	%ecx, 5096(%rax)
	incl	EdgeProfCounters+9516(%rip)
	incl	EdgeProfCounters+9520(%rip)
	jmp	.LBB71_69
.LBB71_44:                              # %if.end56.if.end60_crit_edge
	incl	EdgeProfCounters+9512(%rip)
	incl	EdgeProfCounters+9520(%rip)
	jmp	.LBB71_69
.LBB71_53:                              # %if.then79.if.end83_crit_edge
	incl	EdgeProfCounters+9552(%rip)
.LBB71_55:                              # %if.end83
	cmpq	$0, (%rsp)
	je	.LBB71_56
# BB#57:                                # %if.then86
	incl	EdgeProfCounters+9560(%rip)
	movq	(%rsp), %rax
	movl	$-6, 5096(%rax)
	incl	EdgeProfCounters+9568(%rip)
	incl	EdgeProfCounters+9572(%rip)
	jmp	.LBB71_69
.LBB71_64:                              # %if.end99.if.end104_crit_edge
	incl	EdgeProfCounters+9604(%rip)
	incl	EdgeProfCounters+9612(%rip)
	jmp	.LBB71_69
.LBB71_56:                              # %if.end83.if.end88_crit_edge
	incl	EdgeProfCounters+9564(%rip)
	incl	EdgeProfCounters+9572(%rip)
	jmp	.LBB71_69
.Ltmp281:
	.size	BZ2_bzWrite, .Ltmp281-BZ2_bzWrite
	.cfi_endproc

	.globl	BZ2_bzWriteClose
	.align	16, 0x90
	.type	BZ2_bzWriteClose,@function
BZ2_bzWriteClose:                       # @BZ2_bzWriteClose
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$56, %rsp
.Ltmp283:
	.cfi_def_cfa_offset 64
	movq	%r8, %rax
	incl	EdgeProfCounters+9620(%rip)
	movq	%rdi, 48(%rsp)
	movq	%rsi, 40(%rsp)
	movl	%edx, 36(%rsp)
	movq	%rcx, 24(%rsp)
	movq	%rax, 16(%rsp)
	movq	24(%rsp), %rcx
	movl	36(%rsp), %edx
	movq	40(%rsp), %rsi
	movq	48(%rsp), %rdi
	movq	$0, (%rsp)
	xorl	%r8d, %r8d
	movq	%rax, %r9
	callq	BZ2_bzWriteClose64
	addq	$56, %rsp
	ret
.Ltmp284:
	.size	BZ2_bzWriteClose, .Ltmp284-BZ2_bzWriteClose
	.cfi_endproc

	.globl	BZ2_bzWriteClose64
	.align	16, 0x90
	.type	BZ2_bzWriteClose64,@function
BZ2_bzWriteClose64:                     # @BZ2_bzWriteClose64
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp287:
	.cfi_def_cfa_offset 16
	subq	$80, %rsp
.Ltmp288:
	.cfi_def_cfa_offset 96
.Ltmp289:
	.cfi_offset %rbx, -16
	incl	EdgeProfCounters+9624(%rip)
	movq	%rdi, 72(%rsp)
	movq	%rsi, 64(%rsp)
	movl	%edx, 60(%rsp)
	movq	%rcx, 48(%rsp)
	movq	%r8, 40(%rsp)
	movq	%r9, 32(%rsp)
	movq	96(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	64(%rsp), %rax
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.LBB73_1
# BB#7:                                 # %if.end6
	incl	EdgeProfCounters+9632(%rip)
	movq	(%rsp), %rax
	cmpb	$0, 5012(%rax)
	je	.LBB73_8
# BB#14:                                # %if.end15
	incl	EdgeProfCounters+9664(%rip)
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB73_21
# BB#15:                                # %if.then17
	incl	EdgeProfCounters+9700(%rip)
	cmpq	$0, 72(%rsp)
	je	.LBB73_16
# BB#17:                                # %if.then19
	incl	EdgeProfCounters+9708(%rip)
	movq	72(%rsp), %rax
	movl	$-6, (%rax)
	incl	EdgeProfCounters+9716(%rip)
	jmp	.LBB73_18
.LBB73_1:                               # %if.then
	incl	EdgeProfCounters+9628(%rip)
	cmpq	$0, 72(%rsp)
	je	.LBB73_2
# BB#3:                                 # %if.then2
	incl	EdgeProfCounters+9636(%rip)
	movq	72(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+9644(%rip)
	jmp	.LBB73_4
.LBB73_8:                               # %if.then7
	incl	EdgeProfCounters+9668(%rip)
	cmpq	$0, 72(%rsp)
	je	.LBB73_9
# BB#10:                                # %if.then9
	incl	EdgeProfCounters+9672(%rip)
	movq	72(%rsp), %rax
	movl	$-1, (%rax)
	incl	EdgeProfCounters+9680(%rip)
	jmp	.LBB73_11
.LBB73_21:                              # %if.end25
	incl	EdgeProfCounters+9704(%rip)
	cmpq	$0, 48(%rsp)
	je	.LBB73_22
# BB#23:                                # %if.then27
	incl	EdgeProfCounters+9736(%rip)
	movq	48(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+9744(%rip)
	jmp	.LBB73_24
.LBB73_2:                               # %if.then.if.end_crit_edge
	incl	EdgeProfCounters+9640(%rip)
.LBB73_4:                               # %if.end
	cmpq	$0, (%rsp)
	je	.LBB73_5
# BB#6:                                 # %if.then4
	incl	EdgeProfCounters+9648(%rip)
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
	incl	EdgeProfCounters+9656(%rip)
	incl	EdgeProfCounters+9660(%rip)
	jmp	.LBB73_95
.LBB73_5:                               # %if.end.if.end5_crit_edge
	incl	EdgeProfCounters+9652(%rip)
	incl	EdgeProfCounters+9660(%rip)
	jmp	.LBB73_95
.LBB73_16:                              # %if.then17.if.end20_crit_edge
	incl	EdgeProfCounters+9712(%rip)
.LBB73_18:                              # %if.end20
	cmpq	$0, (%rsp)
	je	.LBB73_19
# BB#20:                                # %if.then22
	incl	EdgeProfCounters+9720(%rip)
	movq	(%rsp), %rax
	movl	$-6, 5096(%rax)
	incl	EdgeProfCounters+9728(%rip)
	incl	EdgeProfCounters+9732(%rip)
	jmp	.LBB73_95
.LBB73_19:                              # %if.end20.if.end24_crit_edge
	incl	EdgeProfCounters+9724(%rip)
	incl	EdgeProfCounters+9732(%rip)
	jmp	.LBB73_95
.LBB73_9:                               # %if.then7.if.end10_crit_edge
	incl	EdgeProfCounters+9676(%rip)
.LBB73_11:                              # %if.end10
	cmpq	$0, (%rsp)
	je	.LBB73_12
# BB#13:                                # %if.then12
	incl	EdgeProfCounters+9684(%rip)
	movq	(%rsp), %rax
	movl	$-1, 5096(%rax)
	incl	EdgeProfCounters+9692(%rip)
	incl	EdgeProfCounters+9696(%rip)
	jmp	.LBB73_95
.LBB73_12:                              # %if.end10.if.end14_crit_edge
	incl	EdgeProfCounters+9688(%rip)
	incl	EdgeProfCounters+9696(%rip)
	jmp	.LBB73_95
.LBB73_22:                              # %if.end25.if.end28_crit_edge
	incl	EdgeProfCounters+9740(%rip)
.LBB73_24:                              # %if.end28
	cmpq	$0, 40(%rsp)
	je	.LBB73_25
# BB#26:                                # %if.then30
	incl	EdgeProfCounters+9748(%rip)
	movq	40(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+9756(%rip)
	jmp	.LBB73_27
.LBB73_25:                              # %if.end28.if.end31_crit_edge
	incl	EdgeProfCounters+9752(%rip)
.LBB73_27:                              # %if.end31
	cmpq	$0, 32(%rsp)
	je	.LBB73_28
# BB#29:                                # %if.then33
	incl	EdgeProfCounters+9760(%rip)
	movq	32(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+9768(%rip)
	jmp	.LBB73_30
.LBB73_28:                              # %if.end31.if.end34_crit_edge
	incl	EdgeProfCounters+9764(%rip)
.LBB73_30:                              # %if.end34
	cmpq	$0, 24(%rsp)
	je	.LBB73_31
# BB#32:                                # %if.then36
	incl	EdgeProfCounters+9772(%rip)
	movq	24(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+9780(%rip)
	jmp	.LBB73_33
.LBB73_31:                              # %if.end34.if.end37_crit_edge
	incl	EdgeProfCounters+9776(%rip)
.LBB73_33:                              # %if.end37
	cmpl	$0, 60(%rsp)
	je	.LBB73_35
# BB#34:                                # %if.end37.if.end89_crit_edge
	incl	EdgeProfCounters+9784(%rip)
	jmp	.LBB73_64
.LBB73_35:                              # %land.lhs.true
	incl	EdgeProfCounters+9788(%rip)
	movq	(%rsp), %rax
	cmpl	$0, 5096(%rax)
	je	.LBB73_37
# BB#36:                                # %land.lhs.true.if.end89_crit_edge
	incl	EdgeProfCounters+9796(%rip)
	jmp	.LBB73_64
.LBB73_37:                              # %if.then41
	incl	EdgeProfCounters+9792(%rip)
	incl	EdgeProfCounters+9800(%rip)
	movl	$5000, %ebx             # imm = 0x1388
	jmp	.LBB73_38
	.align	16, 0x90
.LBB73_62:                              # %if.end88
                                        #   in Loop: Header=BB73_38 Depth=1
	incl	EdgeProfCounters+9908(%rip)
	incl	EdgeProfCounters+9916(%rip)
.LBB73_38:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rsp), %rax
	movl	$5000, 5048(%rax)       # imm = 0x1388
	movq	(%rsp), %rax
	leaq	8(%rax), %rcx
	movq	%rcx, 5040(%rax)
	movq	(%rsp), %rdi
	addq	$5016, %rdi             # imm = 0x1398
	movl	$2, %esi
	callq	BZ2_bzCompress
	movl	%eax, 12(%rsp)
	cmpl	$3, %eax
	je	.LBB73_39
# BB#42:                                # %land.lhs.true46
                                        #   in Loop: Header=BB73_38 Depth=1
	incl	EdgeProfCounters+9804(%rip)
	cmpl	$4, 12(%rsp)
	jne	.LBB73_44
# BB#43:                                # %land.lhs.true46.if.end56_crit_edge
                                        #   in Loop: Header=BB73_38 Depth=1
	incl	EdgeProfCounters+9816(%rip)
	jmp	.LBB73_40
.LBB73_39:                              # %while.body.if.end56_crit_edge
                                        #   in Loop: Header=BB73_38 Depth=1
	incl	EdgeProfCounters+9808(%rip)
.LBB73_40:                              # %if.end56
                                        #   in Loop: Header=BB73_38 Depth=1
	movq	(%rsp), %rax
	cmpl	$5000, 5048(%rax)       # imm = 0x1388
	jae	.LBB73_41
# BB#50:                                # %if.then60
                                        #   in Loop: Header=BB73_38 Depth=1
	incl	EdgeProfCounters+9848(%rip)
	movq	(%rsp), %rax
	movl	%ebx, %ecx
	subl	5048(%rax), %ecx
	movl	%ecx, 20(%rsp)
	movq	(%rsp), %rdi
	movq	(%rdi), %rcx
	movslq	20(%rsp), %rdx
	addq	$8, %rdi
	movl	$1, %esi
	callq	fwrite
	movl	%eax, 16(%rsp)
	cmpl	%eax, 20(%rsp)
	jne	.LBB73_51
# BB#52:                                # %lor.lhs.false
                                        #   in Loop: Header=BB73_38 Depth=1
	incl	EdgeProfCounters+9860(%rip)
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB73_53
# BB#60:                                # %if.end83
                                        #   in Loop: Header=BB73_38 Depth=1
	incl	EdgeProfCounters+9868(%rip)
	incl	EdgeProfCounters+9900(%rip)
	jmp	.LBB73_61
.LBB73_41:                              # %if.end56.if.end84_crit_edge
                                        #   in Loop: Header=BB73_38 Depth=1
	incl	EdgeProfCounters+9852(%rip)
.LBB73_61:                              # %if.end84
                                        #   in Loop: Header=BB73_38 Depth=1
	cmpl	$4, 12(%rsp)
	jne	.LBB73_62
# BB#63:                                # %while.end
	incl	EdgeProfCounters+9904(%rip)
	incl	EdgeProfCounters+9912(%rip)
	incl	EdgeProfCounters+9920(%rip)
.LBB73_64:                              # %if.end89
	cmpl	$0, 60(%rsp)
	je	.LBB73_66
# BB#65:                                # %if.end89.if.end112_crit_edge
	incl	EdgeProfCounters+9924(%rip)
	jmp	.LBB73_76
.LBB73_66:                              # %land.lhs.true91
	incl	EdgeProfCounters+9928(%rip)
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB73_68
# BB#67:                                # %land.lhs.true91.if.end112_crit_edge
	incl	EdgeProfCounters+9932(%rip)
	jmp	.LBB73_76
.LBB73_68:                              # %if.then95
	incl	EdgeProfCounters+9936(%rip)
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	fflush
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB73_75
# BB#69:                                # %if.then101
	incl	EdgeProfCounters+9940(%rip)
	cmpq	$0, 72(%rsp)
	je	.LBB73_70
# BB#71:                                # %if.then104
	incl	EdgeProfCounters+9948(%rip)
	movq	72(%rsp), %rax
	movl	$-6, (%rax)
	incl	EdgeProfCounters+9956(%rip)
	jmp	.LBB73_72
.LBB73_75:                              # %if.end111
	incl	EdgeProfCounters+9944(%rip)
	incl	EdgeProfCounters+9976(%rip)
.LBB73_76:                              # %if.end112
	cmpq	$0, 48(%rsp)
	je	.LBB73_77
# BB#78:                                # %if.then115
	incl	EdgeProfCounters+9980(%rip)
	movq	(%rsp), %rax
	movl	5028(%rax), %eax
	movq	48(%rsp), %rcx
	movl	%eax, (%rcx)
	incl	EdgeProfCounters+9988(%rip)
	jmp	.LBB73_79
.LBB73_77:                              # %if.end112.if.end117_crit_edge
	incl	EdgeProfCounters+9984(%rip)
.LBB73_79:                              # %if.end117
	cmpq	$0, 40(%rsp)
	je	.LBB73_80
# BB#81:                                # %if.then120
	incl	EdgeProfCounters+9992(%rip)
	movq	(%rsp), %rax
	movl	5032(%rax), %eax
	movq	40(%rsp), %rcx
	movl	%eax, (%rcx)
	incl	EdgeProfCounters+10000(%rip)
	jmp	.LBB73_82
.LBB73_80:                              # %if.end117.if.end122_crit_edge
	incl	EdgeProfCounters+9996(%rip)
.LBB73_82:                              # %if.end122
	cmpq	$0, 32(%rsp)
	je	.LBB73_83
# BB#84:                                # %if.then125
	incl	EdgeProfCounters+10004(%rip)
	movq	(%rsp), %rax
	movl	5052(%rax), %eax
	movq	32(%rsp), %rcx
	movl	%eax, (%rcx)
	incl	EdgeProfCounters+10012(%rip)
	jmp	.LBB73_85
.LBB73_83:                              # %if.end122.if.end127_crit_edge
	incl	EdgeProfCounters+10008(%rip)
.LBB73_85:                              # %if.end127
	cmpq	$0, 24(%rsp)
	je	.LBB73_86
# BB#87:                                # %if.then130
	incl	EdgeProfCounters+10016(%rip)
	movq	(%rsp), %rax
	movl	5056(%rax), %eax
	movq	24(%rsp), %rcx
	movl	%eax, (%rcx)
	incl	EdgeProfCounters+10024(%rip)
	jmp	.LBB73_88
.LBB73_86:                              # %if.end127.if.end132_crit_edge
	incl	EdgeProfCounters+10020(%rip)
.LBB73_88:                              # %if.end132
	cmpq	$0, 72(%rsp)
	je	.LBB73_89
# BB#90:                                # %if.then135
	incl	EdgeProfCounters+10028(%rip)
	movq	72(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+10036(%rip)
	jmp	.LBB73_91
.LBB73_89:                              # %if.end132.if.end136_crit_edge
	incl	EdgeProfCounters+10032(%rip)
.LBB73_91:                              # %if.end136
	cmpq	$0, (%rsp)
	je	.LBB73_92
# BB#93:                                # %if.then139
	incl	EdgeProfCounters+10040(%rip)
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
	incl	EdgeProfCounters+10048(%rip)
	jmp	.LBB73_94
.LBB73_92:                              # %if.end136.if.end141_crit_edge
	incl	EdgeProfCounters+10044(%rip)
.LBB73_94:                              # %if.end141
	movq	(%rsp), %rdi
	addq	$5016, %rdi             # imm = 0x1398
	callq	BZ2_bzCompressEnd
	movq	(%rsp), %rdi
	callq	free
	incl	EdgeProfCounters+10052(%rip)
.LBB73_95:                              # %return
	addq	$80, %rsp
	popq	%rbx
	ret
.LBB73_44:                              # %if.then48
	incl	EdgeProfCounters+9812(%rip)
	cmpq	$0, 72(%rsp)
	je	.LBB73_45
# BB#46:                                # %if.then50
	incl	EdgeProfCounters+9820(%rip)
	movq	72(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%ecx, (%rax)
	incl	EdgeProfCounters+9828(%rip)
	jmp	.LBB73_47
.LBB73_70:                              # %if.then101.if.end105_crit_edge
	incl	EdgeProfCounters+9952(%rip)
.LBB73_72:                              # %if.end105
	cmpq	$0, (%rsp)
	je	.LBB73_73
# BB#74:                                # %if.then108
	incl	EdgeProfCounters+9960(%rip)
	movq	(%rsp), %rax
	movl	$-6, 5096(%rax)
	incl	EdgeProfCounters+9968(%rip)
	incl	EdgeProfCounters+9972(%rip)
	jmp	.LBB73_95
.LBB73_51:                              # %if.then60.if.then73_crit_edge
	incl	EdgeProfCounters+9856(%rip)
	jmp	.LBB73_54
.LBB73_53:                              # %lor.lhs.false.if.then73_crit_edge
	incl	EdgeProfCounters+9864(%rip)
.LBB73_54:                              # %if.then73
	cmpq	$0, 72(%rsp)
	je	.LBB73_55
# BB#56:                                # %if.then76
	incl	EdgeProfCounters+9872(%rip)
	movq	72(%rsp), %rax
	movl	$-6, (%rax)
	incl	EdgeProfCounters+9880(%rip)
	jmp	.LBB73_57
.LBB73_73:                              # %if.end105.if.end110_crit_edge
	incl	EdgeProfCounters+9964(%rip)
	incl	EdgeProfCounters+9972(%rip)
	jmp	.LBB73_95
.LBB73_55:                              # %if.then73.if.end77_crit_edge
	incl	EdgeProfCounters+9876(%rip)
.LBB73_57:                              # %if.end77
	cmpq	$0, (%rsp)
	je	.LBB73_58
# BB#59:                                # %if.then80
	incl	EdgeProfCounters+9884(%rip)
	movq	(%rsp), %rax
	movl	$-6, 5096(%rax)
	incl	EdgeProfCounters+9892(%rip)
	incl	EdgeProfCounters+9896(%rip)
	jmp	.LBB73_95
.LBB73_45:                              # %if.then48.if.end51_crit_edge
	incl	EdgeProfCounters+9824(%rip)
.LBB73_47:                              # %if.end51
	cmpq	$0, (%rsp)
	je	.LBB73_48
# BB#49:                                # %if.then53
	incl	EdgeProfCounters+9832(%rip)
	movq	(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%ecx, 5096(%rax)
	incl	EdgeProfCounters+9840(%rip)
	incl	EdgeProfCounters+9844(%rip)
	jmp	.LBB73_95
.LBB73_58:                              # %if.end77.if.end82_crit_edge
	incl	EdgeProfCounters+9888(%rip)
	incl	EdgeProfCounters+9896(%rip)
	jmp	.LBB73_95
.LBB73_48:                              # %if.end51.if.end55_crit_edge
	incl	EdgeProfCounters+9836(%rip)
	incl	EdgeProfCounters+9844(%rip)
	jmp	.LBB73_95
.Ltmp290:
	.size	BZ2_bzWriteClose64, .Ltmp290-BZ2_bzWriteClose64
	.cfi_endproc

	.globl	BZ2_bzReadOpen
	.align	16, 0x90
	.type	BZ2_bzReadOpen,@function
BZ2_bzReadOpen:                         # @BZ2_bzReadOpen
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$72, %rsp
.Ltmp292:
	.cfi_def_cfa_offset 80
	incl	EdgeProfCounters+10056(%rip)
	movq	%rdi, 56(%rsp)
	movq	%rsi, 48(%rsp)
	movl	%edx, 44(%rsp)
	movl	%ecx, 40(%rsp)
	movq	%r8, 32(%rsp)
	movl	%r9d, 28(%rsp)
	movq	$0, 16(%rsp)
	cmpq	$0, 56(%rsp)
	je	.LBB74_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+10060(%rip)
	movq	56(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+10068(%rip)
	jmp	.LBB74_3
.LBB74_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+10064(%rip)
.LBB74_3:                               # %if.end
	cmpq	$0, 16(%rsp)
	je	.LBB74_4
# BB#5:                                 # %if.then2
	incl	EdgeProfCounters+10072(%rip)
	movq	16(%rsp), %rax
	movl	$0, 5096(%rax)
	incl	EdgeProfCounters+10080(%rip)
	jmp	.LBB74_6
.LBB74_4:                               # %if.end.if.end3_crit_edge
	incl	EdgeProfCounters+10076(%rip)
.LBB74_6:                               # %if.end3
	cmpq	$0, 48(%rsp)
	je	.LBB74_7
# BB#8:                                 # %lor.lhs.false
	incl	EdgeProfCounters+10088(%rip)
	cmpl	$0, 40(%rsp)
	je	.LBB74_9
# BB#10:                                # %land.lhs.true
	incl	EdgeProfCounters+10092(%rip)
	cmpl	$1, 40(%rsp)
	je	.LBB74_11
# BB#69:                                # %land.lhs.true.if.then21_crit_edge
	incl	EdgeProfCounters+10100(%rip)
	jmp	.LBB74_30
.LBB74_7:                               # %if.end3.if.then21_crit_edge
	incl	EdgeProfCounters+10084(%rip)
	jmp	.LBB74_30
.LBB74_9:                               # %lor.lhs.false.lor.lhs.false7_crit_edge
	incl	EdgeProfCounters+10096(%rip)
	jmp	.LBB74_12
.LBB74_11:                              # %land.lhs.true.lor.lhs.false7_crit_edge
	incl	EdgeProfCounters+10104(%rip)
.LBB74_12:                              # %lor.lhs.false7
	cmpl	$0, 44(%rsp)
	js	.LBB74_13
# BB#14:                                # %lor.lhs.false9
	incl	EdgeProfCounters+10112(%rip)
	cmpl	$5, 44(%rsp)
	jl	.LBB74_16
# BB#15:                                # %lor.lhs.false9.if.then21_crit_edge
	incl	EdgeProfCounters+10116(%rip)
	jmp	.LBB74_30
.LBB74_13:                              # %lor.lhs.false7.if.then21_crit_edge
	incl	EdgeProfCounters+10108(%rip)
.LBB74_30:                              # %if.then21
	cmpq	$0, 56(%rsp)
	je	.LBB74_31
# BB#32:                                # %if.then23
	incl	EdgeProfCounters+10164(%rip)
	movq	56(%rsp), %rax
	movl	$-2, (%rax)
	incl	EdgeProfCounters+10172(%rip)
	jmp	.LBB74_33
.LBB74_31:                              # %if.then21.if.end24_crit_edge
	incl	EdgeProfCounters+10168(%rip)
.LBB74_33:                              # %if.end24
	cmpq	$0, 16(%rsp)
	je	.LBB74_34
# BB#35:                                # %if.then26
	incl	EdgeProfCounters+10176(%rip)
	movq	16(%rsp), %rax
	movl	$-2, 5096(%rax)
	incl	EdgeProfCounters+10184(%rip)
	jmp	.LBB74_36
.LBB74_34:                              # %if.end24.if.end28_crit_edge
	incl	EdgeProfCounters+10180(%rip)
.LBB74_36:                              # %if.end28
	movq	$0, 64(%rsp)
	incl	EdgeProfCounters+10188(%rip)
.LBB74_68:                              # %return
	movq	64(%rsp), %rax
	addq	$72, %rsp
	ret
.LBB74_16:                              # %lor.lhs.false11
	incl	EdgeProfCounters+10120(%rip)
	cmpq	$0, 32(%rsp)
	je	.LBB74_18
# BB#17:                                # %lor.lhs.false11.lor.lhs.false15_crit_edge
	incl	EdgeProfCounters+10128(%rip)
	jmp	.LBB74_20
.LBB74_18:                              # %land.lhs.true13
	incl	EdgeProfCounters+10124(%rip)
	cmpl	$0, 28(%rsp)
	je	.LBB74_19
# BB#70:                                # %land.lhs.true13.if.then21_crit_edge
	incl	EdgeProfCounters+10132(%rip)
	jmp	.LBB74_30
.LBB74_19:                              # %land.lhs.true13.lor.lhs.false15_crit_edge
	incl	EdgeProfCounters+10136(%rip)
.LBB74_20:                              # %lor.lhs.false15
	cmpq	$0, 32(%rsp)
	je	.LBB74_21
# BB#25:                                # %land.lhs.true17
	incl	EdgeProfCounters+10140(%rip)
	cmpl	$0, 28(%rsp)
	js	.LBB74_26
# BB#27:                                # %lor.lhs.false19
	incl	EdgeProfCounters+10152(%rip)
	cmpl	$5000, 28(%rsp)         # imm = 0x1388
	jle	.LBB74_28
# BB#29:                                # %lor.lhs.false19.if.then21_crit_edge
	incl	EdgeProfCounters+10156(%rip)
	jmp	.LBB74_30
.LBB74_21:                              # %lor.lhs.false15.if.end29_crit_edge
	incl	EdgeProfCounters+10144(%rip)
	jmp	.LBB74_22
.LBB74_26:                              # %land.lhs.true17.if.then21_crit_edge
	incl	EdgeProfCounters+10148(%rip)
	jmp	.LBB74_30
.LBB74_28:                              # %lor.lhs.false19.if.end29_crit_edge
	incl	EdgeProfCounters+10160(%rip)
.LBB74_22:                              # %if.end29
	movq	48(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB74_42
# BB#23:                                # %if.then30
	incl	EdgeProfCounters+10192(%rip)
	cmpq	$0, 56(%rsp)
	je	.LBB74_24
# BB#37:                                # %if.then32
	incl	EdgeProfCounters+10200(%rip)
	movq	56(%rsp), %rax
	movl	$-6, (%rax)
	incl	EdgeProfCounters+10208(%rip)
	jmp	.LBB74_38
.LBB74_42:                              # %if.end38
	incl	EdgeProfCounters+10196(%rip)
	movl	$5104, %edi             # imm = 0x13F0
	callq	malloc
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.LBB74_43
# BB#50:                                # %if.end49
	incl	EdgeProfCounters+10232(%rip)
	cmpq	$0, 56(%rsp)
	je	.LBB74_51
# BB#52:                                # %if.then51
	incl	EdgeProfCounters+10264(%rip)
	movq	56(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+10272(%rip)
	jmp	.LBB74_53
.LBB74_24:                              # %if.then30.if.end33_crit_edge
	incl	EdgeProfCounters+10204(%rip)
.LBB74_38:                              # %if.end33
	cmpq	$0, 16(%rsp)
	je	.LBB74_39
# BB#40:                                # %if.then35
	incl	EdgeProfCounters+10212(%rip)
	movq	16(%rsp), %rax
	movl	$-6, 5096(%rax)
	incl	EdgeProfCounters+10220(%rip)
	jmp	.LBB74_41
.LBB74_39:                              # %if.end33.if.end37_crit_edge
	incl	EdgeProfCounters+10216(%rip)
.LBB74_41:                              # %if.end37
	movq	$0, 64(%rsp)
	incl	EdgeProfCounters+10224(%rip)
	jmp	.LBB74_68
.LBB74_43:                              # %if.then41
	incl	EdgeProfCounters+10228(%rip)
	cmpq	$0, 56(%rsp)
	je	.LBB74_44
# BB#45:                                # %if.then43
	incl	EdgeProfCounters+10236(%rip)
	movq	56(%rsp), %rax
	movl	$-3, (%rax)
	incl	EdgeProfCounters+10244(%rip)
	jmp	.LBB74_46
.LBB74_51:                              # %if.end49.if.end52_crit_edge
	incl	EdgeProfCounters+10268(%rip)
.LBB74_53:                              # %if.end52
	cmpq	$0, 16(%rsp)
	je	.LBB74_54
# BB#55:                                # %if.then54
	incl	EdgeProfCounters+10276(%rip)
	movq	16(%rsp), %rax
	movl	$0, 5096(%rax)
	incl	EdgeProfCounters+10284(%rip)
	jmp	.LBB74_56
.LBB74_54:                              # %if.end52.if.end56_crit_edge
	incl	EdgeProfCounters+10280(%rip)
.LBB74_56:                              # %if.end56
	movq	16(%rsp), %rax
	movb	$0, 5100(%rax)
	movq	16(%rsp), %rax
	movq	48(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	16(%rsp), %rax
	movl	$0, 5008(%rax)
	movq	16(%rsp), %rax
	movb	$0, 5012(%rax)
	movq	16(%rsp), %rax
	movq	$0, 5072(%rax)
	movq	16(%rsp), %rax
	movq	$0, 5080(%rax)
	movq	16(%rsp), %rax
	movq	$0, 5088(%rax)
	incl	EdgeProfCounters+10288(%rip)
	jmp	.LBB74_57
	.align	16, 0x90
.LBB74_58:                              # %while.body
                                        #   in Loop: Header=BB74_57 Depth=1
	incl	EdgeProfCounters+10292(%rip)
	movq	16(%rsp), %rax
	movslq	5008(%rax), %rcx
	movq	32(%rsp), %rdx
	movb	(%rdx), %dl
	movb	%dl, 8(%rax,%rcx)
	movq	16(%rsp), %rax
	incl	5008(%rax)
	incq	32(%rsp)
	decl	28(%rsp)
	incl	EdgeProfCounters+10300(%rip)
.LBB74_57:                              # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 28(%rsp)
	jg	.LBB74_58
# BB#59:                                # %while.end
	incl	EdgeProfCounters+10296(%rip)
	movl	$5016, %edi             # imm = 0x1398
	addq	16(%rsp), %rdi
	movl	40(%rsp), %edx
	movl	44(%rsp), %esi
	callq	BZ2_bzDecompressInit
	movl	%eax, 12(%rsp)
	testl	%eax, %eax
	je	.LBB74_67
# BB#60:                                # %if.then65
	incl	EdgeProfCounters+10304(%rip)
	cmpq	$0, 56(%rsp)
	je	.LBB74_61
# BB#62:                                # %if.then67
	incl	EdgeProfCounters+10312(%rip)
	movq	56(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%ecx, (%rax)
	incl	EdgeProfCounters+10320(%rip)
	jmp	.LBB74_63
.LBB74_67:                              # %if.end73
	incl	EdgeProfCounters+10308(%rip)
	movq	16(%rsp), %rax
	movl	5008(%rax), %ecx
	movl	%ecx, 5024(%rax)
	movq	16(%rsp), %rax
	leaq	8(%rax), %rcx
	movq	%rcx, 5016(%rax)
	movq	16(%rsp), %rax
	movb	$1, 5100(%rax)
	movq	16(%rsp), %rax
	movq	%rax, 64(%rsp)
	incl	EdgeProfCounters+10340(%rip)
	jmp	.LBB74_68
.LBB74_44:                              # %if.then41.if.end44_crit_edge
	incl	EdgeProfCounters+10240(%rip)
.LBB74_46:                              # %if.end44
	cmpq	$0, 16(%rsp)
	je	.LBB74_47
# BB#48:                                # %if.then46
	incl	EdgeProfCounters+10248(%rip)
	movq	16(%rsp), %rax
	movl	$-3, 5096(%rax)
	incl	EdgeProfCounters+10256(%rip)
	jmp	.LBB74_49
.LBB74_47:                              # %if.end44.if.end48_crit_edge
	incl	EdgeProfCounters+10252(%rip)
.LBB74_49:                              # %if.end48
	movq	$0, 64(%rsp)
	incl	EdgeProfCounters+10260(%rip)
	jmp	.LBB74_68
.LBB74_61:                              # %if.then65.if.end68_crit_edge
	incl	EdgeProfCounters+10316(%rip)
.LBB74_63:                              # %if.end68
	cmpq	$0, 16(%rsp)
	je	.LBB74_64
# BB#65:                                # %if.then70
	incl	EdgeProfCounters+10324(%rip)
	movq	16(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%ecx, 5096(%rax)
	incl	EdgeProfCounters+10332(%rip)
	jmp	.LBB74_66
.LBB74_64:                              # %if.end68.if.end72_crit_edge
	incl	EdgeProfCounters+10328(%rip)
.LBB74_66:                              # %if.end72
	movq	16(%rsp), %rdi
	callq	free
	movq	$0, 64(%rsp)
	incl	EdgeProfCounters+10336(%rip)
	jmp	.LBB74_68
.Ltmp293:
	.size	BZ2_bzReadOpen, .Ltmp293-BZ2_bzReadOpen
	.cfi_endproc

	.globl	BZ2_bzReadClose
	.align	16, 0x90
	.type	BZ2_bzReadClose,@function
BZ2_bzReadClose:                        # @BZ2_bzReadClose
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp295:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+10344(%rip)
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rsi, (%rsp)
	cmpq	$0, 16(%rsp)
	je	.LBB75_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+10348(%rip)
	movq	16(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+10356(%rip)
	jmp	.LBB75_3
.LBB75_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+10352(%rip)
.LBB75_3:                               # %if.end
	cmpq	$0, (%rsp)
	je	.LBB75_4
# BB#5:                                 # %if.then2
	incl	EdgeProfCounters+10360(%rip)
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
	incl	EdgeProfCounters+10368(%rip)
	jmp	.LBB75_6
.LBB75_4:                               # %if.end.if.end3_crit_edge
	incl	EdgeProfCounters+10364(%rip)
.LBB75_6:                               # %if.end3
	cmpq	$0, (%rsp)
	je	.LBB75_7
# BB#13:                                # %if.end13
	incl	EdgeProfCounters+10376(%rip)
	movq	(%rsp), %rax
	cmpb	$0, 5012(%rax)
	je	.LBB75_20
# BB#14:                                # %if.then14
	incl	EdgeProfCounters+10408(%rip)
	cmpq	$0, 16(%rsp)
	je	.LBB75_15
# BB#16:                                # %if.then16
	incl	EdgeProfCounters+10416(%rip)
	movq	16(%rsp), %rax
	movl	$-1, (%rax)
	incl	EdgeProfCounters+10424(%rip)
	jmp	.LBB75_17
.LBB75_7:                               # %if.then5
	incl	EdgeProfCounters+10372(%rip)
	cmpq	$0, 16(%rsp)
	je	.LBB75_8
# BB#9:                                 # %if.then7
	incl	EdgeProfCounters+10380(%rip)
	movq	16(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+10388(%rip)
	jmp	.LBB75_10
.LBB75_20:                              # %if.end22
	incl	EdgeProfCounters+10412(%rip)
	movq	(%rsp), %rax
	cmpb	$0, 5100(%rax)
	je	.LBB75_21
# BB#22:                                # %if.then24
	incl	EdgeProfCounters+10444(%rip)
	movq	(%rsp), %rdi
	addq	$5016, %rdi             # imm = 0x1398
	callq	BZ2_bzDecompressEnd
	incl	EdgeProfCounters+10452(%rip)
	jmp	.LBB75_23
.LBB75_15:                              # %if.then14.if.end17_crit_edge
	incl	EdgeProfCounters+10420(%rip)
.LBB75_17:                              # %if.end17
	cmpq	$0, (%rsp)
	je	.LBB75_18
# BB#19:                                # %if.then19
	incl	EdgeProfCounters+10428(%rip)
	movq	(%rsp), %rax
	movl	$-1, 5096(%rax)
	incl	EdgeProfCounters+10436(%rip)
	incl	EdgeProfCounters+10440(%rip)
	addq	$24, %rsp
	ret
.LBB75_18:                              # %if.end17.if.end21_crit_edge
	incl	EdgeProfCounters+10432(%rip)
	incl	EdgeProfCounters+10440(%rip)
	addq	$24, %rsp
	ret
.LBB75_8:                               # %if.then5.if.end8_crit_edge
	incl	EdgeProfCounters+10384(%rip)
.LBB75_10:                              # %if.end8
	cmpq	$0, (%rsp)
	je	.LBB75_11
# BB#12:                                # %if.then10
	incl	EdgeProfCounters+10392(%rip)
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
	incl	EdgeProfCounters+10400(%rip)
	incl	EdgeProfCounters+10404(%rip)
	addq	$24, %rsp
	ret
.LBB75_11:                              # %if.end8.if.end12_crit_edge
	incl	EdgeProfCounters+10396(%rip)
	incl	EdgeProfCounters+10404(%rip)
	addq	$24, %rsp
	ret
.LBB75_21:                              # %if.end22.if.end25_crit_edge
	incl	EdgeProfCounters+10448(%rip)
.LBB75_23:                              # %if.end25
	movq	(%rsp), %rdi
	callq	free
	incl	EdgeProfCounters+10456(%rip)
	addq	$24, %rsp
	ret
.Ltmp296:
	.size	BZ2_bzReadClose, .Ltmp296-BZ2_bzReadClose
	.cfi_endproc

	.globl	BZ2_bzRead
	.align	16, 0x90
	.type	BZ2_bzRead,@function
BZ2_bzRead:                             # @BZ2_bzRead
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$56, %rsp
.Ltmp298:
	.cfi_def_cfa_offset 64
	incl	EdgeProfCounters+10460(%rip)
	movq	%rdi, 40(%rsp)
	movq	%rsi, 32(%rsp)
	movq	%rdx, 24(%rsp)
	movl	%ecx, 20(%rsp)
	movq	32(%rsp), %rax
	movq	%rax, (%rsp)
	cmpq	$0, 40(%rsp)
	je	.LBB76_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+10464(%rip)
	movq	40(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+10472(%rip)
	jmp	.LBB76_3
.LBB76_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+10468(%rip)
.LBB76_3:                               # %if.end
	cmpq	$0, (%rsp)
	je	.LBB76_4
# BB#5:                                 # %if.then2
	incl	EdgeProfCounters+10476(%rip)
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
	incl	EdgeProfCounters+10484(%rip)
	jmp	.LBB76_6
.LBB76_4:                               # %if.end.if.end3_crit_edge
	incl	EdgeProfCounters+10480(%rip)
.LBB76_6:                               # %if.end3
	cmpq	$0, (%rsp)
	je	.LBB76_7
# BB#8:                                 # %lor.lhs.false
	incl	EdgeProfCounters+10492(%rip)
	cmpq	$0, 24(%rsp)
	je	.LBB76_9
# BB#10:                                # %lor.lhs.false6
	incl	EdgeProfCounters+10500(%rip)
	cmpl	$0, 20(%rsp)
	js	.LBB76_11
# BB#19:                                # %if.end16
	incl	EdgeProfCounters+10508(%rip)
	movq	(%rsp), %rax
	cmpb	$0, 5012(%rax)
	je	.LBB76_27
# BB#20:                                # %if.then17
	incl	EdgeProfCounters+10540(%rip)
	cmpq	$0, 40(%rsp)
	je	.LBB76_21
# BB#22:                                # %if.then19
	incl	EdgeProfCounters+10548(%rip)
	movq	40(%rsp), %rax
	movl	$-1, (%rax)
	incl	EdgeProfCounters+10556(%rip)
	jmp	.LBB76_23
.LBB76_7:                               # %if.end3.if.then8_crit_edge
	incl	EdgeProfCounters+10488(%rip)
	jmp	.LBB76_12
.LBB76_9:                               # %lor.lhs.false.if.then8_crit_edge
	incl	EdgeProfCounters+10496(%rip)
	jmp	.LBB76_12
.LBB76_11:                              # %lor.lhs.false6.if.then8_crit_edge
	incl	EdgeProfCounters+10504(%rip)
.LBB76_12:                              # %if.then8
	cmpq	$0, 40(%rsp)
	je	.LBB76_13
# BB#14:                                # %if.then10
	incl	EdgeProfCounters+10512(%rip)
	movq	40(%rsp), %rax
	movl	$-2, (%rax)
	incl	EdgeProfCounters+10520(%rip)
	jmp	.LBB76_15
.LBB76_13:                              # %if.then8.if.end11_crit_edge
	incl	EdgeProfCounters+10516(%rip)
.LBB76_15:                              # %if.end11
	cmpq	$0, (%rsp)
	je	.LBB76_16
# BB#17:                                # %if.then13
	incl	EdgeProfCounters+10524(%rip)
	movq	(%rsp), %rax
	movl	$-2, 5096(%rax)
	incl	EdgeProfCounters+10532(%rip)
	jmp	.LBB76_18
.LBB76_16:                              # %if.end11.if.end15_crit_edge
	incl	EdgeProfCounters+10528(%rip)
.LBB76_18:                              # %if.end15
	movl	$0, 52(%rsp)
	incl	EdgeProfCounters+10536(%rip)
	jmp	.LBB76_99
.LBB76_27:                              # %if.end25
	incl	EdgeProfCounters+10544(%rip)
	cmpl	$0, 20(%rsp)
	je	.LBB76_28
# BB#35:                                # %if.end35
	incl	EdgeProfCounters+10580(%rip)
	movq	(%rsp), %rax
	movl	20(%rsp), %ecx
	movl	%ecx, 5048(%rax)
	movq	(%rsp), %rax
	movq	24(%rsp), %rcx
	movq	%rcx, 5040(%rax)
	incl	EdgeProfCounters+10612(%rip)
	jmp	.LBB76_36
	.align	16, 0x90
.LBB76_100:                             # %if.end152
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10852(%rip)
	incl	EdgeProfCounters+10884(%rip)
.LBB76_36:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB76_37
# BB#44:                                # %if.end46
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10620(%rip)
	movq	(%rsp), %rax
	cmpl	$0, 5024(%rax)
	jne	.LBB76_45
# BB#46:                                # %land.lhs.true
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10652(%rip)
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	myfeof145
	testb	%al, %al
	je	.LBB76_48
# BB#47:                                # %land.lhs.true.if.end76_crit_edge
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10660(%rip)
	jmp	.LBB76_57
	.align	16, 0x90
.LBB76_45:                              # %if.end46.if.end76_crit_edge
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10656(%rip)
	jmp	.LBB76_57
.LBB76_48:                              # %if.then52
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10664(%rip)
	movq	(%rsp), %rdi
	movq	(%rdi), %rcx
	addq	$8, %rdi
	movl	$1, %esi
	movl	$5000, %edx             # imm = 0x1388
	callq	fread
	movl	%eax, 16(%rsp)
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB76_49
# BB#56:                                # %if.end69
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10672(%rip)
	movq	(%rsp), %rax
	movl	16(%rsp), %ecx
	movl	%ecx, 5008(%rax)
	movq	(%rsp), %rax
	movl	5008(%rax), %ecx
	movl	%ecx, 5024(%rax)
	movq	(%rsp), %rax
	leaq	8(%rax), %rcx
	movq	%rcx, 5016(%rax)
	incl	EdgeProfCounters+10704(%rip)
.LBB76_57:                              # %if.end76
                                        #   in Loop: Header=BB76_36 Depth=1
	movq	(%rsp), %rdi
	addq	$5016, %rdi             # imm = 0x1398
	callq	BZ2_bzDecompress
	movl	%eax, 12(%rsp)
	testl	%eax, %eax
	je	.LBB76_58
# BB#64:                                # %land.lhs.true81
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10708(%rip)
	cmpl	$4, 12(%rsp)
	jne	.LBB76_66
# BB#65:                                # %land.lhs.true81.if.end94_crit_edge
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10720(%rip)
	jmp	.LBB76_59
	.align	16, 0x90
.LBB76_58:                              # %if.end76.if.end94_crit_edge
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10712(%rip)
.LBB76_59:                              # %if.end94
                                        #   in Loop: Header=BB76_36 Depth=1
	cmpl	$0, 12(%rsp)
	jne	.LBB76_60
# BB#73:                                # %land.lhs.true97
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10752(%rip)
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	myfeof145
	testb	%al, %al
	je	.LBB76_74
# BB#75:                                # %land.lhs.true102
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10760(%rip)
	movq	(%rsp), %rax
	cmpl	$0, 5024(%rax)
	jne	.LBB76_76
# BB#77:                                # %land.lhs.true107
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10768(%rip)
	movq	(%rsp), %rax
	cmpl	$0, 5048(%rax)
	jne	.LBB76_79
# BB#78:                                # %land.lhs.true107.if.end122_crit_edge
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10780(%rip)
	jmp	.LBB76_61
	.align	16, 0x90
.LBB76_60:                              # %if.end94.if.end122_crit_edge
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10756(%rip)
	jmp	.LBB76_61
.LBB76_74:                              # %land.lhs.true97.if.end122_crit_edge
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10764(%rip)
	jmp	.LBB76_61
.LBB76_76:                              # %land.lhs.true102.if.end122_crit_edge
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10772(%rip)
	.align	16, 0x90
.LBB76_61:                              # %if.end122
                                        #   in Loop: Header=BB76_36 Depth=1
	cmpl	$4, 12(%rsp)
	je	.LBB76_62
# BB#91:                                # %if.end137
                                        #   in Loop: Header=BB76_36 Depth=1
	incl	EdgeProfCounters+10816(%rip)
	movq	(%rsp), %rax
	cmpl	$0, 5048(%rax)
	jne	.LBB76_100
# BB#92:                                # %if.then142
	incl	EdgeProfCounters+10848(%rip)
	cmpq	$0, 40(%rsp)
	je	.LBB76_93
# BB#94:                                # %if.then145
	incl	EdgeProfCounters+10856(%rip)
	movq	40(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+10864(%rip)
	jmp	.LBB76_95
.LBB76_21:                              # %if.then17.if.end20_crit_edge
	incl	EdgeProfCounters+10552(%rip)
.LBB76_23:                              # %if.end20
	cmpq	$0, (%rsp)
	je	.LBB76_24
# BB#25:                                # %if.then22
	incl	EdgeProfCounters+10560(%rip)
	movq	(%rsp), %rax
	movl	$-1, 5096(%rax)
	incl	EdgeProfCounters+10568(%rip)
	jmp	.LBB76_26
.LBB76_24:                              # %if.end20.if.end24_crit_edge
	incl	EdgeProfCounters+10564(%rip)
.LBB76_26:                              # %if.end24
	movl	$0, 52(%rsp)
	incl	EdgeProfCounters+10572(%rip)
	jmp	.LBB76_99
.LBB76_28:                              # %if.then27
	incl	EdgeProfCounters+10576(%rip)
	cmpq	$0, 40(%rsp)
	je	.LBB76_29
# BB#30:                                # %if.then29
	incl	EdgeProfCounters+10584(%rip)
	movq	40(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+10592(%rip)
	jmp	.LBB76_31
.LBB76_37:                              # %if.then38
	incl	EdgeProfCounters+10616(%rip)
	cmpq	$0, 40(%rsp)
	je	.LBB76_38
# BB#39:                                # %if.then40
	incl	EdgeProfCounters+10624(%rip)
	movq	40(%rsp), %rax
	movl	$-6, (%rax)
	incl	EdgeProfCounters+10632(%rip)
	jmp	.LBB76_40
.LBB76_62:                              # %if.then125
	incl	EdgeProfCounters+10812(%rip)
	cmpq	$0, 40(%rsp)
	je	.LBB76_63
# BB#86:                                # %if.then128
	incl	EdgeProfCounters+10820(%rip)
	movq	40(%rsp), %rax
	movl	$4, (%rax)
	incl	EdgeProfCounters+10828(%rip)
	jmp	.LBB76_87
.LBB76_29:                              # %if.then27.if.end30_crit_edge
	incl	EdgeProfCounters+10588(%rip)
.LBB76_31:                              # %if.end30
	cmpq	$0, (%rsp)
	je	.LBB76_32
# BB#33:                                # %if.then32
	incl	EdgeProfCounters+10596(%rip)
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
	incl	EdgeProfCounters+10604(%rip)
	jmp	.LBB76_34
.LBB76_32:                              # %if.end30.if.end34_crit_edge
	incl	EdgeProfCounters+10600(%rip)
.LBB76_34:                              # %if.end34
	movl	$0, 52(%rsp)
	incl	EdgeProfCounters+10608(%rip)
	jmp	.LBB76_99
.LBB76_66:                              # %if.then84
	incl	EdgeProfCounters+10716(%rip)
	cmpq	$0, 40(%rsp)
	je	.LBB76_67
# BB#68:                                # %if.then87
	incl	EdgeProfCounters+10724(%rip)
	movq	40(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%ecx, (%rax)
	incl	EdgeProfCounters+10732(%rip)
	jmp	.LBB76_69
.LBB76_38:                              # %if.then38.if.end41_crit_edge
	incl	EdgeProfCounters+10628(%rip)
.LBB76_40:                              # %if.end41
	cmpq	$0, (%rsp)
	je	.LBB76_41
# BB#42:                                # %if.then43
	incl	EdgeProfCounters+10636(%rip)
	movq	(%rsp), %rax
	movl	$-6, 5096(%rax)
	incl	EdgeProfCounters+10644(%rip)
	jmp	.LBB76_43
.LBB76_63:                              # %if.then125.if.end129_crit_edge
	incl	EdgeProfCounters+10824(%rip)
.LBB76_87:                              # %if.end129
	cmpq	$0, (%rsp)
	je	.LBB76_88
# BB#89:                                # %if.then132
	incl	EdgeProfCounters+10832(%rip)
	movq	(%rsp), %rax
	movl	$4, 5096(%rax)
	incl	EdgeProfCounters+10840(%rip)
	jmp	.LBB76_90
.LBB76_41:                              # %if.end41.if.end45_crit_edge
	incl	EdgeProfCounters+10640(%rip)
.LBB76_43:                              # %if.end45
	movl	$0, 52(%rsp)
	incl	EdgeProfCounters+10648(%rip)
	jmp	.LBB76_99
.LBB76_93:                              # %if.then142.if.end146_crit_edge
	incl	EdgeProfCounters+10860(%rip)
.LBB76_95:                              # %if.end146
	cmpq	$0, (%rsp)
	je	.LBB76_96
# BB#97:                                # %if.then149
	incl	EdgeProfCounters+10868(%rip)
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
	incl	EdgeProfCounters+10876(%rip)
	jmp	.LBB76_98
.LBB76_88:                              # %if.end129.if.end134_crit_edge
	incl	EdgeProfCounters+10836(%rip)
.LBB76_90:                              # %if.end134
	movq	(%rsp), %rax
	movl	20(%rsp), %ecx
	subl	5048(%rax), %ecx
	movl	%ecx, 52(%rsp)
	incl	EdgeProfCounters+10844(%rip)
	jmp	.LBB76_99
.LBB76_96:                              # %if.end146.if.end151_crit_edge
	incl	EdgeProfCounters+10872(%rip)
.LBB76_98:                              # %if.end151
	movl	20(%rsp), %eax
	movl	%eax, 52(%rsp)
	incl	EdgeProfCounters+10880(%rip)
	jmp	.LBB76_99
.LBB76_49:                              # %if.then59
	incl	EdgeProfCounters+10668(%rip)
	cmpq	$0, 40(%rsp)
	je	.LBB76_50
# BB#51:                                # %if.then62
	incl	EdgeProfCounters+10676(%rip)
	movq	40(%rsp), %rax
	movl	$-6, (%rax)
	incl	EdgeProfCounters+10684(%rip)
	jmp	.LBB76_52
.LBB76_67:                              # %if.then84.if.end88_crit_edge
	incl	EdgeProfCounters+10728(%rip)
.LBB76_69:                              # %if.end88
	cmpq	$0, (%rsp)
	je	.LBB76_70
# BB#71:                                # %if.then91
	incl	EdgeProfCounters+10736(%rip)
	movq	(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%ecx, 5096(%rax)
	incl	EdgeProfCounters+10744(%rip)
	jmp	.LBB76_72
.LBB76_70:                              # %if.end88.if.end93_crit_edge
	incl	EdgeProfCounters+10740(%rip)
.LBB76_72:                              # %if.end93
	movl	$0, 52(%rsp)
	incl	EdgeProfCounters+10748(%rip)
	jmp	.LBB76_99
.LBB76_79:                              # %if.then112
	incl	EdgeProfCounters+10776(%rip)
	cmpq	$0, 40(%rsp)
	je	.LBB76_80
# BB#81:                                # %if.then115
	incl	EdgeProfCounters+10784(%rip)
	movq	40(%rsp), %rax
	movl	$-7, (%rax)
	incl	EdgeProfCounters+10792(%rip)
	jmp	.LBB76_82
.LBB76_50:                              # %if.then59.if.end63_crit_edge
	incl	EdgeProfCounters+10680(%rip)
.LBB76_52:                              # %if.end63
	cmpq	$0, (%rsp)
	je	.LBB76_53
# BB#54:                                # %if.then66
	incl	EdgeProfCounters+10688(%rip)
	movq	(%rsp), %rax
	movl	$-6, 5096(%rax)
	incl	EdgeProfCounters+10696(%rip)
	jmp	.LBB76_55
.LBB76_80:                              # %if.then112.if.end116_crit_edge
	incl	EdgeProfCounters+10788(%rip)
.LBB76_82:                              # %if.end116
	cmpq	$0, (%rsp)
	je	.LBB76_83
# BB#84:                                # %if.then119
	incl	EdgeProfCounters+10796(%rip)
	movq	(%rsp), %rax
	movl	$-7, 5096(%rax)
	incl	EdgeProfCounters+10804(%rip)
	jmp	.LBB76_85
.LBB76_53:                              # %if.end63.if.end68_crit_edge
	incl	EdgeProfCounters+10692(%rip)
.LBB76_55:                              # %if.end68
	movl	$0, 52(%rsp)
	incl	EdgeProfCounters+10700(%rip)
	jmp	.LBB76_99
.LBB76_83:                              # %if.end116.if.end121_crit_edge
	incl	EdgeProfCounters+10800(%rip)
.LBB76_85:                              # %if.end121
	movl	$0, 52(%rsp)
	incl	EdgeProfCounters+10808(%rip)
.LBB76_99:                              # %return
	movl	52(%rsp), %eax
	addq	$56, %rsp
	ret
.Ltmp299:
	.size	BZ2_bzRead, .Ltmp299-BZ2_bzRead
	.cfi_endproc

	.align	16, 0x90
	.type	myfeof145,@function
myfeof145:                              # @myfeof145
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp301:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+10888(%rip)
	movq	%rdi, 8(%rsp)
	callq	fgetc
	movl	%eax, 4(%rsp)
	cmpl	$-1, %eax
	jne	.LBB77_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+10892(%rip)
	movb	$1, 23(%rsp)
	incl	EdgeProfCounters+10900(%rip)
	jmp	.LBB77_3
.LBB77_2:                               # %if.end
	incl	EdgeProfCounters+10896(%rip)
	movq	8(%rsp), %rsi
	movl	4(%rsp), %edi
	callq	ungetc
	movb	$0, 23(%rsp)
	incl	EdgeProfCounters+10904(%rip)
.LBB77_3:                               # %return
	movzbl	23(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp302:
	.size	myfeof145, .Ltmp302-myfeof145
	.cfi_endproc

	.globl	BZ2_bzReadGetUnused
	.align	16, 0x90
	.type	BZ2_bzReadGetUnused,@function
BZ2_bzReadGetUnused:                    # @BZ2_bzReadGetUnused
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+10908(%rip)
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movq	%rdx, -24(%rsp)
	movq	%rcx, -32(%rsp)
	movq	-16(%rsp), %rax
	movq	%rax, -40(%rsp)
	testq	%rax, %rax
	je	.LBB78_1
# BB#7:                                 # %if.end6
	incl	EdgeProfCounters+10916(%rip)
	movq	-40(%rsp), %rax
	cmpl	$4, 5096(%rax)
	je	.LBB78_14
# BB#8:                                 # %if.then9
	incl	EdgeProfCounters+10948(%rip)
	cmpq	$0, -8(%rsp)
	je	.LBB78_9
# BB#10:                                # %if.then11
	incl	EdgeProfCounters+10956(%rip)
	movq	-8(%rsp), %rax
	movl	$-1, (%rax)
	incl	EdgeProfCounters+10964(%rip)
	jmp	.LBB78_11
.LBB78_1:                               # %if.then
	incl	EdgeProfCounters+10912(%rip)
	cmpq	$0, -8(%rsp)
	je	.LBB78_2
# BB#3:                                 # %if.then2
	incl	EdgeProfCounters+10920(%rip)
	movq	-8(%rsp), %rax
	movl	$-2, (%rax)
	incl	EdgeProfCounters+10928(%rip)
	jmp	.LBB78_4
.LBB78_14:                              # %if.end17
	incl	EdgeProfCounters+10952(%rip)
	cmpq	$0, -24(%rsp)
	je	.LBB78_15
# BB#16:                                # %lor.lhs.false
	incl	EdgeProfCounters+10988(%rip)
	cmpq	$0, -32(%rsp)
	je	.LBB78_17
# BB#24:                                # %if.end28
	incl	EdgeProfCounters+10996(%rip)
	cmpq	$0, -8(%rsp)
	je	.LBB78_25
# BB#26:                                # %if.then30
	incl	EdgeProfCounters+11028(%rip)
	movq	-8(%rsp), %rax
	movl	$0, (%rax)
	incl	EdgeProfCounters+11036(%rip)
	jmp	.LBB78_27
.LBB78_2:                               # %if.then.if.end_crit_edge
	incl	EdgeProfCounters+10924(%rip)
.LBB78_4:                               # %if.end
	cmpq	$0, -40(%rsp)
	je	.LBB78_5
# BB#6:                                 # %if.then4
	incl	EdgeProfCounters+10932(%rip)
	movq	-40(%rsp), %rax
	movl	$-2, 5096(%rax)
	incl	EdgeProfCounters+10940(%rip)
	incl	EdgeProfCounters+10944(%rip)
	ret
.LBB78_5:                               # %if.end.if.end5_crit_edge
	incl	EdgeProfCounters+10936(%rip)
	incl	EdgeProfCounters+10944(%rip)
	ret
.LBB78_9:                               # %if.then9.if.end12_crit_edge
	incl	EdgeProfCounters+10960(%rip)
.LBB78_11:                              # %if.end12
	cmpq	$0, -40(%rsp)
	je	.LBB78_12
# BB#13:                                # %if.then14
	incl	EdgeProfCounters+10968(%rip)
	movq	-40(%rsp), %rax
	movl	$-1, 5096(%rax)
	incl	EdgeProfCounters+10976(%rip)
	incl	EdgeProfCounters+10980(%rip)
	ret
.LBB78_15:                              # %if.end17.if.then20_crit_edge
	incl	EdgeProfCounters+10984(%rip)
	jmp	.LBB78_18
.LBB78_12:                              # %if.end12.if.end16_crit_edge
	incl	EdgeProfCounters+10972(%rip)
	incl	EdgeProfCounters+10980(%rip)
	ret
.LBB78_17:                              # %lor.lhs.false.if.then20_crit_edge
	incl	EdgeProfCounters+10992(%rip)
.LBB78_18:                              # %if.then20
	cmpq	$0, -8(%rsp)
	je	.LBB78_19
# BB#20:                                # %if.then22
	incl	EdgeProfCounters+11000(%rip)
	movq	-8(%rsp), %rax
	movl	$-2, (%rax)
	incl	EdgeProfCounters+11008(%rip)
	jmp	.LBB78_21
.LBB78_19:                              # %if.then20.if.end23_crit_edge
	incl	EdgeProfCounters+11004(%rip)
.LBB78_21:                              # %if.end23
	cmpq	$0, -40(%rsp)
	je	.LBB78_22
# BB#23:                                # %if.then25
	incl	EdgeProfCounters+11012(%rip)
	movq	-40(%rsp), %rax
	movl	$-2, 5096(%rax)
	incl	EdgeProfCounters+11020(%rip)
	incl	EdgeProfCounters+11024(%rip)
	ret
.LBB78_22:                              # %if.end23.if.end27_crit_edge
	incl	EdgeProfCounters+11016(%rip)
	incl	EdgeProfCounters+11024(%rip)
	ret
.LBB78_25:                              # %if.end28.if.end31_crit_edge
	incl	EdgeProfCounters+11032(%rip)
.LBB78_27:                              # %if.end31
	cmpq	$0, -40(%rsp)
	je	.LBB78_28
# BB#29:                                # %if.then33
	incl	EdgeProfCounters+11040(%rip)
	movq	-40(%rsp), %rax
	movl	$0, 5096(%rax)
	incl	EdgeProfCounters+11048(%rip)
	jmp	.LBB78_30
.LBB78_28:                              # %if.end31.if.end35_crit_edge
	incl	EdgeProfCounters+11044(%rip)
.LBB78_30:                              # %if.end35
	movq	-40(%rsp), %rax
	movl	5024(%rax), %eax
	movq	-32(%rsp), %rcx
	movl	%eax, (%rcx)
	movq	-40(%rsp), %rax
	movq	5016(%rax), %rax
	movq	-24(%rsp), %rcx
	movq	%rax, (%rcx)
	incl	EdgeProfCounters+11052(%rip)
	ret
.Ltmp303:
	.size	BZ2_bzReadGetUnused, .Ltmp303-BZ2_bzReadGetUnused
	.cfi_endproc

	.globl	BZ2_bzBuffToBuffCompress
	.align	16, 0x90
	.type	BZ2_bzBuffToBuffCompress,@function
BZ2_bzBuffToBuffCompress:               # @BZ2_bzBuffToBuffCompress
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$136, %rsp
.Ltmp305:
	.cfi_def_cfa_offset 144
	incl	EdgeProfCounters+11056(%rip)
	movq	%rdi, 120(%rsp)
	movq	%rsi, 112(%rsp)
	movq	%rdx, 104(%rsp)
	movl	%ecx, 100(%rsp)
	movl	%r8d, 96(%rsp)
	movl	%r9d, 92(%rsp)
	movl	144(%rsp), %eax
	movl	%eax, 88(%rsp)
	cmpq	$0, 120(%rsp)
	je	.LBB79_1
# BB#2:                                 # %lor.lhs.false
	incl	EdgeProfCounters+11064(%rip)
	cmpq	$0, 112(%rsp)
	je	.LBB79_3
# BB#4:                                 # %lor.lhs.false2
	incl	EdgeProfCounters+11072(%rip)
	cmpq	$0, 104(%rsp)
	je	.LBB79_5
# BB#6:                                 # %lor.lhs.false4
	incl	EdgeProfCounters+11080(%rip)
	cmpl	$0, 96(%rsp)
	jle	.LBB79_7
# BB#8:                                 # %lor.lhs.false6
	incl	EdgeProfCounters+11088(%rip)
	cmpl	$10, 96(%rsp)
	jl	.LBB79_10
# BB#9:                                 # %lor.lhs.false6.if.then_crit_edge
	incl	EdgeProfCounters+11092(%rip)
	jmp	.LBB79_18
.LBB79_1:                               # %entry.if.then_crit_edge
	incl	EdgeProfCounters+11060(%rip)
	jmp	.LBB79_18
.LBB79_3:                               # %lor.lhs.false.if.then_crit_edge
	incl	EdgeProfCounters+11068(%rip)
	jmp	.LBB79_18
.LBB79_5:                               # %lor.lhs.false2.if.then_crit_edge
	incl	EdgeProfCounters+11076(%rip)
	jmp	.LBB79_18
.LBB79_7:                               # %lor.lhs.false4.if.then_crit_edge
	incl	EdgeProfCounters+11084(%rip)
	jmp	.LBB79_18
.LBB79_10:                              # %lor.lhs.false8
	incl	EdgeProfCounters+11096(%rip)
	cmpl	$0, 92(%rsp)
	js	.LBB79_11
# BB#12:                                # %lor.lhs.false10
	incl	EdgeProfCounters+11104(%rip)
	cmpl	$5, 92(%rsp)
	jl	.LBB79_14
# BB#13:                                # %lor.lhs.false10.if.then_crit_edge
	incl	EdgeProfCounters+11108(%rip)
	jmp	.LBB79_18
.LBB79_11:                              # %lor.lhs.false8.if.then_crit_edge
	incl	EdgeProfCounters+11100(%rip)
	jmp	.LBB79_18
.LBB79_14:                              # %lor.lhs.false12
	incl	EdgeProfCounters+11112(%rip)
	cmpl	$0, 88(%rsp)
	js	.LBB79_15
# BB#16:                                # %lor.lhs.false14
	incl	EdgeProfCounters+11120(%rip)
	cmpl	$251, 88(%rsp)
	jl	.LBB79_19
# BB#17:                                # %lor.lhs.false14.if.then_crit_edge
	incl	EdgeProfCounters+11124(%rip)
	jmp	.LBB79_18
.LBB79_15:                              # %lor.lhs.false12.if.then_crit_edge
	incl	EdgeProfCounters+11116(%rip)
.LBB79_18:                              # %if.then
	movl	$-2, 132(%rsp)
	incl	EdgeProfCounters+11132(%rip)
.LBB79_29:                              # %return
	movl	132(%rsp), %eax
	addq	$136, %rsp
	ret
.LBB79_19:                              # %if.end
	incl	EdgeProfCounters+11128(%rip)
	cmpl	$0, 88(%rsp)
	je	.LBB79_21
# BB#20:                                # %if.end.if.end18_crit_edge
	incl	EdgeProfCounters+11140(%rip)
	jmp	.LBB79_22
.LBB79_21:                              # %if.then17
	incl	EdgeProfCounters+11136(%rip)
	movl	$30, 88(%rsp)
	incl	EdgeProfCounters+11144(%rip)
.LBB79_22:                              # %if.end18
	movq	$0, 64(%rsp)
	movq	$0, 72(%rsp)
	movq	$0, 80(%rsp)
	movl	88(%rsp), %ecx
	movl	92(%rsp), %edx
	movl	96(%rsp), %esi
	leaq	8(%rsp), %rdi
	callq	BZ2_bzCompressInit
	movl	%eax, 4(%rsp)
	testl	%eax, %eax
	je	.LBB79_24
# BB#23:                                # %if.then20
	incl	EdgeProfCounters+11148(%rip)
	movl	4(%rsp), %eax
	movl	%eax, 132(%rsp)
	incl	EdgeProfCounters+11156(%rip)
	jmp	.LBB79_29
.LBB79_24:                              # %if.end21
	incl	EdgeProfCounters+11152(%rip)
	movq	104(%rsp), %rax
	movq	%rax, 8(%rsp)
	movq	120(%rsp), %rax
	movq	%rax, 32(%rsp)
	movl	100(%rsp), %eax
	movl	%eax, 16(%rsp)
	leaq	8(%rsp), %rdi
	movq	112(%rsp), %rax
	movl	(%rax), %eax
	movl	%eax, 40(%rsp)
	movl	$2, %esi
	callq	BZ2_bzCompress
	movl	%eax, 4(%rsp)
	cmpl	$3, %eax
	jne	.LBB79_25
# BB#27:                                # %output_overflow
	incl	EdgeProfCounters+11160(%rip)
	incl	EdgeProfCounters+11168(%rip)
	leaq	8(%rsp), %rdi
	callq	BZ2_bzCompressEnd
	movl	$-8, 132(%rsp)
	incl	EdgeProfCounters+11188(%rip)
	jmp	.LBB79_29
.LBB79_25:                              # %if.end25
	incl	EdgeProfCounters+11164(%rip)
	cmpl	$4, 4(%rsp)
	je	.LBB79_26
# BB#28:                                # %errhandler
	incl	EdgeProfCounters+11172(%rip)
	incl	EdgeProfCounters+11180(%rip)
	leaq	8(%rsp), %rdi
	callq	BZ2_bzCompressEnd
	movl	4(%rsp), %eax
	movl	%eax, 132(%rsp)
	incl	EdgeProfCounters+11192(%rip)
	jmp	.LBB79_29
.LBB79_26:                              # %if.end28
	incl	EdgeProfCounters+11176(%rip)
	movq	112(%rsp), %rax
	movl	40(%rsp), %ecx
	subl	%ecx, (%rax)
	leaq	8(%rsp), %rdi
	callq	BZ2_bzCompressEnd
	movl	$0, 132(%rsp)
	incl	EdgeProfCounters+11184(%rip)
	jmp	.LBB79_29
.Ltmp306:
	.size	BZ2_bzBuffToBuffCompress, .Ltmp306-BZ2_bzBuffToBuffCompress
	.cfi_endproc

	.globl	BZ2_bzBuffToBuffDecompress
	.align	16, 0x90
	.type	BZ2_bzBuffToBuffDecompress,@function
BZ2_bzBuffToBuffDecompress:             # @BZ2_bzBuffToBuffDecompress
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$136, %rsp
.Ltmp308:
	.cfi_def_cfa_offset 144
	incl	EdgeProfCounters+11196(%rip)
	movq	%rdi, 120(%rsp)
	movq	%rsi, 112(%rsp)
	movq	%rdx, 104(%rsp)
	movl	%ecx, 100(%rsp)
	movl	%r8d, 96(%rsp)
	movl	%r9d, 92(%rsp)
	cmpq	$0, 120(%rsp)
	je	.LBB80_1
# BB#2:                                 # %lor.lhs.false
	incl	EdgeProfCounters+11204(%rip)
	cmpq	$0, 112(%rsp)
	je	.LBB80_3
# BB#4:                                 # %lor.lhs.false2
	incl	EdgeProfCounters+11212(%rip)
	cmpq	$0, 104(%rsp)
	je	.LBB80_5
# BB#6:                                 # %lor.lhs.false4
	incl	EdgeProfCounters+11220(%rip)
	cmpl	$0, 96(%rsp)
	je	.LBB80_7
# BB#8:                                 # %land.lhs.true
	incl	EdgeProfCounters+11224(%rip)
	cmpl	$1, 96(%rsp)
	je	.LBB80_9
# BB#25:                                # %land.lhs.true.if.then_crit_edge
	incl	EdgeProfCounters+11232(%rip)
	jmp	.LBB80_14
.LBB80_1:                               # %entry.if.then_crit_edge
	incl	EdgeProfCounters+11200(%rip)
	jmp	.LBB80_14
.LBB80_3:                               # %lor.lhs.false.if.then_crit_edge
	incl	EdgeProfCounters+11208(%rip)
	jmp	.LBB80_14
.LBB80_5:                               # %lor.lhs.false2.if.then_crit_edge
	incl	EdgeProfCounters+11216(%rip)
	jmp	.LBB80_14
.LBB80_7:                               # %lor.lhs.false4.lor.lhs.false7_crit_edge
	incl	EdgeProfCounters+11228(%rip)
	jmp	.LBB80_10
.LBB80_9:                               # %land.lhs.true.lor.lhs.false7_crit_edge
	incl	EdgeProfCounters+11236(%rip)
.LBB80_10:                              # %lor.lhs.false7
	cmpl	$0, 92(%rsp)
	js	.LBB80_11
# BB#12:                                # %lor.lhs.false9
	incl	EdgeProfCounters+11244(%rip)
	cmpl	$5, 92(%rsp)
	jl	.LBB80_15
# BB#13:                                # %lor.lhs.false9.if.then_crit_edge
	incl	EdgeProfCounters+11248(%rip)
	jmp	.LBB80_14
.LBB80_11:                              # %lor.lhs.false7.if.then_crit_edge
	incl	EdgeProfCounters+11240(%rip)
.LBB80_14:                              # %if.then
	movl	$-2, 132(%rsp)
	incl	EdgeProfCounters+11256(%rip)
.LBB80_24:                              # %return
	movl	132(%rsp), %eax
	addq	$136, %rsp
	ret
.LBB80_15:                              # %if.end
	incl	EdgeProfCounters+11252(%rip)
	movq	$0, 64(%rsp)
	movq	$0, 72(%rsp)
	movq	$0, 80(%rsp)
	movl	96(%rsp), %edx
	movl	92(%rsp), %esi
	leaq	8(%rsp), %rdi
	callq	BZ2_bzDecompressInit
	movl	%eax, 4(%rsp)
	testl	%eax, %eax
	je	.LBB80_17
# BB#16:                                # %if.then12
	incl	EdgeProfCounters+11260(%rip)
	movl	4(%rsp), %eax
	movl	%eax, 132(%rsp)
	incl	EdgeProfCounters+11268(%rip)
	jmp	.LBB80_24
.LBB80_17:                              # %if.end13
	incl	EdgeProfCounters+11264(%rip)
	movq	104(%rsp), %rax
	movq	%rax, 8(%rsp)
	movq	120(%rsp), %rax
	movq	%rax, 32(%rsp)
	movl	100(%rsp), %eax
	movl	%eax, 16(%rsp)
	leaq	8(%rsp), %rdi
	movq	112(%rsp), %rax
	movl	(%rax), %eax
	movl	%eax, 40(%rsp)
	callq	BZ2_bzDecompress
	movl	%eax, 4(%rsp)
	testl	%eax, %eax
	je	.LBB80_20
# BB#18:                                # %if.end17
	incl	EdgeProfCounters+11276(%rip)
	cmpl	$4, 4(%rsp)
	je	.LBB80_19
# BB#23:                                # %errhandler
	incl	EdgeProfCounters+11284(%rip)
	incl	EdgeProfCounters+11292(%rip)
	leaq	8(%rsp), %rdi
	callq	BZ2_bzDecompressEnd
	movl	4(%rsp), %eax
	movl	%eax, 132(%rsp)
	incl	EdgeProfCounters+11316(%rip)
	jmp	.LBB80_24
.LBB80_20:                              # %output_overflow_or_eof
	incl	EdgeProfCounters+11272(%rip)
	incl	EdgeProfCounters+11280(%rip)
	cmpl	$0, 40(%rsp)
	je	.LBB80_22
# BB#21:                                # %if.then25
	incl	EdgeProfCounters+11300(%rip)
	leaq	8(%rsp), %rdi
	callq	BZ2_bzDecompressEnd
	movl	$-7, 132(%rsp)
	incl	EdgeProfCounters+11308(%rip)
	jmp	.LBB80_24
.LBB80_19:                              # %if.end20
	incl	EdgeProfCounters+11288(%rip)
	movq	112(%rsp), %rax
	movl	40(%rsp), %ecx
	subl	%ecx, (%rax)
	leaq	8(%rsp), %rdi
	callq	BZ2_bzDecompressEnd
	movl	$0, 132(%rsp)
	incl	EdgeProfCounters+11296(%rip)
	jmp	.LBB80_24
.LBB80_22:                              # %if.else
	incl	EdgeProfCounters+11304(%rip)
	leaq	8(%rsp), %rdi
	callq	BZ2_bzDecompressEnd
	movl	$-8, 132(%rsp)
	incl	EdgeProfCounters+11312(%rip)
	jmp	.LBB80_24
.Ltmp309:
	.size	BZ2_bzBuffToBuffDecompress, .Ltmp309-BZ2_bzBuffToBuffDecompress
	.cfi_endproc

	.globl	BZ2_bzopen
	.align	16, 0x90
	.type	BZ2_bzopen,@function
BZ2_bzopen:                             # @BZ2_bzopen
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp311:
	.cfi_def_cfa_offset 32
	movq	%rsi, %rax
	incl	EdgeProfCounters+11320(%rip)
	movq	%rdi, 16(%rsp)
	movq	%rax, 8(%rsp)
	movq	16(%rsp), %rdi
	movl	$-1, %esi
	movq	%rax, %rdx
	xorl	%ecx, %ecx
	callq	bzopen_or_bzdopen
	addq	$24, %rsp
	ret
.Ltmp312:
	.size	BZ2_bzopen, .Ltmp312-BZ2_bzopen
	.cfi_endproc

	.align	16, 0x90
	.type	bzopen_or_bzdopen,@function
bzopen_or_bzdopen:                      # @bzopen_or_bzdopen
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp315:
	.cfi_def_cfa_offset 16
	subq	$5104, %rsp             # imm = 0x13F0
.Ltmp316:
	.cfi_def_cfa_offset 5120
.Ltmp317:
	.cfi_offset %rbx, -16
	incl	EdgeProfCounters+11324(%rip)
	movq	%rdi, 5088(%rsp)
	movl	%esi, 5084(%rsp)
	movq	%rdx, 5072(%rsp)
	movl	%ecx, 5068(%rsp)
	movl	$9, 60(%rsp)
	movl	$0, 56(%rsp)
	movw	$0, 48(%rsp)
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movq	$0, 24(%rsp)
	movl	$0, 20(%rsp)
	movl	$30, 16(%rsp)
	movl	$0, 12(%rsp)
	movl	$0, 8(%rsp)
	cmpq	$0, 5072(%rsp)
	je	.LBB82_1
# BB#2:                                 # %if.end
	incl	EdgeProfCounters+11332(%rip)
	incl	EdgeProfCounters+11340(%rip)
	jmp	.LBB82_3
	.align	16, 0x90
.LBB82_14:                              # %sw.epilog
                                        #   in Loop: Header=BB82_3 Depth=1
	incq	5072(%rsp)
	incl	EdgeProfCounters+11396(%rip)
.LBB82_3:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	5072(%rsp), %rax
	cmpb	$0, (%rax)
	je	.LBB82_15
# BB#4:                                 # %while.body
                                        #   in Loop: Header=BB82_3 Depth=1
	incl	EdgeProfCounters+11344(%rip)
	movq	5072(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$119, %eax
	je	.LBB82_8
# BB#5:                                 # %while.body
                                        #   in Loop: Header=BB82_3 Depth=1
	cmpl	$115, %eax
	jne	.LBB82_6
# BB#9:                                 # %sw.bb2
                                        #   in Loop: Header=BB82_3 Depth=1
	incl	EdgeProfCounters+11364(%rip)
	movl	$1, 12(%rsp)
	incl	EdgeProfCounters+11376(%rip)
	jmp	.LBB82_14
	.align	16, 0x90
.LBB82_8:                               # %sw.bb1
                                        #   in Loop: Header=BB82_3 Depth=1
	incl	EdgeProfCounters+11360(%rip)
	movl	$1, 56(%rsp)
	incl	EdgeProfCounters+11372(%rip)
	jmp	.LBB82_14
	.align	16, 0x90
.LBB82_6:                               # %while.body
                                        #   in Loop: Header=BB82_3 Depth=1
	cmpl	$114, %eax
	jne	.LBB82_10
# BB#7:                                 # %sw.bb
                                        #   in Loop: Header=BB82_3 Depth=1
	incl	EdgeProfCounters+11356(%rip)
	movl	$0, 56(%rsp)
	incl	EdgeProfCounters+11368(%rip)
	jmp	.LBB82_14
.LBB82_10:                              # %sw.default
                                        #   in Loop: Header=BB82_3 Depth=1
	incl	EdgeProfCounters+11352(%rip)
	movq	5072(%rsp), %rax
	movsbq	(%rax), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movzwl	(%rax,%rbx,2), %eax
	testb	$8, %ah
	je	.LBB82_11
# BB#12:                                # %if.then6
                                        #   in Loop: Header=BB82_3 Depth=1
	incl	EdgeProfCounters+11380(%rip)
	movq	5072(%rsp), %rax
	movsbl	(%rax), %eax
	addl	$-48, %eax
	movl	%eax, 60(%rsp)
	incl	EdgeProfCounters+11388(%rip)
	jmp	.LBB82_13
.LBB82_11:                              # %sw.default.if.end8_crit_edge
                                        #   in Loop: Header=BB82_3 Depth=1
	incl	EdgeProfCounters+11384(%rip)
.LBB82_13:                              # %if.end8
                                        #   in Loop: Header=BB82_3 Depth=1
	incl	EdgeProfCounters+11392(%rip)
	jmp	.LBB82_14
.LBB82_15:                              # %while.end
	incl	EdgeProfCounters+11348(%rip)
	movl	$.L.str17125, %esi
	cmpl	$0, 56(%rsp)
	jne	.LBB82_17
# BB#16:                                # %select.mid
	movl	$.L.str18126, %esi
.LBB82_17:                              # %select.end
	leaq	40(%rsp), %rbx
	movq	%rbx, %rdi
	callq	strcat
	movq	%rbx, %rdi
	movl	$.L.str19127, %esi
	callq	strcat
	cmpl	$0, 5068(%rsp)
	je	.LBB82_18
# BB#27:                                # %if.else27
	incl	EdgeProfCounters+11404(%rip)
	movl	5084(%rsp), %edi
	leaq	40(%rsp), %rsi
	callq	fdopen
	movq	%rax, 32(%rsp)
	incl	EdgeProfCounters+11452(%rip)
	jmp	.LBB82_28
.LBB82_1:                               # %if.then
	incl	EdgeProfCounters+11328(%rip)
	movq	$0, 5096(%rsp)
	incl	EdgeProfCounters+11336(%rip)
	jmp	.LBB82_47
.LBB82_18:                              # %if.then15
	incl	EdgeProfCounters+11400(%rip)
	cmpq	$0, 5088(%rsp)
	je	.LBB82_19
# BB#20:                                # %lor.lhs.false
	incl	EdgeProfCounters+11412(%rip)
	movq	5088(%rsp), %rdi
	movl	$.L.str20128, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB82_21
# BB#26:                                # %if.else
	incl	EdgeProfCounters+11420(%rip)
	movq	5088(%rsp), %rdi
	leaq	40(%rsp), %rsi
	callq	fopen
	movq	%rax, 32(%rsp)
	incl	EdgeProfCounters+11444(%rip)
	incl	EdgeProfCounters+11448(%rip)
	jmp	.LBB82_28
.LBB82_19:                              # %if.then15.if.then21_crit_edge
	incl	EdgeProfCounters+11408(%rip)
	jmp	.LBB82_22
.LBB82_21:                              # %lor.lhs.false.if.then21_crit_edge
	incl	EdgeProfCounters+11416(%rip)
.LBB82_22:                              # %if.then21
	cmpl	$0, 56(%rsp)
	je	.LBB82_24
# BB#23:                                # %cond.true
	incl	EdgeProfCounters+11424(%rip)
	movq	stdout(%rip), %rax
	incl	EdgeProfCounters+11432(%rip)
	jmp	.LBB82_25
.LBB82_24:                              # %cond.false
	incl	EdgeProfCounters+11428(%rip)
	movq	stdin(%rip), %rax
	incl	EdgeProfCounters+11436(%rip)
.LBB82_25:                              # %cond.end
	movq	%rax, 32(%rsp)
	incl	EdgeProfCounters+11440(%rip)
	incl	EdgeProfCounters+11448(%rip)
.LBB82_28:                              # %if.end30
	cmpq	$0, 32(%rsp)
	je	.LBB82_29
# BB#30:                                # %if.end34
	incl	EdgeProfCounters+11460(%rip)
	cmpl	$0, 56(%rsp)
	je	.LBB82_38
# BB#31:                                # %if.then36
	incl	EdgeProfCounters+11468(%rip)
	cmpl	$0, 60(%rsp)
	jle	.LBB82_33
# BB#32:                                # %if.then36.if.end40_crit_edge
	incl	EdgeProfCounters+11480(%rip)
	jmp	.LBB82_34
.LBB82_29:                              # %if.then33
	incl	EdgeProfCounters+11456(%rip)
	movq	$0, 5096(%rsp)
	incl	EdgeProfCounters+11464(%rip)
	jmp	.LBB82_47
.LBB82_38:                              # %if.else46
	incl	EdgeProfCounters+11472(%rip)
	movl	8(%rsp), %r9d
	movl	12(%rsp), %ecx
	movl	20(%rsp), %edx
	movq	32(%rsp), %rsi
	leaq	5064(%rsp), %rdi
	leaq	64(%rsp), %r8
	callq	BZ2_bzReadOpen
	movq	%rax, 24(%rsp)
	incl	EdgeProfCounters+11504(%rip)
	jmp	.LBB82_39
.LBB82_33:                              # %if.then39
	incl	EdgeProfCounters+11476(%rip)
	movl	$1, 60(%rsp)
	incl	EdgeProfCounters+11484(%rip)
.LBB82_34:                              # %if.end40
	cmpl	$9, 60(%rsp)
	jle	.LBB82_35
# BB#36:                                # %if.then43
	incl	EdgeProfCounters+11488(%rip)
	movl	$9, 60(%rsp)
	incl	EdgeProfCounters+11496(%rip)
	jmp	.LBB82_37
.LBB82_35:                              # %if.end40.if.end44_crit_edge
	incl	EdgeProfCounters+11492(%rip)
.LBB82_37:                              # %if.end44
	movl	16(%rsp), %r8d
	movl	20(%rsp), %ecx
	movl	60(%rsp), %edx
	movq	32(%rsp), %rsi
	leaq	5064(%rsp), %rdi
	callq	BZ2_bzWriteOpen
	movq	%rax, 24(%rsp)
	incl	EdgeProfCounters+11500(%rip)
.LBB82_39:                              # %if.end49
	cmpq	$0, 24(%rsp)
	je	.LBB82_40
# BB#46:                                # %if.end60
	incl	EdgeProfCounters+11512(%rip)
	movq	24(%rsp), %rax
	movq	%rax, 5096(%rsp)
	incl	EdgeProfCounters+11540(%rip)
	jmp	.LBB82_47
.LBB82_40:                              # %if.then52
	incl	EdgeProfCounters+11508(%rip)
	movq	32(%rsp), %rax
	cmpq	stdin(%rip), %rax
	je	.LBB82_41
# BB#42:                                # %land.lhs.true
	incl	EdgeProfCounters+11516(%rip)
	movq	32(%rsp), %rax
	cmpq	stdout(%rip), %rax
	je	.LBB82_43
# BB#44:                                # %if.then57
	incl	EdgeProfCounters+11524(%rip)
	movq	32(%rsp), %rdi
	callq	fclose
	incl	EdgeProfCounters+11532(%rip)
	jmp	.LBB82_45
.LBB82_41:                              # %if.then52.if.end59_crit_edge
	incl	EdgeProfCounters+11520(%rip)
	jmp	.LBB82_45
.LBB82_43:                              # %land.lhs.true.if.end59_crit_edge
	incl	EdgeProfCounters+11528(%rip)
.LBB82_45:                              # %if.end59
	movq	$0, 5096(%rsp)
	incl	EdgeProfCounters+11536(%rip)
.LBB82_47:                              # %return
	movq	5096(%rsp), %rax
	addq	$5104, %rsp             # imm = 0x13F0
	popq	%rbx
	ret
.Ltmp318:
	.size	bzopen_or_bzdopen, .Ltmp318-bzopen_or_bzdopen
	.cfi_endproc

	.globl	BZ2_bzdopen
	.align	16, 0x90
	.type	BZ2_bzdopen,@function
BZ2_bzdopen:                            # @BZ2_bzdopen
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp320:
	.cfi_def_cfa_offset 32
	movq	%rsi, %rax
	incl	EdgeProfCounters+11544(%rip)
	movl	%edi, 20(%rsp)
	movq	%rax, 8(%rsp)
	movl	20(%rsp), %esi
	xorl	%edi, %edi
	movq	%rax, %rdx
	movl	$1, %ecx
	callq	bzopen_or_bzdopen
	addq	$24, %rsp
	ret
.Ltmp321:
	.size	BZ2_bzdopen, .Ltmp321-BZ2_bzdopen
	.cfi_endproc

	.globl	BZ2_bzread
	.align	16, 0x90
	.type	BZ2_bzread,@function
BZ2_bzread:                             # @BZ2_bzread
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp323:
	.cfi_def_cfa_offset 48
	incl	EdgeProfCounters+11548(%rip)
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movl	%edx, 12(%rsp)
	movq	24(%rsp), %rax
	cmpl	$4, 5096(%rax)
	jne	.LBB84_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+11552(%rip)
	movl	$0, 36(%rsp)
	incl	EdgeProfCounters+11560(%rip)
	jmp	.LBB84_8
.LBB84_2:                               # %if.end
	incl	EdgeProfCounters+11556(%rip)
	movl	12(%rsp), %ecx
	movq	16(%rsp), %rdx
	movq	24(%rsp), %rsi
	leaq	8(%rsp), %rdi
	callq	BZ2_bzRead
	movl	%eax, 4(%rsp)
	cmpl	$0, 8(%rsp)
	je	.LBB84_3
# BB#4:                                 # %lor.lhs.false
	incl	EdgeProfCounters+11568(%rip)
	cmpl	$4, 8(%rsp)
	jne	.LBB84_7
# BB#5:                                 # %lor.lhs.false.if.then3_crit_edge
	incl	EdgeProfCounters+11572(%rip)
	jmp	.LBB84_6
.LBB84_3:                               # %if.end.if.then3_crit_edge
	incl	EdgeProfCounters+11564(%rip)
.LBB84_6:                               # %if.then3
	movl	4(%rsp), %eax
	movl	%eax, 36(%rsp)
	incl	EdgeProfCounters+11580(%rip)
	jmp	.LBB84_8
.LBB84_7:                               # %if.else
	incl	EdgeProfCounters+11576(%rip)
	movl	$-1, 36(%rsp)
	incl	EdgeProfCounters+11584(%rip)
.LBB84_8:                               # %return
	movl	36(%rsp), %eax
	addq	$40, %rsp
	ret
.Ltmp324:
	.size	BZ2_bzread, .Ltmp324-BZ2_bzread
	.cfi_endproc

	.globl	BZ2_bzwrite
	.align	16, 0x90
	.type	BZ2_bzwrite,@function
BZ2_bzwrite:                            # @BZ2_bzwrite
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp326:
	.cfi_def_cfa_offset 48
	movl	%edx, %eax
	incl	EdgeProfCounters+11588(%rip)
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movl	%eax, 12(%rsp)
	movq	16(%rsp), %rdx
	movq	24(%rsp), %rsi
	leaq	8(%rsp), %rdi
	movl	%eax, %ecx
	callq	BZ2_bzWrite
	cmpl	$0, 8(%rsp)
	je	.LBB85_1
# BB#2:                                 # %if.else
	incl	EdgeProfCounters+11596(%rip)
	movl	$-1, 36(%rsp)
	incl	EdgeProfCounters+11604(%rip)
	jmp	.LBB85_3
.LBB85_1:                               # %if.then
	incl	EdgeProfCounters+11592(%rip)
	movl	12(%rsp), %eax
	movl	%eax, 36(%rsp)
	incl	EdgeProfCounters+11600(%rip)
.LBB85_3:                               # %return
	movl	36(%rsp), %eax
	addq	$40, %rsp
	ret
.Ltmp327:
	.size	BZ2_bzwrite, .Ltmp327-BZ2_bzwrite
	.cfi_endproc

	.globl	BZ2_bzflush
	.align	16, 0x90
	.type	BZ2_bzflush,@function
BZ2_bzflush:                            # @BZ2_bzflush
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+11608(%rip)
	movq	%rdi, -8(%rsp)
	xorl	%eax, %eax
	ret
.Ltmp328:
	.size	BZ2_bzflush, .Ltmp328-BZ2_bzflush
	.cfi_endproc

	.globl	BZ2_bzclose
	.align	16, 0x90
	.type	BZ2_bzclose,@function
BZ2_bzclose:                            # @BZ2_bzclose
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp330:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+11612(%rip)
	movq	%rdi, 16(%rsp)
	movq	(%rdi), %rax
	movq	%rax, (%rsp)
	cmpq	$0, 16(%rsp)
	je	.LBB87_1
# BB#2:                                 # %if.end
	incl	EdgeProfCounters+11620(%rip)
	movq	16(%rsp), %rax
	cmpb	$0, 5012(%rax)
	je	.LBB87_6
# BB#3:                                 # %if.then1
	incl	EdgeProfCounters+11628(%rip)
	movq	16(%rsp), %rsi
	leaq	12(%rsp), %rdi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	callq	BZ2_bzWriteClose
	cmpl	$0, 12(%rsp)
	je	.LBB87_4
# BB#5:                                 # %if.then3
	incl	EdgeProfCounters+11636(%rip)
	movq	16(%rsp), %rsi
	xorl	%edi, %edi
	movl	$1, %edx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	callq	BZ2_bzWriteClose
	incl	EdgeProfCounters+11644(%rip)
	incl	EdgeProfCounters+11648(%rip)
	jmp	.LBB87_7
.LBB87_1:                               # %if.then
	incl	EdgeProfCounters+11616(%rip)
	incl	EdgeProfCounters+11624(%rip)
	addq	$24, %rsp
	ret
.LBB87_6:                               # %if.else
	incl	EdgeProfCounters+11632(%rip)
	movq	16(%rsp), %rsi
	leaq	12(%rsp), %rdi
	callq	BZ2_bzReadClose
	incl	EdgeProfCounters+11652(%rip)
	jmp	.LBB87_7
.LBB87_4:                               # %if.then1.if.end4_crit_edge
	incl	EdgeProfCounters+11640(%rip)
	incl	EdgeProfCounters+11648(%rip)
.LBB87_7:                               # %if.end5
	movq	(%rsp), %rax
	cmpq	stdin(%rip), %rax
	je	.LBB87_8
# BB#9:                                 # %land.lhs.true
	incl	EdgeProfCounters+11656(%rip)
	movq	(%rsp), %rax
	cmpq	stdout(%rip), %rax
	je	.LBB87_10
# BB#11:                                # %if.then8
	incl	EdgeProfCounters+11664(%rip)
	movq	(%rsp), %rdi
	callq	fclose
	incl	EdgeProfCounters+11672(%rip)
	addq	$24, %rsp
	ret
.LBB87_8:                               # %if.end5.if.end9_crit_edge
	incl	EdgeProfCounters+11660(%rip)
	addq	$24, %rsp
	ret
.LBB87_10:                              # %land.lhs.true.if.end9_crit_edge
	incl	EdgeProfCounters+11668(%rip)
	addq	$24, %rsp
	ret
.Ltmp331:
	.size	BZ2_bzclose, .Ltmp331-BZ2_bzclose
	.cfi_endproc

	.globl	BZ2_bzerror
	.align	16, 0x90
	.type	BZ2_bzerror,@function
BZ2_bzerror:                            # @BZ2_bzerror
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+11676(%rip)
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movq	-8(%rsp), %rax
	movl	5096(%rax), %eax
	movl	%eax, -20(%rsp)
	testl	%eax, %eax
	jle	.LBB88_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+11680(%rip)
	movl	$0, -20(%rsp)
	incl	EdgeProfCounters+11688(%rip)
	jmp	.LBB88_3
.LBB88_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+11684(%rip)
.LBB88_3:                               # %if.end
	movq	-16(%rsp), %rax
	movl	-20(%rsp), %ecx
	movl	%ecx, (%rax)
	xorl	%eax, %eax
	subl	-20(%rsp), %eax
	movslq	%eax, %rax
	movq	bzerrorstrings(,%rax,8), %rax
	ret
.Ltmp332:
	.size	BZ2_bzerror, .Ltmp332-BZ2_bzerror
	.cfi_endproc

	.align	16, 0x90
	.type	copy_output_until_stop,@function
copy_output_until_stop:                 # @copy_output_until_stop
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+11692(%rip)
	movq	%rdi, -8(%rsp)
	movb	$0, -9(%rsp)
	incl	EdgeProfCounters+11696(%rip)
	jmp	.LBB89_1
	.align	16, 0x90
.LBB89_7:                               # %if.end3.if.end19_crit_edge
                                        #   in Loop: Header=BB89_1 Depth=1
	incl	EdgeProfCounters+11728(%rip)
	incl	EdgeProfCounters+11736(%rip)
.LBB89_1:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	-8(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 32(%rax)
	je	.LBB89_2
# BB#3:                                 # %if.end
                                        #   in Loop: Header=BB89_1 Depth=1
	incl	EdgeProfCounters+11704(%rip)
	movq	-8(%rsp), %rax
	movl	120(%rax), %ecx
	cmpl	116(%rax), %ecx
	jge	.LBB89_4
# BB#6:                                 # %if.end3
                                        #   in Loop: Header=BB89_1 Depth=1
	incl	EdgeProfCounters+11716(%rip)
	movb	$1, -9(%rsp)
	movq	-8(%rsp), %rax
	movslq	120(%rax), %rcx
	movq	(%rax), %rdx
	movq	80(%rax), %rax
	movb	(%rax,%rcx), %al
	movq	24(%rdx), %rcx
	movb	%al, (%rcx)
	movq	-8(%rsp), %rax
	incl	120(%rax)
	movq	-8(%rsp), %rax
	movq	(%rax), %rax
	decl	32(%rax)
	movq	-8(%rsp), %rax
	movq	(%rax), %rax
	incq	24(%rax)
	movq	-8(%rsp), %rax
	movq	(%rax), %rax
	incl	36(%rax)
	movq	-8(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 36(%rax)
	jne	.LBB89_7
# BB#8:                                 # %if.then16
                                        #   in Loop: Header=BB89_1 Depth=1
	incl	EdgeProfCounters+11724(%rip)
	movq	-8(%rsp), %rax
	movq	(%rax), %rax
	incl	40(%rax)
	incl	EdgeProfCounters+11732(%rip)
	incl	EdgeProfCounters+11736(%rip)
	jmp	.LBB89_1
.LBB89_2:                               # %if.then
	incl	EdgeProfCounters+11700(%rip)
	incl	EdgeProfCounters+11708(%rip)
	movzbl	-9(%rsp), %eax
	ret
.LBB89_4:                               # %if.then2
	incl	EdgeProfCounters+11712(%rip)
	incl	EdgeProfCounters+11720(%rip)
	movzbl	-9(%rsp), %eax
	ret
.Ltmp333:
	.size	copy_output_until_stop, .Ltmp333-copy_output_until_stop
	.cfi_endproc

	.align	16, 0x90
	.type	copy_input_until_stop,@function
copy_input_until_stop:                  # @copy_input_until_stop
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp335:
	.cfi_def_cfa_offset 48
	incl	EdgeProfCounters+11740(%rip)
	movq	%rdi, 32(%rsp)
	movb	$0, 31(%rsp)
	movq	32(%rsp), %rax
	cmpl	$2, 8(%rax)
	jne	.LBB90_23
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+11744(%rip)
	incl	EdgeProfCounters+11752(%rip)
	jmp	.LBB90_2
	.align	16, 0x90
.LBB90_21:                              # %if.end44.if.end58_crit_edge
                                        #   in Loop: Header=BB90_2 Depth=1
	incl	EdgeProfCounters+11844(%rip)
	incl	EdgeProfCounters+11852(%rip)
.LBB90_2:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	32(%rsp), %rax
	movl	108(%rax), %ecx
	cmpl	112(%rax), %ecx
	jge	.LBB90_3
# BB#4:                                 # %if.end
                                        #   in Loop: Header=BB90_2 Depth=1
	incl	EdgeProfCounters+11760(%rip)
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB90_5
# BB#6:                                 # %if.end5
                                        #   in Loop: Header=BB90_2 Depth=1
	incl	EdgeProfCounters+11772(%rip)
	movb	$1, 31(%rsp)
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	movl	%eax, 24(%rsp)
	movq	32(%rsp), %rcx
	cmpl	92(%rcx), %eax
	je	.LBB90_7
# BB#8:                                 # %land.lhs.true
                                        #   in Loop: Header=BB90_2 Depth=1
	incl	EdgeProfCounters+11780(%rip)
	movq	32(%rsp), %rax
	cmpl	$1, 96(%rax)
	jne	.LBB90_9
# BB#50:                                # %if.then11
                                        #   in Loop: Header=BB90_2 Depth=1
	incl	EdgeProfCounters+11788(%rip)
	movq	32(%rsp), %rax
	movb	92(%rax), %al
	movb	%al, 23(%rsp)
	movq	32(%rsp), %rax
	movl	648(%rax), %ecx
	movl	%ecx, %esi
	shrl	$24, %esi
	movzbl	23(%rsp), %edx
	xorl	%esi, %edx
	shll	$8, %ecx
	xorl	BZ2_crc32Table(,%rdx,4), %ecx
	movl	%ecx, 648(%rax)
	movq	32(%rsp), %rax
	movl	92(%rax), %ecx
	movb	$1, 128(%rax,%rcx)
	movq	32(%rsp), %rcx
	movq	64(%rcx), %rax
	movslq	108(%rcx), %rcx
	movb	23(%rsp), %dl
	movb	%dl, (%rax,%rcx)
	movq	32(%rsp), %rax
	incl	108(%rax)
	movq	32(%rsp), %rax
	movl	24(%rsp), %ecx
	movl	%ecx, 92(%rax)
	incl	EdgeProfCounters+11796(%rip)
	jmp	.LBB90_20
	.align	16, 0x90
.LBB90_7:                               # %if.end5.if.else_crit_edge
                                        #   in Loop: Header=BB90_2 Depth=1
	incl	EdgeProfCounters+11784(%rip)
	jmp	.LBB90_10
	.align	16, 0x90
.LBB90_9:                               # %land.lhs.true.if.else_crit_edge
                                        #   in Loop: Header=BB90_2 Depth=1
	incl	EdgeProfCounters+11792(%rip)
.LBB90_10:                              # %if.else
                                        #   in Loop: Header=BB90_2 Depth=1
	movq	32(%rsp), %rax
	movl	24(%rsp), %ecx
	cmpl	92(%rax), %ecx
	je	.LBB90_12
# BB#11:                                # %if.else.if.then32_crit_edge
                                        #   in Loop: Header=BB90_2 Depth=1
	incl	EdgeProfCounters+11800(%rip)
	jmp	.LBB90_14
	.align	16, 0x90
.LBB90_12:                              # %lor.lhs.false
                                        #   in Loop: Header=BB90_2 Depth=1
	incl	EdgeProfCounters+11804(%rip)
	movq	32(%rsp), %rax
	cmpl	$255, 96(%rax)
	jne	.LBB90_18
# BB#13:                                # %lor.lhs.false.if.then32_crit_edge
                                        #   in Loop: Header=BB90_2 Depth=1
	incl	EdgeProfCounters+11808(%rip)
.LBB90_14:                              # %if.then32
                                        #   in Loop: Header=BB90_2 Depth=1
	movq	32(%rsp), %rax
	cmpl	$256, 92(%rax)          # imm = 0x100
	jae	.LBB90_15
# BB#16:                                # %if.then36
                                        #   in Loop: Header=BB90_2 Depth=1
	incl	EdgeProfCounters+11816(%rip)
	movq	32(%rsp), %rdi
	callq	add_pair_to_block
	incl	EdgeProfCounters+11824(%rip)
	jmp	.LBB90_17
	.align	16, 0x90
.LBB90_15:                              # %if.then32.if.end37_crit_edge
                                        #   in Loop: Header=BB90_2 Depth=1
	incl	EdgeProfCounters+11820(%rip)
.LBB90_17:                              # %if.end37
                                        #   in Loop: Header=BB90_2 Depth=1
	movq	32(%rsp), %rax
	movl	24(%rsp), %ecx
	movl	%ecx, 92(%rax)
	movq	32(%rsp), %rax
	movl	$1, 96(%rax)
	incl	EdgeProfCounters+11828(%rip)
	jmp	.LBB90_19
.LBB90_18:                              # %if.else40
                                        #   in Loop: Header=BB90_2 Depth=1
	incl	EdgeProfCounters+11812(%rip)
	movq	32(%rsp), %rax
	incl	96(%rax)
	incl	EdgeProfCounters+11832(%rip)
.LBB90_19:                              # %if.end43
                                        #   in Loop: Header=BB90_2 Depth=1
	incl	EdgeProfCounters+11836(%rip)
.LBB90_20:                              # %if.end44
                                        #   in Loop: Header=BB90_2 Depth=1
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB90_21
# BB#22:                                # %if.then55
                                        #   in Loop: Header=BB90_2 Depth=1
	incl	EdgeProfCounters+11840(%rip)
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+11848(%rip)
	incl	EdgeProfCounters+11852(%rip)
	jmp	.LBB90_2
.LBB90_23:                              # %if.else59
	incl	EdgeProfCounters+11748(%rip)
	incl	EdgeProfCounters+11860(%rip)
	jmp	.LBB90_24
	.align	16, 0x90
.LBB90_49:                              # %if.end151
                                        #   in Loop: Header=BB90_24 Depth=1
	movq	32(%rsp), %rax
	decl	16(%rax)
	incl	EdgeProfCounters+11972(%rip)
.LBB90_24:                              # %while.body60
                                        # =>This Inner Loop Header: Depth=1
	movq	32(%rsp), %rax
	movl	108(%rax), %ecx
	cmpl	112(%rax), %ecx
	jge	.LBB90_25
# BB#26:                                # %if.end66
                                        #   in Loop: Header=BB90_24 Depth=1
	incl	EdgeProfCounters+11868(%rip)
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB90_27
# BB#28:                                # %if.end72
                                        #   in Loop: Header=BB90_24 Depth=1
	incl	EdgeProfCounters+11880(%rip)
	movq	32(%rsp), %rax
	cmpl	$0, 16(%rax)
	je	.LBB90_29
# BB#32:                                # %if.end76
                                        #   in Loop: Header=BB90_24 Depth=1
	incl	EdgeProfCounters+11892(%rip)
	movb	$1, 31(%rsp)
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	movl	%eax, 16(%rsp)
	movq	32(%rsp), %rcx
	cmpl	92(%rcx), %eax
	je	.LBB90_33
# BB#34:                                # %land.lhs.true84
                                        #   in Loop: Header=BB90_24 Depth=1
	incl	EdgeProfCounters+11900(%rip)
	movq	32(%rsp), %rax
	cmpl	$1, 96(%rax)
	jne	.LBB90_35
# BB#51:                                # %if.then88
                                        #   in Loop: Header=BB90_24 Depth=1
	incl	EdgeProfCounters+11908(%rip)
	movq	32(%rsp), %rax
	movb	92(%rax), %al
	movb	%al, 15(%rsp)
	movq	32(%rsp), %rax
	movl	648(%rax), %ecx
	movl	%ecx, %esi
	shrl	$24, %esi
	movzbl	15(%rsp), %edx
	xorl	%esi, %edx
	shll	$8, %ecx
	xorl	BZ2_crc32Table(,%rdx,4), %ecx
	movl	%ecx, 648(%rax)
	movq	32(%rsp), %rax
	movl	92(%rax), %ecx
	movb	$1, 128(%rax,%rcx)
	movq	32(%rsp), %rcx
	movq	64(%rcx), %rax
	movslq	108(%rcx), %rcx
	movb	15(%rsp), %dl
	movb	%dl, (%rax,%rcx)
	movq	32(%rsp), %rax
	incl	108(%rax)
	movq	32(%rsp), %rax
	movl	16(%rsp), %ecx
	movl	%ecx, 92(%rax)
	incl	EdgeProfCounters+11916(%rip)
	jmp	.LBB90_46
	.align	16, 0x90
.LBB90_33:                              # %if.end76.if.else113_crit_edge
                                        #   in Loop: Header=BB90_24 Depth=1
	incl	EdgeProfCounters+11904(%rip)
	jmp	.LBB90_36
	.align	16, 0x90
.LBB90_35:                              # %land.lhs.true84.if.else113_crit_edge
                                        #   in Loop: Header=BB90_24 Depth=1
	incl	EdgeProfCounters+11912(%rip)
.LBB90_36:                              # %if.else113
                                        #   in Loop: Header=BB90_24 Depth=1
	movq	32(%rsp), %rax
	movl	16(%rsp), %ecx
	cmpl	92(%rax), %ecx
	je	.LBB90_38
# BB#37:                                # %if.else113.if.then121_crit_edge
                                        #   in Loop: Header=BB90_24 Depth=1
	incl	EdgeProfCounters+11920(%rip)
	jmp	.LBB90_40
	.align	16, 0x90
.LBB90_38:                              # %lor.lhs.false117
                                        #   in Loop: Header=BB90_24 Depth=1
	incl	EdgeProfCounters+11924(%rip)
	movq	32(%rsp), %rax
	cmpl	$255, 96(%rax)
	jne	.LBB90_44
# BB#39:                                # %lor.lhs.false117.if.then121_crit_edge
                                        #   in Loop: Header=BB90_24 Depth=1
	incl	EdgeProfCounters+11928(%rip)
.LBB90_40:                              # %if.then121
                                        #   in Loop: Header=BB90_24 Depth=1
	movq	32(%rsp), %rax
	cmpl	$256, 92(%rax)          # imm = 0x100
	jae	.LBB90_41
# BB#42:                                # %if.then125
                                        #   in Loop: Header=BB90_24 Depth=1
	incl	EdgeProfCounters+11936(%rip)
	movq	32(%rsp), %rdi
	callq	add_pair_to_block
	incl	EdgeProfCounters+11944(%rip)
	jmp	.LBB90_43
	.align	16, 0x90
.LBB90_41:                              # %if.then121.if.end126_crit_edge
                                        #   in Loop: Header=BB90_24 Depth=1
	incl	EdgeProfCounters+11940(%rip)
.LBB90_43:                              # %if.end126
                                        #   in Loop: Header=BB90_24 Depth=1
	movq	32(%rsp), %rax
	movl	16(%rsp), %ecx
	movl	%ecx, 92(%rax)
	movq	32(%rsp), %rax
	movl	$1, 96(%rax)
	incl	EdgeProfCounters+11948(%rip)
	jmp	.LBB90_45
.LBB90_44:                              # %if.else129
                                        #   in Loop: Header=BB90_24 Depth=1
	incl	EdgeProfCounters+11932(%rip)
	movq	32(%rsp), %rax
	incl	96(%rax)
	incl	EdgeProfCounters+11952(%rip)
.LBB90_45:                              # %if.end132
                                        #   in Loop: Header=BB90_24 Depth=1
	incl	EdgeProfCounters+11956(%rip)
.LBB90_46:                              # %if.end133
                                        #   in Loop: Header=BB90_24 Depth=1
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB90_47
# BB#48:                                # %if.then147
                                        #   in Loop: Header=BB90_24 Depth=1
	incl	EdgeProfCounters+11960(%rip)
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+11968(%rip)
	jmp	.LBB90_49
	.align	16, 0x90
.LBB90_47:                              # %if.end133.if.end151_crit_edge
                                        #   in Loop: Header=BB90_24 Depth=1
	incl	EdgeProfCounters+11964(%rip)
	jmp	.LBB90_49
.LBB90_3:                               # %if.then2
	incl	EdgeProfCounters+11756(%rip)
	incl	EdgeProfCounters+11764(%rip)
	incl	EdgeProfCounters+11856(%rip)
	jmp	.LBB90_31
.LBB90_5:                               # %if.then4
	incl	EdgeProfCounters+11768(%rip)
	incl	EdgeProfCounters+11776(%rip)
	incl	EdgeProfCounters+11856(%rip)
	jmp	.LBB90_31
.LBB90_25:                              # %if.then65
	incl	EdgeProfCounters+11864(%rip)
	incl	EdgeProfCounters+11872(%rip)
	jmp	.LBB90_30
.LBB90_27:                              # %if.then71
	incl	EdgeProfCounters+11876(%rip)
	incl	EdgeProfCounters+11884(%rip)
	jmp	.LBB90_30
.LBB90_29:                              # %if.then75
	incl	EdgeProfCounters+11888(%rip)
	incl	EdgeProfCounters+11896(%rip)
.LBB90_30:                              # %while.end154
	incl	EdgeProfCounters+11976(%rip)
.LBB90_31:                              # %if.end155
	movzbl	31(%rsp), %eax
	addq	$40, %rsp
	ret
.Ltmp336:
	.size	copy_input_until_stop, .Ltmp336-copy_input_until_stop
	.cfi_endproc

	.align	16, 0x90
	.type	flush_RL,@function
flush_RL:                               # @flush_RL
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp338:
	.cfi_def_cfa_offset 16
	incl	EdgeProfCounters+11980(%rip)
	movq	%rdi, (%rsp)
	cmpl	$256, 92(%rdi)          # imm = 0x100
	jae	.LBB91_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+11984(%rip)
	movq	(%rsp), %rdi
	callq	add_pair_to_block
	incl	EdgeProfCounters+11992(%rip)
	jmp	.LBB91_3
.LBB91_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+11988(%rip)
.LBB91_3:                               # %if.end
	movq	(%rsp), %rdi
	callq	init_RL
	popq	%rax
	ret
.Ltmp339:
	.size	flush_RL, .Ltmp339-flush_RL
	.cfi_endproc

	.align	16, 0x90
	.type	add_pair_to_block,@function
add_pair_to_block:                      # @add_pair_to_block
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+11996(%rip)
	movq	%rdi, -8(%rsp)
	movb	92(%rdi), %al
	movb	%al, -13(%rsp)
	movl	$0, -12(%rsp)
	incl	EdgeProfCounters+12000(%rip)
	jmp	.LBB92_1
	.align	16, 0x90
.LBB92_2:                               # %for.body
                                        #   in Loop: Header=BB92_1 Depth=1
	incl	EdgeProfCounters+12004(%rip)
	movq	-8(%rsp), %rax
	movl	648(%rax), %ecx
	movl	%ecx, %esi
	shrl	$24, %esi
	movzbl	-13(%rsp), %edx
	xorl	%esi, %edx
	shll	$8, %ecx
	xorl	BZ2_crc32Table(,%rdx,4), %ecx
	movl	%ecx, 648(%rax)
	incl	EdgeProfCounters+12012(%rip)
	incl	-12(%rsp)
	incl	EdgeProfCounters+12016(%rip)
.LBB92_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-8(%rsp), %rax
	movl	-12(%rsp), %ecx
	cmpl	96(%rax), %ecx
	jl	.LBB92_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+12008(%rip)
	movq	-8(%rsp), %rax
	movl	92(%rax), %ecx
	movb	$1, 128(%rax,%rcx)
	movq	-8(%rsp), %rax
	movl	96(%rax), %eax
	cmpl	$3, %eax
	je	.LBB92_8
# BB#4:                                 # %for.end
	cmpl	$2, %eax
	jne	.LBB92_5
# BB#7:                                 # %sw.bb14
	incl	EdgeProfCounters+12028(%rip)
	movq	-8(%rsp), %rcx
	movq	64(%rcx), %rax
	movslq	108(%rcx), %rcx
	movb	-13(%rsp), %dl
	movb	%dl, (%rax,%rcx)
	movq	-8(%rsp), %rax
	incl	108(%rax)
	movq	-8(%rsp), %rcx
	movq	64(%rcx), %rax
	movslq	108(%rcx), %rcx
	movb	-13(%rsp), %dl
	movb	%dl, (%rax,%rcx)
	movq	-8(%rsp), %rax
	incl	108(%rax)
	incl	EdgeProfCounters+12040(%rip)
	ret
.LBB92_8:                               # %sw.bb27
	incl	EdgeProfCounters+12032(%rip)
	movq	-8(%rsp), %rcx
	movq	64(%rcx), %rax
	movslq	108(%rcx), %rcx
	movb	-13(%rsp), %dl
	movb	%dl, (%rax,%rcx)
	movq	-8(%rsp), %rax
	incl	108(%rax)
	movq	-8(%rsp), %rcx
	movq	64(%rcx), %rax
	movslq	108(%rcx), %rcx
	movb	-13(%rsp), %dl
	movb	%dl, (%rax,%rcx)
	movq	-8(%rsp), %rax
	incl	108(%rax)
	movq	-8(%rsp), %rcx
	movq	64(%rcx), %rax
	movslq	108(%rcx), %rcx
	movb	-13(%rsp), %dl
	movb	%dl, (%rax,%rcx)
	movq	-8(%rsp), %rax
	incl	108(%rax)
	incl	EdgeProfCounters+12044(%rip)
	ret
.LBB92_5:                               # %for.end
	cmpl	$1, %eax
	jne	.LBB92_9
# BB#6:                                 # %sw.bb
	incl	EdgeProfCounters+12024(%rip)
	movq	-8(%rsp), %rcx
	movq	64(%rcx), %rax
	movslq	108(%rcx), %rcx
	movb	-13(%rsp), %dl
	movb	%dl, (%rax,%rcx)
	movq	-8(%rsp), %rax
	incl	108(%rax)
	incl	EdgeProfCounters+12036(%rip)
	ret
.LBB92_9:                               # %sw.default
	incl	EdgeProfCounters+12020(%rip)
	movq	-8(%rsp), %rax
	movl	96(%rax), %ecx
	addl	$-4, %ecx
	movslq	%ecx, %rcx
	movb	$1, 128(%rax,%rcx)
	movq	-8(%rsp), %rcx
	movq	64(%rcx), %rax
	movslq	108(%rcx), %rcx
	movb	-13(%rsp), %dl
	movb	%dl, (%rax,%rcx)
	movq	-8(%rsp), %rax
	incl	108(%rax)
	movq	-8(%rsp), %rcx
	movq	64(%rcx), %rax
	movslq	108(%rcx), %rcx
	movb	-13(%rsp), %dl
	movb	%dl, (%rax,%rcx)
	movq	-8(%rsp), %rax
	incl	108(%rax)
	movq	-8(%rsp), %rcx
	movq	64(%rcx), %rax
	movslq	108(%rcx), %rcx
	movb	-13(%rsp), %dl
	movb	%dl, (%rax,%rcx)
	movq	-8(%rsp), %rax
	incl	108(%rax)
	movq	-8(%rsp), %rcx
	movq	64(%rcx), %rax
	movslq	108(%rcx), %rcx
	movb	-13(%rsp), %dl
	movb	%dl, (%rax,%rcx)
	movq	-8(%rsp), %rax
	incl	108(%rax)
	movq	-8(%rsp), %rdx
	movq	64(%rdx), %rax
	movslq	108(%rdx), %rcx
	movl	96(%rdx), %edx
	addl	$-4, %edx
	movb	%dl, (%rax,%rcx)
	movq	-8(%rsp), %rax
	incl	108(%rax)
	incl	EdgeProfCounters+12048(%rip)
	ret
.Ltmp340:
	.size	add_pair_to_block, .Ltmp340-add_pair_to_block
	.cfi_endproc

	.globl	BZ2_bsInitWrite
	.align	16, 0x90
	.type	BZ2_bsInitWrite,@function
BZ2_bsInitWrite:                        # @BZ2_bsInitWrite
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+12052(%rip)
	movq	%rdi, -8(%rsp)
	movl	$0, 644(%rdi)
	movq	-8(%rsp), %rax
	movl	$0, 640(%rax)
	ret
.Ltmp341:
	.size	BZ2_bsInitWrite, .Ltmp341-BZ2_bsInitWrite
	.cfi_endproc

	.globl	BZ2_compressBlock
	.align	16, 0x90
	.type	BZ2_compressBlock,@function
BZ2_compressBlock:                      # @BZ2_compressBlock
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp343:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+12056(%rip)
	movq	%rdi, 16(%rsp)
	movb	%sil, 15(%rsp)
	movq	16(%rsp), %rax
	cmpl	$0, 108(%rax)
	jle	.LBB94_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+12060(%rip)
	movq	16(%rsp), %rax
	notl	648(%rax)
	movq	16(%rsp), %rax
	roll	652(%rax)
	movq	16(%rsp), %rax
	movl	648(%rax), %ecx
	xorl	%ecx, 652(%rax)
	movq	16(%rsp), %rax
	cmpl	$1, 660(%rax)
	jle	.LBB94_3
# BB#4:                                 # %if.then7
	incl	EdgeProfCounters+12068(%rip)
	movq	16(%rsp), %rax
	movl	$0, 116(%rax)
	incl	EdgeProfCounters+12076(%rip)
	jmp	.LBB94_5
.LBB94_1:                               # %entry.if.end15_crit_edge
	incl	EdgeProfCounters+12064(%rip)
	jmp	.LBB94_9
.LBB94_3:                               # %if.then.if.end_crit_edge
	incl	EdgeProfCounters+12072(%rip)
.LBB94_5:                               # %if.end
	movq	16(%rsp), %rax
	cmpl	$1, 656(%rax)
	jle	.LBB94_6
# BB#7:                                 # %if.then9
	incl	EdgeProfCounters+12080(%rip)
	movq	16(%rsp), %rax
	movl	108(%rax), %r9d
	movl	652(%rax), %r8d
	movl	648(%rax), %ecx
	movl	660(%rax), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str148, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+12088(%rip)
	jmp	.LBB94_8
.LBB94_6:                               # %if.end.if.end14_crit_edge
	incl	EdgeProfCounters+12084(%rip)
.LBB94_8:                               # %if.end14
	movq	16(%rsp), %rdi
	callq	BZ2_blockSort
	incl	EdgeProfCounters+12092(%rip)
.LBB94_9:                               # %if.end15
	movq	16(%rsp), %rax
	movslq	108(%rax), %rcx
	addq	32(%rax), %rcx
	movq	%rcx, 80(%rax)
	movq	16(%rsp), %rax
	cmpl	$1, 660(%rax)
	jne	.LBB94_10
# BB#11:                                # %if.then19
	incl	EdgeProfCounters+12096(%rip)
	movq	16(%rsp), %rdi
	callq	BZ2_bsInitWrite
	movq	16(%rsp), %rdi
	movl	$66, %esi
	callq	bsPutUChar
	movq	16(%rsp), %rdi
	movl	$90, %esi
	callq	bsPutUChar
	movq	16(%rsp), %rdi
	movl	$104, %esi
	callq	bsPutUChar
	movq	16(%rsp), %rdi
	movl	664(%rdi), %eax
	addl	$48, %eax
	movzbl	%al, %esi
	callq	bsPutUChar
	incl	EdgeProfCounters+12104(%rip)
	jmp	.LBB94_12
.LBB94_10:                              # %if.end15.if.end20_crit_edge
	incl	EdgeProfCounters+12100(%rip)
.LBB94_12:                              # %if.end20
	movq	16(%rsp), %rax
	cmpl	$0, 108(%rax)
	jle	.LBB94_13
# BB#14:                                # %if.then24
	incl	EdgeProfCounters+12108(%rip)
	movq	16(%rsp), %rdi
	movl	$49, %esi
	callq	bsPutUChar
	movq	16(%rsp), %rdi
	movl	$65, %esi
	callq	bsPutUChar
	movq	16(%rsp), %rdi
	movl	$89, %esi
	callq	bsPutUChar
	movq	16(%rsp), %rdi
	movl	$38, %esi
	callq	bsPutUChar
	movq	16(%rsp), %rdi
	movl	$83, %esi
	callq	bsPutUChar
	movq	16(%rsp), %rdi
	movl	$89, %esi
	callq	bsPutUChar
	movq	16(%rsp), %rdi
	movl	648(%rdi), %esi
	callq	bsPutUInt32
	movq	16(%rsp), %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	bsW
	movq	16(%rsp), %rdi
	movl	48(%rdi), %edx
	movl	$24, %esi
	callq	bsW
	movq	16(%rsp), %rdi
	callq	generateMTFValues
	movq	16(%rsp), %rdi
	callq	sendMTFValues
	incl	EdgeProfCounters+12116(%rip)
	jmp	.LBB94_15
.LBB94_13:                              # %if.end20.if.end26_crit_edge
	incl	EdgeProfCounters+12112(%rip)
.LBB94_15:                              # %if.end26
	cmpb	$0, 15(%rsp)
	je	.LBB94_16
# BB#17:                                # %if.then27
	incl	EdgeProfCounters+12120(%rip)
	movq	16(%rsp), %rdi
	movl	$23, %esi
	callq	bsPutUChar
	movq	16(%rsp), %rdi
	movl	$114, %esi
	callq	bsPutUChar
	movq	16(%rsp), %rdi
	movl	$69, %esi
	callq	bsPutUChar
	movq	16(%rsp), %rdi
	movl	$56, %esi
	callq	bsPutUChar
	movq	16(%rsp), %rdi
	movl	$80, %esi
	callq	bsPutUChar
	movq	16(%rsp), %rdi
	movl	$144, %esi
	callq	bsPutUChar
	movq	16(%rsp), %rdi
	movl	652(%rdi), %esi
	callq	bsPutUInt32
	movq	16(%rsp), %rax
	cmpl	$1, 656(%rax)
	jle	.LBB94_18
# BB#19:                                # %if.then32
	incl	EdgeProfCounters+12128(%rip)
	movq	16(%rsp), %rax
	movl	652(%rax), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str1149, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+12136(%rip)
	jmp	.LBB94_20
.LBB94_16:                              # %if.end26.if.end36_crit_edge
	incl	EdgeProfCounters+12124(%rip)
	addq	$24, %rsp
	ret
.LBB94_18:                              # %if.then27.if.end35_crit_edge
	incl	EdgeProfCounters+12132(%rip)
.LBB94_20:                              # %if.end35
	movq	16(%rsp), %rdi
	callq	bsFinishWrite
	incl	EdgeProfCounters+12140(%rip)
	addq	$24, %rsp
	ret
.Ltmp344:
	.size	BZ2_compressBlock, .Ltmp344-BZ2_compressBlock
	.cfi_endproc

	.align	16, 0x90
	.type	bsPutUChar,@function
bsPutUChar:                             # @bsPutUChar
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp346:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+12144(%rip)
	movq	%rdi, 16(%rsp)
	movb	%sil, 15(%rsp)
	movzbl	15(%rsp), %edx
	movq	16(%rsp), %rdi
	movl	$8, %esi
	callq	bsW
	addq	$24, %rsp
	ret
.Ltmp347:
	.size	bsPutUChar, .Ltmp347-bsPutUChar
	.cfi_endproc

	.align	16, 0x90
	.type	bsPutUInt32,@function
bsPutUInt32:                            # @bsPutUInt32
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp349:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+12148(%rip)
	movq	%rdi, 16(%rsp)
	movl	%esi, 12(%rsp)
	movzbl	15(%rsp), %edx
	movq	16(%rsp), %rdi
	movl	$8, %esi
	callq	bsW
	movq	16(%rsp), %rdi
	movzwl	14(%rsp), %eax
	movzbl	%al, %edx
	movl	$8, %esi
	callq	bsW
	movq	16(%rsp), %rdi
	movl	12(%rsp), %eax
	movzbl	%ah, %edx
	movl	$8, %esi
	callq	bsW
	movl	$255, %edx
	andl	12(%rsp), %edx
	movq	16(%rsp), %rdi
	movl	$8, %esi
	callq	bsW
	addq	$24, %rsp
	ret
.Ltmp350:
	.size	bsPutUInt32, .Ltmp350-bsPutUInt32
	.cfi_endproc

	.align	16, 0x90
	.type	bsW,@function
bsW:                                    # @bsW
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+12152(%rip)
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movl	%edx, -16(%rsp)
	incl	EdgeProfCounters+12156(%rip)
	jmp	.LBB97_1
	.align	16, 0x90
.LBB97_2:                               # %while.body
                                        #   in Loop: Header=BB97_1 Depth=1
	incl	EdgeProfCounters+12160(%rip)
	movq	-8(%rsp), %rax
	movq	80(%rax), %rcx
	movslq	116(%rax), %rdx
	movb	643(%rax), %al
	movb	%al, (%rcx,%rdx)
	movq	-8(%rsp), %rax
	incl	116(%rax)
	movq	-8(%rsp), %rax
	shll	$8, 640(%rax)
	movq	-8(%rsp), %rax
	addl	$-8, 644(%rax)
	incl	EdgeProfCounters+12168(%rip)
.LBB97_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-8(%rsp), %rax
	cmpl	$8, 644(%rax)
	jge	.LBB97_2
# BB#3:                                 # %while.end
	incl	EdgeProfCounters+12164(%rip)
	movl	$32, %ecx
	movq	-8(%rsp), %rax
	subl	644(%rax), %ecx
	subl	-12(%rsp), %ecx
	movl	-16(%rsp), %edx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shll	%cl, %edx
	orl	%edx, 640(%rax)
	movq	-8(%rsp), %rax
	movl	-12(%rsp), %ecx
	addl	%ecx, 644(%rax)
	ret
.Ltmp351:
	.size	bsW, .Ltmp351-bsW
	.cfi_endproc

	.align	16, 0x90
	.type	generateMTFValues,@function
generateMTFValues:                      # @generateMTFValues
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$344, %rsp              # imm = 0x158
.Ltmp353:
	.cfi_def_cfa_offset 352
	incl	EdgeProfCounters+12172(%rip)
	movq	%rdi, 336(%rsp)
	movq	56(%rdi), %rax
	movq	%rax, 48(%rsp)
	movq	336(%rsp), %rax
	movq	64(%rax), %rax
	movq	%rax, 40(%rsp)
	movq	336(%rsp), %rax
	movq	72(%rax), %rax
	movq	%rax, 32(%rsp)
	movq	336(%rsp), %rdi
	callq	makeMaps_e
	movq	336(%rsp), %rax
	movl	124(%rax), %eax
	incl	%eax
	movl	%eax, 60(%rsp)
	movl	$0, 76(%rsp)
	incl	EdgeProfCounters+12176(%rip)
	jmp	.LBB98_1
	.align	16, 0x90
.LBB98_2:                               # %for.inc
                                        #   in Loop: Header=BB98_1 Depth=1
	incl	EdgeProfCounters+12180(%rip)
	movq	336(%rsp), %rax
	movslq	76(%rsp), %rcx
	movl	$0, 672(%rax,%rcx,4)
	incl	EdgeProfCounters+12188(%rip)
	incl	76(%rsp)
	incl	EdgeProfCounters+12192(%rip)
.LBB98_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	76(%rsp), %eax
	cmpl	60(%rsp), %eax
	jle	.LBB98_2
# BB#3:                                 # %for.end
	incl	EdgeProfCounters+12184(%rip)
	movl	$0, 64(%rsp)
	movl	$0, 68(%rsp)
	movl	$0, 76(%rsp)
	incl	EdgeProfCounters+12196(%rip)
	jmp	.LBB98_4
	.align	16, 0x90
.LBB98_5:                               # %for.inc10
                                        #   in Loop: Header=BB98_4 Depth=1
	incl	EdgeProfCounters+12200(%rip)
	movslq	76(%rsp), %rax
	movb	%al, 80(%rsp,%rax)
	incl	EdgeProfCounters+12208(%rip)
	incl	76(%rsp)
	incl	EdgeProfCounters+12212(%rip)
.LBB98_4:                               # %for.cond4
                                        # =>This Inner Loop Header: Depth=1
	movq	336(%rsp), %rax
	movl	76(%rsp), %ecx
	cmpl	124(%rax), %ecx
	jl	.LBB98_5
# BB#6:                                 # %for.end12
	incl	EdgeProfCounters+12204(%rip)
	movl	$0, 76(%rsp)
	incl	EdgeProfCounters+12216(%rip)
	leaq	81(%rsp), %r8
	leaq	80(%rsp), %rcx
	jmp	.LBB98_7
	.align	16, 0x90
.LBB98_26:                              # %for.inc82
                                        #   in Loop: Header=BB98_7 Depth=1
	incl	EdgeProfCounters+12320(%rip)
	incl	76(%rsp)
	incl	EdgeProfCounters+12324(%rip)
.LBB98_7:                               # %for.cond13
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB98_16 Depth 2
                                        #     Child Loop BB98_23 Depth 2
	movq	336(%rsp), %rdx
	movl	76(%rsp), %esi
	cmpl	108(%rdx), %esi
	jge	.LBB98_27
# BB#8:                                 # %for.body16
                                        #   in Loop: Header=BB98_7 Depth=1
	incl	EdgeProfCounters+12220(%rip)
	movslq	76(%rsp), %rdx
	movq	48(%rsp), %rsi
	movl	(%rsi,%rdx,4), %edx
	decl	%edx
	movl	%edx, 72(%rsp)
	jns	.LBB98_9
# BB#10:                                # %if.then
                                        #   in Loop: Header=BB98_7 Depth=1
	incl	EdgeProfCounters+12228(%rip)
	movq	336(%rsp), %rdx
	movl	108(%rdx), %edx
	addl	%edx, 72(%rsp)
	incl	EdgeProfCounters+12236(%rip)
	jmp	.LBB98_11
	.align	16, 0x90
.LBB98_9:                               # %for.body16.if.end_crit_edge
                                        #   in Loop: Header=BB98_7 Depth=1
	incl	EdgeProfCounters+12232(%rip)
.LBB98_11:                              # %if.end
                                        #   in Loop: Header=BB98_7 Depth=1
	movslq	72(%rsp), %rdx
	movq	40(%rsp), %rsi
	movzbl	(%rsi,%rdx), %edx
	movq	336(%rsp), %rsi
	movb	384(%rsi,%rdx), %dl
	movb	%dl, 31(%rsp)
	movzbl	31(%rsp), %edx
	movzbl	80(%rsp), %esi
	cmpl	%edx, %esi
	jne	.LBB98_13
# BB#12:                                # %if.then32
                                        #   in Loop: Header=BB98_7 Depth=1
	incl	EdgeProfCounters+12240(%rip)
	incl	68(%rsp)
	incl	EdgeProfCounters+12248(%rip)
	jmp	.LBB98_26
	.align	16, 0x90
.LBB98_13:                              # %if.else
                                        #   in Loop: Header=BB98_7 Depth=1
	incl	EdgeProfCounters+12244(%rip)
	cmpl	$0, 68(%rsp)
	jle	.LBB98_14
# BB#15:                                # %if.then36
                                        #   in Loop: Header=BB98_7 Depth=1
	incl	EdgeProfCounters+12252(%rip)
	decl	68(%rsp)
	incl	EdgeProfCounters+12260(%rip)
	jmp	.LBB98_16
	.align	16, 0x90
.LBB98_20:                              # %if.end55
                                        #   in Loop: Header=BB98_16 Depth=2
	incl	EdgeProfCounters+12284(%rip)
	movl	68(%rsp), %edx
	leal	-2(%rdx), %esi
	shrl	$31, %esi
	leal	-2(%rdx,%rsi), %edx
	sarl	%edx
	movl	%edx, 68(%rsp)
	incl	EdgeProfCounters+12292(%rip)
.LBB98_16:                              # %while.body
                                        #   Parent Loop BB98_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testb	$1, 68(%rsp)
	je	.LBB98_18
# BB#17:                                # %if.then37
                                        #   in Loop: Header=BB98_16 Depth=2
	incl	EdgeProfCounters+12264(%rip)
	movq	32(%rsp), %rdx
	movslq	64(%rsp), %rsi
	movw	$1, (%rdx,%rsi,2)
	incl	64(%rsp)
	movq	336(%rsp), %rdx
	incl	676(%rdx)
	incl	EdgeProfCounters+12272(%rip)
	jmp	.LBB98_19
	.align	16, 0x90
.LBB98_18:                              # %if.else44
                                        #   in Loop: Header=BB98_16 Depth=2
	incl	EdgeProfCounters+12268(%rip)
	movq	32(%rsp), %rdx
	movslq	64(%rsp), %rsi
	movw	$0, (%rdx,%rsi,2)
	incl	64(%rsp)
	movq	336(%rsp), %rdx
	incl	672(%rdx)
	incl	EdgeProfCounters+12276(%rip)
.LBB98_19:                              # %if.end51
                                        #   in Loop: Header=BB98_16 Depth=2
	cmpl	$2, 68(%rsp)
	jge	.LBB98_20
# BB#21:                                # %while.end
                                        #   in Loop: Header=BB98_7 Depth=1
	incl	EdgeProfCounters+12280(%rip)
	incl	EdgeProfCounters+12288(%rip)
	movl	$0, 68(%rsp)
	incl	EdgeProfCounters+12296(%rip)
	jmp	.LBB98_22
	.align	16, 0x90
.LBB98_14:                              # %if.else.if.end57_crit_edge
                                        #   in Loop: Header=BB98_7 Depth=1
	incl	EdgeProfCounters+12256(%rip)
.LBB98_22:                              # %if.end57
                                        #   in Loop: Header=BB98_7 Depth=1
	movb	81(%rsp), %dl
	movb	%dl, 30(%rsp)
	movb	80(%rsp), %dl
	movb	%dl, 81(%rsp)
	movq	%r8, 16(%rsp)
	movb	31(%rsp), %dl
	movb	%dl, 15(%rsp)
	incl	EdgeProfCounters+12300(%rip)
	jmp	.LBB98_23
	.align	16, 0x90
.LBB98_24:                              # %while.body66
                                        #   in Loop: Header=BB98_23 Depth=2
	incl	EdgeProfCounters+12304(%rip)
	incq	16(%rsp)
	movb	30(%rsp), %dl
	movb	%dl, 14(%rsp)
	movq	16(%rsp), %rdx
	movb	(%rdx), %dl
	movb	%dl, 30(%rsp)
	movq	16(%rsp), %rdx
	movb	14(%rsp), %al
	movb	%al, (%rdx)
	incl	EdgeProfCounters+12312(%rip)
.LBB98_23:                              # %while.cond
                                        #   Parent Loop BB98_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	30(%rsp), %edx
	movzbl	15(%rsp), %esi
	cmpl	%edx, %esi
	jne	.LBB98_24
# BB#25:                                # %while.end67
                                        #   in Loop: Header=BB98_7 Depth=1
	incl	EdgeProfCounters+12308(%rip)
	movb	30(%rsp), %dl
	movb	%dl, 80(%rsp)
	movl	16(%rsp), %edx
	subl	%ecx, %edx
	movl	%edx, 72(%rsp)
	incl	%edx
	movq	32(%rsp), %rsi
	movslq	64(%rsp), %rdi
	movw	%dx, (%rsi,%rdi,2)
	incl	64(%rsp)
	movl	72(%rsp), %edx
	incl	%edx
	movslq	%edx, %rdx
	movq	336(%rsp), %rsi
	incl	672(%rsi,%rdx,4)
	incl	EdgeProfCounters+12316(%rip)
	jmp	.LBB98_26
.LBB98_27:                              # %for.end84
	incl	EdgeProfCounters+12224(%rip)
	cmpl	$0, 68(%rsp)
	jle	.LBB98_28
# BB#29:                                # %if.then87
	incl	EdgeProfCounters+12328(%rip)
	decl	68(%rsp)
	incl	EdgeProfCounters+12336(%rip)
	jmp	.LBB98_30
	.align	16, 0x90
.LBB98_34:                              # %if.end111
                                        #   in Loop: Header=BB98_30 Depth=1
	incl	EdgeProfCounters+12360(%rip)
	movl	68(%rsp), %eax
	leal	-2(%rax), %ecx
	shrl	$31, %ecx
	leal	-2(%rax,%rcx), %eax
	sarl	%eax
	movl	%eax, 68(%rsp)
	incl	EdgeProfCounters+12368(%rip)
.LBB98_30:                              # %while.body90
                                        # =>This Inner Loop Header: Depth=1
	testb	$1, 68(%rsp)
	je	.LBB98_32
# BB#31:                                # %if.then93
                                        #   in Loop: Header=BB98_30 Depth=1
	incl	EdgeProfCounters+12340(%rip)
	movq	32(%rsp), %rax
	movslq	64(%rsp), %rcx
	movw	$1, (%rax,%rcx,2)
	incl	64(%rsp)
	movq	336(%rsp), %rax
	incl	676(%rax)
	incl	EdgeProfCounters+12348(%rip)
	jmp	.LBB98_33
	.align	16, 0x90
.LBB98_32:                              # %if.else100
                                        #   in Loop: Header=BB98_30 Depth=1
	incl	EdgeProfCounters+12344(%rip)
	movq	32(%rsp), %rax
	movslq	64(%rsp), %rcx
	movw	$0, (%rax,%rcx,2)
	incl	64(%rsp)
	movq	336(%rsp), %rax
	incl	672(%rax)
	incl	EdgeProfCounters+12352(%rip)
.LBB98_33:                              # %if.end107
                                        #   in Loop: Header=BB98_30 Depth=1
	cmpl	$2, 68(%rsp)
	jge	.LBB98_34
# BB#35:                                # %while.end114
	incl	EdgeProfCounters+12356(%rip)
	incl	EdgeProfCounters+12364(%rip)
	movl	$0, 68(%rsp)
	incl	EdgeProfCounters+12372(%rip)
	jmp	.LBB98_36
.LBB98_28:                              # %for.end84.if.end115_crit_edge
	incl	EdgeProfCounters+12332(%rip)
.LBB98_36:                              # %if.end115
	movq	32(%rsp), %rax
	movslq	64(%rsp), %rcx
	movw	60(%rsp), %dx
	movw	%dx, (%rax,%rcx,2)
	incl	64(%rsp)
	movq	336(%rsp), %rax
	movslq	60(%rsp), %rcx
	incl	672(%rax,%rcx,4)
	movq	336(%rsp), %rax
	movl	64(%rsp), %ecx
	movl	%ecx, 668(%rax)
	addq	$344, %rsp              # imm = 0x158
	ret
.Ltmp354:
	.size	generateMTFValues, .Ltmp354-generateMTFValues
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI99_0:
	.quad	4636737291354636288     # double 1.000000e+02
                                        #  (0x4059000000000000)
	.text
	.align	16, 0x90
	.type	sendMTFValues,@function
sendMTFValues:                          # @sendMTFValues
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$232, %rsp
.Ltmp356:
	.cfi_def_cfa_offset 240
	incl	EdgeProfCounters+12376(%rip)
	movq	%rdi, 224(%rsp)
	movq	72(%rdi), %rax
	movq	%rax, 104(%rsp)
	movq	224(%rsp), %rax
	cmpl	$2, 656(%rax)
	jle	.LBB99_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+12380(%rip)
	movq	224(%rsp), %rax
	movl	668(%rax), %ecx
	movl	108(%rax), %edx
	movl	124(%rax), %r8d
	movq	stderr(%rip), %rdi
	movl	$.L.str2150, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+12388(%rip)
	jmp	.LBB99_3
.LBB99_1:                               # %entry.if.end_crit_edge
	incl	EdgeProfCounters+12384(%rip)
.LBB99_3:                               # %if.end
	movq	224(%rsp), %rax
	movl	124(%rax), %eax
	addl	$2, %eax
	movl	%eax, 176(%rsp)
	movl	$0, 216(%rsp)
	incl	EdgeProfCounters+12392(%rip)
	jmp	.LBB99_4
	.align	16, 0x90
.LBB99_8:                               # %for.inc9
                                        #   in Loop: Header=BB99_4 Depth=1
	incl	EdgeProfCounters+12412(%rip)
	incl	EdgeProfCounters+12424(%rip)
	incl	216(%rsp)
	incl	EdgeProfCounters+12428(%rip)
.LBB99_4:                               # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_6 Depth 2
	cmpl	$5, 216(%rsp)
	jg	.LBB99_9
# BB#5:                                 # %for.body
                                        #   in Loop: Header=BB99_4 Depth=1
	incl	EdgeProfCounters+12396(%rip)
	movl	$0, 220(%rsp)
	incl	EdgeProfCounters+12404(%rip)
	jmp	.LBB99_6
	.align	16, 0x90
.LBB99_7:                               # %for.inc
                                        #   in Loop: Header=BB99_6 Depth=2
	incl	EdgeProfCounters+12408(%rip)
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	220(%rsp), %rcx
	movb	$15, 37708(%rcx,%rax)
	incl	EdgeProfCounters+12416(%rip)
	incl	220(%rsp)
	incl	EdgeProfCounters+12420(%rip)
.LBB99_6:                               # %for.cond4
                                        #   Parent Loop BB99_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	220(%rsp), %eax
	cmpl	176(%rsp), %eax
	jge	.LBB99_8
	jmp	.LBB99_7
.LBB99_9:                               # %for.end11
	incl	EdgeProfCounters+12400(%rip)
	movq	224(%rsp), %rax
	cmpl	$0, 668(%rax)
	jle	.LBB99_11
# BB#10:                                # %for.end11.if.end15_crit_edge
	incl	EdgeProfCounters+12432(%rip)
	jmp	.LBB99_12
.LBB99_11:                              # %if.then14
	incl	EdgeProfCounters+12436(%rip)
	movl	$3001, %edi             # imm = 0xBB9
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+12440(%rip)
.LBB99_12:                              # %if.end15
	movq	224(%rsp), %rax
	cmpl	$199, 668(%rax)
	jg	.LBB99_14
# BB#13:                                # %if.then18
	incl	EdgeProfCounters+12444(%rip)
	movl	$2, 160(%rsp)
	incl	EdgeProfCounters+12452(%rip)
	jmp	.LBB99_24
.LBB99_14:                              # %if.else
	incl	EdgeProfCounters+12448(%rip)
	movq	224(%rsp), %rax
	cmpl	$599, 668(%rax)         # imm = 0x257
	jg	.LBB99_16
# BB#15:                                # %if.then21
	incl	EdgeProfCounters+12456(%rip)
	movl	$3, 160(%rsp)
	incl	EdgeProfCounters+12464(%rip)
	jmp	.LBB99_23
.LBB99_16:                              # %if.else22
	incl	EdgeProfCounters+12460(%rip)
	movq	224(%rsp), %rax
	cmpl	$1199, 668(%rax)        # imm = 0x4AF
	jg	.LBB99_18
# BB#17:                                # %if.then25
	incl	EdgeProfCounters+12468(%rip)
	movl	$4, 160(%rsp)
	incl	EdgeProfCounters+12476(%rip)
	jmp	.LBB99_22
.LBB99_18:                              # %if.else26
	incl	EdgeProfCounters+12472(%rip)
	movq	224(%rsp), %rax
	cmpl	$2399, 668(%rax)        # imm = 0x95F
	jg	.LBB99_20
# BB#19:                                # %if.then29
	incl	EdgeProfCounters+12480(%rip)
	movl	$5, 160(%rsp)
	incl	EdgeProfCounters+12488(%rip)
	jmp	.LBB99_21
.LBB99_20:                              # %if.else30
	incl	EdgeProfCounters+12484(%rip)
	movl	$6, 160(%rsp)
	incl	EdgeProfCounters+12492(%rip)
.LBB99_21:                              # %if.end31
	incl	EdgeProfCounters+12496(%rip)
.LBB99_22:                              # %if.end32
	incl	EdgeProfCounters+12500(%rip)
.LBB99_23:                              # %if.end33
	incl	EdgeProfCounters+12504(%rip)
.LBB99_24:                              # %if.end34
	movl	160(%rsp), %eax
	movl	%eax, 100(%rsp)
	movq	224(%rsp), %rax
	movl	668(%rax), %eax
	movl	%eax, 96(%rsp)
	movl	$0, 204(%rsp)
	incl	EdgeProfCounters+12508(%rip)
	jmp	.LBB99_25
	.align	16, 0x90
.LBB99_52:                              # %for.end95
                                        #   in Loop: Header=BB99_25 Depth=1
	incl	EdgeProfCounters+12604(%rip)
	decl	100(%rsp)
	movl	200(%rsp), %eax
	incl	%eax
	movl	%eax, 204(%rsp)
	movl	88(%rsp), %eax
	subl	%eax, 96(%rsp)
	incl	EdgeProfCounters+12640(%rip)
.LBB99_25:                              # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_27 Depth 2
                                        #     Child Loop BB99_45 Depth 2
	cmpl	$0, 100(%rsp)
	jle	.LBB99_53
# BB#26:                                # %while.body
                                        #   in Loop: Header=BB99_25 Depth=1
	incl	EdgeProfCounters+12512(%rip)
	movl	96(%rsp), %eax
	cltd
	idivl	100(%rsp)
	movl	%eax, 92(%rsp)
	movl	204(%rsp), %eax
	decl	%eax
	movl	%eax, 200(%rsp)
	movl	$0, 88(%rsp)
	incl	EdgeProfCounters+12520(%rip)
	jmp	.LBB99_27
	.align	16, 0x90
.LBB99_31:                              # %while.body41
                                        #   in Loop: Header=BB99_27 Depth=2
	incl	EdgeProfCounters+12536(%rip)
	incl	200(%rsp)
	movslq	200(%rsp), %rax
	movq	224(%rsp), %rcx
	movl	672(%rcx,%rax,4), %eax
	addl	%eax, 88(%rsp)
	incl	EdgeProfCounters+12544(%rip)
.LBB99_27:                              # %while.cond37
                                        #   Parent Loop BB99_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	88(%rsp), %eax
	cmpl	92(%rsp), %eax
	jge	.LBB99_28
# BB#29:                                # %land.rhs
                                        #   in Loop: Header=BB99_27 Depth=2
	incl	EdgeProfCounters+12524(%rip)
	movl	176(%rsp), %eax
	decl	%eax
	cmpl	%eax, 200(%rsp)
	setl	%al
	incl	EdgeProfCounters+12532(%rip)
	jmp	.LBB99_30
	.align	16, 0x90
.LBB99_28:                              # %while.cond37.land.end_crit_edge
                                        #   in Loop: Header=BB99_27 Depth=2
	incl	EdgeProfCounters+12528(%rip)
	xorb	%al, %al
.LBB99_30:                              # %land.end
                                        #   in Loop: Header=BB99_27 Depth=2
	cmpb	$1, %al
	je	.LBB99_31
# BB#32:                                # %while.end
                                        #   in Loop: Header=BB99_25 Depth=1
	incl	EdgeProfCounters+12540(%rip)
	movl	200(%rsp), %eax
	cmpl	204(%rsp), %eax
	jle	.LBB99_33
# BB#34:                                # %land.lhs.true
                                        #   in Loop: Header=BB99_25 Depth=1
	incl	EdgeProfCounters+12548(%rip)
	movl	100(%rsp), %eax
	cmpl	160(%rsp), %eax
	je	.LBB99_35
# BB#36:                                # %land.lhs.true48
                                        #   in Loop: Header=BB99_25 Depth=1
	incl	EdgeProfCounters+12556(%rip)
	cmpl	$1, 100(%rsp)
	je	.LBB99_37
# BB#38:                                # %land.lhs.true50
                                        #   in Loop: Header=BB99_25 Depth=1
	incl	EdgeProfCounters+12564(%rip)
	movl	160(%rsp), %eax
	subl	100(%rsp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	andl	$-2, %ecx
	subl	%ecx, %eax
	cmpl	$1, %eax
	jne	.LBB99_39
# BB#40:                                # %if.then53
                                        #   in Loop: Header=BB99_25 Depth=1
	incl	EdgeProfCounters+12572(%rip)
	movslq	200(%rsp), %rax
	movq	224(%rsp), %rcx
	movl	672(%rcx,%rax,4), %eax
	subl	%eax, 88(%rsp)
	decl	200(%rsp)
	incl	EdgeProfCounters+12580(%rip)
	jmp	.LBB99_41
	.align	16, 0x90
.LBB99_33:                              # %while.end.if.end58_crit_edge
                                        #   in Loop: Header=BB99_25 Depth=1
	incl	EdgeProfCounters+12552(%rip)
	jmp	.LBB99_41
	.align	16, 0x90
.LBB99_35:                              # %land.lhs.true.if.end58_crit_edge
                                        #   in Loop: Header=BB99_25 Depth=1
	incl	EdgeProfCounters+12560(%rip)
	jmp	.LBB99_41
.LBB99_37:                              # %land.lhs.true48.if.end58_crit_edge
                                        #   in Loop: Header=BB99_25 Depth=1
	incl	EdgeProfCounters+12568(%rip)
	jmp	.LBB99_41
.LBB99_39:                              # %land.lhs.true50.if.end58_crit_edge
                                        #   in Loop: Header=BB99_25 Depth=1
	incl	EdgeProfCounters+12576(%rip)
	.align	16, 0x90
.LBB99_41:                              # %if.end58
                                        #   in Loop: Header=BB99_25 Depth=1
	movq	224(%rsp), %rax
	cmpl	$2, 656(%rax)
	jle	.LBB99_42
# BB#43:                                # %if.then61
                                        #   in Loop: Header=BB99_25 Depth=1
	incl	EdgeProfCounters+12584(%rip)
	movq	224(%rsp), %rax
	cvtsi2ss	668(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movl	88(%rsp), %r9d
	xorps	%xmm0, %xmm0
	cvtsi2ss	%r9d, %xmm0
	cvtss2sd	%xmm0, %xmm0
	mulsd	.LCPI99_0(%rip), %xmm0
	divsd	%xmm1, %xmm0
	movl	200(%rsp), %r8d
	movl	204(%rsp), %ecx
	movl	100(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str3151, %esi
	movb	$1, %al
	callq	fprintf
	incl	EdgeProfCounters+12592(%rip)
	jmp	.LBB99_44
	.align	16, 0x90
.LBB99_42:                              # %if.end58.if.end68_crit_edge
                                        #   in Loop: Header=BB99_25 Depth=1
	incl	EdgeProfCounters+12588(%rip)
.LBB99_44:                              # %if.end68
                                        #   in Loop: Header=BB99_25 Depth=1
	movl	$0, 220(%rsp)
	incl	EdgeProfCounters+12596(%rip)
	jmp	.LBB99_45
	.align	16, 0x90
.LBB99_51:                              # %for.inc93
                                        #   in Loop: Header=BB99_45 Depth=2
	incl	EdgeProfCounters+12632(%rip)
	incl	220(%rsp)
	incl	EdgeProfCounters+12636(%rip)
.LBB99_45:                              # %for.cond69
                                        #   Parent Loop BB99_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	220(%rsp), %eax
	cmpl	176(%rsp), %eax
	jge	.LBB99_52
# BB#46:                                # %for.body72
                                        #   in Loop: Header=BB99_45 Depth=2
	incl	EdgeProfCounters+12600(%rip)
	movl	220(%rsp), %eax
	cmpl	204(%rsp), %eax
	jl	.LBB99_47
# BB#48:                                # %land.lhs.true75
                                        #   in Loop: Header=BB99_45 Depth=2
	incl	EdgeProfCounters+12608(%rip)
	movl	220(%rsp), %eax
	cmpl	200(%rsp), %eax
	jg	.LBB99_49
# BB#227:                               # %if.then78
                                        #   in Loop: Header=BB99_45 Depth=2
	incl	EdgeProfCounters+12616(%rip)
	movl	100(%rsp), %eax
	decl	%eax
	movslq	%eax, %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	220(%rsp), %rcx
	movb	$0, 37708(%rcx,%rax)
	incl	EdgeProfCounters+12624(%rip)
	jmp	.LBB99_51
	.align	16, 0x90
.LBB99_47:                              # %for.body72.if.else85_crit_edge
                                        #   in Loop: Header=BB99_45 Depth=2
	incl	EdgeProfCounters+12612(%rip)
	jmp	.LBB99_50
	.align	16, 0x90
.LBB99_49:                              # %land.lhs.true75.if.else85_crit_edge
                                        #   in Loop: Header=BB99_45 Depth=2
	incl	EdgeProfCounters+12620(%rip)
.LBB99_50:                              # %if.else85
                                        #   in Loop: Header=BB99_45 Depth=2
	movl	100(%rsp), %eax
	decl	%eax
	movslq	%eax, %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	220(%rsp), %rcx
	movb	$15, 37708(%rcx,%rax)
	incl	EdgeProfCounters+12628(%rip)
	jmp	.LBB99_51
.LBB99_53:                              # %while.end99
	incl	EdgeProfCounters+12516(%rip)
	movl	$0, 184(%rsp)
	incl	EdgeProfCounters+12644(%rip)
	jmp	.LBB99_54
	.align	16, 0x90
.LBB99_113:                             # %for.inc1702
                                        #   in Loop: Header=BB99_54 Depth=1
	incl	EdgeProfCounters+12980(%rip)
	incl	EdgeProfCounters+12992(%rip)
	incl	184(%rsp)
	incl	EdgeProfCounters+12996(%rip)
.LBB99_54:                              # %for.cond100
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_56 Depth 2
                                        #     Child Loop BB99_59 Depth 2
                                        #       Child Loop BB99_61 Depth 3
                                        #     Child Loop BB99_67 Depth 2
                                        #     Child Loop BB99_71 Depth 2
                                        #       Child Loop BB99_76 Depth 3
                                        #       Child Loop BB99_83 Depth 3
                                        #         Child Loop BB99_85 Depth 4
                                        #       Child Loop BB99_90 Depth 3
                                        #       Child Loop BB99_100 Depth 3
                                        #     Child Loop BB99_107 Depth 2
                                        #     Child Loop BB99_111 Depth 2
	cmpl	$3, 184(%rsp)
	jg	.LBB99_114
# BB#55:                                # %for.body103
                                        #   in Loop: Header=BB99_54 Depth=1
	incl	EdgeProfCounters+12648(%rip)
	movl	$0, 216(%rsp)
	incl	EdgeProfCounters+12656(%rip)
	jmp	.LBB99_56
	.align	16, 0x90
.LBB99_57:                              # %for.inc110
                                        #   in Loop: Header=BB99_56 Depth=2
	incl	EdgeProfCounters+12660(%rip)
	movslq	216(%rsp), %rax
	movl	$0, 112(%rsp,%rax,4)
	incl	EdgeProfCounters+12668(%rip)
	incl	216(%rsp)
	incl	EdgeProfCounters+12672(%rip)
.LBB99_56:                              # %for.cond104
                                        #   Parent Loop BB99_54 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jl	.LBB99_57
# BB#58:                                # %for.end112
                                        #   in Loop: Header=BB99_54 Depth=1
	incl	EdgeProfCounters+12664(%rip)
	movl	$0, 216(%rsp)
	incl	EdgeProfCounters+12676(%rip)
	jmp	.LBB99_59
	.align	16, 0x90
.LBB99_63:                              # %for.inc128
                                        #   in Loop: Header=BB99_59 Depth=2
	incl	EdgeProfCounters+12696(%rip)
	incl	EdgeProfCounters+12708(%rip)
	incl	216(%rsp)
	incl	EdgeProfCounters+12712(%rip)
.LBB99_59:                              # %for.cond113
                                        #   Parent Loop BB99_54 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB99_61 Depth 3
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jge	.LBB99_64
# BB#60:                                # %for.body116
                                        #   in Loop: Header=BB99_59 Depth=2
	incl	EdgeProfCounters+12680(%rip)
	movl	$0, 220(%rsp)
	incl	EdgeProfCounters+12688(%rip)
	jmp	.LBB99_61
	.align	16, 0x90
.LBB99_62:                              # %for.inc125
                                        #   in Loop: Header=BB99_61 Depth=3
	incl	EdgeProfCounters+12692(%rip)
	movslq	216(%rsp), %rax
	imulq	$1032, %rax, %rax       # imm = 0x408
	addq	224(%rsp), %rax
	movslq	220(%rsp), %rcx
	movl	$0, 45448(%rax,%rcx,4)
	incl	EdgeProfCounters+12700(%rip)
	incl	220(%rsp)
	incl	EdgeProfCounters+12704(%rip)
.LBB99_61:                              # %for.cond117
                                        #   Parent Loop BB99_54 Depth=1
                                        #     Parent Loop BB99_59 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	220(%rsp), %eax
	cmpl	176(%rsp), %eax
	jge	.LBB99_63
	jmp	.LBB99_62
	.align	16, 0x90
.LBB99_64:                              # %for.end130
                                        #   in Loop: Header=BB99_54 Depth=1
	incl	EdgeProfCounters+12684(%rip)
	cmpl	$6, 160(%rsp)
	jne	.LBB99_65
# BB#66:                                # %if.then133
                                        #   in Loop: Header=BB99_54 Depth=1
	incl	EdgeProfCounters+12716(%rip)
	movl	$0, 220(%rsp)
	incl	EdgeProfCounters+12724(%rip)
	jmp	.LBB99_67
	.align	16, 0x90
.LBB99_68:                              # %for.inc183
                                        #   in Loop: Header=BB99_67 Depth=2
	incl	EdgeProfCounters+12728(%rip)
	movslq	220(%rsp), %rax
	movq	224(%rsp), %rcx
	movzbl	37708(%rcx,%rax), %esi
	movzbl	37966(%rcx,%rax), %edx
	shll	$16, %edx
	orl	%esi, %edx
	shlq	$4, %rax
	movl	%edx, 51640(%rcx,%rax)
	movslq	220(%rsp), %rax
	movq	224(%rsp), %rcx
	movzbl	38224(%rcx,%rax), %esi
	movzbl	38482(%rcx,%rax), %edx
	shll	$16, %edx
	orl	%esi, %edx
	shlq	$4, %rax
	movl	%edx, 51644(%rcx,%rax)
	movslq	220(%rsp), %rax
	movq	224(%rsp), %rcx
	movzbl	38740(%rcx,%rax), %esi
	movzbl	38998(%rcx,%rax), %edx
	shll	$16, %edx
	orl	%esi, %edx
	shlq	$4, %rax
	movl	%edx, 51648(%rcx,%rax)
	incl	EdgeProfCounters+12736(%rip)
	incl	220(%rsp)
	incl	EdgeProfCounters+12740(%rip)
.LBB99_67:                              # %for.cond134
                                        #   Parent Loop BB99_54 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	220(%rsp), %eax
	cmpl	176(%rsp), %eax
	jl	.LBB99_68
# BB#69:                                # %for.end185
                                        #   in Loop: Header=BB99_54 Depth=1
	incl	EdgeProfCounters+12732(%rip)
	incl	EdgeProfCounters+12744(%rip)
	jmp	.LBB99_70
	.align	16, 0x90
.LBB99_65:                              # %for.end130.if.end186_crit_edge
                                        #   in Loop: Header=BB99_54 Depth=1
	incl	EdgeProfCounters+12720(%rip)
.LBB99_70:                              # %if.end186
                                        #   in Loop: Header=BB99_54 Depth=1
	movl	$0, 180(%rsp)
	movl	$0, 196(%rsp)
	movl	$0, 204(%rsp)
	incl	EdgeProfCounters+12748(%rip)
	jmp	.LBB99_71
	.align	16, 0x90
.LBB99_103:                             # %if.end1665
                                        #   in Loop: Header=BB99_71 Depth=2
	movl	200(%rsp), %eax
	incl	%eax
	movl	%eax, 204(%rsp)
	incl	EdgeProfCounters+12936(%rip)
.LBB99_71:                              # %while.body188
                                        #   Parent Loop BB99_54 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB99_76 Depth 3
                                        #       Child Loop BB99_83 Depth 3
                                        #         Child Loop BB99_85 Depth 4
                                        #       Child Loop BB99_90 Depth 3
                                        #       Child Loop BB99_100 Depth 3
	movq	224(%rsp), %rax
	movl	204(%rsp), %ecx
	cmpl	668(%rax), %ecx
	jge	.LBB99_104
# BB#72:                                # %if.end193
                                        #   in Loop: Header=BB99_71 Depth=2
	incl	EdgeProfCounters+12756(%rip)
	movl	204(%rsp), %eax
	addl	$49, %eax
	movl	%eax, 200(%rsp)
	movq	224(%rsp), %rcx
	cmpl	668(%rcx), %eax
	jl	.LBB99_73
# BB#74:                                # %if.then199
                                        #   in Loop: Header=BB99_71 Depth=2
	incl	EdgeProfCounters+12764(%rip)
	movq	224(%rsp), %rax
	movl	668(%rax), %eax
	decl	%eax
	movl	%eax, 200(%rsp)
	incl	EdgeProfCounters+12772(%rip)
	jmp	.LBB99_75
	.align	16, 0x90
.LBB99_73:                              # %if.end193.if.end202_crit_edge
                                        #   in Loop: Header=BB99_71 Depth=2
	incl	EdgeProfCounters+12768(%rip)
.LBB99_75:                              # %if.end202
                                        #   in Loop: Header=BB99_71 Depth=2
	movl	$0, 216(%rsp)
	incl	EdgeProfCounters+12776(%rip)
	jmp	.LBB99_76
	.align	16, 0x90
.LBB99_77:                              # %for.inc209
                                        #   in Loop: Header=BB99_76 Depth=3
	incl	EdgeProfCounters+12780(%rip)
	movslq	216(%rsp), %rax
	movw	$0, 144(%rsp,%rax,2)
	incl	EdgeProfCounters+12788(%rip)
	incl	216(%rsp)
	incl	EdgeProfCounters+12792(%rip)
.LBB99_76:                              # %for.cond203
                                        #   Parent Loop BB99_54 Depth=1
                                        #     Parent Loop BB99_71 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jl	.LBB99_77
# BB#78:                                # %for.end211
                                        #   in Loop: Header=BB99_71 Depth=2
	incl	EdgeProfCounters+12784(%rip)
	cmpl	$6, 160(%rsp)
	jne	.LBB99_79
# BB#80:                                # %land.lhs.true214
                                        #   in Loop: Header=BB99_71 Depth=2
	incl	EdgeProfCounters+12796(%rip)
	movl	200(%rsp), %eax
	subl	204(%rsp), %eax
	cmpl	$49, %eax
	jne	.LBB99_81
# BB#228:                               # %if.then219
                                        #   in Loop: Header=BB99_71 Depth=2
	incl	EdgeProfCounters+12804(%rip)
	movl	$0, 76(%rsp)
	movl	$0, 80(%rsp)
	movl	$0, 84(%rsp)
	movslq	204(%rsp), %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$2, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$3, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$4, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$5, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$6, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$7, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$8, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$9, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$10, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$11, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$12, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$13, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$14, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$15, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$16, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$17, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$18, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$19, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$20, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$21, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$22, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$23, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$24, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$25, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$26, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$27, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$28, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$29, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$30, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$31, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$32, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$33, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$34, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$35, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$36, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$37, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$38, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$39, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$40, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$41, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$42, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$43, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$44, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$45, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$46, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$47, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$48, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movl	204(%rsp), %eax
	addl	$49, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 74(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51640(%rcx,%rax), %eax
	addl	%eax, 84(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51644(%rcx,%rax), %eax
	addl	%eax, 80(%rsp)
	movzwl	74(%rsp), %eax
	shlq	$4, %rax
	movq	224(%rsp), %rcx
	movl	51648(%rcx,%rax), %eax
	addl	%eax, 76(%rsp)
	movw	84(%rsp), %ax
	movw	%ax, 144(%rsp)
	movw	86(%rsp), %ax
	movw	%ax, 146(%rsp)
	movw	80(%rsp), %ax
	movw	%ax, 148(%rsp)
	movw	82(%rsp), %ax
	movw	%ax, 150(%rsp)
	movw	76(%rsp), %ax
	movw	%ax, 152(%rsp)
	movw	78(%rsp), %ax
	movw	%ax, 154(%rsp)
	incl	EdgeProfCounters+12812(%rip)
	jmp	.LBB99_89
	.align	16, 0x90
.LBB99_79:                              # %for.end211.if.else1136_crit_edge
                                        #   in Loop: Header=BB99_71 Depth=2
	incl	EdgeProfCounters+12800(%rip)
	jmp	.LBB99_82
	.align	16, 0x90
.LBB99_81:                              # %land.lhs.true214.if.else1136_crit_edge
                                        #   in Loop: Header=BB99_71 Depth=2
	incl	EdgeProfCounters+12808(%rip)
.LBB99_82:                              # %if.else1136
                                        #   in Loop: Header=BB99_71 Depth=2
	movl	204(%rsp), %eax
	movl	%eax, 212(%rsp)
	incl	EdgeProfCounters+12816(%rip)
	jmp	.LBB99_83
	.align	16, 0x90
.LBB99_87:                              # %for.inc1162
                                        #   in Loop: Header=BB99_83 Depth=3
	incl	EdgeProfCounters+12836(%rip)
	incl	EdgeProfCounters+12848(%rip)
	incl	212(%rsp)
	incl	EdgeProfCounters+12852(%rip)
.LBB99_83:                              # %for.cond1137
                                        #   Parent Loop BB99_54 Depth=1
                                        #     Parent Loop BB99_71 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB99_85 Depth 4
	movl	212(%rsp), %eax
	cmpl	200(%rsp), %eax
	jg	.LBB99_88
# BB#84:                                # %for.body1140
                                        #   in Loop: Header=BB99_83 Depth=3
	incl	EdgeProfCounters+12820(%rip)
	movslq	212(%rsp), %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 72(%rsp)
	movl	$0, 216(%rsp)
	incl	EdgeProfCounters+12828(%rip)
	jmp	.LBB99_85
	.align	16, 0x90
.LBB99_86:                              # %for.inc1159
                                        #   in Loop: Header=BB99_85 Depth=4
	incl	EdgeProfCounters+12832(%rip)
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rcx        # imm = 0x102
	addq	224(%rsp), %rcx
	movzwl	72(%rsp), %edx
	movzbl	37708(%rdx,%rcx), %edx
	movzwl	144(%rsp,%rax,2), %ecx
	addl	%edx, %ecx
	movw	%cx, 144(%rsp,%rax,2)
	incl	EdgeProfCounters+12840(%rip)
	incl	216(%rsp)
	incl	EdgeProfCounters+12844(%rip)
.LBB99_85:                              # %for.cond1144
                                        #   Parent Loop BB99_54 Depth=1
                                        #     Parent Loop BB99_71 Depth=2
                                        #       Parent Loop BB99_83 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jge	.LBB99_87
	jmp	.LBB99_86
	.align	16, 0x90
.LBB99_88:                              # %for.end1164
                                        #   in Loop: Header=BB99_71 Depth=2
	incl	EdgeProfCounters+12824(%rip)
	incl	EdgeProfCounters+12856(%rip)
.LBB99_89:                              # %if.end1165
                                        #   in Loop: Header=BB99_71 Depth=2
	movl	$999999999, 188(%rsp)   # imm = 0x3B9AC9FF
	movl	$-1, 192(%rsp)
	movl	$0, 216(%rsp)
	incl	EdgeProfCounters+12860(%rip)
	jmp	.LBB99_90
	.align	16, 0x90
.LBB99_94:                              # %for.inc1180
                                        #   in Loop: Header=BB99_90 Depth=3
	incl	EdgeProfCounters+12884(%rip)
	incl	216(%rsp)
	incl	EdgeProfCounters+12888(%rip)
.LBB99_90:                              # %for.cond1166
                                        #   Parent Loop BB99_54 Depth=1
                                        #     Parent Loop BB99_71 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jge	.LBB99_95
# BB#91:                                # %for.body1169
                                        #   in Loop: Header=BB99_90 Depth=3
	incl	EdgeProfCounters+12864(%rip)
	movslq	216(%rsp), %rax
	movzwl	144(%rsp,%rax,2), %eax
	cmpl	188(%rsp), %eax
	jge	.LBB99_92
# BB#93:                                # %if.then1175
                                        #   in Loop: Header=BB99_90 Depth=3
	incl	EdgeProfCounters+12872(%rip)
	movslq	216(%rsp), %rax
	movzwl	144(%rsp,%rax,2), %eax
	movl	%eax, 188(%rsp)
	movl	216(%rsp), %eax
	movl	%eax, 192(%rsp)
	incl	EdgeProfCounters+12880(%rip)
	jmp	.LBB99_94
	.align	16, 0x90
.LBB99_92:                              # %for.body1169.if.end1179_crit_edge
                                        #   in Loop: Header=BB99_90 Depth=3
	incl	EdgeProfCounters+12876(%rip)
	jmp	.LBB99_94
	.align	16, 0x90
.LBB99_95:                              # %for.end1182
                                        #   in Loop: Header=BB99_71 Depth=2
	incl	EdgeProfCounters+12868(%rip)
	movl	188(%rsp), %eax
	addl	%eax, 196(%rsp)
	movslq	192(%rsp), %rax
	incl	112(%rsp,%rax,4)
	movq	224(%rsp), %rax
	movslq	180(%rsp), %rcx
	movb	192(%rsp), %dl
	movb	%dl, 1704(%rax,%rcx)
	incl	180(%rsp)
	cmpl	$6, 160(%rsp)
	jne	.LBB99_96
# BB#97:                                # %land.lhs.true1193
                                        #   in Loop: Header=BB99_71 Depth=2
	incl	EdgeProfCounters+12892(%rip)
	movl	200(%rsp), %eax
	subl	204(%rsp), %eax
	cmpl	$49, %eax
	jne	.LBB99_98
# BB#229:                               # %if.then1198
                                        #   in Loop: Header=BB99_71 Depth=2
	incl	EdgeProfCounters+12900(%rip)
	movslq	204(%rsp), %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$2, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$3, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$4, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$5, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$6, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$7, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$8, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$9, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$10, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$11, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$12, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$13, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$14, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$15, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$16, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$17, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$18, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$19, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$20, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$21, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$22, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$23, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$24, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$25, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$26, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$27, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$28, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$29, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$30, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$31, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$32, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$33, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$34, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$35, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$36, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$37, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$38, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$39, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$40, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$41, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$42, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$43, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$44, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$45, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$46, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$47, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$48, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	movl	204(%rsp), %eax
	addl	$49, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	incl	EdgeProfCounters+12908(%rip)
	jmp	.LBB99_103
	.align	16, 0x90
.LBB99_96:                              # %for.end1182.if.else1649_crit_edge
                                        #   in Loop: Header=BB99_71 Depth=2
	incl	EdgeProfCounters+12896(%rip)
	jmp	.LBB99_99
	.align	16, 0x90
.LBB99_98:                              # %land.lhs.true1193.if.else1649_crit_edge
                                        #   in Loop: Header=BB99_71 Depth=2
	incl	EdgeProfCounters+12904(%rip)
.LBB99_99:                              # %if.else1649
                                        #   in Loop: Header=BB99_71 Depth=2
	movl	204(%rsp), %eax
	movl	%eax, 212(%rsp)
	incl	EdgeProfCounters+12912(%rip)
	jmp	.LBB99_100
	.align	16, 0x90
.LBB99_101:                             # %for.inc1662
                                        #   in Loop: Header=BB99_100 Depth=3
	incl	EdgeProfCounters+12916(%rip)
	movslq	212(%rsp), %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	incl	EdgeProfCounters+12924(%rip)
	incl	212(%rsp)
	incl	EdgeProfCounters+12928(%rip)
.LBB99_100:                             # %for.cond1650
                                        #   Parent Loop BB99_54 Depth=1
                                        #     Parent Loop BB99_71 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	212(%rsp), %eax
	cmpl	200(%rsp), %eax
	jle	.LBB99_101
# BB#102:                               # %for.end1664
                                        #   in Loop: Header=BB99_71 Depth=2
	incl	EdgeProfCounters+12920(%rip)
	incl	EdgeProfCounters+12932(%rip)
	jmp	.LBB99_103
	.align	16, 0x90
.LBB99_104:                             # %while.end1667
                                        #   in Loop: Header=BB99_54 Depth=1
	incl	EdgeProfCounters+12752(%rip)
	incl	EdgeProfCounters+12760(%rip)
	movq	224(%rsp), %rax
	cmpl	$2, 656(%rax)
	jle	.LBB99_105
# BB#106:                               # %if.then1671
                                        #   in Loop: Header=BB99_54 Depth=1
	incl	EdgeProfCounters+12940(%rip)
	movl	196(%rsp), %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	shrl	$29, %ecx
	addl	%eax, %ecx
	sarl	$3, %ecx
	movq	stderr(%rip), %rdi
	movl	184(%rsp), %edx
	incl	%edx
	movl	$.L.str4152, %esi
	xorb	%al, %al
	callq	fprintf
	movl	$0, 216(%rsp)
	incl	EdgeProfCounters+12948(%rip)
	jmp	.LBB99_107
	.align	16, 0x90
.LBB99_108:                             # %for.inc1682
                                        #   in Loop: Header=BB99_107 Depth=2
	incl	EdgeProfCounters+12952(%rip)
	movslq	216(%rsp), %rax
	movl	112(%rsp,%rax,4), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str5153, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+12960(%rip)
	incl	216(%rsp)
	incl	EdgeProfCounters+12964(%rip)
.LBB99_107:                             # %for.cond1675
                                        #   Parent Loop BB99_54 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jl	.LBB99_108
# BB#109:                               # %for.end1684
                                        #   in Loop: Header=BB99_54 Depth=1
	incl	EdgeProfCounters+12956(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str6154, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+12968(%rip)
	jmp	.LBB99_110
	.align	16, 0x90
.LBB99_105:                             # %while.end1667.if.end1686_crit_edge
                                        #   in Loop: Header=BB99_54 Depth=1
	incl	EdgeProfCounters+12944(%rip)
.LBB99_110:                             # %if.end1686
                                        #   in Loop: Header=BB99_54 Depth=1
	movl	$0, 216(%rsp)
	incl	EdgeProfCounters+12972(%rip)
	jmp	.LBB99_111
	.align	16, 0x90
.LBB99_112:                             # %for.inc1699
                                        #   in Loop: Header=BB99_111 Depth=2
	incl	EdgeProfCounters+12976(%rip)
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rdx        # imm = 0x102
	movq	224(%rsp), %rcx
	leaq	37708(%rcx,%rdx), %rdi
	imulq	$1032, %rax, %rax       # imm = 0x408
	leaq	45448(%rcx,%rax), %rsi
	movl	176(%rsp), %edx
	movl	$17, %ecx
	callq	BZ2_hbMakeCodeLengths
	incl	EdgeProfCounters+12984(%rip)
	incl	216(%rsp)
	incl	EdgeProfCounters+12988(%rip)
.LBB99_111:                             # %for.cond1687
                                        #   Parent Loop BB99_54 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jge	.LBB99_113
	jmp	.LBB99_112
.LBB99_114:                             # %for.end1704
	incl	EdgeProfCounters+12652(%rip)
	cmpl	$7, 160(%rsp)
	jg	.LBB99_116
# BB#115:                               # %for.end1704.if.end1708_crit_edge
	incl	EdgeProfCounters+13000(%rip)
	jmp	.LBB99_117
.LBB99_116:                             # %if.then1707
	incl	EdgeProfCounters+13004(%rip)
	movl	$3002, %edi             # imm = 0xBBA
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+13008(%rip)
.LBB99_117:                             # %if.end1708
	cmpl	$32768, 180(%rsp)       # imm = 0x8000
	jge	.LBB99_118
# BB#119:                               # %land.lhs.true1711
	incl	EdgeProfCounters+13012(%rip)
	cmpl	$18003, 180(%rsp)       # imm = 0x4653
	jge	.LBB99_120
# BB#230:                               # %land.lhs.true1711.if.end1715_crit_edge
	incl	EdgeProfCounters+13020(%rip)
	jmp	.LBB99_122
.LBB99_118:                             # %if.end1708.if.then1714_crit_edge
	incl	EdgeProfCounters+13016(%rip)
	jmp	.LBB99_121
.LBB99_120:                             # %land.lhs.true1711.if.then1714_crit_edge
	incl	EdgeProfCounters+13024(%rip)
.LBB99_121:                             # %if.then1714
	movl	$3003, %edi             # imm = 0xBBB
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+13028(%rip)
.LBB99_122:                             # %if.end1715
	movl	$0, 212(%rsp)
	incl	EdgeProfCounters+13032(%rip)
	jmp	.LBB99_123
	.align	16, 0x90
.LBB99_124:                             # %for.inc1723
                                        #   in Loop: Header=BB99_123 Depth=1
	incl	EdgeProfCounters+13036(%rip)
	movslq	212(%rsp), %rax
	movb	%al, 66(%rsp,%rax)
	incl	EdgeProfCounters+13044(%rip)
	incl	212(%rsp)
	incl	EdgeProfCounters+13048(%rip)
.LBB99_123:                             # %for.cond1716
                                        # =>This Inner Loop Header: Depth=1
	movl	212(%rsp), %eax
	cmpl	160(%rsp), %eax
	jl	.LBB99_124
# BB#125:                               # %for.end1725
	incl	EdgeProfCounters+13040(%rip)
	movl	$0, 212(%rsp)
	incl	EdgeProfCounters+13052(%rip)
	jmp	.LBB99_126
	.align	16, 0x90
.LBB99_130:                             # %for.inc1751
                                        #   in Loop: Header=BB99_126 Depth=1
	incl	EdgeProfCounters+13072(%rip)
	movb	63(%rsp), %al
	movb	%al, 66(%rsp)
	movq	224(%rsp), %rax
	movslq	212(%rsp), %rcx
	movb	208(%rsp), %dl
	movb	%dl, 19706(%rax,%rcx)
	incl	EdgeProfCounters+13080(%rip)
	incl	212(%rsp)
	incl	EdgeProfCounters+13084(%rip)
.LBB99_126:                             # %for.cond1726
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_128 Depth 2
	movl	212(%rsp), %eax
	cmpl	180(%rsp), %eax
	jge	.LBB99_131
# BB#127:                               # %for.body1729
                                        #   in Loop: Header=BB99_126 Depth=1
	incl	EdgeProfCounters+13056(%rip)
	movslq	212(%rsp), %rax
	movq	224(%rsp), %rcx
	movb	1704(%rcx,%rax), %al
	movb	%al, 65(%rsp)
	movl	$0, 208(%rsp)
	movslq	208(%rsp), %rax
	movb	66(%rsp,%rax), %al
	movb	%al, 63(%rsp)
	incl	EdgeProfCounters+13064(%rip)
	jmp	.LBB99_128
	.align	16, 0x90
.LBB99_129:                             # %while.body1740
                                        #   in Loop: Header=BB99_128 Depth=2
	incl	EdgeProfCounters+13068(%rip)
	incl	208(%rsp)
	movb	63(%rsp), %al
	movb	%al, 64(%rsp)
	movslq	208(%rsp), %rax
	movb	66(%rsp,%rax), %al
	movb	%al, 63(%rsp)
	movslq	208(%rsp), %rax
	movb	64(%rsp), %cl
	movb	%cl, 66(%rsp,%rax)
	incl	EdgeProfCounters+13076(%rip)
.LBB99_128:                             # %while.cond1735
                                        #   Parent Loop BB99_126 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	63(%rsp), %eax
	movzbl	65(%rsp), %ecx
	cmpl	%eax, %ecx
	je	.LBB99_130
	jmp	.LBB99_129
.LBB99_131:                             # %for.end1753
	incl	EdgeProfCounters+13060(%rip)
	movl	$0, 216(%rsp)
	incl	EdgeProfCounters+13088(%rip)
	jmp	.LBB99_132
	.align	16, 0x90
.LBB99_148:                             # %for.inc1812
                                        #   in Loop: Header=BB99_132 Depth=1
	movslq	216(%rsp), %rax
	imulq	$1032, %rax, %rdx       # imm = 0x408
	movq	224(%rsp), %rcx
	leaq	39256(%rcx,%rdx), %rdi
	imulq	$258, %rax, %rax        # imm = 0x102
	leaq	37708(%rcx,%rax), %rsi
	movl	176(%rsp), %r8d
	movl	168(%rsp), %ecx
	movl	172(%rsp), %edx
	callq	BZ2_hbAssignCodes
	incl	EdgeProfCounters+13168(%rip)
	incl	216(%rsp)
	incl	EdgeProfCounters+13172(%rip)
.LBB99_132:                             # %for.cond1754
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_134 Depth 2
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jge	.LBB99_149
# BB#133:                               # %for.body1757
                                        #   in Loop: Header=BB99_132 Depth=1
	incl	EdgeProfCounters+13092(%rip)
	movl	$32, 172(%rsp)
	movl	$0, 168(%rsp)
	movl	$0, 212(%rsp)
	incl	EdgeProfCounters+13100(%rip)
	jmp	.LBB99_134
	.align	16, 0x90
.LBB99_141:                             # %for.inc1794
                                        #   in Loop: Header=BB99_134 Depth=2
	incl	EdgeProfCounters+13136(%rip)
	incl	212(%rsp)
	incl	EdgeProfCounters+13140(%rip)
.LBB99_134:                             # %for.cond1758
                                        #   Parent Loop BB99_132 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	212(%rsp), %eax
	cmpl	176(%rsp), %eax
	jge	.LBB99_142
# BB#135:                               # %for.body1761
                                        #   in Loop: Header=BB99_134 Depth=2
	incl	EdgeProfCounters+13104(%rip)
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	212(%rsp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	cmpl	168(%rsp), %eax
	jle	.LBB99_136
# BB#137:                               # %if.then1770
                                        #   in Loop: Header=BB99_134 Depth=2
	incl	EdgeProfCounters+13112(%rip)
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	212(%rsp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	movl	%eax, 168(%rsp)
	incl	EdgeProfCounters+13120(%rip)
	jmp	.LBB99_138
	.align	16, 0x90
.LBB99_136:                             # %for.body1761.if.end1777_crit_edge
                                        #   in Loop: Header=BB99_134 Depth=2
	incl	EdgeProfCounters+13116(%rip)
.LBB99_138:                             # %if.end1777
                                        #   in Loop: Header=BB99_134 Depth=2
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	212(%rsp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	cmpl	172(%rsp), %eax
	jge	.LBB99_139
# BB#140:                               # %if.then1786
                                        #   in Loop: Header=BB99_134 Depth=2
	incl	EdgeProfCounters+13124(%rip)
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	212(%rsp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	movl	%eax, 172(%rsp)
	incl	EdgeProfCounters+13132(%rip)
	jmp	.LBB99_141
	.align	16, 0x90
.LBB99_139:                             # %if.end1777.if.end1793_crit_edge
                                        #   in Loop: Header=BB99_134 Depth=2
	incl	EdgeProfCounters+13128(%rip)
	jmp	.LBB99_141
	.align	16, 0x90
.LBB99_142:                             # %for.end1796
                                        #   in Loop: Header=BB99_132 Depth=1
	incl	EdgeProfCounters+13108(%rip)
	cmpl	$17, 168(%rsp)
	jle	.LBB99_143
# BB#144:                               # %if.then1799
                                        #   in Loop: Header=BB99_132 Depth=1
	incl	EdgeProfCounters+13144(%rip)
	movl	$3004, %edi             # imm = 0xBBC
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+13152(%rip)
	jmp	.LBB99_145
	.align	16, 0x90
.LBB99_143:                             # %for.end1796.if.end1800_crit_edge
                                        #   in Loop: Header=BB99_132 Depth=1
	incl	EdgeProfCounters+13148(%rip)
.LBB99_145:                             # %if.end1800
                                        #   in Loop: Header=BB99_132 Depth=1
	cmpl	$0, 172(%rsp)
	jg	.LBB99_146
# BB#147:                               # %if.then1803
                                        #   in Loop: Header=BB99_132 Depth=1
	incl	EdgeProfCounters+13156(%rip)
	movl	$3005, %edi             # imm = 0xBBD
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+13164(%rip)
	jmp	.LBB99_148
	.align	16, 0x90
.LBB99_146:                             # %if.end1800.if.end1804_crit_edge
                                        #   in Loop: Header=BB99_132 Depth=1
	incl	EdgeProfCounters+13160(%rip)
	jmp	.LBB99_148
.LBB99_149:                             # %for.end1814
	incl	EdgeProfCounters+13096(%rip)
	movl	$0, 212(%rsp)
	incl	EdgeProfCounters+13176(%rip)
	jmp	.LBB99_150
	.align	16, 0x90
.LBB99_157:                             # %for.inc1837
                                        #   in Loop: Header=BB99_150 Depth=1
	incl	EdgeProfCounters+13196(%rip)
	incl	EdgeProfCounters+13220(%rip)
	incl	212(%rsp)
	incl	EdgeProfCounters+13224(%rip)
.LBB99_150:                             # %for.cond1816
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_152 Depth 2
	cmpl	$15, 212(%rsp)
	jg	.LBB99_158
# BB#151:                               # %for.body1819
                                        #   in Loop: Header=BB99_150 Depth=1
	incl	EdgeProfCounters+13180(%rip)
	movslq	212(%rsp), %rax
	movb	$0, 32(%rsp,%rax)
	movl	$0, 208(%rsp)
	incl	EdgeProfCounters+13188(%rip)
	jmp	.LBB99_152
	.align	16, 0x90
.LBB99_156:                             # %for.inc1834
                                        #   in Loop: Header=BB99_152 Depth=2
	incl	EdgeProfCounters+13212(%rip)
	incl	208(%rsp)
	incl	EdgeProfCounters+13216(%rip)
.LBB99_152:                             # %for.cond1822
                                        #   Parent Loop BB99_150 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$15, 208(%rsp)
	jg	.LBB99_157
# BB#153:                               # %for.body1825
                                        #   in Loop: Header=BB99_152 Depth=2
	incl	EdgeProfCounters+13192(%rip)
	movl	212(%rsp), %eax
	shll	$4, %eax
	addl	208(%rsp), %eax
	movslq	%eax, %rax
	movq	224(%rsp), %rcx
	cmpb	$0, 128(%rcx,%rax)
	je	.LBB99_154
# BB#155:                               # %if.then1830
                                        #   in Loop: Header=BB99_152 Depth=2
	incl	EdgeProfCounters+13200(%rip)
	movslq	212(%rsp), %rax
	movb	$1, 32(%rsp,%rax)
	incl	EdgeProfCounters+13208(%rip)
	jmp	.LBB99_156
	.align	16, 0x90
.LBB99_154:                             # %for.body1825.if.end1833_crit_edge
                                        #   in Loop: Header=BB99_152 Depth=2
	incl	EdgeProfCounters+13204(%rip)
	jmp	.LBB99_156
.LBB99_158:                             # %for.end1839
	incl	EdgeProfCounters+13184(%rip)
	movq	224(%rsp), %rax
	movl	116(%rax), %eax
	movl	%eax, 156(%rsp)
	movl	$0, 212(%rsp)
	incl	EdgeProfCounters+13228(%rip)
	jmp	.LBB99_159
	.align	16, 0x90
.LBB99_163:                             # %for.inc1850
                                        #   in Loop: Header=BB99_159 Depth=1
	incl	EdgeProfCounters+13256(%rip)
	incl	212(%rsp)
	incl	EdgeProfCounters+13260(%rip)
.LBB99_159:                             # %for.cond1840
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$15, 212(%rsp)
	jg	.LBB99_164
# BB#160:                               # %for.body1843
                                        #   in Loop: Header=BB99_159 Depth=1
	incl	EdgeProfCounters+13232(%rip)
	movslq	212(%rsp), %rax
	cmpb	$0, 32(%rsp,%rax)
	je	.LBB99_162
# BB#161:                               # %if.then1847
                                        #   in Loop: Header=BB99_159 Depth=1
	incl	EdgeProfCounters+13240(%rip)
	movq	224(%rsp), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	bsW
	incl	EdgeProfCounters+13248(%rip)
	jmp	.LBB99_163
	.align	16, 0x90
.LBB99_162:                             # %if.else1848
                                        #   in Loop: Header=BB99_159 Depth=1
	incl	EdgeProfCounters+13244(%rip)
	movq	224(%rsp), %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	bsW
	incl	EdgeProfCounters+13252(%rip)
	jmp	.LBB99_163
.LBB99_164:                             # %for.end1852
	incl	EdgeProfCounters+13236(%rip)
	movl	$0, 212(%rsp)
	incl	EdgeProfCounters+13264(%rip)
	jmp	.LBB99_165
	.align	16, 0x90
.LBB99_175:                             # %for.inc1878
                                        #   in Loop: Header=BB99_165 Depth=1
	incl	EdgeProfCounters+13324(%rip)
	incl	212(%rsp)
	incl	EdgeProfCounters+13328(%rip)
.LBB99_165:                             # %for.cond1853
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_169 Depth 2
	cmpl	$15, 212(%rsp)
	jg	.LBB99_176
# BB#166:                               # %for.body1856
                                        #   in Loop: Header=BB99_165 Depth=1
	incl	EdgeProfCounters+13268(%rip)
	movslq	212(%rsp), %rax
	cmpb	$0, 32(%rsp,%rax)
	je	.LBB99_167
# BB#168:                               # %if.then1860
                                        #   in Loop: Header=BB99_165 Depth=1
	incl	EdgeProfCounters+13276(%rip)
	movl	$0, 208(%rsp)
	incl	EdgeProfCounters+13284(%rip)
	jmp	.LBB99_169
	.align	16, 0x90
.LBB99_173:                             # %for.inc1874
                                        #   in Loop: Header=BB99_169 Depth=2
	incl	EdgeProfCounters+13312(%rip)
	incl	208(%rsp)
	incl	EdgeProfCounters+13316(%rip)
.LBB99_169:                             # %for.cond1861
                                        #   Parent Loop BB99_165 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$15, 208(%rsp)
	jg	.LBB99_174
# BB#170:                               # %for.body1864
                                        #   in Loop: Header=BB99_169 Depth=2
	incl	EdgeProfCounters+13288(%rip)
	movl	212(%rsp), %eax
	shll	$4, %eax
	addl	208(%rsp), %eax
	movslq	%eax, %rax
	movq	224(%rsp), %rcx
	cmpb	$0, 128(%rcx,%rax)
	je	.LBB99_172
# BB#171:                               # %if.then1871
                                        #   in Loop: Header=BB99_169 Depth=2
	incl	EdgeProfCounters+13296(%rip)
	movq	224(%rsp), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	bsW
	incl	EdgeProfCounters+13304(%rip)
	jmp	.LBB99_173
	.align	16, 0x90
.LBB99_172:                             # %if.else1872
                                        #   in Loop: Header=BB99_169 Depth=2
	incl	EdgeProfCounters+13300(%rip)
	movq	224(%rsp), %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	bsW
	incl	EdgeProfCounters+13308(%rip)
	jmp	.LBB99_173
	.align	16, 0x90
.LBB99_167:                             # %for.body1856.if.end1877_crit_edge
                                        #   in Loop: Header=BB99_165 Depth=1
	incl	EdgeProfCounters+13280(%rip)
	jmp	.LBB99_175
	.align	16, 0x90
.LBB99_174:                             # %for.end1876
                                        #   in Loop: Header=BB99_165 Depth=1
	incl	EdgeProfCounters+13292(%rip)
	incl	EdgeProfCounters+13320(%rip)
	jmp	.LBB99_175
.LBB99_176:                             # %for.end1880
	incl	EdgeProfCounters+13272(%rip)
	movq	224(%rsp), %rax
	cmpl	$2, 656(%rax)
	jle	.LBB99_177
# BB#178:                               # %if.then1884
	incl	EdgeProfCounters+13332(%rip)
	movq	224(%rsp), %rax
	movl	116(%rax), %edx
	subl	156(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str7155, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+13340(%rip)
	jmp	.LBB99_179
.LBB99_177:                             # %for.end1880.if.end1888_crit_edge
	incl	EdgeProfCounters+13336(%rip)
.LBB99_179:                             # %if.end1888
	movq	224(%rsp), %rax
	movl	116(%rax), %eax
	movl	%eax, 156(%rsp)
	movl	160(%rsp), %edx
	movq	224(%rsp), %rdi
	movl	$3, %esi
	callq	bsW
	movl	180(%rsp), %edx
	movq	224(%rsp), %rdi
	movl	$15, %esi
	callq	bsW
	movl	$0, 212(%rsp)
	incl	EdgeProfCounters+13344(%rip)
	jmp	.LBB99_180
	.align	16, 0x90
.LBB99_184:                             # %for.inc1905
                                        #   in Loop: Header=BB99_180 Depth=1
	incl	EdgeProfCounters+13364(%rip)
	movq	224(%rsp), %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	bsW
	incl	EdgeProfCounters+13376(%rip)
	incl	212(%rsp)
	incl	EdgeProfCounters+13380(%rip)
.LBB99_180:                             # %for.cond1890
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_182 Depth 2
	movl	212(%rsp), %eax
	cmpl	180(%rsp), %eax
	jge	.LBB99_185
# BB#181:                               # %for.body1893
                                        #   in Loop: Header=BB99_180 Depth=1
	incl	EdgeProfCounters+13348(%rip)
	movl	$0, 208(%rsp)
	incl	EdgeProfCounters+13356(%rip)
	jmp	.LBB99_182
	.align	16, 0x90
.LBB99_183:                             # %for.inc1902
                                        #   in Loop: Header=BB99_182 Depth=2
	incl	EdgeProfCounters+13360(%rip)
	movq	224(%rsp), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	bsW
	incl	EdgeProfCounters+13368(%rip)
	incl	208(%rsp)
	incl	EdgeProfCounters+13372(%rip)
.LBB99_182:                             # %for.cond1894
                                        #   Parent Loop BB99_180 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	212(%rsp), %rax
	movq	224(%rsp), %rcx
	movzbl	19706(%rcx,%rax), %eax
	cmpl	%eax, 208(%rsp)
	jge	.LBB99_184
	jmp	.LBB99_183
.LBB99_185:                             # %for.end1907
	incl	EdgeProfCounters+13352(%rip)
	movq	224(%rsp), %rax
	cmpl	$2, 656(%rax)
	jle	.LBB99_186
# BB#187:                               # %if.then1911
	incl	EdgeProfCounters+13384(%rip)
	movq	224(%rsp), %rax
	movl	116(%rax), %edx
	subl	156(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str8156, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+13392(%rip)
	jmp	.LBB99_188
.LBB99_186:                             # %for.end1907.if.end1915_crit_edge
	incl	EdgeProfCounters+13388(%rip)
.LBB99_188:                             # %if.end1915
	movq	224(%rsp), %rax
	movl	116(%rax), %eax
	movl	%eax, 156(%rsp)
	movl	$0, 216(%rsp)
	incl	EdgeProfCounters+13396(%rip)
	jmp	.LBB99_189
	.align	16, 0x90
.LBB99_199:                             # %for.inc1958
                                        #   in Loop: Header=BB99_189 Depth=1
	incl	EdgeProfCounters+13416(%rip)
	incl	EdgeProfCounters+13460(%rip)
	incl	216(%rsp)
	incl	EdgeProfCounters+13464(%rip)
.LBB99_189:                             # %for.cond1917
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_191 Depth 2
                                        #       Child Loop BB99_193 Depth 3
                                        #       Child Loop BB99_196 Depth 3
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jge	.LBB99_200
# BB#190:                               # %for.body1920
                                        #   in Loop: Header=BB99_189 Depth=1
	incl	EdgeProfCounters+13400(%rip)
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	movq	224(%rsp), %rcx
	movzbl	37708(%rcx,%rax), %edx
	movl	%edx, 28(%rsp)
	movq	224(%rsp), %rdi
	movl	$5, %esi
	callq	bsW
	movl	$0, 212(%rsp)
	incl	EdgeProfCounters+13408(%rip)
	jmp	.LBB99_191
	.align	16, 0x90
.LBB99_198:                             # %for.inc1955
                                        #   in Loop: Header=BB99_191 Depth=2
	incl	EdgeProfCounters+13444(%rip)
	movq	224(%rsp), %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	bsW
	incl	EdgeProfCounters+13452(%rip)
	incl	212(%rsp)
	incl	EdgeProfCounters+13456(%rip)
.LBB99_191:                             # %for.cond1927
                                        #   Parent Loop BB99_189 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB99_193 Depth 3
                                        #       Child Loop BB99_196 Depth 3
	movl	212(%rsp), %eax
	cmpl	176(%rsp), %eax
	jge	.LBB99_199
# BB#192:                               # %for.body1930
                                        #   in Loop: Header=BB99_191 Depth=2
	incl	EdgeProfCounters+13412(%rip)
	incl	EdgeProfCounters+13420(%rip)
	jmp	.LBB99_193
	.align	16, 0x90
.LBB99_194:                             # %while.body1940
                                        #   in Loop: Header=BB99_193 Depth=3
	incl	EdgeProfCounters+13424(%rip)
	movq	224(%rsp), %rdi
	movl	$2, %esi
	movl	$2, %edx
	callq	bsW
	incl	28(%rsp)
	incl	EdgeProfCounters+13432(%rip)
.LBB99_193:                             # %while.cond1931
                                        #   Parent Loop BB99_189 Depth=1
                                        #     Parent Loop BB99_191 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	212(%rsp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	cmpl	%eax, 28(%rsp)
	jl	.LBB99_194
# BB#195:                               # %while.end1942
                                        #   in Loop: Header=BB99_191 Depth=2
	incl	EdgeProfCounters+13428(%rip)
	incl	EdgeProfCounters+13436(%rip)
	jmp	.LBB99_196
	.align	16, 0x90
.LBB99_197:                             # %while.body1952
                                        #   in Loop: Header=BB99_196 Depth=3
	incl	EdgeProfCounters+13440(%rip)
	movq	224(%rsp), %rdi
	movl	$2, %esi
	movl	$3, %edx
	callq	bsW
	decl	28(%rsp)
	incl	EdgeProfCounters+13448(%rip)
.LBB99_196:                             # %while.cond1943
                                        #   Parent Loop BB99_189 Depth=1
                                        #     Parent Loop BB99_191 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	212(%rsp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	cmpl	%eax, 28(%rsp)
	jle	.LBB99_198
	jmp	.LBB99_197
.LBB99_200:                             # %for.end1960
	incl	EdgeProfCounters+13404(%rip)
	movq	224(%rsp), %rax
	cmpl	$2, 656(%rax)
	jle	.LBB99_201
# BB#202:                               # %if.then1964
	incl	EdgeProfCounters+13468(%rip)
	movq	224(%rsp), %rax
	movl	116(%rax), %edx
	subl	156(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str9157, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+13476(%rip)
	jmp	.LBB99_203
.LBB99_201:                             # %for.end1960.if.end1968_crit_edge
	incl	EdgeProfCounters+13472(%rip)
.LBB99_203:                             # %if.end1968
	movq	224(%rsp), %rax
	movl	116(%rax), %eax
	movl	%eax, 156(%rsp)
	movl	$0, 164(%rsp)
	movl	$0, 204(%rsp)
	incl	EdgeProfCounters+13480(%rip)
	jmp	.LBB99_204
	.align	16, 0x90
.LBB99_219:                             # %if.end2448
                                        #   in Loop: Header=BB99_204 Depth=1
	movl	200(%rsp), %eax
	incl	%eax
	movl	%eax, 204(%rsp)
	incl	164(%rsp)
	incl	EdgeProfCounters+13564(%rip)
.LBB99_204:                             # %while.body1971
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_216 Depth 2
	movq	224(%rsp), %rax
	movl	204(%rsp), %ecx
	cmpl	668(%rax), %ecx
	jge	.LBB99_220
# BB#205:                               # %if.end1976
                                        #   in Loop: Header=BB99_204 Depth=1
	incl	EdgeProfCounters+13488(%rip)
	movl	204(%rsp), %eax
	addl	$49, %eax
	movl	%eax, 200(%rsp)
	movq	224(%rsp), %rcx
	cmpl	668(%rcx), %eax
	jl	.LBB99_206
# BB#207:                               # %if.then1982
                                        #   in Loop: Header=BB99_204 Depth=1
	incl	EdgeProfCounters+13496(%rip)
	movq	224(%rsp), %rax
	movl	668(%rax), %eax
	decl	%eax
	movl	%eax, 200(%rsp)
	incl	EdgeProfCounters+13504(%rip)
	jmp	.LBB99_208
	.align	16, 0x90
.LBB99_206:                             # %if.end1976.if.end1985_crit_edge
                                        #   in Loop: Header=BB99_204 Depth=1
	incl	EdgeProfCounters+13500(%rip)
.LBB99_208:                             # %if.end1985
                                        #   in Loop: Header=BB99_204 Depth=1
	movslq	164(%rsp), %rax
	movq	224(%rsp), %rcx
	movzbl	1704(%rcx,%rax), %eax
	cmpl	160(%rsp), %eax
	jge	.LBB99_210
# BB#209:                               # %if.end1985.if.end1993_crit_edge
                                        #   in Loop: Header=BB99_204 Depth=1
	incl	EdgeProfCounters+13508(%rip)
	jmp	.LBB99_211
	.align	16, 0x90
.LBB99_210:                             # %if.then1992
                                        #   in Loop: Header=BB99_204 Depth=1
	incl	EdgeProfCounters+13512(%rip)
	movl	$3006, %edi             # imm = 0xBBE
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+13516(%rip)
.LBB99_211:                             # %if.end1993
                                        #   in Loop: Header=BB99_204 Depth=1
	cmpl	$6, 160(%rsp)
	jne	.LBB99_212
# BB#213:                               # %land.lhs.true1996
                                        #   in Loop: Header=BB99_204 Depth=1
	incl	EdgeProfCounters+13520(%rip)
	movl	200(%rsp), %eax
	subl	204(%rsp), %eax
	cmpl	$49, %eax
	jne	.LBB99_214
# BB#231:                               # %if.then2001
                                        #   in Loop: Header=BB99_204 Depth=1
	incl	EdgeProfCounters+13528(%rip)
	movslq	164(%rsp), %rcx
	movq	224(%rsp), %rax
	movzbl	1704(%rax,%rcx), %ecx
	imulq	$258, %rcx, %rcx        # imm = 0x102
	leaq	37708(%rax,%rcx), %rax
	movq	%rax, 16(%rsp)
	movslq	164(%rsp), %rcx
	movq	224(%rsp), %rax
	movzbl	1704(%rax,%rcx), %ecx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	leaq	39256(%rax,%rcx), %rax
	movq	%rax, 8(%rsp)
	movslq	204(%rsp), %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$2, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$3, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$4, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$5, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$6, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$7, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$8, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$9, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$10, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$11, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$12, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$13, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$14, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$15, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$16, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$17, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$18, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$19, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$20, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$21, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$22, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$23, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$24, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$25, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$26, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$27, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$28, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$29, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$30, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$31, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$32, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$33, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$34, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$35, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$36, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$37, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$38, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$39, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$40, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$41, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$42, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$43, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$44, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$45, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$46, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$47, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$48, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	movl	204(%rsp), %eax
	addl	$49, %eax
	movslq	%eax, %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 26(%rsp)
	movzwl	26(%rsp), %eax
	movq	8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	16(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	movq	224(%rsp), %rdi
	callq	bsW
	incl	EdgeProfCounters+13536(%rip)
	jmp	.LBB99_219
	.align	16, 0x90
.LBB99_212:                             # %if.end1993.if.else2419_crit_edge
                                        #   in Loop: Header=BB99_204 Depth=1
	incl	EdgeProfCounters+13524(%rip)
	jmp	.LBB99_215
	.align	16, 0x90
.LBB99_214:                             # %land.lhs.true1996.if.else2419_crit_edge
                                        #   in Loop: Header=BB99_204 Depth=1
	incl	EdgeProfCounters+13532(%rip)
.LBB99_215:                             # %if.else2419
                                        #   in Loop: Header=BB99_204 Depth=1
	movl	204(%rsp), %eax
	movl	%eax, 212(%rsp)
	incl	EdgeProfCounters+13540(%rip)
	jmp	.LBB99_216
	.align	16, 0x90
.LBB99_217:                             # %for.inc2445
                                        #   in Loop: Header=BB99_216 Depth=2
	incl	EdgeProfCounters+13544(%rip)
	movslq	212(%rsp), %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	164(%rsp), %rcx
	movq	224(%rsp), %rdi
	movzbl	1704(%rdi,%rcx), %ecx
	imulq	$1032, %rcx, %rdx       # imm = 0x408
	addq	%rdi, %rdx
	movl	39256(%rdx,%rax,4), %edx
	imulq	$258, %rcx, %rcx        # imm = 0x102
	addq	%rdi, %rcx
	movzbl	37708(%rax,%rcx), %esi
	callq	bsW
	incl	EdgeProfCounters+13552(%rip)
	incl	212(%rsp)
	incl	EdgeProfCounters+13556(%rip)
.LBB99_216:                             # %for.cond2420
                                        #   Parent Loop BB99_204 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	212(%rsp), %eax
	cmpl	200(%rsp), %eax
	jle	.LBB99_217
# BB#218:                               # %for.end2447
                                        #   in Loop: Header=BB99_204 Depth=1
	incl	EdgeProfCounters+13548(%rip)
	incl	EdgeProfCounters+13560(%rip)
	jmp	.LBB99_219
.LBB99_220:                             # %while.end2451
	incl	EdgeProfCounters+13484(%rip)
	incl	EdgeProfCounters+13492(%rip)
	movl	164(%rsp), %eax
	cmpl	180(%rsp), %eax
	jne	.LBB99_222
# BB#221:                               # %while.end2451.if.end2455_crit_edge
	incl	EdgeProfCounters+13568(%rip)
	jmp	.LBB99_223
.LBB99_222:                             # %if.then2454
	incl	EdgeProfCounters+13572(%rip)
	movl	$3007, %edi             # imm = 0xBBF
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+13576(%rip)
.LBB99_223:                             # %if.end2455
	movq	224(%rsp), %rax
	cmpl	$2, 656(%rax)
	jle	.LBB99_224
# BB#225:                               # %if.then2459
	incl	EdgeProfCounters+13580(%rip)
	movq	224(%rsp), %rax
	movl	116(%rax), %edx
	subl	156(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str10158, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+13588(%rip)
	addq	$232, %rsp
	ret
.LBB99_224:                             # %if.end2455.if.end2463_crit_edge
	incl	EdgeProfCounters+13584(%rip)
	addq	$232, %rsp
	ret
.Ltmp357:
	.size	sendMTFValues, .Ltmp357-sendMTFValues
	.cfi_endproc

	.align	16, 0x90
	.type	bsFinishWrite,@function
bsFinishWrite:                          # @bsFinishWrite
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+13592(%rip)
	movq	%rdi, -8(%rsp)
	incl	EdgeProfCounters+13596(%rip)
	jmp	.LBB100_1
	.align	16, 0x90
.LBB100_2:                              # %while.body
                                        #   in Loop: Header=BB100_1 Depth=1
	incl	EdgeProfCounters+13600(%rip)
	movq	-8(%rsp), %rax
	movq	80(%rax), %rcx
	movslq	116(%rax), %rdx
	movb	643(%rax), %al
	movb	%al, (%rcx,%rdx)
	movq	-8(%rsp), %rax
	incl	116(%rax)
	movq	-8(%rsp), %rax
	shll	$8, 640(%rax)
	movq	-8(%rsp), %rax
	addl	$-8, 644(%rax)
	incl	EdgeProfCounters+13608(%rip)
.LBB100_1:                              # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-8(%rsp), %rax
	cmpl	$0, 644(%rax)
	jg	.LBB100_2
# BB#3:                                 # %while.end
	incl	EdgeProfCounters+13604(%rip)
	ret
.Ltmp358:
	.size	bsFinishWrite, .Ltmp358-bsFinishWrite
	.cfi_endproc

	.align	16, 0x90
	.type	makeMaps_e,@function
makeMaps_e:                             # @makeMaps_e
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+13612(%rip)
	movq	%rdi, -8(%rsp)
	movl	$0, 124(%rdi)
	movl	$0, -12(%rsp)
	incl	EdgeProfCounters+13616(%rip)
	jmp	.LBB101_1
	.align	16, 0x90
.LBB101_5:                              # %if.end
                                        #   in Loop: Header=BB101_1 Depth=1
	incl	EdgeProfCounters+13640(%rip)
	incl	-12(%rsp)
	incl	EdgeProfCounters+13644(%rip)
.LBB101_1:                              # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$255, -12(%rsp)
	jg	.LBB101_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB101_1 Depth=1
	incl	EdgeProfCounters+13620(%rip)
	movslq	-12(%rsp), %rax
	movq	-8(%rsp), %rcx
	cmpb	$0, 128(%rcx,%rax)
	je	.LBB101_3
# BB#4:                                 # %if.then
                                        #   in Loop: Header=BB101_1 Depth=1
	incl	EdgeProfCounters+13628(%rip)
	movq	-8(%rsp), %rax
	movb	124(%rax), %cl
	movslq	-12(%rsp), %rdx
	movb	%cl, 384(%rax,%rdx)
	movq	-8(%rsp), %rax
	incl	124(%rax)
	incl	EdgeProfCounters+13636(%rip)
	jmp	.LBB101_5
	.align	16, 0x90
.LBB101_3:                              # %for.body.if.end_crit_edge
                                        #   in Loop: Header=BB101_1 Depth=1
	incl	EdgeProfCounters+13632(%rip)
	jmp	.LBB101_5
.LBB101_6:                              # %for.end
	incl	EdgeProfCounters+13624(%rip)
	ret
.Ltmp359:
	.size	makeMaps_e, .Ltmp359-makeMaps_e
	.cfi_endproc

	.globl	BZ2_decompress
	.align	16, 0x90
	.type	BZ2_decompress,@function
BZ2_decompress:                         # @BZ2_decompress
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$376, %rsp              # imm = 0x178
.Ltmp361:
	.cfi_def_cfa_offset 384
	incl	EdgeProfCounters+13648(%rip)
	movq	%rdi, 368(%rsp)
	movq	(%rdi), %rax
	movq	%rax, 344(%rsp)
	movq	368(%rsp), %rax
	cmpl	$10, 8(%rax)
	jne	.LBB102_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+13652(%rip)
	movq	368(%rsp), %rax
	movl	$0, 64036(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64040(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64044(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64048(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64052(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64056(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64060(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64064(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64068(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64072(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64076(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64080(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64084(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64088(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64092(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64096(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64100(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64104(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64108(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64112(%rax)
	movq	368(%rsp), %rax
	movl	$0, 64116(%rax)
	movq	368(%rsp), %rax
	movq	$0, 64120(%rax)
	movq	368(%rsp), %rax
	movq	$0, 64128(%rax)
	movq	368(%rsp), %rax
	movq	$0, 64136(%rax)
	incl	EdgeProfCounters+13660(%rip)
	jmp	.LBB102_3
.LBB102_1:                              # %entry.if.end_crit_edge
	incl	EdgeProfCounters+13656(%rip)
.LBB102_3:                              # %if.end
	movq	368(%rsp), %rax
	movl	64036(%rax), %eax
	movl	%eax, 340(%rsp)
	movq	368(%rsp), %rax
	movl	64040(%rax), %eax
	movl	%eax, 336(%rsp)
	movq	368(%rsp), %rax
	movl	64044(%rax), %eax
	movl	%eax, 332(%rsp)
	movq	368(%rsp), %rax
	movl	64048(%rax), %eax
	movl	%eax, 328(%rsp)
	movq	368(%rsp), %rax
	movl	64052(%rax), %eax
	movl	%eax, 324(%rsp)
	movq	368(%rsp), %rax
	movl	64056(%rax), %eax
	movl	%eax, 320(%rsp)
	movq	368(%rsp), %rax
	movl	64060(%rax), %eax
	movl	%eax, 316(%rsp)
	movq	368(%rsp), %rax
	movl	64064(%rax), %eax
	movl	%eax, 312(%rsp)
	movq	368(%rsp), %rax
	movl	64068(%rax), %eax
	movl	%eax, 308(%rsp)
	movq	368(%rsp), %rax
	movl	64072(%rax), %eax
	movl	%eax, 304(%rsp)
	movq	368(%rsp), %rax
	movl	64076(%rax), %eax
	movl	%eax, 300(%rsp)
	movq	368(%rsp), %rax
	movl	64080(%rax), %eax
	movl	%eax, 296(%rsp)
	movq	368(%rsp), %rax
	movl	64084(%rax), %eax
	movl	%eax, 292(%rsp)
	movq	368(%rsp), %rax
	movl	64088(%rax), %eax
	movl	%eax, 288(%rsp)
	movq	368(%rsp), %rax
	movl	64092(%rax), %eax
	movl	%eax, 284(%rsp)
	movq	368(%rsp), %rax
	movl	64096(%rax), %eax
	movl	%eax, 280(%rsp)
	movq	368(%rsp), %rax
	movl	64100(%rax), %eax
	movl	%eax, 276(%rsp)
	movq	368(%rsp), %rax
	movl	64104(%rax), %eax
	movl	%eax, 272(%rsp)
	movq	368(%rsp), %rax
	movl	64108(%rax), %eax
	movl	%eax, 268(%rsp)
	movq	368(%rsp), %rax
	movl	64112(%rax), %eax
	movl	%eax, 264(%rsp)
	movq	368(%rsp), %rax
	movl	64116(%rax), %eax
	movl	%eax, 260(%rsp)
	movq	368(%rsp), %rax
	movq	64120(%rax), %rax
	movq	%rax, 248(%rsp)
	movq	368(%rsp), %rax
	movq	64128(%rax), %rax
	movq	%rax, 240(%rsp)
	movq	368(%rsp), %rax
	movq	64136(%rax), %rax
	movq	%rax, 232(%rsp)
	movl	$0, 360(%rsp)
	movq	368(%rsp), %rax
	movl	8(%rax), %eax
	addl	$-10, %eax
	cmpl	$40, %eax
	jbe	.LBB102_4
# BB#679:                               # %sw.epilog
	incl	EdgeProfCounters+13664(%rip)
	movl	$4001, %edi             # imm = 0xFA1
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+17452(%rip)
	movl	$4002, %edi             # imm = 0xFA2
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+17456(%rip)
.LBB102_680:                            # %save_state_and_return
	movq	368(%rsp), %rax
	movl	340(%rsp), %ecx
	movl	%ecx, 64036(%rax)
	movq	368(%rsp), %rax
	movl	336(%rsp), %ecx
	movl	%ecx, 64040(%rax)
	movq	368(%rsp), %rax
	movl	332(%rsp), %ecx
	movl	%ecx, 64044(%rax)
	movq	368(%rsp), %rax
	movl	328(%rsp), %ecx
	movl	%ecx, 64048(%rax)
	movq	368(%rsp), %rax
	movl	324(%rsp), %ecx
	movl	%ecx, 64052(%rax)
	movq	368(%rsp), %rax
	movl	320(%rsp), %ecx
	movl	%ecx, 64056(%rax)
	movq	368(%rsp), %rax
	movl	316(%rsp), %ecx
	movl	%ecx, 64060(%rax)
	movq	368(%rsp), %rax
	movl	312(%rsp), %ecx
	movl	%ecx, 64064(%rax)
	movq	368(%rsp), %rax
	movl	308(%rsp), %ecx
	movl	%ecx, 64068(%rax)
	movq	368(%rsp), %rax
	movl	304(%rsp), %ecx
	movl	%ecx, 64072(%rax)
	movq	368(%rsp), %rax
	movl	300(%rsp), %ecx
	movl	%ecx, 64076(%rax)
	movq	368(%rsp), %rax
	movl	296(%rsp), %ecx
	movl	%ecx, 64080(%rax)
	movq	368(%rsp), %rax
	movl	292(%rsp), %ecx
	movl	%ecx, 64084(%rax)
	movq	368(%rsp), %rax
	movl	288(%rsp), %ecx
	movl	%ecx, 64088(%rax)
	movq	368(%rsp), %rax
	movl	284(%rsp), %ecx
	movl	%ecx, 64092(%rax)
	movq	368(%rsp), %rax
	movl	280(%rsp), %ecx
	movl	%ecx, 64096(%rax)
	movq	368(%rsp), %rax
	movl	276(%rsp), %ecx
	movl	%ecx, 64100(%rax)
	movq	368(%rsp), %rax
	movl	272(%rsp), %ecx
	movl	%ecx, 64104(%rax)
	movq	368(%rsp), %rax
	movl	268(%rsp), %ecx
	movl	%ecx, 64108(%rax)
	movq	368(%rsp), %rax
	movl	264(%rsp), %ecx
	movl	%ecx, 64112(%rax)
	movq	368(%rsp), %rax
	movl	260(%rsp), %ecx
	movl	%ecx, 64116(%rax)
	movq	368(%rsp), %rax
	movq	248(%rsp), %rcx
	movq	%rcx, 64120(%rax)
	movq	368(%rsp), %rax
	movq	240(%rsp), %rcx
	movq	%rcx, 64128(%rax)
	movq	368(%rsp), %rax
	movq	232(%rsp), %rcx
	movq	%rcx, 64136(%rax)
	movl	360(%rsp), %eax
	addq	$376, %rsp              # imm = 0x178
	ret
.LBB102_4:                              # %if.end
	jmpq	*.LJTI102_0(,%rax,8)
.LBB102_45:                             # %sw.bb
	incl	EdgeProfCounters+13668(%rip)
	movq	368(%rsp), %rax
	movl	$10, 8(%rax)
	incl	EdgeProfCounters+13832(%rip)
	jmp	.LBB102_46
.LBB102_50:                             # %if.end38.if.end56_crit_edge
                                        #   in Loop: Header=BB102_46 Depth=1
	incl	EdgeProfCounters+13864(%rip)
	incl	EdgeProfCounters+13872(%rip)
.LBB102_46:                             # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_52
# BB#47:                                # %if.end33
                                        #   in Loop: Header=BB102_46 Depth=1
	incl	EdgeProfCounters+13840(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_48
# BB#49:                                # %if.end38
                                        #   in Loop: Header=BB102_46 Depth=1
	incl	EdgeProfCounters+13852(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_50
# BB#51:                                # %if.then53
                                        #   in Loop: Header=BB102_46 Depth=1
	incl	EdgeProfCounters+13860(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+13868(%rip)
	incl	EdgeProfCounters+13872(%rip)
	jmp	.LBB102_46
.LBB102_44:                             # %if.end.sw.bb62_crit_edge
	incl	EdgeProfCounters+13672(%rip)
	jmp	.LBB102_55
.LBB102_43:                             # %if.end.sw.bb118_crit_edge
	incl	EdgeProfCounters+13676(%rip)
	jmp	.LBB102_65
.LBB102_42:                             # %if.end.sw.bb174_crit_edge
	incl	EdgeProfCounters+13680(%rip)
	jmp	.LBB102_75
.LBB102_41:                             # %if.end.sw.bb272_crit_edge
	incl	EdgeProfCounters+13684(%rip)
.LBB102_98:                             # %sw.bb272
	movq	368(%rsp), %rax
	movl	$14, 8(%rax)
	incl	EdgeProfCounters+14128(%rip)
	jmp	.LBB102_99
.LBB102_103:                            # %if.end294.if.end321_crit_edge
                                        #   in Loop: Header=BB102_99 Depth=1
	incl	EdgeProfCounters+14160(%rip)
	incl	EdgeProfCounters+14168(%rip)
.LBB102_99:                             # %while.body274
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_105
# BB#100:                               # %if.end288
                                        #   in Loop: Header=BB102_99 Depth=1
	incl	EdgeProfCounters+14136(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_101
# BB#102:                               # %if.end294
                                        #   in Loop: Header=BB102_99 Depth=1
	incl	EdgeProfCounters+14148(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_103
# BB#104:                               # %if.then317
                                        #   in Loop: Header=BB102_99 Depth=1
	incl	EdgeProfCounters+14156(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+14164(%rip)
	incl	EdgeProfCounters+14168(%rip)
	jmp	.LBB102_99
.LBB102_40:                             # %if.end.sw.bb333_crit_edge
	incl	EdgeProfCounters+13688(%rip)
.LBB102_109:                            # %sw.bb333
	movq	368(%rsp), %rax
	movl	$15, 8(%rax)
	incl	EdgeProfCounters+14200(%rip)
	jmp	.LBB102_110
.LBB102_114:                            # %if.end355.if.end382_crit_edge
                                        #   in Loop: Header=BB102_110 Depth=1
	incl	EdgeProfCounters+14232(%rip)
	incl	EdgeProfCounters+14240(%rip)
.LBB102_110:                            # %while.body335
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_116
# BB#111:                               # %if.end349
                                        #   in Loop: Header=BB102_110 Depth=1
	incl	EdgeProfCounters+14208(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_112
# BB#113:                               # %if.end355
                                        #   in Loop: Header=BB102_110 Depth=1
	incl	EdgeProfCounters+14220(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_114
# BB#115:                               # %if.then378
                                        #   in Loop: Header=BB102_110 Depth=1
	incl	EdgeProfCounters+14228(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+14236(%rip)
	incl	EdgeProfCounters+14240(%rip)
	jmp	.LBB102_110
.LBB102_39:                             # %if.end.sw.bb389_crit_edge
	incl	EdgeProfCounters+13692(%rip)
	jmp	.LBB102_119
.LBB102_38:                             # %if.end.sw.bb445_crit_edge
	incl	EdgeProfCounters+13696(%rip)
	jmp	.LBB102_129
.LBB102_37:                             # %if.end.sw.bb501_crit_edge
	incl	EdgeProfCounters+13700(%rip)
	jmp	.LBB102_139
.LBB102_36:                             # %if.end.sw.bb557_crit_edge
	incl	EdgeProfCounters+13704(%rip)
	jmp	.LBB102_149
.LBB102_35:                             # %if.end.sw.bb620_crit_edge
	incl	EdgeProfCounters+13708(%rip)
	jmp	.LBB102_162
.LBB102_34:                             # %if.end.sw.bb676_crit_edge
	incl	EdgeProfCounters+13712(%rip)
	jmp	.LBB102_170
.LBB102_33:                             # %if.end.sw.bb732_crit_edge
	incl	EdgeProfCounters+13716(%rip)
	jmp	.LBB102_178
.LBB102_32:                             # %if.end.sw.bb788_crit_edge
	incl	EdgeProfCounters+13720(%rip)
	jmp	.LBB102_186
.LBB102_31:                             # %if.end.sw.bb844_crit_edge
	incl	EdgeProfCounters+13724(%rip)
	jmp	.LBB102_194
.LBB102_30:                             # %if.end.sw.bb895_crit_edge
	incl	EdgeProfCounters+13728(%rip)
	jmp	.LBB102_202
.LBB102_29:                             # %if.end.sw.bb951_crit_edge
	incl	EdgeProfCounters+13732(%rip)
	jmp	.LBB102_210
.LBB102_28:                             # %if.end.sw.bb1007_crit_edge
	incl	EdgeProfCounters+13736(%rip)
	jmp	.LBB102_218
.LBB102_27:                             # %if.end.sw.bb1078_crit_edge
	incl	EdgeProfCounters+13740(%rip)
	jmp	.LBB102_232
.LBB102_26:                             # %if.end.sw.bb1161_crit_edge
	incl	EdgeProfCounters+13744(%rip)
.LBB102_253:                            # %sw.bb1161
	movq	368(%rsp), %rax
	movl	$29, 8(%rax)
	incl	EdgeProfCounters+15056(%rip)
	jmp	.LBB102_254
.LBB102_258:                            # %if.end1183.if.end1210_crit_edge
                                        #   in Loop: Header=BB102_254 Depth=1
	incl	EdgeProfCounters+15088(%rip)
	incl	EdgeProfCounters+15096(%rip)
.LBB102_254:                            # %while.body1163
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_260
# BB#255:                               # %if.end1177
                                        #   in Loop: Header=BB102_254 Depth=1
	incl	EdgeProfCounters+15064(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_256
# BB#257:                               # %if.end1183
                                        #   in Loop: Header=BB102_254 Depth=1
	incl	EdgeProfCounters+15076(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_258
# BB#259:                               # %if.then1206
                                        #   in Loop: Header=BB102_254 Depth=1
	incl	EdgeProfCounters+15084(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+15092(%rip)
	incl	EdgeProfCounters+15096(%rip)
	jmp	.LBB102_254
.LBB102_25:                             # %if.end.sw.bb1235_crit_edge
	incl	EdgeProfCounters+13748(%rip)
.LBB102_269:                            # %sw.bb1235
	movq	368(%rsp), %rax
	movl	$30, 8(%rax)
	incl	EdgeProfCounters+15148(%rip)
	jmp	.LBB102_270
.LBB102_274:                            # %if.end1256.if.end1283_crit_edge
                                        #   in Loop: Header=BB102_270 Depth=1
	incl	EdgeProfCounters+15180(%rip)
	incl	EdgeProfCounters+15188(%rip)
.LBB102_270:                            # %while.body1237
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$2, 36(%rax)
	jg	.LBB102_276
# BB#271:                               # %if.end1250
                                        #   in Loop: Header=BB102_270 Depth=1
	incl	EdgeProfCounters+15156(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_272
# BB#273:                               # %if.end1256
                                        #   in Loop: Header=BB102_270 Depth=1
	incl	EdgeProfCounters+15168(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_274
# BB#275:                               # %if.then1279
                                        #   in Loop: Header=BB102_270 Depth=1
	incl	EdgeProfCounters+15176(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+15184(%rip)
	incl	EdgeProfCounters+15188(%rip)
	jmp	.LBB102_270
.LBB102_24:                             # %if.end.sw.bb1292_crit_edge
	incl	EdgeProfCounters+13752(%rip)
.LBB102_282:                            # %sw.bb1292
	movq	368(%rsp), %rax
	movl	$31, 8(%rax)
	incl	EdgeProfCounters+15216(%rip)
	jmp	.LBB102_283
.LBB102_287:                            # %if.end1313.if.end1340_crit_edge
                                        #   in Loop: Header=BB102_283 Depth=1
	incl	EdgeProfCounters+15248(%rip)
	incl	EdgeProfCounters+15256(%rip)
.LBB102_283:                            # %while.body1294
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$14, 36(%rax)
	jg	.LBB102_289
# BB#284:                               # %if.end1307
                                        #   in Loop: Header=BB102_283 Depth=1
	incl	EdgeProfCounters+15224(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_285
# BB#286:                               # %if.end1313
                                        #   in Loop: Header=BB102_283 Depth=1
	incl	EdgeProfCounters+15236(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_287
# BB#288:                               # %if.then1336
                                        #   in Loop: Header=BB102_283 Depth=1
	incl	EdgeProfCounters+15244(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+15252(%rip)
	incl	EdgeProfCounters+15256(%rip)
	jmp	.LBB102_283
.LBB102_23:                             # %if.end.sw.bb1351_crit_edge
	incl	EdgeProfCounters+13756(%rip)
.LBB102_295:                            # %sw.bb1351
	movq	368(%rsp), %rax
	movl	$32, 8(%rax)
	incl	EdgeProfCounters+15292(%rip)
	jmp	.LBB102_296
.LBB102_300:                            # %if.end1374.if.end1401_crit_edge
                                        #   in Loop: Header=BB102_296 Depth=1
	incl	EdgeProfCounters+15324(%rip)
	incl	EdgeProfCounters+15332(%rip)
.LBB102_296:                            # %while.body1354
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_302
# BB#297:                               # %if.end1368
                                        #   in Loop: Header=BB102_296 Depth=1
	incl	EdgeProfCounters+15300(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_298
# BB#299:                               # %if.end1374
                                        #   in Loop: Header=BB102_296 Depth=1
	incl	EdgeProfCounters+15312(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_300
# BB#301:                               # %if.then1397
                                        #   in Loop: Header=BB102_296 Depth=1
	incl	EdgeProfCounters+15320(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+15328(%rip)
	incl	EdgeProfCounters+15332(%rip)
	jmp	.LBB102_296
.LBB102_22:                             # %if.end.sw.bb1463_crit_edge
	incl	EdgeProfCounters+13760(%rip)
.LBB102_319:                            # %sw.bb1463
	movq	368(%rsp), %rax
	movl	$33, 8(%rax)
	incl	EdgeProfCounters+15444(%rip)
	jmp	.LBB102_320
.LBB102_324:                            # %if.end1486.if.end1513_crit_edge
                                        #   in Loop: Header=BB102_320 Depth=1
	incl	EdgeProfCounters+15476(%rip)
	incl	EdgeProfCounters+15484(%rip)
.LBB102_320:                            # %while.body1466
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$4, 36(%rax)
	jg	.LBB102_326
# BB#321:                               # %if.end1480
                                        #   in Loop: Header=BB102_320 Depth=1
	incl	EdgeProfCounters+15452(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_322
# BB#323:                               # %if.end1486
                                        #   in Loop: Header=BB102_320 Depth=1
	incl	EdgeProfCounters+15464(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_324
# BB#325:                               # %if.then1509
                                        #   in Loop: Header=BB102_320 Depth=1
	incl	EdgeProfCounters+15472(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+15480(%rip)
	incl	EdgeProfCounters+15484(%rip)
	jmp	.LBB102_320
.LBB102_21:                             # %if.end.sw.bb1528_crit_edge
	incl	EdgeProfCounters+13764(%rip)
.LBB102_335:                            # %sw.bb1528
	movq	368(%rsp), %rax
	movl	$34, 8(%rax)
	incl	EdgeProfCounters+15528(%rip)
	jmp	.LBB102_336
.LBB102_340:                            # %if.end1552.if.end1579_crit_edge
                                        #   in Loop: Header=BB102_336 Depth=1
	incl	EdgeProfCounters+15560(%rip)
	incl	EdgeProfCounters+15568(%rip)
.LBB102_336:                            # %while.body1531
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_342
# BB#337:                               # %if.end1546
                                        #   in Loop: Header=BB102_336 Depth=1
	incl	EdgeProfCounters+15536(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_338
# BB#339:                               # %if.end1552
                                        #   in Loop: Header=BB102_336 Depth=1
	incl	EdgeProfCounters+15548(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_340
# BB#341:                               # %if.then1575
                                        #   in Loop: Header=BB102_336 Depth=1
	incl	EdgeProfCounters+15556(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+15564(%rip)
	incl	EdgeProfCounters+15568(%rip)
	jmp	.LBB102_336
.LBB102_20:                             # %if.end.sw.bb1586_crit_edge
	incl	EdgeProfCounters+13768(%rip)
	jmp	.LBB102_344
.LBB102_19:                             # %if.end.sw.bb1788_crit_edge
	incl	EdgeProfCounters+13772(%rip)
.LBB102_383:                            # %sw.bb1788
	movq	368(%rsp), %rax
	movl	$36, 8(%rax)
	incl	EdgeProfCounters+15820(%rip)
	jmp	.LBB102_384
.LBB102_388:                            # %if.end1813.if.end1840_crit_edge
                                        #   in Loop: Header=BB102_384 Depth=1
	incl	EdgeProfCounters+15852(%rip)
	incl	EdgeProfCounters+15860(%rip)
.LBB102_384:                            # %while.body1791
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	movl	36(%rax), %eax
	cmpl	276(%rsp), %eax
	jge	.LBB102_390
# BB#385:                               # %if.end1807
                                        #   in Loop: Header=BB102_384 Depth=1
	incl	EdgeProfCounters+15828(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_386
# BB#387:                               # %if.end1813
                                        #   in Loop: Header=BB102_384 Depth=1
	incl	EdgeProfCounters+15840(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_388
# BB#389:                               # %if.then1836
                                        #   in Loop: Header=BB102_384 Depth=1
	incl	EdgeProfCounters+15848(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+15856(%rip)
	incl	EdgeProfCounters+15860(%rip)
	jmp	.LBB102_384
.LBB102_18:                             # %if.end.sw.bb1855_crit_edge
	incl	EdgeProfCounters+13776(%rip)
.LBB102_395:                            # %sw.bb1855
	movq	368(%rsp), %rax
	movl	$37, 8(%rax)
	incl	EdgeProfCounters+15896(%rip)
	jmp	.LBB102_396
.LBB102_400:                            # %if.end1878.if.end1905_crit_edge
                                        #   in Loop: Header=BB102_396 Depth=1
	incl	EdgeProfCounters+15928(%rip)
	incl	EdgeProfCounters+15936(%rip)
.LBB102_396:                            # %while.body1858
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_402
# BB#397:                               # %if.end1872
                                        #   in Loop: Header=BB102_396 Depth=1
	incl	EdgeProfCounters+15904(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_398
# BB#399:                               # %if.end1878
                                        #   in Loop: Header=BB102_396 Depth=1
	incl	EdgeProfCounters+15916(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_400
# BB#401:                               # %if.then1901
                                        #   in Loop: Header=BB102_396 Depth=1
	incl	EdgeProfCounters+15924(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+15932(%rip)
	incl	EdgeProfCounters+15936(%rip)
	jmp	.LBB102_396
.LBB102_17:                             # %if.end.sw.bb1983_crit_edge
	incl	EdgeProfCounters+13780(%rip)
.LBB102_427:                            # %sw.bb1983
	movq	368(%rsp), %rax
	movl	$38, 8(%rax)
	incl	EdgeProfCounters+16056(%rip)
	jmp	.LBB102_428
.LBB102_432:                            # %if.end2008.if.end2035_crit_edge
                                        #   in Loop: Header=BB102_428 Depth=1
	incl	EdgeProfCounters+16088(%rip)
	incl	EdgeProfCounters+16096(%rip)
.LBB102_428:                            # %while.body1986
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	movl	36(%rax), %eax
	cmpl	276(%rsp), %eax
	jge	.LBB102_434
# BB#429:                               # %if.end2002
                                        #   in Loop: Header=BB102_428 Depth=1
	incl	EdgeProfCounters+16064(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_430
# BB#431:                               # %if.end2008
                                        #   in Loop: Header=BB102_428 Depth=1
	incl	EdgeProfCounters+16076(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_432
# BB#433:                               # %if.then2031
                                        #   in Loop: Header=BB102_428 Depth=1
	incl	EdgeProfCounters+16084(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+16092(%rip)
	incl	EdgeProfCounters+16096(%rip)
	jmp	.LBB102_428
.LBB102_16:                             # %if.end.sw.bb2050_crit_edge
	incl	EdgeProfCounters+13784(%rip)
.LBB102_439:                            # %sw.bb2050
	movq	368(%rsp), %rax
	movl	$39, 8(%rax)
	incl	EdgeProfCounters+16132(%rip)
	jmp	.LBB102_440
.LBB102_444:                            # %if.end2073.if.end2100_crit_edge
                                        #   in Loop: Header=BB102_440 Depth=1
	incl	EdgeProfCounters+16164(%rip)
	incl	EdgeProfCounters+16172(%rip)
.LBB102_440:                            # %while.body2053
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_446
# BB#441:                               # %if.end2067
                                        #   in Loop: Header=BB102_440 Depth=1
	incl	EdgeProfCounters+16140(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_442
# BB#443:                               # %if.end2073
                                        #   in Loop: Header=BB102_440 Depth=1
	incl	EdgeProfCounters+16152(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_444
# BB#445:                               # %if.then2096
                                        #   in Loop: Header=BB102_440 Depth=1
	incl	EdgeProfCounters+16160(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+16168(%rip)
	incl	EdgeProfCounters+16172(%rip)
	jmp	.LBB102_440
.LBB102_15:                             # %if.end.sw.bb2409_crit_edge
	incl	EdgeProfCounters+13788(%rip)
.LBB102_505:                            # %sw.bb2409
	movq	368(%rsp), %rax
	movl	$40, 8(%rax)
	incl	EdgeProfCounters+16488(%rip)
	jmp	.LBB102_506
.LBB102_510:                            # %if.end2434.if.end2461_crit_edge
                                        #   in Loop: Header=BB102_506 Depth=1
	incl	EdgeProfCounters+16520(%rip)
	incl	EdgeProfCounters+16528(%rip)
.LBB102_506:                            # %while.body2412
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	movl	36(%rax), %eax
	cmpl	276(%rsp), %eax
	jge	.LBB102_512
# BB#507:                               # %if.end2428
                                        #   in Loop: Header=BB102_506 Depth=1
	incl	EdgeProfCounters+16496(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_508
# BB#509:                               # %if.end2434
                                        #   in Loop: Header=BB102_506 Depth=1
	incl	EdgeProfCounters+16508(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_510
# BB#511:                               # %if.then2457
                                        #   in Loop: Header=BB102_506 Depth=1
	incl	EdgeProfCounters+16516(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+16524(%rip)
	incl	EdgeProfCounters+16528(%rip)
	jmp	.LBB102_506
.LBB102_14:                             # %if.end.sw.bb2476_crit_edge
	incl	EdgeProfCounters+13792(%rip)
.LBB102_517:                            # %sw.bb2476
	movq	368(%rsp), %rax
	movl	$41, 8(%rax)
	incl	EdgeProfCounters+16564(%rip)
	jmp	.LBB102_518
.LBB102_522:                            # %if.end2499.if.end2526_crit_edge
                                        #   in Loop: Header=BB102_518 Depth=1
	incl	EdgeProfCounters+16596(%rip)
	incl	EdgeProfCounters+16604(%rip)
.LBB102_518:                            # %while.body2479
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_524
# BB#519:                               # %if.end2493
                                        #   in Loop: Header=BB102_518 Depth=1
	incl	EdgeProfCounters+16572(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_520
# BB#521:                               # %if.end2499
                                        #   in Loop: Header=BB102_518 Depth=1
	incl	EdgeProfCounters+16584(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_522
# BB#523:                               # %if.then2522
                                        #   in Loop: Header=BB102_518 Depth=1
	incl	EdgeProfCounters+16592(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+16600(%rip)
	incl	EdgeProfCounters+16604(%rip)
	jmp	.LBB102_518
.LBB102_13:                             # %if.end.sw.bb2942_crit_edge
	incl	EdgeProfCounters+13796(%rip)
	jmp	.LBB102_597
.LBB102_12:                             # %if.end.sw.bb3000_crit_edge
	incl	EdgeProfCounters+13800(%rip)
	jmp	.LBB102_607
.LBB102_11:                             # %if.end.sw.bb3058_crit_edge
	incl	EdgeProfCounters+13804(%rip)
	jmp	.LBB102_617
.LBB102_10:                             # %if.end.sw.bb3116_crit_edge
	incl	EdgeProfCounters+13808(%rip)
	jmp	.LBB102_627
.LBB102_9:                              # %if.end.sw.bb3174_crit_edge
	incl	EdgeProfCounters+13812(%rip)
	jmp	.LBB102_637
.LBB102_8:                              # %if.end.sw.bb3232_crit_edge
	incl	EdgeProfCounters+13816(%rip)
	jmp	.LBB102_647
.LBB102_7:                              # %if.end.sw.bb3290_crit_edge
	incl	EdgeProfCounters+13820(%rip)
	jmp	.LBB102_655
.LBB102_6:                              # %if.end.sw.bb3348_crit_edge
	incl	EdgeProfCounters+13824(%rip)
	jmp	.LBB102_663
.LBB102_5:                              # %if.end.sw.bb3406_crit_edge
	incl	EdgeProfCounters+13828(%rip)
	jmp	.LBB102_671
.LBB102_52:                             # %while.end
	incl	EdgeProfCounters+13836(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 228(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	228(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+13844(%rip)
	movzbl	367(%rsp), %eax
	cmpl	$66, %eax
	je	.LBB102_54
# BB#53:                                # %if.then60
	incl	EdgeProfCounters+13876(%rip)
	movl	$-5, 360(%rsp)
	incl	EdgeProfCounters+13884(%rip)
	jmp	.LBB102_680
.LBB102_105:                            # %while.end322
	incl	EdgeProfCounters+14132(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 212(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	212(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+14140(%rip)
	cmpb	$23, 367(%rsp)
	jne	.LBB102_106
# BB#596:                               # %endhdr_2
	incl	EdgeProfCounters+14172(%rip)
	incl	EdgeProfCounters+14180(%rip)
	incl	EdgeProfCounters+16956(%rip)
.LBB102_597:                            # %sw.bb2942
	movq	368(%rsp), %rax
	movl	$42, 8(%rax)
	incl	EdgeProfCounters+16960(%rip)
	jmp	.LBB102_598
.LBB102_602:                            # %if.end2966.if.end2993_crit_edge
                                        #   in Loop: Header=BB102_598 Depth=1
	incl	EdgeProfCounters+16992(%rip)
	incl	EdgeProfCounters+17000(%rip)
.LBB102_598:                            # %while.body2945
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_604
# BB#599:                               # %if.end2960
                                        #   in Loop: Header=BB102_598 Depth=1
	incl	EdgeProfCounters+16968(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_600
# BB#601:                               # %if.end2966
                                        #   in Loop: Header=BB102_598 Depth=1
	incl	EdgeProfCounters+16980(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_602
# BB#603:                               # %if.then2989
                                        #   in Loop: Header=BB102_598 Depth=1
	incl	EdgeProfCounters+16988(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+16996(%rip)
	incl	EdgeProfCounters+17000(%rip)
	jmp	.LBB102_598
.LBB102_604:                            # %while.end2994
	incl	EdgeProfCounters+16964(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 44(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	44(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+16972(%rip)
	movzbl	367(%rsp), %eax
	cmpl	$114, %eax
	je	.LBB102_606
# BB#605:                               # %if.then2998
	incl	EdgeProfCounters+17004(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+17012(%rip)
	jmp	.LBB102_680
.LBB102_600:                            # %if.then2965
	incl	EdgeProfCounters+16976(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+16984(%rip)
	jmp	.LBB102_680
.LBB102_116:                            # %while.end383
	incl	EdgeProfCounters+14204(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 208(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	208(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+14212(%rip)
	movzbl	367(%rsp), %eax
	cmpl	$65, %eax
	je	.LBB102_118
# BB#117:                               # %if.then387
	incl	EdgeProfCounters+14244(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+14252(%rip)
	jmp	.LBB102_680
.LBB102_112:                            # %if.then354
	incl	EdgeProfCounters+14216(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+14224(%rip)
	jmp	.LBB102_680
.LBB102_260:                            # %while.end1211
	incl	EdgeProfCounters+15060(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	decl	%ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	andl	$1, %eax
	movl	%eax, 152(%rsp)
	movq	368(%rsp), %rax
	decl	36(%rax)
	movb	152(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+15068(%rip)
	cmpb	$1, 367(%rsp)
	jne	.LBB102_261
# BB#262:                               # %if.then1215
	incl	EdgeProfCounters+15100(%rip)
	movl	340(%rsp), %eax
	shll	$4, %eax
	addl	336(%rsp), %eax
	movslq	%eax, %rax
	movq	368(%rsp), %rcx
	movb	$1, 3196(%rcx,%rax)
	incl	EdgeProfCounters+15108(%rip)
	jmp	.LBB102_263
.LBB102_276:                            # %while.end1284
	incl	EdgeProfCounters+15152(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-3, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	andl	$7, %eax
	movl	%eax, 148(%rsp)
	movq	368(%rsp), %rax
	addl	$-3, 36(%rax)
	movl	148(%rsp), %eax
	movl	%eax, 324(%rsp)
	incl	EdgeProfCounters+15160(%rip)
	cmpl	$1, 324(%rsp)
	jg	.LBB102_278
# BB#277:                               # %while.end1284.if.then1290_crit_edge
	incl	EdgeProfCounters+15192(%rip)
	jmp	.LBB102_280
.LBB102_289:                            # %while.end1341
	incl	EdgeProfCounters+15220(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-15, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	andl	$32767, %eax            # imm = 0x7FFF
	movl	%eax, 144(%rsp)
	movq	368(%rsp), %rax
	addl	$-15, 36(%rax)
	movl	144(%rsp), %eax
	movl	%eax, 320(%rsp)
	incl	EdgeProfCounters+15228(%rip)
	cmpl	$0, 320(%rsp)
	jle	.LBB102_290
# BB#291:                               # %if.end1345
	incl	EdgeProfCounters+15264(%rip)
	movl	$0, 340(%rsp)
	incl	EdgeProfCounters+15272(%rip)
	jmp	.LBB102_292
.LBB102_285:                            # %if.then1312
	incl	EdgeProfCounters+15232(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+15240(%rip)
	jmp	.LBB102_680
.LBB102_302:                            # %while.end1402
	incl	EdgeProfCounters+15296(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	decl	%ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	andl	$1, %eax
	movl	%eax, 140(%rsp)
	movq	368(%rsp), %rax
	decl	36(%rax)
	movb	140(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+15304(%rip)
	cmpb	$0, 367(%rsp)
	je	.LBB102_306
# BB#303:                               # %if.end1407
	incl	EdgeProfCounters+15340(%rip)
	movl	336(%rsp), %eax
	incl	%eax
	movl	%eax, 336(%rsp)
	cmpl	324(%rsp), %eax
	jl	.LBB102_305
# BB#304:                               # %if.then1411
	incl	EdgeProfCounters+15348(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+15356(%rip)
	jmp	.LBB102_680
.LBB102_298:                            # %if.then1373
	incl	EdgeProfCounters+15308(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+15316(%rip)
	jmp	.LBB102_680
.LBB102_326:                            # %while.end1514
	incl	EdgeProfCounters+15448(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-5, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	andl	$31, %eax
	movl	%eax, 128(%rsp)
	movq	368(%rsp), %rax
	addl	$-5, 36(%rax)
	movl	128(%rsp), %eax
	movl	%eax, 284(%rsp)
	incl	EdgeProfCounters+15456(%rip)
	movl	$0, 340(%rsp)
	incl	EdgeProfCounters+15488(%rip)
	jmp	.LBB102_327
.LBB102_342:                            # %while.end1580
	incl	EdgeProfCounters+15532(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	decl	%ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	andl	$1, %eax
	movl	%eax, 124(%rsp)
	movq	368(%rsp), %rax
	decl	36(%rax)
	movb	124(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+15540(%rip)
	cmpb	$0, 367(%rsp)
	je	.LBB102_354
# BB#343:                               # %if.end1585
	incl	EdgeProfCounters+15576(%rip)
	incl	EdgeProfCounters+15584(%rip)
.LBB102_344:                            # %sw.bb1586
	movq	368(%rsp), %rax
	movl	$35, 8(%rax)
	incl	EdgeProfCounters+15588(%rip)
	jmp	.LBB102_345
.LBB102_349:                            # %if.end1610.if.end1637_crit_edge
                                        #   in Loop: Header=BB102_345 Depth=1
	incl	EdgeProfCounters+15620(%rip)
	incl	EdgeProfCounters+15628(%rip)
.LBB102_345:                            # %while.body1589
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_351
# BB#346:                               # %if.end1604
                                        #   in Loop: Header=BB102_345 Depth=1
	incl	EdgeProfCounters+15596(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_347
# BB#348:                               # %if.end1610
                                        #   in Loop: Header=BB102_345 Depth=1
	incl	EdgeProfCounters+15608(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_349
# BB#350:                               # %if.then1633
                                        #   in Loop: Header=BB102_345 Depth=1
	incl	EdgeProfCounters+15616(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+15624(%rip)
	incl	EdgeProfCounters+15628(%rip)
	jmp	.LBB102_345
.LBB102_351:                            # %while.end1638
	incl	EdgeProfCounters+15592(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	decl	%ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	andl	$1, %eax
	movl	%eax, 120(%rsp)
	movq	368(%rsp), %rax
	decl	36(%rax)
	movb	120(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+15600(%rip)
	movzbl	367(%rsp), %eax
	testl	%eax, %eax
	je	.LBB102_352
# BB#353:                               # %if.else1644
	incl	EdgeProfCounters+15636(%rip)
	decl	284(%rsp)
	incl	EdgeProfCounters+15644(%rip)
	incl	EdgeProfCounters+15648(%rip)
	jmp	.LBB102_329
.LBB102_347:                            # %if.then1609
	incl	EdgeProfCounters+15604(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+15612(%rip)
	jmp	.LBB102_680
.LBB102_390:                            # %while.end1841
	incl	EdgeProfCounters+15824(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %edx
	movl	36(%rax), %ecx
	movl	276(%rsp), %eax
	subl	%eax, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %edx
	movl	$1, %esi
	movb	%al, %cl
	shll	%cl, %esi
	decl	%esi
	andl	%edx, %esi
	movl	%esi, 104(%rsp)
	movq	368(%rsp), %rax
	movl	276(%rsp), %ecx
	subl	%ecx, 36(%rax)
	movl	104(%rsp), %eax
	movl	%eax, 272(%rsp)
	incl	EdgeProfCounters+15832(%rip)
	incl	EdgeProfCounters+15864(%rip)
	jmp	.LBB102_391
.LBB102_402:                            # %while.end1906
	incl	EdgeProfCounters+15900(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	decl	%ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	andl	$1, %eax
	movl	%eax, 100(%rsp)
	movq	368(%rsp), %rax
	decl	36(%rax)
	movl	100(%rsp), %eax
	movl	%eax, 268(%rsp)
	incl	EdgeProfCounters+15908(%rip)
	movl	272(%rsp), %eax
	addl	%eax, %eax
	orl	268(%rsp), %eax
	movl	%eax, 272(%rsp)
	incl	EdgeProfCounters+15940(%rip)
.LBB102_391:                            # %while.body1843
	cmpl	$21, 276(%rsp)
	jl	.LBB102_393
# BB#392:                               # %if.then1846
	incl	EdgeProfCounters+15868(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+15876(%rip)
	jmp	.LBB102_680
.LBB102_398:                            # %if.then1877
	incl	EdgeProfCounters+15912(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+15920(%rip)
	jmp	.LBB102_680
.LBB102_434:                            # %while.end2036
	incl	EdgeProfCounters+16060(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %edx
	movl	36(%rax), %ecx
	movl	276(%rsp), %eax
	subl	%eax, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %edx
	movl	$1, %esi
	movb	%al, %cl
	shll	%cl, %esi
	decl	%esi
	andl	%edx, %esi
	movl	%esi, 96(%rsp)
	movq	368(%rsp), %rax
	movl	276(%rsp), %ecx
	subl	%ecx, 36(%rax)
	movl	96(%rsp), %eax
	movl	%eax, 272(%rsp)
	incl	EdgeProfCounters+16068(%rip)
	incl	EdgeProfCounters+16100(%rip)
	jmp	.LBB102_435
.LBB102_446:                            # %while.end2101
	incl	EdgeProfCounters+16136(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	decl	%ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	andl	$1, %eax
	movl	%eax, 92(%rsp)
	movq	368(%rsp), %rax
	decl	36(%rax)
	movl	92(%rsp), %eax
	movl	%eax, 268(%rsp)
	incl	EdgeProfCounters+16144(%rip)
	movl	272(%rsp), %eax
	addl	%eax, %eax
	orl	268(%rsp), %eax
	movl	%eax, 272(%rsp)
	incl	EdgeProfCounters+16176(%rip)
.LBB102_435:                            # %while.body2038
	cmpl	$21, 276(%rsp)
	jl	.LBB102_437
# BB#436:                               # %if.then2041
	incl	EdgeProfCounters+16104(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+16112(%rip)
	jmp	.LBB102_680
.LBB102_442:                            # %if.then2072
	incl	EdgeProfCounters+16148(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+16156(%rip)
	jmp	.LBB102_680
.LBB102_512:                            # %while.end2462
	incl	EdgeProfCounters+16492(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %edx
	movl	36(%rax), %ecx
	movl	276(%rsp), %eax
	subl	%eax, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %edx
	movl	$1, %esi
	movb	%al, %cl
	shll	%cl, %esi
	decl	%esi
	andl	%edx, %esi
	movl	%esi, 56(%rsp)
	movq	368(%rsp), %rax
	movl	276(%rsp), %ecx
	subl	%ecx, 36(%rax)
	movl	56(%rsp), %eax
	movl	%eax, 272(%rsp)
	incl	EdgeProfCounters+16500(%rip)
	incl	EdgeProfCounters+16532(%rip)
	jmp	.LBB102_513
.LBB102_524:                            # %while.end2527
	incl	EdgeProfCounters+16568(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	decl	%ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	andl	$1, %eax
	movl	%eax, 52(%rsp)
	movq	368(%rsp), %rax
	decl	36(%rax)
	movl	52(%rsp), %eax
	movl	%eax, 268(%rsp)
	incl	EdgeProfCounters+16576(%rip)
	movl	272(%rsp), %eax
	addl	%eax, %eax
	orl	268(%rsp), %eax
	movl	%eax, 272(%rsp)
	incl	EdgeProfCounters+16608(%rip)
.LBB102_513:                            # %while.body2464
	cmpl	$21, 276(%rsp)
	jl	.LBB102_515
# BB#514:                               # %if.then2467
	incl	EdgeProfCounters+16536(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+16544(%rip)
	jmp	.LBB102_680
.LBB102_520:                            # %if.then2498
	incl	EdgeProfCounters+16580(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+16588(%rip)
	jmp	.LBB102_680
.LBB102_48:                             # %if.then37
	incl	EdgeProfCounters+13848(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+13856(%rip)
	jmp	.LBB102_680
.LBB102_101:                            # %if.then293
	incl	EdgeProfCounters+14144(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+14152(%rip)
	jmp	.LBB102_680
.LBB102_256:                            # %if.then1182
	incl	EdgeProfCounters+15072(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+15080(%rip)
	jmp	.LBB102_680
.LBB102_272:                            # %if.then1255
	incl	EdgeProfCounters+15164(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+15172(%rip)
	jmp	.LBB102_680
.LBB102_322:                            # %if.then1485
	incl	EdgeProfCounters+15460(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+15468(%rip)
	jmp	.LBB102_680
.LBB102_338:                            # %if.then1551
	incl	EdgeProfCounters+15544(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+15552(%rip)
	jmp	.LBB102_680
.LBB102_386:                            # %if.then1812
	incl	EdgeProfCounters+15836(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+15844(%rip)
	jmp	.LBB102_680
.LBB102_430:                            # %if.then2007
	incl	EdgeProfCounters+16072(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+16080(%rip)
	jmp	.LBB102_680
.LBB102_508:                            # %if.then2433
	incl	EdgeProfCounters+16504(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+16512(%rip)
	jmp	.LBB102_680
.LBB102_54:                             # %if.end61
	incl	EdgeProfCounters+13880(%rip)
	incl	EdgeProfCounters+13888(%rip)
.LBB102_55:                             # %sw.bb62
	movq	368(%rsp), %rax
	movl	$11, 8(%rax)
	incl	EdgeProfCounters+13892(%rip)
	jmp	.LBB102_56
.LBB102_60:                             # %if.end84.if.end111_crit_edge
                                        #   in Loop: Header=BB102_56 Depth=1
	incl	EdgeProfCounters+13924(%rip)
	incl	EdgeProfCounters+13932(%rip)
.LBB102_56:                             # %while.body64
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_62
# BB#57:                                # %if.end78
                                        #   in Loop: Header=BB102_56 Depth=1
	incl	EdgeProfCounters+13900(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_58
# BB#59:                                # %if.end84
                                        #   in Loop: Header=BB102_56 Depth=1
	incl	EdgeProfCounters+13912(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_60
# BB#61:                                # %if.then107
                                        #   in Loop: Header=BB102_56 Depth=1
	incl	EdgeProfCounters+13920(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+13928(%rip)
	incl	EdgeProfCounters+13932(%rip)
	jmp	.LBB102_56
.LBB102_62:                             # %while.end112
	incl	EdgeProfCounters+13896(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 224(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	224(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+13904(%rip)
	movzbl	367(%rsp), %eax
	cmpl	$90, %eax
	je	.LBB102_64
# BB#63:                                # %if.then116
	incl	EdgeProfCounters+13936(%rip)
	movl	$-5, 360(%rsp)
	incl	EdgeProfCounters+13944(%rip)
	jmp	.LBB102_680
.LBB102_58:                             # %if.then83
	incl	EdgeProfCounters+13908(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+13916(%rip)
	jmp	.LBB102_680
.LBB102_106:                            # %if.end327
	incl	EdgeProfCounters+14176(%rip)
	movzbl	367(%rsp), %eax
	cmpl	$49, %eax
	je	.LBB102_108
# BB#107:                               # %if.then331
	incl	EdgeProfCounters+14184(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+14192(%rip)
	jmp	.LBB102_680
.LBB102_606:                            # %if.end2999
	incl	EdgeProfCounters+17008(%rip)
	incl	EdgeProfCounters+17016(%rip)
.LBB102_607:                            # %sw.bb3000
	movq	368(%rsp), %rax
	movl	$43, 8(%rax)
	incl	EdgeProfCounters+17020(%rip)
	jmp	.LBB102_608
.LBB102_612:                            # %if.end3024.if.end3051_crit_edge
                                        #   in Loop: Header=BB102_608 Depth=1
	incl	EdgeProfCounters+17052(%rip)
	incl	EdgeProfCounters+17060(%rip)
.LBB102_608:                            # %while.body3003
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_614
# BB#609:                               # %if.end3018
                                        #   in Loop: Header=BB102_608 Depth=1
	incl	EdgeProfCounters+17028(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_610
# BB#611:                               # %if.end3024
                                        #   in Loop: Header=BB102_608 Depth=1
	incl	EdgeProfCounters+17040(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_612
# BB#613:                               # %if.then3047
                                        #   in Loop: Header=BB102_608 Depth=1
	incl	EdgeProfCounters+17048(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+17056(%rip)
	incl	EdgeProfCounters+17060(%rip)
	jmp	.LBB102_608
.LBB102_614:                            # %while.end3052
	incl	EdgeProfCounters+17024(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 40(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	40(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+17032(%rip)
	movzbl	367(%rsp), %eax
	cmpl	$69, %eax
	je	.LBB102_616
# BB#615:                               # %if.then3056
	incl	EdgeProfCounters+17064(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+17072(%rip)
	jmp	.LBB102_680
.LBB102_610:                            # %if.then3023
	incl	EdgeProfCounters+17036(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+17044(%rip)
	jmp	.LBB102_680
.LBB102_118:                            # %if.end388
	incl	EdgeProfCounters+14248(%rip)
	incl	EdgeProfCounters+14256(%rip)
.LBB102_119:                            # %sw.bb389
	movq	368(%rsp), %rax
	movl	$16, 8(%rax)
	incl	EdgeProfCounters+14260(%rip)
	jmp	.LBB102_120
.LBB102_124:                            # %if.end411.if.end438_crit_edge
                                        #   in Loop: Header=BB102_120 Depth=1
	incl	EdgeProfCounters+14292(%rip)
	incl	EdgeProfCounters+14300(%rip)
.LBB102_120:                            # %while.body391
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_126
# BB#121:                               # %if.end405
                                        #   in Loop: Header=BB102_120 Depth=1
	incl	EdgeProfCounters+14268(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_122
# BB#123:                               # %if.end411
                                        #   in Loop: Header=BB102_120 Depth=1
	incl	EdgeProfCounters+14280(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_124
# BB#125:                               # %if.then434
                                        #   in Loop: Header=BB102_120 Depth=1
	incl	EdgeProfCounters+14288(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+14296(%rip)
	incl	EdgeProfCounters+14300(%rip)
	jmp	.LBB102_120
.LBB102_126:                            # %while.end439
	incl	EdgeProfCounters+14264(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 204(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	204(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+14272(%rip)
	movzbl	367(%rsp), %eax
	cmpl	$89, %eax
	je	.LBB102_128
# BB#127:                               # %if.then443
	incl	EdgeProfCounters+14304(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+14312(%rip)
	jmp	.LBB102_680
.LBB102_122:                            # %if.then410
	incl	EdgeProfCounters+14276(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+14284(%rip)
	jmp	.LBB102_680
.LBB102_261:                            # %while.end1211.if.end1221_crit_edge
	incl	EdgeProfCounters+15104(%rip)
.LBB102_263:                            # %for.inc1222
	incl	EdgeProfCounters+15112(%rip)
	incl	336(%rsp)
	incl	EdgeProfCounters+15116(%rip)
.LBB102_251:                            # %for.cond1157
	cmpl	$15, 336(%rsp)
	jg	.LBB102_264
# BB#252:                               # %for.body1160
	incl	EdgeProfCounters+15044(%rip)
	incl	EdgeProfCounters+15052(%rip)
	jmp	.LBB102_253
.LBB102_278:                            # %lor.lhs.false1287
	incl	EdgeProfCounters+15196(%rip)
	cmpl	$7, 324(%rsp)
	jl	.LBB102_281
# BB#279:                               # %lor.lhs.false1287.if.then1290_crit_edge
	incl	EdgeProfCounters+15200(%rip)
.LBB102_280:                            # %if.then1290
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+15208(%rip)
	jmp	.LBB102_680
.LBB102_393:                            # %if.end1847
	incl	EdgeProfCounters+15872(%rip)
	movslq	276(%rsp), %rax
	movq	248(%rsp), %rcx
	movl	272(%rsp), %edx
	cmpl	(%rcx,%rax,4), %edx
	jg	.LBB102_394
# BB#403:                               # %while.end1909
	incl	EdgeProfCounters+15880(%rip)
	incl	EdgeProfCounters+15888(%rip)
	movslq	276(%rsp), %rax
	movq	240(%rsp), %rcx
	movl	272(%rsp), %edx
	cmpl	(%rcx,%rax,4), %edx
	js	.LBB102_404
# BB#405:                               # %lor.lhs.false1915
	incl	EdgeProfCounters+15948(%rip)
	movslq	276(%rsp), %rax
	movq	240(%rsp), %rcx
	movl	272(%rsp), %edx
	subl	(%rcx,%rax,4), %edx
	cmpl	$258, %edx              # imm = 0x102
	jl	.LBB102_408
# BB#406:                               # %lor.lhs.false1915.if.then1921_crit_edge
	incl	EdgeProfCounters+15952(%rip)
	jmp	.LBB102_407
.LBB102_437:                            # %if.end2042
	incl	EdgeProfCounters+16108(%rip)
	movslq	276(%rsp), %rax
	movq	248(%rsp), %rcx
	movl	272(%rsp), %edx
	cmpl	(%rcx,%rax,4), %edx
	jg	.LBB102_438
# BB#447:                               # %while.end2104
	incl	EdgeProfCounters+16116(%rip)
	incl	EdgeProfCounters+16124(%rip)
	movslq	276(%rsp), %rax
	movq	240(%rsp), %rcx
	movl	272(%rsp), %edx
	cmpl	(%rcx,%rax,4), %edx
	js	.LBB102_448
# BB#449:                               # %lor.lhs.false2110
	incl	EdgeProfCounters+16184(%rip)
	movslq	276(%rsp), %rax
	movq	240(%rsp), %rcx
	movl	272(%rsp), %edx
	subl	(%rcx,%rax,4), %edx
	cmpl	$258, %edx              # imm = 0x102
	jl	.LBB102_452
# BB#450:                               # %lor.lhs.false2110.if.then2116_crit_edge
	incl	EdgeProfCounters+16188(%rip)
	jmp	.LBB102_451
.LBB102_515:                            # %if.end2468
	incl	EdgeProfCounters+16540(%rip)
	movslq	276(%rsp), %rax
	movq	248(%rsp), %rcx
	movl	272(%rsp), %edx
	cmpl	(%rcx,%rax,4), %edx
	jg	.LBB102_516
# BB#525:                               # %while.end2530
	incl	EdgeProfCounters+16548(%rip)
	incl	EdgeProfCounters+16556(%rip)
	movslq	276(%rsp), %rax
	movq	240(%rsp), %rcx
	movl	272(%rsp), %edx
	cmpl	(%rcx,%rax,4), %edx
	js	.LBB102_526
# BB#527:                               # %lor.lhs.false2536
	incl	EdgeProfCounters+16616(%rip)
	movslq	276(%rsp), %rax
	movq	240(%rsp), %rcx
	movl	272(%rsp), %edx
	subl	(%rcx,%rax,4), %edx
	cmpl	$258, %edx              # imm = 0x102
	jl	.LBB102_530
# BB#528:                               # %lor.lhs.false2536.if.then2542_crit_edge
	incl	EdgeProfCounters+16620(%rip)
	jmp	.LBB102_529
.LBB102_64:                             # %if.end117
	incl	EdgeProfCounters+13940(%rip)
	incl	EdgeProfCounters+13948(%rip)
.LBB102_65:                             # %sw.bb118
	movq	368(%rsp), %rax
	movl	$12, 8(%rax)
	incl	EdgeProfCounters+13952(%rip)
	jmp	.LBB102_66
.LBB102_70:                             # %if.end140.if.end167_crit_edge
                                        #   in Loop: Header=BB102_66 Depth=1
	incl	EdgeProfCounters+13984(%rip)
	incl	EdgeProfCounters+13992(%rip)
.LBB102_66:                             # %while.body120
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_72
# BB#67:                                # %if.end134
                                        #   in Loop: Header=BB102_66 Depth=1
	incl	EdgeProfCounters+13960(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_68
# BB#69:                                # %if.end140
                                        #   in Loop: Header=BB102_66 Depth=1
	incl	EdgeProfCounters+13972(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_70
# BB#71:                                # %if.then163
                                        #   in Loop: Header=BB102_66 Depth=1
	incl	EdgeProfCounters+13980(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+13988(%rip)
	incl	EdgeProfCounters+13992(%rip)
	jmp	.LBB102_66
.LBB102_72:                             # %while.end168
	incl	EdgeProfCounters+13956(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 220(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	220(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+13964(%rip)
	movzbl	367(%rsp), %eax
	cmpl	$104, %eax
	je	.LBB102_74
# BB#73:                                # %if.then172
	incl	EdgeProfCounters+13996(%rip)
	movl	$-5, 360(%rsp)
	incl	EdgeProfCounters+14004(%rip)
	jmp	.LBB102_680
.LBB102_68:                             # %if.then139
	incl	EdgeProfCounters+13968(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+13976(%rip)
	jmp	.LBB102_680
.LBB102_616:                            # %if.end3057
	incl	EdgeProfCounters+17068(%rip)
	incl	EdgeProfCounters+17076(%rip)
.LBB102_617:                            # %sw.bb3058
	movq	368(%rsp), %rax
	movl	$44, 8(%rax)
	incl	EdgeProfCounters+17080(%rip)
	jmp	.LBB102_618
.LBB102_622:                            # %if.end3082.if.end3109_crit_edge
                                        #   in Loop: Header=BB102_618 Depth=1
	incl	EdgeProfCounters+17112(%rip)
	incl	EdgeProfCounters+17120(%rip)
.LBB102_618:                            # %while.body3061
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_624
# BB#619:                               # %if.end3076
                                        #   in Loop: Header=BB102_618 Depth=1
	incl	EdgeProfCounters+17088(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_620
# BB#621:                               # %if.end3082
                                        #   in Loop: Header=BB102_618 Depth=1
	incl	EdgeProfCounters+17100(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_622
# BB#623:                               # %if.then3105
                                        #   in Loop: Header=BB102_618 Depth=1
	incl	EdgeProfCounters+17108(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+17116(%rip)
	incl	EdgeProfCounters+17120(%rip)
	jmp	.LBB102_618
.LBB102_624:                            # %while.end3110
	incl	EdgeProfCounters+17084(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 36(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	36(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+17092(%rip)
	movzbl	367(%rsp), %eax
	cmpl	$56, %eax
	je	.LBB102_626
# BB#625:                               # %if.then3114
	incl	EdgeProfCounters+17124(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+17132(%rip)
	jmp	.LBB102_680
.LBB102_620:                            # %if.then3081
	incl	EdgeProfCounters+17096(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+17104(%rip)
	jmp	.LBB102_680
.LBB102_128:                            # %if.end444
	incl	EdgeProfCounters+14308(%rip)
	incl	EdgeProfCounters+14316(%rip)
.LBB102_129:                            # %sw.bb445
	movq	368(%rsp), %rax
	movl	$17, 8(%rax)
	incl	EdgeProfCounters+14320(%rip)
	jmp	.LBB102_130
.LBB102_134:                            # %if.end467.if.end494_crit_edge
                                        #   in Loop: Header=BB102_130 Depth=1
	incl	EdgeProfCounters+14352(%rip)
	incl	EdgeProfCounters+14360(%rip)
.LBB102_130:                            # %while.body447
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_136
# BB#131:                               # %if.end461
                                        #   in Loop: Header=BB102_130 Depth=1
	incl	EdgeProfCounters+14328(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_132
# BB#133:                               # %if.end467
                                        #   in Loop: Header=BB102_130 Depth=1
	incl	EdgeProfCounters+14340(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_134
# BB#135:                               # %if.then490
                                        #   in Loop: Header=BB102_130 Depth=1
	incl	EdgeProfCounters+14348(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+14356(%rip)
	incl	EdgeProfCounters+14360(%rip)
	jmp	.LBB102_130
.LBB102_136:                            # %while.end495
	incl	EdgeProfCounters+14324(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 200(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	200(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+14332(%rip)
	movzbl	367(%rsp), %eax
	cmpl	$38, %eax
	je	.LBB102_138
# BB#137:                               # %if.then499
	incl	EdgeProfCounters+14364(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+14372(%rip)
	jmp	.LBB102_680
.LBB102_132:                            # %if.then466
	incl	EdgeProfCounters+14336(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+14344(%rip)
	jmp	.LBB102_680
.LBB102_74:                             # %if.end173
	incl	EdgeProfCounters+14000(%rip)
	incl	EdgeProfCounters+14008(%rip)
.LBB102_75:                             # %sw.bb174
	movq	368(%rsp), %rax
	movl	$13, 8(%rax)
	incl	EdgeProfCounters+14012(%rip)
	jmp	.LBB102_76
.LBB102_80:                             # %if.end195.if.end222_crit_edge
                                        #   in Loop: Header=BB102_76 Depth=1
	incl	EdgeProfCounters+14044(%rip)
	incl	EdgeProfCounters+14052(%rip)
.LBB102_76:                             # %while.body176
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_82
# BB#77:                                # %if.end189
                                        #   in Loop: Header=BB102_76 Depth=1
	incl	EdgeProfCounters+14020(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_78
# BB#79:                                # %if.end195
                                        #   in Loop: Header=BB102_76 Depth=1
	incl	EdgeProfCounters+14032(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_80
# BB#81:                                # %if.then218
                                        #   in Loop: Header=BB102_76 Depth=1
	incl	EdgeProfCounters+14040(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+14048(%rip)
	incl	EdgeProfCounters+14052(%rip)
	jmp	.LBB102_76
.LBB102_82:                             # %while.end223
	incl	EdgeProfCounters+14016(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 216(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movq	368(%rsp), %rax
	movl	216(%rsp), %ecx
	movl	%ecx, 40(%rax)
	incl	EdgeProfCounters+14024(%rip)
	movq	368(%rsp), %rax
	cmpl	$48, 40(%rax)
	jg	.LBB102_84
# BB#83:                                # %while.end223.if.then230_crit_edge
	incl	EdgeProfCounters+14056(%rip)
	jmp	.LBB102_86
.LBB102_78:                             # %if.then194
	incl	EdgeProfCounters+14028(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+14036(%rip)
	jmp	.LBB102_680
.LBB102_626:                            # %if.end3115
	incl	EdgeProfCounters+17128(%rip)
	incl	EdgeProfCounters+17136(%rip)
.LBB102_627:                            # %sw.bb3116
	movq	368(%rsp), %rax
	movl	$45, 8(%rax)
	incl	EdgeProfCounters+17140(%rip)
	jmp	.LBB102_628
.LBB102_632:                            # %if.end3140.if.end3167_crit_edge
                                        #   in Loop: Header=BB102_628 Depth=1
	incl	EdgeProfCounters+17172(%rip)
	incl	EdgeProfCounters+17180(%rip)
.LBB102_628:                            # %while.body3119
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_634
# BB#629:                               # %if.end3134
                                        #   in Loop: Header=BB102_628 Depth=1
	incl	EdgeProfCounters+17148(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_630
# BB#631:                               # %if.end3140
                                        #   in Loop: Header=BB102_628 Depth=1
	incl	EdgeProfCounters+17160(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_632
# BB#633:                               # %if.then3163
                                        #   in Loop: Header=BB102_628 Depth=1
	incl	EdgeProfCounters+17168(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+17176(%rip)
	incl	EdgeProfCounters+17180(%rip)
	jmp	.LBB102_628
.LBB102_634:                            # %while.end3168
	incl	EdgeProfCounters+17144(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 32(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	32(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+17152(%rip)
	movzbl	367(%rsp), %eax
	cmpl	$80, %eax
	je	.LBB102_636
# BB#635:                               # %if.then3172
	incl	EdgeProfCounters+17184(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+17192(%rip)
	jmp	.LBB102_680
.LBB102_630:                            # %if.then3139
	incl	EdgeProfCounters+17156(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+17164(%rip)
	jmp	.LBB102_680
.LBB102_138:                            # %if.end500
	incl	EdgeProfCounters+14368(%rip)
	incl	EdgeProfCounters+14376(%rip)
.LBB102_139:                            # %sw.bb501
	movq	368(%rsp), %rax
	movl	$18, 8(%rax)
	incl	EdgeProfCounters+14380(%rip)
	jmp	.LBB102_140
.LBB102_144:                            # %if.end523.if.end550_crit_edge
                                        #   in Loop: Header=BB102_140 Depth=1
	incl	EdgeProfCounters+14412(%rip)
	incl	EdgeProfCounters+14420(%rip)
.LBB102_140:                            # %while.body503
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_146
# BB#141:                               # %if.end517
                                        #   in Loop: Header=BB102_140 Depth=1
	incl	EdgeProfCounters+14388(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_142
# BB#143:                               # %if.end523
                                        #   in Loop: Header=BB102_140 Depth=1
	incl	EdgeProfCounters+14400(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_144
# BB#145:                               # %if.then546
                                        #   in Loop: Header=BB102_140 Depth=1
	incl	EdgeProfCounters+14408(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+14416(%rip)
	incl	EdgeProfCounters+14420(%rip)
	jmp	.LBB102_140
.LBB102_146:                            # %while.end551
	incl	EdgeProfCounters+14384(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 196(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	196(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+14392(%rip)
	movzbl	367(%rsp), %eax
	cmpl	$83, %eax
	je	.LBB102_148
# BB#147:                               # %if.then555
	incl	EdgeProfCounters+14424(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+14432(%rip)
	jmp	.LBB102_680
.LBB102_142:                            # %if.then522
	incl	EdgeProfCounters+14396(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+14404(%rip)
	jmp	.LBB102_680
.LBB102_84:                             # %lor.lhs.false
	incl	EdgeProfCounters+14060(%rip)
	movq	368(%rsp), %rax
	cmpl	$58, 40(%rax)
	jl	.LBB102_87
# BB#85:                                # %lor.lhs.false.if.then230_crit_edge
	incl	EdgeProfCounters+14064(%rip)
.LBB102_86:                             # %if.then230
	movl	$-5, 360(%rsp)
	incl	EdgeProfCounters+14072(%rip)
	jmp	.LBB102_680
.LBB102_636:                            # %if.end3173
	incl	EdgeProfCounters+17188(%rip)
	incl	EdgeProfCounters+17196(%rip)
.LBB102_637:                            # %sw.bb3174
	movq	368(%rsp), %rax
	movl	$46, 8(%rax)
	incl	EdgeProfCounters+17200(%rip)
	jmp	.LBB102_638
.LBB102_642:                            # %if.end3198.if.end3225_crit_edge
                                        #   in Loop: Header=BB102_638 Depth=1
	incl	EdgeProfCounters+17232(%rip)
	incl	EdgeProfCounters+17240(%rip)
.LBB102_638:                            # %while.body3177
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_644
# BB#639:                               # %if.end3192
                                        #   in Loop: Header=BB102_638 Depth=1
	incl	EdgeProfCounters+17208(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_640
# BB#641:                               # %if.end3198
                                        #   in Loop: Header=BB102_638 Depth=1
	incl	EdgeProfCounters+17220(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_642
# BB#643:                               # %if.then3221
                                        #   in Loop: Header=BB102_638 Depth=1
	incl	EdgeProfCounters+17228(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+17236(%rip)
	incl	EdgeProfCounters+17240(%rip)
	jmp	.LBB102_638
.LBB102_644:                            # %while.end3226
	incl	EdgeProfCounters+17204(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 28(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	28(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+17212(%rip)
	movzbl	367(%rsp), %eax
	cmpl	$144, %eax
	je	.LBB102_646
# BB#645:                               # %if.then3230
	incl	EdgeProfCounters+17244(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+17252(%rip)
	jmp	.LBB102_680
.LBB102_640:                            # %if.then3197
	incl	EdgeProfCounters+17216(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+17224(%rip)
	jmp	.LBB102_680
.LBB102_148:                            # %if.end556
	incl	EdgeProfCounters+14428(%rip)
	incl	EdgeProfCounters+14436(%rip)
.LBB102_149:                            # %sw.bb557
	movq	368(%rsp), %rax
	movl	$19, 8(%rax)
	incl	EdgeProfCounters+14440(%rip)
	jmp	.LBB102_150
.LBB102_154:                            # %if.end579.if.end606_crit_edge
                                        #   in Loop: Header=BB102_150 Depth=1
	incl	EdgeProfCounters+14472(%rip)
	incl	EdgeProfCounters+14480(%rip)
.LBB102_150:                            # %while.body559
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_156
# BB#151:                               # %if.end573
                                        #   in Loop: Header=BB102_150 Depth=1
	incl	EdgeProfCounters+14448(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_152
# BB#153:                               # %if.end579
                                        #   in Loop: Header=BB102_150 Depth=1
	incl	EdgeProfCounters+14460(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_154
# BB#155:                               # %if.then602
                                        #   in Loop: Header=BB102_150 Depth=1
	incl	EdgeProfCounters+14468(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+14476(%rip)
	incl	EdgeProfCounters+14480(%rip)
	jmp	.LBB102_150
.LBB102_156:                            # %while.end607
	incl	EdgeProfCounters+14444(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 192(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	192(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+14452(%rip)
	movzbl	367(%rsp), %eax
	cmpl	$89, %eax
	je	.LBB102_158
# BB#157:                               # %if.then611
	incl	EdgeProfCounters+14484(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+14492(%rip)
	jmp	.LBB102_680
.LBB102_152:                            # %if.then578
	incl	EdgeProfCounters+14456(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+14464(%rip)
	jmp	.LBB102_680
.LBB102_646:                            # %if.end3231
	incl	EdgeProfCounters+17248(%rip)
	movq	368(%rsp), %rax
	movl	$0, 3180(%rax)
	incl	EdgeProfCounters+17256(%rip)
.LBB102_647:                            # %sw.bb3232
	movq	368(%rsp), %rax
	movl	$47, 8(%rax)
	incl	EdgeProfCounters+17260(%rip)
	jmp	.LBB102_648
.LBB102_652:                            # %if.end3256.if.end3283_crit_edge
                                        #   in Loop: Header=BB102_648 Depth=1
	incl	EdgeProfCounters+17292(%rip)
	incl	EdgeProfCounters+17300(%rip)
.LBB102_648:                            # %while.body3235
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_654
# BB#649:                               # %if.end3250
                                        #   in Loop: Header=BB102_648 Depth=1
	incl	EdgeProfCounters+17268(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_650
# BB#651:                               # %if.end3256
                                        #   in Loop: Header=BB102_648 Depth=1
	incl	EdgeProfCounters+17280(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_652
# BB#653:                               # %if.then3279
                                        #   in Loop: Header=BB102_648 Depth=1
	incl	EdgeProfCounters+17288(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+17296(%rip)
	incl	EdgeProfCounters+17300(%rip)
	jmp	.LBB102_648
.LBB102_654:                            # %while.end3284
	incl	EdgeProfCounters+17264(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 24(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	24(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+17272(%rip)
	movq	368(%rsp), %rax
	movl	3180(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 3180(%rax)
	incl	EdgeProfCounters+17304(%rip)
.LBB102_655:                            # %sw.bb3290
	movq	368(%rsp), %rax
	movl	$48, 8(%rax)
	incl	EdgeProfCounters+17308(%rip)
	jmp	.LBB102_656
.LBB102_660:                            # %if.end3314.if.end3341_crit_edge
                                        #   in Loop: Header=BB102_656 Depth=1
	incl	EdgeProfCounters+17340(%rip)
	incl	EdgeProfCounters+17348(%rip)
.LBB102_656:                            # %while.body3293
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_662
# BB#657:                               # %if.end3308
                                        #   in Loop: Header=BB102_656 Depth=1
	incl	EdgeProfCounters+17316(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_658
# BB#659:                               # %if.end3314
                                        #   in Loop: Header=BB102_656 Depth=1
	incl	EdgeProfCounters+17328(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_660
# BB#661:                               # %if.then3337
                                        #   in Loop: Header=BB102_656 Depth=1
	incl	EdgeProfCounters+17336(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+17344(%rip)
	incl	EdgeProfCounters+17348(%rip)
	jmp	.LBB102_656
.LBB102_662:                            # %while.end3342
	incl	EdgeProfCounters+17312(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 20(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	20(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+17320(%rip)
	movq	368(%rsp), %rax
	movl	3180(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 3180(%rax)
	incl	EdgeProfCounters+17352(%rip)
.LBB102_663:                            # %sw.bb3348
	movq	368(%rsp), %rax
	movl	$49, 8(%rax)
	incl	EdgeProfCounters+17356(%rip)
	jmp	.LBB102_664
.LBB102_668:                            # %if.end3372.if.end3399_crit_edge
                                        #   in Loop: Header=BB102_664 Depth=1
	incl	EdgeProfCounters+17388(%rip)
	incl	EdgeProfCounters+17396(%rip)
.LBB102_664:                            # %while.body3351
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_670
# BB#665:                               # %if.end3366
                                        #   in Loop: Header=BB102_664 Depth=1
	incl	EdgeProfCounters+17364(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_666
# BB#667:                               # %if.end3372
                                        #   in Loop: Header=BB102_664 Depth=1
	incl	EdgeProfCounters+17376(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_668
# BB#669:                               # %if.then3395
                                        #   in Loop: Header=BB102_664 Depth=1
	incl	EdgeProfCounters+17384(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+17392(%rip)
	incl	EdgeProfCounters+17396(%rip)
	jmp	.LBB102_664
.LBB102_670:                            # %while.end3400
	incl	EdgeProfCounters+17360(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 16(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	16(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+17368(%rip)
	movq	368(%rsp), %rax
	movl	3180(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 3180(%rax)
	incl	EdgeProfCounters+17400(%rip)
.LBB102_671:                            # %sw.bb3406
	movq	368(%rsp), %rax
	movl	$50, 8(%rax)
	incl	EdgeProfCounters+17404(%rip)
	jmp	.LBB102_672
.LBB102_676:                            # %if.end3430.if.end3457_crit_edge
                                        #   in Loop: Header=BB102_672 Depth=1
	incl	EdgeProfCounters+17436(%rip)
	incl	EdgeProfCounters+17444(%rip)
.LBB102_672:                            # %while.body3409
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_678
# BB#673:                               # %if.end3424
                                        #   in Loop: Header=BB102_672 Depth=1
	incl	EdgeProfCounters+17412(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_674
# BB#675:                               # %if.end3430
                                        #   in Loop: Header=BB102_672 Depth=1
	incl	EdgeProfCounters+17424(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_676
# BB#677:                               # %if.then3453
                                        #   in Loop: Header=BB102_672 Depth=1
	incl	EdgeProfCounters+17432(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+17440(%rip)
	incl	EdgeProfCounters+17444(%rip)
	jmp	.LBB102_672
.LBB102_678:                            # %while.end3458
	incl	EdgeProfCounters+17408(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 12(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	12(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+17416(%rip)
	movq	368(%rsp), %rax
	movl	3180(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 3180(%rax)
	movq	368(%rsp), %rax
	movl	$1, 8(%rax)
	movl	$4, 360(%rsp)
	incl	EdgeProfCounters+17448(%rip)
	jmp	.LBB102_680
.LBB102_666:                            # %if.then3371
	incl	EdgeProfCounters+17372(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+17380(%rip)
	jmp	.LBB102_680
.LBB102_674:                            # %if.then3429
	incl	EdgeProfCounters+17420(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+17428(%rip)
	jmp	.LBB102_680
.LBB102_658:                            # %if.then3313
	incl	EdgeProfCounters+17324(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+17332(%rip)
	jmp	.LBB102_680
.LBB102_650:                            # %if.then3255
	incl	EdgeProfCounters+17276(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+17284(%rip)
	jmp	.LBB102_680
.LBB102_158:                            # %if.end612
	incl	EdgeProfCounters+14488(%rip)
	movq	368(%rsp), %rax
	incl	48(%rax)
	movq	368(%rsp), %rax
	cmpl	$1, 52(%rax)
	jle	.LBB102_159
# BB#160:                               # %if.then616
	incl	EdgeProfCounters+14496(%rip)
	movq	368(%rsp), %rax
	movl	48(%rax), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str163, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+14504(%rip)
	jmp	.LBB102_161
.LBB102_290:                            # %if.then1344
	incl	EdgeProfCounters+15260(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+15268(%rip)
	jmp	.LBB102_680
.LBB102_306:                            # %for.inc1417
	incl	EdgeProfCounters+15336(%rip)
	incl	EdgeProfCounters+15344(%rip)
	movq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movb	336(%rsp), %dl
	movb	%dl, 25886(%rax,%rcx)
	incl	EdgeProfCounters+15364(%rip)
	incl	340(%rsp)
	incl	EdgeProfCounters+15368(%rip)
.LBB102_292:                            # %for.cond1346
	movl	340(%rsp), %eax
	cmpl	320(%rsp), %eax
	jge	.LBB102_307
# BB#293:                               # %for.body1349
	incl	EdgeProfCounters+15276(%rip)
	movl	$0, 336(%rsp)
	incl	EdgeProfCounters+15284(%rip)
	jmp	.LBB102_294
.LBB102_354:                            # %for.inc1653
	incl	EdgeProfCounters+15572(%rip)
	incl	EdgeProfCounters+15580(%rip)
	movslq	332(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movb	284(%rsp), %dl
	movb	%dl, 43888(%rcx,%rax)
	incl	EdgeProfCounters+15652(%rip)
	incl	340(%rsp)
	incl	EdgeProfCounters+15656(%rip)
.LBB102_327:                            # %for.cond1515
	movl	340(%rsp), %eax
	cmpl	328(%rsp), %eax
	jge	.LBB102_355
# BB#328:                               # %for.body1518
	incl	EdgeProfCounters+15492(%rip)
	incl	EdgeProfCounters+15500(%rip)
	jmp	.LBB102_329
.LBB102_355:                            # %for.inc1656
	incl	EdgeProfCounters+15496(%rip)
	incl	EdgeProfCounters+15660(%rip)
	incl	332(%rsp)
	incl	EdgeProfCounters+15664(%rip)
	jmp	.LBB102_317
.LBB102_352:                            # %if.then1642
	incl	EdgeProfCounters+15632(%rip)
	incl	284(%rsp)
	incl	EdgeProfCounters+15640(%rip)
	incl	EdgeProfCounters+15648(%rip)
.LBB102_329:                            # %while.body1520
	cmpl	$0, 284(%rsp)
	jle	.LBB102_330
# BB#331:                               # %lor.lhs.false1523
	incl	EdgeProfCounters+15508(%rip)
	cmpl	$21, 284(%rsp)
	jl	.LBB102_334
# BB#332:                               # %lor.lhs.false1523.if.then1526_crit_edge
	incl	EdgeProfCounters+15512(%rip)
	jmp	.LBB102_333
.LBB102_305:                            # %if.end1412
	incl	EdgeProfCounters+15352(%rip)
	incl	EdgeProfCounters+15360(%rip)
.LBB102_294:                            # %while.body1350
	incl	EdgeProfCounters+15288(%rip)
	jmp	.LBB102_295
.LBB102_108:                            # %if.end332
	incl	EdgeProfCounters+14188(%rip)
	incl	EdgeProfCounters+14196(%rip)
	jmp	.LBB102_109
.LBB102_281:                            # %if.end1291
	incl	EdgeProfCounters+15204(%rip)
	incl	EdgeProfCounters+15212(%rip)
	jmp	.LBB102_282
.LBB102_394:                            # %if.end1853
	incl	EdgeProfCounters+15884(%rip)
	incl	276(%rsp)
	incl	EdgeProfCounters+15892(%rip)
	jmp	.LBB102_395
.LBB102_438:                            # %if.end2048
	incl	EdgeProfCounters+16120(%rip)
	incl	276(%rsp)
	incl	EdgeProfCounters+16128(%rip)
	jmp	.LBB102_439
.LBB102_516:                            # %if.end2474
	incl	EdgeProfCounters+16552(%rip)
	incl	276(%rsp)
	incl	EdgeProfCounters+16560(%rip)
	jmp	.LBB102_517
.LBB102_87:                             # %if.end231
	incl	EdgeProfCounters+14068(%rip)
	movq	368(%rsp), %rax
	addl	$-48, 40(%rax)
	movq	368(%rsp), %rax
	cmpb	$0, 44(%rax)
	je	.LBB102_94
# BB#88:                                # %if.then234
	incl	EdgeProfCounters+14076(%rip)
	movq	344(%rsp), %rax
	movq	72(%rax), %rdi
	movq	368(%rsp), %rcx
	imull	$100000, 40(%rcx), %esi # imm = 0x186A0
	addl	%esi, %esi
	movl	$1, %edx
	callq	*56(%rax)
	movq	368(%rsp), %rcx
	movq	%rax, 3160(%rcx)
	movq	344(%rsp), %rax
	movq	72(%rax), %rdi
	movq	368(%rsp), %rcx
	imull	$100000, 40(%rcx), %esi # imm = 0x186A0
	sarl	%esi
	movl	$1, %edx
	callq	*56(%rax)
	movq	368(%rsp), %rcx
	movq	%rax, 3168(%rcx)
	movq	368(%rsp), %rax
	cmpq	$0, 3160(%rax)
	je	.LBB102_89
# BB#90:                                # %lor.lhs.false252
	incl	EdgeProfCounters+14088(%rip)
	movq	368(%rsp), %rax
	cmpq	$0, 3168(%rax)
	je	.LBB102_91
# BB#93:                                # %if.end257
	incl	EdgeProfCounters+14096(%rip)
	incl	EdgeProfCounters+14104(%rip)
	jmp	.LBB102_97
.LBB102_159:                            # %if.end612.if.end619_crit_edge
	incl	EdgeProfCounters+14500(%rip)
.LBB102_161:                            # %if.end619
	movq	368(%rsp), %rax
	movl	$0, 3176(%rax)
	incl	EdgeProfCounters+14508(%rip)
.LBB102_162:                            # %sw.bb620
	movq	368(%rsp), %rax
	movl	$20, 8(%rax)
	incl	EdgeProfCounters+14512(%rip)
	jmp	.LBB102_163
.LBB102_167:                            # %if.end642.if.end669_crit_edge
                                        #   in Loop: Header=BB102_163 Depth=1
	incl	EdgeProfCounters+14544(%rip)
	incl	EdgeProfCounters+14552(%rip)
.LBB102_163:                            # %while.body622
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_169
# BB#164:                               # %if.end636
                                        #   in Loop: Header=BB102_163 Depth=1
	incl	EdgeProfCounters+14520(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_165
# BB#166:                               # %if.end642
                                        #   in Loop: Header=BB102_163 Depth=1
	incl	EdgeProfCounters+14532(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_167
# BB#168:                               # %if.then665
                                        #   in Loop: Header=BB102_163 Depth=1
	incl	EdgeProfCounters+14540(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+14548(%rip)
	incl	EdgeProfCounters+14552(%rip)
	jmp	.LBB102_163
.LBB102_169:                            # %while.end670
	incl	EdgeProfCounters+14516(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 188(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	188(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+14524(%rip)
	movq	368(%rsp), %rax
	movl	3176(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 3176(%rax)
	incl	EdgeProfCounters+14556(%rip)
.LBB102_170:                            # %sw.bb676
	movq	368(%rsp), %rax
	movl	$21, 8(%rax)
	incl	EdgeProfCounters+14560(%rip)
	jmp	.LBB102_171
.LBB102_175:                            # %if.end698.if.end725_crit_edge
                                        #   in Loop: Header=BB102_171 Depth=1
	incl	EdgeProfCounters+14592(%rip)
	incl	EdgeProfCounters+14600(%rip)
.LBB102_171:                            # %while.body678
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_177
# BB#172:                               # %if.end692
                                        #   in Loop: Header=BB102_171 Depth=1
	incl	EdgeProfCounters+14568(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_173
# BB#174:                               # %if.end698
                                        #   in Loop: Header=BB102_171 Depth=1
	incl	EdgeProfCounters+14580(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_175
# BB#176:                               # %if.then721
                                        #   in Loop: Header=BB102_171 Depth=1
	incl	EdgeProfCounters+14588(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+14596(%rip)
	incl	EdgeProfCounters+14600(%rip)
	jmp	.LBB102_171
.LBB102_177:                            # %while.end726
	incl	EdgeProfCounters+14564(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 184(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	184(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+14572(%rip)
	movq	368(%rsp), %rax
	movl	3176(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 3176(%rax)
	incl	EdgeProfCounters+14604(%rip)
.LBB102_178:                            # %sw.bb732
	movq	368(%rsp), %rax
	movl	$22, 8(%rax)
	incl	EdgeProfCounters+14608(%rip)
	jmp	.LBB102_179
.LBB102_183:                            # %if.end754.if.end781_crit_edge
                                        #   in Loop: Header=BB102_179 Depth=1
	incl	EdgeProfCounters+14640(%rip)
	incl	EdgeProfCounters+14648(%rip)
.LBB102_179:                            # %while.body734
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_185
# BB#180:                               # %if.end748
                                        #   in Loop: Header=BB102_179 Depth=1
	incl	EdgeProfCounters+14616(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_181
# BB#182:                               # %if.end754
                                        #   in Loop: Header=BB102_179 Depth=1
	incl	EdgeProfCounters+14628(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_183
# BB#184:                               # %if.then777
                                        #   in Loop: Header=BB102_179 Depth=1
	incl	EdgeProfCounters+14636(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+14644(%rip)
	incl	EdgeProfCounters+14648(%rip)
	jmp	.LBB102_179
.LBB102_185:                            # %while.end782
	incl	EdgeProfCounters+14612(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 180(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	180(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+14620(%rip)
	movq	368(%rsp), %rax
	movl	3176(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 3176(%rax)
	incl	EdgeProfCounters+14652(%rip)
.LBB102_186:                            # %sw.bb788
	movq	368(%rsp), %rax
	movl	$23, 8(%rax)
	incl	EdgeProfCounters+14656(%rip)
	jmp	.LBB102_187
.LBB102_191:                            # %if.end810.if.end837_crit_edge
                                        #   in Loop: Header=BB102_187 Depth=1
	incl	EdgeProfCounters+14688(%rip)
	incl	EdgeProfCounters+14696(%rip)
.LBB102_187:                            # %while.body790
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_193
# BB#188:                               # %if.end804
                                        #   in Loop: Header=BB102_187 Depth=1
	incl	EdgeProfCounters+14664(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_189
# BB#190:                               # %if.end810
                                        #   in Loop: Header=BB102_187 Depth=1
	incl	EdgeProfCounters+14676(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_191
# BB#192:                               # %if.then833
                                        #   in Loop: Header=BB102_187 Depth=1
	incl	EdgeProfCounters+14684(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+14692(%rip)
	incl	EdgeProfCounters+14696(%rip)
	jmp	.LBB102_187
.LBB102_193:                            # %while.end838
	incl	EdgeProfCounters+14660(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 176(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	176(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+14668(%rip)
	movq	368(%rsp), %rax
	movl	3176(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 3176(%rax)
	incl	EdgeProfCounters+14700(%rip)
.LBB102_194:                            # %sw.bb844
	movq	368(%rsp), %rax
	movl	$24, 8(%rax)
	incl	EdgeProfCounters+14704(%rip)
	jmp	.LBB102_195
.LBB102_199:                            # %if.end866.if.end893_crit_edge
                                        #   in Loop: Header=BB102_195 Depth=1
	incl	EdgeProfCounters+14736(%rip)
	incl	EdgeProfCounters+14744(%rip)
.LBB102_195:                            # %while.body846
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_201
# BB#196:                               # %if.end860
                                        #   in Loop: Header=BB102_195 Depth=1
	incl	EdgeProfCounters+14712(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_197
# BB#198:                               # %if.end866
                                        #   in Loop: Header=BB102_195 Depth=1
	incl	EdgeProfCounters+14724(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_199
# BB#200:                               # %if.then889
                                        #   in Loop: Header=BB102_195 Depth=1
	incl	EdgeProfCounters+14732(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+14740(%rip)
	incl	EdgeProfCounters+14744(%rip)
	jmp	.LBB102_195
.LBB102_201:                            # %while.end894
	incl	EdgeProfCounters+14708(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	decl	%ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	andl	$1, %eax
	movl	%eax, 172(%rsp)
	movq	368(%rsp), %rax
	decl	36(%rax)
	movq	368(%rsp), %rax
	movb	172(%rsp), %cl
	movb	%cl, 20(%rax)
	incl	EdgeProfCounters+14716(%rip)
	movq	368(%rsp), %rax
	movl	$0, 56(%rax)
	incl	EdgeProfCounters+14748(%rip)
.LBB102_202:                            # %sw.bb895
	movq	368(%rsp), %rax
	movl	$25, 8(%rax)
	incl	EdgeProfCounters+14752(%rip)
	jmp	.LBB102_203
.LBB102_207:                            # %if.end917.if.end944_crit_edge
                                        #   in Loop: Header=BB102_203 Depth=1
	incl	EdgeProfCounters+14784(%rip)
	incl	EdgeProfCounters+14792(%rip)
.LBB102_203:                            # %while.body897
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_209
# BB#204:                               # %if.end911
                                        #   in Loop: Header=BB102_203 Depth=1
	incl	EdgeProfCounters+14760(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_205
# BB#206:                               # %if.end917
                                        #   in Loop: Header=BB102_203 Depth=1
	incl	EdgeProfCounters+14772(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_207
# BB#208:                               # %if.then940
                                        #   in Loop: Header=BB102_203 Depth=1
	incl	EdgeProfCounters+14780(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+14788(%rip)
	incl	EdgeProfCounters+14792(%rip)
	jmp	.LBB102_203
.LBB102_197:                            # %if.then865
	incl	EdgeProfCounters+14720(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+14728(%rip)
	jmp	.LBB102_680
.LBB102_209:                            # %while.end945
	incl	EdgeProfCounters+14756(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 168(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	168(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+14764(%rip)
	movq	368(%rsp), %rax
	movl	56(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 56(%rax)
	incl	EdgeProfCounters+14796(%rip)
.LBB102_210:                            # %sw.bb951
	movq	368(%rsp), %rax
	movl	$26, 8(%rax)
	incl	EdgeProfCounters+14800(%rip)
	jmp	.LBB102_211
.LBB102_215:                            # %if.end973.if.end1000_crit_edge
                                        #   in Loop: Header=BB102_211 Depth=1
	incl	EdgeProfCounters+14832(%rip)
	incl	EdgeProfCounters+14840(%rip)
.LBB102_211:                            # %while.body953
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_217
# BB#212:                               # %if.end967
                                        #   in Loop: Header=BB102_211 Depth=1
	incl	EdgeProfCounters+14808(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_213
# BB#214:                               # %if.end973
                                        #   in Loop: Header=BB102_211 Depth=1
	incl	EdgeProfCounters+14820(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_215
# BB#216:                               # %if.then996
                                        #   in Loop: Header=BB102_211 Depth=1
	incl	EdgeProfCounters+14828(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+14836(%rip)
	incl	EdgeProfCounters+14840(%rip)
	jmp	.LBB102_211
.LBB102_205:                            # %if.then916
	incl	EdgeProfCounters+14768(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+14776(%rip)
	jmp	.LBB102_680
.LBB102_217:                            # %while.end1001
	incl	EdgeProfCounters+14804(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 164(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	164(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+14812(%rip)
	movq	368(%rsp), %rax
	movl	56(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 56(%rax)
	incl	EdgeProfCounters+14844(%rip)
.LBB102_218:                            # %sw.bb1007
	movq	368(%rsp), %rax
	movl	$27, 8(%rax)
	incl	EdgeProfCounters+14848(%rip)
	jmp	.LBB102_219
.LBB102_223:                            # %if.end1029.if.end1056_crit_edge
                                        #   in Loop: Header=BB102_219 Depth=1
	incl	EdgeProfCounters+14880(%rip)
	incl	EdgeProfCounters+14888(%rip)
.LBB102_219:                            # %while.body1009
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_225
# BB#220:                               # %if.end1023
                                        #   in Loop: Header=BB102_219 Depth=1
	incl	EdgeProfCounters+14856(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_221
# BB#222:                               # %if.end1029
                                        #   in Loop: Header=BB102_219 Depth=1
	incl	EdgeProfCounters+14868(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_223
# BB#224:                               # %if.then1052
                                        #   in Loop: Header=BB102_219 Depth=1
	incl	EdgeProfCounters+14876(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+14884(%rip)
	incl	EdgeProfCounters+14888(%rip)
	jmp	.LBB102_219
.LBB102_213:                            # %if.then972
	incl	EdgeProfCounters+14816(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+14824(%rip)
	jmp	.LBB102_680
.LBB102_225:                            # %while.end1057
	incl	EdgeProfCounters+14852(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	addl	$-8, %ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	movzbl	%al, %eax
	movl	%eax, 160(%rsp)
	movq	368(%rsp), %rax
	addl	$-8, 36(%rax)
	movb	160(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+14860(%rip)
	movq	368(%rsp), %rax
	movl	56(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 56(%rax)
	movq	368(%rsp), %rax
	cmpl	$0, 56(%rax)
	js	.LBB102_226
# BB#227:                               # %if.end1067
	incl	EdgeProfCounters+14896(%rip)
	movq	368(%rsp), %rcx
	movl	56(%rcx), %eax
	imull	$100000, 40(%rcx), %ecx # imm = 0x186A0
	orl	$10, %ecx
	cmpl	%ecx, %eax
	jle	.LBB102_229
# BB#228:                               # %if.then1074
	incl	EdgeProfCounters+14904(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+14912(%rip)
	jmp	.LBB102_680
.LBB102_221:                            # %if.then1028
	incl	EdgeProfCounters+14864(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+14872(%rip)
	jmp	.LBB102_680
.LBB102_181:                            # %if.then753
	incl	EdgeProfCounters+14624(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+14632(%rip)
	jmp	.LBB102_680
.LBB102_189:                            # %if.then809
	incl	EdgeProfCounters+14672(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+14680(%rip)
	jmp	.LBB102_680
.LBB102_173:                            # %if.then697
	incl	EdgeProfCounters+14576(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+14584(%rip)
	jmp	.LBB102_680
.LBB102_165:                            # %if.then641
	incl	EdgeProfCounters+14528(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+14536(%rip)
	jmp	.LBB102_680
.LBB102_226:                            # %if.then1066
	incl	EdgeProfCounters+14892(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+14900(%rip)
	jmp	.LBB102_680
.LBB102_229:                            # %if.end1075
	incl	EdgeProfCounters+14908(%rip)
	movl	$0, 340(%rsp)
	incl	EdgeProfCounters+14916(%rip)
	jmp	.LBB102_230
.LBB102_307:                            # %for.end1419
	incl	EdgeProfCounters+15280(%rip)
	movb	$0, 132(%rsp)
	incl	EdgeProfCounters+15372(%rip)
	jmp	.LBB102_308
.LBB102_309:                            # %for.inc1429
                                        #   in Loop: Header=BB102_308 Depth=1
	incl	EdgeProfCounters+15376(%rip)
	movzbl	132(%rsp), %eax
	movb	%al, 134(%rsp,%rax)
	incl	EdgeProfCounters+15384(%rip)
	incb	132(%rsp)
	incl	EdgeProfCounters+15388(%rip)
.LBB102_308:                            # %for.cond1422
                                        # =>This Inner Loop Header: Depth=1
	movzbl	132(%rsp), %eax
	cmpl	324(%rsp), %eax
	jl	.LBB102_309
# BB#310:                               # %for.end1431
	incl	EdgeProfCounters+15380(%rip)
	movl	$0, 340(%rsp)
	incl	EdgeProfCounters+15392(%rip)
	jmp	.LBB102_311
.LBB102_315:                            # %for.inc1456
                                        #   in Loop: Header=BB102_311 Depth=1
	incl	EdgeProfCounters+15412(%rip)
	movb	133(%rsp), %al
	movb	%al, 134(%rsp)
	movq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movb	133(%rsp), %dl
	movb	%dl, 7884(%rax,%rcx)
	incl	EdgeProfCounters+15420(%rip)
	incl	340(%rsp)
	incl	EdgeProfCounters+15424(%rip)
.LBB102_311:                            # %for.cond1432
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB102_313 Depth 2
	movl	340(%rsp), %eax
	cmpl	320(%rsp), %eax
	jge	.LBB102_316
# BB#312:                               # %for.body1435
                                        #   in Loop: Header=BB102_311 Depth=1
	incl	EdgeProfCounters+15396(%rip)
	movslq	340(%rsp), %rax
	movq	368(%rsp), %rcx
	movb	25886(%rcx,%rax), %al
	movb	%al, 132(%rsp)
	movzbl	132(%rsp), %eax
	movb	134(%rsp,%rax), %al
	movb	%al, 133(%rsp)
	incl	EdgeProfCounters+15404(%rip)
	jmp	.LBB102_313
	.align	16, 0x90
.LBB102_314:                            # %while.body1444
                                        #   in Loop: Header=BB102_313 Depth=2
	incl	EdgeProfCounters+15408(%rip)
	movzbl	132(%rsp), %eax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movb	134(%rsp,%rcx), %cl
	movb	%cl, 134(%rsp,%rax)
	decb	132(%rsp)
	incl	EdgeProfCounters+15416(%rip)
.LBB102_313:                            # %while.cond
                                        #   Parent Loop BB102_311 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	132(%rsp), %eax
	testl	%eax, %eax
	jle	.LBB102_315
	jmp	.LBB102_314
.LBB102_330:                            # %while.body1520.if.then1526_crit_edge
	incl	EdgeProfCounters+15504(%rip)
.LBB102_333:                            # %if.then1526
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+15520(%rip)
	jmp	.LBB102_680
.LBB102_316:                            # %for.end1458
	incl	EdgeProfCounters+15400(%rip)
	movl	$0, 332(%rsp)
	incl	EdgeProfCounters+15428(%rip)
.LBB102_317:                            # %for.cond1459
	movl	332(%rsp), %eax
	cmpl	324(%rsp), %eax
	jge	.LBB102_356
# BB#318:                               # %for.body1462
	incl	EdgeProfCounters+15432(%rip)
	incl	EdgeProfCounters+15440(%rip)
	jmp	.LBB102_319
.LBB102_264:                            # %for.end1224
	incl	EdgeProfCounters+15048(%rip)
	incl	EdgeProfCounters+15120(%rip)
	jmp	.LBB102_265
.LBB102_404:                            # %while.end1909.if.then1921_crit_edge
	incl	EdgeProfCounters+15944(%rip)
.LBB102_407:                            # %if.then1921
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+15960(%rip)
	jmp	.LBB102_680
.LBB102_408:                            # %if.end1922
	incl	EdgeProfCounters+15956(%rip)
	movslq	276(%rsp), %rax
	movq	240(%rsp), %rcx
	movl	272(%rsp), %edx
	subl	(%rcx,%rax,4), %edx
	movslq	%edx, %rax
	movq	232(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 304(%rsp)
	incl	EdgeProfCounters+15964(%rip)
	jmp	.LBB102_409
.LBB102_448:                            # %while.end2104.if.then2116_crit_edge
	incl	EdgeProfCounters+16180(%rip)
.LBB102_451:                            # %if.then2116
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+16196(%rip)
	jmp	.LBB102_680
.LBB102_452:                            # %do.cond
	incl	EdgeProfCounters+16192(%rip)
	movslq	276(%rsp), %rax
	movq	240(%rsp), %rcx
	movl	272(%rsp), %edx
	subl	(%rcx,%rax,4), %edx
	movslq	%edx, %rax
	movq	232(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 304(%rsp)
	incl	EdgeProfCounters+16200(%rip)
	cmpl	$0, 304(%rsp)
	je	.LBB102_453
# BB#454:                               # %lor.rhs
	incl	EdgeProfCounters+16208(%rip)
	movl	304(%rsp), %eax
	incl	EdgeProfCounters+16212(%rip)
	cmpl	$1, %eax
	sete	%al
	jmp	.LBB102_455
.LBB102_526:                            # %while.end2530.if.then2542_crit_edge
	incl	EdgeProfCounters+16612(%rip)
.LBB102_529:                            # %if.then2542
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+16628(%rip)
	jmp	.LBB102_680
.LBB102_530:                            # %if.end2543
	incl	EdgeProfCounters+16624(%rip)
	movslq	276(%rsp), %rax
	movq	240(%rsp), %rcx
	movl	272(%rsp), %edx
	subl	(%rcx,%rax,4), %edx
	movslq	%edx, %rax
	movq	232(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 304(%rsp)
	incl	EdgeProfCounters+16632(%rip)
	jmp	.LBB102_409
.LBB102_334:                            # %if.end1527
	incl	EdgeProfCounters+15516(%rip)
	incl	EdgeProfCounters+15524(%rip)
	jmp	.LBB102_335
.LBB102_94:                             # %if.else
	incl	EdgeProfCounters+14080(%rip)
	movq	344(%rsp), %rax
	movq	72(%rax), %rdi
	movq	368(%rsp), %rcx
	imull	$100000, 40(%rcx), %esi # imm = 0x186A0
	shll	$2, %esi
	movl	$1, %edx
	callq	*56(%rax)
	movq	368(%rsp), %rcx
	movq	%rax, 3152(%rcx)
	movq	368(%rsp), %rax
	cmpq	$0, 3152(%rax)
	je	.LBB102_95
# BB#96:                                # %if.end270
	incl	EdgeProfCounters+14112(%rip)
	incl	EdgeProfCounters+14120(%rip)
.LBB102_97:                             # %if.end271
	incl	EdgeProfCounters+14124(%rip)
	jmp	.LBB102_98
.LBB102_89:                             # %if.then234.if.then256_crit_edge
	incl	EdgeProfCounters+14084(%rip)
	jmp	.LBB102_92
.LBB102_91:                             # %lor.lhs.false252.if.then256_crit_edge
	incl	EdgeProfCounters+14092(%rip)
.LBB102_92:                             # %if.then256
	movl	$-3, 360(%rsp)
	incl	EdgeProfCounters+14100(%rip)
	jmp	.LBB102_680
.LBB102_356:                            # %for.end1658
	incl	EdgeProfCounters+15436(%rip)
	movl	$0, 332(%rsp)
	incl	EdgeProfCounters+15668(%rip)
	jmp	.LBB102_357
.LBB102_453:                            # %do.cond.lor.end_crit_edge
	incl	EdgeProfCounters+16204(%rip)
	movb	$1, %al
.LBB102_455:                            # %lor.end
	cmpb	$1, %al
	jne	.LBB102_457
# BB#456:                               # %lor.end.do.body_crit_edge
	incl	EdgeProfCounters+16216(%rip)
	jmp	.LBB102_415
.LBB102_95:                             # %if.then269
	incl	EdgeProfCounters+14108(%rip)
	movl	$-3, 360(%rsp)
	incl	EdgeProfCounters+14116(%rip)
	jmp	.LBB102_680
.LBB102_367:                            # %for.inc1717
                                        #   in Loop: Header=BB102_357 Depth=1
	incl	EdgeProfCounters+15688(%rip)
	movl	352(%rsp), %r9d
	movl	356(%rsp), %r8d
	movq	368(%rsp), %rax
	movslq	332(%rsp), %rcx
	movl	328(%rsp), %edx
	movl	%edx, (%rsp)
	imulq	$1032, %rcx, %rdx       # imm = 0x408
	leaq	45436(%rax,%rdx), %rdi
	leaq	51628(%rax,%rdx), %rsi
	leaq	57820(%rax,%rdx), %rdx
	imulq	$258, %rcx, %rcx        # imm = 0x102
	leaq	43888(%rax,%rcx), %rcx
	callq	BZ2_hbCreateDecodeTables
	movq	368(%rsp), %rax
	movslq	332(%rsp), %rcx
	movl	356(%rsp), %edx
	movl	%edx, 64012(%rax,%rcx,4)
	incl	EdgeProfCounters+15724(%rip)
	incl	332(%rsp)
	incl	EdgeProfCounters+15728(%rip)
.LBB102_357:                            # %for.cond1659
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB102_359 Depth 2
	movl	332(%rsp), %eax
	cmpl	324(%rsp), %eax
	jge	.LBB102_368
# BB#358:                               # %for.body1662
                                        #   in Loop: Header=BB102_357 Depth=1
	incl	EdgeProfCounters+15672(%rip)
	movl	$32, 356(%rsp)
	movl	$0, 352(%rsp)
	movl	$0, 340(%rsp)
	incl	EdgeProfCounters+15680(%rip)
	jmp	.LBB102_359
.LBB102_366:                            # %for.inc1699
                                        #   in Loop: Header=BB102_359 Depth=2
	incl	EdgeProfCounters+15716(%rip)
	incl	340(%rsp)
	incl	EdgeProfCounters+15720(%rip)
.LBB102_359:                            # %for.cond1663
                                        #   Parent Loop BB102_357 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	340(%rsp), %eax
	cmpl	328(%rsp), %eax
	jge	.LBB102_367
# BB#360:                               # %for.body1666
                                        #   in Loop: Header=BB102_359 Depth=2
	incl	EdgeProfCounters+15684(%rip)
	movslq	332(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movzbl	43888(%rcx,%rax), %eax
	cmpl	352(%rsp), %eax
	jle	.LBB102_361
# BB#362:                               # %if.then1675
                                        #   in Loop: Header=BB102_359 Depth=2
	incl	EdgeProfCounters+15692(%rip)
	movslq	332(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movzbl	43888(%rcx,%rax), %eax
	movl	%eax, 352(%rsp)
	incl	EdgeProfCounters+15700(%rip)
	jmp	.LBB102_363
.LBB102_361:                            # %for.body1666.if.end1682_crit_edge
                                        #   in Loop: Header=BB102_359 Depth=2
	incl	EdgeProfCounters+15696(%rip)
.LBB102_363:                            # %if.end1682
                                        #   in Loop: Header=BB102_359 Depth=2
	movslq	332(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movzbl	43888(%rcx,%rax), %eax
	cmpl	356(%rsp), %eax
	jge	.LBB102_364
# BB#365:                               # %if.then1691
                                        #   in Loop: Header=BB102_359 Depth=2
	incl	EdgeProfCounters+15704(%rip)
	movslq	332(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movzbl	43888(%rcx,%rax), %eax
	movl	%eax, 356(%rsp)
	incl	EdgeProfCounters+15712(%rip)
	jmp	.LBB102_366
.LBB102_364:                            # %if.end1682.if.end1698_crit_edge
                                        #   in Loop: Header=BB102_359 Depth=2
	incl	EdgeProfCounters+15708(%rip)
	jmp	.LBB102_366
.LBB102_457:                            # %do.end
	incl	EdgeProfCounters+16220(%rip)
	incl	292(%rsp)
	movq	368(%rsp), %rax
	movslq	7820(%rax), %rcx
	movzbl	3724(%rax,%rcx), %ecx
	movb	3468(%rax,%rcx), %al
	movb	%al, 367(%rsp)
	movq	368(%rsp), %rax
	movzbl	367(%rsp), %ecx
	movl	292(%rsp), %edx
	addl	%edx, 68(%rax,%rcx,4)
	movq	368(%rsp), %rax
	cmpb	$0, 44(%rax)
	je	.LBB102_464
# BB#458:                               # %if.then2141
	incl	EdgeProfCounters+16224(%rip)
	incl	EdgeProfCounters+16232(%rip)
	jmp	.LBB102_459
.LBB102_368:                            # %for.end1719
	incl	EdgeProfCounters+15676(%rip)
	movq	368(%rsp), %rax
	movl	3192(%rax), %eax
	incl	%eax
	movl	%eax, 316(%rsp)
	movq	368(%rsp), %rax
	imull	$100000, 40(%rax), %eax # imm = 0x186A0
	movl	%eax, 300(%rsp)
	movl	$-1, 312(%rsp)
	movl	$0, 308(%rsp)
	movl	$0, 340(%rsp)
	incl	EdgeProfCounters+15732(%rip)
	jmp	.LBB102_369
.LBB102_464:                            # %if.else2157
	incl	EdgeProfCounters+16228(%rip)
	incl	EdgeProfCounters+16264(%rip)
	jmp	.LBB102_465
.LBB102_462:                            # %if.end2149
                                        #   in Loop: Header=BB102_459 Depth=1
	incl	EdgeProfCounters+16248(%rip)
	movq	368(%rsp), %rax
	movq	3160(%rax), %rax
	movzbl	367(%rsp), %ecx
	movslq	296(%rsp), %rdx
	movw	%cx, (%rax,%rdx,2)
	incl	296(%rsp)
	decl	292(%rsp)
	incl	EdgeProfCounters+16256(%rip)
.LBB102_459:                            # %while.cond2142
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 292(%rsp)
	jle	.LBB102_463
# BB#460:                               # %while.body2145
                                        #   in Loop: Header=BB102_459 Depth=1
	incl	EdgeProfCounters+16236(%rip)
	movl	296(%rsp), %eax
	cmpl	300(%rsp), %eax
	jl	.LBB102_462
# BB#461:                               # %if.then2148
	incl	EdgeProfCounters+16244(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+16252(%rip)
	jmp	.LBB102_680
.LBB102_370:                            # %for.inc1730
                                        #   in Loop: Header=BB102_369 Depth=1
	incl	EdgeProfCounters+15736(%rip)
	movq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movl	$0, 68(%rax,%rcx,4)
	incl	EdgeProfCounters+15744(%rip)
	incl	340(%rsp)
	incl	EdgeProfCounters+15748(%rip)
.LBB102_369:                            # %for.cond1724
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$255, 340(%rsp)
	jle	.LBB102_370
# BB#371:                               # %for.end1732
	incl	EdgeProfCounters+15740(%rip)
	movl	$4095, 108(%rsp)        # imm = 0xFFF
	movl	$15, 116(%rsp)
	incl	EdgeProfCounters+15752(%rip)
	jmp	.LBB102_372
.LBB102_468:                            # %if.end2165
                                        #   in Loop: Header=BB102_465 Depth=1
	incl	EdgeProfCounters+16280(%rip)
	movq	368(%rsp), %rax
	movq	3152(%rax), %rax
	movslq	296(%rsp), %rcx
	movzbl	367(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	296(%rsp)
	decl	292(%rsp)
	incl	EdgeProfCounters+16288(%rip)
.LBB102_465:                            # %while.cond2158
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 292(%rsp)
	jle	.LBB102_469
# BB#466:                               # %while.body2161
                                        #   in Loop: Header=BB102_465 Depth=1
	incl	EdgeProfCounters+16268(%rip)
	movl	296(%rsp), %eax
	cmpl	300(%rsp), %eax
	jl	.LBB102_468
# BB#467:                               # %if.then2164
	incl	EdgeProfCounters+16276(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+16284(%rip)
	jmp	.LBB102_680
.LBB102_463:                            # %while.end2156
	incl	EdgeProfCounters+16240(%rip)
	incl	EdgeProfCounters+16260(%rip)
	incl	EdgeProfCounters+16296(%rip)
	jmp	.LBB102_409
.LBB102_376:                            # %for.inc1756
                                        #   in Loop: Header=BB102_372 Depth=1
	incl	EdgeProfCounters+15772(%rip)
	movl	108(%rsp), %eax
	incl	%eax
	movq	368(%rsp), %rcx
	movslq	116(%rsp), %rdx
	movl	%eax, 7820(%rcx,%rdx,4)
	incl	EdgeProfCounters+15784(%rip)
	decl	116(%rsp)
	incl	EdgeProfCounters+15788(%rip)
.LBB102_372:                            # %for.cond1736
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB102_374 Depth 2
	cmpl	$0, 116(%rsp)
	js	.LBB102_377
# BB#373:                               # %for.body1739
                                        #   in Loop: Header=BB102_372 Depth=1
	incl	EdgeProfCounters+15756(%rip)
	movl	$15, 112(%rsp)
	incl	EdgeProfCounters+15764(%rip)
	jmp	.LBB102_374
.LBB102_375:                            # %for.inc1750
                                        #   in Loop: Header=BB102_374 Depth=2
	incl	EdgeProfCounters+15768(%rip)
	movl	116(%rsp), %eax
	shll	$4, %eax
	addl	112(%rsp), %eax
	movq	368(%rsp), %rcx
	movslq	108(%rsp), %rdx
	movb	%al, 3724(%rcx,%rdx)
	decl	108(%rsp)
	incl	EdgeProfCounters+15776(%rip)
	decl	112(%rsp)
	incl	EdgeProfCounters+15780(%rip)
.LBB102_374:                            # %for.cond1740
                                        #   Parent Loop BB102_372 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 112(%rsp)
	js	.LBB102_376
	jmp	.LBB102_375
.LBB102_469:                            # %while.end2172
	incl	EdgeProfCounters+16272(%rip)
	incl	EdgeProfCounters+16292(%rip)
	incl	EdgeProfCounters+16296(%rip)
.LBB102_409:                            # %while.body1929
	movl	304(%rsp), %eax
	cmpl	316(%rsp), %eax
	jne	.LBB102_410
# BB#531:                               # %while.end2549
	incl	EdgeProfCounters+15968(%rip)
	incl	EdgeProfCounters+15976(%rip)
	movq	368(%rsp), %rax
	cmpl	$0, 56(%rax)
	js	.LBB102_532
# BB#533:                               # %lor.lhs.false2553
	incl	EdgeProfCounters+16640(%rip)
	movq	368(%rsp), %rax
	movl	56(%rax), %eax
	cmpl	296(%rsp), %eax
	jl	.LBB102_536
# BB#534:                               # %lor.lhs.false2553.if.then2557_crit_edge
	incl	EdgeProfCounters+16644(%rip)
	jmp	.LBB102_535
.LBB102_377:                            # %for.end1758
	incl	EdgeProfCounters+15760(%rip)
	movl	$0, 296(%rsp)
	cmpl	$0, 308(%rsp)
	je	.LBB102_379
# BB#378:                               # %for.end1758.if.end1786_crit_edge
	incl	EdgeProfCounters+15796(%rip)
	jmp	.LBB102_382
.LBB102_410:                            # %if.end1933
	incl	EdgeProfCounters+15972(%rip)
	cmpl	$0, 304(%rsp)
	je	.LBB102_411
# BB#412:                               # %lor.lhs.false1936
	incl	EdgeProfCounters+15984(%rip)
	cmpl	$1, 304(%rsp)
	jne	.LBB102_470
# BB#413:                               # %lor.lhs.false1936.if.then1939_crit_edge
	incl	EdgeProfCounters+15988(%rip)
	jmp	.LBB102_414
.LBB102_532:                            # %while.end2549.if.then2557_crit_edge
	incl	EdgeProfCounters+16636(%rip)
.LBB102_535:                            # %if.then2557
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+16652(%rip)
	jmp	.LBB102_680
.LBB102_536:                            # %if.end2558
	incl	EdgeProfCounters+16648(%rip)
	movq	368(%rsp), %rax
	movl	$0, 1096(%rax)
	movl	$1, 340(%rsp)
	incl	EdgeProfCounters+16656(%rip)
	jmp	.LBB102_537
.LBB102_379:                            # %if.then1761
	incl	EdgeProfCounters+15792(%rip)
	movl	312(%rsp), %eax
	incl	%eax
	movl	%eax, 312(%rsp)
	cmpl	320(%rsp), %eax
	jl	.LBB102_381
# BB#380:                               # %if.then1765
	incl	EdgeProfCounters+15800(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+15808(%rip)
	jmp	.LBB102_680
.LBB102_411:                            # %if.end1933.if.then1939_crit_edge
	incl	EdgeProfCounters+15980(%rip)
.LBB102_414:                            # %if.then1939
	movl	$-1, 292(%rsp)
	movl	$1, 288(%rsp)
	incl	EdgeProfCounters+15996(%rip)
.LBB102_415:                            # %do.body
	cmpl	$0, 304(%rsp)
	je	.LBB102_416
# BB#417:                               # %if.else1945
	incl	EdgeProfCounters+16004(%rip)
	cmpl	$1, 304(%rsp)
	jne	.LBB102_418
# BB#419:                               # %if.then1948
	incl	EdgeProfCounters+16012(%rip)
	movl	288(%rsp), %eax
	addl	%eax, %eax
	addl	%eax, 292(%rsp)
	incl	EdgeProfCounters+16020(%rip)
	jmp	.LBB102_420
.LBB102_470:                            # %if.else2174
	incl	EdgeProfCounters+15992(%rip)
	movl	296(%rsp), %eax
	cmpl	300(%rsp), %eax
	jl	.LBB102_472
# BB#471:                               # %if.then2177
	incl	EdgeProfCounters+16300(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+16308(%rip)
	jmp	.LBB102_680
.LBB102_538:                            # %for.inc2571
                                        #   in Loop: Header=BB102_537 Depth=1
	incl	EdgeProfCounters+16660(%rip)
	movslq	340(%rsp), %rax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movq	368(%rsp), %rdx
	movl	68(%rdx,%rcx,4), %ecx
	movl	%ecx, 1096(%rdx,%rax,4)
	incl	EdgeProfCounters+16668(%rip)
	incl	340(%rsp)
	incl	EdgeProfCounters+16672(%rip)
.LBB102_537:                            # %for.cond2560
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$256, 340(%rsp)         # imm = 0x100
	jle	.LBB102_538
# BB#539:                               # %for.end2573
	incl	EdgeProfCounters+16664(%rip)
	movl	$1, 340(%rsp)
	incl	EdgeProfCounters+16676(%rip)
	jmp	.LBB102_540
.LBB102_381:                            # %if.end1766
	incl	EdgeProfCounters+15804(%rip)
	movl	$50, 308(%rsp)
	movslq	312(%rsp), %rax
	movq	368(%rsp), %rcx
	movzbl	7884(%rcx,%rax), %eax
	movl	%eax, 264(%rsp)
	movslq	264(%rsp), %rax
	movq	368(%rsp), %rcx
	movl	64012(%rcx,%rax,4), %eax
	movl	%eax, 260(%rsp)
	movslq	264(%rsp), %rax
	imulq	$1032, %rax, %rax       # imm = 0x408
	movq	368(%rsp), %rcx
	leaq	45436(%rcx,%rax), %rax
	movq	%rax, 248(%rsp)
	movslq	264(%rsp), %rax
	imulq	$1032, %rax, %rax       # imm = 0x408
	movq	368(%rsp), %rcx
	leaq	57820(%rcx,%rax), %rax
	movq	%rax, 232(%rsp)
	movslq	264(%rsp), %rax
	imulq	$1032, %rax, %rax       # imm = 0x408
	movq	368(%rsp), %rcx
	leaq	51628(%rcx,%rax), %rax
	movq	%rax, 240(%rsp)
	incl	EdgeProfCounters+15812(%rip)
.LBB102_382:                            # %if.end1786
	decl	308(%rsp)
	movl	260(%rsp), %eax
	movl	%eax, 276(%rsp)
	incl	EdgeProfCounters+15816(%rip)
	jmp	.LBB102_383
.LBB102_416:                            # %if.then1942
	incl	EdgeProfCounters+16000(%rip)
	movl	288(%rsp), %eax
	addl	%eax, 292(%rsp)
	incl	EdgeProfCounters+16008(%rip)
	jmp	.LBB102_421
.LBB102_418:                            # %if.else1945.if.end1951_crit_edge
	incl	EdgeProfCounters+16016(%rip)
.LBB102_420:                            # %if.end1951
	incl	EdgeProfCounters+16024(%rip)
.LBB102_421:                            # %if.end1952
	shll	288(%rsp)
	cmpl	$0, 308(%rsp)
	je	.LBB102_423
# BB#422:                               # %if.end1952.if.end1981_crit_edge
	incl	EdgeProfCounters+16032(%rip)
	jmp	.LBB102_426
.LBB102_472:                            # %if.end2178
	incl	EdgeProfCounters+16304(%rip)
	movl	304(%rsp), %eax
	decl	%eax
	movl	%eax, 64(%rsp)
	cmpl	$15, %eax
	ja	.LBB102_480
# BB#473:                               # %if.then2192
	incl	EdgeProfCounters+16312(%rip)
	movq	368(%rsp), %rax
	movl	7820(%rax), %eax
	movl	%eax, 76(%rsp)
	addl	64(%rsp), %eax
	movq	368(%rsp), %rcx
	movb	3724(%rcx,%rax), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+16320(%rip)
	jmp	.LBB102_474
.LBB102_541:                            # %for.inc2586
                                        #   in Loop: Header=BB102_540 Depth=1
	incl	EdgeProfCounters+16680(%rip)
	movslq	340(%rsp), %rax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movq	368(%rsp), %rdx
	movl	1096(%rdx,%rcx,4), %ecx
	addl	%ecx, 1096(%rdx,%rax,4)
	incl	EdgeProfCounters+16688(%rip)
	incl	340(%rsp)
	incl	EdgeProfCounters+16692(%rip)
.LBB102_540:                            # %for.cond2574
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$256, 340(%rsp)         # imm = 0x100
	jle	.LBB102_541
# BB#542:                               # %for.end2588
	incl	EdgeProfCounters+16684(%rip)
	movl	$0, 340(%rsp)
	incl	EdgeProfCounters+16696(%rip)
	jmp	.LBB102_543
.LBB102_423:                            # %if.then1956
	incl	EdgeProfCounters+16028(%rip)
	movl	312(%rsp), %eax
	incl	%eax
	movl	%eax, 312(%rsp)
	cmpl	320(%rsp), %eax
	jl	.LBB102_425
# BB#424:                               # %if.then1960
	incl	EdgeProfCounters+16036(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+16044(%rip)
	jmp	.LBB102_680
.LBB102_480:                            # %if.else2256
	incl	EdgeProfCounters+16316(%rip)
	movl	64(%rsp), %eax
	shrl	$4, %eax
	movl	%eax, 72(%rsp)
	movl	64(%rsp), %eax
	andl	$15, %eax
	movl	%eax, 68(%rsp)
	movslq	72(%rsp), %rcx
	movq	368(%rsp), %rdx
	addl	7820(%rdx,%rcx,4), %eax
	movl	%eax, 76(%rsp)
	movslq	76(%rsp), %rax
	movq	368(%rsp), %rcx
	movb	3724(%rcx,%rax), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+16356(%rip)
	jmp	.LBB102_481
.LBB102_475:                            # %while.body2202
                                        #   in Loop: Header=BB102_474 Depth=1
	incl	EdgeProfCounters+16324(%rip)
	movl	76(%rsp), %eax
	addl	64(%rsp), %eax
	movl	%eax, 60(%rsp)
	movslq	60(%rsp), %rax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movq	368(%rsp), %rdx
	movb	3724(%rdx,%rcx), %cl
	movb	%cl, 3724(%rdx,%rax)
	movl	60(%rsp), %eax
	leal	-2(%rax), %ecx
	movslq	%ecx, %rdx
	movq	368(%rsp), %rcx
	movb	3724(%rcx,%rdx), %dl
	decl	%eax
	movslq	%eax, %rax
	movb	%dl, 3724(%rcx,%rax)
	movl	60(%rsp), %eax
	leal	-3(%rax), %ecx
	movslq	%ecx, %rdx
	movq	368(%rsp), %rcx
	movb	3724(%rcx,%rdx), %dl
	addl	$-2, %eax
	movslq	%eax, %rax
	movb	%dl, 3724(%rcx,%rax)
	movl	60(%rsp), %eax
	leal	-4(%rax), %ecx
	movslq	%ecx, %rdx
	movq	368(%rsp), %rcx
	movb	3724(%rcx,%rdx), %dl
	addl	$-3, %eax
	movslq	%eax, %rax
	movb	%dl, 3724(%rcx,%rax)
	addl	$-4, 64(%rsp)
	incl	EdgeProfCounters+16332(%rip)
.LBB102_474:                            # %while.cond2199
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$4, 64(%rsp)
	jae	.LBB102_475
# BB#476:                               # %while.end2237
	incl	EdgeProfCounters+16328(%rip)
	incl	EdgeProfCounters+16336(%rip)
	jmp	.LBB102_477
.LBB102_549:                            # %for.inc2606
                                        #   in Loop: Header=BB102_543 Depth=1
	incl	EdgeProfCounters+16720(%rip)
	incl	EdgeProfCounters+16728(%rip)
	incl	340(%rsp)
	incl	EdgeProfCounters+16732(%rip)
.LBB102_543:                            # %for.cond2589
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$256, 340(%rsp)         # imm = 0x100
	jg	.LBB102_550
# BB#544:                               # %for.body2592
                                        #   in Loop: Header=BB102_543 Depth=1
	incl	EdgeProfCounters+16700(%rip)
	movslq	340(%rsp), %rax
	movq	368(%rsp), %rcx
	cmpl	$0, 1096(%rcx,%rax,4)
	js	.LBB102_545
# BB#546:                               # %lor.lhs.false2598
                                        #   in Loop: Header=BB102_543 Depth=1
	incl	EdgeProfCounters+16712(%rip)
	movslq	340(%rsp), %rax
	movq	368(%rsp), %rcx
	movl	1096(%rcx,%rax,4), %eax
	cmpl	296(%rsp), %eax
	jle	.LBB102_549
# BB#547:                               # %lor.lhs.false2598.if.then2604_crit_edge
	incl	EdgeProfCounters+16716(%rip)
	jmp	.LBB102_548
.LBB102_425:                            # %if.end1961
	incl	EdgeProfCounters+16040(%rip)
	movl	$50, 308(%rsp)
	movslq	312(%rsp), %rax
	movq	368(%rsp), %rcx
	movzbl	7884(%rcx,%rax), %eax
	movl	%eax, 264(%rsp)
	movslq	264(%rsp), %rax
	movq	368(%rsp), %rcx
	movl	64012(%rcx,%rax,4), %eax
	movl	%eax, 260(%rsp)
	movslq	264(%rsp), %rax
	imulq	$1032, %rax, %rax       # imm = 0x408
	movq	368(%rsp), %rcx
	leaq	45436(%rcx,%rax), %rax
	movq	%rax, 248(%rsp)
	movslq	264(%rsp), %rax
	imulq	$1032, %rax, %rax       # imm = 0x408
	movq	368(%rsp), %rcx
	leaq	57820(%rcx,%rax), %rax
	movq	%rax, 232(%rsp)
	movslq	264(%rsp), %rax
	imulq	$1032, %rax, %rax       # imm = 0x408
	movq	368(%rsp), %rcx
	leaq	51628(%rcx,%rax), %rax
	movq	%rax, 240(%rsp)
	incl	EdgeProfCounters+16048(%rip)
.LBB102_426:                            # %if.end1981
	decl	308(%rsp)
	movl	260(%rsp), %eax
	movl	%eax, 276(%rsp)
	incl	EdgeProfCounters+16052(%rip)
	jmp	.LBB102_427
.LBB102_482:                            # %while.body2270
                                        #   in Loop: Header=BB102_481 Depth=1
	incl	EdgeProfCounters+16360(%rip)
	movslq	76(%rsp), %rax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movq	368(%rsp), %rdx
	movb	3724(%rdx,%rcx), %cl
	movb	%cl, 3724(%rdx,%rax)
	decl	76(%rsp)
	incl	EdgeProfCounters+16368(%rip)
.LBB102_481:                            # %while.cond2264
                                        # =>This Inner Loop Header: Depth=1
	movslq	72(%rsp), %rax
	movq	368(%rsp), %rcx
	movl	76(%rsp), %edx
	cmpl	7820(%rcx,%rax,4), %edx
	jg	.LBB102_482
# BB#483:                               # %while.end2279
	incl	EdgeProfCounters+16364(%rip)
	movq	368(%rsp), %rax
	movslq	72(%rsp), %rcx
	incl	7820(%rax,%rcx,4)
	incl	EdgeProfCounters+16372(%rip)
	jmp	.LBB102_484
.LBB102_478:                            # %while.body2241
                                        #   in Loop: Header=BB102_477 Depth=1
	incl	EdgeProfCounters+16340(%rip)
	movl	64(%rsp), %ecx
	movl	76(%rsp), %eax
	leal	-1(%rax,%rcx), %esi
	movq	368(%rsp), %rdx
	movb	3724(%rdx,%rsi), %sil
	addl	%ecx, %eax
	movb	%sil, 3724(%rdx,%rax)
	decl	64(%rsp)
	incl	EdgeProfCounters+16348(%rip)
.LBB102_477:                            # %while.cond2238
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 64(%rsp)
	jne	.LBB102_478
# BB#479:                               # %while.end2252
	incl	EdgeProfCounters+16344(%rip)
	movq	368(%rsp), %rax
	movslq	76(%rsp), %rcx
	movb	367(%rsp), %dl
	movb	%dl, 3724(%rax,%rcx)
	incl	EdgeProfCounters+16352(%rip)
	jmp	.LBB102_496
.LBB102_550:                            # %for.end2608
	incl	EdgeProfCounters+16704(%rip)
	movq	368(%rsp), %rax
	movl	$0, 16(%rax)
	movq	368(%rsp), %rax
	movb	$0, 12(%rax)
	movq	368(%rsp), %rax
	movl	$-1, 3184(%rax)
	movq	368(%rsp), %rax
	movl	$2, 8(%rax)
	movq	368(%rsp), %rax
	cmpl	$1, 52(%rax)
	jle	.LBB102_551
# BB#552:                               # %if.then2613
	incl	EdgeProfCounters+16736(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str1164, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+16744(%rip)
	jmp	.LBB102_553
.LBB102_545:                            # %for.body2592.if.then2604_crit_edge
	incl	EdgeProfCounters+16708(%rip)
.LBB102_548:                            # %if.then2604
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+16724(%rip)
	jmp	.LBB102_680
.LBB102_485:                            # %while.body2287
                                        #   in Loop: Header=BB102_484 Depth=1
	incl	EdgeProfCounters+16376(%rip)
	movq	368(%rsp), %rax
	movslq	72(%rsp), %rcx
	decl	7820(%rax,%rcx,4)
	movslq	72(%rsp), %rdx
	movq	368(%rsp), %rax
	movslq	7820(%rax,%rdx,4), %rcx
	decl	%edx
	movslq	%edx, %rdx
	movl	7820(%rax,%rdx,4), %edx
	addl	$15, %edx
	movslq	%edx, %rdx
	movb	3724(%rax,%rdx), %dl
	movb	%dl, 3724(%rax,%rcx)
	decl	72(%rsp)
	incl	EdgeProfCounters+16384(%rip)
.LBB102_484:                            # %while.cond2284
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 72(%rsp)
	jg	.LBB102_485
# BB#486:                               # %while.end2308
	incl	EdgeProfCounters+16380(%rip)
	movq	368(%rsp), %rax
	decl	7820(%rax)
	movq	368(%rsp), %rax
	movslq	7820(%rax), %rcx
	movb	367(%rsp), %dl
	movb	%dl, 3724(%rax,%rcx)
	movq	368(%rsp), %rax
	cmpl	$0, 7820(%rax)
	je	.LBB102_488
# BB#487:                               # %while.end2308.if.end2351_crit_edge
	incl	EdgeProfCounters+16392(%rip)
	jmp	.LBB102_495
.LBB102_551:                            # %for.end2608.if.end2615_crit_edge
	incl	EdgeProfCounters+16740(%rip)
.LBB102_553:                            # %if.end2615
	movq	368(%rsp), %rax
	cmpb	$0, 44(%rax)
	je	.LBB102_580
# BB#554:                               # %if.then2618
	incl	EdgeProfCounters+16748(%rip)
	movl	$0, 340(%rsp)
	incl	EdgeProfCounters+16756(%rip)
	jmp	.LBB102_555
.LBB102_488:                            # %if.then2321
	incl	EdgeProfCounters+16388(%rip)
	movl	$4095, 80(%rsp)         # imm = 0xFFF
	movl	$15, 88(%rsp)
	incl	EdgeProfCounters+16396(%rip)
	jmp	.LBB102_489
.LBB102_580:                            # %if.else2849
	incl	EdgeProfCounters+16752(%rip)
	movl	$0, 340(%rsp)
	incl	EdgeProfCounters+16888(%rip)
	jmp	.LBB102_581
.LBB102_556:                            # %for.inc2628
                                        #   in Loop: Header=BB102_555 Depth=1
	incl	EdgeProfCounters+16760(%rip)
	movslq	340(%rsp), %rax
	movq	368(%rsp), %rcx
	movl	1096(%rcx,%rax,4), %edx
	movl	%edx, 2124(%rcx,%rax,4)
	incl	EdgeProfCounters+16768(%rip)
	incl	340(%rsp)
	incl	EdgeProfCounters+16772(%rip)
.LBB102_555:                            # %for.cond2619
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$256, 340(%rsp)         # imm = 0x100
	jle	.LBB102_556
# BB#557:                               # %for.end2630
	incl	EdgeProfCounters+16764(%rip)
	movl	$0, 340(%rsp)
	incl	EdgeProfCounters+16776(%rip)
	jmp	.LBB102_558
.LBB102_493:                            # %for.inc2348
                                        #   in Loop: Header=BB102_489 Depth=1
	incl	EdgeProfCounters+16416(%rip)
	movl	80(%rsp), %eax
	incl	%eax
	movq	368(%rsp), %rcx
	movslq	88(%rsp), %rdx
	movl	%eax, 7820(%rcx,%rdx,4)
	incl	EdgeProfCounters+16428(%rip)
	decl	88(%rsp)
	incl	EdgeProfCounters+16432(%rip)
.LBB102_489:                            # %for.cond2322
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB102_491 Depth 2
	cmpl	$0, 88(%rsp)
	js	.LBB102_494
# BB#490:                               # %for.body2325
                                        #   in Loop: Header=BB102_489 Depth=1
	incl	EdgeProfCounters+16400(%rip)
	movl	$15, 84(%rsp)
	incl	EdgeProfCounters+16408(%rip)
	jmp	.LBB102_491
.LBB102_492:                            # %for.inc2341
                                        #   in Loop: Header=BB102_491 Depth=2
	incl	EdgeProfCounters+16412(%rip)
	movslq	88(%rsp), %rcx
	movq	368(%rsp), %rax
	movl	7820(%rax,%rcx,4), %ecx
	addl	84(%rsp), %ecx
	movslq	%ecx, %rcx
	movb	3724(%rax,%rcx), %cl
	movslq	80(%rsp), %rdx
	movb	%cl, 3724(%rax,%rdx)
	decl	80(%rsp)
	incl	EdgeProfCounters+16420(%rip)
	decl	84(%rsp)
	incl	EdgeProfCounters+16424(%rip)
.LBB102_491:                            # %for.cond2326
                                        #   Parent Loop BB102_489 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 84(%rsp)
	js	.LBB102_493
	jmp	.LBB102_492
.LBB102_582:                            # %for.inc2871
                                        #   in Loop: Header=BB102_581 Depth=1
	incl	EdgeProfCounters+16892(%rip)
	movq	368(%rsp), %rax
	movq	3152(%rax), %rax
	movslq	340(%rsp), %rcx
	movb	(%rax,%rcx,4), %al
	movb	%al, 367(%rsp)
	movzbl	367(%rsp), %eax
	movq	368(%rsp), %rcx
	movslq	1096(%rcx,%rax,4), %rax
	movq	3152(%rcx), %rcx
	movl	340(%rsp), %edx
	shll	$8, %edx
	orl	%edx, (%rcx,%rax,4)
	movq	368(%rsp), %rax
	movzbl	367(%rsp), %ecx
	incl	1096(%rax,%rcx,4)
	incl	EdgeProfCounters+16900(%rip)
	incl	340(%rsp)
	incl	EdgeProfCounters+16904(%rip)
.LBB102_581:                            # %for.cond2850
                                        # =>This Inner Loop Header: Depth=1
	movl	340(%rsp), %eax
	cmpl	296(%rsp), %eax
	jl	.LBB102_582
# BB#583:                               # %for.end2873
	incl	EdgeProfCounters+16896(%rip)
	movq	368(%rsp), %rax
	movslq	56(%rax), %rcx
	movq	3152(%rax), %rdx
	movl	(%rdx,%rcx,4), %ecx
	shrl	$8, %ecx
	movl	%ecx, 60(%rax)
	movq	368(%rsp), %rax
	movl	$0, 1092(%rax)
	movq	368(%rsp), %rax
	cmpb	$0, 20(%rax)
	je	.LBB102_593
# BB#584:                               # %if.then2883
	incl	EdgeProfCounters+16908(%rip)
	movq	368(%rsp), %rax
	movl	$0, 24(%rax)
	movq	368(%rsp), %rax
	movl	$0, 28(%rax)
	movq	368(%rsp), %rcx
	movl	60(%rcx), %edx
	movq	3152(%rcx), %rsi
	movl	$255, %eax
	movl	(%rsi,%rdx,4), %edx
	movl	%edx, 60(%rcx)
	movq	368(%rsp), %rcx
	andl	60(%rcx), %eax
	movl	%eax, 64(%rcx)
	movq	368(%rsp), %rax
	shrl	$8, 60(%rax)
	movq	368(%rsp), %rax
	incl	1092(%rax)
	movq	368(%rsp), %rax
	cmpl	$0, 24(%rax)
	je	.LBB102_586
# BB#585:                               # %if.then2883.if.end2916_crit_edge
	incl	EdgeProfCounters+16920(%rip)
	jmp	.LBB102_590
.LBB102_562:                            # %for.inc2690
                                        #   in Loop: Header=BB102_558 Depth=1
	movq	368(%rsp), %rax
	movzbl	367(%rsp), %ecx
	incl	2124(%rax,%rcx,4)
	incl	EdgeProfCounters+16804(%rip)
	incl	340(%rsp)
	incl	EdgeProfCounters+16808(%rip)
.LBB102_558:                            # %for.cond2631
                                        # =>This Inner Loop Header: Depth=1
	movl	340(%rsp), %eax
	cmpl	296(%rsp), %eax
	jge	.LBB102_563
# BB#559:                               # %for.body2634
                                        #   in Loop: Header=BB102_558 Depth=1
	incl	EdgeProfCounters+16780(%rip)
	movq	368(%rsp), %rax
	movq	3160(%rax), %rax
	movslq	340(%rsp), %rcx
	movb	(%rax,%rcx,2), %al
	movb	%al, 367(%rsp)
	movzbl	367(%rsp), %eax
	movq	368(%rsp), %rcx
	movw	2124(%rcx,%rax,4), %ax
	movq	3160(%rcx), %rcx
	movslq	340(%rsp), %rdx
	movw	%ax, (%rcx,%rdx,2)
	testb	$1, 340(%rsp)
	jne	.LBB102_561
# BB#560:                               # %if.then2650
                                        #   in Loop: Header=BB102_558 Depth=1
	incl	EdgeProfCounters+16788(%rip)
	movzbl	367(%rsp), %eax
	movq	368(%rsp), %rdx
	movzwl	2126(%rdx,%rax,4), %ecx
	movq	3168(%rdx), %rax
	movl	340(%rsp), %edx
	sarl	%edx
	movslq	%edx, %rdx
	movzbl	(%rax,%rdx), %esi
	andl	$240, %esi
	orl	%ecx, %esi
	movb	%sil, (%rax,%rdx)
	incl	EdgeProfCounters+16796(%rip)
	jmp	.LBB102_562
.LBB102_561:                            # %if.else2667
                                        #   in Loop: Header=BB102_558 Depth=1
	incl	EdgeProfCounters+16792(%rip)
	movzbl	367(%rsp), %eax
	movq	368(%rsp), %rcx
	movl	2124(%rcx,%rax,4), %eax
	shrl	$12, %eax
	andl	$240, %eax
	movq	3168(%rcx), %rcx
	movl	340(%rsp), %edx
	sarl	%edx
	movslq	%edx, %rdx
	movzbl	(%rcx,%rdx), %esi
	andl	$15, %esi
	orl	%eax, %esi
	movb	%sil, (%rcx,%rdx)
	incl	EdgeProfCounters+16800(%rip)
	jmp	.LBB102_562
.LBB102_494:                            # %for.end2350
	incl	EdgeProfCounters+16404(%rip)
	incl	EdgeProfCounters+16436(%rip)
.LBB102_495:                            # %if.end2351
	incl	EdgeProfCounters+16440(%rip)
.LBB102_496:                            # %if.end2352
	movzbl	367(%rsp), %eax
	movq	368(%rsp), %rcx
	movzbl	3468(%rcx,%rax), %eax
	incl	68(%rcx,%rax,4)
	movq	368(%rsp), %rax
	cmpb	$0, 44(%rax)
	je	.LBB102_498
# BB#497:                               # %if.then2362
	incl	EdgeProfCounters+16444(%rip)
	movzbl	367(%rsp), %eax
	movq	368(%rsp), %rcx
	movzbl	3468(%rcx,%rax), %eax
	movq	3160(%rcx), %rcx
	movslq	296(%rsp), %rdx
	movw	%ax, (%rcx,%rdx,2)
	incl	EdgeProfCounters+16452(%rip)
	jmp	.LBB102_499
.LBB102_593:                            # %if.else2925
	incl	EdgeProfCounters+16912(%rip)
	movq	368(%rsp), %rax
	movl	60(%rax), %ecx
	movq	3152(%rax), %rdx
	movl	(%rdx,%rcx,4), %ecx
	movl	%ecx, 60(%rax)
	movl	$255, %eax
	movq	368(%rsp), %rcx
	andl	60(%rcx), %eax
	movl	%eax, 64(%rcx)
	movq	368(%rsp), %rax
	shrl	$8, 60(%rax)
	movq	368(%rsp), %rax
	incl	1092(%rax)
	incl	EdgeProfCounters+16944(%rip)
	jmp	.LBB102_594
.LBB102_586:                            # %if.then2903
	incl	EdgeProfCounters+16916(%rip)
	movq	368(%rsp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	368(%rsp), %rax
	incl	28(%rax)
	movq	368(%rsp), %rax
	cmpl	$512, 28(%rax)          # imm = 0x200
	jne	.LBB102_587
# BB#588:                               # %if.then2913
	incl	EdgeProfCounters+16924(%rip)
	movq	368(%rsp), %rax
	movl	$0, 28(%rax)
	incl	EdgeProfCounters+16932(%rip)
	jmp	.LBB102_589
.LBB102_563:                            # %for.end2692
	incl	EdgeProfCounters+16784(%rip)
	movq	368(%rsp), %rax
	movl	56(%rax), %eax
	movl	%eax, 340(%rsp)
	movslq	340(%rsp), %rcx
	movl	%ecx, %eax
	sarl	%eax
	movslq	%eax, %rdx
	movq	368(%rsp), %rax
	movq	3160(%rax), %rsi
	movq	3168(%rax), %rdi
	movzwl	(%rsi,%rcx,2), %eax
	movzbl	(%rdi,%rdx), %edx
	leal	(,%rcx,4), %ecx
	andb	$4, %cl
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %edx
	andl	$15, %edx
	shll	$16, %edx
	orl	%eax, %edx
	movl	%edx, 336(%rsp)
	incl	EdgeProfCounters+16812(%rip)
	jmp	.LBB102_564
.LBB102_498:                            # %if.else2370
	incl	EdgeProfCounters+16448(%rip)
	movzbl	367(%rsp), %eax
	movq	368(%rsp), %rcx
	movzbl	3468(%rcx,%rax), %eax
	movq	3152(%rcx), %rcx
	movslq	296(%rsp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	incl	EdgeProfCounters+16456(%rip)
.LBB102_499:                            # %if.end2378
	incl	296(%rsp)
	cmpl	$0, 308(%rsp)
	je	.LBB102_501
# BB#500:                               # %if.end2378.if.end2407_crit_edge
	incl	EdgeProfCounters+16464(%rip)
	jmp	.LBB102_504
.LBB102_587:                            # %if.then2903.if.end2915_crit_edge
	incl	EdgeProfCounters+16928(%rip)
.LBB102_589:                            # %if.end2915
	incl	EdgeProfCounters+16936(%rip)
.LBB102_590:                            # %if.end2916
	movq	368(%rsp), %rax
	decl	24(%rax)
	movq	368(%rsp), %rcx
	movl	$1, %eax
	cmpl	$1, 24(%rcx)
	je	.LBB102_592
# BB#591:                               # %select.mid313
	xorl	%eax, %eax
.LBB102_592:                            # %select.end312
	movq	368(%rsp), %rcx
	xorl	%eax, 64(%rcx)
	incl	EdgeProfCounters+16940(%rip)
.LBB102_594:                            # %if.end2940
	incl	EdgeProfCounters+16948(%rip)
	jmp	.LBB102_595
.LBB102_568:                            # %do.cond2765.do.body2709_crit_edge
                                        #   in Loop: Header=BB102_564 Depth=1
	incl	EdgeProfCounters+16836(%rip)
.LBB102_564:                            # %do.body2709
                                        # =>This Inner Loop Header: Depth=1
	movslq	336(%rsp), %rcx
	movl	%ecx, %eax
	sarl	%eax
	movslq	%eax, %rdx
	movq	368(%rsp), %rax
	movq	3160(%rax), %rsi
	movq	3168(%rax), %rdi
	movzwl	(%rsi,%rcx,2), %eax
	movzbl	(%rdi,%rdx), %edx
	leal	(,%rcx,4), %ecx
	andb	$4, %cl
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %edx
	andl	$15, %edx
	shll	$16, %edx
	orl	%eax, %edx
	movl	%edx, 48(%rsp)
	movq	368(%rsp), %rax
	movq	3160(%rax), %rax
	movslq	336(%rsp), %rcx
	movw	340(%rsp), %dx
	movw	%dx, (%rax,%rcx,2)
	testb	$1, 336(%rsp)
	jne	.LBB102_566
# BB#565:                               # %if.then2735
                                        #   in Loop: Header=BB102_564 Depth=1
	incl	EdgeProfCounters+16816(%rip)
	movq	368(%rsp), %rax
	movq	3168(%rax), %rax
	movl	336(%rsp), %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edx
	andl	$240, %edx
	movzwl	342(%rsp), %esi
	orl	%edx, %esi
	movb	%sil, (%rax,%rcx)
	incl	EdgeProfCounters+16824(%rip)
	jmp	.LBB102_567
.LBB102_566:                            # %if.else2749
                                        #   in Loop: Header=BB102_564 Depth=1
	incl	EdgeProfCounters+16820(%rip)
	movq	368(%rsp), %rax
	movq	3168(%rax), %rax
	movl	336(%rsp), %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edx
	andl	$15, %edx
	movl	340(%rsp), %esi
	shrl	$12, %esi
	andl	$240, %esi
	orl	%edx, %esi
	movb	%sil, (%rax,%rcx)
	incl	EdgeProfCounters+16828(%rip)
.LBB102_567:                            # %do.cond2765
                                        #   in Loop: Header=BB102_564 Depth=1
	movl	336(%rsp), %eax
	movl	%eax, 340(%rsp)
	movl	48(%rsp), %eax
	movl	%eax, 336(%rsp)
	incl	EdgeProfCounters+16832(%rip)
	movq	368(%rsp), %rax
	movl	340(%rsp), %ecx
	cmpl	56(%rax), %ecx
	jne	.LBB102_568
# BB#569:                               # %do.end2769
	incl	EdgeProfCounters+16840(%rip)
	movq	368(%rsp), %rax
	movl	56(%rax), %ecx
	movl	%ecx, 60(%rax)
	movq	368(%rsp), %rax
	movl	$0, 1092(%rax)
	movq	368(%rsp), %rax
	cmpb	$0, 20(%rax)
	je	.LBB102_579
# BB#570:                               # %if.then2773
	incl	EdgeProfCounters+16844(%rip)
	movq	368(%rsp), %rax
	movl	$0, 24(%rax)
	movq	368(%rsp), %rax
	movl	$0, 28(%rax)
	movq	368(%rsp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi             # imm = 0x448
	callq	BZ2_indexIntoF
	movq	368(%rsp), %rcx
	movl	%eax, 64(%rcx)
	movq	368(%rsp), %rax
	movl	60(%rax), %ecx
	movl	%ecx, %esi
	shrl	%esi
	movq	3160(%rax), %rdx
	movq	3168(%rax), %rdi
	movzwl	(%rdx,%rcx,2), %edx
	movzbl	(%rdi,%rsi), %esi
	leal	(,%rcx,4), %ecx
	andb	$4, %cl
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %esi
	andl	$15, %esi
	shll	$16, %esi
	orl	%edx, %esi
	movl	%esi, 60(%rax)
	movq	368(%rsp), %rax
	incl	1092(%rax)
	movq	368(%rsp), %rax
	cmpl	$0, 24(%rax)
	je	.LBB102_572
# BB#571:                               # %if.then2773.if.end2814_crit_edge
	incl	EdgeProfCounters+16856(%rip)
	jmp	.LBB102_576
.LBB102_501:                            # %if.then2382
	incl	EdgeProfCounters+16460(%rip)
	movl	312(%rsp), %eax
	incl	%eax
	movl	%eax, 312(%rsp)
	cmpl	320(%rsp), %eax
	jl	.LBB102_503
# BB#502:                               # %if.then2386
	incl	EdgeProfCounters+16468(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+16476(%rip)
	jmp	.LBB102_680
.LBB102_579:                            # %if.else2821
	incl	EdgeProfCounters+16848(%rip)
	movq	368(%rsp), %rsi
	movl	60(%rsi), %edi
	addq	$1096, %rsi             # imm = 0x448
	callq	BZ2_indexIntoF
	movq	368(%rsp), %rcx
	movl	%eax, 64(%rcx)
	movq	368(%rsp), %rax
	movl	60(%rax), %ecx
	movl	%ecx, %esi
	shrl	%esi
	movq	3160(%rax), %rdx
	movq	3168(%rax), %rdi
	movzwl	(%rdx,%rcx,2), %edx
	movzbl	(%rdi,%rsi), %esi
	leal	(,%rcx,4), %ecx
	andb	$4, %cl
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %esi
	andl	$15, %esi
	shll	$16, %esi
	orl	%edx, %esi
	movl	%esi, 60(%rax)
	movq	368(%rsp), %rax
	incl	1092(%rax)
	incl	EdgeProfCounters+16880(%rip)
	incl	EdgeProfCounters+16884(%rip)
	jmp	.LBB102_595
.LBB102_572:                            # %if.then2801
	incl	EdgeProfCounters+16852(%rip)
	movq	368(%rsp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	368(%rsp), %rax
	incl	28(%rax)
	movq	368(%rsp), %rax
	cmpl	$512, 28(%rax)          # imm = 0x200
	jne	.LBB102_573
# BB#574:                               # %if.then2811
	incl	EdgeProfCounters+16860(%rip)
	movq	368(%rsp), %rax
	movl	$0, 28(%rax)
	incl	EdgeProfCounters+16868(%rip)
	jmp	.LBB102_575
.LBB102_503:                            # %if.end2387
	incl	EdgeProfCounters+16472(%rip)
	movl	$50, 308(%rsp)
	movslq	312(%rsp), %rax
	movq	368(%rsp), %rcx
	movzbl	7884(%rcx,%rax), %eax
	movl	%eax, 264(%rsp)
	movslq	264(%rsp), %rax
	movq	368(%rsp), %rcx
	movl	64012(%rcx,%rax,4), %eax
	movl	%eax, 260(%rsp)
	movslq	264(%rsp), %rax
	imulq	$1032, %rax, %rax       # imm = 0x408
	movq	368(%rsp), %rcx
	leaq	45436(%rcx,%rax), %rax
	movq	%rax, 248(%rsp)
	movslq	264(%rsp), %rax
	imulq	$1032, %rax, %rax       # imm = 0x408
	movq	368(%rsp), %rcx
	leaq	57820(%rcx,%rax), %rax
	movq	%rax, 232(%rsp)
	movslq	264(%rsp), %rax
	imulq	$1032, %rax, %rax       # imm = 0x408
	movq	368(%rsp), %rcx
	leaq	51628(%rcx,%rax), %rax
	movq	%rax, 240(%rsp)
	incl	EdgeProfCounters+16480(%rip)
.LBB102_504:                            # %if.end2407
	decl	308(%rsp)
	movl	260(%rsp), %eax
	movl	%eax, 276(%rsp)
	incl	EdgeProfCounters+16484(%rip)
	jmp	.LBB102_505
.LBB102_573:                            # %if.then2801.if.end2813_crit_edge
	incl	EdgeProfCounters+16864(%rip)
.LBB102_575:                            # %if.end2813
	incl	EdgeProfCounters+16872(%rip)
.LBB102_576:                            # %if.end2814
	movq	368(%rsp), %rax
	decl	24(%rax)
	movq	368(%rsp), %rcx
	movl	$1, %eax
	cmpl	$1, 24(%rcx)
	je	.LBB102_578
# BB#577:                               # %select.mid
	xorl	%eax, %eax
.LBB102_578:                            # %select.end
	movq	368(%rsp), %rcx
	xorl	%eax, 64(%rcx)
	incl	EdgeProfCounters+16876(%rip)
	incl	EdgeProfCounters+16884(%rip)
.LBB102_595:                            # %if.end2941
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+16952(%rip)
	jmp	.LBB102_680
.LBB102_230:                            # %for.cond
	cmpl	$15, 340(%rsp)
	jg	.LBB102_243
# BB#231:                               # %for.body
	incl	EdgeProfCounters+14920(%rip)
	incl	EdgeProfCounters+14928(%rip)
.LBB102_232:                            # %sw.bb1078
	movq	368(%rsp), %rax
	movl	$28, 8(%rax)
	incl	EdgeProfCounters+14932(%rip)
	jmp	.LBB102_233
.LBB102_237:                            # %if.end1100.if.end1127_crit_edge
                                        #   in Loop: Header=BB102_233 Depth=1
	incl	EdgeProfCounters+14964(%rip)
	incl	EdgeProfCounters+14972(%rip)
.LBB102_233:                            # %while.body1080
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_239
# BB#234:                               # %if.end1094
                                        #   in Loop: Header=BB102_233 Depth=1
	incl	EdgeProfCounters+14940(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_235
# BB#236:                               # %if.end1100
                                        #   in Loop: Header=BB102_233 Depth=1
	incl	EdgeProfCounters+14952(%rip)
	movq	368(%rsp), %rax
	movl	32(%rax), %ecx
	shll	$8, %ecx
	movq	(%rax), %rdx
	movq	(%rdx), %rdx
	movzbl	(%rdx), %edx
	orl	%ecx, %edx
	movl	%edx, 32(%rax)
	movq	368(%rsp), %rax
	addl	$8, 36(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incq	(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	decl	8(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	12(%rax)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 12(%rax)
	jne	.LBB102_237
# BB#238:                               # %if.then1123
                                        #   in Loop: Header=BB102_233 Depth=1
	incl	EdgeProfCounters+14960(%rip)
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	incl	EdgeProfCounters+14968(%rip)
	incl	EdgeProfCounters+14972(%rip)
	jmp	.LBB102_233
.LBB102_239:                            # %while.end1128
	incl	EdgeProfCounters+14936(%rip)
	movq	368(%rsp), %rcx
	movl	32(%rcx), %eax
	movl	36(%rcx), %ecx
	decl	%ecx
                                        # kill: CL<def> CL<kill> ECX<kill>
	shrl	%cl, %eax
	andl	$1, %eax
	movl	%eax, 156(%rsp)
	movq	368(%rsp), %rax
	decl	36(%rax)
	movb	156(%rsp), %al
	movb	%al, 367(%rsp)
	incl	EdgeProfCounters+14944(%rip)
	movzbl	367(%rsp), %eax
	cmpl	$1, %eax
	jne	.LBB102_241
# BB#240:                               # %if.then1132
	incl	EdgeProfCounters+14976(%rip)
	movq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movb	$1, 3452(%rax,%rcx)
	incl	EdgeProfCounters+14984(%rip)
	jmp	.LBB102_242
.LBB102_235:                            # %if.then1099
	incl	EdgeProfCounters+14948(%rip)
	movl	$0, 360(%rsp)
	incl	EdgeProfCounters+14956(%rip)
	jmp	.LBB102_680
.LBB102_241:                            # %if.else1133
	incl	EdgeProfCounters+14980(%rip)
	movq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movb	$0, 3452(%rax,%rcx)
	incl	EdgeProfCounters+14988(%rip)
.LBB102_242:                            # %for.inc
	incl	EdgeProfCounters+14992(%rip)
	incl	340(%rsp)
	incl	EdgeProfCounters+14996(%rip)
	jmp	.LBB102_230
.LBB102_243:                            # %for.end
	incl	EdgeProfCounters+14924(%rip)
	movl	$0, 340(%rsp)
	incl	EdgeProfCounters+15000(%rip)
	jmp	.LBB102_244
.LBB102_245:                            # %for.inc1145
                                        #   in Loop: Header=BB102_244 Depth=1
	incl	EdgeProfCounters+15004(%rip)
	movq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movb	$0, 3196(%rax,%rcx)
	incl	EdgeProfCounters+15012(%rip)
	incl	340(%rsp)
	incl	EdgeProfCounters+15016(%rip)
.LBB102_244:                            # %for.cond1139
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$255, 340(%rsp)
	jle	.LBB102_245
# BB#246:                               # %for.end1147
	incl	EdgeProfCounters+15008(%rip)
	movl	$0, 340(%rsp)
	incl	EdgeProfCounters+15020(%rip)
.LBB102_247:                            # %for.cond1148
	cmpl	$15, 340(%rsp)
	jg	.LBB102_266
# BB#248:                               # %for.body1151
	incl	EdgeProfCounters+15024(%rip)
	movslq	340(%rsp), %rax
	movq	368(%rsp), %rcx
	cmpb	$0, 3452(%rcx,%rax)
	je	.LBB102_249
# BB#250:                               # %if.then1156
	incl	EdgeProfCounters+15032(%rip)
	movl	$0, 336(%rsp)
	incl	EdgeProfCounters+15040(%rip)
	jmp	.LBB102_251
.LBB102_266:                            # %for.end1228
	incl	EdgeProfCounters+15028(%rip)
	movq	368(%rsp), %rdi
	callq	makeMaps_d
	movq	368(%rsp), %rax
	cmpl	$0, 3192(%rax)
	je	.LBB102_267
# BB#268:                               # %if.end1232
	incl	EdgeProfCounters+15136(%rip)
	movq	368(%rsp), %rax
	movl	3192(%rax), %eax
	addl	$2, %eax
	movl	%eax, 328(%rsp)
	incl	EdgeProfCounters+15144(%rip)
	jmp	.LBB102_269
.LBB102_249:                            # %for.body1151.if.end1225_crit_edge
	incl	EdgeProfCounters+15036(%rip)
.LBB102_265:                            # %for.inc1226
	incl	EdgeProfCounters+15124(%rip)
	incl	340(%rsp)
	incl	EdgeProfCounters+15128(%rip)
	jmp	.LBB102_247
.LBB102_267:                            # %if.then1231
	incl	EdgeProfCounters+15132(%rip)
	movl	$-4, 360(%rsp)
	incl	EdgeProfCounters+15140(%rip)
	jmp	.LBB102_680
.Ltmp362:
	.size	BZ2_decompress, .Ltmp362-BZ2_decompress
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI102_0:
	.quad	.LBB102_45
	.quad	.LBB102_44
	.quad	.LBB102_43
	.quad	.LBB102_42
	.quad	.LBB102_41
	.quad	.LBB102_40
	.quad	.LBB102_39
	.quad	.LBB102_38
	.quad	.LBB102_37
	.quad	.LBB102_36
	.quad	.LBB102_35
	.quad	.LBB102_34
	.quad	.LBB102_33
	.quad	.LBB102_32
	.quad	.LBB102_31
	.quad	.LBB102_30
	.quad	.LBB102_29
	.quad	.LBB102_28
	.quad	.LBB102_27
	.quad	.LBB102_26
	.quad	.LBB102_25
	.quad	.LBB102_24
	.quad	.LBB102_23
	.quad	.LBB102_22
	.quad	.LBB102_21
	.quad	.LBB102_20
	.quad	.LBB102_19
	.quad	.LBB102_18
	.quad	.LBB102_17
	.quad	.LBB102_16
	.quad	.LBB102_15
	.quad	.LBB102_14
	.quad	.LBB102_13
	.quad	.LBB102_12
	.quad	.LBB102_11
	.quad	.LBB102_10
	.quad	.LBB102_9
	.quad	.LBB102_8
	.quad	.LBB102_7
	.quad	.LBB102_6
	.quad	.LBB102_5

	.text
	.align	16, 0x90
	.type	makeMaps_d,@function
makeMaps_d:                             # @makeMaps_d
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+17460(%rip)
	movq	%rdi, -8(%rsp)
	movl	$0, 3192(%rdi)
	movl	$0, -12(%rsp)
	incl	EdgeProfCounters+17464(%rip)
	jmp	.LBB103_1
	.align	16, 0x90
.LBB103_5:                              # %if.end
                                        #   in Loop: Header=BB103_1 Depth=1
	incl	EdgeProfCounters+17488(%rip)
	incl	-12(%rsp)
	incl	EdgeProfCounters+17492(%rip)
.LBB103_1:                              # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$255, -12(%rsp)
	jg	.LBB103_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB103_1 Depth=1
	incl	EdgeProfCounters+17468(%rip)
	movslq	-12(%rsp), %rax
	movq	-8(%rsp), %rcx
	cmpb	$0, 3196(%rcx,%rax)
	je	.LBB103_3
# BB#4:                                 # %if.then
                                        #   in Loop: Header=BB103_1 Depth=1
	incl	EdgeProfCounters+17476(%rip)
	movq	-8(%rsp), %rax
	movslq	3192(%rax), %rcx
	movb	-12(%rsp), %dl
	movb	%dl, 3468(%rax,%rcx)
	movq	-8(%rsp), %rax
	incl	3192(%rax)
	incl	EdgeProfCounters+17484(%rip)
	jmp	.LBB103_5
	.align	16, 0x90
.LBB103_3:                              # %for.body.if.end_crit_edge
                                        #   in Loop: Header=BB103_1 Depth=1
	incl	EdgeProfCounters+17480(%rip)
	jmp	.LBB103_5
.LBB103_6:                              # %for.end
	incl	EdgeProfCounters+17472(%rip)
	ret
.Ltmp363:
	.size	makeMaps_d, .Ltmp363-makeMaps_d
	.cfi_endproc

	.globl	BZ2_hbMakeCodeLengths
	.align	16, 0x90
	.type	BZ2_hbMakeCodeLengths,@function
BZ2_hbMakeCodeLengths:                  # @BZ2_hbMakeCodeLengths
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp366:
	.cfi_def_cfa_offset 16
	subq	$5280, %rsp             # imm = 0x14A0
.Ltmp367:
	.cfi_def_cfa_offset 5296
.Ltmp368:
	.cfi_offset %rbx, -16
	incl	EdgeProfCounters+17496(%rip)
	movq	%rdi, 5272(%rsp)
	movq	%rsi, 5264(%rsp)
	movl	%edx, 5260(%rsp)
	movl	%ecx, 5256(%rsp)
	movl	$0, 5236(%rsp)
	incl	EdgeProfCounters+17500(%rip)
	jmp	.LBB104_1
	.align	16, 0x90
.LBB104_5:                              # %for.inc
                                        #   in Loop: Header=BB104_1 Depth=1
	shll	$8, %eax
	movl	5236(%rsp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	movl	%eax, 2112(%rsp,%rcx,4)
	incl	EdgeProfCounters+17528(%rip)
	incl	5236(%rsp)
	incl	EdgeProfCounters+17532(%rip)
.LBB104_1:                              # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	5236(%rsp), %eax
	cmpl	5260(%rsp), %eax
	jge	.LBB104_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB104_1 Depth=1
	incl	EdgeProfCounters+17504(%rip)
	movslq	5236(%rsp), %rax
	movq	5264(%rsp), %rcx
	cmpl	$0, (%rcx,%rax,4)
	jne	.LBB104_4
# BB#3:                                 # %cond.true
                                        #   in Loop: Header=BB104_1 Depth=1
	incl	EdgeProfCounters+17512(%rip)
	incl	EdgeProfCounters+17520(%rip)
	movl	$1, %eax
	jmp	.LBB104_5
	.align	16, 0x90
.LBB104_4:                              # %cond.false
                                        #   in Loop: Header=BB104_1 Depth=1
	incl	EdgeProfCounters+17516(%rip)
	movslq	5236(%rsp), %rax
	movq	5264(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	incl	EdgeProfCounters+17524(%rip)
	jmp	.LBB104_5
.LBB104_6:                              # %for.end
	incl	EdgeProfCounters+17508(%rip)
	incl	EdgeProfCounters+17536(%rip)
	movl	$255, %ebx
	jmp	.LBB104_7
	.align	16, 0x90
.LBB104_61:                             # %for.end241
                                        #   in Loop: Header=BB104_7 Depth=1
	incl	EdgeProfCounters+17820(%rip)
	incl	EdgeProfCounters+17832(%rip)
.LBB104_7:                              # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB104_8 Depth 2
                                        #       Child Loop BB104_10 Depth 3
                                        #     Child Loop BB104_17 Depth 2
                                        #       Child Loop BB104_19 Depth 3
                                        #       Child Loop BB104_29 Depth 3
                                        #       Child Loop BB104_42 Depth 3
                                        #     Child Loop BB104_49 Depth 2
                                        #       Child Loop BB104_51 Depth 3
                                        #     Child Loop BB104_59 Depth 2
	movl	5260(%rsp), %eax
	movl	%eax, 5252(%rsp)
	movl	$0, 5248(%rsp)
	movl	$0, 4176(%rsp)
	movl	$0, 2112(%rsp)
	movl	$-2, 48(%rsp)
	movl	$1, 5236(%rsp)
	incl	EdgeProfCounters+17540(%rip)
	jmp	.LBB104_8
	.align	16, 0x90
.LBB104_12:                             # %for.inc36
                                        #   in Loop: Header=BB104_8 Depth=2
	incl	EdgeProfCounters+17560(%rip)
	movslq	44(%rsp), %rax
	movl	40(%rsp), %ecx
	movl	%ecx, 4176(%rsp,%rax,4)
	incl	EdgeProfCounters+17568(%rip)
	incl	5236(%rsp)
	incl	EdgeProfCounters+17572(%rip)
.LBB104_8:                              # %for.cond9
                                        #   Parent Loop BB104_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB104_10 Depth 3
	movl	5236(%rsp), %eax
	cmpl	5260(%rsp), %eax
	jg	.LBB104_13
# BB#9:                                 # %for.body11
                                        #   in Loop: Header=BB104_8 Depth=2
	incl	EdgeProfCounters+17544(%rip)
	movslq	5236(%rsp), %rax
	movl	$-1, 48(%rsp,%rax,4)
	incl	5248(%rsp)
	movslq	5248(%rsp), %rax
	movl	5236(%rsp), %ecx
	movl	%ecx, 4176(%rsp,%rax,4)
	movl	5248(%rsp), %eax
	movl	%eax, 44(%rsp)
	movslq	44(%rsp), %rax
	movl	4176(%rsp,%rax,4), %eax
	movl	%eax, 40(%rsp)
	incl	EdgeProfCounters+17552(%rip)
	jmp	.LBB104_10
	.align	16, 0x90
.LBB104_11:                             # %while.body27
                                        #   in Loop: Header=BB104_10 Depth=3
	incl	EdgeProfCounters+17556(%rip)
	movslq	44(%rsp), %rax
	movl	%eax, %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movl	4176(%rsp,%rcx,4), %ecx
	movl	%ecx, 4176(%rsp,%rax,4)
	sarl	44(%rsp)
	incl	EdgeProfCounters+17564(%rip)
.LBB104_10:                             # %while.cond19
                                        #   Parent Loop BB104_7 Depth=1
                                        #     Parent Loop BB104_8 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	40(%rsp), %rax
	movl	2112(%rsp,%rax,4), %eax
	movl	44(%rsp), %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movslq	4176(%rsp,%rcx,4), %rcx
	cmpl	2112(%rsp,%rcx,4), %eax
	jge	.LBB104_12
	jmp	.LBB104_11
	.align	16, 0x90
.LBB104_13:                             # %for.end38
                                        #   in Loop: Header=BB104_7 Depth=1
	incl	EdgeProfCounters+17548(%rip)
	cmpl	$259, 5248(%rsp)        # imm = 0x103
	jg	.LBB104_15
# BB#14:                                # %for.end38.if.end_crit_edge
                                        #   in Loop: Header=BB104_7 Depth=1
	incl	EdgeProfCounters+17576(%rip)
	jmp	.LBB104_16
	.align	16, 0x90
.LBB104_15:                             # %if.then
                                        #   in Loop: Header=BB104_7 Depth=1
	incl	EdgeProfCounters+17580(%rip)
	movl	$2001, %edi             # imm = 0x7D1
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+17584(%rip)
.LBB104_16:                             # %if.end
                                        #   in Loop: Header=BB104_7 Depth=1
	incl	EdgeProfCounters+17588(%rip)
	jmp	.LBB104_17
	.align	16, 0x90
.LBB104_44:                             # %while.end198
                                        #   in Loop: Header=BB104_17 Depth=2
	incl	EdgeProfCounters+17728(%rip)
	movslq	12(%rsp), %rax
	movl	8(%rsp), %ecx
	movl	%ecx, 4176(%rsp,%rax,4)
	incl	EdgeProfCounters+17736(%rip)
.LBB104_17:                             # %while.cond40
                                        #   Parent Loop BB104_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB104_19 Depth 3
                                        #       Child Loop BB104_29 Depth 3
                                        #       Child Loop BB104_42 Depth 3
	cmpl	$2, 5248(%rsp)
	jl	.LBB104_45
# BB#18:                                # %while.body42
                                        #   in Loop: Header=BB104_17 Depth=2
	incl	EdgeProfCounters+17592(%rip)
	movl	4180(%rsp), %eax
	movl	%eax, 5244(%rsp)
	movslq	5248(%rsp), %rax
	movl	4176(%rsp,%rax,4), %eax
	movl	%eax, 4180(%rsp)
	decl	5248(%rsp)
	movl	$1, 36(%rsp)
	movslq	36(%rsp), %rax
	movl	4176(%rsp,%rax,4), %eax
	movl	%eax, 28(%rsp)
	incl	EdgeProfCounters+17600(%rip)
	jmp	.LBB104_19
	.align	16, 0x90
.LBB104_63:                             # %if.end82
                                        #   in Loop: Header=BB104_19 Depth=3
	incl	EdgeProfCounters+17640(%rip)
	movslq	32(%rsp), %rax
	movl	4176(%rsp,%rax,4), %eax
	movslq	36(%rsp), %rcx
	movl	%eax, 4176(%rsp,%rcx,4)
	movl	32(%rsp), %eax
	movl	%eax, 36(%rsp)
	incl	EdgeProfCounters+17648(%rip)
.LBB104_19:                             # %while.body55
                                        #   Parent Loop BB104_7 Depth=1
                                        #     Parent Loop BB104_17 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	36(%rsp), %eax
	addl	%eax, %eax
	movl	%eax, 32(%rsp)
	cmpl	5248(%rsp), %eax
	jg	.LBB104_20
# BB#21:                                # %if.end59
                                        #   in Loop: Header=BB104_19 Depth=3
	incl	EdgeProfCounters+17608(%rip)
	movl	32(%rsp), %eax
	cmpl	5248(%rsp), %eax
	jge	.LBB104_22
# BB#23:                                # %land.lhs.true
                                        #   in Loop: Header=BB104_19 Depth=3
	incl	EdgeProfCounters+17616(%rip)
	movslq	32(%rsp), %rcx
	movslq	4176(%rsp,%rcx,4), %rax
	incl	%ecx
	movslq	%ecx, %rcx
	movslq	4176(%rsp,%rcx,4), %rcx
	movl	2112(%rsp,%rcx,4), %ecx
	cmpl	2112(%rsp,%rax,4), %ecx
	jge	.LBB104_24
# BB#25:                                # %if.then71
                                        #   in Loop: Header=BB104_19 Depth=3
	incl	EdgeProfCounters+17624(%rip)
	incl	32(%rsp)
	incl	EdgeProfCounters+17632(%rip)
	jmp	.LBB104_26
	.align	16, 0x90
.LBB104_22:                             # %if.end59.if.end73_crit_edge
                                        #   in Loop: Header=BB104_19 Depth=3
	incl	EdgeProfCounters+17620(%rip)
	jmp	.LBB104_26
	.align	16, 0x90
.LBB104_24:                             # %land.lhs.true.if.end73_crit_edge
                                        #   in Loop: Header=BB104_19 Depth=3
	incl	EdgeProfCounters+17628(%rip)
.LBB104_26:                             # %if.end73
                                        #   in Loop: Header=BB104_19 Depth=3
	movslq	32(%rsp), %rax
	movslq	4176(%rsp,%rax,4), %rax
	movslq	28(%rsp), %rcx
	movl	2112(%rsp,%rcx,4), %ecx
	cmpl	2112(%rsp,%rax,4), %ecx
	jge	.LBB104_63
# BB#27:                                # %if.then81
                                        #   in Loop: Header=BB104_17 Depth=2
	incl	EdgeProfCounters+17636(%rip)
	incl	EdgeProfCounters+17644(%rip)
	jmp	.LBB104_28
	.align	16, 0x90
.LBB104_20:                             # %if.then58
                                        #   in Loop: Header=BB104_17 Depth=2
	incl	EdgeProfCounters+17604(%rip)
	incl	EdgeProfCounters+17612(%rip)
.LBB104_28:                             # %while.end87
                                        #   in Loop: Header=BB104_17 Depth=2
	movslq	36(%rsp), %rax
	movl	28(%rsp), %ecx
	movl	%ecx, 4176(%rsp,%rax,4)
	movl	4180(%rsp), %eax
	movl	%eax, 5240(%rsp)
	movslq	5248(%rsp), %rax
	movl	4176(%rsp,%rax,4), %eax
	movl	%eax, 4180(%rsp)
	decl	5248(%rsp)
	movl	$1, 24(%rsp)
	movslq	24(%rsp), %rax
	movl	4176(%rsp,%rax,4), %eax
	movl	%eax, 16(%rsp)
	incl	EdgeProfCounters+17652(%rip)
	jmp	.LBB104_29
	.align	16, 0x90
.LBB104_64:                             # %if.end132
                                        #   in Loop: Header=BB104_29 Depth=3
	incl	EdgeProfCounters+17692(%rip)
	movslq	20(%rsp), %rax
	movl	4176(%rsp,%rax,4), %eax
	movslq	24(%rsp), %rcx
	movl	%eax, 4176(%rsp,%rcx,4)
	movl	20(%rsp), %eax
	movl	%eax, 24(%rsp)
	incl	EdgeProfCounters+17700(%rip)
.LBB104_29:                             # %while.body104
                                        #   Parent Loop BB104_7 Depth=1
                                        #     Parent Loop BB104_17 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	24(%rsp), %eax
	addl	%eax, %eax
	movl	%eax, 20(%rsp)
	cmpl	5248(%rsp), %eax
	jg	.LBB104_30
# BB#31:                                # %if.end108
                                        #   in Loop: Header=BB104_29 Depth=3
	incl	EdgeProfCounters+17660(%rip)
	movl	20(%rsp), %eax
	cmpl	5248(%rsp), %eax
	jge	.LBB104_32
# BB#33:                                # %land.lhs.true110
                                        #   in Loop: Header=BB104_29 Depth=3
	incl	EdgeProfCounters+17668(%rip)
	movslq	20(%rsp), %rcx
	movslq	4176(%rsp,%rcx,4), %rax
	incl	%ecx
	movslq	%ecx, %rcx
	movslq	4176(%rsp,%rcx,4), %rcx
	movl	2112(%rsp,%rcx,4), %ecx
	cmpl	2112(%rsp,%rax,4), %ecx
	jge	.LBB104_34
# BB#35:                                # %if.then121
                                        #   in Loop: Header=BB104_29 Depth=3
	incl	EdgeProfCounters+17676(%rip)
	incl	20(%rsp)
	incl	EdgeProfCounters+17684(%rip)
	jmp	.LBB104_36
	.align	16, 0x90
.LBB104_32:                             # %if.end108.if.end123_crit_edge
                                        #   in Loop: Header=BB104_29 Depth=3
	incl	EdgeProfCounters+17672(%rip)
	jmp	.LBB104_36
	.align	16, 0x90
.LBB104_34:                             # %land.lhs.true110.if.end123_crit_edge
                                        #   in Loop: Header=BB104_29 Depth=3
	incl	EdgeProfCounters+17680(%rip)
.LBB104_36:                             # %if.end123
                                        #   in Loop: Header=BB104_29 Depth=3
	movslq	20(%rsp), %rax
	movslq	4176(%rsp,%rax,4), %rax
	movslq	16(%rsp), %rcx
	movl	2112(%rsp,%rcx,4), %ecx
	cmpl	2112(%rsp,%rax,4), %ecx
	jge	.LBB104_64
# BB#37:                                # %if.then131
                                        #   in Loop: Header=BB104_17 Depth=2
	incl	EdgeProfCounters+17688(%rip)
	incl	EdgeProfCounters+17696(%rip)
	jmp	.LBB104_38
	.align	16, 0x90
.LBB104_30:                             # %if.then107
                                        #   in Loop: Header=BB104_17 Depth=2
	incl	EdgeProfCounters+17656(%rip)
	incl	EdgeProfCounters+17664(%rip)
.LBB104_38:                             # %while.end137
                                        #   in Loop: Header=BB104_17 Depth=2
	movslq	24(%rsp), %rax
	movl	16(%rsp), %ecx
	movl	%ecx, 4176(%rsp,%rax,4)
	movl	5252(%rsp), %eax
	incl	%eax
	movl	%eax, 5252(%rsp)
	movslq	5240(%rsp), %rcx
	movl	%eax, 48(%rsp,%rcx,4)
	movslq	5244(%rsp), %rcx
	movl	%eax, 48(%rsp,%rcx,4)
	movslq	5240(%rsp), %rax
	movl	2112(%rsp,%rax,4), %ecx
	movl	%ecx, %esi
	andl	$-256, %esi
	movslq	5244(%rsp), %rax
	movl	2112(%rsp,%rax,4), %edx
	movl	%edx, %eax
	andl	$-256, %eax
	addl	%esi, %eax
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	cmpl	%ecx, %edx
	jle	.LBB104_40
# BB#39:                                # %cond.true158
                                        #   in Loop: Header=BB104_17 Depth=2
	incl	EdgeProfCounters+17704(%rip)
	movslq	5244(%rsp), %rcx
	movl	2112(%rsp,%rcx,4), %ecx
	andl	%ebx, %ecx
	incl	EdgeProfCounters+17712(%rip)
	jmp	.LBB104_41
	.align	16, 0x90
.LBB104_40:                             # %cond.false162
                                        #   in Loop: Header=BB104_17 Depth=2
	incl	EdgeProfCounters+17708(%rip)
	movslq	5240(%rsp), %rcx
	movl	2112(%rsp,%rcx,4), %ecx
	andl	%ebx, %ecx
	incl	EdgeProfCounters+17716(%rip)
.LBB104_41:                             # %cond.end166
                                        #   in Loop: Header=BB104_17 Depth=2
	incl	%ecx
	orl	%ecx, %eax
	movslq	5252(%rsp), %rcx
	movl	%eax, 2112(%rsp,%rcx,4)
	movslq	5252(%rsp), %rax
	movl	$-1, 48(%rsp,%rax,4)
	incl	5248(%rsp)
	movslq	5248(%rsp), %rax
	movl	5252(%rsp), %ecx
	movl	%ecx, 4176(%rsp,%rax,4)
	movl	5248(%rsp), %eax
	movl	%eax, 12(%rsp)
	movslq	12(%rsp), %rax
	movl	4176(%rsp,%rax,4), %eax
	movl	%eax, 8(%rsp)
	incl	EdgeProfCounters+17720(%rip)
	jmp	.LBB104_42
	.align	16, 0x90
.LBB104_43:                             # %while.body191
                                        #   in Loop: Header=BB104_42 Depth=3
	incl	EdgeProfCounters+17724(%rip)
	movslq	12(%rsp), %rax
	movl	%eax, %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movl	4176(%rsp,%rcx,4), %ecx
	movl	%ecx, 4176(%rsp,%rax,4)
	sarl	12(%rsp)
	incl	EdgeProfCounters+17732(%rip)
.LBB104_42:                             # %while.cond182
                                        #   Parent Loop BB104_7 Depth=1
                                        #     Parent Loop BB104_17 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	8(%rsp), %rax
	movl	2112(%rsp,%rax,4), %eax
	movl	12(%rsp), %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movslq	4176(%rsp,%rcx,4), %rcx
	cmpl	2112(%rsp,%rcx,4), %eax
	jge	.LBB104_44
	jmp	.LBB104_43
	.align	16, 0x90
.LBB104_45:                             # %while.end201
                                        #   in Loop: Header=BB104_7 Depth=1
	incl	EdgeProfCounters+17596(%rip)
	cmpl	$515, 5252(%rsp)        # imm = 0x203
	jg	.LBB104_47
# BB#46:                                # %while.end201.if.end204_crit_edge
                                        #   in Loop: Header=BB104_7 Depth=1
	incl	EdgeProfCounters+17740(%rip)
	jmp	.LBB104_48
	.align	16, 0x90
.LBB104_47:                             # %if.then203
                                        #   in Loop: Header=BB104_7 Depth=1
	incl	EdgeProfCounters+17744(%rip)
	movl	$2002, %edi             # imm = 0x7D2
	callq	BZ2_bz__AssertH__fail
	incl	EdgeProfCounters+17748(%rip)
.LBB104_48:                             # %if.end204
                                        #   in Loop: Header=BB104_7 Depth=1
	movb	$0, 5227(%rsp)
	movl	$1, 5236(%rsp)
	incl	EdgeProfCounters+17752(%rip)
	jmp	.LBB104_49
	.align	16, 0x90
.LBB104_56:                             # %for.inc223
                                        #   in Loop: Header=BB104_49 Depth=2
	incl	EdgeProfCounters+17792(%rip)
	incl	5236(%rsp)
	incl	EdgeProfCounters+17796(%rip)
.LBB104_49:                             # %for.cond205
                                        #   Parent Loop BB104_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB104_51 Depth 3
	movl	5236(%rsp), %eax
	cmpl	5260(%rsp), %eax
	jg	.LBB104_57
# BB#50:                                # %for.body207
                                        #   in Loop: Header=BB104_49 Depth=2
	incl	EdgeProfCounters+17756(%rip)
	movl	$0, 5232(%rsp)
	movl	5236(%rsp), %eax
	movl	%eax, 5228(%rsp)
	incl	EdgeProfCounters+17764(%rip)
	jmp	.LBB104_51
	.align	16, 0x90
.LBB104_52:                             # %while.body212
                                        #   in Loop: Header=BB104_51 Depth=3
	incl	EdgeProfCounters+17768(%rip)
	movslq	5228(%rsp), %rax
	movl	48(%rsp,%rax,4), %eax
	movl	%eax, 5228(%rsp)
	incl	5232(%rsp)
	incl	EdgeProfCounters+17776(%rip)
.LBB104_51:                             # %while.cond208
                                        #   Parent Loop BB104_7 Depth=1
                                        #     Parent Loop BB104_49 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	5228(%rsp), %rax
	cmpl	$0, 48(%rsp,%rax,4)
	jns	.LBB104_52
# BB#53:                                # %while.end216
                                        #   in Loop: Header=BB104_49 Depth=2
	incl	EdgeProfCounters+17772(%rip)
	movl	5236(%rsp), %eax
	decl	%eax
	movslq	%eax, %rax
	movq	5272(%rsp), %rcx
	movb	5232(%rsp), %dl
	movb	%dl, (%rcx,%rax)
	movl	5232(%rsp), %eax
	cmpl	5256(%rsp), %eax
	jle	.LBB104_54
# BB#55:                                # %if.then221
                                        #   in Loop: Header=BB104_49 Depth=2
	incl	EdgeProfCounters+17780(%rip)
	movb	$1, 5227(%rsp)
	incl	EdgeProfCounters+17788(%rip)
	jmp	.LBB104_56
	.align	16, 0x90
.LBB104_54:                             # %while.end216.if.end222_crit_edge
                                        #   in Loop: Header=BB104_49 Depth=2
	incl	EdgeProfCounters+17784(%rip)
	jmp	.LBB104_56
	.align	16, 0x90
.LBB104_57:                             # %for.end225
                                        #   in Loop: Header=BB104_7 Depth=1
	incl	EdgeProfCounters+17760(%rip)
	cmpb	$0, 5227(%rsp)
	je	.LBB104_62
# BB#58:                                # %if.end227
                                        #   in Loop: Header=BB104_7 Depth=1
	incl	EdgeProfCounters+17800(%rip)
	movl	$1, 5236(%rsp)
	incl	EdgeProfCounters+17812(%rip)
	jmp	.LBB104_59
	.align	16, 0x90
.LBB104_60:                             # %for.inc239
                                        #   in Loop: Header=BB104_59 Depth=2
	incl	EdgeProfCounters+17816(%rip)
	movslq	5236(%rsp), %rax
	movl	2112(%rsp,%rax,4), %eax
	movl	%eax, %ecx
	sarl	$8, %ecx
	movl	%ecx, 5232(%rsp)
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
	incl	%eax
	movl	%eax, 5232(%rsp)
	shll	$8, %eax
	movslq	5236(%rsp), %rcx
	movl	%eax, 2112(%rsp,%rcx,4)
	incl	EdgeProfCounters+17824(%rip)
	incl	5236(%rsp)
	incl	EdgeProfCounters+17828(%rip)
.LBB104_59:                             # %for.cond228
                                        #   Parent Loop BB104_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	5236(%rsp), %eax
	cmpl	5260(%rsp), %eax
	jg	.LBB104_61
	jmp	.LBB104_60
.LBB104_62:                             # %while.end242
	incl	EdgeProfCounters+17804(%rip)
	incl	EdgeProfCounters+17808(%rip)
	addq	$5280, %rsp             # imm = 0x14A0
	popq	%rbx
	ret
.Ltmp369:
	.size	BZ2_hbMakeCodeLengths, .Ltmp369-BZ2_hbMakeCodeLengths
	.cfi_endproc

	.globl	BZ2_hbAssignCodes
	.align	16, 0x90
	.type	BZ2_hbAssignCodes,@function
BZ2_hbAssignCodes:                      # @BZ2_hbAssignCodes
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+17836(%rip)
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movl	%edx, -20(%rsp)
	movl	%ecx, -24(%rsp)
	movl	%r8d, -28(%rsp)
	movl	$0, -36(%rsp)
	movl	-20(%rsp), %eax
	movl	%eax, -32(%rsp)
	incl	EdgeProfCounters+17840(%rip)
	jmp	.LBB105_1
	.align	16, 0x90
.LBB105_8:                              # %for.end
                                        #   in Loop: Header=BB105_1 Depth=1
	incl	EdgeProfCounters+17860(%rip)
	shll	-36(%rsp)
	incl	EdgeProfCounters+17884(%rip)
	incl	-32(%rsp)
	incl	EdgeProfCounters+17888(%rip)
.LBB105_1:                              # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB105_3 Depth 2
	movl	-32(%rsp), %eax
	cmpl	-24(%rsp), %eax
	jg	.LBB105_9
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB105_1 Depth=1
	incl	EdgeProfCounters+17844(%rip)
	movl	$0, -40(%rsp)
	incl	EdgeProfCounters+17852(%rip)
	jmp	.LBB105_3
	.align	16, 0x90
.LBB105_7:                              # %if.end
                                        #   in Loop: Header=BB105_3 Depth=2
	incl	EdgeProfCounters+17876(%rip)
	incl	-40(%rsp)
	incl	EdgeProfCounters+17880(%rip)
.LBB105_3:                              # %for.cond1
                                        #   Parent Loop BB105_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-40(%rsp), %eax
	cmpl	-28(%rsp), %eax
	jge	.LBB105_8
# BB#4:                                 # %for.body3
                                        #   in Loop: Header=BB105_3 Depth=2
	incl	EdgeProfCounters+17856(%rip)
	movslq	-40(%rsp), %rax
	movq	-16(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	cmpl	-32(%rsp), %eax
	jne	.LBB105_5
# BB#6:                                 # %if.then
                                        #   in Loop: Header=BB105_3 Depth=2
	incl	EdgeProfCounters+17864(%rip)
	movq	-8(%rsp), %rax
	movslq	-40(%rsp), %rcx
	movl	-36(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	-36(%rsp)
	incl	EdgeProfCounters+17872(%rip)
	jmp	.LBB105_7
	.align	16, 0x90
.LBB105_5:                              # %for.body3.if.end_crit_edge
                                        #   in Loop: Header=BB105_3 Depth=2
	incl	EdgeProfCounters+17868(%rip)
	jmp	.LBB105_7
.LBB105_9:                              # %for.end11
	incl	EdgeProfCounters+17848(%rip)
	ret
.Ltmp370:
	.size	BZ2_hbAssignCodes, .Ltmp370-BZ2_hbAssignCodes
	.cfi_endproc

	.globl	BZ2_hbCreateDecodeTables
	.align	16, 0x90
	.type	BZ2_hbCreateDecodeTables,@function
BZ2_hbCreateDecodeTables:               # @BZ2_hbCreateDecodeTables
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+17892(%rip)
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movq	%rdx, -24(%rsp)
	movq	%rcx, -32(%rsp)
	movl	%r8d, -36(%rsp)
	movl	%r9d, -40(%rsp)
	movl	8(%rsp), %eax
	movl	%eax, -44(%rsp)
	movl	$0, -48(%rsp)
	movl	-36(%rsp), %eax
	movl	%eax, -52(%rsp)
	incl	EdgeProfCounters+17896(%rip)
	jmp	.LBB106_1
	.align	16, 0x90
.LBB106_8:                              # %for.end
                                        #   in Loop: Header=BB106_1 Depth=1
	incl	EdgeProfCounters+17916(%rip)
	incl	EdgeProfCounters+17940(%rip)
	incl	-52(%rsp)
	incl	EdgeProfCounters+17944(%rip)
.LBB106_1:                              # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB106_3 Depth 2
	movl	-52(%rsp), %eax
	cmpl	-40(%rsp), %eax
	jg	.LBB106_9
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB106_1 Depth=1
	incl	EdgeProfCounters+17900(%rip)
	movl	$0, -56(%rsp)
	incl	EdgeProfCounters+17908(%rip)
	jmp	.LBB106_3
	.align	16, 0x90
.LBB106_7:                              # %if.end
                                        #   in Loop: Header=BB106_3 Depth=2
	incl	EdgeProfCounters+17932(%rip)
	incl	-56(%rsp)
	incl	EdgeProfCounters+17936(%rip)
.LBB106_3:                              # %for.cond1
                                        #   Parent Loop BB106_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-56(%rsp), %eax
	cmpl	-44(%rsp), %eax
	jge	.LBB106_8
# BB#4:                                 # %for.body3
                                        #   in Loop: Header=BB106_3 Depth=2
	incl	EdgeProfCounters+17912(%rip)
	movslq	-56(%rsp), %rax
	movq	-32(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	cmpl	-52(%rsp), %eax
	jne	.LBB106_5
# BB#6:                                 # %if.then
                                        #   in Loop: Header=BB106_3 Depth=2
	incl	EdgeProfCounters+17920(%rip)
	movq	-24(%rsp), %rax
	movslq	-48(%rsp), %rcx
	movl	-56(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	-48(%rsp)
	incl	EdgeProfCounters+17928(%rip)
	jmp	.LBB106_7
	.align	16, 0x90
.LBB106_5:                              # %for.body3.if.end_crit_edge
                                        #   in Loop: Header=BB106_3 Depth=2
	incl	EdgeProfCounters+17924(%rip)
	jmp	.LBB106_7
.LBB106_9:                              # %for.end11
	incl	EdgeProfCounters+17904(%rip)
	movl	$0, -52(%rsp)
	incl	EdgeProfCounters+17948(%rip)
	jmp	.LBB106_10
	.align	16, 0x90
.LBB106_11:                             # %for.body15
                                        #   in Loop: Header=BB106_10 Depth=1
	incl	EdgeProfCounters+17952(%rip)
	movq	-16(%rsp), %rax
	movslq	-52(%rsp), %rcx
	movl	$0, (%rax,%rcx,4)
	incl	EdgeProfCounters+17960(%rip)
	incl	-52(%rsp)
	incl	EdgeProfCounters+17964(%rip)
.LBB106_10:                             # %for.cond12
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$22, -52(%rsp)
	jle	.LBB106_11
# BB#12:                                # %for.end20
	incl	EdgeProfCounters+17956(%rip)
	movl	$0, -52(%rsp)
	incl	EdgeProfCounters+17968(%rip)
	jmp	.LBB106_13
	.align	16, 0x90
.LBB106_14:                             # %for.body24
                                        #   in Loop: Header=BB106_13 Depth=1
	incl	EdgeProfCounters+17972(%rip)
	movslq	-52(%rsp), %rax
	movq	-32(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rsp), %rcx
	incl	(%rcx,%rax,4)
	incl	EdgeProfCounters+17980(%rip)
	incl	-52(%rsp)
	incl	EdgeProfCounters+17984(%rip)
.LBB106_13:                             # %for.cond21
                                        # =>This Inner Loop Header: Depth=1
	movl	-52(%rsp), %eax
	cmpl	-44(%rsp), %eax
	jl	.LBB106_14
# BB#15:                                # %for.end33
	incl	EdgeProfCounters+17976(%rip)
	movl	$1, -52(%rsp)
	incl	EdgeProfCounters+17988(%rip)
	jmp	.LBB106_16
	.align	16, 0x90
.LBB106_17:                             # %for.body37
                                        #   in Loop: Header=BB106_16 Depth=1
	incl	EdgeProfCounters+17992(%rip)
	movslq	-52(%rsp), %rax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movq	-16(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	addl	%ecx, (%rdx,%rax,4)
	incl	EdgeProfCounters+18000(%rip)
	incl	-52(%rsp)
	incl	EdgeProfCounters+18004(%rip)
.LBB106_16:                             # %for.cond34
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$22, -52(%rsp)
	jle	.LBB106_17
# BB#18:                                # %for.end45
	incl	EdgeProfCounters+17996(%rip)
	movl	$0, -52(%rsp)
	incl	EdgeProfCounters+18008(%rip)
	jmp	.LBB106_19
	.align	16, 0x90
.LBB106_20:                             # %for.body49
                                        #   in Loop: Header=BB106_19 Depth=1
	incl	EdgeProfCounters+18012(%rip)
	movq	-8(%rsp), %rax
	movslq	-52(%rsp), %rcx
	movl	$0, (%rax,%rcx,4)
	incl	EdgeProfCounters+18020(%rip)
	incl	-52(%rsp)
	incl	EdgeProfCounters+18024(%rip)
.LBB106_19:                             # %for.cond46
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$22, -52(%rsp)
	jle	.LBB106_20
# BB#21:                                # %for.end54
	incl	EdgeProfCounters+18016(%rip)
	movl	$0, -60(%rsp)
	movl	-36(%rsp), %eax
	movl	%eax, -52(%rsp)
	incl	EdgeProfCounters+18028(%rip)
	jmp	.LBB106_22
	.align	16, 0x90
.LBB106_23:                             # %for.body58
                                        #   in Loop: Header=BB106_22 Depth=1
	incl	EdgeProfCounters+18032(%rip)
	movslq	-52(%rsp), %rax
	leal	1(%rax), %ecx
	movslq	%ecx, %rcx
	movq	-16(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	subl	(%rdx,%rax,4), %ecx
	movl	-60(%rsp), %eax
	leal	(%rax,%rcx), %edx
	movl	%edx, -60(%rsp)
	leal	-1(%rax,%rcx), %eax
	movq	-8(%rsp), %rcx
	movslq	-52(%rsp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	shll	-60(%rsp)
	incl	EdgeProfCounters+18040(%rip)
	incl	-52(%rsp)
	incl	EdgeProfCounters+18044(%rip)
.LBB106_22:                             # %for.cond55
                                        # =>This Inner Loop Header: Depth=1
	movl	-52(%rsp), %eax
	cmpl	-40(%rsp), %eax
	jle	.LBB106_23
# BB#24:                                # %for.end71
	incl	EdgeProfCounters+18036(%rip)
	movl	-36(%rsp), %eax
	incl	%eax
	movl	%eax, -52(%rsp)
	incl	EdgeProfCounters+18048(%rip)
	jmp	.LBB106_25
	.align	16, 0x90
.LBB106_26:                             # %for.body76
                                        #   in Loop: Header=BB106_25 Depth=1
	incl	EdgeProfCounters+18052(%rip)
	movslq	-52(%rsp), %rax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movq	-8(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	leal	2(%rcx,%rcx), %ecx
	movq	-16(%rsp), %rdx
	subl	(%rdx,%rax,4), %ecx
	movl	%ecx, (%rdx,%rax,4)
	incl	EdgeProfCounters+18060(%rip)
	incl	-52(%rsp)
	incl	EdgeProfCounters+18064(%rip)
.LBB106_25:                             # %for.cond73
                                        # =>This Inner Loop Header: Depth=1
	movl	-52(%rsp), %eax
	cmpl	-40(%rsp), %eax
	jle	.LBB106_26
# BB#27:                                # %for.end89
	incl	EdgeProfCounters+18056(%rip)
	ret
.Ltmp371:
	.size	BZ2_hbCreateDecodeTables, .Ltmp371-BZ2_hbCreateDecodeTables
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI107_0:
	.long	1325400064              # float 2.147484e+09
                                        #  (0x4f000000)
	.text
	.globl	ran
	.align	16, 0x90
	.type	ran,@function
ran:                                    # @ran
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+18068(%rip)
	movabsq	$4730756183288445817, %rsi # imm = 0x41A705AF1FE3FB79
	movabsq	$4730756183288445817, %rax # imm = 0x41A705AF1FE3FB79
	imulq	seedi(%rip)
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$15, %rdx
	addq	%rax, %rdx
	movq	%rdx, -16(%rsp)
	movq	seedi(%rip), %rcx
	movq	%rcx, %rax
	imulq	%rsi
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$15, %rdx
	addq	%rax, %rdx
	imulq	$127773, %rdx, %rax     # imm = 0x1F31D
	subq	%rax, %rcx
	movq	%rcx, -8(%rsp)
	imulq	$16807, %rcx, %rax      # imm = 0x41A7
	imulq	$2836, -16(%rsp), %rcx  # imm = 0xB14
	subq	%rcx, %rax
	movq	%rax, -24(%rsp)
	testq	%rax, %rax
	jle	.LBB107_2
# BB#1:                                 # %if.then
	incl	EdgeProfCounters+18072(%rip)
	movq	-24(%rsp), %rax
	movq	%rax, seedi(%rip)
	incl	EdgeProfCounters+18080(%rip)
	jmp	.LBB107_3
.LBB107_2:                              # %if.else
	incl	EdgeProfCounters+18076(%rip)
	movl	$2147483647, %eax       # imm = 0x7FFFFFFF
	addq	-24(%rsp), %rax
	movq	%rax, seedi(%rip)
	incl	EdgeProfCounters+18084(%rip)
.LBB107_3:                              # %if.end
	cvtsi2ssq	seedi(%rip), %xmm0
	divss	.LCPI107_0(%rip), %xmm0
	cvtss2sd	%xmm0, %xmm0
	ret
.Ltmp372:
	.size	ran, .Ltmp372-ran
	.cfi_endproc

	.globl	spec_init
	.align	16, 0x90
	.type	spec_init,@function
spec_init:                              # @spec_init
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp374:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+18088(%rip)
	cmpl	$3, dbglvl(%rip)
	jle	.LBB108_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+18092(%rip)
	movl	$.L.str175, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18100(%rip)
	jmp	.LBB108_3
.LBB108_1:                              # %entry.if.end_crit_edge
	incl	EdgeProfCounters+18096(%rip)
.LBB108_3:                              # %if.end
	movl	$0, 20(%rsp)
	incl	EdgeProfCounters+18104(%rip)
	jmp	.LBB108_4
	.align	16, 0x90
.LBB108_11:                             # %for.inc29
                                        #   in Loop: Header=BB108_4 Depth=1
	incl	EdgeProfCounters+18136(%rip)
	incl	EdgeProfCounters+18148(%rip)
	incl	20(%rsp)
	incl	EdgeProfCounters+18152(%rip)
.LBB108_4:                              # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB108_9 Depth 2
	cmpl	$2, 20(%rsp)
	jg	.LBB108_12
# BB#5:                                 # %for.body
                                        #   in Loop: Header=BB108_4 Depth=1
	incl	EdgeProfCounters+18108(%rip)
	movslq	20(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd(,%rax,8), %eax
	movl	%eax, 12(%rsp)
	movslq	20(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movq	$0, spec_fd+16(,%rax,8)
	movq	$0, spec_fd+8(,%rax,8)
	movq	$0, spec_fd(,%rax,8)
	movslq	20(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	12(%rsp), %ecx
	movl	%ecx, spec_fd(,%rax,8)
	movl	12(%rsp), %eax
	addl	$1048576, %eax          # imm = 0x100000
	movslq	%eax, %rdi
	callq	malloc
	movslq	20(%rsp), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	movq	%rax, spec_fd+16(,%rcx,8)
	movslq	20(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	cmpq	$0, spec_fd+16(,%rax,8)
	jne	.LBB108_6
# BB#7:                                 # %if.then16
                                        #   in Loop: Header=BB108_4 Depth=1
	incl	EdgeProfCounters+18116(%rip)
	movl	$.L.str1176, %edi
	xorb	%al, %al
	callq	printf
	xorl	%edi, %edi
	callq	exit
	incl	EdgeProfCounters+18124(%rip)
	jmp	.LBB108_8
	.align	16, 0x90
.LBB108_6:                              # %for.body.if.end18_crit_edge
                                        #   in Loop: Header=BB108_4 Depth=1
	incl	EdgeProfCounters+18120(%rip)
.LBB108_8:                              # %if.end18
                                        #   in Loop: Header=BB108_4 Depth=1
	movl	$0, 16(%rsp)
	incl	EdgeProfCounters+18128(%rip)
	jmp	.LBB108_9
	.align	16, 0x90
.LBB108_10:                             # %for.inc
                                        #   in Loop: Header=BB108_9 Depth=2
	incl	EdgeProfCounters+18132(%rip)
	movslq	20(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movq	spec_fd+16(,%rax,8), %rax
	movslq	16(%rsp), %rcx
	movb	$0, (%rax,%rcx)
	incl	EdgeProfCounters+18140(%rip)
	addl	$1024, 16(%rsp)         # imm = 0x400
	incl	EdgeProfCounters+18144(%rip)
.LBB108_9:                              # %for.cond19
                                        #   Parent Loop BB108_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%rsp), %eax
	cmpl	12(%rsp), %eax
	jge	.LBB108_11
	jmp	.LBB108_10
.LBB108_12:                             # %for.end30
	incl	EdgeProfCounters+18112(%rip)
	xorl	%eax, %eax
	addq	$24, %rsp
	ret
.Ltmp375:
	.size	spec_init, .Ltmp375-spec_init
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI109_0:
	.quad	4629700416936869888     # double 3.200000e+01
                                        #  (0x4040000000000000)
.LCPI109_1:
	.quad	4643211215818981376     # double 2.560000e+02
                                        #  (0x4070000000000000)
	.text
	.globl	spec_random_load
	.align	16, 0x90
	.type	spec_random_load,@function
spec_random_load:                       # @spec_random_load
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp378:
	.cfi_def_cfa_offset 16
	subq	$4194320, %rsp          # imm = 0x400010
.Ltmp379:
	.cfi_def_cfa_offset 4194336
.Ltmp380:
	.cfi_offset %rbx, -16
	incl	EdgeProfCounters+18156(%rip)
	movl	%edi, 4194316(%rsp)
	cmpl	$4, dbglvl(%rip)
	jle	.LBB109_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+18160(%rip)
	movl	$.L.str2177, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18168(%rip)
	jmp	.LBB109_3
.LBB109_1:                              # %entry.if.end_crit_edge
	incl	EdgeProfCounters+18164(%rip)
.LBB109_3:                              # %if.end
	movl	$0, 4194312(%rsp)
	incl	EdgeProfCounters+18172(%rip)
	jmp	.LBB109_4
	.align	16, 0x90
.LBB109_11:                             # %for.inc13
                                        #   in Loop: Header=BB109_4 Depth=1
	incl	EdgeProfCounters+18204(%rip)
	incl	EdgeProfCounters+18216(%rip)
	incl	4194312(%rsp)
	incl	EdgeProfCounters+18220(%rip)
.LBB109_4:                              # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB109_9 Depth 2
	cmpl	$31, 4194312(%rsp)
	jg	.LBB109_12
# BB#5:                                 # %for.body
                                        #   in Loop: Header=BB109_4 Depth=1
	incl	EdgeProfCounters+18176(%rip)
	cmpl	$5, dbglvl(%rip)
	jle	.LBB109_6
# BB#7:                                 # %if.then3
                                        #   in Loop: Header=BB109_4 Depth=1
	incl	EdgeProfCounters+18184(%rip)
	movl	4194312(%rsp), %esi
	movl	$.L.str3178, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18192(%rip)
	jmp	.LBB109_8
	.align	16, 0x90
.LBB109_6:                              # %for.body.if.end5_crit_edge
                                        #   in Loop: Header=BB109_4 Depth=1
	incl	EdgeProfCounters+18188(%rip)
.LBB109_8:                              # %if.end5
                                        #   in Loop: Header=BB109_4 Depth=1
	movl	$0, 4194308(%rsp)
	incl	EdgeProfCounters+18196(%rip)
	jmp	.LBB109_9
	.align	16, 0x90
.LBB109_10:                             # %for.inc
                                        #   in Loop: Header=BB109_9 Depth=2
	incl	EdgeProfCounters+18200(%rip)
	callq	ran
	mulsd	.LCPI109_1(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	movslq	4194312(%rsp), %rcx
	shlq	$17, %rcx
	leaq	(%rsp,%rcx), %rcx
	movslq	4194308(%rsp), %rdx
	movb	%al, (%rdx,%rcx)
	incl	EdgeProfCounters+18208(%rip)
	incl	4194308(%rsp)
	incl	EdgeProfCounters+18212(%rip)
.LBB109_9:                              # %for.cond6
                                        #   Parent Loop BB109_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$131071, 4194308(%rsp)  # imm = 0x1FFFF
	jg	.LBB109_11
	jmp	.LBB109_10
.LBB109_12:                             # %for.end15
	incl	EdgeProfCounters+18180(%rip)
	cmpl	$4, dbglvl(%rip)
	jle	.LBB109_13
# BB#14:                                # %if.then18
	incl	EdgeProfCounters+18224(%rip)
	movl	$.L.str4179, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18232(%rip)
	jmp	.LBB109_15
.LBB109_13:                             # %for.end15.if.end20_crit_edge
	incl	EdgeProfCounters+18228(%rip)
.LBB109_15:                             # %if.end20
	movl	$0, 4194312(%rsp)
	incl	EdgeProfCounters+18236(%rip)
	jmp	.LBB109_16
	.align	16, 0x90
.LBB109_17:                             # %for.inc34
                                        #   in Loop: Header=BB109_16 Depth=1
	incl	EdgeProfCounters+18240(%rip)
	movslq	4194316(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movslq	4194312(%rsp), %rbx
	addq	spec_fd+16(,%rax,8), %rbx
	callq	ran
	mulsd	.LCPI109_0(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	movslq	%eax, %rax
	shlq	$17, %rax
	leaq	(%rsp,%rax), %rsi
	movq	%rbx, %rdi
	movl	$131072, %edx           # imm = 0x20000
	callq	memcpy
	incl	EdgeProfCounters+18248(%rip)
	addl	$131072, 4194312(%rsp)  # imm = 0x20000
	incl	EdgeProfCounters+18252(%rip)
.LBB109_16:                             # %for.cond21
                                        # =>This Inner Loop Header: Depth=1
	movslq	4194316(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	4194312(%rsp), %ecx
	cmpl	spec_fd(,%rax,8), %ecx
	jl	.LBB109_17
# BB#18:                                # %for.end35
	incl	EdgeProfCounters+18244(%rip)
	movslq	4194316(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	$1048576, spec_fd+4(,%rax,8) # imm = 0x100000
	xorl	%eax, %eax
	addq	$4194320, %rsp          # imm = 0x400010
	popq	%rbx
	ret
.Ltmp381:
	.size	spec_random_load, .Ltmp381-spec_random_load
	.cfi_endproc

	.globl	spec_load
	.align	16, 0x90
	.type	spec_load,@function
spec_load:                              # @spec_load
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp385:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp386:
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
.Ltmp387:
	.cfi_def_cfa_offset 64
.Ltmp388:
	.cfi_offset %rbx, -24
.Ltmp389:
	.cfi_offset %r14, -16
	incl	EdgeProfCounters+18256(%rip)
	movl	%edi, 36(%rsp)
	movq	%rsi, 24(%rsp)
	movl	%edx, 20(%rsp)
	movq	24(%rsp), %rdi
	xorl	%esi, %esi
	xorb	%al, %al
	callq	open
	movl	%eax, 16(%rsp)
	testl	%eax, %eax
	js	.LBB110_2
# BB#1:                                 # %entry.if.end_crit_edge
	incl	EdgeProfCounters+18264(%rip)
	jmp	.LBB110_3
.LBB110_2:                              # %if.then
	incl	EdgeProfCounters+18260(%rip)
	movq	24(%rsp), %r14
	movq	stderr(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movq	%rbx, %rdi
	movl	$.L.str5180, %esi
	movq	%r14, %rdx
	movq	%rax, %rcx
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
	incl	EdgeProfCounters+18268(%rip)
.LBB110_3:                              # %if.end
	movslq	36(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	$0, spec_fd+4(,%rax,8)
	movslq	36(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	$0, spec_fd+8(,%rax,8)
	movl	$0, 8(%rsp)
	incl	EdgeProfCounters+18272(%rip)
	jmp	.LBB110_4
	.align	16, 0x90
.LBB110_15:                             # %if.end20
                                        #   in Loop: Header=BB110_4 Depth=1
	movslq	36(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	12(%rsp), %ecx
	addl	%ecx, spec_fd+4(,%rax,8)
	incl	EdgeProfCounters+18308(%rip)
	movl	12(%rsp), %eax
	addl	%eax, 8(%rsp)
	incl	EdgeProfCounters+18312(%rip)
.LBB110_4:                              # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	8(%rsp), %eax
	cmpl	20(%rsp), %eax
	jge	.LBB110_5
# BB#10:                                # %for.body
                                        #   in Loop: Header=BB110_4 Depth=1
	incl	EdgeProfCounters+18276(%rip)
	movslq	36(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movslq	8(%rsp), %rsi
	addq	spec_fd+16(,%rax,8), %rsi
	movl	16(%rsp), %edi
	movl	$131072, %edx           # imm = 0x20000
	callq	read
	movl	%eax, 12(%rsp)
	testl	%eax, %eax
	je	.LBB110_11
# BB#12:                                # %if.end13
                                        #   in Loop: Header=BB110_4 Depth=1
	incl	EdgeProfCounters+18288(%rip)
	cmpl	$0, 12(%rsp)
	jns	.LBB110_13
# BB#14:                                # %if.then16
                                        #   in Loop: Header=BB110_4 Depth=1
	incl	EdgeProfCounters+18296(%rip)
	movq	24(%rsp), %r14
	movq	stderr(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movq	%rbx, %rdi
	movl	$.L.str6181, %esi
	movq	%r14, %rdx
	movq	%rax, %rcx
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
	incl	EdgeProfCounters+18304(%rip)
	jmp	.LBB110_15
	.align	16, 0x90
.LBB110_13:                             # %if.end13.if.end20_crit_edge
                                        #   in Loop: Header=BB110_4 Depth=1
	incl	EdgeProfCounters+18300(%rip)
	jmp	.LBB110_15
.LBB110_5:                              # %for.cond.for.end_crit_edge
	incl	EdgeProfCounters+18280(%rip)
	jmp	.LBB110_6
.LBB110_11:                             # %if.then12
	incl	EdgeProfCounters+18284(%rip)
	incl	EdgeProfCounters+18292(%rip)
.LBB110_6:                              # %for.end
	movl	16(%rsp), %edi
	callq	close
	incl	EdgeProfCounters+18316(%rip)
	jmp	.LBB110_7
	.align	16, 0x90
.LBB110_20:                             # %if.end48
                                        #   in Loop: Header=BB110_7 Depth=1
	movslq	36(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movslq	spec_fd+4(,%rax,8), %rdi
	movq	spec_fd+16(,%rax,8), %rsi
	addq	%rsi, %rdi
	movslq	4(%rsp), %rdx
	callq	memcpy
	movslq	36(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	4(%rsp), %ecx
	addl	%ecx, spec_fd+4(,%rax,8)
	incl	EdgeProfCounters+18352(%rip)
.LBB110_7:                              # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movslq	36(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd+4(,%rax,8), %eax
	cmpl	20(%rsp), %eax
	jge	.LBB110_21
# BB#8:                                 # %while.body
                                        #   in Loop: Header=BB110_7 Depth=1
	incl	EdgeProfCounters+18320(%rip)
	movslq	36(%rsp), %rax
	leaq	(%rax,%rax,2), %rcx
	movl	20(%rsp), %eax
	subl	spec_fd+4(,%rcx,8), %eax
	movl	%eax, 4(%rsp)
	movslq	36(%rsp), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	cmpl	spec_fd+4(,%rcx,8), %eax
	jle	.LBB110_9
# BB#16:                                # %if.then39
                                        #   in Loop: Header=BB110_7 Depth=1
	incl	EdgeProfCounters+18328(%rip)
	movslq	36(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd+4(,%rax,8), %eax
	movl	%eax, 4(%rsp)
	incl	EdgeProfCounters+18336(%rip)
	jmp	.LBB110_17
	.align	16, 0x90
.LBB110_9:                              # %while.body.if.end43_crit_edge
                                        #   in Loop: Header=BB110_7 Depth=1
	incl	EdgeProfCounters+18332(%rip)
.LBB110_17:                             # %if.end43
                                        #   in Loop: Header=BB110_7 Depth=1
	cmpl	$3, dbglvl(%rip)
	jle	.LBB110_18
# BB#19:                                # %if.then46
                                        #   in Loop: Header=BB110_7 Depth=1
	incl	EdgeProfCounters+18340(%rip)
	movl	4(%rsp), %esi
	movl	$.L.str7182, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18348(%rip)
	jmp	.LBB110_20
	.align	16, 0x90
.LBB110_18:                             # %if.end43.if.end48_crit_edge
                                        #   in Loop: Header=BB110_7 Depth=1
	incl	EdgeProfCounters+18344(%rip)
	jmp	.LBB110_20
.LBB110_21:                             # %while.end
	incl	EdgeProfCounters+18324(%rip)
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	ret
.Ltmp390:
	.size	spec_load, .Ltmp390-spec_load
	.cfi_endproc

	.globl	spec_read
	.align	16, 0x90
	.type	spec_read,@function
spec_read:                              # @spec_read
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp392:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+18356(%rip)
	movl	%edi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movl	%edx, 4(%rsp)
	movl	$0, (%rsp)
	cmpl	$4, dbglvl(%rip)
	jle	.LBB111_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+18360(%rip)
	movl	4(%rsp), %ecx
	movq	8(%rsp), %rdx
	movl	16(%rsp), %esi
	movl	$.L.str8183, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18368(%rip)
	jmp	.LBB111_3
.LBB111_1:                              # %entry.if.end_crit_edge
	incl	EdgeProfCounters+18364(%rip)
.LBB111_3:                              # %if.end
	cmpl	$3, 16(%rsp)
	jle	.LBB111_4
# BB#5:                                 # %if.then2
	incl	EdgeProfCounters+18372(%rip)
	movl	16(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str9184, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
	incl	EdgeProfCounters+18380(%rip)
	jmp	.LBB111_6
.LBB111_4:                              # %if.end.if.end4_crit_edge
	incl	EdgeProfCounters+18376(%rip)
.LBB111_6:                              # %if.end4
	movslq	16(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd+8(,%rax,8), %ecx
	cmpl	spec_fd+4(,%rax,8), %ecx
	jl	.LBB111_11
# BB#7:                                 # %if.then8
	incl	EdgeProfCounters+18384(%rip)
	cmpl	$4, dbglvl(%rip)
	jle	.LBB111_8
# BB#9:                                 # %if.then10
	incl	EdgeProfCounters+18392(%rip)
	movl	$.L.str10185, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18400(%rip)
	jmp	.LBB111_10
.LBB111_11:                             # %if.end13
	incl	EdgeProfCounters+18388(%rip)
	movslq	16(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd+8(,%rax,8), %ecx
	addl	4(%rsp), %ecx
	cmpl	spec_fd+4(,%rax,8), %ecx
	jl	.LBB111_13
# BB#12:                                # %if.then21
	incl	EdgeProfCounters+18408(%rip)
	movslq	16(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd+4(,%rax,8), %ecx
	subl	spec_fd+8(,%rax,8), %ecx
	movl	%ecx, (%rsp)
	incl	EdgeProfCounters+18416(%rip)
	jmp	.LBB111_14
.LBB111_8:                              # %if.then8.if.end12_crit_edge
	incl	EdgeProfCounters+18396(%rip)
.LBB111_10:                             # %if.end12
	movl	$-1, 20(%rsp)
	incl	EdgeProfCounters+18404(%rip)
	jmp	.LBB111_18
.LBB111_13:                             # %if.else
	incl	EdgeProfCounters+18412(%rip)
	movl	4(%rsp), %eax
	movl	%eax, (%rsp)
	incl	EdgeProfCounters+18420(%rip)
.LBB111_14:                             # %if.end28
	movslq	16(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movslq	spec_fd+8(,%rax,8), %rsi
	addq	spec_fd+16(,%rax,8), %rsi
	movslq	(%rsp), %rdx
	movq	8(%rsp), %rdi
	callq	memcpy
	movslq	16(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	(%rsp), %ecx
	addl	%ecx, spec_fd+8(,%rax,8)
	cmpl	$4, dbglvl(%rip)
	jle	.LBB111_15
# BB#16:                                # %if.then43
	incl	EdgeProfCounters+18424(%rip)
	movl	(%rsp), %esi
	movl	$.L.str11186, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18432(%rip)
	jmp	.LBB111_17
.LBB111_15:                             # %if.end28.if.end45_crit_edge
	incl	EdgeProfCounters+18428(%rip)
.LBB111_17:                             # %if.end45
	movl	(%rsp), %eax
	movl	%eax, 20(%rsp)
	incl	EdgeProfCounters+18436(%rip)
.LBB111_18:                             # %return
	movl	20(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp393:
	.size	spec_read, .Ltmp393-spec_read
	.cfi_endproc

	.globl	spec_fread
	.align	16, 0x90
	.type	spec_fread,@function
spec_fread:                             # @spec_fread
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp395:
	.cfi_def_cfa_offset 48
	incl	EdgeProfCounters+18440(%rip)
	movq	%rdi, 24(%rsp)
	movl	%esi, 20(%rsp)
	movl	%edx, 16(%rsp)
	movl	%ecx, 12(%rsp)
	movl	$0, 8(%rsp)
	cmpl	$4, dbglvl(%rip)
	jle	.LBB112_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+18444(%rip)
	movl	12(%rsp), %r8d
	movl	16(%rsp), %ecx
	movl	20(%rsp), %edx
	movq	24(%rsp), %rsi
	movl	$.L.str12187, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18452(%rip)
	jmp	.LBB112_3
.LBB112_1:                              # %entry.if.end_crit_edge
	incl	EdgeProfCounters+18448(%rip)
.LBB112_3:                              # %if.end
	cmpl	$3, 12(%rsp)
	jle	.LBB112_4
# BB#5:                                 # %if.then2
	incl	EdgeProfCounters+18456(%rip)
	movl	12(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str13188, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
	incl	EdgeProfCounters+18464(%rip)
	jmp	.LBB112_6
.LBB112_4:                              # %if.end.if.end4_crit_edge
	incl	EdgeProfCounters+18460(%rip)
.LBB112_6:                              # %if.end4
	movslq	12(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd+8(,%rax,8), %ecx
	cmpl	spec_fd+4(,%rax,8), %ecx
	jl	.LBB112_11
# BB#7:                                 # %if.then8
	incl	EdgeProfCounters+18468(%rip)
	cmpl	$4, dbglvl(%rip)
	jle	.LBB112_8
# BB#9:                                 # %if.then10
	incl	EdgeProfCounters+18476(%rip)
	movl	$.L.str10185, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18484(%rip)
	jmp	.LBB112_10
.LBB112_11:                             # %if.end13
	incl	EdgeProfCounters+18472(%rip)
	movslq	12(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	20(%rsp), %ecx
	imull	16(%rsp), %ecx
	addl	spec_fd+8(,%rax,8), %ecx
	cmpl	spec_fd+4(,%rax,8), %ecx
	jl	.LBB112_13
# BB#12:                                # %if.then21
	incl	EdgeProfCounters+18492(%rip)
	movslq	12(%rsp), %rax
	leaq	(%rax,%rax,2), %rcx
	movl	spec_fd+4(,%rcx,8), %eax
	subl	spec_fd+8(,%rcx,8), %eax
	cltd
	idivl	20(%rsp)
	movl	%eax, 8(%rsp)
	incl	EdgeProfCounters+18500(%rip)
	jmp	.LBB112_14
.LBB112_8:                              # %if.then8.if.end12_crit_edge
	incl	EdgeProfCounters+18480(%rip)
.LBB112_10:                             # %if.end12
	movl	$-1, 36(%rsp)
	incl	EdgeProfCounters+18488(%rip)
	jmp	.LBB112_18
.LBB112_13:                             # %if.else
	incl	EdgeProfCounters+18496(%rip)
	movl	16(%rsp), %eax
	movl	%eax, 8(%rsp)
	incl	EdgeProfCounters+18504(%rip)
.LBB112_14:                             # %if.end28
	movslq	12(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movslq	spec_fd+8(,%rax,8), %rsi
	addq	spec_fd+16(,%rax,8), %rsi
	movslq	8(%rsp), %rdx
	movq	24(%rsp), %rdi
	callq	memcpy
	movl	8(%rsp), %eax
	imull	20(%rsp), %eax
	movslq	12(%rsp), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	addl	%eax, spec_fd+8(,%rcx,8)
	cmpl	$4, dbglvl(%rip)
	jle	.LBB112_15
# BB#16:                                # %if.then44
	incl	EdgeProfCounters+18508(%rip)
	movl	8(%rsp), %esi
	imull	20(%rsp), %esi
	movl	$.L.str11186, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18516(%rip)
	jmp	.LBB112_17
.LBB112_15:                             # %if.end28.if.end47_crit_edge
	incl	EdgeProfCounters+18512(%rip)
.LBB112_17:                             # %if.end47
	movl	8(%rsp), %eax
	movl	%eax, 36(%rsp)
	incl	EdgeProfCounters+18520(%rip)
.LBB112_18:                             # %return
	movl	36(%rsp), %eax
	addq	$40, %rsp
	ret
.Ltmp396:
	.size	spec_fread, .Ltmp396-spec_fread
	.cfi_endproc

	.globl	spec_getc
	.align	16, 0x90
	.type	spec_getc,@function
spec_getc:                              # @spec_getc
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp398:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+18524(%rip)
	movl	%edi, 16(%rsp)
	movl	$0, 12(%rsp)
	cmpl	$4, dbglvl(%rip)
	jle	.LBB113_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+18528(%rip)
	movl	16(%rsp), %esi
	movl	$.L.str14189, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18536(%rip)
	jmp	.LBB113_3
.LBB113_1:                              # %entry.if.end_crit_edge
	incl	EdgeProfCounters+18532(%rip)
.LBB113_3:                              # %if.end
	cmpl	$3, 16(%rsp)
	jle	.LBB113_4
# BB#5:                                 # %if.then2
	incl	EdgeProfCounters+18540(%rip)
	movl	16(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str9184, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
	incl	EdgeProfCounters+18548(%rip)
	jmp	.LBB113_6
.LBB113_4:                              # %if.end.if.end4_crit_edge
	incl	EdgeProfCounters+18544(%rip)
.LBB113_6:                              # %if.end4
	movslq	16(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd+8(,%rax,8), %ecx
	cmpl	spec_fd+4(,%rax,8), %ecx
	jl	.LBB113_11
# BB#7:                                 # %if.then8
	incl	EdgeProfCounters+18552(%rip)
	cmpl	$4, dbglvl(%rip)
	jle	.LBB113_8
# BB#9:                                 # %if.then10
	incl	EdgeProfCounters+18560(%rip)
	movl	$.L.str10185, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18568(%rip)
	jmp	.LBB113_10
.LBB113_11:                             # %if.end13
	incl	EdgeProfCounters+18556(%rip)
	movslq	16(%rsp), %rax
	leaq	(%rax,%rax,2), %rcx
	movslq	spec_fd+8(,%rcx,8), %rax
	leal	1(%rax), %edx
	movl	%edx, spec_fd+8(,%rcx,8)
	movslq	16(%rsp), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	movq	spec_fd+16(,%rcx,8), %rcx
	movzbl	(%rcx,%rax), %eax
	movl	%eax, 12(%rsp)
	cmpl	$4, dbglvl(%rip)
	jle	.LBB113_12
# BB#13:                                # %if.then23
	incl	EdgeProfCounters+18576(%rip)
	movl	12(%rsp), %esi
	movl	$.L.str11186, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18584(%rip)
	jmp	.LBB113_14
.LBB113_8:                              # %if.then8.if.end12_crit_edge
	incl	EdgeProfCounters+18564(%rip)
.LBB113_10:                             # %if.end12
	movl	$-1, 20(%rsp)
	incl	EdgeProfCounters+18572(%rip)
	jmp	.LBB113_15
.LBB113_12:                             # %if.end13.if.end25_crit_edge
	incl	EdgeProfCounters+18580(%rip)
.LBB113_14:                             # %if.end25
	movl	12(%rsp), %eax
	movl	%eax, 20(%rsp)
	incl	EdgeProfCounters+18588(%rip)
.LBB113_15:                             # %return
	movl	20(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp399:
	.size	spec_getc, .Ltmp399-spec_getc
	.cfi_endproc

	.globl	spec_ungetc
	.align	16, 0x90
	.type	spec_ungetc,@function
spec_ungetc:                            # @spec_ungetc
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp401:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+18592(%rip)
	movb	%dil, 23(%rsp)
	movl	%esi, 16(%rsp)
	movl	$0, 12(%rsp)
	cmpl	$4, dbglvl(%rip)
	jle	.LBB114_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+18596(%rip)
	movl	16(%rsp), %esi
	movl	$.L.str15190, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18604(%rip)
	jmp	.LBB114_3
.LBB114_1:                              # %entry.if.end_crit_edge
	incl	EdgeProfCounters+18600(%rip)
.LBB114_3:                              # %if.end
	cmpl	$3, 16(%rsp)
	jle	.LBB114_4
# BB#5:                                 # %if.then2
	incl	EdgeProfCounters+18608(%rip)
	movl	16(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str9184, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
	incl	EdgeProfCounters+18616(%rip)
	jmp	.LBB114_6
.LBB114_4:                              # %if.end.if.end4_crit_edge
	incl	EdgeProfCounters+18612(%rip)
.LBB114_6:                              # %if.end4
	movslq	16(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	cmpl	$0, spec_fd+8(,%rax,8)
	jg	.LBB114_7
# BB#8:                                 # %if.then6
	incl	EdgeProfCounters+18620(%rip)
	movslq	16(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd+8(,%rax,8), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str16191, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
	incl	EdgeProfCounters+18628(%rip)
	jmp	.LBB114_9
.LBB114_7:                              # %if.end4.if.end11_crit_edge
	incl	EdgeProfCounters+18624(%rip)
.LBB114_9:                              # %if.end11
	movslq	16(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd+8(,%rax,8), %ecx
	decl	%ecx
	movl	%ecx, spec_fd+8(,%rax,8)
	movslq	%ecx, %rax
	movslq	16(%rsp), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	movq	spec_fd+16(,%rcx,8), %rcx
	movzbl	(%rcx,%rax), %eax
	movzbl	23(%rsp), %ecx
	cmpl	%ecx, %eax
	je	.LBB114_10
# BB#11:                                # %if.then22
	incl	EdgeProfCounters+18632(%rip)
	movq	stderr(%rip), %rdi
	movl	$.L.str17192, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
	incl	EdgeProfCounters+18640(%rip)
	jmp	.LBB114_12
.LBB114_10:                             # %if.end11.if.end24_crit_edge
	incl	EdgeProfCounters+18636(%rip)
.LBB114_12:                             # %if.end24
	cmpl	$4, dbglvl(%rip)
	jle	.LBB114_13
# BB#14:                                # %if.then27
	incl	EdgeProfCounters+18644(%rip)
	movl	12(%rsp), %esi
	movl	$.L.str11186, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18652(%rip)
	jmp	.LBB114_15
.LBB114_13:                             # %if.end24.if.end29_crit_edge
	incl	EdgeProfCounters+18648(%rip)
.LBB114_15:                             # %if.end29
	movzbl	23(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp402:
	.size	spec_ungetc, .Ltmp402-spec_ungetc
	.cfi_endproc

	.globl	spec_rewind
	.align	16, 0x90
	.type	spec_rewind,@function
spec_rewind:                            # @spec_rewind
	.cfi_startproc
# BB#0:                                 # %entry
	incl	EdgeProfCounters+18656(%rip)
	movl	%edi, -4(%rsp)
	movslq	-4(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	$0, spec_fd+8(,%rax,8)
	xorl	%eax, %eax
	ret
.Ltmp403:
	.size	spec_rewind, .Ltmp403-spec_rewind
	.cfi_endproc

	.globl	spec_reset
	.align	16, 0x90
	.type	spec_reset,@function
spec_reset:                             # @spec_reset
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp405:
	.cfi_def_cfa_offset 16
	incl	EdgeProfCounters+18660(%rip)
	movl	%edi, 4(%rsp)
	movslq	4(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movslq	spec_fd+4(,%rax,8), %rdx
	movq	spec_fd+16(,%rax,8), %rdi
	xorl	%esi, %esi
	callq	memset
	movslq	4(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	$0, spec_fd+4(,%rax,8)
	movslq	4(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	$0, spec_fd+8(,%rax,8)
	xorl	%eax, %eax
	popq	%rdx
	ret
.Ltmp406:
	.size	spec_reset, .Ltmp406-spec_reset
	.cfi_endproc

	.globl	spec_write
	.align	16, 0x90
	.type	spec_write,@function
spec_write:                             # @spec_write
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp408:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+18664(%rip)
	movl	%edi, 20(%rsp)
	movq	%rsi, 8(%rsp)
	movl	%edx, 4(%rsp)
	cmpl	$4, dbglvl(%rip)
	jle	.LBB117_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+18668(%rip)
	movl	4(%rsp), %ecx
	movq	8(%rsp), %rdx
	movl	20(%rsp), %esi
	movl	$.L.str18193, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18676(%rip)
	jmp	.LBB117_3
.LBB117_1:                              # %entry.if.end_crit_edge
	incl	EdgeProfCounters+18672(%rip)
.LBB117_3:                              # %if.end
	cmpl	$3, 20(%rsp)
	jle	.LBB117_4
# BB#5:                                 # %if.then2
	incl	EdgeProfCounters+18680(%rip)
	movl	20(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str19194, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
	incl	EdgeProfCounters+18688(%rip)
	jmp	.LBB117_6
.LBB117_4:                              # %if.end.if.end4_crit_edge
	incl	EdgeProfCounters+18684(%rip)
.LBB117_6:                              # %if.end4
	movslq	20(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movslq	spec_fd+8(,%rax,8), %rdi
	addq	spec_fd+16(,%rax,8), %rdi
	movslq	4(%rsp), %rdx
	movq	8(%rsp), %rsi
	callq	memcpy
	movslq	20(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	4(%rsp), %ecx
	addl	%ecx, spec_fd+4(,%rax,8)
	movslq	20(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	4(%rsp), %ecx
	addl	%ecx, spec_fd+8(,%rax,8)
	cmpl	$4, dbglvl(%rip)
	jle	.LBB117_7
# BB#8:                                 # %if.then18
	incl	EdgeProfCounters+18692(%rip)
	movl	4(%rsp), %esi
	movl	$.L.str11186, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18700(%rip)
	jmp	.LBB117_9
.LBB117_7:                              # %if.end4.if.end20_crit_edge
	incl	EdgeProfCounters+18696(%rip)
.LBB117_9:                              # %if.end20
	movl	4(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp409:
	.size	spec_write, .Ltmp409-spec_write
	.cfi_endproc

	.globl	spec_fwrite
	.align	16, 0x90
	.type	spec_fwrite,@function
spec_fwrite:                            # @spec_fwrite
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp411:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+18704(%rip)
	movq	%rdi, 16(%rsp)
	movl	%esi, 12(%rsp)
	movl	%edx, 8(%rsp)
	movl	%ecx, 4(%rsp)
	cmpl	$4, dbglvl(%rip)
	jle	.LBB118_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+18708(%rip)
	movl	4(%rsp), %r8d
	movl	8(%rsp), %ecx
	movl	12(%rsp), %edx
	movq	16(%rsp), %rsi
	movl	$.L.str20195, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18716(%rip)
	jmp	.LBB118_3
.LBB118_1:                              # %entry.if.end_crit_edge
	incl	EdgeProfCounters+18712(%rip)
.LBB118_3:                              # %if.end
	cmpl	$3, 4(%rsp)
	jle	.LBB118_4
# BB#5:                                 # %if.then2
	incl	EdgeProfCounters+18720(%rip)
	movl	4(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str21196, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
	incl	EdgeProfCounters+18728(%rip)
	jmp	.LBB118_6
.LBB118_4:                              # %if.end.if.end4_crit_edge
	incl	EdgeProfCounters+18724(%rip)
.LBB118_6:                              # %if.end4
	movslq	4(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movslq	spec_fd+8(,%rax,8), %rdi
	addq	spec_fd+16(,%rax,8), %rdi
	movl	12(%rsp), %eax
	imull	8(%rsp), %eax
	movq	16(%rsp), %rsi
	movslq	%eax, %rdx
	callq	memcpy
	movl	12(%rsp), %eax
	imull	8(%rsp), %eax
	movslq	4(%rsp), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	addl	%eax, spec_fd+4(,%rcx,8)
	movl	12(%rsp), %eax
	imull	8(%rsp), %eax
	movslq	4(%rsp), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	addl	%eax, spec_fd+8(,%rcx,8)
	cmpl	$4, dbglvl(%rip)
	jle	.LBB118_7
# BB#8:                                 # %if.then20
	incl	EdgeProfCounters+18732(%rip)
	movl	8(%rsp), %esi
	movl	$.L.str11186, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18740(%rip)
	jmp	.LBB118_9
.LBB118_7:                              # %if.end4.if.end22_crit_edge
	incl	EdgeProfCounters+18736(%rip)
.LBB118_9:                              # %if.end22
	movl	8(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp412:
	.size	spec_fwrite, .Ltmp412-spec_fwrite
	.cfi_endproc

	.globl	spec_putc
	.align	16, 0x90
	.type	spec_putc,@function
spec_putc:                              # @spec_putc
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp414:
	.cfi_def_cfa_offset 16
	incl	EdgeProfCounters+18744(%rip)
	movb	%dil, 7(%rsp)
	movl	%esi, (%rsp)
	cmpl	$4, dbglvl(%rip)
	jle	.LBB119_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+18748(%rip)
	movl	(%rsp), %edx
	movzbl	7(%rsp), %esi
	movl	$.L.str22197, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+18756(%rip)
	jmp	.LBB119_3
.LBB119_1:                              # %entry.if.end_crit_edge
	incl	EdgeProfCounters+18752(%rip)
.LBB119_3:                              # %if.end
	cmpl	$3, (%rsp)
	jle	.LBB119_4
# BB#5:                                 # %if.then3
	incl	EdgeProfCounters+18760(%rip)
	movl	(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str19194, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
	incl	EdgeProfCounters+18768(%rip)
	jmp	.LBB119_6
.LBB119_4:                              # %if.end.if.end5_crit_edge
	incl	EdgeProfCounters+18764(%rip)
.LBB119_6:                              # %if.end5
	movslq	(%rsp), %rax
	leaq	(%rax,%rax,2), %rcx
	movslq	spec_fd+8(,%rcx,8), %rax
	leal	1(%rax), %esi
	movb	7(%rsp), %dl
	movl	%esi, spec_fd+8(,%rcx,8)
	movslq	(%rsp), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	movq	spec_fd+16(,%rcx,8), %rcx
	movb	%dl, (%rcx,%rax)
	movslq	(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	incl	spec_fd+4(,%rax,8)
	movzbl	7(%rsp), %eax
	popq	%rdx
	ret
.Ltmp415:
	.size	spec_putc, .Ltmp415-spec_putc
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "      %d work, %d block, ratio %5.2f\n"
	.size	.L.str, 38

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "    too repetitive; using fallback sorting algorithm\n"
	.size	.L.str1, 54

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "        main sort initialise ...\n"
	.size	.L.str2, 34

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "        bucket sorting ...\n"
	.size	.L.str3, 28

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	 "        qsort [0x%x, 0x%x]   done %d   this %d\n"
	.size	.L.str4, 48

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	 "        %d pointers, %d sorted, %d scanned\n"
	.size	.L.str5, 44

	.type	incs,@object            # @incs
	.data
	.align	16
incs:
	.long	1                       # 0x1
	.long	4                       # 0x4
	.long	13                      # 0xd
	.long	40                      # 0x28
	.long	121                     # 0x79
	.long	364                     # 0x16c
	.long	1093                    # 0x445
	.long	3280                    # 0xcd0
	.long	9841                    # 0x2671
	.long	29524                   # 0x7354
	.long	88573                   # 0x159fd
	.long	265720                  # 0x40df8
	.long	797161                  # 0xc29e9
	.long	2391484                 # 0x247dbc
	.size	incs, 56

	.type	.L.str6,@object         # @.str6
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str6:
	.asciz	 "        depth %6d has "
	.size	.L.str6, 23

	.type	.L.str7,@object         # @.str7
.L.str7:
	.asciz	 "%6d unresolved strings\n"
	.size	.L.str7, 24

	.type	.L.str8,@object         # @.str8
.L.str8:
	.asciz	 "        reconstructing block ...\n"
	.size	.L.str8, 34

	.type	.L.str9,@object         # @.str9
.L.str9:
	.asciz	 ".bz2"
	.size	.L.str9, 5

	.type	.L.str110,@object       # @.str110
.L.str110:
	.asciz	 ".bz"
	.size	.L.str110, 4

	.type	.L.str211,@object       # @.str211
.L.str211:
	.asciz	 ".tbz2"
	.size	.L.str211, 6

	.type	.L.str312,@object       # @.str312
.L.str312:
	.asciz	 ".tbz"
	.size	.L.str312, 5

	.type	zSuffix,@object         # @zSuffix
	.data
	.globl	zSuffix
	.align	16
zSuffix:
	.quad	.L.str9
	.quad	.L.str110
	.quad	.L.str211
	.quad	.L.str312
	.size	zSuffix, 32

	.type	.L.str413,@object       # @.str413
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str413:
	.zero	1
	.size	.L.str413, 1

	.type	.L.str514,@object       # @.str514
.L.str514:
	.asciz	 ".tar"
	.size	.L.str514, 5

	.type	unzSuffix,@object       # @unzSuffix
	.data
	.globl	unzSuffix
	.align	16
unzSuffix:
	.quad	.L.str413
	.quad	.L.str413
	.quad	.L.str514
	.quad	.L.str514
	.size	unzSuffix, 32

	.type	outputHandleJustInCase,@object # @outputHandleJustInCase
	.comm	outputHandleJustInCase,8,8
	.type	smallMode,@object       # @smallMode
	.comm	smallMode,1,1
	.type	keepInputFiles,@object  # @keepInputFiles
	.comm	keepInputFiles,1,1
	.type	forceOverwrite,@object  # @forceOverwrite
	.comm	forceOverwrite,1,1
	.type	noisy,@object           # @noisy
	.comm	noisy,1,1
	.type	verbosity,@object       # @verbosity
	.comm	verbosity,4,4
	.type	blockSize100k,@object   # @blockSize100k
	.comm	blockSize100k,4,4
	.type	testFailsExist,@object  # @testFailsExist
	.comm	testFailsExist,1,1
	.type	unzFailsExist,@object   # @unzFailsExist
	.comm	unzFailsExist,1,1
	.type	numFileNames,@object    # @numFileNames
	.comm	numFileNames,4,4
	.type	numFilesProcessed,@object # @numFilesProcessed
	.comm	numFilesProcessed,4,4
	.type	workFactor,@object      # @workFactor
	.comm	workFactor,4,4
	.type	deleteOutputOnInterrupt,@object # @deleteOutputOnInterrupt
	.comm	deleteOutputOnInterrupt,1,1
	.type	exitValue,@object       # @exitValue
	.comm	exitValue,4,4
	.type	inName,@object          # @inName
	.comm	inName,1034,16
	.type	.L.str615,@object       # @.str615
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str615:
	.asciz	 "(none)"
	.size	.L.str615, 7

	.type	outName,@object         # @outName
	.comm	outName,1034,16
	.type	progNameReally,@object  # @progNameReally
	.comm	progNameReally,1034,16
	.type	progName,@object        # @progName
	.comm	progName,8,8
	.type	.L.str716,@object       # @.str716
.L.str716:
	.asciz	 "BZIP2"
	.size	.L.str716, 6

	.type	.L.str817,@object       # @.str817
.L.str817:
	.asciz	 "BZIP"
	.size	.L.str817, 5

	.type	longestFileName,@object # @longestFileName
	.comm	longestFileName,4,4
	.type	.L.str918,@object       # @.str918
.L.str918:
	.asciz	 "--"
	.size	.L.str918, 3

	.type	srcMode,@object         # @srcMode
	.comm	srcMode,4,4
	.type	opMode,@object          # @opMode
	.comm	opMode,4,4
	.type	.L.str10,@object        # @.str10
.L.str10:
	.asciz	 "unzip"
	.size	.L.str10, 6

	.type	.L.str11,@object        # @.str11
.L.str11:
	.asciz	 "UNZIP"
	.size	.L.str11, 6

	.type	.L.str12,@object        # @.str12
.L.str12:
	.asciz	 "z2cat"
	.size	.L.str12, 6

	.type	.L.str13,@object        # @.str13
.L.str13:
	.asciz	 "Z2CAT"
	.size	.L.str13, 6

	.type	.L.str14,@object        # @.str14
.L.str14:
	.asciz	 "zcat"
	.size	.L.str14, 5

	.type	.L.str15,@object        # @.str15
.L.str15:
	.asciz	 "ZCAT"
	.size	.L.str15, 5

	.type	.L.str16,@object        # @.str16
.L.str16:
	.asciz	 "%s: Bad flag `%s'\n"
	.size	.L.str16, 19

	.type	.L.str17,@object        # @.str17
.L.str17:
	.asciz	 "--stdout"
	.size	.L.str17, 9

	.type	.L.str18,@object        # @.str18
.L.str18:
	.asciz	 "--decompress"
	.size	.L.str18, 13

	.type	.L.str19,@object        # @.str19
.L.str19:
	.asciz	 "--compress"
	.size	.L.str19, 11

	.type	.L.str20,@object        # @.str20
.L.str20:
	.asciz	 "--force"
	.size	.L.str20, 8

	.type	.L.str21,@object        # @.str21
.L.str21:
	.asciz	 "--test"
	.size	.L.str21, 7

	.type	.L.str22,@object        # @.str22
.L.str22:
	.asciz	 "--keep"
	.size	.L.str22, 7

	.type	.L.str23,@object        # @.str23
.L.str23:
	.asciz	 "--small"
	.size	.L.str23, 8

	.type	.L.str24,@object        # @.str24
.L.str24:
	.asciz	 "--quiet"
	.size	.L.str24, 8

	.type	.L.str25,@object        # @.str25
.L.str25:
	.asciz	 "--version"
	.size	.L.str25, 10

	.type	.L.str26,@object        # @.str26
.L.str26:
	.asciz	 "--license"
	.size	.L.str26, 10

	.type	.L.str27,@object        # @.str27
.L.str27:
	.asciz	 "--exponential"
	.size	.L.str27, 14

	.type	.L.str28,@object        # @.str28
.L.str28:
	.asciz	 "--repetitive-best"
	.size	.L.str28, 18

	.type	.L.str29,@object        # @.str29
.L.str29:
	.asciz	 "--repetitive-fast"
	.size	.L.str29, 18

	.type	.L.str30,@object        # @.str30
.L.str30:
	.asciz	 "--fast"
	.size	.L.str30, 7

	.type	.L.str31,@object        # @.str31
.L.str31:
	.asciz	 "--best"
	.size	.L.str31, 7

	.type	.L.str32,@object        # @.str32
.L.str32:
	.asciz	 "--verbose"
	.size	.L.str32, 10

	.type	.L.str33,@object        # @.str33
.L.str33:
	.asciz	 "--help"
	.size	.L.str33, 7

	.type	.L.str34,@object        # @.str34
.L.str34:
	.asciz	 "%s: -c and -t cannot be used together.\n"
	.size	.L.str34, 40

	.type	.L.str35,@object        # @.str35
.L.str35:
	.asciz	 "\nYou can use the `bzip2recover' program to attempt to recover\ndata from undamaged sections of corrupted files.\n\n"
	.size	.L.str35, 113

	.type	tmpName,@object         # @tmpName
	.comm	tmpName,1034,16
	.type	.L.str36,@object        # @.str36
.L.str36:
	.asciz	 "testf: bad modes\n"
	.size	.L.str36, 18

	.type	.L.str37,@object        # @.str37
.L.str37:
	.asciz	 "(stdin)"
	.size	.L.str37, 8

	.type	.L.str38,@object        # @.str38
.L.str38:
	.asciz	 "%s: There are no files matching `%s'.\n"
	.size	.L.str38, 39

	.type	.L.str39,@object        # @.str39
.L.str39:
	.asciz	 "%s: Can't open input %s: %s.\n"
	.size	.L.str39, 30

	.type	.L.str40,@object        # @.str40
.L.str40:
	.asciz	 "%s: Input file %s is a directory.\n"
	.size	.L.str40, 35

	.type	.L.str41,@object        # @.str41
.L.str41:
	.asciz	 "%s: I won't read compressed data from a terminal.\n"
	.size	.L.str41, 51

	.type	.L.str42,@object        # @.str42
.L.str42:
	.asciz	 "%s: For help, type: `%s --help'.\n"
	.size	.L.str42, 34

	.type	.L.str43,@object        # @.str43
.L.str43:
	.asciz	 "rb"
	.size	.L.str43, 3

	.type	.L.str44,@object        # @.str44
.L.str44:
	.asciz	 "%s: Can't open input file %s:%s.\n"
	.size	.L.str44, 34

	.type	.L.str45,@object        # @.str45
.L.str45:
	.asciz	 "testf: bad srcMode"
	.size	.L.str45, 19

	.type	.L.str46,@object        # @.str46
.L.str46:
	.asciz	 "  %s: "
	.size	.L.str46, 7

	.type	.L.str47,@object        # @.str47
.L.str47:
	.asciz	 "ok\n"
	.size	.L.str47, 4

	.type	.L.str48,@object        # @.str48
.L.str48:
	.asciz	 "test:bzReadGetUnused"
	.size	.L.str48, 21

	.type	.L.str49,@object        # @.str49
.L.str49:
	.asciz	 "\n    "
	.size	.L.str49, 6

	.type	.L.str50,@object        # @.str50
.L.str50:
	.asciz	 "%s: %s: "
	.size	.L.str50, 9

	.type	.L.str51,@object        # @.str51
.L.str51:
	.asciz	 "data integrity (CRC) error in data\n"
	.size	.L.str51, 36

	.type	.L.str52,@object        # @.str52
.L.str52:
	.asciz	 "file ends unexpectedly\n"
	.size	.L.str52, 24

	.type	.L.str53,@object        # @.str53
.L.str53:
	.asciz	 "bad magic number (file not created by bzip2)\n"
	.size	.L.str53, 46

	.type	.L.str54,@object        # @.str54
.L.str54:
	.asciz	 "trailing garbage after EOF ignored\n"
	.size	.L.str54, 36

	.type	.L.str55,@object        # @.str55
.L.str55:
	.asciz	 "test:unexpected error"
	.size	.L.str55, 22

	.type	.L.str56,@object        # @.str56
.L.str56:
	.asciz	 "test:end"
	.size	.L.str56, 9

	.type	.L.str57,@object        # @.str57
.L.str57:
	.asciz	 "\n%s: couldn't allocate enough memory\n"
	.size	.L.str57, 38

	.type	.L.str58,@object        # @.str58
.L.str58:
	.asciz	 "%s: Deleting output file %s, if it exists.\n"
	.size	.L.str58, 44

	.type	.L.str59,@object        # @.str59
.L.str59:
	.asciz	 "%s: WARNING: deletion of output file (apparently) failed.\n"
	.size	.L.str59, 59

	.type	.L.str60,@object        # @.str60
.L.str60:
	.asciz	 "%s: WARNING: deletion of output file suppressed\n"
	.size	.L.str60, 49

	.type	.L.str61,@object        # @.str61
.L.str61:
	.asciz	 "%s:    since input file no longer exists.  Output file\n"
	.size	.L.str61, 56

	.type	.L.str62,@object        # @.str62
.L.str62:
	.asciz	 "%s:    `%s' may be incomplete.\n"
	.size	.L.str62, 32

	.type	.L.str63,@object        # @.str63
.L.str63:
	.asciz	 "%s:    I suggest doing an integrity test (bzip2 -tv) of it.\n"
	.size	.L.str63, 61

	.type	.L.str64,@object        # @.str64
.L.str64:
	.asciz	 "%s: WARNING: some files have not been processed:\n%s:    %d specified on command line, %d not processed yet.\n\n"
	.size	.L.str64, 110

	.type	.L.str65,@object        # @.str65
.L.str65:
	.asciz	 "\tInput file = %s, output file = %s\n"
	.size	.L.str65, 36

	.type	.L.str66,@object        # @.str66
.L.str66:
	.asciz	 "\n%s: I/O or other error, bailing out.  Possible reason follows.\n"
	.size	.L.str66, 65

	.type	.L.str67,@object        # @.str67
.L.str67:
	.asciz	 "bzip2: I'm not configured correctly for this platform!\n\tI require Int32, Int16 and Char to have sizes\n\tof 4, 2 and 1 bytes to run properly, and they don't.\n\tProbably you can fix this by defining them correctly,\n\tand recompiling.  Bye!\n"
	.size	.L.str67, 236

	.type	.L.str68,@object        # @.str68
.L.str68:
	.asciz	 " "
	.size	.L.str68, 2

	.type	.L.str69,@object        # @.str69
.L.str69:
	.asciz	 "\n%s: PANIC -- internal consistency error:\n\t%s\n\tThis is a BUG.  Please report it to me at:\n\tjseward@bzip.org\n"
	.size	.L.str69, 109

	.type	.L.str70,@object        # @.str70
.L.str70:
	.asciz	 "uncompress: bad modes\n"
	.size	.L.str70, 23

	.type	.L.str71,@object        # @.str71
.L.str71:
	.asciz	 "(stdout)"
	.size	.L.str71, 9

	.type	.L.str72,@object        # @.str72
.L.str72:
	.asciz	 ".out"
	.size	.L.str72, 5

	.type	.L.str73,@object        # @.str73
.L.str73:
	.asciz	 "%s: Can't open input file %s: %s.\n"
	.size	.L.str73, 35

	.type	.L.str74,@object        # @.str74
.L.str74:
	.asciz	 "%s: Input file %s is not a normal file.\n"
	.size	.L.str74, 41

	.type	.L.str75,@object        # @.str75
.L.str75:
	.asciz	 "%s: Can't guess original name for %s -- using %s\n"
	.size	.L.str75, 50

	.type	.L.str76,@object        # @.str76
.L.str76:
	.asciz	 "%s: Output file %s already exists.\n"
	.size	.L.str76, 36

	.type	.L.str77,@object        # @.str77
.L.str77:
	.asciz	 "%s: Input file %s has %d other link%s.\n"
	.size	.L.str77, 40

	.type	.L.str78,@object        # @.str78
.L.str78:
	.asciz	 "s"
	.size	.L.str78, 2

	.type	.L.str79,@object        # @.str79
.L.str79:
	.asciz	 "wb"
	.size	.L.str79, 3

	.type	.L.str80,@object        # @.str80
.L.str80:
	.asciz	 "%s: Can't create output file %s: %s.\n"
	.size	.L.str80, 38

	.type	.L.str81,@object        # @.str81
.L.str81:
	.asciz	 "uncompress: bad srcMode"
	.size	.L.str81, 24

	.type	.L.str82,@object        # @.str82
.L.str82:
	.asciz	 "done\n"
	.size	.L.str82, 6

	.type	.L.str83,@object        # @.str83
.L.str83:
	.asciz	 "not a bzip2 file.\n"
	.size	.L.str83, 19

	.type	.L.str84,@object        # @.str84
.L.str84:
	.asciz	 "%s: %s is not a bzip2 file.\n"
	.size	.L.str84, 29

	.type	fileMetaInfo,@object    # @fileMetaInfo
	.local	fileMetaInfo
	.comm	fileMetaInfo,144,8
	.type	.L.str85,@object        # @.str85
.L.str85:
	.asciz	 "decompress:bzReadGetUnused"
	.size	.L.str85, 27

	.type	.L.str86,@object        # @.str86
.L.str86:
	.asciz	 "\n%s: %s: trailing garbage after EOF ignored\n"
	.size	.L.str86, 45

	.type	.L.str87,@object        # @.str87
.L.str87:
	.asciz	 "decompress:unexpected error"
	.size	.L.str87, 28

	.type	.L.str88,@object        # @.str88
.L.str88:
	.asciz	 "decompress:end"
	.size	.L.str88, 15

	.type	.L.str89,@object        # @.str89
.L.str89:
	.asciz	 "\n%s: Compressed file ends unexpectedly;\n\tperhaps it is corrupted?  *Possible* reason follows.\n"
	.size	.L.str89, 95

	.type	.L.str90,@object        # @.str90
.L.str90:
	.asciz	 "\nIt is possible that the compressed file(s) have become corrupted.\nYou can use the -tvv option to test integrity of such files.\n\nYou can use the `bzip2recover' program to attempt to recover\ndata from undamaged sections of corrupted files.\n\n"
	.size	.L.str90, 241

	.type	.L.str91,@object        # @.str91
.L.str91:
	.asciz	 "\n%s: Data integrity error when decompressing.\n"
	.size	.L.str91, 47

	.type	.L.str92,@object        # @.str92
.L.str92:
	.asciz	 "compress: bad modes\n"
	.size	.L.str92, 21

	.type	.L.str93,@object        # @.str93
.L.str93:
	.asciz	 "%s: Input file %s already has %s suffix.\n"
	.size	.L.str93, 42

	.type	.L.str94,@object        # @.str94
.L.str94:
	.asciz	 "%s: I won't write compressed data to a terminal.\n"
	.size	.L.str94, 50

	.type	.L.str95,@object        # @.str95
.L.str95:
	.asciz	 "compress: bad srcMode"
	.size	.L.str95, 22

	.type	.L.str96,@object        # @.str96
.L.str96:
	.asciz	 "\n"
	.size	.L.str96, 2

	.type	.L.str97,@object        # @.str97
.L.str97:
	.asciz	 " no data compressed.\n"
	.size	.L.str97, 22

	.type	.L.str98,@object        # @.str98
.L.str98:
	.asciz	 "%6.3f:1, %6.3f bits/byte, %5.2f%% saved, %s in, %s out.\n"
	.size	.L.str98, 57

	.type	.L.str99,@object        # @.str99
.L.str99:
	.asciz	 "compress:unexpected error"
	.size	.L.str99, 26

	.type	.L.str100,@object       # @.str100
.L.str100:
	.asciz	 "compress:end"
	.size	.L.str100, 13

	.type	.L.str101,@object       # @.str101
.L.str101:
	.asciz	 "\n%s: Control-C or similar caught, quitting.\n"
	.size	.L.str101, 45

	.type	.L.str102,@object       # @.str102
.L.str102:
	.asciz	 "%s: %s is redundant in versions 0.9.5 and above\n"
	.size	.L.str102, 49

	.type	.L.str103,@object       # @.str103
.L.str103:
	.asciz	 "bzip2, a block-sorting file compressor.  Version %s.\n\n   usage: %s [flags and input files in any order]\n\n   -h --help           print this message\n   -d --decompress     force decompression\n   -z --compress       force compression\n   -k --keep           keep (don't delete) input files\n   -f --force          overwrite existing output files\n   -t --test           test compressed file integrity\n   -c --stdout         output to standard out\n   -q --quiet          suppress noncritical error messages\n   -v --verbose        be verbose (a 2nd -v gives more)\n   -L --license        display software version & license\n   -V --version        display software version & license\n   -s --small          use less memory (at most 2500k)\n   -1 .. -9            set block size to 100k .. 900k\n   --fast              alias for -1\n   --best              alias for -9\n\n   If invoked as `bzip2', default action is to compress.\n              as `bunzip2',  default action is to decompress.\n              as `bzcat', default action is to decompress to stdout.\n\n   If no file names are given, bzip2 compresses or decompresses\n   from standard input to standard output.  You can combine\n   short flags, so `-v -4' means the same as -v4 or -4v, &c.\n\n"
	.size	.L.str103, 1230

	.type	.L.str104,@object       # @.str104
.L.str104:
	.asciz	 "bzip2, a block-sorting file compressor.  Version %s.\n   \n   Copyright (C) 1996-2005 by Julian Seward.\n   \n   This program is free software; you can redistribute it and/or modify\n   it under the terms set out in the LICENSE file, which is included\n   in the bzip2-1.0 source distribution.\n   \n   This program is distributed in the hope that it will be useful,\n   but WITHOUT ANY WARRANTY; without even the implied warranty of\n   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n   LICENSE file for more details.\n   \n"
	.size	.L.str104, 529

	.type	.L.str105,@object       # @.str105
.L.str105:
	.asciz	 "bzip2: file name\n`%s'\nis suspiciously (more than %d chars) long.\nTry using a reasonable file name instead.  Sorry! :-)\n"
	.size	.L.str105, 120

	.type	.L.str106,@object       # @.str106
.L.str106:
	.asciz	 "\n%s: Caught a SIGSEGV or SIGBUS whilst compressing.\n\n   Possible causes are (most likely first):\n   (1) This computer has unreliable memory or cache hardware\n       (a surprisingly common problem; try a different machine.)\n   (2) A bug in the compiler used to create this executable\n       (unlikely, if you didn't compile bzip2 yourself.)\n   (3) A real bug in bzip2 -- I hope this should never be the case.\n   The user's manual, Section 4.3, has more info on (1) and (2).\n   \n   If you suspect this is a bug in bzip2, or are unsure about (1)\n   or (2), feel free to report it to me at: jseward@bzip.org.\n   Section 4.3 of the user's manual describes the info a useful\n   bug report should have.  If the manual is available on your\n   system, please try and read it before mailing me.  If you don't\n   have the manual or can't be bothered to read it, mail me anyway.\n\n"
	.size	.L.str106, 869

	.type	.L.str107,@object       # @.str107
.L.str107:
	.asciz	 "\n%s: Caught a SIGSEGV or SIGBUS whilst decompressing.\n\n   Possible causes are (most likely first):\n   (1) The compressed data is corrupted, and bzip2's usual checks\n       failed to detect this.  Try bzip2 -tvv my_file.bz2.\n   (2) This computer has unreliable memory or cache hardware\n       (a surprisingly common problem; try a different machine.)\n   (3) A bug in the compiler used to create this executable\n       (unlikely, if you didn't compile bzip2 yourself.)\n   (4) A real bug in bzip2 -- I hope this should never be the case.\n   The user's manual, Section 4.3, has more info on (2) and (3).\n   \n   If you suspect this is a bug in bzip2, or are unsure about (2)\n   or (3), feel free to report it to me at: jseward@bzip.org.\n   Section 4.3 of the user's manual describes the info a useful\n   bug report should have.  If the manual is available on your\n   system, please try and read it before mailing me.  If you don't\n   have the manual or can't be bothered to read it, mail me anyway.\n\n"
	.size	.L.str107, 996

	.type	.L.str108,@object       # @.str108
.L.str108:
	.asciz	 "\n\nbzip2/libbzip2: internal error number %d.\nThis is a bug in bzip2/libbzip2, %s.\nPlease report it to me at: jseward@bzip.org.  If this happened\nwhen you were using some program which uses libbzip2 as a\ncomponent, you should also report this bug to the author(s)\nof that program.  Please make an effort to report this bug;\ntimely and accurate bug reports eventually lead to higher\nquality software.  Thanks.  Julian Seward, 15 February 2005.\n\n"
	.size	.L.str108, 443

	.type	.L.str1109,@object      # @.str1109
.L.str1109:
	.asciz	 "\n*** A special note about internal error number 1007 ***\n\nExperience suggests that a common cause of i.e. 1007\nis unreliable memory or other hardware.  The 1007 assertion\njust happens to cross-check the results of huge numbers of\nmemory reads/writes, and so acts (unintendedly) as a stress\ntest of your memory system.\n\nI suggest the following: try compressing the file again,\npossibly monitoring progress in detail with the -vv flag.\n\n* If the error cannot be reproduced, and/or happens at different\n  points in compression, you may have a flaky memory system.\n  Try a memory-test program.  I have used Memtest86\n  (www.memtest86.com).  At the time of writing it is free (GPLd).\n  Memtest86 tests memory much more thorougly than your BIOSs\n  power-on test, and may find failures that the BIOS doesn't.\n\n* If the error can be repeatably reproduced, this is a bug in\n  bzip2, and I would very much like to hear about it.  Please\n  let me know, and, ideally, save a copy of the file causing the\n  problem -- without which I will be unable to investigate it.\n\n"
	.size	.L.str1109, 1057

	.type	.L.str2110,@object      # @.str2110
.L.str2110:
	.asciz	 " {0x%08x, 0x%08x}"
	.size	.L.str2110, 18

	.type	.L.str3111,@object      # @.str3111
.L.str3111:
	.asciz	 "]"
	.size	.L.str3111, 2

	.type	.L.str4112,@object      # @.str4112
.L.str4112:
	.asciz	 "\n    combined CRCs: stored = 0x%08x, computed = 0x%08x"
	.size	.L.str4112, 55

	.type	.L.str5113,@object      # @.str5113
.L.str5113:
	.asciz	 "1.0.3, 15-Feb-2005"
	.size	.L.str5113, 19

	.type	bzerrorstrings,@object  # @bzerrorstrings
	.data
	.align	16
bzerrorstrings:
	.quad	.L.str6114
	.quad	.L.str7115
	.quad	.L.str8116
	.quad	.L.str9117
	.quad	.L.str10118
	.quad	.L.str11119
	.quad	.L.str12120
	.quad	.L.str13121
	.quad	.L.str14122
	.quad	.L.str15123
	.quad	.L.str16124
	.quad	.L.str16124
	.quad	.L.str16124
	.quad	.L.str16124
	.quad	.L.str16124
	.quad	.L.str16124
	.size	bzerrorstrings, 128

	.type	.L.str6114,@object      # @.str6114
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str6114:
	.asciz	 "OK"
	.size	.L.str6114, 3

	.type	.L.str7115,@object      # @.str7115
.L.str7115:
	.asciz	 "SEQUENCE_ERROR"
	.size	.L.str7115, 15

	.type	.L.str8116,@object      # @.str8116
.L.str8116:
	.asciz	 "PARAM_ERROR"
	.size	.L.str8116, 12

	.type	.L.str9117,@object      # @.str9117
.L.str9117:
	.asciz	 "MEM_ERROR"
	.size	.L.str9117, 10

	.type	.L.str10118,@object     # @.str10118
.L.str10118:
	.asciz	 "DATA_ERROR"
	.size	.L.str10118, 11

	.type	.L.str11119,@object     # @.str11119
.L.str11119:
	.asciz	 "DATA_ERROR_MAGIC"
	.size	.L.str11119, 17

	.type	.L.str12120,@object     # @.str12120
.L.str12120:
	.asciz	 "IO_ERROR"
	.size	.L.str12120, 9

	.type	.L.str13121,@object     # @.str13121
.L.str13121:
	.asciz	 "UNEXPECTED_EOF"
	.size	.L.str13121, 15

	.type	.L.str14122,@object     # @.str14122
.L.str14122:
	.asciz	 "OUTBUFF_FULL"
	.size	.L.str14122, 13

	.type	.L.str15123,@object     # @.str15123
.L.str15123:
	.asciz	 "CONFIG_ERROR"
	.size	.L.str15123, 13

	.type	.L.str16124,@object     # @.str16124
.L.str16124:
	.asciz	 "???"
	.size	.L.str16124, 4

	.type	.L.str17125,@object     # @.str17125
.L.str17125:
	.asciz	 "w"
	.size	.L.str17125, 2

	.type	.L.str18126,@object     # @.str18126
.L.str18126:
	.asciz	 "r"
	.size	.L.str18126, 2

	.type	.L.str19127,@object     # @.str19127
.L.str19127:
	.asciz	 "b"
	.size	.L.str19127, 2

	.type	.L.str20128,@object     # @.str20128
.L.str20128:
	.zero	1
	.size	.L.str20128, 1

	.type	.L.str148,@object       # @.str148
.L.str148:
	.asciz	 "    block %d: crc = 0x%08x, combined CRC = 0x%08x, size = %d\n"
	.size	.L.str148, 62

	.type	.L.str1149,@object      # @.str1149
.L.str1149:
	.asciz	 "    final combined CRC = 0x%08x\n   "
	.size	.L.str1149, 36

	.type	.L.str2150,@object      # @.str2150
.L.str2150:
	.asciz	 "      %d in block, %d after MTF & 1-2 coding, %d+2 syms in use\n"
	.size	.L.str2150, 64

	.type	.L.str3151,@object      # @.str3151
.L.str3151:
	.asciz	 "      initial group %d, [%d .. %d], has %d syms (%4.1f%%)\n"
	.size	.L.str3151, 59

	.type	.L.str4152,@object      # @.str4152
.L.str4152:
	.asciz	 "      pass %d: size is %d, grp uses are "
	.size	.L.str4152, 41

	.type	.L.str5153,@object      # @.str5153
.L.str5153:
	.asciz	 "%d "
	.size	.L.str5153, 4

	.type	.L.str6154,@object      # @.str6154
.L.str6154:
	.asciz	 "\n"
	.size	.L.str6154, 2

	.type	.L.str7155,@object      # @.str7155
.L.str7155:
	.asciz	 "      bytes: mapping %d, "
	.size	.L.str7155, 26

	.type	.L.str8156,@object      # @.str8156
.L.str8156:
	.asciz	 "selectors %d, "
	.size	.L.str8156, 15

	.type	.L.str9157,@object      # @.str9157
.L.str9157:
	.asciz	 "code lengths %d, "
	.size	.L.str9157, 18

	.type	.L.str10158,@object     # @.str10158
.L.str10158:
	.asciz	 "codes %d\n"
	.size	.L.str10158, 10

	.type	BZ2_crc32Table,@object  # @BZ2_crc32Table
	.data
	.globl	BZ2_crc32Table
	.align	16
BZ2_crc32Table:
	.long	0                       # 0x0
	.long	79764919                # 0x4c11db7
	.long	159529838               # 0x9823b6e
	.long	222504665               # 0xd4326d9
	.long	319059676               # 0x130476dc
	.long	398814059               # 0x17c56b6b
	.long	445009330               # 0x1a864db2
	.long	507990021               # 0x1e475005
	.long	638119352               # 0x2608edb8
	.long	583659535               # 0x22c9f00f
	.long	797628118               # 0x2f8ad6d6
	.long	726387553               # 0x2b4bcb61
	.long	890018660               # 0x350c9b64
	.long	835552979               # 0x31cd86d3
	.long	1015980042              # 0x3c8ea00a
	.long	944750013               # 0x384fbdbd
	.long	1276238704              # 0x4c11db70
	.long	1221641927              # 0x48d0c6c7
	.long	1167319070              # 0x4593e01e
	.long	1095957929              # 0x4152fda9
	.long	1595256236              # 0x5f15adac
	.long	1540665371              # 0x5bd4b01b
	.long	1452775106              # 0x569796c2
	.long	1381403509              # 0x52568b75
	.long	1780037320              # 0x6a1936c8
	.long	1859660671              # 0x6ed82b7f
	.long	1671105958              # 0x639b0da6
	.long	1733955601              # 0x675a1011
	.long	2031960084              # 0x791d4014
	.long	2111593891              # 0x7ddc5da3
	.long	1889500026              # 0x709f7b7a
	.long	1952343757              # 0x745e66cd
	.long	2552477408              # 0x9823b6e0
	.long	2632100695              # 0x9ce2ab57
	.long	2443283854              # 0x91a18d8e
	.long	2506133561              # 0x95609039
	.long	2334638140              # 0x8b27c03c
	.long	2414271883              # 0x8fe6dd8b
	.long	2191915858              # 0x82a5fb52
	.long	2254759653              # 0x8664e6e5
	.long	3190512472              # 0xbe2b5b58
	.long	3135915759              # 0xbaea46ef
	.long	3081330742              # 0xb7a96036
	.long	3009969537              # 0xb3687d81
	.long	2905550212              # 0xad2f2d84
	.long	2850959411              # 0xa9ee3033
	.long	2762807018              # 0xa4ad16ea
	.long	2691435357              # 0xa06c0b5d
	.long	3560074640              # 0xd4326d90
	.long	3505614887              # 0xd0f37027
	.long	3719321342              # 0xddb056fe
	.long	3648080713              # 0xd9714b49
	.long	3342211916              # 0xc7361b4c
	.long	3287746299              # 0xc3f706fb
	.long	3467911202              # 0xceb42022
	.long	3396681109              # 0xca753d95
	.long	4063920168              # 0xf23a8028
	.long	4143685023              # 0xf6fb9d9f
	.long	4223187782              # 0xfbb8bb46
	.long	4286162673              # 0xff79a6f1
	.long	3779000052              # 0xe13ef6f4
	.long	3858754371              # 0xe5ffeb43
	.long	3904687514              # 0xe8bccd9a
	.long	3967668269              # 0xec7dd02d
	.long	881225847               # 0x34867077
	.long	809987520               # 0x30476dc0
	.long	1023691545              # 0x3d044b19
	.long	969234094               # 0x39c556ae
	.long	662832811               # 0x278206ab
	.long	591600412               # 0x23431b1c
	.long	771767749               # 0x2e003dc5
	.long	717299826               # 0x2ac12072
	.long	311336399               # 0x128e9dcf
	.long	374308984               # 0x164f8078
	.long	453813921               # 0x1b0ca6a1
	.long	533576470               # 0x1fcdbb16
	.long	25881363                # 0x18aeb13
	.long	88864420                # 0x54bf6a4
	.long	134795389               # 0x808d07d
	.long	214552010               # 0xcc9cdca
	.long	2023205639              # 0x7897ab07
	.long	2086057648              # 0x7c56b6b0
	.long	1897238633              # 0x71159069
	.long	1976864222              # 0x75d48dde
	.long	1804852699              # 0x6b93dddb
	.long	1867694188              # 0x6f52c06c
	.long	1645340341              # 0x6211e6b5
	.long	1724971778              # 0x66d0fb02
	.long	1587496639              # 0x5e9f46bf
	.long	1516133128              # 0x5a5e5b08
	.long	1461550545              # 0x571d7dd1
	.long	1406951526              # 0x53dc6066
	.long	1302016099              # 0x4d9b3063
	.long	1230646740              # 0x495a2dd4
	.long	1142491917              # 0x44190b0d
	.long	1087903418              # 0x40d816ba
	.long	2896545431              # 0xaca5c697
	.long	2825181984              # 0xa864db20
	.long	2770861561              # 0xa527fdf9
	.long	2716262478              # 0xa1e6e04e
	.long	3215044683              # 0xbfa1b04b
	.long	3143675388              # 0xbb60adfc
	.long	3055782693              # 0xb6238b25
	.long	3001194130              # 0xb2e29692
	.long	2326604591              # 0x8aad2b2f
	.long	2389456536              # 0x8e6c3698
	.long	2200899649              # 0x832f1041
	.long	2280525302              # 0x87ee0df6
	.long	2578013683              # 0x99a95df3
	.long	2640855108              # 0x9d684044
	.long	2418763421              # 0x902b669d
	.long	2498394922              # 0x94ea7b2a
	.long	3769900519              # 0xe0b41de7
	.long	3832873040              # 0xe4750050
	.long	3912640137              # 0xe9362689
	.long	3992402750              # 0xedf73b3e
	.long	4088425275              # 0xf3b06b3b
	.long	4151408268              # 0xf771768c
	.long	4197601365              # 0xfa325055
	.long	4277358050              # 0xfef34de2
	.long	3334271071              # 0xc6bcf05f
	.long	3263032808              # 0xc27dede8
	.long	3476998961              # 0xcf3ecb31
	.long	3422541446              # 0xcbffd686
	.long	3585640067              # 0xd5b88683
	.long	3514407732              # 0xd1799b34
	.long	3694837229              # 0xdc3abded
	.long	3640369242              # 0xd8fba05a
	.long	1762451694              # 0x690ce0ee
	.long	1842216281              # 0x6dcdfd59
	.long	1619975040              # 0x608edb80
	.long	1682949687              # 0x644fc637
	.long	2047383090              # 0x7a089632
	.long	2127137669              # 0x7ec98b85
	.long	1938468188              # 0x738aad5c
	.long	2001449195              # 0x774bb0eb
	.long	1325665622              # 0x4f040d56
	.long	1271206113              # 0x4bc510e1
	.long	1183200824              # 0x46863638
	.long	1111960463              # 0x42472b8f
	.long	1543535498              # 0x5c007b8a
	.long	1489069629              # 0x58c1663d
	.long	1434599652              # 0x558240e4
	.long	1363369299              # 0x51435d53
	.long	622672798               # 0x251d3b9e
	.long	568075817               # 0x21dc2629
	.long	748617968               # 0x2c9f00f0
	.long	677256519               # 0x285e1d47
	.long	907627842               # 0x36194d42
	.long	853037301               # 0x32d850f5
	.long	1067152940              # 0x3f9b762c
	.long	995781531               # 0x3b5a6b9b
	.long	51762726                # 0x315d626
	.long	131386257               # 0x7d4cb91
	.long	177728840               # 0xa97ed48
	.long	240578815               # 0xe56f0ff
	.long	269590778               # 0x1011a0fa
	.long	349224269               # 0x14d0bd4d
	.long	429104020               # 0x19939b94
	.long	491947555               # 0x1d528623
	.long	4046411278              # 0xf12f560e
	.long	4126034873              # 0xf5ee4bb9
	.long	4172115296              # 0xf8ad6d60
	.long	4234965207              # 0xfc6c70d7
	.long	3794477266              # 0xe22b20d2
	.long	3874110821              # 0xe6ea3d65
	.long	3953728444              # 0xeba91bbc
	.long	4016571915              # 0xef68060b
	.long	3609705398              # 0xd727bbb6
	.long	3555108353              # 0xd3e6a601
	.long	3735388376              # 0xdea580d8
	.long	3664026991              # 0xda649d6f
	.long	3290680682              # 0xc423cd6a
	.long	3236090077              # 0xc0e2d0dd
	.long	3449943556              # 0xcda1f604
	.long	3378572211              # 0xc960ebb3
	.long	3174993278              # 0xbd3e8d7e
	.long	3120533705              # 0xb9ff90c9
	.long	3032266256              # 0xb4bcb610
	.long	2961025959              # 0xb07daba7
	.long	2923101090              # 0xae3afba2
	.long	2868635157              # 0xaafbe615
	.long	2813903052              # 0xa7b8c0cc
	.long	2742672763              # 0xa379dd7b
	.long	2604032198              # 0x9b3660c6
	.long	2683796849              # 0x9ff77d71
	.long	2461293480              # 0x92b45ba8
	.long	2524268063              # 0x9675461f
	.long	2284983834              # 0x8832161a
	.long	2364738477              # 0x8cf30bad
	.long	2175806836              # 0x81b02d74
	.long	2238787779              # 0x857130c3
	.long	1569362073              # 0x5d8a9099
	.long	1498123566              # 0x594b8d2e
	.long	1409854455              # 0x5408abf7
	.long	1355396672              # 0x50c9b640
	.long	1317987909              # 0x4e8ee645
	.long	1246755826              # 0x4a4ffbf2
	.long	1192025387              # 0x470cdd2b
	.long	1137557660              # 0x43cdc09c
	.long	2072149281              # 0x7b827d21
	.long	2135122070              # 0x7f436096
	.long	1912620623              # 0x7200464f
	.long	1992383480              # 0x76c15bf8
	.long	1753615357              # 0x68860bfd
	.long	1816598090              # 0x6c47164a
	.long	1627664531              # 0x61043093
	.long	1707420964              # 0x65c52d24
	.long	295390185               # 0x119b4be9
	.long	358241886               # 0x155a565e
	.long	404320391               # 0x18197087
	.long	483945776               # 0x1cd86d30
	.long	43990325                # 0x29f3d35
	.long	106832002               # 0x65e2082
	.long	186451547               # 0xb1d065b
	.long	266083308               # 0xfdc1bec
	.long	932423249               # 0x3793a651
	.long	861060070               # 0x3352bbe6
	.long	1041341759              # 0x3e119d3f
	.long	986742920               # 0x3ad08088
	.long	613929101               # 0x2497d08d
	.long	542559546               # 0x2056cd3a
	.long	756411363               # 0x2d15ebe3
	.long	701822548               # 0x29d4f654
	.long	3316196985              # 0xc5a92679
	.long	3244833742              # 0xc1683bce
	.long	3425377559              # 0xcc2b1d17
	.long	3370778784              # 0xc8ea00a0
	.long	3601682597              # 0xd6ad50a5
	.long	3530312978              # 0xd26c4d12
	.long	3744426955              # 0xdf2f6bcb
	.long	3689838204              # 0xdbee767c
	.long	3819031489              # 0xe3a1cbc1
	.long	3881883254              # 0xe760d676
	.long	3928223919              # 0xea23f0af
	.long	4007849240              # 0xeee2ed18
	.long	4037393693              # 0xf0a5bd1d
	.long	4100235434              # 0xf464a0aa
	.long	4180117107              # 0xf9278673
	.long	4259748804              # 0xfde69bc4
	.long	2310601993              # 0x89b8fd09
	.long	2373574846              # 0x8d79e0be
	.long	2151335527              # 0x803ac667
	.long	2231098320              # 0x84fbdbd0
	.long	2596047829              # 0x9abc8bd5
	.long	2659030626              # 0x9e7d9662
	.long	2470359227              # 0x933eb0bb
	.long	2550115596              # 0x97ffad0c
	.long	2947551409              # 0xafb010b1
	.long	2876312838              # 0xab710d06
	.long	2788305887              # 0xa6322bdf
	.long	2733848168              # 0xa2f33668
	.long	3165939309              # 0xbcb4666d
	.long	3094707162              # 0xb8757bda
	.long	3040238851              # 0xb5365d03
	.long	2985771188              # 0xb1f740b4
	.size	BZ2_crc32Table, 1024

	.type	.L.str163,@object       # @.str163
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str163:
	.asciz	 "\n    [%d: huff+mtf "
	.size	.L.str163, 20

	.type	.L.str1164,@object      # @.str1164
.L.str1164:
	.asciz	 "rt+rld"
	.size	.L.str1164, 7

	.type	BZ2_rNums,@object       # @BZ2_rNums
	.data
	.globl	BZ2_rNums
	.align	16
BZ2_rNums:
	.long	619                     # 0x26b
	.long	720                     # 0x2d0
	.long	127                     # 0x7f
	.long	481                     # 0x1e1
	.long	931                     # 0x3a3
	.long	816                     # 0x330
	.long	813                     # 0x32d
	.long	233                     # 0xe9
	.long	566                     # 0x236
	.long	247                     # 0xf7
	.long	985                     # 0x3d9
	.long	724                     # 0x2d4
	.long	205                     # 0xcd
	.long	454                     # 0x1c6
	.long	863                     # 0x35f
	.long	491                     # 0x1eb
	.long	741                     # 0x2e5
	.long	242                     # 0xf2
	.long	949                     # 0x3b5
	.long	214                     # 0xd6
	.long	733                     # 0x2dd
	.long	859                     # 0x35b
	.long	335                     # 0x14f
	.long	708                     # 0x2c4
	.long	621                     # 0x26d
	.long	574                     # 0x23e
	.long	73                      # 0x49
	.long	654                     # 0x28e
	.long	730                     # 0x2da
	.long	472                     # 0x1d8
	.long	419                     # 0x1a3
	.long	436                     # 0x1b4
	.long	278                     # 0x116
	.long	496                     # 0x1f0
	.long	867                     # 0x363
	.long	210                     # 0xd2
	.long	399                     # 0x18f
	.long	680                     # 0x2a8
	.long	480                     # 0x1e0
	.long	51                      # 0x33
	.long	878                     # 0x36e
	.long	465                     # 0x1d1
	.long	811                     # 0x32b
	.long	169                     # 0xa9
	.long	869                     # 0x365
	.long	675                     # 0x2a3
	.long	611                     # 0x263
	.long	697                     # 0x2b9
	.long	867                     # 0x363
	.long	561                     # 0x231
	.long	862                     # 0x35e
	.long	687                     # 0x2af
	.long	507                     # 0x1fb
	.long	283                     # 0x11b
	.long	482                     # 0x1e2
	.long	129                     # 0x81
	.long	807                     # 0x327
	.long	591                     # 0x24f
	.long	733                     # 0x2dd
	.long	623                     # 0x26f
	.long	150                     # 0x96
	.long	238                     # 0xee
	.long	59                      # 0x3b
	.long	379                     # 0x17b
	.long	684                     # 0x2ac
	.long	877                     # 0x36d
	.long	625                     # 0x271
	.long	169                     # 0xa9
	.long	643                     # 0x283
	.long	105                     # 0x69
	.long	170                     # 0xaa
	.long	607                     # 0x25f
	.long	520                     # 0x208
	.long	932                     # 0x3a4
	.long	727                     # 0x2d7
	.long	476                     # 0x1dc
	.long	693                     # 0x2b5
	.long	425                     # 0x1a9
	.long	174                     # 0xae
	.long	647                     # 0x287
	.long	73                      # 0x49
	.long	122                     # 0x7a
	.long	335                     # 0x14f
	.long	530                     # 0x212
	.long	442                     # 0x1ba
	.long	853                     # 0x355
	.long	695                     # 0x2b7
	.long	249                     # 0xf9
	.long	445                     # 0x1bd
	.long	515                     # 0x203
	.long	909                     # 0x38d
	.long	545                     # 0x221
	.long	703                     # 0x2bf
	.long	919                     # 0x397
	.long	874                     # 0x36a
	.long	474                     # 0x1da
	.long	882                     # 0x372
	.long	500                     # 0x1f4
	.long	594                     # 0x252
	.long	612                     # 0x264
	.long	641                     # 0x281
	.long	801                     # 0x321
	.long	220                     # 0xdc
	.long	162                     # 0xa2
	.long	819                     # 0x333
	.long	984                     # 0x3d8
	.long	589                     # 0x24d
	.long	513                     # 0x201
	.long	495                     # 0x1ef
	.long	799                     # 0x31f
	.long	161                     # 0xa1
	.long	604                     # 0x25c
	.long	958                     # 0x3be
	.long	533                     # 0x215
	.long	221                     # 0xdd
	.long	400                     # 0x190
	.long	386                     # 0x182
	.long	867                     # 0x363
	.long	600                     # 0x258
	.long	782                     # 0x30e
	.long	382                     # 0x17e
	.long	596                     # 0x254
	.long	414                     # 0x19e
	.long	171                     # 0xab
	.long	516                     # 0x204
	.long	375                     # 0x177
	.long	682                     # 0x2aa
	.long	485                     # 0x1e5
	.long	911                     # 0x38f
	.long	276                     # 0x114
	.long	98                      # 0x62
	.long	553                     # 0x229
	.long	163                     # 0xa3
	.long	354                     # 0x162
	.long	666                     # 0x29a
	.long	933                     # 0x3a5
	.long	424                     # 0x1a8
	.long	341                     # 0x155
	.long	533                     # 0x215
	.long	870                     # 0x366
	.long	227                     # 0xe3
	.long	730                     # 0x2da
	.long	475                     # 0x1db
	.long	186                     # 0xba
	.long	263                     # 0x107
	.long	647                     # 0x287
	.long	537                     # 0x219
	.long	686                     # 0x2ae
	.long	600                     # 0x258
	.long	224                     # 0xe0
	.long	469                     # 0x1d5
	.long	68                      # 0x44
	.long	770                     # 0x302
	.long	919                     # 0x397
	.long	190                     # 0xbe
	.long	373                     # 0x175
	.long	294                     # 0x126
	.long	822                     # 0x336
	.long	808                     # 0x328
	.long	206                     # 0xce
	.long	184                     # 0xb8
	.long	943                     # 0x3af
	.long	795                     # 0x31b
	.long	384                     # 0x180
	.long	383                     # 0x17f
	.long	461                     # 0x1cd
	.long	404                     # 0x194
	.long	758                     # 0x2f6
	.long	839                     # 0x347
	.long	887                     # 0x377
	.long	715                     # 0x2cb
	.long	67                      # 0x43
	.long	618                     # 0x26a
	.long	276                     # 0x114
	.long	204                     # 0xcc
	.long	918                     # 0x396
	.long	873                     # 0x369
	.long	777                     # 0x309
	.long	604                     # 0x25c
	.long	560                     # 0x230
	.long	951                     # 0x3b7
	.long	160                     # 0xa0
	.long	578                     # 0x242
	.long	722                     # 0x2d2
	.long	79                      # 0x4f
	.long	804                     # 0x324
	.long	96                      # 0x60
	.long	409                     # 0x199
	.long	713                     # 0x2c9
	.long	940                     # 0x3ac
	.long	652                     # 0x28c
	.long	934                     # 0x3a6
	.long	970                     # 0x3ca
	.long	447                     # 0x1bf
	.long	318                     # 0x13e
	.long	353                     # 0x161
	.long	859                     # 0x35b
	.long	672                     # 0x2a0
	.long	112                     # 0x70
	.long	785                     # 0x311
	.long	645                     # 0x285
	.long	863                     # 0x35f
	.long	803                     # 0x323
	.long	350                     # 0x15e
	.long	139                     # 0x8b
	.long	93                      # 0x5d
	.long	354                     # 0x162
	.long	99                      # 0x63
	.long	820                     # 0x334
	.long	908                     # 0x38c
	.long	609                     # 0x261
	.long	772                     # 0x304
	.long	154                     # 0x9a
	.long	274                     # 0x112
	.long	580                     # 0x244
	.long	184                     # 0xb8
	.long	79                      # 0x4f
	.long	626                     # 0x272
	.long	630                     # 0x276
	.long	742                     # 0x2e6
	.long	653                     # 0x28d
	.long	282                     # 0x11a
	.long	762                     # 0x2fa
	.long	623                     # 0x26f
	.long	680                     # 0x2a8
	.long	81                      # 0x51
	.long	927                     # 0x39f
	.long	626                     # 0x272
	.long	789                     # 0x315
	.long	125                     # 0x7d
	.long	411                     # 0x19b
	.long	521                     # 0x209
	.long	938                     # 0x3aa
	.long	300                     # 0x12c
	.long	821                     # 0x335
	.long	78                      # 0x4e
	.long	343                     # 0x157
	.long	175                     # 0xaf
	.long	128                     # 0x80
	.long	250                     # 0xfa
	.long	170                     # 0xaa
	.long	774                     # 0x306
	.long	972                     # 0x3cc
	.long	275                     # 0x113
	.long	999                     # 0x3e7
	.long	639                     # 0x27f
	.long	495                     # 0x1ef
	.long	78                      # 0x4e
	.long	352                     # 0x160
	.long	126                     # 0x7e
	.long	857                     # 0x359
	.long	956                     # 0x3bc
	.long	358                     # 0x166
	.long	619                     # 0x26b
	.long	580                     # 0x244
	.long	124                     # 0x7c
	.long	737                     # 0x2e1
	.long	594                     # 0x252
	.long	701                     # 0x2bd
	.long	612                     # 0x264
	.long	669                     # 0x29d
	.long	112                     # 0x70
	.long	134                     # 0x86
	.long	694                     # 0x2b6
	.long	363                     # 0x16b
	.long	992                     # 0x3e0
	.long	809                     # 0x329
	.long	743                     # 0x2e7
	.long	168                     # 0xa8
	.long	974                     # 0x3ce
	.long	944                     # 0x3b0
	.long	375                     # 0x177
	.long	748                     # 0x2ec
	.long	52                      # 0x34
	.long	600                     # 0x258
	.long	747                     # 0x2eb
	.long	642                     # 0x282
	.long	182                     # 0xb6
	.long	862                     # 0x35e
	.long	81                      # 0x51
	.long	344                     # 0x158
	.long	805                     # 0x325
	.long	988                     # 0x3dc
	.long	739                     # 0x2e3
	.long	511                     # 0x1ff
	.long	655                     # 0x28f
	.long	814                     # 0x32e
	.long	334                     # 0x14e
	.long	249                     # 0xf9
	.long	515                     # 0x203
	.long	897                     # 0x381
	.long	955                     # 0x3bb
	.long	664                     # 0x298
	.long	981                     # 0x3d5
	.long	649                     # 0x289
	.long	113                     # 0x71
	.long	974                     # 0x3ce
	.long	459                     # 0x1cb
	.long	893                     # 0x37d
	.long	228                     # 0xe4
	.long	433                     # 0x1b1
	.long	837                     # 0x345
	.long	553                     # 0x229
	.long	268                     # 0x10c
	.long	926                     # 0x39e
	.long	240                     # 0xf0
	.long	102                     # 0x66
	.long	654                     # 0x28e
	.long	459                     # 0x1cb
	.long	51                      # 0x33
	.long	686                     # 0x2ae
	.long	754                     # 0x2f2
	.long	806                     # 0x326
	.long	760                     # 0x2f8
	.long	493                     # 0x1ed
	.long	403                     # 0x193
	.long	415                     # 0x19f
	.long	394                     # 0x18a
	.long	687                     # 0x2af
	.long	700                     # 0x2bc
	.long	946                     # 0x3b2
	.long	670                     # 0x29e
	.long	656                     # 0x290
	.long	610                     # 0x262
	.long	738                     # 0x2e2
	.long	392                     # 0x188
	.long	760                     # 0x2f8
	.long	799                     # 0x31f
	.long	887                     # 0x377
	.long	653                     # 0x28d
	.long	978                     # 0x3d2
	.long	321                     # 0x141
	.long	576                     # 0x240
	.long	617                     # 0x269
	.long	626                     # 0x272
	.long	502                     # 0x1f6
	.long	894                     # 0x37e
	.long	679                     # 0x2a7
	.long	243                     # 0xf3
	.long	440                     # 0x1b8
	.long	680                     # 0x2a8
	.long	879                     # 0x36f
	.long	194                     # 0xc2
	.long	572                     # 0x23c
	.long	640                     # 0x280
	.long	724                     # 0x2d4
	.long	926                     # 0x39e
	.long	56                      # 0x38
	.long	204                     # 0xcc
	.long	700                     # 0x2bc
	.long	707                     # 0x2c3
	.long	151                     # 0x97
	.long	457                     # 0x1c9
	.long	449                     # 0x1c1
	.long	797                     # 0x31d
	.long	195                     # 0xc3
	.long	791                     # 0x317
	.long	558                     # 0x22e
	.long	945                     # 0x3b1
	.long	679                     # 0x2a7
	.long	297                     # 0x129
	.long	59                      # 0x3b
	.long	87                      # 0x57
	.long	824                     # 0x338
	.long	713                     # 0x2c9
	.long	663                     # 0x297
	.long	412                     # 0x19c
	.long	693                     # 0x2b5
	.long	342                     # 0x156
	.long	606                     # 0x25e
	.long	134                     # 0x86
	.long	108                     # 0x6c
	.long	571                     # 0x23b
	.long	364                     # 0x16c
	.long	631                     # 0x277
	.long	212                     # 0xd4
	.long	174                     # 0xae
	.long	643                     # 0x283
	.long	304                     # 0x130
	.long	329                     # 0x149
	.long	343                     # 0x157
	.long	97                      # 0x61
	.long	430                     # 0x1ae
	.long	751                     # 0x2ef
	.long	497                     # 0x1f1
	.long	314                     # 0x13a
	.long	983                     # 0x3d7
	.long	374                     # 0x176
	.long	822                     # 0x336
	.long	928                     # 0x3a0
	.long	140                     # 0x8c
	.long	206                     # 0xce
	.long	73                      # 0x49
	.long	263                     # 0x107
	.long	980                     # 0x3d4
	.long	736                     # 0x2e0
	.long	876                     # 0x36c
	.long	478                     # 0x1de
	.long	430                     # 0x1ae
	.long	305                     # 0x131
	.long	170                     # 0xaa
	.long	514                     # 0x202
	.long	364                     # 0x16c
	.long	692                     # 0x2b4
	.long	829                     # 0x33d
	.long	82                      # 0x52
	.long	855                     # 0x357
	.long	953                     # 0x3b9
	.long	676                     # 0x2a4
	.long	246                     # 0xf6
	.long	369                     # 0x171
	.long	970                     # 0x3ca
	.long	294                     # 0x126
	.long	750                     # 0x2ee
	.long	807                     # 0x327
	.long	827                     # 0x33b
	.long	150                     # 0x96
	.long	790                     # 0x316
	.long	288                     # 0x120
	.long	923                     # 0x39b
	.long	804                     # 0x324
	.long	378                     # 0x17a
	.long	215                     # 0xd7
	.long	828                     # 0x33c
	.long	592                     # 0x250
	.long	281                     # 0x119
	.long	565                     # 0x235
	.long	555                     # 0x22b
	.long	710                     # 0x2c6
	.long	82                      # 0x52
	.long	896                     # 0x380
	.long	831                     # 0x33f
	.long	547                     # 0x223
	.long	261                     # 0x105
	.long	524                     # 0x20c
	.long	462                     # 0x1ce
	.long	293                     # 0x125
	.long	465                     # 0x1d1
	.long	502                     # 0x1f6
	.long	56                      # 0x38
	.long	661                     # 0x295
	.long	821                     # 0x335
	.long	976                     # 0x3d0
	.long	991                     # 0x3df
	.long	658                     # 0x292
	.long	869                     # 0x365
	.long	905                     # 0x389
	.long	758                     # 0x2f6
	.long	745                     # 0x2e9
	.long	193                     # 0xc1
	.long	768                     # 0x300
	.long	550                     # 0x226
	.long	608                     # 0x260
	.long	933                     # 0x3a5
	.long	378                     # 0x17a
	.long	286                     # 0x11e
	.long	215                     # 0xd7
	.long	979                     # 0x3d3
	.long	792                     # 0x318
	.long	961                     # 0x3c1
	.long	61                      # 0x3d
	.long	688                     # 0x2b0
	.long	793                     # 0x319
	.long	644                     # 0x284
	.long	986                     # 0x3da
	.long	403                     # 0x193
	.long	106                     # 0x6a
	.long	366                     # 0x16e
	.long	905                     # 0x389
	.long	644                     # 0x284
	.long	372                     # 0x174
	.long	567                     # 0x237
	.long	466                     # 0x1d2
	.long	434                     # 0x1b2
	.long	645                     # 0x285
	.long	210                     # 0xd2
	.long	389                     # 0x185
	.long	550                     # 0x226
	.long	919                     # 0x397
	.long	135                     # 0x87
	.long	780                     # 0x30c
	.long	773                     # 0x305
	.long	635                     # 0x27b
	.long	389                     # 0x185
	.long	707                     # 0x2c3
	.long	100                     # 0x64
	.long	626                     # 0x272
	.long	958                     # 0x3be
	.long	165                     # 0xa5
	.long	504                     # 0x1f8
	.long	920                     # 0x398
	.long	176                     # 0xb0
	.long	193                     # 0xc1
	.long	713                     # 0x2c9
	.long	857                     # 0x359
	.long	265                     # 0x109
	.long	203                     # 0xcb
	.long	50                      # 0x32
	.long	668                     # 0x29c
	.long	108                     # 0x6c
	.long	645                     # 0x285
	.long	990                     # 0x3de
	.long	626                     # 0x272
	.long	197                     # 0xc5
	.long	510                     # 0x1fe
	.long	357                     # 0x165
	.long	358                     # 0x166
	.long	850                     # 0x352
	.long	858                     # 0x35a
	.long	364                     # 0x16c
	.long	936                     # 0x3a8
	.long	638                     # 0x27e
	.size	BZ2_rNums, 2048

	.type	dbglvl,@object          # @dbglvl
	.globl	dbglvl
	.align	4
dbglvl:
	.long	4                       # 0x4
	.size	dbglvl, 4

	.type	seedi,@object           # @seedi
	.comm	seedi,8,8
	.type	.L.str175,@object       # @.str175
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str175:
	.asciz	 "spec_init\n"
	.size	.L.str175, 11

	.type	spec_fd,@object         # @spec_fd
	.comm	spec_fd,72,16
	.type	.L.str1176,@object      # @.str1176
.L.str1176:
	.asciz	 "spec_init: Error mallocing memory!\n"
	.size	.L.str1176, 36

	.type	.L.str2177,@object      # @.str2177
.L.str2177:
	.asciz	 "Creating Chunks\n"
	.size	.L.str2177, 17

	.type	.L.str3178,@object      # @.str3178
.L.str3178:
	.asciz	 "Creating Chunk %d\n"
	.size	.L.str3178, 19

	.type	.L.str4179,@object      # @.str4179
.L.str4179:
	.asciz	 "Filling input file\n"
	.size	.L.str4179, 20

	.type	.L.str5180,@object      # @.str5180
.L.str5180:
	.asciz	 "Can't open file %s: %s\n"
	.size	.L.str5180, 24

	.type	.L.str6181,@object      # @.str6181
.L.str6181:
	.asciz	 "Error reading from %s: %s\n"
	.size	.L.str6181, 27

	.type	.L.str7182,@object      # @.str7182
.L.str7182:
	.asciz	 "Duplicating %d bytes\n"
	.size	.L.str7182, 22

	.type	.L.str8183,@object      # @.str8183
.L.str8183:
	.asciz	 "spec_read: %d, %p, %d = "
	.size	.L.str8183, 25

	.type	.L.str9184,@object      # @.str9184
.L.str9184:
	.asciz	 "spec_read: fd=%d, > MAX_SPEC_FD!\n"
	.size	.L.str9184, 34

	.type	.L.str10185,@object     # @.str10185
.L.str10185:
	.asciz	 "EOF\n"
	.size	.L.str10185, 5

	.type	.L.str11186,@object     # @.str11186
.L.str11186:
	.asciz	 "%d\n"
	.size	.L.str11186, 4

	.type	.L.str12187,@object     # @.str12187
.L.str12187:
	.asciz	 "spec_fread: %p, (%d x %d) fd %d ="
	.size	.L.str12187, 34

	.type	.L.str13188,@object     # @.str13188
.L.str13188:
	.asciz	 "spec_fread: fd=%d, > MAX_SPEC_FD!\n"
	.size	.L.str13188, 35

	.type	.L.str14189,@object     # @.str14189
.L.str14189:
	.asciz	 "spec_getc: %d = "
	.size	.L.str14189, 17

	.type	.L.str15190,@object     # @.str15190
.L.str15190:
	.asciz	 "spec_ungetc: %d = "
	.size	.L.str15190, 19

	.type	.L.str16191,@object     # @.str16191
.L.str16191:
	.asciz	 "spec_ungetc: pos %d <= 0\n"
	.size	.L.str16191, 26

	.type	.L.str17192,@object     # @.str17192
.L.str17192:
	.asciz	 "spec_ungetc: can't unget something that wasn't what was in the buffer!\n"
	.size	.L.str17192, 72

	.type	.L.str18193,@object     # @.str18193
.L.str18193:
	.asciz	 "spec_write: %d, %p, %d = "
	.size	.L.str18193, 26

	.type	.L.str19194,@object     # @.str19194
.L.str19194:
	.asciz	 "spec_write: fd=%d, > MAX_SPEC_FD!\n"
	.size	.L.str19194, 35

	.type	.L.str20195,@object     # @.str20195
.L.str20195:
	.asciz	 "spec_fwrite: %p, %d, %d, %d = "
	.size	.L.str20195, 31

	.type	.L.str21196,@object     # @.str21196
.L.str21196:
	.asciz	 "spec_fwrite: fd=%d, > MAX_SPEC_FD!\n"
	.size	.L.str21196, 36

	.type	.L.str22197,@object     # @.str22197
.L.str22197:
	.asciz	 "spec_putc: %d, %d = "
	.size	.L.str22197, 21

	.type	EdgeProfCounters,@object # @EdgeProfCounters
	.local	EdgeProfCounters
	.comm	EdgeProfCounters,18772,16

	.section	".note.GNU-stack","",@progbits
