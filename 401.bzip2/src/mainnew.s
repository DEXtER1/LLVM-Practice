	.file	"mainnew.bc"
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
	jle	.LBB0_14
# BB#1:                                 # %if.else
	movl	52(%rsp), %eax
	addl	$34, %eax
	movl	%eax, 20(%rsp)
	testb	$1, 20(%rsp)
	je	.LBB0_3
# BB#2:                                 # %if.then5
	incl	20(%rsp)
.LBB0_3:                                # %if.end
	movslq	20(%rsp), %rax
	addq	64(%rsp), %rax
	movq	%rax, 32(%rsp)
	cmpl	$0, 44(%rsp)
	jg	.LBB0_5
# BB#4:                                 # %if.then7
	movl	$1, 44(%rsp)
.LBB0_5:                                # %if.end8
	cmpl	$101, 44(%rsp)
	jl	.LBB0_7
# BB#6:                                 # %if.then10
	movl	$100, 44(%rsp)
.LBB0_7:                                # %if.end11
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
	cmpl	$3, 48(%rsp)
	jl	.LBB0_11
# BB#8:                                 # %if.then13
	movl	24(%rsp), %edx
	subl	28(%rsp), %edx
	cvtsi2ss	%edx, %xmm0
	movl	$1, %eax
	movl	52(%rsp), %ecx
	movq	stderr(%rip), %rdi
	testl	%ecx, %ecx
	je	.LBB0_10
# BB#9:                                 # %cond.false
	movl	52(%rsp), %eax
.LBB0_10:                               # %cond.end
	cvtsi2ss	%eax, %xmm1
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str, %esi
	movb	$1, %al
	callq	fprintf
.LBB0_11:                               # %if.end21
	cmpl	$0, 28(%rsp)
	jns	.LBB0_15
# BB#12:                                # %if.then24
	cmpl	$2, 48(%rsp)
	jl	.LBB0_14
# BB#13:                                # %if.then27
	movq	stderr(%rip), %rdi
	movl	$.L.str1, %esi
	xorb	%al, %al
	callq	fprintf
.LBB0_14:                               # %if.end29
	movq	80(%rsp), %rax
	movq	24(%rax), %rdi
	movq	32(%rax), %rsi
	movl	48(%rsp), %r8d
	movl	52(%rsp), %ecx
	movq	56(%rsp), %rdx
	callq	fallbackSort
.LBB0_15:                               # %if.end33
	movq	80(%rsp), %rax
	movl	$-1, 48(%rax)
	movl	$0, 20(%rsp)
	jmp	.LBB0_16
	.align	16, 0x90
.LBB0_22:                               # %for.inc
                                        #   in Loop: Header=BB0_16 Depth=1
	incl	20(%rsp)
.LBB0_16:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	80(%rsp), %rax
	movl	20(%rsp), %ecx
	cmpl	108(%rax), %ecx
	jge	.LBB0_19
# BB#17:                                # %for.body
                                        #   in Loop: Header=BB0_16 Depth=1
	movslq	20(%rsp), %rax
	movq	72(%rsp), %rcx
	cmpl	$0, (%rcx,%rax,4)
	jne	.LBB0_22
# BB#18:                                # %if.then41
	movq	80(%rsp), %rax
	movl	20(%rsp), %ecx
	movl	%ecx, 48(%rax)
.LBB0_19:                               # %for.end
	movq	80(%rsp), %rax
	cmpl	$-1, 48(%rax)
	jne	.LBB0_21
# BB#20:                                # %if.then48
	movl	$1003, %edi             # imm = 0x3EB
	callq	BZ2_bz__AssertH__fail
.LBB0_21:                               # %if.end49
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
	subq	$2136, %rsp             # imm = 0x858
.Ltmp4:
	.cfi_def_cfa_offset 2144
	movq	%rdi, 2128(%rsp)
	movq	%rsi, 2120(%rsp)
	movq	%rdx, 2112(%rsp)
	movl	%ecx, 2108(%rsp)
	movl	%r8d, 2104(%rsp)
	movq	2120(%rsp), %rax
	movq	%rax, (%rsp)
	cmpl	$4, 2104(%rsp)
	jl	.LBB1_2
# BB#1:                                 # %if.then
	movq	stderr(%rip), %rdi
	movl	$.L.str3, %esi
	xorb	%al, %al
	callq	fprintf
.LBB1_2:                                # %if.end
	movl	$0, 40(%rsp)
	jmp	.LBB1_3
	.align	16, 0x90
.LBB1_4:                                # %for.inc
                                        #   in Loop: Header=BB1_3 Depth=1
	movslq	40(%rsp), %rax
	movl	$0, 1072(%rsp,%rax,4)
	incl	40(%rsp)
.LBB1_3:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$256, 40(%rsp)          # imm = 0x100
	jle	.LBB1_4
# BB#5:                                 # %for.end
	movl	$0, 40(%rsp)
	jmp	.LBB1_6
	.align	16, 0x90
.LBB1_7:                                # %for.inc10
                                        #   in Loop: Header=BB1_6 Depth=1
	movslq	40(%rsp), %rax
	movq	(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	incl	1072(%rsp,%rax,4)
	incl	40(%rsp)
.LBB1_6:                                # %for.cond2
                                        # =>This Inner Loop Header: Depth=1
	movl	40(%rsp), %eax
	cmpl	2108(%rsp), %eax
	jl	.LBB1_7
# BB#8:                                 # %for.end12
	movl	$0, 40(%rsp)
	jmp	.LBB1_9
	.align	16, 0x90
.LBB1_10:                               # %for.inc20
                                        #   in Loop: Header=BB1_9 Depth=1
	movslq	40(%rsp), %rax
	movl	1072(%rsp,%rax,4), %ecx
	movl	%ecx, 48(%rsp,%rax,4)
	incl	40(%rsp)
.LBB1_9:                                # %for.cond13
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$255, 40(%rsp)
	jle	.LBB1_10
# BB#11:                                # %for.end22
	movl	$1, 40(%rsp)
	jmp	.LBB1_12
	.align	16, 0x90
.LBB1_13:                               # %for.inc30
                                        #   in Loop: Header=BB1_12 Depth=1
	movslq	40(%rsp), %rax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movl	1072(%rsp,%rcx,4), %ecx
	addl	%ecx, 1072(%rsp,%rax,4)
	incl	40(%rsp)
.LBB1_12:                               # %for.cond23
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$256, 40(%rsp)          # imm = 0x100
	jle	.LBB1_13
# BB#14:                                # %for.end32
	movl	$0, 40(%rsp)
	jmp	.LBB1_15
	.align	16, 0x90
.LBB1_16:                               # %for.inc45
                                        #   in Loop: Header=BB1_15 Depth=1
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
	movq	2128(%rsp), %rax
	movslq	32(%rsp), %rcx
	movl	40(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	40(%rsp)
.LBB1_15:                               # %for.cond33
                                        # =>This Inner Loop Header: Depth=1
	movl	40(%rsp), %eax
	cmpl	2108(%rsp), %eax
	jl	.LBB1_16
# BB#17:                                # %for.end47
	movl	2108(%rsp), %ecx
	movl	%ecx, %eax
	sarl	$31, %eax
	shrl	$27, %eax
	addl	%ecx, %eax
	sarl	$5, %eax
	addl	$2, %eax
	movl	%eax, 8(%rsp)
	movl	$0, 40(%rsp)
	jmp	.LBB1_18
	.align	16, 0x90
.LBB1_19:                               # %for.inc55
                                        #   in Loop: Header=BB1_18 Depth=1
	movq	2112(%rsp), %rax
	movslq	40(%rsp), %rcx
	movl	$0, (%rax,%rcx,4)
	incl	40(%rsp)
.LBB1_18:                               # %for.cond49
                                        # =>This Inner Loop Header: Depth=1
	movl	40(%rsp), %eax
	cmpl	8(%rsp), %eax
	jl	.LBB1_19
# BB#20:                                # %for.end57
	movl	$0, 40(%rsp)
	jmp	.LBB1_21
	.align	16, 0x90
.LBB1_22:                               # %for.inc68
                                        #   in Loop: Header=BB1_21 Depth=1
	movslq	40(%rsp), %rax
	movl	1072(%rsp,%rax,4), %ecx
	movl	$1, %eax
	shll	%cl, %eax
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2112(%rsp), %rdx
	orl	%eax, (%rdx,%rcx,4)
	incl	40(%rsp)
.LBB1_21:                               # %for.cond58
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$255, 40(%rsp)
	jle	.LBB1_22
# BB#23:                                # %for.end70
	movl	$0, 40(%rsp)
	jmp	.LBB1_24
	.align	16, 0x90
.LBB1_25:                               # %for.inc96
                                        #   in Loop: Header=BB1_24 Depth=1
	movl	40(%rsp), %ecx
	addl	%ecx, %ecx
	addl	2108(%rsp), %ecx
	movl	$1, %eax
	shll	%cl, %eax
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2112(%rsp), %rdx
	orl	%eax, (%rdx,%rcx,4)
	movl	40(%rsp), %eax
	movl	2108(%rsp), %ecx
	leal	1(%rcx,%rax,2), %ecx
	movl	%ecx, %eax
	sarl	$5, %eax
	movslq	%eax, %rax
                                        # kill: CL<def> CL<kill> ECX<kill>
	movl	$1, %edx
	shll	%cl, %edx
	notl	%edx
	movq	2112(%rsp), %rcx
	andl	%edx, (%rcx,%rax,4)
	incl	40(%rsp)
.LBB1_24:                               # %for.cond71
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$31, 40(%rsp)
	jle	.LBB1_25
# BB#26:                                # %for.end98
	movl	$1, 44(%rsp)
	.align	16, 0x90
.LBB1_27:                               # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_30 Depth 2
                                        #     Child Loop BB1_37 Depth 2
                                        #       Child Loop BB1_38 Depth 3
                                        #       Child Loop BB1_43 Depth 3
                                        #       Child Loop BB1_45 Depth 3
                                        #       Child Loop BB1_48 Depth 3
                                        #       Child Loop BB1_53 Depth 3
                                        #       Child Loop BB1_55 Depth 3
                                        #       Child Loop BB1_60 Depth 3
	cmpl	$4, 2104(%rsp)
	jl	.LBB1_29
# BB#28:                                # %if.then101
                                        #   in Loop: Header=BB1_27 Depth=1
	movl	44(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str6, %esi
	xorb	%al, %al
	callq	fprintf
.LBB1_29:                               # %if.end103
                                        #   in Loop: Header=BB1_27 Depth=1
	movl	$0, 36(%rsp)
	movl	$0, 40(%rsp)
	jmp	.LBB1_30
	.align	16, 0x90
.LBB1_35:                               # %for.inc126
                                        #   in Loop: Header=BB1_30 Depth=2
	movq	2120(%rsp), %rax
	movslq	32(%rsp), %rcx
	movl	36(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	40(%rsp)
.LBB1_30:                               # %for.cond104
                                        #   Parent Loop BB1_27 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	40(%rsp), %eax
	cmpl	2108(%rsp), %eax
	jge	.LBB1_36
# BB#31:                                # %for.body107
                                        #   in Loop: Header=BB1_30 Depth=2
	movl	40(%rsp), %eax
	movl	%eax, %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2112(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	btl	%eax, %ecx
	jae	.LBB1_33
# BB#32:                                # %if.then114
                                        #   in Loop: Header=BB1_30 Depth=2
	movl	40(%rsp), %eax
	movl	%eax, 36(%rsp)
.LBB1_33:                               # %if.end115
                                        #   in Loop: Header=BB1_30 Depth=2
	movslq	40(%rsp), %rax
	movq	2128(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	subl	44(%rsp), %eax
	movl	%eax, 32(%rsp)
	jns	.LBB1_35
# BB#34:                                # %if.then121
                                        #   in Loop: Header=BB1_30 Depth=2
	movl	2108(%rsp), %eax
	addl	%eax, 32(%rsp)
	jmp	.LBB1_35
	.align	16, 0x90
.LBB1_36:                               # %for.end128
                                        #   in Loop: Header=BB1_27 Depth=1
	movl	$0, 12(%rsp)
	movl	$-1, 24(%rsp)
	jmp	.LBB1_37
	.align	16, 0x90
.LBB1_58:                               # %if.end226
                                        #   in Loop: Header=BB1_37 Depth=2
	movl	24(%rsp), %eax
	cmpl	28(%rsp), %eax
	jle	.LBB1_37
# BB#59:                                # %if.then229
                                        #   in Loop: Header=BB1_37 Depth=2
	movl	24(%rsp), %eax
	subl	28(%rsp), %eax
	movl	12(%rsp), %ecx
	leal	1(%rax,%rcx), %eax
	movl	%eax, 12(%rsp)
	movl	24(%rsp), %ecx
	movl	28(%rsp), %edx
	movq	2120(%rsp), %rsi
	movq	2128(%rsp), %rdi
	callq	fallbackQSort3
	movl	$-1, 20(%rsp)
	movl	28(%rsp), %eax
	movl	%eax, 40(%rsp)
	jmp	.LBB1_60
	.align	16, 0x90
.LBB1_63:                               # %for.inc251
                                        #   in Loop: Header=BB1_60 Depth=3
	incl	40(%rsp)
.LBB1_60:                               # %for.cond233
                                        #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	40(%rsp), %eax
	cmpl	24(%rsp), %eax
	jg	.LBB1_37
# BB#61:                                # %for.body236
                                        #   in Loop: Header=BB1_60 Depth=3
	movslq	40(%rsp), %rax
	movq	2128(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movq	2120(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 16(%rsp)
	cmpl	%eax, 20(%rsp)
	je	.LBB1_63
# BB#62:                                # %if.then243
                                        #   in Loop: Header=BB1_60 Depth=3
	movl	40(%rsp), %ecx
	movl	$1, %eax
	shll	%cl, %eax
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2112(%rsp), %rdx
	orl	%eax, (%rdx,%rcx,4)
	movl	16(%rsp), %eax
	movl	%eax, 20(%rsp)
	jmp	.LBB1_63
	.align	16, 0x90
.LBB1_37:                               # %while.body130
                                        #   Parent Loop BB1_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_38 Depth 3
                                        #       Child Loop BB1_43 Depth 3
                                        #       Child Loop BB1_45 Depth 3
                                        #       Child Loop BB1_48 Depth 3
                                        #       Child Loop BB1_53 Depth 3
                                        #       Child Loop BB1_55 Depth 3
                                        #       Child Loop BB1_60 Depth 3
	movl	24(%rsp), %eax
	incl	%eax
	movl	%eax, 32(%rsp)
	jmp	.LBB1_38
	.align	16, 0x90
.LBB1_41:                               # %while.body142
                                        #   in Loop: Header=BB1_38 Depth=3
	incl	32(%rsp)
.LBB1_38:                               # %while.cond132
                                        #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	32(%rsp), %ecx
	movl	%ecx, %eax
	sarl	$5, %eax
	movslq	%eax, %rax
	movq	2112(%rsp), %rdx
	movl	(%rdx,%rax,4), %edx
	xorb	%al, %al
	btl	%ecx, %edx
	jae	.LBB1_40
# BB#39:                                # %land.rhs
                                        #   in Loop: Header=BB1_38 Depth=3
	testb	$31, 32(%rsp)
	setne	%al
.LBB1_40:                               # %land.end
                                        #   in Loop: Header=BB1_38 Depth=3
	cmpb	$1, %al
	je	.LBB1_41
# BB#42:                                # %while.end
                                        #   in Loop: Header=BB1_37 Depth=2
	movl	32(%rsp), %eax
	movl	%eax, %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2112(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	btl	%eax, %ecx
	jae	.LBB1_47
	jmp	.LBB1_43
	.align	16, 0x90
.LBB1_44:                               # %while.body158
                                        #   in Loop: Header=BB1_43 Depth=3
	addl	$32, 32(%rsp)
.LBB1_43:                               # %while.cond152
                                        #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	32(%rsp), %eax
	sarl	$5, %eax
	movslq	%eax, %rax
	movq	2112(%rsp), %rcx
	cmpl	$-1, (%rcx,%rax,4)
	jne	.LBB1_45
	jmp	.LBB1_44
	.align	16, 0x90
.LBB1_46:                               # %while.body169
                                        #   in Loop: Header=BB1_45 Depth=3
	incl	32(%rsp)
.LBB1_45:                               # %while.cond161
                                        #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	32(%rsp), %eax
	movl	%eax, %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2112(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	btl	%eax, %ecx
	jb	.LBB1_46
.LBB1_47:                               # %if.end172
                                        #   in Loop: Header=BB1_37 Depth=2
	movl	32(%rsp), %eax
	decl	%eax
	movl	%eax, 28(%rsp)
	cmpl	2108(%rsp), %eax
	jge	.LBB1_64
	jmp	.LBB1_48
	.align	16, 0x90
.LBB1_51:                               # %while.body190
                                        #   in Loop: Header=BB1_48 Depth=3
	incl	32(%rsp)
.LBB1_48:                               # %while.cond178
                                        #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	32(%rsp), %ecx
	movl	%ecx, %eax
	sarl	$5, %eax
	movslq	%eax, %rax
	movq	2112(%rsp), %rdx
	movl	(%rdx,%rax,4), %edx
	xorb	%al, %al
	btl	%ecx, %edx
	jb	.LBB1_50
# BB#49:                                # %land.rhs186
                                        #   in Loop: Header=BB1_48 Depth=3
	testb	$31, 32(%rsp)
	setne	%al
.LBB1_50:                               # %land.end189
                                        #   in Loop: Header=BB1_48 Depth=3
	cmpb	$1, %al
	je	.LBB1_51
# BB#52:                                # %while.end192
                                        #   in Loop: Header=BB1_37 Depth=2
	movl	32(%rsp), %eax
	movl	%eax, %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2112(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	btl	%eax, %ecx
	jb	.LBB1_57
	jmp	.LBB1_53
	.align	16, 0x90
.LBB1_54:                               # %while.body207
                                        #   in Loop: Header=BB1_53 Depth=3
	addl	$32, 32(%rsp)
.LBB1_53:                               # %while.cond201
                                        #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	32(%rsp), %eax
	sarl	$5, %eax
	movslq	%eax, %rax
	movq	2112(%rsp), %rcx
	cmpl	$0, (%rcx,%rax,4)
	jne	.LBB1_55
	jmp	.LBB1_54
	.align	16, 0x90
.LBB1_56:                               # %while.body218
                                        #   in Loop: Header=BB1_55 Depth=3
	incl	32(%rsp)
.LBB1_55:                               # %while.cond210
                                        #   Parent Loop BB1_27 Depth=1
                                        #     Parent Loop BB1_37 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	32(%rsp), %eax
	movl	%eax, %ecx
	sarl	$5, %ecx
	movslq	%ecx, %rcx
	movq	2112(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	btl	%eax, %ecx
	jae	.LBB1_56
.LBB1_57:                               # %if.end221
                                        #   in Loop: Header=BB1_37 Depth=2
	movl	32(%rsp), %eax
	decl	%eax
	movl	%eax, 24(%rsp)
	cmpl	2108(%rsp), %eax
	jl	.LBB1_58
.LBB1_64:                               # %while.end255
                                        #   in Loop: Header=BB1_27 Depth=1
	cmpl	$4, 2104(%rsp)
	jl	.LBB1_66
# BB#65:                                # %if.then258
                                        #   in Loop: Header=BB1_27 Depth=1
	movl	12(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str7, %esi
	xorb	%al, %al
	callq	fprintf
.LBB1_66:                               # %if.end260
                                        #   in Loop: Header=BB1_27 Depth=1
	movl	44(%rsp), %eax
	addl	%eax, %eax
	movl	%eax, 44(%rsp)
	cmpl	2108(%rsp), %eax
	jg	.LBB1_68
# BB#67:                                # %lor.lhs.false
                                        #   in Loop: Header=BB1_27 Depth=1
	cmpl	$0, 12(%rsp)
	jne	.LBB1_27
.LBB1_68:                               # %while.end268
	cmpl	$4, 2104(%rsp)
	jl	.LBB1_70
# BB#69:                                # %if.then271
	movq	stderr(%rip), %rdi
	movl	$.L.str8, %esi
	xorb	%al, %al
	callq	fprintf
.LBB1_70:                               # %if.end273
	movl	$0, 36(%rsp)
	movl	$0, 40(%rsp)
	jmp	.LBB1_71
	.align	16, 0x90
.LBB1_74:                               # %for.inc292
                                        #   in Loop: Header=BB1_71 Depth=1
	movslq	36(%rsp), %rax
	decl	48(%rsp,%rax,4)
	movslq	40(%rsp), %rax
	movq	2128(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movq	(%rsp), %rcx
	movb	36(%rsp), %dl
	movb	%dl, (%rcx,%rax)
	incl	40(%rsp)
.LBB1_71:                               # %for.cond274
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_72 Depth 2
	movl	40(%rsp), %eax
	cmpl	2108(%rsp), %eax
	jge	.LBB1_75
	jmp	.LBB1_72
	.align	16, 0x90
.LBB1_73:                               # %while.body282
                                        #   in Loop: Header=BB1_72 Depth=2
	incl	36(%rsp)
.LBB1_72:                               # %while.cond
                                        #   Parent Loop BB1_71 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	36(%rsp), %rax
	cmpl	$0, 48(%rsp,%rax,4)
	jne	.LBB1_74
	jmp	.LBB1_73
.LBB1_75:                               # %for.end294
	cmpl	$256, 36(%rsp)          # imm = 0x100
	jl	.LBB1_77
# BB#76:                                # %if.then297
	movl	$1005, %edi             # imm = 0x3ED
	callq	BZ2_bz__AssertH__fail
.LBB1_77:                               # %if.end298
	addq	$2136, %rsp             # imm = 0x858
	ret
.Ltmp5:
	.size	fallbackSort, .Ltmp5-fallbackSort
	.cfi_endproc

	.align	16, 0x90
	.type	mainSort,@function
mainSort:                               # @mainSort
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp8:
	.cfi_def_cfa_offset 16
	subq	$3472, %rsp             # imm = 0xD90
.Ltmp9:
	.cfi_def_cfa_offset 3488
.Ltmp10:
	.cfi_offset %rbx, -16
	movq	%rdi, 3464(%rsp)
	movq	%rsi, 3456(%rsp)
	movq	%rdx, 3448(%rsp)
	movq	%rcx, 3440(%rsp)
	movl	%r8d, 3436(%rsp)
	movl	%r9d, 3432(%rsp)
	movq	3488(%rsp), %rax
	movq	%rax, 3424(%rsp)
	cmpl	$4, 3432(%rsp)
	jl	.LBB2_2
# BB#1:                                 # %if.then
	movq	stderr(%rip), %rdi
	movl	$.L.str2, %esi
	xorb	%al, %al
	callq	fprintf
.LBB2_2:                                # %if.end
	movl	$65536, 3420(%rsp)      # imm = 0x10000
	jmp	.LBB2_3
	.align	16, 0x90
.LBB2_4:                                # %for.inc
                                        #   in Loop: Header=BB2_3 Depth=1
	movq	3440(%rsp), %rax
	movslq	3420(%rsp), %rcx
	movl	$0, (%rax,%rcx,4)
	decl	3420(%rsp)
.LBB2_3:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 3420(%rsp)
	jns	.LBB2_4
# BB#5:                                 # %for.end
	movq	3456(%rsp), %rax
	movzbl	(%rax), %eax
	shll	$8, %eax
	movl	%eax, 3416(%rsp)
	movl	3436(%rsp), %eax
	decl	%eax
	movl	%eax, 3420(%rsp)
	jmp	.LBB2_6
	.align	16, 0x90
.LBB2_7:                                # %for.inc58
                                        #   in Loop: Header=BB2_6 Depth=1
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
	addl	$-4, 3420(%rsp)
.LBB2_6:                                # %for.cond3
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$3, 3420(%rsp)
	jl	.LBB2_8
	jmp	.LBB2_7
	.align	16, 0x90
.LBB2_9:                                # %for.inc77
                                        #   in Loop: Header=BB2_8 Depth=1
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
	decl	3420(%rsp)
.LBB2_8:                                # %for.cond61
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 3420(%rsp)
	jns	.LBB2_9
# BB#10:                                # %for.end79
	movl	$0, 3420(%rsp)
	jmp	.LBB2_11
	.align	16, 0x90
.LBB2_12:                               # %for.inc91
                                        #   in Loop: Header=BB2_11 Depth=1
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
	incl	3420(%rsp)
.LBB2_11:                               # %for.cond80
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$33, 3420(%rsp)
	jle	.LBB2_12
# BB#13:                                # %for.end93
	cmpl	$4, 3432(%rsp)
	jl	.LBB2_15
# BB#14:                                # %if.then96
	movq	stderr(%rip), %rdi
	movl	$.L.str3, %esi
	xorb	%al, %al
	callq	fprintf
.LBB2_15:                               # %if.end98
	movl	$1, 3420(%rsp)
	jmp	.LBB2_16
	.align	16, 0x90
.LBB2_17:                               # %for.inc109
                                        #   in Loop: Header=BB2_16 Depth=1
	movslq	3420(%rsp), %rax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movq	3440(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	addl	%ecx, (%rdx,%rax,4)
	incl	3420(%rsp)
.LBB2_16:                               # %for.cond99
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$65536, 3420(%rsp)      # imm = 0x10000
	jle	.LBB2_17
# BB#18:                                # %for.end111
	movq	3456(%rsp), %rax
	movzbl	(%rax), %eax
	shll	$8, %eax
	movw	%ax, 54(%rsp)
	movl	3436(%rsp), %eax
	decl	%eax
	movl	%eax, 3420(%rsp)
	jmp	.LBB2_19
	.align	16, 0x90
.LBB2_20:                               # %for.inc187
                                        #   in Loop: Header=BB2_19 Depth=1
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
	addl	$-4, 3420(%rsp)
.LBB2_19:                               # %for.cond117
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$3, 3420(%rsp)
	jl	.LBB2_21
	jmp	.LBB2_20
	.align	16, 0x90
.LBB2_22:                               # %for.inc209
                                        #   in Loop: Header=BB2_21 Depth=1
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
	decl	3420(%rsp)
.LBB2_21:                               # %for.cond190
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 3420(%rsp)
	jns	.LBB2_22
# BB#23:                                # %for.end211
	movl	$0, 3420(%rsp)
	jmp	.LBB2_24
	.align	16, 0x90
.LBB2_25:                               # %for.inc220
                                        #   in Loop: Header=BB2_24 Depth=1
	movslq	3420(%rsp), %rax
	movb	$0, 2112(%rsp,%rax)
	movslq	3420(%rsp), %rax
	movl	%eax, 2368(%rsp,%rax,4)
	incl	3420(%rsp)
.LBB2_24:                               # %for.cond212
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$255, 3420(%rsp)
	jle	.LBB2_25
# BB#26:                                # %for.end222
	movl	$1, 44(%rsp)
	.align	16, 0x90
.LBB2_27:                               # %do.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	44(%rsp), %eax
	leal	1(%rax,%rax,2), %eax
	movl	%eax, 44(%rsp)
	cmpl	$257, %eax              # imm = 0x101
	jl	.LBB2_27
	.align	16, 0x90
.LBB2_28:                               # %do.body226
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_29 Depth 2
                                        #       Child Loop BB2_31 Depth 3
	movslq	44(%rsp), %rax
	imulq	$1431655766, %rax, %rax # imm = 0x55555556
	movq	%rax, %rcx
	shrq	$63, %rcx
	shrq	$32, %rax
	addl	%ecx, %eax
	movl	%eax, 44(%rsp)
	movl	%eax, 3420(%rsp)
	jmp	.LBB2_29
	.align	16, 0x90
.LBB2_33:                               # %for.inc270
                                        #   in Loop: Header=BB2_29 Depth=2
	movslq	3416(%rsp), %rax
	movl	48(%rsp), %ecx
	movl	%ecx, 2368(%rsp,%rax,4)
	incl	3420(%rsp)
.LBB2_29:                               # %for.cond227
                                        #   Parent Loop BB2_28 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_31 Depth 3
	cmpl	$255, 3420(%rsp)
	jg	.LBB2_34
# BB#30:                                # %for.body230
                                        #   in Loop: Header=BB2_29 Depth=2
	movslq	3420(%rsp), %rax
	movl	2368(%rsp,%rax,4), %eax
	movl	%eax, 48(%rsp)
	movl	3420(%rsp), %eax
	movl	%eax, 3416(%rsp)
	.align	16, 0x90
.LBB2_31:                               # %while.cond
                                        #   Parent Loop BB2_28 Depth=1
                                        #     Parent Loop BB2_29 Depth=2
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
	jbe	.LBB2_33
# BB#32:                                # %while.body
                                        #   in Loop: Header=BB2_31 Depth=3
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
	jg	.LBB2_31
	jmp	.LBB2_33
	.align	16, 0x90
.LBB2_34:                               # %do.cond273
                                        #   in Loop: Header=BB2_28 Depth=1
	cmpl	$1, 44(%rsp)
	jne	.LBB2_28
# BB#35:                                # %do.end276
	movl	$0, 56(%rsp)
	movl	$0, 3420(%rsp)
	movl	$-2097153, %ebx         # imm = 0xFFFFFFFFFFDFFFFF
	jmp	.LBB2_36
	.align	16, 0x90
.LBB2_84:                               # %for.inc506
                                        #   in Loop: Header=BB2_36 Depth=1
	incl	3420(%rsp)
.LBB2_36:                               # %for.cond277
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_38 Depth 2
                                        #     Child Loop BB2_50 Depth 2
                                        #     Child Loop BB2_53 Depth 2
                                        #     Child Loop BB2_60 Depth 2
                                        #     Child Loop BB2_71 Depth 2
                                        #     Child Loop BB2_75 Depth 2
                                        #     Child Loop BB2_78 Depth 2
	cmpl	$255, 3420(%rsp)
	jg	.LBB2_85
# BB#37:                                # %for.body280
                                        #   in Loop: Header=BB2_36 Depth=1
	movslq	3420(%rsp), %rax
	movl	2368(%rsp,%rax,4), %eax
	movl	%eax, 3408(%rsp)
	movl	$0, 3416(%rsp)
	jmp	.LBB2_38
	.align	16, 0x90
.LBB2_46:                               # %for.inc326
                                        #   in Loop: Header=BB2_38 Depth=2
	incl	3416(%rsp)
.LBB2_38:                               # %for.cond283
                                        #   Parent Loop BB2_36 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$255, 3416(%rsp)
	jg	.LBB2_47
# BB#39:                                # %for.body286
                                        #   in Loop: Header=BB2_38 Depth=2
	movl	3416(%rsp), %eax
	cmpl	3408(%rsp), %eax
	je	.LBB2_46
# BB#40:                                # %if.then289
                                        #   in Loop: Header=BB2_38 Depth=2
	movl	3408(%rsp), %eax
	shll	$8, %eax
	addl	3416(%rsp), %eax
	movl	%eax, 3404(%rsp)
	movslq	3404(%rsp), %rax
	movq	3440(%rsp), %rcx
	testb	$32, 2(%rcx,%rax,4)
	jne	.LBB2_45
# BB#41:                                # %if.then294
                                        #   in Loop: Header=BB2_38 Depth=2
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
	jle	.LBB2_45
# BB#42:                                # %if.then305
                                        #   in Loop: Header=BB2_38 Depth=2
	cmpl	$4, 3432(%rsp)
	jl	.LBB2_44
# BB#43:                                # %if.then308
                                        #   in Loop: Header=BB2_38 Depth=2
	movl	36(%rsp), %r9d
	subl	40(%rsp), %r9d
	incl	%r9d
	movl	56(%rsp), %r8d
	movl	3416(%rsp), %ecx
	movl	3408(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str4, %esi
	xorb	%al, %al
	callq	fprintf
.LBB2_44:                               # %if.end312
                                        #   in Loop: Header=BB2_38 Depth=2
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
	js	.LBB2_87
.LBB2_45:                               # %if.end321
                                        #   in Loop: Header=BB2_38 Depth=2
	movq	3440(%rsp), %rax
	movslq	3404(%rsp), %rcx
	orl	$2097152, (%rax,%rcx,4) # imm = 0x200000
	jmp	.LBB2_46
	.align	16, 0x90
.LBB2_47:                               # %for.end328
                                        #   in Loop: Header=BB2_36 Depth=1
	movslq	3408(%rsp), %rax
	cmpb	$0, 2112(%rsp,%rax)
	je	.LBB2_49
# BB#48:                                # %if.then332
                                        #   in Loop: Header=BB2_36 Depth=1
	movl	$1006, %edi             # imm = 0x3EE
	callq	BZ2_bz__AssertH__fail
.LBB2_49:                               # %if.end333
                                        #   in Loop: Header=BB2_36 Depth=1
	movl	$0, 3416(%rsp)
	jmp	.LBB2_50
	.align	16, 0x90
.LBB2_51:                               # %for.inc354
                                        #   in Loop: Header=BB2_50 Depth=2
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
	incl	3416(%rsp)
.LBB2_50:                               # %for.cond334
                                        #   Parent Loop BB2_36 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$255, 3416(%rsp)
	jle	.LBB2_51
# BB#52:                                # %for.end356
                                        #   in Loop: Header=BB2_36 Depth=1
	movl	3408(%rsp), %eax
	shll	$8, %eax
	movslq	%eax, %rax
	movq	3440(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	andl	%ebx, %eax
	movl	%eax, 3416(%rsp)
	jmp	.LBB2_53
	.align	16, 0x90
.LBB2_58:                               # %for.inc387
                                        #   in Loop: Header=BB2_53 Depth=2
	incl	3416(%rsp)
.LBB2_53:                               # %for.cond361
                                        #   Parent Loop BB2_36 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	3408(%rsp), %rax
	movl	3416(%rsp), %ecx
	cmpl	1088(%rsp,%rax,4), %ecx
	jge	.LBB2_59
# BB#54:                                # %for.body366
                                        #   in Loop: Header=BB2_53 Depth=2
	movslq	3416(%rsp), %rax
	movq	3464(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	decl	%eax
	movl	%eax, 3412(%rsp)
	jns	.LBB2_56
# BB#55:                                # %if.then372
                                        #   in Loop: Header=BB2_53 Depth=2
	movl	3436(%rsp), %eax
	addl	%eax, 3412(%rsp)
.LBB2_56:                               # %if.end374
                                        #   in Loop: Header=BB2_53 Depth=2
	movslq	3412(%rsp), %rax
	movq	3456(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, 63(%rsp)
	movzbl	63(%rsp), %eax
	cmpb	$0, 2112(%rsp,%rax)
	jne	.LBB2_58
# BB#57:                                # %if.then380
                                        #   in Loop: Header=BB2_53 Depth=2
	movzbl	63(%rsp), %ecx
	movslq	1088(%rsp,%rcx,4), %rax
	leal	1(%rax), %esi
	movl	3412(%rsp), %edx
	movl	%esi, 1088(%rsp,%rcx,4)
	movq	3464(%rsp), %rcx
	movl	%edx, (%rcx,%rax,4)
	jmp	.LBB2_58
	.align	16, 0x90
.LBB2_59:                               # %for.end389
                                        #   in Loop: Header=BB2_36 Depth=1
	movl	3408(%rsp), %eax
	incl	%eax
	shll	$8, %eax
	movslq	%eax, %rax
	movq	3440(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	andl	%ebx, %eax
	decl	%eax
	movl	%eax, 3416(%rsp)
	jmp	.LBB2_60
	.align	16, 0x90
.LBB2_65:                               # %for.inc422
                                        #   in Loop: Header=BB2_60 Depth=2
	decl	3416(%rsp)
.LBB2_60:                               # %for.cond396
                                        #   Parent Loop BB2_36 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	3408(%rsp), %rax
	movl	3416(%rsp), %ecx
	cmpl	64(%rsp,%rax,4), %ecx
	jle	.LBB2_66
# BB#61:                                # %for.body401
                                        #   in Loop: Header=BB2_60 Depth=2
	movslq	3416(%rsp), %rax
	movq	3464(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	decl	%eax
	movl	%eax, 3412(%rsp)
	jns	.LBB2_63
# BB#62:                                # %if.then407
                                        #   in Loop: Header=BB2_60 Depth=2
	movl	3436(%rsp), %eax
	addl	%eax, 3412(%rsp)
.LBB2_63:                               # %if.end409
                                        #   in Loop: Header=BB2_60 Depth=2
	movslq	3412(%rsp), %rax
	movq	3456(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, 63(%rsp)
	movzbl	63(%rsp), %eax
	cmpb	$0, 2112(%rsp,%rax)
	jne	.LBB2_65
# BB#64:                                # %if.then415
                                        #   in Loop: Header=BB2_60 Depth=2
	movzbl	63(%rsp), %ecx
	movslq	64(%rsp,%rcx,4), %rax
	leal	-1(%rax), %esi
	movl	3412(%rsp), %edx
	movl	%esi, 64(%rsp,%rcx,4)
	movq	3464(%rsp), %rcx
	movl	%edx, (%rcx,%rax,4)
	jmp	.LBB2_65
	.align	16, 0x90
.LBB2_66:                               # %for.end424
                                        #   in Loop: Header=BB2_36 Depth=1
	movslq	3408(%rsp), %rax
	movl	1088(%rsp,%rax,4), %ecx
	decl	%ecx
	cmpl	64(%rsp,%rax,4), %ecx
	je	.LBB2_70
# BB#67:                                # %lor.lhs.false
                                        #   in Loop: Header=BB2_36 Depth=1
	movslq	3408(%rsp), %rax
	cmpl	$0, 1088(%rsp,%rax,4)
	jne	.LBB2_69
# BB#68:                                # %land.lhs.true
                                        #   in Loop: Header=BB2_36 Depth=1
	movl	3436(%rsp), %eax
	decl	%eax
	movslq	3408(%rsp), %rcx
	cmpl	%eax, 64(%rsp,%rcx,4)
	je	.LBB2_70
.LBB2_69:                               # %if.then441
                                        #   in Loop: Header=BB2_36 Depth=1
	movl	$1007, %edi             # imm = 0x3EF
	callq	BZ2_bz__AssertH__fail
.LBB2_70:                               # %if.end442
                                        #   in Loop: Header=BB2_36 Depth=1
	movl	$0, 3416(%rsp)
	jmp	.LBB2_71
	.align	16, 0x90
.LBB2_72:                               # %for.inc452
                                        #   in Loop: Header=BB2_71 Depth=2
	movl	3416(%rsp), %eax
	shll	$8, %eax
	addl	3408(%rsp), %eax
	movslq	%eax, %rax
	movq	3440(%rsp), %rcx
	orl	$2097152, (%rcx,%rax,4) # imm = 0x200000
	incl	3416(%rsp)
.LBB2_71:                               # %for.cond443
                                        #   Parent Loop BB2_36 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$255, 3416(%rsp)
	jle	.LBB2_72
# BB#73:                                # %for.end454
                                        #   in Loop: Header=BB2_36 Depth=1
	movslq	3408(%rsp), %rax
	movb	$1, 2112(%rsp,%rax)
	cmpl	$254, 3420(%rsp)
	jg	.LBB2_84
# BB#74:                                # %if.then459
                                        #   in Loop: Header=BB2_36 Depth=1
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
	jmp	.LBB2_75
	.align	16, 0x90
.LBB2_76:                               # %while.body474
                                        #   in Loop: Header=BB2_75 Depth=2
	incl	24(%rsp)
.LBB2_75:                               # %while.cond470
                                        #   Parent Loop BB2_36 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movb	24(%rsp), %cl
	movl	28(%rsp), %eax
	sarl	%cl, %eax
	cmpl	$65535, %eax            # imm = 0xFFFF
	jge	.LBB2_76
# BB#77:                                # %while.end476
                                        #   in Loop: Header=BB2_36 Depth=1
	movl	28(%rsp), %eax
	decl	%eax
	movl	%eax, 3416(%rsp)
	jmp	.LBB2_78
	.align	16, 0x90
.LBB2_81:                               # %for.inc496
                                        #   in Loop: Header=BB2_78 Depth=2
	decl	3416(%rsp)
.LBB2_78:                               # %for.cond478
                                        #   Parent Loop BB2_36 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 3416(%rsp)
	js	.LBB2_82
# BB#79:                                # %for.body481
                                        #   in Loop: Header=BB2_78 Depth=2
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
	cmpl	$33, 20(%rsp)
	jg	.LBB2_81
# BB#80:                                # %if.then491
                                        #   in Loop: Header=BB2_78 Depth=2
	movl	20(%rsp), %eax
	addl	3436(%rsp), %eax
	movslq	%eax, %rax
	movq	3448(%rsp), %rcx
	movw	18(%rsp), %dx
	movw	%dx, (%rcx,%rax,2)
	jmp	.LBB2_81
	.align	16, 0x90
.LBB2_82:                               # %for.end498
                                        #   in Loop: Header=BB2_36 Depth=1
	movl	28(%rsp), %eax
	decl	%eax
	movb	24(%rsp), %cl
	sarl	%cl, %eax
	cmpl	$65536, %eax            # imm = 0x10000
	jl	.LBB2_84
# BB#83:                                # %if.then503
                                        #   in Loop: Header=BB2_36 Depth=1
	movl	$1002, %edi             # imm = 0x3EA
	callq	BZ2_bz__AssertH__fail
	jmp	.LBB2_84
.LBB2_85:                               # %for.end508
	cmpl	$4, 3432(%rsp)
	jl	.LBB2_87
# BB#86:                                # %if.then511
	movl	56(%rsp), %ecx
	movl	3436(%rsp), %edx
	movl	%edx, %r8d
	subl	%ecx, %r8d
	movq	stderr(%rip), %rdi
	movl	$.L.str5, %esi
	xorb	%al, %al
	callq	fprintf
.LBB2_87:                               # %if.end514
	addq	$3472, %rsp             # imm = 0xD90
	popq	%rbx
	ret
.Ltmp11:
	.size	mainSort, .Ltmp11-mainSort
	.cfi_endproc

	.align	16, 0x90
	.type	mainQSort3,@function
mainQSort3:                             # @mainQSort3
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$1416, %rsp             # imm = 0x588
.Ltmp13:
	.cfi_def_cfa_offset 1424
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
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_43:                               # %if.end271
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
.LBB3_1:                                # %entry
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
                                        #       Child Loop BB3_3 Depth 3
                                        #       Child Loop BB3_11 Depth 3
                                        #         Child Loop BB3_16 Depth 4
                                        #     Child Loop BB3_29 Depth 2
                                        #     Child Loop BB3_35 Depth 2
	movl	%ecx, 112(%rsp,%rax,4)
	jmp	.LBB3_2
	.align	16, 0x90
.LBB3_24:                               # %if.then120
                                        #   in Loop: Header=BB3_2 Depth=2
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
.LBB3_2:                                # %entry
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_3 Depth 3
                                        #       Child Loop BB3_11 Depth 3
                                        #         Child Loop BB3_16 Depth 4
	incl	1336(%rsp)
.LBB3_3:                                # %while.cond
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$0, 1336(%rsp)
	jle	.LBB3_9
# BB#4:                                 # %while.body
                                        #   in Loop: Header=BB3_3 Depth=3
	cmpl	$100, 1336(%rsp)
	jl	.LBB3_6
# BB#5:                                 # %if.then
                                        #   in Loop: Header=BB3_3 Depth=3
	movl	$1001, %edi             # imm = 0x3E9
	callq	BZ2_bz__AssertH__fail
.LBB3_6:                                # %if.end
                                        #   in Loop: Header=BB3_3 Depth=3
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
	cmpl	$20, %eax
	jl	.LBB3_8
# BB#7:                                 # %lor.lhs.false
                                        #   in Loop: Header=BB3_3 Depth=3
	cmpl	$15, 1324(%rsp)
	jl	.LBB3_10
.LBB3_8:                                # %if.then14
                                        #   in Loop: Header=BB3_3 Depth=3
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
	jns	.LBB3_3
	jmp	.LBB3_9
	.align	16, 0x90
.LBB3_10:                               # %if.end18
                                        #   in Loop: Header=BB3_2 Depth=2
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
	jmp	.LBB3_11
	.align	16, 0x90
.LBB3_22:                               # %if.end105
                                        #   in Loop: Header=BB3_11 Depth=3
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
.LBB3_11:                               # %while.body37
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_2 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_16 Depth 4
	movl	1364(%rsp), %eax
	cmpl	1360(%rsp), %eax
	jg	.LBB3_16
# BB#12:                                # %if.end41
                                        #   in Loop: Header=BB3_11 Depth=3
	movslq	1364(%rsp), %rax
	movq	1408(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	addl	1324(%rsp), %eax
	movq	1400(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	subl	1340(%rsp), %eax
	movl	%eax, 1348(%rsp)
	jne	.LBB3_14
# BB#13:                                # %if.then51
                                        #   in Loop: Header=BB3_11 Depth=3
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
	jmp	.LBB3_11
	.align	16, 0x90
.LBB3_14:                               # %if.end62
                                        #   in Loop: Header=BB3_11 Depth=3
	cmpl	$0, 1348(%rsp)
	jg	.LBB3_16
# BB#15:                                # %if.end66
                                        #   in Loop: Header=BB3_11 Depth=3
	incl	1364(%rsp)
	jmp	.LBB3_11
	.align	16, 0x90
.LBB3_18:                               # %if.then83
                                        #   in Loop: Header=BB3_16 Depth=4
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
.LBB3_16:                               # %while.body69
                                        #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_2 Depth=2
                                        #       Parent Loop BB3_11 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	1364(%rsp), %eax
	cmpl	1360(%rsp), %eax
	jg	.LBB3_21
# BB#17:                                # %if.end73
                                        #   in Loop: Header=BB3_16 Depth=4
	movslq	1360(%rsp), %rax
	movq	1408(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	addl	1324(%rsp), %eax
	movq	1400(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	subl	1340(%rsp), %eax
	movl	%eax, 1348(%rsp)
	je	.LBB3_18
# BB#19:                                # %if.end95
                                        #   in Loop: Header=BB3_16 Depth=4
	cmpl	$0, 1348(%rsp)
	js	.LBB3_21
# BB#20:                                # %if.end99
                                        #   in Loop: Header=BB3_16 Depth=4
	decl	1360(%rsp)
	jmp	.LBB3_16
	.align	16, 0x90
.LBB3_21:                               # %while.end101
                                        #   in Loop: Header=BB3_11 Depth=3
	movl	1364(%rsp), %eax
	cmpl	1360(%rsp), %eax
	jle	.LBB3_22
# BB#23:                                # %while.end117
                                        #   in Loop: Header=BB3_2 Depth=2
	movl	1352(%rsp), %eax
	cmpl	1356(%rsp), %eax
	jl	.LBB3_24
# BB#25:                                # %if.end129
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	1356(%rsp), %eax
	movl	1364(%rsp), %ecx
	subl	%eax, %ecx
	subl	1332(%rsp), %eax
	cmpl	%ecx, %eax
	jge	.LBB3_27
# BB#26:                                # %cond.true
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	1356(%rsp), %eax
	subl	1332(%rsp), %eax
	jmp	.LBB3_28
	.align	16, 0x90
.LBB3_27:                               # %cond.false
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	1364(%rsp), %eax
	subl	1356(%rsp), %eax
.LBB3_28:                               # %cond.end
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	%eax, 1348(%rsp)
	movl	1332(%rsp), %eax
	movl	%eax, 60(%rsp)
	movl	1364(%rsp), %eax
	subl	1348(%rsp), %eax
	movl	%eax, 56(%rsp)
	movl	1348(%rsp), %eax
	movl	%eax, 52(%rsp)
	jmp	.LBB3_29
	.align	16, 0x90
.LBB3_30:                               # %while.body140
                                        #   in Loop: Header=BB3_29 Depth=2
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
.LBB3_29:                               # %while.cond137
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 52(%rsp)
	jg	.LBB3_30
# BB#31:                                # %while.end153
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	1352(%rsp), %eax
	movl	1328(%rsp), %ecx
	subl	%eax, %ecx
	subl	1360(%rsp), %eax
	cmpl	%eax, %ecx
	jge	.LBB3_33
# BB#32:                                # %cond.true158
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	1328(%rsp), %eax
	subl	1352(%rsp), %eax
	jmp	.LBB3_34
	.align	16, 0x90
.LBB3_33:                               # %cond.false160
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	1352(%rsp), %eax
	subl	1360(%rsp), %eax
.LBB3_34:                               # %cond.end162
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
	jmp	.LBB3_35
	.align	16, 0x90
.LBB3_36:                               # %while.body172
                                        #   in Loop: Header=BB3_35 Depth=2
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
.LBB3_35:                               # %while.cond169
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 36(%rsp)
	jg	.LBB3_36
# BB#37:                                # %while.end185
                                        #   in Loop: Header=BB3_1 Depth=1
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
	jge	.LBB3_39
# BB#38:                                # %if.then212
                                        #   in Loop: Header=BB3_1 Depth=1
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
.LBB3_39:                               # %if.end225
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	92(%rsp), %eax
	movl	96(%rsp), %ecx
	subl	108(%rsp), %ecx
	subl	104(%rsp), %eax
	cmpl	%ecx, %eax
	jge	.LBB3_41
# BB#40:                                # %if.then234
                                        #   in Loop: Header=BB3_1 Depth=1
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
.LBB3_41:                               # %if.end248
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	88(%rsp), %eax
	movl	92(%rsp), %ecx
	subl	104(%rsp), %ecx
	subl	100(%rsp), %eax
	cmpl	%ecx, %eax
	jge	.LBB3_43
# BB#42:                                # %if.then257
                                        #   in Loop: Header=BB3_1 Depth=1
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
	jmp	.LBB3_43
.LBB3_9:                                # %while.end302
	addq	$1416, %rsp             # imm = 0x588
	ret
.Ltmp14:
	.size	mainQSort3, .Ltmp14-mainQSort3
	.cfi_endproc

	.align	16, 0x90
	.type	mainSimpleSort,@function
mainSimpleSort:                         # @mainSimpleSort
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$72, %rsp
.Ltmp16:
	.cfi_def_cfa_offset 80
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
	cmpl	$2, %eax
	jl	.LBB4_19
# BB#1:                                 # %if.end
	movl	$0, 4(%rsp)
	jmp	.LBB4_2
	.align	16, 0x90
.LBB4_3:                                # %while.body
                                        #   in Loop: Header=BB4_2 Depth=1
	incl	4(%rsp)
.LBB4_2:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movslq	4(%rsp), %rax
	movl	incs(,%rax,4), %eax
	cmpl	8(%rsp), %eax
	jl	.LBB4_3
.LBB4_4:                                # %while.end
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_6 Depth 2
                                        #       Child Loop BB4_8 Depth 3
                                        #       Child Loop BB4_12 Depth 3
                                        #       Child Loop BB4_16 Depth 3
	decl	4(%rsp)
	cmpl	$0, 4(%rsp)
	js	.LBB4_19
# BB#5:                                 # %for.body
                                        #   in Loop: Header=BB4_4 Depth=1
	movslq	4(%rsp), %rax
	movl	incs(,%rax,4), %eax
	movl	%eax, 12(%rsp)
	addl	40(%rsp), %eax
	movl	%eax, 20(%rsp)
	.align	16, 0x90
.LBB4_6:                                # %while.body7
                                        #   Parent Loop BB4_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_8 Depth 3
                                        #       Child Loop BB4_12 Depth 3
                                        #       Child Loop BB4_16 Depth 3
	movl	20(%rsp), %eax
	cmpl	36(%rsp), %eax
	jg	.LBB4_4
# BB#7:                                 # %if.end10
                                        #   in Loop: Header=BB4_6 Depth=2
	movslq	20(%rsp), %rax
	movq	64(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, (%rsp)
	movl	20(%rsp), %eax
	movl	%eax, 16(%rsp)
	.align	16, 0x90
.LBB4_8:                                # %while.cond13
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_6 Depth=2
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
	je	.LBB4_10
# BB#9:                                 # %while.body19
                                        #   in Loop: Header=BB4_8 Depth=3
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
	jg	.LBB4_8
.LBB4_10:                               # %while.end31
                                        #   in Loop: Header=BB4_6 Depth=2
	movq	64(%rsp), %rax
	movslq	16(%rsp), %rcx
	movl	(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	20(%rsp), %eax
	incl	%eax
	movl	%eax, 20(%rsp)
	cmpl	36(%rsp), %eax
	jg	.LBB4_4
# BB#11:                                # %if.end37
                                        #   in Loop: Header=BB4_6 Depth=2
	movslq	20(%rsp), %rax
	movq	64(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, (%rsp)
	movl	20(%rsp), %eax
	movl	%eax, 16(%rsp)
	.align	16, 0x90
.LBB4_12:                               # %while.cond40
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_6 Depth=2
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
# BB#13:                                # %while.body48
                                        #   in Loop: Header=BB4_12 Depth=3
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
	jg	.LBB4_12
.LBB4_14:                               # %while.end60
                                        #   in Loop: Header=BB4_6 Depth=2
	movq	64(%rsp), %rax
	movslq	16(%rsp), %rcx
	movl	(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	20(%rsp), %eax
	incl	%eax
	movl	%eax, 20(%rsp)
	cmpl	36(%rsp), %eax
	jg	.LBB4_4
# BB#15:                                # %if.end66
                                        #   in Loop: Header=BB4_6 Depth=2
	movslq	20(%rsp), %rax
	movq	64(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, (%rsp)
	movl	20(%rsp), %eax
	movl	%eax, 16(%rsp)
	.align	16, 0x90
.LBB4_16:                               # %while.cond69
                                        #   Parent Loop BB4_4 Depth=1
                                        #     Parent Loop BB4_6 Depth=2
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
	je	.LBB4_18
# BB#17:                                # %while.body77
                                        #   in Loop: Header=BB4_16 Depth=3
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
	jg	.LBB4_16
.LBB4_18:                               # %while.end89
                                        #   in Loop: Header=BB4_6 Depth=2
	movq	64(%rsp), %rax
	movslq	16(%rsp), %rcx
	movl	(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	20(%rsp)
	movq	24(%rsp), %rax
	cmpl	$0, (%rax)
	jns	.LBB4_6
.LBB4_19:                               # %for.end
	addq	$72, %rsp
	ret
.Ltmp17:
	.size	mainSimpleSort, .Ltmp17-mainSimpleSort
	.cfi_endproc

	.align	16, 0x90
	.type	mmed3,@function
mmed3:                                  # @mmed3
	.cfi_startproc
# BB#0:                                 # %entry
	movb	%dil, -1(%rsp)
	movb	%sil, -2(%rsp)
	movb	%dl, -3(%rsp)
	movzbl	-2(%rsp), %eax
	movzbl	-1(%rsp), %ecx
	cmpl	%eax, %ecx
	jle	.LBB5_2
# BB#1:                                 # %if.then
	movb	-1(%rsp), %al
	movb	%al, -4(%rsp)
	movb	-2(%rsp), %al
	movb	%al, -1(%rsp)
	movb	-4(%rsp), %al
	movb	%al, -2(%rsp)
.LBB5_2:                                # %if.end
	movzbl	-3(%rsp), %eax
	movzbl	-2(%rsp), %ecx
	cmpl	%eax, %ecx
	jle	.LBB5_5
# BB#3:                                 # %if.then7
	movb	-3(%rsp), %al
	movb	%al, -2(%rsp)
	movzbl	-2(%rsp), %eax
	movzbl	-1(%rsp), %ecx
	cmpl	%eax, %ecx
	jle	.LBB5_5
# BB#4:                                 # %if.then12
	movb	-1(%rsp), %al
	movb	%al, -2(%rsp)
.LBB5_5:                                # %if.end14
	movzbl	-2(%rsp), %eax
	ret
.Ltmp18:
	.size	mmed3, .Ltmp18-mmed3
	.cfi_endproc

	.align	16, 0x90
	.type	mainGtU,@function
mainGtU:                                # @mainGtU
	.cfi_startproc
# BB#0:                                 # %entry
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
	jne	.LBB6_1
# BB#3:                                 # %if.end
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
	jne	.LBB6_1
# BB#4:                                 # %if.end25
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
	jne	.LBB6_1
# BB#5:                                 # %if.end42
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
	jne	.LBB6_1
# BB#6:                                 # %if.end59
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
	jne	.LBB6_1
# BB#7:                                 # %if.end76
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
	jne	.LBB6_1
# BB#8:                                 # %if.end93
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
	jne	.LBB6_1
# BB#9:                                 # %if.end110
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
	jne	.LBB6_1
# BB#10:                                # %if.end127
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
	jne	.LBB6_1
# BB#11:                                # %if.end144
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
	jne	.LBB6_1
# BB#12:                                # %if.end161
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
	jne	.LBB6_1
# BB#13:                                # %if.end178
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
	jne	.LBB6_1
# BB#14:                                # %if.end195
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-36(%rsp), %eax
	addl	$8, %eax
	movl	%eax, -52(%rsp)
.LBB6_15:                               # %do.body
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
	jne	.LBB6_1
# BB#16:                                # %if.end212
                                        #   in Loop: Header=BB6_15 Depth=1
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
	jne	.LBB6_17
# BB#18:                                # %if.end227
                                        #   in Loop: Header=BB6_15 Depth=1
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
	jne	.LBB6_1
# BB#19:                                # %if.end244
                                        #   in Loop: Header=BB6_15 Depth=1
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
	jne	.LBB6_17
# BB#20:                                # %if.end259
                                        #   in Loop: Header=BB6_15 Depth=1
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
	jne	.LBB6_1
# BB#21:                                # %if.end276
                                        #   in Loop: Header=BB6_15 Depth=1
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
	jne	.LBB6_17
# BB#22:                                # %if.end291
                                        #   in Loop: Header=BB6_15 Depth=1
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
	jne	.LBB6_1
# BB#23:                                # %if.end308
                                        #   in Loop: Header=BB6_15 Depth=1
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
	jne	.LBB6_17
# BB#24:                                # %if.end323
                                        #   in Loop: Header=BB6_15 Depth=1
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
	jne	.LBB6_1
# BB#25:                                # %if.end340
                                        #   in Loop: Header=BB6_15 Depth=1
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
	jne	.LBB6_17
# BB#26:                                # %if.end355
                                        #   in Loop: Header=BB6_15 Depth=1
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
	jne	.LBB6_1
# BB#27:                                # %if.end372
                                        #   in Loop: Header=BB6_15 Depth=1
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
	jne	.LBB6_17
# BB#28:                                # %if.end387
                                        #   in Loop: Header=BB6_15 Depth=1
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
	jne	.LBB6_1
# BB#29:                                # %if.end404
                                        #   in Loop: Header=BB6_15 Depth=1
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
	jne	.LBB6_17
# BB#30:                                # %if.end419
                                        #   in Loop: Header=BB6_15 Depth=1
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
	jne	.LBB6_1
# BB#31:                                # %if.end436
                                        #   in Loop: Header=BB6_15 Depth=1
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
	jne	.LBB6_17
# BB#32:                                # %if.end451
                                        #   in Loop: Header=BB6_15 Depth=1
	incl	-8(%rsp)
	incl	-12(%rsp)
	movl	-8(%rsp), %eax
	cmpl	-36(%rsp), %eax
	jb	.LBB6_34
# BB#33:                                # %if.then456
                                        #   in Loop: Header=BB6_15 Depth=1
	movl	-36(%rsp), %eax
	subl	%eax, -8(%rsp)
.LBB6_34:                               # %if.end457
                                        #   in Loop: Header=BB6_15 Depth=1
	movl	-12(%rsp), %eax
	cmpl	-36(%rsp), %eax
	jb	.LBB6_36
# BB#35:                                # %if.then460
                                        #   in Loop: Header=BB6_15 Depth=1
	movl	-36(%rsp), %eax
	subl	%eax, -12(%rsp)
.LBB6_36:                               # %if.end462
                                        #   in Loop: Header=BB6_15 Depth=1
	addl	$-8, -52(%rsp)
	movq	-48(%rsp), %rax
	decl	(%rax)
	cmpl	$0, -52(%rsp)
	jns	.LBB6_15
# BB#37:                                # %do.end
	movb	$0, -1(%rsp)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_1:                                # %if.then
	movzbl	-54(%rsp), %eax
	movzbl	-53(%rsp), %ecx
.LBB6_2:                                # %if.then
	cmpl	%eax, %ecx
	setg	-1(%rsp)
	movzbl	-1(%rsp), %eax
	ret
.LBB6_17:                               # %if.then221
	movzwl	-58(%rsp), %eax
	movzwl	-56(%rsp), %ecx
	jmp	.LBB6_2
.Ltmp19:
	.size	mainGtU, .Ltmp19-mainGtU
	.cfi_endproc

	.align	16, 0x90
	.type	fallbackQSort3,@function
fallbackQSort3:                         # @fallbackQSort3
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp22:
	.cfi_def_cfa_offset 16
	subq	$928, %rsp              # imm = 0x3A0
.Ltmp23:
	.cfi_def_cfa_offset 944
.Ltmp24:
	.cfi_offset %rbx, -16
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
	movl	$2863311531, %ebx       # imm = 0xAAAAAAAB
	jmp	.LBB7_1
	.align	16, 0x90
.LBB7_5:                                # %if.then9
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	868(%rsp), %ecx
	movl	872(%rsp), %edx
	movq	912(%rsp), %rsi
	movq	920(%rsp), %rdi
	callq	fallbackSimpleSort
.LBB7_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_12 Depth 2
                                        #       Child Loop BB7_17 Depth 3
                                        #     Child Loop BB7_29 Depth 2
                                        #     Child Loop BB7_35 Depth 2
	cmpl	$0, 876(%rsp)
	jle	.LBB7_41
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB7_1 Depth=1
	cmpl	$100, 876(%rsp)
	jl	.LBB7_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	$1004, %edi             # imm = 0x3EC
	callq	BZ2_bz__AssertH__fail
.LBB7_4:                                # %if.end
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
	jle	.LBB7_5
# BB#6:                                 # %if.end10
                                        #   in Loop: Header=BB7_1 Depth=1
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
	jne	.LBB7_8
# BB#7:                                 # %if.then13
                                        #   in Loop: Header=BB7_1 Depth=1
	movslq	872(%rsp), %rax
	jmp	.LBB7_11
	.align	16, 0x90
.LBB7_8:                                # %if.else
                                        #   in Loop: Header=BB7_1 Depth=1
	cmpl	$1, 856(%rsp)
	jne	.LBB7_10
# BB#9:                                 # %if.then19
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	872(%rsp), %eax
	addl	868(%rsp), %eax
	sarl	%eax
	movslq	%eax, %rax
	jmp	.LBB7_11
.LBB7_10:                               # %if.else25
                                        #   in Loop: Header=BB7_1 Depth=1
	movslq	868(%rsp), %rax
.LBB7_11:                               # %if.else25
                                        #   in Loop: Header=BB7_1 Depth=1
	movq	920(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movq	912(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 864(%rsp)
	movl	872(%rsp), %eax
	movl	%eax, 892(%rsp)
	movl	%eax, 900(%rsp)
	movl	868(%rsp), %eax
	movl	%eax, 888(%rsp)
	movl	%eax, 896(%rsp)
	jmp	.LBB7_12
	.align	16, 0x90
.LBB7_23:                               # %if.end92
                                        #   in Loop: Header=BB7_12 Depth=2
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
.LBB7_12:                               # %while.body35
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_17 Depth 3
	movl	900(%rsp), %eax
	cmpl	896(%rsp), %eax
	jg	.LBB7_17
# BB#13:                                # %if.end38
                                        #   in Loop: Header=BB7_12 Depth=2
	movslq	900(%rsp), %rax
	movq	920(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movq	912(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	subl	864(%rsp), %eax
	movl	%eax, 884(%rsp)
	jne	.LBB7_15
# BB#14:                                # %if.then45
                                        #   in Loop: Header=BB7_12 Depth=2
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
	jmp	.LBB7_12
	.align	16, 0x90
.LBB7_15:                               # %if.end56
                                        #   in Loop: Header=BB7_12 Depth=2
	cmpl	$0, 884(%rsp)
	jg	.LBB7_17
# BB#16:                                # %if.end59
                                        #   in Loop: Header=BB7_12 Depth=2
	incl	900(%rsp)
	jmp	.LBB7_12
	.align	16, 0x90
.LBB7_19:                               # %if.then72
                                        #   in Loop: Header=BB7_17 Depth=3
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
.LBB7_17:                               # %while.body62
                                        #   Parent Loop BB7_1 Depth=1
                                        #     Parent Loop BB7_12 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	900(%rsp), %eax
	cmpl	896(%rsp), %eax
	jg	.LBB7_22
# BB#18:                                # %if.end65
                                        #   in Loop: Header=BB7_17 Depth=3
	movslq	896(%rsp), %rax
	movq	920(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movq	912(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	subl	864(%rsp), %eax
	movl	%eax, 884(%rsp)
	je	.LBB7_19
# BB#20:                                # %if.end84
                                        #   in Loop: Header=BB7_17 Depth=3
	cmpl	$0, 884(%rsp)
	js	.LBB7_22
# BB#21:                                # %if.end87
                                        #   in Loop: Header=BB7_17 Depth=3
	decl	896(%rsp)
	jmp	.LBB7_17
	.align	16, 0x90
.LBB7_22:                               # %while.end89
                                        #   in Loop: Header=BB7_12 Depth=2
	movl	900(%rsp), %eax
	cmpl	896(%rsp), %eax
	jle	.LBB7_23
# BB#24:                                # %while.end104
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	888(%rsp), %eax
	cmpl	892(%rsp), %eax
	jl	.LBB7_1
# BB#25:                                # %if.end107
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	892(%rsp), %eax
	movl	900(%rsp), %ecx
	subl	%eax, %ecx
	subl	872(%rsp), %eax
	cmpl	%ecx, %eax
	jge	.LBB7_27
# BB#26:                                # %cond.true
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	892(%rsp), %eax
	subl	872(%rsp), %eax
	jmp	.LBB7_28
.LBB7_27:                               # %cond.false
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	900(%rsp), %eax
	subl	892(%rsp), %eax
.LBB7_28:                               # %cond.end
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	%eax, 884(%rsp)
	movl	872(%rsp), %eax
	movl	%eax, 32(%rsp)
	movl	900(%rsp), %eax
	subl	884(%rsp), %eax
	movl	%eax, 28(%rsp)
	movl	884(%rsp), %eax
	movl	%eax, 24(%rsp)
	jmp	.LBB7_29
	.align	16, 0x90
.LBB7_30:                               # %while.body116
                                        #   in Loop: Header=BB7_29 Depth=2
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
.LBB7_29:                               # %while.cond114
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 24(%rsp)
	jg	.LBB7_30
# BB#31:                                # %while.end129
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	888(%rsp), %eax
	movl	868(%rsp), %ecx
	subl	%eax, %ecx
	subl	896(%rsp), %eax
	cmpl	%eax, %ecx
	jge	.LBB7_33
# BB#32:                                # %cond.true133
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	868(%rsp), %eax
	subl	888(%rsp), %eax
	jmp	.LBB7_34
.LBB7_33:                               # %cond.false135
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	888(%rsp), %eax
	subl	896(%rsp), %eax
.LBB7_34:                               # %cond.end137
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
	jmp	.LBB7_35
	.align	16, 0x90
.LBB7_36:                               # %while.body146
                                        #   in Loop: Header=BB7_35 Depth=2
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
.LBB7_35:                               # %while.cond144
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 8(%rsp)
	jg	.LBB7_36
# BB#37:                                # %while.end159
                                        #   in Loop: Header=BB7_1 Depth=1
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
	jle	.LBB7_40
# BB#38:                                # %if.then169
                                        #   in Loop: Header=BB7_1 Depth=1
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
	jmp	.LBB7_39
.LBB7_40:                               # %if.else180
                                        #   in Loop: Header=BB7_1 Depth=1
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
.LBB7_39:                               # %if.then169
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	%ecx, 48(%rsp,%rax,4)
	incl	876(%rsp)
	jmp	.LBB7_1
.LBB7_41:                               # %while.end192
	addq	$928, %rsp              # imm = 0x3A0
	popq	%rbx
	ret
.Ltmp25:
	.size	fallbackQSort3, .Ltmp25-fallbackQSort3
	.cfi_endproc

	.align	16, 0x90
	.type	fallbackSimpleSort,@function
fallbackSimpleSort:                     # @fallbackSimpleSort
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movl	%edx, -20(%rsp)
	movl	%ecx, -24(%rsp)
	cmpl	%ecx, -20(%rsp)
	je	.LBB8_18
# BB#1:                                 # %if.end
	movl	-24(%rsp), %eax
	subl	-20(%rsp), %eax
	cmpl	$4, %eax
	jl	.LBB8_10
# BB#2:                                 # %if.then3
	movl	-24(%rsp), %eax
	addl	$-4, %eax
	movl	%eax, -28(%rsp)
	jmp	.LBB8_3
	.align	16, 0x90
.LBB8_9:                                # %for.inc25
                                        #   in Loop: Header=BB8_3 Depth=1
	movl	-32(%rsp), %eax
	addl	$-4, %eax
	movslq	%eax, %rax
	movq	-8(%rsp), %rcx
	movl	-36(%rsp), %edx
	movl	%edx, (%rcx,%rax,4)
	decl	-28(%rsp)
.LBB8_3:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_5 Depth 2
	movl	-28(%rsp), %eax
	cmpl	-20(%rsp), %eax
	jl	.LBB8_10
# BB#4:                                 # %for.body
                                        #   in Loop: Header=BB8_3 Depth=1
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
	jmp	.LBB8_5
	.align	16, 0x90
.LBB8_8:                                # %for.inc
                                        #   in Loop: Header=BB8_5 Depth=2
	movslq	-32(%rsp), %rax
	movq	-8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	addl	$-4, %eax
	movslq	%eax, %rax
	movl	%edx, (%rcx,%rax,4)
	addl	$4, -32(%rsp)
.LBB8_5:                                # %for.cond8
                                        #   Parent Loop BB8_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorb	%al, %al
	movl	-32(%rsp), %ecx
	cmpl	-24(%rsp), %ecx
	jg	.LBB8_7
# BB#6:                                 # %land.rhs
                                        #   in Loop: Header=BB8_5 Depth=2
	movslq	-32(%rsp), %rax
	movq	-8(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movq	-16(%rsp), %rcx
	movl	-40(%rsp), %edx
	cmpl	(%rcx,%rax,4), %edx
	seta	%al
.LBB8_7:                                # %land.end
                                        #   in Loop: Header=BB8_5 Depth=2
	cmpb	$1, %al
	jne	.LBB8_9
	jmp	.LBB8_8
.LBB8_10:                               # %if.end27
	movl	-24(%rsp), %eax
	decl	%eax
	movl	%eax, -28(%rsp)
	jmp	.LBB8_11
	.align	16, 0x90
.LBB8_17:                               # %for.inc57
                                        #   in Loop: Header=BB8_11 Depth=1
	movl	-32(%rsp), %eax
	decl	%eax
	movslq	%eax, %rax
	movq	-8(%rsp), %rcx
	movl	-36(%rsp), %edx
	movl	%edx, (%rcx,%rax,4)
	decl	-28(%rsp)
.LBB8_11:                               # %for.cond29
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_13 Depth 2
	movl	-28(%rsp), %eax
	cmpl	-20(%rsp), %eax
	jl	.LBB8_18
# BB#12:                                # %for.body31
                                        #   in Loop: Header=BB8_11 Depth=1
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
	jmp	.LBB8_13
	.align	16, 0x90
.LBB8_16:                               # %for.inc52
                                        #   in Loop: Header=BB8_13 Depth=2
	movslq	-32(%rsp), %rax
	movq	-8(%rsp), %rcx
	movl	(%rcx,%rax,4), %edx
	decl	%eax
	movslq	%eax, %rax
	movl	%edx, (%rcx,%rax,4)
	incl	-32(%rsp)
.LBB8_13:                               # %for.cond37
                                        #   Parent Loop BB8_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorb	%al, %al
	movl	-32(%rsp), %ecx
	cmpl	-24(%rsp), %ecx
	jg	.LBB8_15
# BB#14:                                # %land.rhs39
                                        #   in Loop: Header=BB8_13 Depth=2
	movslq	-32(%rsp), %rax
	movq	-8(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movq	-16(%rsp), %rcx
	movl	-40(%rsp), %edx
	cmpl	(%rcx,%rax,4), %edx
	seta	%al
.LBB8_15:                               # %land.end45
                                        #   in Loop: Header=BB8_13 Depth=2
	cmpb	$1, %al
	jne	.LBB8_17
	jmp	.LBB8_16
.LBB8_18:                               # %for.end59
	ret
.Ltmp26:
	.size	fallbackSimpleSort, .Ltmp26-fallbackSimpleSort
	.cfi_endproc

	.globl	fopen_output_safely
	.align	16, 0x90
	.type	fopen_output_safely,@function
fopen_output_safely:                    # @fopen_output_safely
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp28:
	.cfi_def_cfa_offset 48
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
	movq	$0, 32(%rsp)
	jmp	.LBB9_5
.LBB9_2:                                # %if.end
	movq	16(%rsp), %rsi
	movl	4(%rsp), %edi
	callq	fdopen
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	jne	.LBB9_4
# BB#3:                                 # %if.then3
	movl	4(%rsp), %edi
	callq	close
.LBB9_4:                                # %if.end5
	movq	8(%rsp), %rax
	movq	%rax, 32(%rsp)
.LBB9_5:                                # %return
	movq	32(%rsp), %rax
	addq	$40, %rsp
	ret
.Ltmp29:
	.size	fopen_output_safely, .Ltmp29-fopen_output_safely
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp32:
	.cfi_def_cfa_offset 16
	subq	$64, %rsp
.Ltmp33:
	.cfi_def_cfa_offset 80
.Ltmp34:
	.cfi_offset %rbx, -16
	movl	$0, 60(%rsp)
	movl	%edi, 56(%rsp)
	movq	%rsi, 48(%rsp)
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
	jmp	.LBB10_1
	.align	16, 0x90
.LBB10_4:                               # %for.inc
                                        #   in Loop: Header=BB10_1 Depth=1
	incq	32(%rsp)
.LBB10_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	32(%rsp), %rax
	movsbl	(%rax), %eax
	testl	%eax, %eax
	je	.LBB10_5
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB10_1 Depth=1
	movq	32(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$47, %eax
	jne	.LBB10_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB10_1 Depth=1
	movq	32(%rsp), %rax
	incq	%rax
	movq	%rax, progName(%rip)
	jmp	.LBB10_4
.LBB10_5:                               # %for.end
	movq	$0, 24(%rsp)
	leaq	24(%rsp), %rbx
	movq	%rbx, %rdi
	movl	$.L.str716, %esi
	callq	addFlagsFromEnvVar
	movq	%rbx, %rdi
	movl	$.L.str817, %esi
	callq	addFlagsFromEnvVar
	movl	$1, 44(%rsp)
	jmp	.LBB10_6
	.align	16, 0x90
.LBB10_7:                               # %for.inc15
                                        #   in Loop: Header=BB10_6 Depth=1
	movslq	44(%rsp), %rax
	movq	48(%rsp), %rcx
	movq	(%rcx,%rax,8), %rsi
	movq	24(%rsp), %rdi
	callq	snocString
	movq	%rax, 24(%rsp)
	incl	44(%rsp)
.LBB10_6:                               # %for.cond9
                                        # =>This Inner Loop Header: Depth=1
	movl	56(%rsp), %eax
	decl	%eax
	cmpl	%eax, 44(%rsp)
	jle	.LBB10_7
# BB#8:                                 # %for.end16
	movl	$7, longestFileName(%rip)
	movl	$0, numFileNames(%rip)
	movb	$1, 15(%rsp)
	movq	24(%rsp), %rax
	jmp	.LBB10_9
	.align	16, 0x90
.LBB10_16:                              # %for.inc45
                                        #   in Loop: Header=BB10_9 Depth=1
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
.LBB10_9:                               # %for.end16
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, 16(%rsp)
	cmpq	$0, 16(%rsp)
	je	.LBB10_17
# BB#10:                                # %for.body20
                                        #   in Loop: Header=BB10_9 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str918, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_12
# BB#11:                                # %if.then24
                                        #   in Loop: Header=BB10_9 Depth=1
	movb	$0, 15(%rsp)
	jmp	.LBB10_16
	.align	16, 0x90
.LBB10_12:                              # %if.end25
                                        #   in Loop: Header=BB10_9 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movsbl	(%rax), %eax
	cmpl	$45, %eax
	jne	.LBB10_14
# BB#13:                                # %land.lhs.true
                                        #   in Loop: Header=BB10_9 Depth=1
	cmpb	$0, 15(%rsp)
	jne	.LBB10_16
.LBB10_14:                              # %if.end33
                                        #   in Loop: Header=BB10_9 Depth=1
	incl	numFileNames(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	longestFileName(%rip), %ebx
	callq	strlen
	cmpl	%eax, %ebx
	jge	.LBB10_16
# BB#15:                                # %if.then40
                                        #   in Loop: Header=BB10_9 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	callq	strlen
	movl	%eax, longestFileName(%rip)
	jmp	.LBB10_16
.LBB10_17:                              # %for.end46
	cmpl	$0, numFileNames(%rip)
	je	.LBB10_18
# BB#19:                                # %if.else
	movl	$3, srcMode(%rip)
	jmp	.LBB10_20
.LBB10_18:                              # %if.then49
	movl	$1, srcMode(%rip)
.LBB10_20:                              # %if.end50
	movl	$1, opMode(%rip)
	movq	progName(%rip), %rdi
	movl	$.L.str10, %esi
	callq	strstr
	testq	%rax, %rax
	jne	.LBB10_22
# BB#21:                                # %lor.lhs.false
	movq	progName(%rip), %rdi
	movl	$.L.str11, %esi
	callq	strstr
	testq	%rax, %rax
	je	.LBB10_23
.LBB10_22:                              # %if.then57
	movl	$2, opMode(%rip)
.LBB10_23:                              # %if.end58
	movq	progName(%rip), %rdi
	movl	$.L.str12, %esi
	callq	strstr
	testq	%rax, %rax
	jne	.LBB10_27
# BB#24:                                # %lor.lhs.false62
	movq	progName(%rip), %rdi
	movl	$.L.str13, %esi
	callq	strstr
	testq	%rax, %rax
	jne	.LBB10_27
# BB#25:                                # %lor.lhs.false66
	movq	progName(%rip), %rdi
	movl	$.L.str14, %esi
	callq	strstr
	testq	%rax, %rax
	jne	.LBB10_27
# BB#26:                                # %lor.lhs.false70
	movq	progName(%rip), %rdi
	movl	$.L.str15, %esi
	callq	strstr
	testq	%rax, %rax
	je	.LBB10_30
.LBB10_27:                              # %if.then74
	movl	$2, opMode(%rip)
	movl	$1, %eax
	cmpl	$0, numFileNames(%rip)
	je	.LBB10_29
# BB#28:                                # %select.mid
	movl	$2, %eax
.LBB10_29:                              # %select.end
	movl	%eax, srcMode(%rip)
.LBB10_30:                              # %if.end77
	movq	24(%rsp), %rax
	jmp	.LBB10_31
	.align	16, 0x90
.LBB10_68:                              # %for.inc138
                                        #   in Loop: Header=BB10_31 Depth=1
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
.LBB10_31:                              # %if.end77
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB10_36 Depth 2
	movq	%rax, 16(%rsp)
	cmpq	$0, 16(%rsp)
	je	.LBB10_69
# BB#32:                                # %for.body81
                                        #   in Loop: Header=BB10_31 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str918, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB10_69
# BB#33:                                # %if.end87
                                        #   in Loop: Header=BB10_31 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movsbl	(%rax), %eax
	cmpl	$45, %eax
	jne	.LBB10_68
# BB#34:                                # %land.lhs.true93
                                        #   in Loop: Header=BB10_31 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movsbl	1(%rax), %eax
	cmpl	$45, %eax
	je	.LBB10_68
# BB#35:                                # %if.then99
                                        #   in Loop: Header=BB10_31 Depth=1
	movl	$1, 40(%rsp)
	jmp	.LBB10_36
	.align	16, 0x90
.LBB10_67:                              # %sw.bb131
                                        #   in Loop: Header=BB10_36 Depth=2
	callq	exit
	incl	40(%rsp)
.LBB10_36:                              # %for.cond100
                                        #   Parent Loop BB10_31 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movslq	40(%rsp), %rcx
	movsbl	(%rax,%rcx), %eax
	testl	%eax, %eax
	je	.LBB10_68
# BB#37:                                # %for.body107
                                        #   in Loop: Header=BB10_36 Depth=2
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movslq	40(%rsp), %rcx
	movsbl	(%rax,%rcx), %eax
	cmpl	$75, %eax
	ja	.LBB10_40
# BB#38:                                # %for.body107
                                        #   in Loop: Header=BB10_36 Depth=2
	addl	$-49, %eax
	cmpl	$8, %eax
	ja	.LBB10_42
# BB#39:                                # %for.body107
                                        #   in Loop: Header=BB10_36 Depth=2
	jmpq	*.LJTI10_1(,%rax,8)
.LBB10_56:                              # %sw.bb119
                                        #   in Loop: Header=BB10_36 Depth=2
	movl	$1, blockSize100k(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
	.align	16, 0x90
.LBB10_40:                              # %for.body107
                                        #   in Loop: Header=BB10_36 Depth=2
	cmpl	$85, %eax
	ja	.LBB10_43
# BB#41:                                # %for.body107
                                        #   in Loop: Header=BB10_36 Depth=2
	cmpl	$76, %eax
	je	.LBB10_45
	jmp	.LBB10_42
	.align	16, 0x90
.LBB10_43:                              # %for.body107
                                        #   in Loop: Header=BB10_36 Depth=2
	cmpl	$98, %eax
	ja	.LBB10_46
# BB#44:                                # %for.body107
                                        #   in Loop: Header=BB10_36 Depth=2
	cmpl	$86, %eax
	jne	.LBB10_42
.LBB10_45:                              # %sw.bb128
                                        #   in Loop: Header=BB10_36 Depth=2
	callq	license
	incl	40(%rsp)
	jmp	.LBB10_36
.LBB10_46:                              # %for.body107
                                        #   in Loop: Header=BB10_36 Depth=2
	addl	$-99, %eax
	cmpl	$23, %eax
	ja	.LBB10_42
# BB#47:                                # %for.body107
                                        #   in Loop: Header=BB10_36 Depth=2
	jmpq	*.LJTI10_0(,%rax,8)
.LBB10_48:                              # %sw.bb
                                        #   in Loop: Header=BB10_36 Depth=2
	movl	$2, srcMode(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
	.align	16, 0x90
.LBB10_42:                              # %sw.default
                                        #   in Loop: Header=BB10_36 Depth=2
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
	jmp	.LBB10_67
.LBB10_57:                              # %sw.bb120
                                        #   in Loop: Header=BB10_36 Depth=2
	movl	$2, blockSize100k(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
.LBB10_58:                              # %sw.bb121
                                        #   in Loop: Header=BB10_36 Depth=2
	movl	$3, blockSize100k(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
.LBB10_59:                              # %sw.bb122
                                        #   in Loop: Header=BB10_36 Depth=2
	movl	$4, blockSize100k(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
.LBB10_60:                              # %sw.bb123
                                        #   in Loop: Header=BB10_36 Depth=2
	movl	$5, blockSize100k(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
.LBB10_61:                              # %sw.bb124
                                        #   in Loop: Header=BB10_36 Depth=2
	movl	$6, blockSize100k(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
.LBB10_62:                              # %sw.bb125
                                        #   in Loop: Header=BB10_36 Depth=2
	movl	$7, blockSize100k(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
.LBB10_63:                              # %sw.bb126
                                        #   in Loop: Header=BB10_36 Depth=2
	movl	$8, blockSize100k(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
.LBB10_64:                              # %sw.bb127
                                        #   in Loop: Header=BB10_36 Depth=2
	movl	$9, blockSize100k(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
.LBB10_49:                              # %sw.bb112
                                        #   in Loop: Header=BB10_36 Depth=2
	movl	$2, opMode(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
.LBB10_51:                              # %sw.bb114
                                        #   in Loop: Header=BB10_36 Depth=2
	movb	$1, forceOverwrite(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
.LBB10_66:                              # %sw.bb131
                                        #   in Loop: Header=BB10_36 Depth=2
	movq	progName(%rip), %rdi
	callq	usage
	xorl	%edi, %edi
	jmp	.LBB10_67
.LBB10_53:                              # %sw.bb116
                                        #   in Loop: Header=BB10_36 Depth=2
	movb	$1, keepInputFiles(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
.LBB10_55:                              # %sw.bb118
                                        #   in Loop: Header=BB10_36 Depth=2
	movb	$0, noisy(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
.LBB10_54:                              # %sw.bb117
                                        #   in Loop: Header=BB10_36 Depth=2
	movb	$1, smallMode(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
.LBB10_52:                              # %sw.bb115
                                        #   in Loop: Header=BB10_36 Depth=2
	movl	$3, opMode(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
.LBB10_65:                              # %sw.bb129
                                        #   in Loop: Header=BB10_36 Depth=2
	incl	verbosity(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
.LBB10_50:                              # %sw.bb113
                                        #   in Loop: Header=BB10_36 Depth=2
	movl	$1, opMode(%rip)
	incl	40(%rsp)
	jmp	.LBB10_36
.LBB10_69:                              # %for.end140
	movq	24(%rsp), %rax
	jmp	.LBB10_70
	.align	16, 0x90
.LBB10_108:                             # %for.inc281
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
.LBB10_70:                              # %for.end140
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, 16(%rsp)
	cmpq	$0, 16(%rsp)
	je	.LBB10_109
# BB#71:                                # %for.body144
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str918, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB10_109
# BB#72:                                # %if.end150
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str17, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_74
# BB#73:                                # %if.then155
                                        #   in Loop: Header=BB10_70 Depth=1
	movl	$2, srcMode(%rip)
	jmp	.LBB10_108
	.align	16, 0x90
.LBB10_74:                              # %if.else156
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str18, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_76
# BB#75:                                # %if.then161
                                        #   in Loop: Header=BB10_70 Depth=1
	movl	$2, opMode(%rip)
	jmp	.LBB10_108
	.align	16, 0x90
.LBB10_76:                              # %if.else162
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str19, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_78
# BB#77:                                # %if.then167
                                        #   in Loop: Header=BB10_70 Depth=1
	movl	$1, opMode(%rip)
	jmp	.LBB10_108
.LBB10_78:                              # %if.else168
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str20, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_80
# BB#79:                                # %if.then173
                                        #   in Loop: Header=BB10_70 Depth=1
	movb	$1, forceOverwrite(%rip)
	jmp	.LBB10_108
.LBB10_80:                              # %if.else174
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str21, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_82
# BB#81:                                # %if.then179
                                        #   in Loop: Header=BB10_70 Depth=1
	movl	$3, opMode(%rip)
	jmp	.LBB10_108
.LBB10_82:                              # %if.else180
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str22, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_84
# BB#83:                                # %if.then185
                                        #   in Loop: Header=BB10_70 Depth=1
	movb	$1, keepInputFiles(%rip)
	jmp	.LBB10_108
.LBB10_84:                              # %if.else186
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str23, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_86
# BB#85:                                # %if.then191
                                        #   in Loop: Header=BB10_70 Depth=1
	movb	$1, smallMode(%rip)
	jmp	.LBB10_108
.LBB10_86:                              # %if.else192
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str24, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_88
# BB#87:                                # %if.then197
                                        #   in Loop: Header=BB10_70 Depth=1
	movb	$0, noisy(%rip)
	jmp	.LBB10_108
.LBB10_88:                              # %if.else198
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str25, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_90
# BB#89:                                # %if.then203
                                        #   in Loop: Header=BB10_70 Depth=1
	callq	license
	jmp	.LBB10_108
.LBB10_90:                              # %if.else204
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str26, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_92
# BB#91:                                # %if.then209
                                        #   in Loop: Header=BB10_70 Depth=1
	callq	license
	jmp	.LBB10_108
.LBB10_92:                              # %if.else210
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str27, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_94
# BB#93:                                # %if.then215
                                        #   in Loop: Header=BB10_70 Depth=1
	movl	$1, workFactor(%rip)
	jmp	.LBB10_108
.LBB10_94:                              # %if.else216
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str28, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB10_95
# BB#96:                                # %if.else223
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str29, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_97
.LBB10_95:                              # %if.then221
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	callq	redundant
	jmp	.LBB10_108
.LBB10_97:                              # %if.else230
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str30, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_99
# BB#98:                                # %if.then235
                                        #   in Loop: Header=BB10_70 Depth=1
	movl	$1, blockSize100k(%rip)
	jmp	.LBB10_108
.LBB10_99:                              # %if.else236
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str31, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_101
# BB#100:                               # %if.then241
                                        #   in Loop: Header=BB10_70 Depth=1
	movl	$9, blockSize100k(%rip)
	jmp	.LBB10_108
.LBB10_101:                             # %if.else242
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str32, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_103
# BB#102:                               # %if.then247
                                        #   in Loop: Header=BB10_70 Depth=1
	incl	verbosity(%rip)
	jmp	.LBB10_108
.LBB10_103:                             # %if.else249
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str33, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_105
# BB#104:                               # %if.then254
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	progName(%rip), %rdi
	callq	usage
	xorl	%edi, %edi
	jmp	.LBB10_107
.LBB10_105:                             # %if.else255
                                        #   in Loop: Header=BB10_70 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str918, %esi
	movl	$2, %edx
	callq	strncmp
	testl	%eax, %eax
	jne	.LBB10_108
# BB#106:                               # %if.then260
                                        #   in Loop: Header=BB10_70 Depth=1
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
.LBB10_107:                             # %if.then260
                                        #   in Loop: Header=BB10_70 Depth=1
	callq	exit
	jmp	.LBB10_108
.LBB10_109:                             # %for.end283
	cmpl	$5, verbosity(%rip)
	jl	.LBB10_111
# BB#110:                               # %if.then286
	movl	$4, verbosity(%rip)
.LBB10_111:                             # %if.end287
	cmpl	$1, opMode(%rip)
	jne	.LBB10_115
# BB#112:                               # %land.lhs.true290
	movzbl	smallMode(%rip), %eax
	testl	%eax, %eax
	je	.LBB10_115
# BB#113:                               # %land.lhs.true293
	cmpl	$3, blockSize100k(%rip)
	jl	.LBB10_115
# BB#114:                               # %if.then296
	movl	$2, blockSize100k(%rip)
.LBB10_115:                             # %if.end297
	cmpl	$3, opMode(%rip)
	jne	.LBB10_118
# BB#116:                               # %land.lhs.true300
	cmpl	$2, srcMode(%rip)
	jne	.LBB10_118
# BB#117:                               # %if.then303
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str34, %esi
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	exit
.LBB10_118:                             # %if.end305
	cmpl	$2, srcMode(%rip)
	jne	.LBB10_121
# BB#119:                               # %land.lhs.true308
	cmpl	$0, numFileNames(%rip)
	jne	.LBB10_121
# BB#120:                               # %if.then311
	movl	$1, srcMode(%rip)
.LBB10_121:                             # %if.end312
	cmpl	$1, opMode(%rip)
	je	.LBB10_123
# BB#122:                               # %if.then315
	movl	$0, blockSize100k(%rip)
.LBB10_123:                             # %if.end316
	cmpl	$3, srcMode(%rip)
	jne	.LBB10_125
# BB#124:                               # %if.then319
	movl	$2, %edi
	movl	$mySignalCatcher, %esi
	callq	signal
	movl	$15, %edi
	movl	$mySignalCatcher, %esi
	callq	signal
	movl	$1, %edi
	movl	$mySignalCatcher, %esi
	callq	signal
.LBB10_125:                             # %if.end323
	cmpl	$1, opMode(%rip)
	jne	.LBB10_136
# BB#126:                               # %if.then326
	cmpl	$1, srcMode(%rip)
	jne	.LBB10_128
# BB#127:                               # %if.then329
	xorl	%edi, %edi
	callq	compress
	jmp	.LBB10_140
.LBB10_136:                             # %if.else357
	cmpl	$2, opMode(%rip)
	jne	.LBB10_153
# BB#137:                               # %if.then360
	movb	$0, unzFailsExist(%rip)
	cmpl	$1, srcMode(%rip)
	jne	.LBB10_145
# BB#138:                               # %if.then363
	xorl	%edi, %edi
	callq	uncompress
	jmp	.LBB10_139
.LBB10_128:                             # %if.else330
	movb	$1, 15(%rsp)
	movq	24(%rsp), %rax
	jmp	.LBB10_129
	.align	16, 0x90
.LBB10_135:                             # %for.inc353
                                        #   in Loop: Header=BB10_129 Depth=1
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
.LBB10_129:                             # %if.else330
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, 16(%rsp)
	cmpq	$0, 16(%rsp)
	je	.LBB10_140
# BB#130:                               # %for.body334
                                        #   in Loop: Header=BB10_129 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str918, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_132
# BB#131:                               # %if.then339
                                        #   in Loop: Header=BB10_129 Depth=1
	movb	$0, 15(%rsp)
	jmp	.LBB10_135
	.align	16, 0x90
.LBB10_132:                             # %if.end340
                                        #   in Loop: Header=BB10_129 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movsbl	(%rax), %eax
	cmpl	$45, %eax
	jne	.LBB10_134
# BB#133:                               # %land.lhs.true346
                                        #   in Loop: Header=BB10_129 Depth=1
	cmpb	$0, 15(%rsp)
	jne	.LBB10_135
.LBB10_134:                             # %if.end350
                                        #   in Loop: Header=BB10_129 Depth=1
	incl	numFilesProcessed(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	callq	compress
	jmp	.LBB10_135
.LBB10_153:                             # %if.else394
	movb	$0, testFailsExist(%rip)
	cmpl	$1, srcMode(%rip)
	jne	.LBB10_159
# BB#154:                               # %if.then397
	xorl	%edi, %edi
	callq	testf
	jmp	.LBB10_155
.LBB10_145:                             # %if.else364
	movb	$1, 15(%rsp)
	movq	24(%rsp), %rax
	jmp	.LBB10_146
	.align	16, 0x90
.LBB10_152:                             # %for.inc387
                                        #   in Loop: Header=BB10_146 Depth=1
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
.LBB10_146:                             # %if.else364
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, 16(%rsp)
	cmpq	$0, 16(%rsp)
	je	.LBB10_139
# BB#147:                               # %for.body368
                                        #   in Loop: Header=BB10_146 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str918, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_149
# BB#148:                               # %if.then373
                                        #   in Loop: Header=BB10_146 Depth=1
	movb	$0, 15(%rsp)
	jmp	.LBB10_152
	.align	16, 0x90
.LBB10_149:                             # %if.end374
                                        #   in Loop: Header=BB10_146 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movsbl	(%rax), %eax
	cmpl	$45, %eax
	jne	.LBB10_151
# BB#150:                               # %land.lhs.true380
                                        #   in Loop: Header=BB10_146 Depth=1
	cmpb	$0, 15(%rsp)
	jne	.LBB10_152
.LBB10_151:                             # %if.end384
                                        #   in Loop: Header=BB10_146 Depth=1
	incl	numFilesProcessed(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	callq	uncompress
	jmp	.LBB10_152
.LBB10_139:                             # %if.end390
	cmpb	$0, unzFailsExist(%rip)
	jne	.LBB10_158
	jmp	.LBB10_140
.LBB10_159:                             # %if.else398
	movb	$1, 15(%rsp)
	movq	24(%rsp), %rax
	jmp	.LBB10_160
	.align	16, 0x90
.LBB10_166:                             # %for.inc421
                                        #   in Loop: Header=BB10_160 Depth=1
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
.LBB10_160:                             # %if.else398
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, 16(%rsp)
	cmpq	$0, 16(%rsp)
	je	.LBB10_155
# BB#161:                               # %for.body402
                                        #   in Loop: Header=BB10_160 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	movl	$.L.str918, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB10_163
# BB#162:                               # %if.then407
                                        #   in Loop: Header=BB10_160 Depth=1
	movb	$0, 15(%rsp)
	jmp	.LBB10_166
	.align	16, 0x90
.LBB10_163:                             # %if.end408
                                        #   in Loop: Header=BB10_160 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movsbl	(%rax), %eax
	cmpl	$45, %eax
	jne	.LBB10_165
# BB#164:                               # %land.lhs.true414
                                        #   in Loop: Header=BB10_160 Depth=1
	cmpb	$0, 15(%rsp)
	jne	.LBB10_166
.LBB10_165:                             # %if.end418
                                        #   in Loop: Header=BB10_160 Depth=1
	incl	numFilesProcessed(%rip)
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	callq	testf
	jmp	.LBB10_166
.LBB10_155:                             # %if.end424
	movzbl	testFailsExist(%rip), %eax
	testl	%eax, %eax
	je	.LBB10_140
# BB#156:                               # %land.lhs.true427
	movzbl	noisy(%rip), %eax
	testl	%eax, %eax
	je	.LBB10_140
# BB#157:                               # %if.then430
	movq	stderr(%rip), %rdi
	movl	$.L.str35, %esi
	xorb	%al, %al
	callq	fprintf
.LBB10_158:                             # %if.then430
	movl	$2, %edi
	callq	setExit
	movl	exitValue(%rip), %edi
	callq	exit
.LBB10_140:                             # %if.end434
	movq	24(%rsp), %rax
	jmp	.LBB10_141
	.align	16, 0x90
.LBB10_144:                             # %if.end444
                                        #   in Loop: Header=BB10_141 Depth=1
	movq	16(%rsp), %rdi
	callq	free
	movq	(%rsp), %rax
.LBB10_141:                             # %if.end434
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, 16(%rsp)
	cmpq	$0, 16(%rsp)
	je	.LBB10_167
# BB#142:                               # %while.body
                                        #   in Loop: Header=BB10_141 Depth=1
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, (%rsp)
	movq	16(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB10_144
# BB#143:                               # %if.then442
                                        #   in Loop: Header=BB10_141 Depth=1
	movq	16(%rsp), %rax
	movq	(%rax), %rdi
	callq	free
	jmp	.LBB10_144
.LBB10_167:                             # %while.end
	movl	exitValue(%rip), %eax
	addq	$64, %rsp
	popq	%rbx
	ret
.Ltmp35:
	.size	main, .Ltmp35-main
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI10_0:
	.quad	.LBB10_48
	.quad	.LBB10_49
	.quad	.LBB10_42
	.quad	.LBB10_51
	.quad	.LBB10_42
	.quad	.LBB10_66
	.quad	.LBB10_42
	.quad	.LBB10_42
	.quad	.LBB10_53
	.quad	.LBB10_42
	.quad	.LBB10_42
	.quad	.LBB10_42
	.quad	.LBB10_42
	.quad	.LBB10_42
	.quad	.LBB10_55
	.quad	.LBB10_42
	.quad	.LBB10_54
	.quad	.LBB10_52
	.quad	.LBB10_42
	.quad	.LBB10_65
	.quad	.LBB10_42
	.quad	.LBB10_42
	.quad	.LBB10_42
	.quad	.LBB10_50
.LJTI10_1:
	.quad	.LBB10_56
	.quad	.LBB10_57
	.quad	.LBB10_58
	.quad	.LBB10_59
	.quad	.LBB10_60
	.quad	.LBB10_61
	.quad	.LBB10_62
	.quad	.LBB10_63
	.quad	.LBB10_64

	.text
	.align	16, 0x90
	.type	mySIGSEGVorSIGBUScatcher,@function
mySIGSEGVorSIGBUScatcher:               # @mySIGSEGVorSIGBUScatcher
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp37:
	.cfi_def_cfa_offset 16
	movl	%edi, 4(%rsp)
	cmpl	$1, opMode(%rip)
	jne	.LBB11_2
# BB#1:                                 # %if.then
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str106, %esi
	jmp	.LBB11_3
.LBB11_2:                               # %if.else
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str107, %esi
.LBB11_3:                               # %if.else
	xorb	%al, %al
	callq	fprintf
	callq	showFileNames
	cmpl	$1, opMode(%rip)
	jne	.LBB11_5
# BB#4:                                 # %if.then3
	movl	$3, %edi
	jmp	.LBB11_6
.LBB11_5:                               # %if.else4
	callq	cadvise
	movl	$2, %edi
.LBB11_6:                               # %if.else4
	callq	cleanUpAndFail
	popq	%rax
	ret
.Ltmp38:
	.size	mySIGSEGVorSIGBUScatcher, .Ltmp38-mySIGSEGVorSIGBUScatcher
	.cfi_endproc

	.align	16, 0x90
	.type	copyFileName,@function
copyFileName:                           # @copyFileName
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp40:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rsi, %rdi
	callq	strlen
	cmpq	$1025, %rax             # imm = 0x401
	jb	.LBB12_2
# BB#1:                                 # %if.then
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
.LBB12_2:                               # %if.end
	movq	8(%rsp), %rsi
	movq	16(%rsp), %rdi
	movl	$1024, %edx             # imm = 0x400
	callq	strncpy
	movq	16(%rsp), %rax
	movb	$0, 1024(%rax)
	addq	$24, %rsp
	ret
.Ltmp41:
	.size	copyFileName, .Ltmp41-copyFileName
	.cfi_endproc

	.align	16, 0x90
	.type	addFlagsFromEnvVar,@function
addFlagsFromEnvVar:                     # @addFlagsFromEnvVar
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp44:
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
.Ltmp45:
	.cfi_def_cfa_offset 64
.Ltmp46:
	.cfi_offset %rbx, -16
	movq	%rdi, 40(%rsp)
	movq	%rsi, 32(%rsp)
	movq	%rsi, %rdi
	callq	getenv
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.LBB13_17
# BB#1:                                 # %if.then
	movq	8(%rsp), %rax
	movq	%rax, (%rsp)
	movl	$0, 28(%rsp)
	jmp	.LBB13_2
	.align	16, 0x90
.LBB13_16:                              # %for.end
                                        #   in Loop: Header=BB13_2 Depth=1
	movslq	20(%rsp), %rax
	movb	$0, tmpName(%rax)
	movq	40(%rsp), %rax
	movq	(%rax), %rdi
	movl	$tmpName, %esi
	callq	snocString
	movq	40(%rsp), %rcx
	movq	%rax, (%rcx)
.LBB13_2:                               # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB13_4 Depth 2
                                        #     Child Loop BB13_6 Depth 2
                                        #     Child Loop BB13_14 Depth 2
	movslq	28(%rsp), %rax
	movq	(%rsp), %rcx
	movsbl	(%rcx,%rax), %eax
	testl	%eax, %eax
	je	.LBB13_17
# BB#3:                                 # %if.end
                                        #   in Loop: Header=BB13_2 Depth=1
	movslq	28(%rsp), %rax
	addq	%rax, (%rsp)
	movl	$0, 28(%rsp)
	jmp	.LBB13_4
	.align	16, 0x90
.LBB13_5:                               # %while.body11
                                        #   in Loop: Header=BB13_4 Depth=2
	incq	(%rsp)
.LBB13_4:                               # %while.cond4
                                        #   Parent Loop BB13_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rsp), %rax
	movsbq	(%rax), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	testb	$32, 1(%rax,%rbx,2)
	je	.LBB13_6
	jmp	.LBB13_5
	.align	16, 0x90
.LBB13_9:                               # %while.body27
                                        #   in Loop: Header=BB13_6 Depth=2
	incl	28(%rsp)
.LBB13_6:                               # %while.cond12
                                        #   Parent Loop BB13_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	28(%rsp), %rax
	movq	(%rsp), %rcx
	movsbl	(%rcx,%rax), %ecx
	xorb	%al, %al
	testl	%ecx, %ecx
	je	.LBB13_8
# BB#7:                                 # %land.rhs
                                        #   in Loop: Header=BB13_6 Depth=2
	movslq	28(%rsp), %rax
	movq	(%rsp), %rcx
	movsbq	(%rcx,%rax), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	testb	$32, 1(%rax,%rbx,2)
	sete	%al
.LBB13_8:                               # %land.end
                                        #   in Loop: Header=BB13_6 Depth=2
	cmpb	$1, %al
	je	.LBB13_9
# BB#10:                                # %while.end28
                                        #   in Loop: Header=BB13_2 Depth=1
	cmpl	$0, 28(%rsp)
	jle	.LBB13_2
# BB#11:                                # %if.then31
                                        #   in Loop: Header=BB13_2 Depth=1
	movl	28(%rsp), %eax
	movl	%eax, 20(%rsp)
	cmpl	$1025, %eax             # imm = 0x401
	jl	.LBB13_13
# BB#12:                                # %if.then34
                                        #   in Loop: Header=BB13_2 Depth=1
	movl	$1024, 20(%rsp)         # imm = 0x400
.LBB13_13:                              # %if.end35
                                        #   in Loop: Header=BB13_2 Depth=1
	movl	$0, 24(%rsp)
	jmp	.LBB13_14
	.align	16, 0x90
.LBB13_15:                              # %for.inc
                                        #   in Loop: Header=BB13_14 Depth=2
	movslq	24(%rsp), %rax
	movq	(%rsp), %rcx
	movb	(%rcx,%rax), %cl
	movb	%cl, tmpName(%rax)
	incl	24(%rsp)
.LBB13_14:                              # %for.cond
                                        #   Parent Loop BB13_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	24(%rsp), %eax
	cmpl	20(%rsp), %eax
	jge	.LBB13_16
	jmp	.LBB13_15
.LBB13_17:                              # %if.end48
	addq	$48, %rsp
	popq	%rbx
	ret
.Ltmp47:
	.size	addFlagsFromEnvVar, .Ltmp47-addFlagsFromEnvVar
	.cfi_endproc

	.align	16, 0x90
	.type	snocString,@function
snocString:                             # @snocString
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp49:
	.cfi_def_cfa_offset 48
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	cmpq	$0, 24(%rsp)
	je	.LBB14_1
# BB#2:                                 # %if.else
	movq	24(%rsp), %rax
	jmp	.LBB14_3
	.align	16, 0x90
.LBB14_4:                               # %while.body
                                        #   in Loop: Header=BB14_3 Depth=1
	movq	(%rsp), %rax
	movq	8(%rax), %rax
.LBB14_3:                               # %if.else
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, (%rsp)
	movq	(%rsp), %rax
	cmpq	$0, 8(%rax)
	jne	.LBB14_4
# BB#5:                                 # %while.end
	movq	(%rsp), %rax
	movq	8(%rax), %rdi
	movq	16(%rsp), %rsi
	callq	snocString
	movq	(%rsp), %rcx
	movq	%rax, 8(%rcx)
	movq	24(%rsp), %rax
	jmp	.LBB14_6
.LBB14_1:                               # %if.then
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
.LBB14_6:                               # %while.end
	movq	%rax, 32(%rsp)
	movq	32(%rsp), %rax
	addq	$40, %rsp
	ret
.Ltmp50:
	.size	snocString, .Ltmp50-snocString
	.cfi_endproc

	.align	16, 0x90
	.type	license,@function
license:                                # @license
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp53:
	.cfi_def_cfa_offset 16
.Ltmp54:
	.cfi_offset %rbx, -16
	movq	stderr(%rip), %rbx
	callq	BZ2_bzlibVersion
	movq	%rbx, %rdi
	movl	$.L.str104, %esi
	movq	%rax, %rdx
	xorb	%al, %al
	callq	fprintf
	popq	%rbx
	ret
.Ltmp55:
	.size	license, .Ltmp55-license
	.cfi_endproc

	.align	16, 0x90
	.type	usage,@function
usage:                                  # @usage
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp58:
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
.Ltmp59:
	.cfi_def_cfa_offset 32
.Ltmp60:
	.cfi_offset %rbx, -16
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
.Ltmp61:
	.size	usage, .Ltmp61-usage
	.cfi_endproc

	.align	16, 0x90
	.type	redundant,@function
redundant:                              # @redundant
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp63:
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
	movq	%rax, (%rsp)
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str102, %esi
	movq	%rax, %rcx
	xorb	%al, %al
	callq	fprintf
	popq	%rax
	ret
.Ltmp64:
	.size	redundant, .Ltmp64-redundant
	.cfi_endproc

	.align	16, 0x90
	.type	mySignalCatcher,@function
mySignalCatcher:                        # @mySignalCatcher
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp66:
	.cfi_def_cfa_offset 16
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
.Ltmp67:
	.size	mySignalCatcher, .Ltmp67-mySignalCatcher
	.cfi_endproc

	.align	16, 0x90
	.type	compress,@function
compress:                               # @compress
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp71:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp72:
	.cfi_def_cfa_offset 24
	subq	$184, %rsp
.Ltmp73:
	.cfi_def_cfa_offset 208
.Ltmp74:
	.cfi_offset %rbx, -24
.Ltmp75:
	.cfi_offset %r14, -16
	movq	%rdi, 176(%rsp)
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpq	$0, 176(%rsp)
	jne	.LBB19_3
# BB#1:                                 # %land.lhs.true
	cmpl	$1, srcMode(%rip)
	je	.LBB19_3
# BB#2:                                 # %if.then
	movl	$.L.str92, %edi
	callq	panic
.LBB19_3:                               # %if.end
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	je	.LBB19_7
# BB#4:                                 # %if.end
	cmpl	$2, %eax
	jne	.LBB19_5
# BB#8:                                 # %sw.bb3
	movq	176(%rsp), %rsi
	movl	$inName, %edi
	jmp	.LBB19_9
.LBB19_7:                               # %sw.bb2
	movq	176(%rsp), %rsi
	movl	$inName, %edi
	callq	copyFileName
	movq	176(%rsp), %rsi
	movl	$outName, %edi
	callq	copyFileName
	movl	$outName, %edi
	movl	$.L.str9, %esi
	callq	strcat
	jmp	.LBB19_10
.LBB19_5:                               # %if.end
	cmpl	$1, %eax
	jne	.LBB19_10
# BB#6:                                 # %sw.bb
	movl	$inName, %edi
	movl	$.L.str37, %esi
.LBB19_9:                               # %sw.bb3
	callq	copyFileName
	movl	$outName, %edi
	movl	$.L.str71, %esi
	callq	copyFileName
.LBB19_10:                              # %sw.epilog
	cmpl	$1, srcMode(%rip)
	je	.LBB19_17
# BB#11:                                # %land.lhs.true5
	movl	$inName, %edi
	callq	containsDubiousChars
	testb	%al, %al
	je	.LBB19_17
# BB#12:                                # %if.then7
	cmpb	$0, noisy(%rip)
	je	.LBB19_16
# BB#13:                                # %if.then9
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str38, %esi
	jmp	.LBB19_14
.LBB19_17:                              # %if.end12
	cmpl	$1, srcMode(%rip)
	je	.LBB19_20
# BB#18:                                # %land.lhs.true15
	movl	$inName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB19_19
.LBB19_20:                              # %if.end22
	movl	$0, 152(%rsp)
	jmp	.LBB19_21
	.align	16, 0x90
.LBB19_26:                              # %for.inc
                                        #   in Loop: Header=BB19_21 Depth=1
	incl	152(%rsp)
.LBB19_21:                              # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$3, 152(%rsp)
	jg	.LBB19_27
# BB#22:                                # %for.body
                                        #   in Loop: Header=BB19_21 Depth=1
	movslq	152(%rsp), %rax
	movq	zSuffix(,%rax,8), %rsi
	movl	$inName, %edi
	callq	hasSuffix
	testb	%al, %al
	je	.LBB19_26
# BB#23:                                # %if.then27
	cmpb	$0, noisy(%rip)
	je	.LBB19_16
# BB#24:                                # %if.then29
	movslq	152(%rsp), %rax
	movq	zSuffix(,%rax,8), %r8
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str93, %esi
	movl	$inName, %ecx
	jmp	.LBB19_25
.LBB19_27:                              # %for.end
	cmpl	$3, srcMode(%rip)
	je	.LBB19_29
# BB#28:                                # %lor.lhs.false
	cmpl	$2, srcMode(%rip)
	jne	.LBB19_31
.LBB19_29:                              # %if.then39
	leaq	8(%rsp), %rsi
	movl	$inName, %edi
	callq	stat
	movl	$61440, %eax            # imm = 0xF000
	andl	32(%rsp), %eax
	cmpl	$16384, %eax            # imm = 0x4000
	jne	.LBB19_31
# BB#30:                                # %if.then43
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str40, %esi
.LBB19_14:                              # %if.then9
	movl	$inName, %ecx
.LBB19_15:                              # %if.then9
	xorb	%al, %al
	callq	fprintf
	jmp	.LBB19_16
.LBB19_31:                              # %if.end46
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_36
# BB#32:                                # %land.lhs.true49
	cmpb	$0, forceOverwrite(%rip)
	jne	.LBB19_36
# BB#33:                                # %land.lhs.true51
	movl	$inName, %edi
	callq	notAStandardFile
	testb	%al, %al
	je	.LBB19_36
# BB#34:                                # %if.then55
	cmpb	$0, noisy(%rip)
	je	.LBB19_16
# BB#35:                                # %if.then57
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str74, %esi
	jmp	.LBB19_14
.LBB19_36:                              # %if.end60
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_40
# BB#37:                                # %land.lhs.true63
	movl	$outName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB19_40
# BB#38:                                # %if.then67
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB19_72
# BB#39:                                # %if.then69
	movl	$outName, %edi
	callq	remove
.LBB19_40:                              # %if.end73
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_46
# BB#41:                                # %land.lhs.true76
	cmpb	$0, forceOverwrite(%rip)
	jne	.LBB19_46
# BB#42:                                # %land.lhs.true78
	movl	$inName, %edi
	callq	countHardLinks
	movl	%eax, 156(%rsp)
	testl	%eax, %eax
	jle	.LBB19_46
# BB#43:                                # %if.then82
	movl	$.L.str78, %r9d
	movl	156(%rsp), %r8d
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	cmpl	$1, %r8d
	jg	.LBB19_45
# BB#44:                                # %select.mid
	movl	$.L.str413, %r9d
.LBB19_45:                              # %select.end
	movl	$.L.str77, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	jmp	.LBB19_16
.LBB19_46:                              # %if.end86
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_48
# BB#47:                                # %if.then89
	movl	$inName, %edi
	callq	saveInputFileMetaInfo
.LBB19_48:                              # %if.end90
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	je	.LBB19_58
# BB#49:                                # %if.end90
	cmpl	$2, %eax
	jne	.LBB19_50
# BB#53:                                # %sw.bb99
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
	je	.LBB19_57
# BB#54:                                # %if.then104
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
	jmp	.LBB19_55
.LBB19_58:                              # %sw.bb120
	movl	$inName, %edi
	movl	$.L.str43, %esi
	callq	fopen
	movq	%rax, 168(%rsp)
	movl	$outName, %edi
	movl	$.L.str79, %esi
	callq	fopen_output_safely
	movq	%rax, 160(%rsp)
	testq	%rax, %rax
	je	.LBB19_59
# BB#60:                                # %if.end134
	cmpq	$0, 168(%rsp)
	jne	.LBB19_64
# BB#61:                                # %if.then137
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
	je	.LBB19_16
# BB#62:                                # %if.then143
	movq	160(%rsp), %rdi
	callq	fclose
	jmp	.LBB19_16
.LBB19_50:                              # %if.end90
	cmpl	$1, %eax
	jne	.LBB19_63
# BB#51:                                # %sw.bb91
	movq	stdin(%rip), %rax
	movq	%rax, 168(%rsp)
	movq	stdout(%rip), %rax
	movq	%rax, 160(%rsp)
	movq	stdout(%rip), %rdi
	callq	fileno
	movl	%eax, %edi
	callq	isatty
	testl	%eax, %eax
	je	.LBB19_64
# BB#52:                                # %if.then95
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str94, %esi
	xorb	%al, %al
	callq	fprintf
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str42, %esi
	movq	%rdx, %rcx
	jmp	.LBB19_15
.LBB19_63:                              # %sw.default
	movl	$.L.str95, %edi
	callq	panic
	jmp	.LBB19_64
.LBB19_72:                              # %if.else
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str76, %esi
	movl	$outName, %ecx
	jmp	.LBB19_15
.LBB19_57:                              # %if.end112
	cmpq	$0, 168(%rsp)
	je	.LBB19_19
.LBB19_64:                              # %sw.epilog147
	cmpl	$0, verbosity(%rip)
	jle	.LBB19_66
# BB#65:                                # %if.then150
	movq	stderr(%rip), %rdi
	movl	$.L.str46, %esi
	movl	$inName, %edx
	xorb	%al, %al
	callq	fprintf
	movl	$inName, %edi
	callq	pad
	movq	stderr(%rip), %rdi
	callq	fflush
.LBB19_66:                              # %if.end153
	movq	160(%rsp), %rax
	movq	%rax, outputHandleJustInCase(%rip)
	movb	$1, deleteOutputOnInterrupt(%rip)
	movq	160(%rsp), %rsi
	movq	168(%rsp), %rdi
	callq	compressStream
	movq	$0, outputHandleJustInCase(%rip)
	cmpl	$3, srcMode(%rip)
	jne	.LBB19_70
# BB#67:                                # %if.then156
	movl	$outName, %edi
	callq	applySavedMetaInfoToOutputFile
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpb	$0, keepInputFiles(%rip)
	jne	.LBB19_70
# BB#68:                                # %if.then158
	movl	$inName, %edi
	callq	remove
	movl	%eax, 4(%rsp)
	testl	%eax, %eax
	je	.LBB19_70
# BB#69:                                # %if.then162
	callq	ioError
.LBB19_70:                              # %if.end165
	movb	$0, deleteOutputOnInterrupt(%rip)
	jmp	.LBB19_71
.LBB19_19:                              # %if.then18
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
.LBB19_25:                              # %if.then29
	xorb	%al, %al
	callq	fprintf
.LBB19_16:                              # %if.end11
	movl	$1, %edi
	callq	setExit
.LBB19_71:                              # %return
	addq	$184, %rsp
	popq	%rbx
	popq	%r14
	ret
.LBB19_59:                              # %if.then125
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
.LBB19_55:                              # %if.then104
	cmpq	$0, 168(%rsp)
	je	.LBB19_16
# BB#56:                                # %if.then109
	movq	168(%rsp), %rdi
	callq	fclose
	jmp	.LBB19_16
.Ltmp76:
	.size	compress, .Ltmp76-compress
	.cfi_endproc

	.align	16, 0x90
	.type	uncompress,@function
uncompress:                             # @uncompress
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp80:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp81:
	.cfi_def_cfa_offset 24
	subq	$200, %rsp
.Ltmp82:
	.cfi_def_cfa_offset 224
.Ltmp83:
	.cfi_offset %rbx, -24
.Ltmp84:
	.cfi_offset %r14, -16
	movq	%rdi, 192(%rsp)
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpq	$0, 192(%rsp)
	jne	.LBB20_3
# BB#1:                                 # %land.lhs.true
	cmpl	$1, srcMode(%rip)
	je	.LBB20_3
# BB#2:                                 # %if.then
	movl	$.L.str70, %edi
	callq	panic
.LBB20_3:                               # %if.end
	movb	$0, 166(%rsp)
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	je	.LBB20_7
# BB#4:                                 # %if.end
	cmpl	$2, %eax
	jne	.LBB20_5
# BB#12:                                # %sw.bb9
	movq	192(%rsp), %rsi
	movl	$inName, %edi
	jmp	.LBB20_13
.LBB20_7:                               # %sw.bb2
	movq	192(%rsp), %rsi
	movl	$inName, %edi
	callq	copyFileName
	movq	192(%rsp), %rsi
	movl	$outName, %edi
	callq	copyFileName
	movl	$0, 168(%rsp)
	jmp	.LBB20_8
	.align	16, 0x90
.LBB20_10:                              # %for.inc
                                        #   in Loop: Header=BB20_8 Depth=1
	incl	168(%rsp)
.LBB20_8:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$3, 168(%rsp)
	jg	.LBB20_11
# BB#9:                                 # %for.body
                                        #   in Loop: Header=BB20_8 Depth=1
	movslq	168(%rsp), %rax
	movq	unzSuffix(,%rax,8), %rdx
	movq	zSuffix(,%rax,8), %rsi
	movl	$outName, %edi
	callq	mapSuffix
	testb	%al, %al
	jne	.LBB20_14
	jmp	.LBB20_10
.LBB20_5:                               # %if.end
	cmpl	$1, %eax
	jne	.LBB20_14
# BB#6:                                 # %sw.bb
	movl	$inName, %edi
	movl	$.L.str37, %esi
.LBB20_13:                              # %sw.bb9
	callq	copyFileName
	movl	$outName, %edi
	movl	$.L.str71, %esi
	callq	copyFileName
	jmp	.LBB20_14
.LBB20_11:                              # %for.end
	movb	$1, 166(%rsp)
	movl	$outName, %edi
	movl	$.L.str72, %esi
	callq	strcat
.LBB20_14:                              # %zzz
	cmpl	$1, srcMode(%rip)
	je	.LBB20_21
# BB#15:                                # %land.lhs.true11
	movl	$inName, %edi
	callq	containsDubiousChars
	testb	%al, %al
	je	.LBB20_21
# BB#16:                                # %if.then14
	cmpb	$0, noisy(%rip)
	je	.LBB20_20
# BB#17:                                # %if.then16
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str38, %esi
	jmp	.LBB20_18
.LBB20_21:                              # %if.end19
	cmpl	$1, srcMode(%rip)
	je	.LBB20_24
# BB#22:                                # %land.lhs.true22
	movl	$inName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB20_23
.LBB20_24:                              # %if.end29
	cmpl	$3, srcMode(%rip)
	je	.LBB20_26
# BB#25:                                # %lor.lhs.false
	cmpl	$2, srcMode(%rip)
	jne	.LBB20_28
.LBB20_26:                              # %if.then34
	leaq	16(%rsp), %rsi
	movl	$inName, %edi
	callq	stat
	movl	$61440, %eax            # imm = 0xF000
	andl	40(%rsp), %eax
	cmpl	$16384, %eax            # imm = 0x4000
	jne	.LBB20_28
# BB#27:                                # %if.then38
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str40, %esi
.LBB20_18:                              # %if.then16
	movl	$inName, %ecx
.LBB20_19:                              # %if.then16
	xorb	%al, %al
	callq	fprintf
	jmp	.LBB20_20
.LBB20_28:                              # %if.end41
	cmpl	$3, srcMode(%rip)
	jne	.LBB20_33
# BB#29:                                # %land.lhs.true44
	cmpb	$0, forceOverwrite(%rip)
	jne	.LBB20_33
# BB#30:                                # %land.lhs.true46
	movl	$inName, %edi
	callq	notAStandardFile
	testb	%al, %al
	je	.LBB20_33
# BB#31:                                # %if.then50
	cmpb	$0, noisy(%rip)
	je	.LBB20_20
# BB#32:                                # %if.then52
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str74, %esi
	jmp	.LBB20_18
.LBB20_33:                              # %if.end55
	cmpb	$0, 166(%rsp)
	je	.LBB20_36
# BB#34:                                # %if.then57
	cmpb	$0, noisy(%rip)
	je	.LBB20_36
# BB#35:                                # %if.then59
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str75, %esi
	movl	$inName, %ecx
	movl	$outName, %r8d
	xorb	%al, %al
	callq	fprintf
.LBB20_36:                              # %if.end62
	cmpl	$3, srcMode(%rip)
	jne	.LBB20_40
# BB#37:                                # %land.lhs.true65
	movl	$outName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB20_40
# BB#38:                                # %if.then69
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB20_81
# BB#39:                                # %if.then71
	movl	$outName, %edi
	callq	remove
.LBB20_40:                              # %if.end75
	cmpl	$3, srcMode(%rip)
	jne	.LBB20_46
# BB#41:                                # %land.lhs.true78
	cmpb	$0, forceOverwrite(%rip)
	jne	.LBB20_46
# BB#42:                                # %land.lhs.true80
	movl	$inName, %edi
	callq	countHardLinks
	movl	%eax, 172(%rsp)
	testl	%eax, %eax
	jle	.LBB20_46
# BB#43:                                # %if.then84
	movl	$.L.str78, %r9d
	movl	172(%rsp), %r8d
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	cmpl	$1, %r8d
	jg	.LBB20_45
# BB#44:                                # %select.mid
	movl	$.L.str413, %r9d
.LBB20_45:                              # %select.end
	movl	$.L.str77, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	jmp	.LBB20_20
.LBB20_46:                              # %if.end88
	cmpl	$3, srcMode(%rip)
	jne	.LBB20_48
# BB#47:                                # %if.then91
	movl	$inName, %edi
	callq	saveInputFileMetaInfo
.LBB20_48:                              # %if.end92
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	je	.LBB20_57
# BB#49:                                # %if.end92
	cmpl	$2, %eax
	jne	.LBB20_50
# BB#53:                                # %sw.bb101
	movl	$inName, %edi
	movl	$.L.str43, %esi
	callq	fopen
	movq	%rax, 184(%rsp)
	movq	stdout(%rip), %rax
	movq	%rax, 176(%rsp)
	cmpq	$0, 184(%rsp)
	jne	.LBB20_63
# BB#54:                                # %if.then105
	movq	progName(%rip), %r14
	movq	stderr(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movq	%rbx, %rdi
	movl	$.L.str44, %esi
	movq	%r14, %rdx
	movl	$inName, %ecx
	jmp	.LBB20_55
.LBB20_23:                              # %if.then25
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
	jmp	.LBB20_20
.LBB20_57:                              # %sw.bb115
	movl	$inName, %edi
	movl	$.L.str43, %esi
	callq	fopen
	movq	%rax, 184(%rsp)
	movl	$outName, %edi
	movl	$.L.str79, %esi
	callq	fopen_output_safely
	movq	%rax, 176(%rsp)
	testq	%rax, %rax
	je	.LBB20_58
# BB#59:                                # %if.end129
	cmpq	$0, 184(%rsp)
	jne	.LBB20_63
# BB#60:                                # %if.then132
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
	je	.LBB20_20
# BB#61:                                # %if.then138
	movq	176(%rsp), %rdi
	callq	fclose
	jmp	.LBB20_20
.LBB20_50:                              # %if.end92
	cmpl	$1, %eax
	jne	.LBB20_62
# BB#51:                                # %sw.bb93
	movq	stdin(%rip), %rax
	movq	%rax, 184(%rsp)
	movq	stdout(%rip), %rax
	movq	%rax, 176(%rsp)
	movq	stdin(%rip), %rdi
	callq	fileno
	movl	%eax, %edi
	callq	isatty
	testl	%eax, %eax
	je	.LBB20_63
# BB#52:                                # %if.then97
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str41, %esi
	xorb	%al, %al
	callq	fprintf
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str42, %esi
	movq	%rdx, %rcx
	jmp	.LBB20_19
.LBB20_62:                              # %sw.default
	movl	$.L.str81, %edi
	callq	panic
.LBB20_63:                              # %sw.epilog142
	cmpl	$0, verbosity(%rip)
	jle	.LBB20_65
# BB#64:                                # %if.then145
	movq	stderr(%rip), %rdi
	movl	$.L.str46, %esi
	movl	$inName, %edx
	xorb	%al, %al
	callq	fprintf
	movl	$inName, %edi
	callq	pad
	movq	stderr(%rip), %rdi
	callq	fflush
.LBB20_65:                              # %if.end148
	movq	176(%rsp), %rax
	movq	%rax, outputHandleJustInCase(%rip)
	movb	$1, deleteOutputOnInterrupt(%rip)
	movq	176(%rsp), %rsi
	movq	184(%rsp), %rdi
	callq	uncompressStream
	movb	%al, 167(%rsp)
	movq	$0, outputHandleJustInCase(%rip)
	cmpb	$0, 167(%rsp)
	je	.LBB20_69
# BB#66:                                # %if.then151
	cmpl	$3, srcMode(%rip)
	jne	.LBB20_73
# BB#67:                                # %if.then154
	movl	$outName, %edi
	callq	applySavedMetaInfoToOutputFile
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpb	$0, keepInputFiles(%rip)
	jne	.LBB20_73
# BB#68:                                # %if.then156
	movl	$inName, %edi
	callq	remove
	movl	%eax, 12(%rsp)
	jmp	.LBB20_71
.LBB20_69:                              # %if.else164
	movb	$1, unzFailsExist(%rip)
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpl	$3, srcMode(%rip)
	jne	.LBB20_73
# BB#70:                                # %if.then167
	movl	$outName, %edi
	callq	remove
	movl	%eax, 8(%rsp)
.LBB20_71:                              # %if.then167
	testl	%eax, %eax
	je	.LBB20_73
# BB#72:                                # %if.then172
	callq	ioError
.LBB20_73:                              # %if.end175
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpb	$0, 167(%rsp)
	je	.LBB20_77
# BB#74:                                # %if.then177
	cmpl	$0, verbosity(%rip)
	jle	.LBB20_80
# BB#75:                                # %if.then180
	movq	stderr(%rip), %rdi
	movl	$.L.str82, %esi
	jmp	.LBB20_76
.LBB20_77:                              # %if.else183
	movl	$2, %edi
	callq	setExit
	cmpl	$0, verbosity(%rip)
	jle	.LBB20_79
# BB#78:                                # %if.then186
	movq	stderr(%rip), %rdi
	movl	$.L.str83, %esi
.LBB20_76:                              # %if.then180
	xorb	%al, %al
	callq	fprintf
	jmp	.LBB20_80
.LBB20_81:                              # %if.else
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str76, %esi
	movl	$outName, %ecx
	jmp	.LBB20_19
.LBB20_58:                              # %if.then120
	movq	progName(%rip), %r14
	movq	stderr(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movq	%rbx, %rdi
	movl	$.L.str80, %esi
	movq	%r14, %rdx
	movl	$outName, %ecx
.LBB20_55:                              # %if.then105
	movq	%rax, %r8
	xorb	%al, %al
	callq	fprintf
	cmpq	$0, 184(%rsp)
	je	.LBB20_20
# BB#56:                                # %if.then111
	movq	184(%rsp), %rdi
	callq	fclose
.LBB20_20:                              # %if.end18
	movl	$1, %edi
	callq	setExit
.LBB20_80:                              # %if.end191
	addq	$200, %rsp
	popq	%rbx
	popq	%r14
	ret
.LBB20_79:                              # %if.else188
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str84, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	jmp	.LBB20_80
.Ltmp85:
	.size	uncompress, .Ltmp85-uncompress
	.cfi_endproc

	.align	16, 0x90
	.type	setExit,@function
setExit:                                # @setExit
	.cfi_startproc
# BB#0:                                 # %entry
	movl	%edi, -4(%rsp)
	cmpl	exitValue(%rip), %edi
	jle	.LBB21_2
# BB#1:                                 # %if.then
	movl	-4(%rsp), %eax
	movl	%eax, exitValue(%rip)
.LBB21_2:                               # %if.end
	ret
.Ltmp86:
	.size	setExit, .Ltmp86-setExit
	.cfi_endproc

	.align	16, 0x90
	.type	testf,@function
testf:                                  # @testf
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp90:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp91:
	.cfi_def_cfa_offset 24
	subq	$168, %rsp
.Ltmp92:
	.cfi_def_cfa_offset 192
.Ltmp93:
	.cfi_offset %rbx, -24
.Ltmp94:
	.cfi_offset %r14, -16
	movq	%rdi, 160(%rsp)
	movb	$0, deleteOutputOnInterrupt(%rip)
	cmpq	$0, 160(%rsp)
	jne	.LBB22_3
# BB#1:                                 # %land.lhs.true
	cmpl	$1, srcMode(%rip)
	je	.LBB22_3
# BB#2:                                 # %if.then
	movl	$.L.str36, %edi
	callq	panic
.LBB22_3:                               # %if.end
	movl	$outName, %edi
	movl	$.L.str615, %esi
	callq	copyFileName
	movl	srcMode(%rip), %eax
	cmpl	$3, %eax
	je	.LBB22_7
# BB#4:                                 # %if.end
	cmpl	$2, %eax
	jne	.LBB22_5
.LBB22_7:                               # %sw.bb3
	movq	160(%rsp), %rsi
	movl	$inName, %edi
	jmp	.LBB22_8
.LBB22_5:                               # %if.end
	cmpl	$1, %eax
	jne	.LBB22_9
# BB#6:                                 # %sw.bb
	movl	$inName, %edi
	movl	$.L.str37, %esi
.LBB22_8:                               # %sw.bb3
	callq	copyFileName
.LBB22_9:                               # %sw.epilog
	cmpl	$1, srcMode(%rip)
	je	.LBB22_16
# BB#10:                                # %land.lhs.true5
	movl	$inName, %edi
	callq	containsDubiousChars
	testb	%al, %al
	je	.LBB22_16
# BB#11:                                # %if.then6
	cmpb	$0, noisy(%rip)
	je	.LBB22_15
# BB#12:                                # %if.then8
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str38, %esi
	jmp	.LBB22_13
.LBB22_16:                              # %if.end11
	cmpl	$1, srcMode(%rip)
	je	.LBB22_20
# BB#17:                                # %land.lhs.true14
	movl	$inName, %edi
	callq	fileExists
	testb	%al, %al
	je	.LBB22_18
.LBB22_20:                              # %if.end21
	cmpl	$1, srcMode(%rip)
	je	.LBB22_23
# BB#21:                                # %if.then24
	leaq	(%rsp), %rsi
	movl	$inName, %edi
	callq	stat
	movl	$61440, %eax            # imm = 0xF000
	andl	24(%rsp), %eax
	cmpl	$16384, %eax            # imm = 0x4000
	jne	.LBB22_23
# BB#22:                                # %if.then28
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str40, %esi
.LBB22_13:                              # %if.then8
	movl	$inName, %ecx
.LBB22_14:                              # %if.then8
	xorb	%al, %al
	callq	fprintf
	jmp	.LBB22_15
.LBB22_23:                              # %if.end31
	movl	srcMode(%rip), %eax
	leal	-2(%rax), %ecx
	cmpl	$2, %ecx
	jae	.LBB22_24
# BB#28:                                # %sw.bb40
	movl	$inName, %edi
	movl	$.L.str43, %esi
	callq	fopen
	movq	%rax, 152(%rsp)
	testq	%rax, %rax
	jne	.LBB22_31
# BB#29:                                # %if.then44
	movq	progName(%rip), %r14
	movq	stderr(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movq	%rbx, %rdi
	movl	$.L.str44, %esi
	jmp	.LBB22_19
.LBB22_24:                              # %if.end31
	cmpl	$1, %eax
	jne	.LBB22_30
# BB#25:                                # %sw.bb32
	movq	stdin(%rip), %rdi
	callq	fileno
	movl	%eax, %edi
	callq	isatty
	testl	%eax, %eax
	je	.LBB22_27
# BB#26:                                # %if.then36
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str41, %esi
	xorb	%al, %al
	callq	fprintf
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str42, %esi
	movq	%rdx, %rcx
	jmp	.LBB22_14
.LBB22_18:                              # %if.then17
	movq	progName(%rip), %r14
	movq	stderr(%rip), %rbx
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movq	%rbx, %rdi
	movl	$.L.str39, %esi
.LBB22_19:                              # %if.then17
	movq	%r14, %rdx
	movl	$inName, %ecx
	movq	%rax, %r8
	xorb	%al, %al
	callq	fprintf
.LBB22_15:                              # %if.end10
	movl	$1, %edi
	callq	setExit
	jmp	.LBB22_38
.LBB22_30:                              # %sw.default
	movl	$.L.str45, %edi
	callq	panic
	jmp	.LBB22_31
.LBB22_27:                              # %if.end39
	movq	stdin(%rip), %rax
	movq	%rax, 152(%rsp)
.LBB22_31:                              # %sw.epilog49
	cmpl	$0, verbosity(%rip)
	jle	.LBB22_33
# BB#32:                                # %if.then52
	movq	stderr(%rip), %rdi
	movl	$.L.str46, %esi
	movl	$inName, %edx
	xorb	%al, %al
	callq	fprintf
	movl	$inName, %edi
	callq	pad
	movq	stderr(%rip), %rdi
	callq	fflush
.LBB22_33:                              # %if.end55
	movq	$0, outputHandleJustInCase(%rip)
	movq	152(%rsp), %rdi
	callq	testStream
	movb	%al, 151(%rsp)
	movzbl	151(%rsp), %eax
	testl	%eax, %eax
	je	.LBB22_36
# BB#34:                                # %land.lhs.true59
	cmpl	$0, verbosity(%rip)
	jle	.LBB22_36
# BB#35:                                # %if.then62
	movq	stderr(%rip), %rdi
	movl	$.L.str47, %esi
	xorb	%al, %al
	callq	fprintf
.LBB22_36:                              # %if.end64
	cmpb	$0, 151(%rsp)
	jne	.LBB22_38
# BB#37:                                # %if.then66
	movb	$1, testFailsExist(%rip)
.LBB22_38:                              # %if.end67
	addq	$168, %rsp
	popq	%rbx
	popq	%r14
	ret
.Ltmp95:
	.size	testf, .Ltmp95-testf
	.cfi_endproc

	.align	16, 0x90
	.type	panic,@function
panic:                                  # @panic
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp97:
	.cfi_def_cfa_offset 16
	movq	%rdi, %rax
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
.Ltmp98:
	.size	panic, .Ltmp98-panic
	.cfi_endproc

	.align	16, 0x90
	.type	containsDubiousChars,@function
containsDubiousChars:                   # @containsDubiousChars
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -8(%rsp)
	xorl	%eax, %eax
	ret
.Ltmp99:
	.size	containsDubiousChars, .Ltmp99-containsDubiousChars
	.cfi_endproc

	.align	16, 0x90
	.type	fileExists,@function
fileExists:                             # @fileExists
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp101:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movl	$.L.str43, %esi
	callq	fopen
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	setne	7(%rsp)
	cmpq	$0, 8(%rsp)
	je	.LBB25_2
# BB#1:                                 # %if.then
	movq	8(%rsp), %rdi
	callq	fclose
.LBB25_2:                               # %if.end
	movzbl	7(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp102:
	.size	fileExists, .Ltmp102-fileExists
	.cfi_endproc

	.align	16, 0x90
	.type	pad,@function
pad:                                    # @pad
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp106:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp107:
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
.Ltmp108:
	.cfi_def_cfa_offset 48
.Ltmp109:
	.cfi_offset %rbx, -24
.Ltmp110:
	.cfi_offset %rbp, -16
	movq	%rdi, 16(%rsp)
	callq	strlen
	cmpl	longestFileName(%rip), %eax
	jge	.LBB26_4
# BB#1:                                 # %if.end
	movl	$1, 12(%rsp)
	jmp	.LBB26_2
	.align	16, 0x90
.LBB26_3:                               # %for.inc
                                        #   in Loop: Header=BB26_2 Depth=1
	movq	stderr(%rip), %rdi
	movl	$.L.str68, %esi
	xorb	%al, %al
	callq	fprintf
	incl	12(%rsp)
.LBB26_2:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	12(%rsp), %ebx
	movl	longestFileName(%rip), %ebp
	movq	16(%rsp), %rdi
	callq	strlen
	subl	%eax, %ebp
	cmpl	%ebp, %ebx
	jle	.LBB26_3
.LBB26_4:                               # %for.end
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp111:
	.size	pad, .Ltmp111-pad
	.cfi_endproc

	.align	16, 0x90
	.type	testStream,@function
testStream:                             # @testStream
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp118:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp119:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp120:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp121:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp122:
	.cfi_def_cfa_offset 48
	subq	$10096, %rsp            # imm = 0x2770
.Ltmp123:
	.cfi_def_cfa_offset 10144
.Ltmp124:
	.cfi_offset %rbx, -48
.Ltmp125:
	.cfi_offset %r12, -40
.Ltmp126:
	.cfi_offset %r13, -32
.Ltmp127:
	.cfi_offset %r14, -24
.Ltmp128:
	.cfi_offset %r15, -16
	movq	%rdi, 10080(%rsp)
	movq	$0, 10072(%rsp)
	movl	$0, 28(%rsp)
	movl	$0, 10052(%rsp)
	movq	10080(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB27_27
# BB#1:
	leaq	10068(%rsp), %rbx
	leaq	32(%rsp), %r14
	leaq	5040(%rsp), %r15
	leaq	16(%rsp), %r12
	leaq	28(%rsp), %r13
.LBB27_2:                               # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB27_5 Depth 2
                                        #     Child Loop BB27_15 Depth 2
	movl	28(%rsp), %r9d
	movzbl	smallMode(%rip), %ecx
	movl	verbosity(%rip), %edx
	movq	10080(%rsp), %rsi
	movq	%rbx, %rdi
	movq	%r14, %r8
	callq	BZ2_bzReadOpen
	movq	%rax, 10072(%rsp)
	testq	%rax, %rax
	je	.LBB27_7
# BB#3:                                 # %lor.lhs.false
                                        #   in Loop: Header=BB27_2 Depth=1
	cmpl	$0, 10068(%rsp)
	jne	.LBB27_7
# BB#4:                                 # %if.end6
                                        #   in Loop: Header=BB27_2 Depth=1
	incl	10052(%rsp)
	.align	16, 0x90
.LBB27_5:                               # %while.cond7
                                        #   Parent Loop BB27_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 10068(%rsp)
	jne	.LBB27_11
# BB#6:                                 # %while.body10
                                        #   in Loop: Header=BB27_5 Depth=2
	movq	10072(%rsp), %rsi
	movq	%rbx, %rdi
	movq	%r15, %rdx
	movl	$5000, %ecx             # imm = 0x1388
	callq	BZ2_bzRead
	movl	%eax, 10056(%rsp)
	cmpl	$-5, 10068(%rsp)
	jne	.LBB27_5
	jmp	.LBB27_7
	.align	16, 0x90
.LBB27_11:                              # %while.end
                                        #   in Loop: Header=BB27_2 Depth=1
	cmpl	$4, 10068(%rsp)
	jne	.LBB27_7
# BB#12:                                # %if.end20
                                        #   in Loop: Header=BB27_2 Depth=1
	movq	10072(%rsp), %rsi
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movq	%r13, %rcx
	callq	BZ2_bzReadGetUnused
	cmpl	$0, 10068(%rsp)
	je	.LBB27_14
# BB#13:                                # %if.then23
                                        #   in Loop: Header=BB27_2 Depth=1
	movl	$.L.str48, %edi
	callq	panic
.LBB27_14:                              # %if.end24
                                        #   in Loop: Header=BB27_2 Depth=1
	movq	16(%rsp), %rax
	movq	%rax, 8(%rsp)
	movl	$0, 10048(%rsp)
	jmp	.LBB27_15
	.align	16, 0x90
.LBB27_16:                              # %for.inc
                                        #   in Loop: Header=BB27_15 Depth=2
	movslq	10048(%rsp), %rax
	movq	8(%rsp), %rcx
	movb	(%rcx,%rax), %cl
	movb	%cl, 32(%rsp,%rax)
	incl	10048(%rsp)
.LBB27_15:                              # %for.cond
                                        #   Parent Loop BB27_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	10048(%rsp), %eax
	cmpl	28(%rsp), %eax
	jl	.LBB27_16
# BB#17:                                # %for.end
                                        #   in Loop: Header=BB27_2 Depth=1
	movq	10072(%rsp), %rsi
	movq	%rbx, %rdi
	callq	BZ2_bzReadClose
	cmpl	$0, 10068(%rsp)
	je	.LBB27_19
# BB#18:                                # %if.then32
                                        #   in Loop: Header=BB27_2 Depth=1
	movl	$.L.str48, %edi
	callq	panic
.LBB27_19:                              # %if.end33
                                        #   in Loop: Header=BB27_2 Depth=1
	cmpl	$0, 28(%rsp)
	jne	.LBB27_2
# BB#20:                                # %land.lhs.true
                                        #   in Loop: Header=BB27_2 Depth=1
	movq	10080(%rsp), %rdi
	callq	myfeof
	testb	%al, %al
	je	.LBB27_2
# BB#21:                                # %while.end41
	movq	10080(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB27_27
# BB#22:                                # %if.end45
	movq	10080(%rsp), %rdi
	callq	fclose
	movl	%eax, 10060(%rsp)
	cmpl	$-1, %eax
	je	.LBB27_27
# BB#23:                                # %if.end50
	cmpl	$2, verbosity(%rip)
	jl	.LBB27_40
# BB#24:                                # %if.then53
	movq	stderr(%rip), %rdi
	movl	$.L.str49, %esi
	jmp	.LBB27_25
.LBB27_7:                               # %errhandler
	movq	10072(%rsp), %rsi
	leaq	10064(%rsp), %rdi
	callq	BZ2_bzReadClose
	cmpl	$0, verbosity(%rip)
	jne	.LBB27_9
# BB#8:                                 # %if.then58
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str50, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
.LBB27_9:                               # %if.end60
	movl	10068(%rsp), %eax
	addl	$9, %eax
	cmpl	$6, %eax
	ja	.LBB27_38
# BB#10:                                # %if.end60
	jmpq	*.LJTI27_0(,%rax,8)
.LBB27_26:                              # %sw.bb
	callq	configError
	jmp	.LBB27_39
.LBB27_27:                              # %errhandler_io
	callq	ioError
	jmp	.LBB27_39
.LBB27_38:                              # %sw.default
	movl	$.L.str55, %edi
	callq	panic
.LBB27_39:                              # %sw.epilog
	movl	$.L.str56, %edi
	callq	panic
.LBB27_40:                              # %sw.epilog
	movb	$1, 10095(%rsp)
.LBB27_41:                              # %return
	movzbl	10095(%rsp), %eax
	addq	$10096, %rsp            # imm = 0x2770
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.LBB27_32:                              # %sw.bb67
	movq	10080(%rsp), %rax
	cmpq	stdin(%rip), %rax
	je	.LBB27_34
# BB#33:                                # %if.then70
	movq	10080(%rsp), %rdi
	callq	fclose
.LBB27_34:                              # %if.end72
	cmpl	$1, 10052(%rsp)
	jne	.LBB27_36
# BB#35:                                # %if.then75
	movq	stderr(%rip), %rdi
	movl	$.L.str53, %esi
	jmp	.LBB27_29
.LBB27_28:                              # %sw.bb62
	movq	stderr(%rip), %rdi
	movl	$.L.str51, %esi
	jmp	.LBB27_29
.LBB27_30:                              # %sw.bb64
	callq	outOfMemory
.LBB27_31:                              # %sw.bb65
	movq	stderr(%rip), %rdi
	movl	$.L.str52, %esi
.LBB27_29:                              # %sw.bb62
	xorb	%al, %al
	callq	fprintf
	movb	$0, 10095(%rsp)
	jmp	.LBB27_41
.LBB27_36:                              # %if.else
	cmpb	$0, noisy(%rip)
	je	.LBB27_40
# BB#37:                                # %if.then78
	movq	stderr(%rip), %rdi
	movl	$.L.str54, %esi
.LBB27_25:                              # %if.then53
	xorb	%al, %al
	callq	fprintf
	jmp	.LBB27_40
.Ltmp129:
	.size	testStream, .Ltmp129-testStream
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI27_0:
	.quad	.LBB27_26
	.quad	.LBB27_38
	.quad	.LBB27_31
	.quad	.LBB27_27
	.quad	.LBB27_32
	.quad	.LBB27_28
	.quad	.LBB27_30

	.text
	.align	16, 0x90
	.type	myfeof,@function
myfeof:                                 # @myfeof
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp131:
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	callq	fgetc
	movl	%eax, 4(%rsp)
	cmpl	$-1, %eax
	jne	.LBB28_2
# BB#1:                                 # %if.then
	movb	$1, 23(%rsp)
	jmp	.LBB28_3
.LBB28_2:                               # %if.end
	movq	8(%rsp), %rsi
	movl	4(%rsp), %edi
	callq	ungetc
	movb	$0, 23(%rsp)
.LBB28_3:                               # %return
	movzbl	23(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp132:
	.size	myfeof, .Ltmp132-myfeof
	.cfi_endproc

	.align	16, 0x90
	.type	configError,@function
configError:                            # @configError
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp134:
	.cfi_def_cfa_offset 16
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
.Ltmp135:
	.size	configError, .Ltmp135-configError
	.cfi_endproc

	.align	16, 0x90
	.type	ioError,@function
ioError:                                # @ioError
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp137:
	.cfi_def_cfa_offset 16
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
.Ltmp138:
	.size	ioError, .Ltmp138-ioError
	.cfi_endproc

	.align	16, 0x90
	.type	outOfMemory,@function
outOfMemory:                            # @outOfMemory
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp140:
	.cfi_def_cfa_offset 16
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
.Ltmp141:
	.size	outOfMemory, .Ltmp141-outOfMemory
	.cfi_endproc

	.align	16, 0x90
	.type	showFileNames,@function
showFileNames:                          # @showFileNames
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp143:
	.cfi_def_cfa_offset 16
	cmpb	$0, noisy(%rip)
	je	.LBB32_2
# BB#1:                                 # %if.then
	movq	stderr(%rip), %rdi
	movl	$.L.str65, %esi
	movl	$inName, %edx
	movl	$outName, %ecx
	xorb	%al, %al
	callq	fprintf
.LBB32_2:                               # %if.end
	popq	%rax
	ret
.Ltmp144:
	.size	showFileNames, .Ltmp144-showFileNames
	.cfi_endproc

	.align	16, 0x90
	.type	cleanUpAndFail,@function
cleanUpAndFail:                         # @cleanUpAndFail
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$152, %rsp
.Ltmp146:
	.cfi_def_cfa_offset 160
	movl	%edi, 148(%rsp)
	cmpl	$3, srcMode(%rip)
	jne	.LBB33_12
# BB#1:                                 # %land.lhs.true
	cmpl	$3, opMode(%rip)
	je	.LBB33_12
# BB#2:                                 # %land.lhs.true2
	movzbl	deleteOutputOnInterrupt(%rip), %eax
	testl	%eax, %eax
	je	.LBB33_12
# BB#3:                                 # %if.then
	leaq	(%rsp), %rsi
	movl	$inName, %edi
	callq	stat
	movl	%eax, 144(%rsp)
	testl	%eax, %eax
	je	.LBB33_4
# BB#10:                                # %if.else
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
	jmp	.LBB33_11
.LBB33_4:                               # %if.then5
	cmpb	$0, noisy(%rip)
	je	.LBB33_6
# BB#5:                                 # %if.then7
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str58, %esi
	movl	$outName, %ecx
	xorb	%al, %al
	callq	fprintf
.LBB33_6:                               # %if.end
	cmpq	$0, outputHandleJustInCase(%rip)
	je	.LBB33_8
# BB#7:                                 # %if.then11
	movq	outputHandleJustInCase(%rip), %rdi
	callq	fclose
.LBB33_8:                               # %if.end13
	movl	$outName, %edi
	callq	remove
	movl	%eax, 144(%rsp)
	testl	%eax, %eax
	je	.LBB33_12
# BB#9:                                 # %if.then17
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str59, %esi
.LBB33_11:                              # %if.else
	xorb	%al, %al
	callq	fprintf
.LBB33_12:                              # %if.end25
	movzbl	noisy(%rip), %eax
	testl	%eax, %eax
	je	.LBB33_16
# BB#13:                                # %land.lhs.true28
	cmpl	$0, numFileNames(%rip)
	jle	.LBB33_16
# BB#14:                                # %land.lhs.true31
	movl	numFilesProcessed(%rip), %eax
	cmpl	numFileNames(%rip), %eax
	jge	.LBB33_16
# BB#15:                                # %if.then34
	movl	numFileNames(%rip), %r8d
	movl	%r8d, %r9d
	subl	numFilesProcessed(%rip), %r9d
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str64, %esi
	movq	%rdx, %rcx
	xorb	%al, %al
	callq	fprintf
.LBB33_16:                              # %if.end36
	movl	148(%rsp), %edi
	callq	setExit
	movl	exitValue(%rip), %edi
	callq	exit
	addq	$152, %rsp
	ret
.Ltmp147:
	.size	cleanUpAndFail, .Ltmp147-cleanUpAndFail
	.cfi_endproc

	.align	16, 0x90
	.type	mapSuffix,@function
mapSuffix:                              # @mapSuffix
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp150:
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
.Ltmp151:
	.cfi_def_cfa_offset 48
.Ltmp152:
	.cfi_offset %rbx, -16
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rdx, (%rsp)
	movq	8(%rsp), %rsi
	movq	16(%rsp), %rdi
	callq	hasSuffix
	testb	%al, %al
	je	.LBB34_1
# BB#2:                                 # %if.end
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
	jmp	.LBB34_3
.LBB34_1:                               # %if.then
	movb	$0, 31(%rsp)
.LBB34_3:                               # %return
	movzbl	31(%rsp), %eax
	addq	$32, %rsp
	popq	%rbx
	ret
.Ltmp153:
	.size	mapSuffix, .Ltmp153-mapSuffix
	.cfi_endproc

	.align	16, 0x90
	.type	notAStandardFile,@function
notAStandardFile:                       # @notAStandardFile
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$168, %rsp
.Ltmp155:
	.cfi_def_cfa_offset 176
	movq	%rdi, 152(%rsp)
	leaq	(%rsp), %rsi
	callq	lstat
	movl	%eax, 148(%rsp)
	testl	%eax, %eax
	jne	.LBB35_3
# BB#1:                                 # %if.end
	movl	$61440, %eax            # imm = 0xF000
	andl	24(%rsp), %eax
	cmpl	$32768, %eax            # imm = 0x8000
	jne	.LBB35_3
# BB#2:                                 # %if.then2
	movb	$0, 167(%rsp)
	jmp	.LBB35_4
.LBB35_3:                               # %if.end3
	movb	$1, 167(%rsp)
.LBB35_4:                               # %return
	movzbl	167(%rsp), %eax
	addq	$168, %rsp
	ret
.Ltmp156:
	.size	notAStandardFile, .Ltmp156-notAStandardFile
	.cfi_endproc

	.align	16, 0x90
	.type	countHardLinks,@function
countHardLinks:                         # @countHardLinks
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$168, %rsp
.Ltmp158:
	.cfi_def_cfa_offset 176
	movq	%rdi, 152(%rsp)
	leaq	(%rsp), %rsi
	callq	lstat
	movl	%eax, 148(%rsp)
	testl	%eax, %eax
	je	.LBB36_2
# BB#1:                                 # %if.then
	movl	$0, 164(%rsp)
	jmp	.LBB36_3
.LBB36_2:                               # %if.end
	movl	16(%rsp), %eax
	decl	%eax
	movl	%eax, 164(%rsp)
.LBB36_3:                               # %return
	movl	164(%rsp), %eax
	addq	$168, %rsp
	ret
.Ltmp159:
	.size	countHardLinks, .Ltmp159-countHardLinks
	.cfi_endproc

	.align	16, 0x90
	.type	saveInputFileMetaInfo,@function
saveInputFileMetaInfo:                  # @saveInputFileMetaInfo
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp161:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movl	$fileMetaInfo, %esi
	callq	stat
	movl	%eax, 12(%rsp)
	testl	%eax, %eax
	je	.LBB37_2
# BB#1:                                 # %if.then
	callq	ioError
.LBB37_2:                               # %if.end
	addq	$24, %rsp
	ret
.Ltmp162:
	.size	saveInputFileMetaInfo, .Ltmp162-saveInputFileMetaInfo
	.cfi_endproc

	.align	16, 0x90
	.type	uncompressStream,@function
uncompressStream:                       # @uncompressStream
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp169:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp170:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp171:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp172:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp173:
	.cfi_def_cfa_offset 48
	subq	$10096, %rsp            # imm = 0x2770
.Ltmp174:
	.cfi_def_cfa_offset 10144
.Ltmp175:
	.cfi_offset %rbx, -48
.Ltmp176:
	.cfi_offset %r12, -40
.Ltmp177:
	.cfi_offset %r13, -32
.Ltmp178:
	.cfi_offset %r14, -24
.Ltmp179:
	.cfi_offset %r15, -16
	movq	%rdi, 10080(%rsp)
	movq	%rsi, 10072(%rsp)
	movq	$0, 10064(%rsp)
	movl	$0, 28(%rsp)
	movl	$0, 10044(%rsp)
	movq	10072(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB38_13
# BB#1:                                 # %if.end
	movq	10080(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB38_13
# BB#2:
	leaq	10060(%rsp), %r15
	leaq	32(%rsp), %r14
	leaq	5040(%rsp), %rbx
	leaq	16(%rsp), %r12
	leaq	28(%rsp), %r13
.LBB38_3:                               # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB38_6 Depth 2
                                        #     Child Loop BB38_18 Depth 2
	movl	28(%rsp), %r9d
	movzbl	smallMode(%rip), %ecx
	movl	verbosity(%rip), %edx
	movq	10080(%rsp), %rsi
	movq	%r15, %rdi
	movq	%r14, %r8
	callq	BZ2_bzReadOpen
	movq	%rax, 10064(%rsp)
	testq	%rax, %rax
	je	.LBB38_39
# BB#4:                                 # %lor.lhs.false
                                        #   in Loop: Header=BB38_3 Depth=1
	cmpl	$0, 10060(%rsp)
	jne	.LBB38_39
# BB#5:                                 # %if.end10
                                        #   in Loop: Header=BB38_3 Depth=1
	incl	10044(%rsp)
	.align	16, 0x90
.LBB38_6:                               # %while.cond11
                                        #   Parent Loop BB38_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 10060(%rsp)
	jne	.LBB38_14
# BB#7:                                 # %while.body14
                                        #   in Loop: Header=BB38_6 Depth=2
	movq	10064(%rsp), %rsi
	movq	%r15, %rdi
	movq	%rbx, %rdx
	movl	$5000, %ecx             # imm = 0x1388
	callq	BZ2_bzRead
	movl	%eax, 10048(%rsp)
	cmpl	$-5, 10060(%rsp)
	je	.LBB38_32
# BB#8:                                 # %if.end20
                                        #   in Loop: Header=BB38_6 Depth=2
	cmpl	$0, 10060(%rsp)
	je	.LBB38_10
# BB#9:                                 # %lor.lhs.false23
                                        #   in Loop: Header=BB38_6 Depth=2
	cmpl	$4, 10060(%rsp)
	jne	.LBB38_12
.LBB38_10:                              # %land.lhs.true
                                        #   in Loop: Header=BB38_6 Depth=2
	cmpl	$0, 10048(%rsp)
	jle	.LBB38_12
# BB#11:                                # %if.then28
                                        #   in Loop: Header=BB38_6 Depth=2
	movq	10072(%rsp), %rcx
	movslq	10048(%rsp), %rdx
	movq	%rbx, %rdi
	movl	$1, %esi
	callq	fwrite
.LBB38_12:                              # %if.end32
                                        #   in Loop: Header=BB38_6 Depth=2
	movq	10072(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB38_6
	jmp	.LBB38_13
.LBB38_14:                              # %while.end
                                        #   in Loop: Header=BB38_3 Depth=1
	cmpl	$4, 10060(%rsp)
	jne	.LBB38_39
# BB#15:                                # %if.end40
                                        #   in Loop: Header=BB38_3 Depth=1
	movq	10064(%rsp), %rsi
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r13, %rcx
	callq	BZ2_bzReadGetUnused
	cmpl	$0, 10060(%rsp)
	je	.LBB38_17
# BB#16:                                # %if.then43
                                        #   in Loop: Header=BB38_3 Depth=1
	movl	$.L.str85, %edi
	callq	panic
.LBB38_17:                              # %if.end44
                                        #   in Loop: Header=BB38_3 Depth=1
	movq	16(%rsp), %rax
	movq	%rax, 8(%rsp)
	movl	$0, 10040(%rsp)
	jmp	.LBB38_18
	.align	16, 0x90
.LBB38_19:                              # %for.inc
                                        #   in Loop: Header=BB38_18 Depth=2
	movslq	10040(%rsp), %rax
	movq	8(%rsp), %rcx
	movb	(%rcx,%rax), %cl
	movb	%cl, 32(%rsp,%rax)
	incl	10040(%rsp)
.LBB38_18:                              # %for.cond
                                        #   Parent Loop BB38_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	10040(%rsp), %eax
	cmpl	28(%rsp), %eax
	jl	.LBB38_19
# BB#20:                                # %for.end
                                        #   in Loop: Header=BB38_3 Depth=1
	movq	10064(%rsp), %rsi
	movq	%r15, %rdi
	callq	BZ2_bzReadClose
	cmpl	$0, 10060(%rsp)
	je	.LBB38_22
# BB#21:                                # %if.then52
                                        #   in Loop: Header=BB38_3 Depth=1
	movl	$.L.str85, %edi
	callq	panic
.LBB38_22:                              # %if.end53
                                        #   in Loop: Header=BB38_3 Depth=1
	cmpl	$0, 28(%rsp)
	jne	.LBB38_3
# BB#23:                                # %land.lhs.true56
                                        #   in Loop: Header=BB38_3 Depth=1
	movq	10080(%rsp), %rdi
	callq	myfeof
	testb	%al, %al
	je	.LBB38_3
	jmp	.LBB38_24
.LBB38_32:                              # %trycat
	cmpb	$0, forceOverwrite(%rip)
	je	.LBB38_39
# BB#33:                                # %if.then96
	movq	10080(%rsp), %rdi
	callq	rewind
	leaq	5040(%rsp), %rbx
	.align	16, 0x90
.LBB38_34:                              # %while.body97
                                        # =>This Inner Loop Header: Depth=1
	movq	10080(%rsp), %rdi
	callq	myfeof
	testb	%al, %al
	jne	.LBB38_24
# BB#35:                                # %if.end101
                                        #   in Loop: Header=BB38_34 Depth=1
	movq	10080(%rsp), %rcx
	movq	%rbx, %rdi
	movl	$1, %esi
	movl	$5000, %edx             # imm = 0x1388
	callq	fread
	movl	%eax, 10048(%rsp)
	movq	10080(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB38_13
# BB#36:                                # %if.end108
                                        #   in Loop: Header=BB38_34 Depth=1
	cmpl	$0, 10048(%rsp)
	jle	.LBB38_38
# BB#37:                                # %if.then111
                                        #   in Loop: Header=BB38_34 Depth=1
	movq	10072(%rsp), %rcx
	movslq	10048(%rsp), %rdx
	movq	%rbx, %rdi
	movl	$1, %esi
	callq	fwrite
.LBB38_38:                              # %if.end115
                                        #   in Loop: Header=BB38_34 Depth=1
	movq	10072(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB38_34
	jmp	.LBB38_13
.LBB38_39:                              # %errhandler
	movq	10064(%rsp), %rsi
	leaq	10056(%rsp), %rdi
	callq	BZ2_bzReadClose
	movl	10060(%rsp), %eax
	addl	$9, %eax
	cmpl	$6, %eax
	ja	.LBB38_53
# BB#40:                                # %errhandler
	jmpq	*.LJTI38_0(,%rax,8)
.LBB38_41:                              # %sw.bb
	callq	configError
	jmp	.LBB38_54
.LBB38_53:                              # %sw.default
	movl	$.L.str87, %edi
	callq	panic
	jmp	.LBB38_54
.LBB38_24:                              # %closeok
	movq	10080(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB38_13
# BB#25:                                # %if.end66
	movq	10080(%rsp), %rdi
	callq	fclose
	movl	%eax, 10052(%rsp)
	cmpl	$-1, %eax
	je	.LBB38_13
# BB#26:                                # %if.end71
	movq	10072(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB38_13
# BB#27:                                # %if.end75
	movq	10072(%rsp), %rdi
	callq	fflush
	movl	%eax, 10052(%rsp)
	testl	%eax, %eax
	jne	.LBB38_13
# BB#28:                                # %if.end80
	movq	10072(%rsp), %rax
	cmpq	stdout(%rip), %rax
	je	.LBB38_30
# BB#29:                                # %if.then83
	movq	10072(%rsp), %rdi
	callq	fclose
	movl	%eax, 10052(%rsp)
	movq	$0, outputHandleJustInCase(%rip)
	cmpl	$-1, 10052(%rsp)
	jne	.LBB38_30
.LBB38_13:                              # %errhandler_io
	callq	ioError
.LBB38_54:                              # %sw.epilog
	movl	$.L.str88, %edi
	callq	panic
.LBB38_55:                              # %sw.epilog
	movb	$1, 10095(%rsp)
.LBB38_56:                              # %return
	movzbl	10095(%rsp), %eax
	addq	$10096, %rsp            # imm = 0x2770
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.LBB38_42:                              # %sw.bb123
	callq	crcError
.LBB38_43:                              # %sw.bb124
	callq	outOfMemory
.LBB38_44:                              # %sw.bb125
	callq	compressedStreamEOF
.LBB38_45:                              # %sw.bb126
	movq	10080(%rsp), %rax
	cmpq	stdin(%rip), %rax
	je	.LBB38_47
# BB#46:                                # %if.then129
	movq	10080(%rsp), %rdi
	callq	fclose
.LBB38_47:                              # %if.end131
	movq	10072(%rsp), %rax
	cmpq	stdout(%rip), %rax
	je	.LBB38_49
# BB#48:                                # %if.then134
	movq	10072(%rsp), %rdi
	callq	fclose
.LBB38_49:                              # %if.end136
	cmpl	$1, 10044(%rsp)
	jne	.LBB38_51
# BB#50:                                # %if.then139
	movb	$0, 10095(%rsp)
	jmp	.LBB38_56
.LBB38_51:                              # %if.else
	cmpb	$0, noisy(%rip)
	je	.LBB38_55
# BB#52:                                # %if.then141
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str86, %esi
	movl	$inName, %ecx
	xorb	%al, %al
	callq	fprintf
	jmp	.LBB38_55
.LBB38_30:                              # %if.end89
	movq	$0, outputHandleJustInCase(%rip)
	cmpl	$2, verbosity(%rip)
	jl	.LBB38_55
# BB#31:                                # %if.then92
	movq	stderr(%rip), %rdi
	movl	$.L.str49, %esi
	xorb	%al, %al
	callq	fprintf
	jmp	.LBB38_55
.Ltmp180:
	.size	uncompressStream, .Ltmp180-uncompressStream
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI38_0:
	.quad	.LBB38_41
	.quad	.LBB38_53
	.quad	.LBB38_44
	.quad	.LBB38_13
	.quad	.LBB38_45
	.quad	.LBB38_42
	.quad	.LBB38_43

	.text
	.align	16, 0x90
	.type	applySavedMetaInfoToOutputFile,@function
applySavedMetaInfoToOutputFile:         # @applySavedMetaInfoToOutputFile
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp182:
	.cfi_def_cfa_offset 48
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
	je	.LBB39_2
# BB#1:                                 # %if.then
	callq	ioError
.LBB39_2:                               # %if.end
	movq	32(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	utime
	movl	%eax, 28(%rsp)
	testl	%eax, %eax
	je	.LBB39_4
# BB#3:                                 # %if.then3
	callq	ioError
.LBB39_4:                               # %if.end4
	movl	fileMetaInfo+32(%rip), %edx
	movl	fileMetaInfo+28(%rip), %esi
	movq	32(%rsp), %rdi
	callq	chown
	movl	%eax, 28(%rsp)
	addq	$40, %rsp
	ret
.Ltmp183:
	.size	applySavedMetaInfoToOutputFile, .Ltmp183-applySavedMetaInfoToOutputFile
	.cfi_endproc

	.align	16, 0x90
	.type	crcError,@function
crcError:                               # @crcError
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp185:
	.cfi_def_cfa_offset 16
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
.Ltmp186:
	.size	crcError, .Ltmp186-crcError
	.cfi_endproc

	.align	16, 0x90
	.type	compressedStreamEOF,@function
compressedStreamEOF:                    # @compressedStreamEOF
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp188:
	.cfi_def_cfa_offset 16
	cmpb	$0, noisy(%rip)
	je	.LBB41_2
# BB#1:                                 # %if.then
	movq	progName(%rip), %rdx
	movq	stderr(%rip), %rdi
	movl	$.L.str89, %esi
	xorb	%al, %al
	callq	fprintf
	movq	progName(%rip), %rdi
	callq	perror
	callq	showFileNames
	callq	cadvise
.LBB41_2:                               # %if.end
	movl	$2, %edi
	callq	cleanUpAndFail
	popq	%rax
	ret
.Ltmp189:
	.size	compressedStreamEOF, .Ltmp189-compressedStreamEOF
	.cfi_endproc

	.align	16, 0x90
	.type	cadvise,@function
cadvise:                                # @cadvise
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp191:
	.cfi_def_cfa_offset 16
	cmpb	$0, noisy(%rip)
	je	.LBB42_2
# BB#1:                                 # %if.then
	movq	stderr(%rip), %rdi
	movl	$.L.str90, %esi
	xorb	%al, %al
	callq	fprintf
.LBB42_2:                               # %if.end
	popq	%rax
	ret
.Ltmp192:
	.size	cadvise, .Ltmp192-cadvise
	.cfi_endproc

	.align	16, 0x90
	.type	hasSuffix,@function
hasSuffix:                              # @hasSuffix
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp194:
	.cfi_def_cfa_offset 48
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	24(%rsp), %rdi
	callq	strlen
	movl	%eax, 12(%rsp)
	movq	16(%rsp), %rdi
	callq	strlen
	movl	%eax, 8(%rsp)
	cmpl	%eax, 12(%rsp)
	jl	.LBB43_3
# BB#1:                                 # %if.end
	movslq	12(%rsp), %rdi
	addq	24(%rsp), %rdi
	movslq	8(%rsp), %rax
	subq	%rax, %rdi
	movq	16(%rsp), %rsi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB43_2
.LBB43_3:                               # %if.end10
	movb	$0, 39(%rsp)
	jmp	.LBB43_4
.LBB43_2:                               # %if.then9
	movb	$1, 39(%rsp)
.LBB43_4:                               # %return
	movzbl	39(%rsp), %eax
	addq	$40, %rsp
	ret
.Ltmp195:
	.size	hasSuffix, .Ltmp195-hasSuffix
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
.Ltmp200:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp201:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp202:
	.cfi_def_cfa_offset 32
	subq	$5168, %rsp             # imm = 0x1430
.Ltmp203:
	.cfi_def_cfa_offset 5200
.Ltmp204:
	.cfi_offset %rbx, -32
.Ltmp205:
	.cfi_offset %r14, -24
.Ltmp206:
	.cfi_offset %r15, -16
	movq	%rdi, 5160(%rsp)
	movq	%rsi, 5152(%rsp)
	movq	$0, 5144(%rsp)
	movq	5160(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB44_27
# BB#1:                                 # %if.end
	movq	5152(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB44_27
# BB#2:                                 # %if.end4
	movl	workFactor(%rip), %r8d
	movl	verbosity(%rip), %ecx
	movl	blockSize100k(%rip), %edx
	movq	5152(%rsp), %rsi
	leaq	120(%rsp), %rdi
	callq	BZ2_bzWriteOpen
	movq	%rax, 5144(%rsp)
	cmpl	$0, 120(%rsp)
	jne	.LBB44_10
# BB#3:                                 # %if.end7
	cmpl	$2, verbosity(%rip)
	jl	.LBB44_5
# BB#4:                                 # %if.then9
	movq	stderr(%rip), %rdi
	movl	$.L.str96, %esi
	xorb	%al, %al
	callq	fprintf
	.align	16, 0x90
.LBB44_5:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	5160(%rsp), %rdi
	callq	myfeof
	testb	%al, %al
	jne	.LBB44_14
# BB#6:                                 # %if.end15
                                        #   in Loop: Header=BB44_5 Depth=1
	movq	5160(%rsp), %rcx
	leaq	144(%rsp), %rdi
	movl	$1, %esi
	movl	$5000, %edx             # imm = 0x1388
	callq	fread
	movl	%eax, 140(%rsp)
	movq	5160(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB44_27
# BB#7:                                 # %if.end20
                                        #   in Loop: Header=BB44_5 Depth=1
	cmpl	$0, 140(%rsp)
	jle	.LBB44_9
# BB#8:                                 # %if.then23
                                        #   in Loop: Header=BB44_5 Depth=1
	movl	140(%rsp), %ecx
	movq	5144(%rsp), %rsi
	leaq	120(%rsp), %rdi
	leaq	144(%rsp), %rdx
	callq	BZ2_bzWrite
.LBB44_9:                               # %if.end25
                                        #   in Loop: Header=BB44_5 Depth=1
	cmpl	$0, 120(%rsp)
	je	.LBB44_5
	jmp	.LBB44_10
.LBB44_14:                              # %while.end
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
	je	.LBB44_15
.LBB44_10:                              # %errhandler
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
	je	.LBB44_26
# BB#11:                                # %errhandler
	cmpl	$-6, %eax
	je	.LBB44_27
# BB#12:                                # %errhandler
	cmpl	$-9, %eax
	jne	.LBB44_28
# BB#13:                                # %sw.bb
	callq	configError
	jmp	.LBB44_29
.LBB44_26:                              # %sw.bb82
	callq	outOfMemory
	jmp	.LBB44_29
.LBB44_28:                              # %sw.default
	movl	$.L.str99, %edi
	callq	panic
	jmp	.LBB44_29
.LBB44_15:                              # %if.end33
	movq	5152(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB44_27
# BB#16:                                # %if.end37
	movq	5152(%rsp), %rdi
	callq	fflush
	movl	%eax, 112(%rsp)
	cmpl	$-1, %eax
	je	.LBB44_27
# BB#17:                                # %if.end42
	movq	5152(%rsp), %rax
	cmpq	stdout(%rip), %rax
	je	.LBB44_19
# BB#18:                                # %if.then45
	movq	5152(%rsp), %rdi
	callq	fclose
	movl	%eax, 112(%rsp)
	movq	$0, outputHandleJustInCase(%rip)
	cmpl	$-1, 112(%rsp)
	je	.LBB44_27
.LBB44_19:                              # %if.end51
	movq	$0, outputHandleJustInCase(%rip)
	movq	5160(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB44_27
# BB#20:                                # %if.end55
	movq	5160(%rsp), %rdi
	callq	fclose
	movl	%eax, 112(%rsp)
	cmpl	$-1, %eax
	jne	.LBB44_21
.LBB44_27:                              # %errhandler_io
	callq	ioError
.LBB44_29:                              # %sw.epilog
	movl	$.L.str100, %edi
	callq	panic
.LBB44_30:                              # %return
	addq	$5168, %rsp             # imm = 0x1430
	popq	%rbx
	popq	%r14
	popq	%r15
	ret
.LBB44_21:                              # %if.end60
	cmpl	$0, verbosity(%rip)
	jle	.LBB44_30
# BB#22:                                # %if.then63
	cmpl	$0, 136(%rsp)
	jne	.LBB44_25
# BB#23:                                # %land.lhs.true
	cmpl	$0, 132(%rsp)
	je	.LBB44_24
.LBB44_25:                              # %if.else
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
	jmp	.LBB44_30
.LBB44_24:                              # %if.then68
	movq	stderr(%rip), %rdi
	movl	$.L.str97, %esi
	xorb	%al, %al
	callq	fprintf
	jmp	.LBB44_30
.Ltmp207:
	.size	compressStream, .Ltmp207-compressStream
	.cfi_endproc

	.align	16, 0x90
	.type	uInt64_from_UInt32s,@function
uInt64_from_UInt32s:                    # @uInt64_from_UInt32s
	.cfi_startproc
# BB#0:                                 # %entry
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
.Ltmp208:
	.size	uInt64_from_UInt32s, .Ltmp208-uInt64_from_UInt32s
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
	movq	%rdi, -8(%rsp)
	movabsq	$4607182418800017408, %rax # imm = 0x3FF0000000000000
	movq	%rax, -24(%rsp)
	movq	$0, -32(%rsp)
	movl	$0, -12(%rsp)
	movsd	.LCPI46_0(%rip), %xmm0
	jmp	.LBB46_1
	.align	16, 0x90
.LBB46_2:                               # %for.inc
                                        #   in Loop: Header=BB46_1 Depth=1
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
	incl	-12(%rsp)
.LBB46_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$7, -12(%rsp)
	jle	.LBB46_2
# BB#3:                                 # %for.end
	movsd	-32(%rsp), %xmm0
	ret
.Ltmp209:
	.size	uInt64_to_double, .Ltmp209-uInt64_to_double
	.cfi_endproc

	.align	16, 0x90
	.type	uInt64_toAscii,@function
uInt64_toAscii:                         # @uInt64_toAscii
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp212:
	.cfi_def_cfa_offset 16
	subq	$80, %rsp
.Ltmp213:
	.cfi_def_cfa_offset 96
.Ltmp214:
	.cfi_offset %rbx, -16
	movq	%rdi, 72(%rsp)
	movq	%rsi, 64(%rsp)
	movl	$0, 12(%rsp)
	movq	64(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, (%rsp)
	leaq	(%rsp), %rbx
	.align	16, 0x90
.LBB47_1:                               # %do.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	uInt64_qrm10
	movl	%eax, 56(%rsp)
	addl	$48, %eax
	movslq	12(%rsp), %rcx
	movb	%al, 16(%rsp,%rcx)
	incl	12(%rsp)
	movq	%rbx, %rdi
	callq	uInt64_isZero
	testb	%al, %al
	je	.LBB47_1
# BB#2:                                 # %do.end
	movq	72(%rsp), %rax
	movslq	12(%rsp), %rcx
	movb	$0, (%rax,%rcx)
	movl	$0, 60(%rsp)
	jmp	.LBB47_3
	.align	16, 0x90
.LBB47_4:                               # %for.body
                                        #   in Loop: Header=BB47_3 Depth=1
	movslq	60(%rsp), %rax
	movl	12(%rsp), %ecx
	subl	%eax, %ecx
	decl	%ecx
	movslq	%ecx, %rcx
	movb	16(%rsp,%rcx), %cl
	movq	72(%rsp), %rdx
	movb	%cl, (%rdx,%rax)
	incl	60(%rsp)
.LBB47_3:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	60(%rsp), %eax
	cmpl	12(%rsp), %eax
	jl	.LBB47_4
# BB#5:                                 # %for.end
	addq	$80, %rsp
	popq	%rbx
	ret
.Ltmp215:
	.size	uInt64_toAscii, .Ltmp215-uInt64_toAscii
	.cfi_endproc

	.align	16, 0x90
	.type	uInt64_qrm10,@function
uInt64_qrm10:                           # @uInt64_qrm10
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -8(%rsp)
	movl	$0, -12(%rsp)
	movl	$7, -20(%rsp)
	movl	$3435973837, %eax       # imm = 0xCCCCCCCD
	jmp	.LBB48_1
	.align	16, 0x90
.LBB48_2:                               # %for.inc
                                        #   in Loop: Header=BB48_1 Depth=1
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
	decl	-20(%rsp)
.LBB48_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, -20(%rsp)
	jns	.LBB48_2
# BB#3:                                 # %for.end
	movl	-12(%rsp), %eax
	ret
.Ltmp216:
	.size	uInt64_qrm10, .Ltmp216-uInt64_qrm10
	.cfi_endproc

	.align	16, 0x90
	.type	uInt64_isZero,@function
uInt64_isZero:                          # @uInt64_isZero
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -16(%rsp)
	movl	$0, -20(%rsp)
	jmp	.LBB49_1
	.align	16, 0x90
.LBB49_4:                               # %for.inc
                                        #   in Loop: Header=BB49_1 Depth=1
	incl	-20(%rsp)
.LBB49_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$7, -20(%rsp)
	jg	.LBB49_5
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB49_1 Depth=1
	movslq	-20(%rsp), %rax
	movq	-16(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	testl	%eax, %eax
	je	.LBB49_4
# BB#3:                                 # %if.then
	movb	$0, -1(%rsp)
	movzbl	-1(%rsp), %eax
	ret
.LBB49_5:                               # %for.end
	movb	$1, -1(%rsp)
	movzbl	-1(%rsp), %eax
	ret
.Ltmp217:
	.size	uInt64_isZero, .Ltmp217-uInt64_isZero
	.cfi_endproc

	.align	16, 0x90
	.type	mkCell,@function
mkCell:                                 # @mkCell
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp219:
	.cfi_def_cfa_offset 16
	movl	$16, %edi
	callq	myMalloc
	movq	%rax, (%rsp)
	movq	$0, (%rax)
	movq	(%rsp), %rax
	movq	$0, 8(%rax)
	movq	(%rsp), %rax
	popq	%rdx
	ret
.Ltmp220:
	.size	mkCell, .Ltmp220-mkCell
	.cfi_endproc

	.align	16, 0x90
	.type	myMalloc,@function
myMalloc:                               # @myMalloc
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp222:
	.cfi_def_cfa_offset 32
	movl	%edi, 20(%rsp)
	movslq	20(%rsp), %rdi
	callq	malloc
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	jne	.LBB51_2
# BB#1:                                 # %if.then
	callq	outOfMemory
.LBB51_2:                               # %if.end
	movq	8(%rsp), %rax
	addq	$24, %rsp
	ret
.Ltmp223:
	.size	myMalloc, .Ltmp223-myMalloc
	.cfi_endproc

	.globl	BZ2_bz__AssertH__fail
	.align	16, 0x90
	.type	BZ2_bz__AssertH__fail,@function
BZ2_bz__AssertH__fail:                  # @BZ2_bz__AssertH__fail
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp227:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp228:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp229:
	.cfi_def_cfa_offset 32
.Ltmp230:
	.cfi_offset %rbx, -24
.Ltmp231:
	.cfi_offset %r14, -16
	movl	%edi, %ebx
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
	jne	.LBB52_2
# BB#1:                                 # %if.then
	movq	stderr(%rip), %rdi
	movl	$.L.str1109, %esi
	xorb	%al, %al
	callq	fprintf
.LBB52_2:                               # %if.end
	movl	$3, %edi
	callq	exit
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	ret
.Ltmp232:
	.size	BZ2_bz__AssertH__fail, .Ltmp232-BZ2_bz__AssertH__fail
	.cfi_endproc

	.globl	BZ2_bzlibVersion
	.align	16, 0x90
	.type	BZ2_bzlibVersion,@function
BZ2_bzlibVersion:                       # @BZ2_bzlibVersion
	.cfi_startproc
# BB#0:                                 # %entry
	movl	$.L.str5113, %eax
	ret
.Ltmp233:
	.size	BZ2_bzlibVersion, .Ltmp233-BZ2_bzlibVersion
	.cfi_endproc

	.globl	BZ2_bzCompressInit
	.align	16, 0x90
	.type	BZ2_bzCompressInit,@function
BZ2_bzCompressInit:                     # @BZ2_bzCompressInit
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp235:
	.cfi_def_cfa_offset 48
	movq	%rdi, 24(%rsp)
	movl	%esi, 20(%rsp)
	movl	%edx, 16(%rsp)
	movl	%ecx, 12(%rsp)
	callq	bz_config_ok
	testl	%eax, %eax
	je	.LBB54_1
# BB#2:                                 # %if.end
	cmpq	$0, 24(%rsp)
	je	.LBB54_7
# BB#3:                                 # %lor.lhs.false
	cmpl	$0, 20(%rsp)
	jle	.LBB54_7
# BB#4:                                 # %lor.lhs.false2
	cmpl	$9, 20(%rsp)
	jg	.LBB54_7
# BB#5:                                 # %lor.lhs.false4
	cmpl	$0, 12(%rsp)
	js	.LBB54_7
# BB#6:                                 # %lor.lhs.false6
	cmpl	$251, 12(%rsp)
	jl	.LBB54_8
.LBB54_7:                               # %if.then8
	movl	$-2, 36(%rsp)
	jmp	.LBB54_29
.LBB54_1:                               # %if.then
	movl	$-9, 36(%rsp)
.LBB54_29:                              # %return
	movl	36(%rsp), %eax
	addq	$40, %rsp
	ret
.LBB54_8:                               # %if.end9
	cmpl	$0, 12(%rsp)
	jne	.LBB54_10
# BB#9:                                 # %if.then11
	movl	$30, 12(%rsp)
.LBB54_10:                              # %if.end12
	movq	24(%rsp), %rax
	cmpq	$0, 56(%rax)
	jne	.LBB54_12
# BB#11:                                # %if.then14
	movq	24(%rsp), %rax
	movq	$default_bzalloc, 56(%rax)
.LBB54_12:                              # %if.end16
	movq	24(%rsp), %rax
	cmpq	$0, 64(%rax)
	jne	.LBB54_14
# BB#13:                                # %if.then18
	movq	24(%rsp), %rax
	movq	$default_bzfree, 64(%rax)
.LBB54_14:                              # %if.end20
	movq	24(%rsp), %rax
	movq	72(%rax), %rdi
	movl	$55768, %esi            # imm = 0xD9D8
	movl	$1, %edx
	callq	*56(%rax)
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.LBB54_15
# BB#16:                                # %if.end25
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
	je	.LBB54_19
# BB#17:                                # %lor.lhs.false47
	movq	(%rsp), %rax
	cmpq	$0, 32(%rax)
	je	.LBB54_19
# BB#18:                                # %lor.lhs.false51
	movq	(%rsp), %rax
	cmpq	$0, 40(%rax)
	je	.LBB54_19
# BB#28:                                # %if.end86
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
	jmp	.LBB54_29
.LBB54_19:                              # %if.then55
	movq	(%rsp), %rax
	cmpq	$0, 24(%rax)
	je	.LBB54_21
# BB#20:                                # %if.then59
	movq	(%rsp), %rax
	movq	24(%rax), %rsi
	movq	24(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
.LBB54_21:                              # %if.end63
	movq	(%rsp), %rax
	cmpq	$0, 32(%rax)
	je	.LBB54_23
# BB#22:                                # %if.then67
	movq	(%rsp), %rax
	movq	32(%rax), %rsi
	movq	24(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
.LBB54_23:                              # %if.end71
	movq	(%rsp), %rax
	cmpq	$0, 40(%rax)
	je	.LBB54_25
# BB#24:                                # %if.then75
	movq	(%rsp), %rax
	movq	40(%rax), %rsi
	movq	24(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
.LBB54_25:                              # %if.end79
	cmpq	$0, (%rsp)
	je	.LBB54_27
# BB#26:                                # %if.then82
	movq	24(%rsp), %rax
	movq	72(%rax), %rdi
	movq	(%rsp), %rsi
	callq	*64(%rax)
.LBB54_27:                              # %if.end85
	movl	$-3, 36(%rsp)
	jmp	.LBB54_29
.LBB54_15:                              # %if.then24
	movl	$-3, 36(%rsp)
	jmp	.LBB54_29
.Ltmp236:
	.size	BZ2_bzCompressInit, .Ltmp236-BZ2_bzCompressInit
	.cfi_endproc

	.align	16, 0x90
	.type	bz_config_ok,@function
bz_config_ok:                           # @bz_config_ok
	.cfi_startproc
# BB#0:                                 # %entry
	movl	$1, %eax
	ret
.Ltmp237:
	.size	bz_config_ok, .Ltmp237-bz_config_ok
	.cfi_endproc

	.align	16, 0x90
	.type	default_bzalloc,@function
default_bzalloc:                        # @default_bzalloc
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp239:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movl	%esi, 12(%rsp)
	movl	%edx, 8(%rsp)
	imull	12(%rsp), %edx
	movslq	%edx, %rdi
	callq	malloc
	movq	%rax, (%rsp)
	addq	$24, %rsp
	ret
.Ltmp240:
	.size	default_bzalloc, .Ltmp240-default_bzalloc
	.cfi_endproc

	.align	16, 0x90
	.type	default_bzfree,@function
default_bzfree:                         # @default_bzfree
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp242:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	testq	%rsi, %rsi
	je	.LBB57_2
# BB#1:                                 # %if.then
	movq	8(%rsp), %rdi
	callq	free
.LBB57_2:                               # %if.end
	addq	$24, %rsp
	ret
.Ltmp243:
	.size	default_bzfree, .Ltmp243-default_bzfree
	.cfi_endproc

	.align	16, 0x90
	.type	init_RL,@function
init_RL:                                # @init_RL
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -8(%rsp)
	movl	$256, 92(%rdi)          # imm = 0x100
	movq	-8(%rsp), %rax
	movl	$0, 96(%rax)
	ret
.Ltmp244:
	.size	init_RL, .Ltmp244-init_RL
	.cfi_endproc

	.align	16, 0x90
	.type	prepare_new_block,@function
prepare_new_block:                      # @prepare_new_block
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -8(%rsp)
	movl	$0, 108(%rdi)
	movq	-8(%rsp), %rax
	movl	$0, 116(%rax)
	movq	-8(%rsp), %rax
	movl	$0, 120(%rax)
	movq	-8(%rsp), %rax
	movl	$-1, 648(%rax)
	movl	$0, -12(%rsp)
	jmp	.LBB59_1
	.align	16, 0x90
.LBB59_2:                               # %for.body
                                        #   in Loop: Header=BB59_1 Depth=1
	movq	-8(%rsp), %rax
	movslq	-12(%rsp), %rcx
	movb	$0, 128(%rax,%rcx)
	incl	-12(%rsp)
.LBB59_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$255, -12(%rsp)
	jle	.LBB59_2
# BB#3:                                 # %for.end
	movq	-8(%rsp), %rax
	incl	660(%rax)
	ret
.Ltmp245:
	.size	prepare_new_block, .Ltmp245-prepare_new_block
	.cfi_endproc

	.globl	BZ2_bzCompress
	.align	16, 0x90
	.type	BZ2_bzCompress,@function
BZ2_bzCompress:                         # @BZ2_bzCompress
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp247:
	.cfi_def_cfa_offset 48
	movq	%rdi, 24(%rsp)
	movl	%esi, 20(%rsp)
	cmpq	$0, 24(%rsp)
	je	.LBB60_1
# BB#2:                                 # %if.end
	movq	24(%rsp), %rax
	movq	48(%rax), %rax
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.LBB60_3
# BB#4:                                 # %if.end3
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	cmpq	24(%rsp), %rax
	je	.LBB60_6
# BB#5:                                 # %if.then6
	movl	$-2, 36(%rsp)
	jmp	.LBB60_37
	.align	16, 0x90
.LBB60_12:                              # %if.then13
                                        #   in Loop: Header=BB60_6 Depth=1
	movq	24(%rsp), %rax
	movl	8(%rax), %eax
	movq	8(%rsp), %rcx
	movl	%eax, 16(%rcx)
	movq	8(%rsp), %rax
	movl	$3, 8(%rax)
.LBB60_6:                               # %preswitch
                                        # =>This Inner Loop Header: Depth=1
	movq	8(%rsp), %rax
	movl	8(%rax), %eax
	decl	%eax
	cmpl	$3, %eax
	ja	.LBB60_36
# BB#7:                                 # %preswitch
                                        #   in Loop: Header=BB60_6 Depth=1
	jmpq	*.LJTI60_0(,%rax,8)
.LBB60_9:                               # %sw.bb8
                                        #   in Loop: Header=BB60_6 Depth=1
	cmpl	$0, 20(%rsp)
	je	.LBB60_10
# BB#11:                                # %if.else
                                        #   in Loop: Header=BB60_6 Depth=1
	cmpl	$1, 20(%rsp)
	je	.LBB60_12
# BB#13:                                # %if.else15
                                        #   in Loop: Header=BB60_6 Depth=1
	cmpl	$2, 20(%rsp)
	jne	.LBB60_15
# BB#14:                                # %if.then18
                                        #   in Loop: Header=BB60_6 Depth=1
	movq	24(%rsp), %rax
	movl	8(%rax), %eax
	movq	8(%rsp), %rcx
	movl	%eax, 16(%rcx)
	movq	8(%rsp), %rax
	movl	$4, 8(%rax)
	jmp	.LBB60_6
.LBB60_1:                               # %if.then
	movl	$-2, 36(%rsp)
	jmp	.LBB60_37
.LBB60_3:                               # %if.then2
	movl	$-2, 36(%rsp)
	jmp	.LBB60_37
.LBB60_36:                              # %sw.epilog
	movl	$0, 36(%rsp)
	jmp	.LBB60_37
.LBB60_10:                              # %if.then10
	movq	24(%rsp), %rdi
	callq	handle_compress
	movb	%al, 19(%rsp)
	movl	$1, %ecx
	movl	$-2, %edx
	testb	%al, %al
	cmovnel	%ecx, %edx
	movl	%edx, 36(%rsp)
	jmp	.LBB60_37
.LBB60_15:                              # %if.else22
	movl	$-2, 36(%rsp)
	jmp	.LBB60_37
.LBB60_8:                               # %sw.bb
	movl	$-1, 36(%rsp)
	jmp	.LBB60_37
.LBB60_16:                              # %sw.bb23
	cmpl	$1, 20(%rsp)
	je	.LBB60_18
# BB#17:                                # %if.then26
	movl	$-1, 36(%rsp)
	jmp	.LBB60_37
.LBB60_25:                              # %sw.bb47
	cmpl	$2, 20(%rsp)
	je	.LBB60_27
# BB#26:                                # %if.then50
	movl	$-1, 36(%rsp)
	jmp	.LBB60_37
.LBB60_18:                              # %if.end27
	movq	8(%rsp), %rax
	movq	(%rax), %rcx
	movl	16(%rax), %eax
	cmpl	8(%rcx), %eax
	je	.LBB60_20
# BB#19:                                # %if.then33
	movl	$-1, 36(%rsp)
	jmp	.LBB60_37
.LBB60_27:                              # %if.end51
	movq	8(%rsp), %rax
	movq	(%rax), %rcx
	movl	16(%rax), %eax
	cmpl	8(%rcx), %eax
	je	.LBB60_29
# BB#28:                                # %if.then57
	movl	$-1, 36(%rsp)
	jmp	.LBB60_37
.LBB60_20:                              # %if.end34
	movq	24(%rsp), %rdi
	callq	handle_compress
	movb	%al, 19(%rsp)
	movq	8(%rsp), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB60_23
# BB#21:                                # %lor.lhs.false
	movq	8(%rsp), %rdi
	callq	isempty_RL
	testb	%al, %al
	je	.LBB60_23
# BB#22:                                # %lor.lhs.false41
	movq	8(%rsp), %rax
	movl	120(%rax), %ecx
	cmpl	116(%rax), %ecx
	jge	.LBB60_24
.LBB60_23:                              # %if.then44
	movl	$2, 36(%rsp)
	jmp	.LBB60_37
.LBB60_29:                              # %if.end58
	movq	24(%rsp), %rdi
	callq	handle_compress
	movb	%al, 19(%rsp)
	testb	%al, %al
	je	.LBB60_30
# BB#31:                                # %if.end62
	movq	8(%rsp), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB60_34
# BB#32:                                # %lor.lhs.false66
	movq	8(%rsp), %rdi
	callq	isempty_RL
	testb	%al, %al
	je	.LBB60_34
# BB#33:                                # %lor.lhs.false69
	movq	8(%rsp), %rax
	movl	120(%rax), %ecx
	cmpl	116(%rax), %ecx
	jge	.LBB60_35
.LBB60_34:                              # %if.then74
	movl	$3, 36(%rsp)
	jmp	.LBB60_37
.LBB60_24:                              # %if.end45
	movq	8(%rsp), %rax
	movl	$2, 8(%rax)
	movl	$1, 36(%rsp)
	jmp	.LBB60_37
.LBB60_30:                              # %if.then61
	movl	$-1, 36(%rsp)
	jmp	.LBB60_37
.LBB60_35:                              # %if.end75
	movq	8(%rsp), %rax
	movl	$1, 8(%rax)
	movl	$4, 36(%rsp)
.LBB60_37:                              # %return
	movl	36(%rsp), %eax
	addq	$40, %rsp
	ret
.Ltmp248:
	.size	BZ2_bzCompress, .Ltmp248-BZ2_bzCompress
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI60_0:
	.quad	.LBB60_8
	.quad	.LBB60_9
	.quad	.LBB60_16
	.quad	.LBB60_25

	.text
	.align	16, 0x90
	.type	handle_compress,@function
handle_compress:                        # @handle_compress
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp250:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movb	$0, 15(%rsp)
	movb	$0, 14(%rsp)
	movq	16(%rsp), %rax
	movq	48(%rax), %rax
	movq	%rax, (%rsp)
	jmp	.LBB61_1
	.align	16, 0x90
.LBB61_15:                              # %if.then55
                                        #   in Loop: Header=BB61_1 Depth=1
	callq	BZ2_compressBlock
	movq	(%rsp), %rax
	movl	$1, 12(%rax)
.LBB61_1:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rsp), %rax
	cmpl	$1, 12(%rax)
	jne	.LBB61_9
# BB#2:                                 # %if.then
                                        #   in Loop: Header=BB61_1 Depth=1
	movq	(%rsp), %rdi
	callq	copy_output_until_stop
	orb	%al, 14(%rsp)
	movq	(%rsp), %rax
	movl	120(%rax), %ecx
	cmpl	116(%rax), %ecx
	jl	.LBB61_17
# BB#3:                                 # %if.end
                                        #   in Loop: Header=BB61_1 Depth=1
	movq	(%rsp), %rax
	cmpl	$4, 8(%rax)
	jne	.LBB61_6
# BB#4:                                 # %land.lhs.true
                                        #   in Loop: Header=BB61_1 Depth=1
	movq	(%rsp), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB61_6
# BB#5:                                 # %land.lhs.true11
                                        #   in Loop: Header=BB61_1 Depth=1
	movq	(%rsp), %rdi
	callq	isempty_RL
	testb	%al, %al
	jne	.LBB61_17
.LBB61_6:                               # %if.end15
                                        #   in Loop: Header=BB61_1 Depth=1
	movq	(%rsp), %rdi
	callq	prepare_new_block
	movq	(%rsp), %rax
	movl	$2, 12(%rax)
	movq	(%rsp), %rax
	cmpl	$3, 8(%rax)
	jne	.LBB61_9
# BB#7:                                 # %land.lhs.true20
                                        #   in Loop: Header=BB61_1 Depth=1
	movq	(%rsp), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB61_9
# BB#8:                                 # %land.lhs.true24
                                        #   in Loop: Header=BB61_1 Depth=1
	movq	(%rsp), %rdi
	callq	isempty_RL
	testb	%al, %al
	jne	.LBB61_17
	.align	16, 0x90
.LBB61_9:                               # %if.end30
                                        #   in Loop: Header=BB61_1 Depth=1
	movq	(%rsp), %rax
	cmpl	$2, 12(%rax)
	jne	.LBB61_1
# BB#10:                                # %if.then34
                                        #   in Loop: Header=BB61_1 Depth=1
	movq	(%rsp), %rdi
	callq	copy_input_until_stop
	orb	%al, 15(%rsp)
	movq	(%rsp), %rax
	cmpl	$2, 8(%rax)
	je	.LBB61_13
# BB#11:                                # %land.lhs.true43
                                        #   in Loop: Header=BB61_1 Depth=1
	movq	(%rsp), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB61_13
# BB#12:                                # %if.then47
                                        #   in Loop: Header=BB61_1 Depth=1
	movq	(%rsp), %rdi
	callq	flush_RL
	movq	(%rsp), %rdi
	cmpl	$4, 8(%rdi)
	sete	%al
	movzbl	%al, %esi
	jmp	.LBB61_15
	.align	16, 0x90
.LBB61_13:                              # %if.else
                                        #   in Loop: Header=BB61_1 Depth=1
	movq	(%rsp), %rax
	movl	108(%rax), %ecx
	cmpl	112(%rax), %ecx
	jl	.LBB61_16
# BB#14:                                # %if.then55
                                        #   in Loop: Header=BB61_1 Depth=1
	movq	(%rsp), %rdi
	xorl	%esi, %esi
	jmp	.LBB61_15
.LBB61_16:                              # %if.else57
                                        #   in Loop: Header=BB61_1 Depth=1
	movq	(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	jne	.LBB61_1
.LBB61_17:                              # %while.end
	movb	$1, %al
	cmpb	$0, 15(%rsp)
	jne	.LBB61_19
# BB#18:                                # %lor.rhs
	cmpb	$0, 14(%rsp)
	setne	%al
.LBB61_19:                              # %lor.end
	movzbl	%al, %eax
	addq	$24, %rsp
	ret
.Ltmp251:
	.size	handle_compress, .Ltmp251-handle_compress
	.cfi_endproc

	.align	16, 0x90
	.type	isempty_RL,@function
isempty_RL:                             # @isempty_RL
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -16(%rsp)
	cmpl	$255, 92(%rdi)
	ja	.LBB62_3
# BB#1:                                 # %land.lhs.true
	movq	-16(%rsp), %rax
	cmpl	$0, 96(%rax)
	jle	.LBB62_3
# BB#2:                                 # %if.then
	movb	$0, -1(%rsp)
	movzbl	-1(%rsp), %eax
	ret
.LBB62_3:                               # %if.else
	movb	$1, -1(%rsp)
	movzbl	-1(%rsp), %eax
	ret
.Ltmp252:
	.size	isempty_RL, .Ltmp252-isempty_RL
	.cfi_endproc

	.globl	BZ2_bzCompressEnd
	.align	16, 0x90
	.type	BZ2_bzCompressEnd,@function
BZ2_bzCompressEnd:                      # @BZ2_bzCompressEnd
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp254:
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	testq	%rdi, %rdi
	je	.LBB63_1
# BB#2:                                 # %if.end
	movq	8(%rsp), %rax
	movq	48(%rax), %rax
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.LBB63_3
# BB#4:                                 # %if.end3
	movq	(%rsp), %rax
	movq	(%rax), %rax
	cmpq	8(%rsp), %rax
	je	.LBB63_6
# BB#5:                                 # %if.then6
	movl	$-2, 20(%rsp)
	jmp	.LBB63_13
.LBB63_1:                               # %if.then
	movl	$-2, 20(%rsp)
	jmp	.LBB63_13
.LBB63_3:                               # %if.then2
	movl	$-2, 20(%rsp)
	jmp	.LBB63_13
.LBB63_6:                               # %if.end7
	movq	(%rsp), %rax
	cmpq	$0, 24(%rax)
	je	.LBB63_8
# BB#7:                                 # %if.then9
	movq	(%rsp), %rax
	movq	24(%rax), %rsi
	movq	8(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
.LBB63_8:                               # %if.end11
	movq	(%rsp), %rax
	cmpq	$0, 32(%rax)
	je	.LBB63_10
# BB#9:                                 # %if.then13
	movq	(%rsp), %rax
	movq	32(%rax), %rsi
	movq	8(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
.LBB63_10:                              # %if.end17
	movq	(%rsp), %rax
	cmpq	$0, 40(%rax)
	je	.LBB63_12
# BB#11:                                # %if.then19
	movq	(%rsp), %rax
	movq	40(%rax), %rsi
	movq	8(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
.LBB63_12:                              # %if.end23
	movq	8(%rsp), %rax
	movq	48(%rax), %rsi
	movq	72(%rax), %rdi
	callq	*64(%rax)
	movq	8(%rsp), %rax
	movq	$0, 48(%rax)
	movl	$0, 20(%rsp)
.LBB63_13:                              # %return
	movl	20(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp255:
	.size	BZ2_bzCompressEnd, .Ltmp255-BZ2_bzCompressEnd
	.cfi_endproc

	.globl	BZ2_bzDecompressInit
	.align	16, 0x90
	.type	BZ2_bzDecompressInit,@function
BZ2_bzDecompressInit:                   # @BZ2_bzDecompressInit
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp257:
	.cfi_def_cfa_offset 48
	movq	%rdi, 24(%rsp)
	movl	%esi, 20(%rsp)
	movl	%edx, 16(%rsp)
	callq	bz_config_ok
	testl	%eax, %eax
	je	.LBB64_1
# BB#2:                                 # %if.end
	cmpq	$0, 24(%rsp)
	je	.LBB64_3
# BB#4:                                 # %if.end2
	cmpl	$0, 16(%rsp)
	je	.LBB64_7
# BB#5:                                 # %land.lhs.true
	cmpl	$1, 16(%rsp)
	je	.LBB64_7
# BB#6:                                 # %if.then5
	movl	$-2, 36(%rsp)
	jmp	.LBB64_17
.LBB64_1:                               # %if.then
	movl	$-9, 36(%rsp)
	jmp	.LBB64_17
.LBB64_7:                               # %if.end6
	cmpl	$0, 20(%rsp)
	js	.LBB64_9
# BB#8:                                 # %lor.lhs.false
	cmpl	$5, 20(%rsp)
	jl	.LBB64_10
.LBB64_9:                               # %if.then9
	movl	$-2, 36(%rsp)
	jmp	.LBB64_17
.LBB64_3:                               # %if.then1
	movl	$-2, 36(%rsp)
	jmp	.LBB64_17
.LBB64_10:                              # %if.end10
	movq	24(%rsp), %rax
	cmpq	$0, 56(%rax)
	jne	.LBB64_12
# BB#11:                                # %if.then12
	movq	24(%rsp), %rax
	movq	$default_bzalloc, 56(%rax)
.LBB64_12:                              # %if.end14
	movq	24(%rsp), %rax
	cmpq	$0, 64(%rax)
	jne	.LBB64_14
# BB#13:                                # %if.then16
	movq	24(%rsp), %rax
	movq	$default_bzfree, 64(%rax)
.LBB64_14:                              # %if.end18
	movq	24(%rsp), %rax
	movq	72(%rax), %rdi
	movl	$64144, %esi            # imm = 0xFA90
	movl	$1, %edx
	callq	*56(%rax)
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.LBB64_15
# BB#16:                                # %if.end23
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
	jmp	.LBB64_17
.LBB64_15:                              # %if.then22
	movl	$-3, 36(%rsp)
.LBB64_17:                              # %return
	movl	36(%rsp), %eax
	addq	$40, %rsp
	ret
.Ltmp258:
	.size	BZ2_bzDecompressInit, .Ltmp258-BZ2_bzDecompressInit
	.cfi_endproc

	.globl	BZ2_indexIntoF
	.align	16, 0x90
	.type	BZ2_indexIntoF,@function
BZ2_indexIntoF:                         # @BZ2_indexIntoF
	.cfi_startproc
# BB#0:                                 # %entry
	movl	%edi, -4(%rsp)
	movq	%rsi, -16(%rsp)
	movl	$0, -20(%rsp)
	movl	$256, -24(%rsp)         # imm = 0x100
	.align	16, 0x90
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
	movl	-28(%rsp), %eax
	movl	%eax, -20(%rsp)
	jmp	.LBB65_4
	.align	16, 0x90
.LBB65_3:                               # %if.else
                                        #   in Loop: Header=BB65_1 Depth=1
	movl	-28(%rsp), %eax
	movl	%eax, -24(%rsp)
.LBB65_4:                               # %do.cond
                                        #   in Loop: Header=BB65_1 Depth=1
	movl	-24(%rsp), %eax
	subl	-20(%rsp), %eax
	cmpl	$1, %eax
	jne	.LBB65_1
# BB#5:                                 # %do.end
	movl	-20(%rsp), %eax
	ret
.Ltmp259:
	.size	BZ2_indexIntoF, .Ltmp259-BZ2_indexIntoF
	.cfi_endproc

	.globl	BZ2_bzDecompress
	.align	16, 0x90
	.type	BZ2_bzDecompress,@function
BZ2_bzDecompress:                       # @BZ2_bzDecompress
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp261:
	.cfi_def_cfa_offset 48
	movq	%rdi, 24(%rsp)
	testq	%rdi, %rdi
	je	.LBB66_1
# BB#2:                                 # %if.end
	movq	24(%rsp), %rax
	movq	48(%rax), %rax
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.LBB66_3
# BB#4:                                 # %if.end3
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	cmpq	24(%rsp), %rax
	je	.LBB66_6
# BB#5:                                 # %if.then6
	movl	$-2, 36(%rsp)
	jmp	.LBB66_32
	.align	16, 0x90
.LBB66_6:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	8(%rsp), %rax
	cmpl	$1, 8(%rax)
	je	.LBB66_7
# BB#8:                                 # %if.end11
                                        #   in Loop: Header=BB66_6 Depth=1
	movq	8(%rsp), %rax
	cmpl	$2, 8(%rax)
	jne	.LBB66_24
# BB#9:                                 # %if.then14
                                        #   in Loop: Header=BB66_6 Depth=1
	movq	8(%rsp), %rax
	cmpb	$0, 44(%rax)
	je	.LBB66_11
# BB#10:                                # %if.then15
                                        #   in Loop: Header=BB66_6 Depth=1
	movq	8(%rsp), %rdi
	callq	unRLE_obuf_to_output_SMALL
	jmp	.LBB66_12
	.align	16, 0x90
.LBB66_11:                              # %if.else
                                        #   in Loop: Header=BB66_6 Depth=1
	movq	8(%rsp), %rdi
	callq	unRLE_obuf_to_output_FAST
.LBB66_12:                              # %if.else
                                        #   in Loop: Header=BB66_6 Depth=1
	movb	%al, 23(%rsp)
	cmpb	$0, 23(%rsp)
	jne	.LBB66_13
# BB#14:                                # %if.end20
                                        #   in Loop: Header=BB66_6 Depth=1
	movq	8(%rsp), %rcx
	movl	1092(%rcx), %eax
	movl	64080(%rcx), %ecx
	incl	%ecx
	cmpl	%ecx, %eax
	jne	.LBB66_22
# BB#15:                                # %land.lhs.true
                                        #   in Loop: Header=BB66_6 Depth=1
	movq	8(%rsp), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB66_22
# BB#16:                                # %if.then23
                                        #   in Loop: Header=BB66_6 Depth=1
	movq	8(%rsp), %rax
	notl	3184(%rax)
	movq	8(%rsp), %rax
	cmpl	$3, 52(%rax)
	jl	.LBB66_18
# BB#17:                                # %if.then26
                                        #   in Loop: Header=BB66_6 Depth=1
	movq	8(%rsp), %rax
	movl	3176(%rax), %edx
	movl	3184(%rax), %ecx
	movq	stderr(%rip), %rdi
	movl	$.L.str2110, %esi
	xorb	%al, %al
	callq	fprintf
.LBB66_18:                              # %if.end29
                                        #   in Loop: Header=BB66_6 Depth=1
	movq	8(%rsp), %rax
	cmpl	$2, 52(%rax)
	jl	.LBB66_20
# BB#19:                                # %if.then32
                                        #   in Loop: Header=BB66_6 Depth=1
	movq	stderr(%rip), %rdi
	movl	$.L.str3111, %esi
	xorb	%al, %al
	callq	fprintf
.LBB66_20:                              # %if.end34
                                        #   in Loop: Header=BB66_6 Depth=1
	movq	8(%rsp), %rax
	movl	3184(%rax), %ecx
	cmpl	3176(%rax), %ecx
	jne	.LBB66_21
# BB#23:                                # %if.end39
                                        #   in Loop: Header=BB66_6 Depth=1
	movq	8(%rsp), %rax
	roll	3188(%rax)
	movq	8(%rsp), %rax
	movl	3184(%rax), %ecx
	xorl	%ecx, 3188(%rax)
	movq	8(%rsp), %rax
	movl	$14, 8(%rax)
.LBB66_24:                              # %if.end47
                                        #   in Loop: Header=BB66_6 Depth=1
	movq	8(%rsp), %rax
	cmpl	$10, 8(%rax)
	jl	.LBB66_6
# BB#25:                                # %if.then50
                                        #   in Loop: Header=BB66_6 Depth=1
	movq	8(%rsp), %rdi
	callq	BZ2_decompress
	movl	%eax, 4(%rsp)
	cmpl	$4, %eax
	je	.LBB66_26
# BB#30:                                # %if.end65
                                        #   in Loop: Header=BB66_6 Depth=1
	movq	8(%rsp), %rax
	cmpl	$2, 8(%rax)
	je	.LBB66_6
	jmp	.LBB66_31
.LBB66_1:                               # %if.then
	movl	$-2, 36(%rsp)
	jmp	.LBB66_32
.LBB66_3:                               # %if.then2
	movl	$-2, 36(%rsp)
.LBB66_32:                              # %return
	movl	36(%rsp), %eax
	addq	$40, %rsp
	ret
.LBB66_7:                               # %if.then10
	movl	$-1, 36(%rsp)
	jmp	.LBB66_32
.LBB66_22:                              # %if.else45
	movl	$0, 36(%rsp)
	jmp	.LBB66_32
.LBB66_13:                              # %if.then19
	movl	$-4, 36(%rsp)
	jmp	.LBB66_32
.LBB66_26:                              # %if.then53
	movq	8(%rsp), %rax
	cmpl	$3, 52(%rax)
	jl	.LBB66_28
# BB#27:                                # %if.then56
	movq	8(%rsp), %rax
	movl	3180(%rax), %edx
	movl	3188(%rax), %ecx
	movq	stderr(%rip), %rdi
	movl	$.L.str4112, %esi
	xorb	%al, %al
	callq	fprintf
.LBB66_28:                              # %if.end59
	movq	8(%rsp), %rax
	movl	3188(%rax), %ecx
	cmpl	3180(%rax), %ecx
	je	.LBB66_31
# BB#29:                                # %if.then63
	movl	$-4, 36(%rsp)
	jmp	.LBB66_32
.LBB66_31:                              # %if.then68
	movl	4(%rsp), %eax
	movl	%eax, 36(%rsp)
	jmp	.LBB66_32
.LBB66_21:                              # %if.then38
	movl	$-4, 36(%rsp)
	jmp	.LBB66_32
.Ltmp262:
	.size	BZ2_bzDecompress, .Ltmp262-BZ2_bzDecompress
	.cfi_endproc

	.align	16, 0x90
	.type	unRLE_obuf_to_output_SMALL,@function
unRLE_obuf_to_output_SMALL:             # @unRLE_obuf_to_output_SMALL
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp264:
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	cmpb	$0, 20(%rdi)
	je	.LBB67_42
	jmp	.LBB67_1
	.align	16, 0x90
.LBB67_5:                               # %if.then23
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	incl	40(%rax)
.LBB67_1:                               # %while.body2
                                        # =>This Inner Loop Header: Depth=1
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 32(%rax)
	je	.LBB67_2
# BB#3:                                 # %if.end
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB67_4
# BB#6:                                 # %while.end
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rcx
	movl	1092(%rcx), %eax
	movl	64080(%rcx), %ecx
	incl	%ecx
	cmpl	%ecx, %eax
	je	.LBB67_7
# BB#8:                                 # %if.end30
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rcx
	movl	1092(%rcx), %eax
	movl	64080(%rcx), %ecx
	incl	%ecx
	cmpl	%ecx, %eax
	jg	.LBB67_50
# BB#9:                                 # %if.end37
                                        #   in Loop: Header=BB67_1 Depth=1
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
	jne	.LBB67_12
# BB#10:                                # %if.then59
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	8(%rsp), %rax
	incl	28(%rax)
	movq	8(%rsp), %rax
	cmpl	$512, 28(%rax)          # imm = 0x200
	jne	.LBB67_12
# BB#11:                                # %if.then68
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	movl	$0, 28(%rax)
.LBB67_12:                              # %if.end71
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	decl	24(%rax)
	movq	8(%rsp), %rcx
	movl	$1, %eax
	cmpl	$1, 24(%rcx)
	je	.LBB67_14
# BB#13:                                # %select.mid
                                        #   in Loop: Header=BB67_1 Depth=1
	xorl	%eax, %eax
.LBB67_14:                              # %select.end
                                        #   in Loop: Header=BB67_1 Depth=1
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
	je	.LBB67_1
# BB#15:                                # %if.end88
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	cmpl	64(%rax), %ecx
	jne	.LBB67_16
# BB#17:                                # %if.end96
                                        #   in Loop: Header=BB67_1 Depth=1
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
	jne	.LBB67_20
# BB#18:                                # %if.then125
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	8(%rsp), %rax
	incl	28(%rax)
	movq	8(%rsp), %rax
	cmpl	$512, 28(%rax)          # imm = 0x200
	jne	.LBB67_20
# BB#19:                                # %if.then135
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	movl	$0, 28(%rax)
.LBB67_20:                              # %if.end138
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	decl	24(%rax)
	movq	8(%rsp), %rcx
	movl	$1, %eax
	cmpl	$1, 24(%rcx)
	je	.LBB67_22
# BB#21:                                # %select.mid11
                                        #   in Loop: Header=BB67_1 Depth=1
	xorl	%eax, %eax
.LBB67_22:                              # %select.end10
                                        #   in Loop: Header=BB67_1 Depth=1
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
	je	.LBB67_1
# BB#23:                                # %if.end156
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	cmpl	64(%rax), %ecx
	jne	.LBB67_16
# BB#24:                                # %if.end164
                                        #   in Loop: Header=BB67_1 Depth=1
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
	jne	.LBB67_27
# BB#25:                                # %if.then193
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	8(%rsp), %rax
	incl	28(%rax)
	movq	8(%rsp), %rax
	cmpl	$512, 28(%rax)          # imm = 0x200
	jne	.LBB67_27
# BB#26:                                # %if.then203
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	movl	$0, 28(%rax)
.LBB67_27:                              # %if.end206
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	decl	24(%rax)
	movq	8(%rsp), %rcx
	movl	$1, %eax
	cmpl	$1, 24(%rcx)
	je	.LBB67_29
# BB#28:                                # %select.mid14
                                        #   in Loop: Header=BB67_1 Depth=1
	xorl	%eax, %eax
.LBB67_29:                              # %select.end13
                                        #   in Loop: Header=BB67_1 Depth=1
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
	je	.LBB67_1
# BB#30:                                # %if.end224
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	cmpl	64(%rax), %ecx
	je	.LBB67_31
.LBB67_16:                              # %if.then93
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	movl	%ecx, 64(%rax)
	jmp	.LBB67_1
	.align	16, 0x90
.LBB67_4:                               # %if.end6
                                        #   in Loop: Header=BB67_1 Depth=1
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
	jne	.LBB67_1
	jmp	.LBB67_5
.LBB67_31:                              # %if.end232
                                        #   in Loop: Header=BB67_1 Depth=1
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
	jne	.LBB67_34
# BB#32:                                # %if.then260
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	8(%rsp), %rax
	incl	28(%rax)
	movq	8(%rsp), %rax
	cmpl	$512, 28(%rax)          # imm = 0x200
	jne	.LBB67_34
# BB#33:                                # %if.then270
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	movl	$0, 28(%rax)
.LBB67_34:                              # %if.end273
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	decl	24(%rax)
	movq	8(%rsp), %rcx
	movl	$1, %eax
	cmpl	$1, 24(%rcx)
	je	.LBB67_36
# BB#35:                                # %select.mid17
                                        #   in Loop: Header=BB67_1 Depth=1
	xorl	%eax, %eax
.LBB67_36:                              # %select.end16
                                        #   in Loop: Header=BB67_1 Depth=1
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
	jne	.LBB67_39
# BB#37:                                # %if.then315
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	8(%rsp), %rax
	incl	28(%rax)
	movq	8(%rsp), %rax
	cmpl	$512, 28(%rax)          # imm = 0x200
	jne	.LBB67_39
# BB#38:                                # %if.then325
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	movl	$0, 28(%rax)
.LBB67_39:                              # %if.end328
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rax
	decl	24(%rax)
	movq	8(%rsp), %rcx
	movl	$1, %eax
	cmpl	$1, 24(%rcx)
	je	.LBB67_41
# BB#40:                                # %select.mid19
                                        #   in Loop: Header=BB67_1 Depth=1
	xorl	%eax, %eax
.LBB67_41:                              # %select.end18
                                        #   in Loop: Header=BB67_1 Depth=1
	movq	8(%rsp), %rcx
	xorl	%eax, 64(%rcx)
	movq	8(%rsp), %rax
	incl	1092(%rax)
	jmp	.LBB67_1
	.align	16, 0x90
.LBB67_46:                              # %if.then382
                                        #   in Loop: Header=BB67_42 Depth=1
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	incl	40(%rax)
.LBB67_42:                              # %while.body341
                                        # =>This Inner Loop Header: Depth=1
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 32(%rax)
	je	.LBB67_43
# BB#44:                                # %if.end347
                                        #   in Loop: Header=BB67_42 Depth=1
	movq	8(%rsp), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB67_45
# BB#47:                                # %while.end387
                                        #   in Loop: Header=BB67_42 Depth=1
	movq	8(%rsp), %rcx
	movl	1092(%rcx), %eax
	movl	64080(%rcx), %ecx
	incl	%ecx
	cmpl	%ecx, %eax
	je	.LBB67_48
# BB#49:                                # %if.end394
                                        #   in Loop: Header=BB67_42 Depth=1
	movq	8(%rsp), %rcx
	movl	1092(%rcx), %eax
	movl	64080(%rcx), %ecx
	incl	%ecx
	cmpl	%ecx, %eax
	jg	.LBB67_50
# BB#52:                                # %if.end401
                                        #   in Loop: Header=BB67_42 Depth=1
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
	je	.LBB67_42
# BB#53:                                # %if.end438
                                        #   in Loop: Header=BB67_42 Depth=1
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	cmpl	64(%rax), %ecx
	jne	.LBB67_54
# BB#55:                                # %if.end446
                                        #   in Loop: Header=BB67_42 Depth=1
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
	je	.LBB67_42
# BB#56:                                # %if.end480
                                        #   in Loop: Header=BB67_42 Depth=1
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	cmpl	64(%rax), %ecx
	jne	.LBB67_54
# BB#57:                                # %if.end488
                                        #   in Loop: Header=BB67_42 Depth=1
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
	je	.LBB67_42
# BB#58:                                # %if.end522
                                        #   in Loop: Header=BB67_42 Depth=1
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	cmpl	64(%rax), %ecx
	je	.LBB67_59
.LBB67_54:                              # %if.then443
                                        #   in Loop: Header=BB67_42 Depth=1
	movq	8(%rsp), %rax
	movzbl	7(%rsp), %ecx
	movl	%ecx, 64(%rax)
	jmp	.LBB67_42
	.align	16, 0x90
.LBB67_45:                              # %if.end352
                                        #   in Loop: Header=BB67_42 Depth=1
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
	jne	.LBB67_42
	jmp	.LBB67_46
.LBB67_59:                              # %if.end530
                                        #   in Loop: Header=BB67_42 Depth=1
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
	jmp	.LBB67_42
.LBB67_2:                               # %if.then3
	movb	$0, 23(%rsp)
	jmp	.LBB67_51
.LBB67_50:                              # %if.then400
	movb	$1, 23(%rsp)
	jmp	.LBB67_51
.LBB67_43:                              # %if.then346
	movb	$0, 23(%rsp)
	jmp	.LBB67_51
.LBB67_7:                               # %if.then29
	movb	$0, 23(%rsp)
	jmp	.LBB67_51
.LBB67_48:                              # %if.then393
	movb	$0, 23(%rsp)
.LBB67_51:                              # %return
	movzbl	23(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp265:
	.size	unRLE_obuf_to_output_SMALL, .Ltmp265-unRLE_obuf_to_output_SMALL
	.cfi_endproc

	.align	16, 0x90
	.type	unRLE_obuf_to_output_FAST,@function
unRLE_obuf_to_output_FAST:              # @unRLE_obuf_to_output_FAST
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -16(%rsp)
	cmpb	$0, 20(%rdi)
	je	.LBB68_41
# BB#1:
	movl	$255, %eax
	jmp	.LBB68_2
	.align	16, 0x90
.LBB68_5:                               # %if.then23
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	movq	(%rcx), %rcx
	incl	40(%rcx)
.LBB68_2:                               # %while.body2
                                        # =>This Inner Loop Header: Depth=1
	movq	-16(%rsp), %rcx
	movq	(%rcx), %rcx
	cmpl	$0, 32(%rcx)
	je	.LBB68_57
# BB#3:                                 # %if.end
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	cmpl	$0, 16(%rcx)
	jne	.LBB68_4
# BB#6:                                 # %while.end
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rdx
	movl	1092(%rdx), %ecx
	movl	64080(%rdx), %edx
	incl	%edx
	cmpl	%edx, %ecx
	je	.LBB68_57
# BB#7:                                 # %if.end30
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rdx
	movl	1092(%rdx), %ecx
	movl	64080(%rdx), %edx
	incl	%edx
	cmpl	%edx, %ecx
	jg	.LBB68_50
# BB#8:                                 # %if.end37
                                        #   in Loop: Header=BB68_2 Depth=1
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
	jne	.LBB68_11
# BB#9:                                 # %if.then50
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	movslq	28(%rcx), %rdx
	movl	BZ2_rNums(,%rdx,4), %edx
	movl	%edx, 24(%rcx)
	movq	-16(%rsp), %rcx
	incl	28(%rcx)
	movq	-16(%rsp), %rcx
	cmpl	$512, 28(%rcx)          # imm = 0x200
	jne	.LBB68_11
# BB#10:                                # %if.then59
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	movl	$0, 28(%rcx)
.LBB68_11:                              # %if.end62
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	decl	24(%rcx)
	movq	-16(%rsp), %rdx
	movl	$1, %ecx
	cmpl	$1, 24(%rdx)
	je	.LBB68_13
# BB#12:                                # %select.mid
                                        #   in Loop: Header=BB68_2 Depth=1
	xorl	%ecx, %ecx
.LBB68_13:                              # %select.end
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
	je	.LBB68_2
# BB#14:                                # %if.end79
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	movzbl	-17(%rsp), %edx
	cmpl	64(%rcx), %edx
	jne	.LBB68_15
# BB#16:                                # %if.end87
                                        #   in Loop: Header=BB68_2 Depth=1
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
	jne	.LBB68_19
# BB#17:                                # %if.then102
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	movslq	28(%rcx), %rdx
	movl	BZ2_rNums(,%rdx,4), %edx
	movl	%edx, 24(%rcx)
	movq	-16(%rsp), %rcx
	incl	28(%rcx)
	movq	-16(%rsp), %rcx
	cmpl	$512, 28(%rcx)          # imm = 0x200
	jne	.LBB68_19
# BB#18:                                # %if.then112
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	movl	$0, 28(%rcx)
.LBB68_19:                              # %if.end115
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	decl	24(%rcx)
	movq	-16(%rsp), %rdx
	movl	$1, %ecx
	cmpl	$1, 24(%rdx)
	je	.LBB68_21
# BB#20:                                # %select.mid9
                                        #   in Loop: Header=BB68_2 Depth=1
	xorl	%ecx, %ecx
.LBB68_21:                              # %select.end8
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
	je	.LBB68_2
# BB#22:                                # %if.end133
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	movzbl	-17(%rsp), %edx
	cmpl	64(%rcx), %edx
	jne	.LBB68_15
# BB#23:                                # %if.end141
                                        #   in Loop: Header=BB68_2 Depth=1
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
	jne	.LBB68_26
# BB#24:                                # %if.then156
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	movslq	28(%rcx), %rdx
	movl	BZ2_rNums(,%rdx,4), %edx
	movl	%edx, 24(%rcx)
	movq	-16(%rsp), %rcx
	incl	28(%rcx)
	movq	-16(%rsp), %rcx
	cmpl	$512, 28(%rcx)          # imm = 0x200
	jne	.LBB68_26
# BB#25:                                # %if.then166
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	movl	$0, 28(%rcx)
.LBB68_26:                              # %if.end169
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	decl	24(%rcx)
	movq	-16(%rsp), %rdx
	movl	$1, %ecx
	cmpl	$1, 24(%rdx)
	je	.LBB68_28
# BB#27:                                # %select.mid11
                                        #   in Loop: Header=BB68_2 Depth=1
	xorl	%ecx, %ecx
.LBB68_28:                              # %select.end10
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
	je	.LBB68_2
# BB#29:                                # %if.end187
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	movzbl	-17(%rsp), %edx
	cmpl	64(%rcx), %edx
	je	.LBB68_30
.LBB68_15:                              # %if.then84
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	movzbl	-17(%rsp), %edx
	movl	%edx, 64(%rcx)
	jmp	.LBB68_2
	.align	16, 0x90
.LBB68_4:                               # %if.end6
                                        #   in Loop: Header=BB68_2 Depth=1
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
	jne	.LBB68_2
	jmp	.LBB68_5
.LBB68_30:                              # %if.end195
                                        #   in Loop: Header=BB68_2 Depth=1
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
	jne	.LBB68_33
# BB#31:                                # %if.then209
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	movslq	28(%rcx), %rdx
	movl	BZ2_rNums(,%rdx,4), %edx
	movl	%edx, 24(%rcx)
	movq	-16(%rsp), %rcx
	incl	28(%rcx)
	movq	-16(%rsp), %rcx
	cmpl	$512, 28(%rcx)          # imm = 0x200
	jne	.LBB68_33
# BB#32:                                # %if.then219
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	movl	$0, 28(%rcx)
.LBB68_33:                              # %if.end222
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	decl	24(%rcx)
	movq	-16(%rsp), %rdx
	movl	$1, %ecx
	cmpl	$1, 24(%rdx)
	je	.LBB68_35
# BB#34:                                # %select.mid13
                                        #   in Loop: Header=BB68_2 Depth=1
	xorl	%ecx, %ecx
.LBB68_35:                              # %select.end12
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
	jne	.LBB68_38
# BB#36:                                # %if.then252
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	movslq	28(%rcx), %rdx
	movl	BZ2_rNums(,%rdx,4), %edx
	movl	%edx, 24(%rcx)
	movq	-16(%rsp), %rcx
	incl	28(%rcx)
	movq	-16(%rsp), %rcx
	cmpl	$512, 28(%rcx)          # imm = 0x200
	jne	.LBB68_38
# BB#37:                                # %if.then262
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	movl	$0, 28(%rcx)
.LBB68_38:                              # %if.end265
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rcx
	decl	24(%rcx)
	movq	-16(%rsp), %rdx
	movl	$1, %ecx
	cmpl	$1, 24(%rdx)
	je	.LBB68_40
# BB#39:                                # %select.mid15
                                        #   in Loop: Header=BB68_2 Depth=1
	xorl	%ecx, %ecx
.LBB68_40:                              # %select.end14
                                        #   in Loop: Header=BB68_2 Depth=1
	movq	-16(%rsp), %rdx
	xorl	%ecx, 64(%rdx)
	movq	-16(%rsp), %rcx
	incl	1092(%rcx)
	jmp	.LBB68_2
.LBB68_41:                              # %if.else
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
	jmp	.LBB68_42
.LBB68_63:                              # %if.then366
                                        #   in Loop: Header=BB68_42 Depth=1
	movzbl	-17(%rsp), %eax
	movl	%eax, -40(%rsp)
	.align	16, 0x90
.LBB68_42:                              # %while.body289
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB68_43 Depth 2
	cmpl	$0, -32(%rsp)
	jle	.LBB68_49
	jmp	.LBB68_43
	.align	16, 0x90
.LBB68_45:                              # %if.end302
                                        #   in Loop: Header=BB68_43 Depth=2
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
.LBB68_43:                              # %while.body294
                                        #   Parent Loop BB68_42 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, -68(%rsp)
	je	.LBB68_54
# BB#44:                                # %if.end298
                                        #   in Loop: Header=BB68_43 Depth=2
	cmpl	$1, -32(%rsp)
	jne	.LBB68_45
.LBB68_46:                              # %s_state_out_len_eq_one
                                        #   in Loop: Header=BB68_42 Depth=1
	cmpl	$0, -68(%rsp)
	je	.LBB68_47
# BB#48:                                # %if.end317
                                        #   in Loop: Header=BB68_42 Depth=1
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
.LBB68_49:                              # %if.end327
                                        #   in Loop: Header=BB68_42 Depth=1
	movl	-36(%rsp), %eax
	cmpl	-76(%rsp), %eax
	jg	.LBB68_50
# BB#52:                                # %if.end331
                                        #   in Loop: Header=BB68_42 Depth=1
	movl	-36(%rsp), %eax
	cmpl	-76(%rsp), %eax
	je	.LBB68_53
# BB#58:                                # %if.end335
                                        #   in Loop: Header=BB68_42 Depth=1
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
	je	.LBB68_60
# BB#59:                                # %if.then346
                                        #   in Loop: Header=BB68_42 Depth=1
	movzbl	-17(%rsp), %eax
	movl	%eax, -40(%rsp)
	jmp	.LBB68_46
	.align	16, 0x90
.LBB68_60:                              # %if.end348
                                        #   in Loop: Header=BB68_42 Depth=1
	movl	-36(%rsp), %eax
	cmpl	-76(%rsp), %eax
	je	.LBB68_46
# BB#61:                                # %if.end352
                                        #   in Loop: Header=BB68_42 Depth=1
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
	je	.LBB68_42
# BB#62:                                # %if.end362
                                        #   in Loop: Header=BB68_42 Depth=1
	movzbl	-17(%rsp), %eax
	cmpl	-40(%rsp), %eax
	jne	.LBB68_63
# BB#64:                                # %if.end368
                                        #   in Loop: Header=BB68_42 Depth=1
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
	je	.LBB68_42
# BB#65:                                # %if.end378
                                        #   in Loop: Header=BB68_42 Depth=1
	movzbl	-17(%rsp), %eax
	cmpl	-40(%rsp), %eax
	jne	.LBB68_63
# BB#66:                                # %if.end384
                                        #   in Loop: Header=BB68_42 Depth=1
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
	jmp	.LBB68_42
.LBB68_50:                              # %if.then330
	movb	$1, -1(%rsp)
	movzbl	-1(%rsp), %eax
	ret
.LBB68_53:                              # %if.then334
	movl	$0, -32(%rsp)
	jmp	.LBB68_54
.LBB68_47:                              # %if.then316
	movl	$1, -32(%rsp)
.LBB68_54:                              # %return_notr
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
	jae	.LBB68_56
# BB#55:                                # %if.then409
	movq	-16(%rsp), %rax
	movq	(%rax), %rax
	incl	40(%rax)
.LBB68_56:                              # %if.end425
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
.LBB68_57:                              # %if.end425
	movb	$0, -1(%rsp)
	movzbl	-1(%rsp), %eax
	ret
.Ltmp266:
	.size	unRLE_obuf_to_output_FAST, .Ltmp266-unRLE_obuf_to_output_FAST
	.cfi_endproc

	.globl	BZ2_bzDecompressEnd
	.align	16, 0x90
	.type	BZ2_bzDecompressEnd,@function
BZ2_bzDecompressEnd:                    # @BZ2_bzDecompressEnd
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp268:
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	testq	%rdi, %rdi
	je	.LBB69_1
# BB#2:                                 # %if.end
	movq	8(%rsp), %rax
	movq	48(%rax), %rax
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.LBB69_3
# BB#4:                                 # %if.end3
	movq	(%rsp), %rax
	movq	(%rax), %rax
	cmpq	8(%rsp), %rax
	je	.LBB69_6
# BB#5:                                 # %if.then6
	movl	$-2, 20(%rsp)
	jmp	.LBB69_13
.LBB69_1:                               # %if.then
	movl	$-2, 20(%rsp)
	jmp	.LBB69_13
.LBB69_3:                               # %if.then2
	movl	$-2, 20(%rsp)
	jmp	.LBB69_13
.LBB69_6:                               # %if.end7
	movq	(%rsp), %rax
	cmpq	$0, 3152(%rax)
	je	.LBB69_8
# BB#7:                                 # %if.then9
	movq	(%rsp), %rax
	movq	3152(%rax), %rsi
	movq	8(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
.LBB69_8:                               # %if.end11
	movq	(%rsp), %rax
	cmpq	$0, 3160(%rax)
	je	.LBB69_10
# BB#9:                                 # %if.then13
	movq	(%rsp), %rax
	movq	3160(%rax), %rsi
	movq	8(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
.LBB69_10:                              # %if.end17
	movq	(%rsp), %rax
	cmpq	$0, 3168(%rax)
	je	.LBB69_12
# BB#11:                                # %if.then19
	movq	(%rsp), %rax
	movq	3168(%rax), %rsi
	movq	8(%rsp), %rax
	movq	72(%rax), %rdi
	callq	*64(%rax)
.LBB69_12:                              # %if.end23
	movq	8(%rsp), %rax
	movq	48(%rax), %rsi
	movq	72(%rax), %rdi
	callq	*64(%rax)
	movq	8(%rsp), %rax
	movq	$0, 48(%rax)
	movl	$0, 20(%rsp)
.LBB69_13:                              # %return
	movl	20(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp269:
	.size	BZ2_bzDecompressEnd, .Ltmp269-BZ2_bzDecompressEnd
	.cfi_endproc

	.globl	BZ2_bzWriteOpen
	.align	16, 0x90
	.type	BZ2_bzWriteOpen,@function
BZ2_bzWriteOpen:                        # @BZ2_bzWriteOpen
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$56, %rsp
.Ltmp271:
	.cfi_def_cfa_offset 64
	movq	%rdi, 40(%rsp)
	movq	%rsi, 32(%rsp)
	movl	%edx, 28(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%r8d, 20(%rsp)
	movq	$0, 8(%rsp)
	cmpq	$0, 40(%rsp)
	je	.LBB70_2
# BB#1:                                 # %if.then
	movq	40(%rsp), %rax
	movl	$0, (%rax)
.LBB70_2:                               # %if.end
	cmpq	$0, 8(%rsp)
	je	.LBB70_4
# BB#3:                                 # %if.then2
	movq	8(%rsp), %rax
	movl	$0, 5096(%rax)
.LBB70_4:                               # %if.end3
	cmpq	$0, 32(%rsp)
	je	.LBB70_11
# BB#5:                                 # %lor.lhs.false
	cmpl	$0, 28(%rsp)
	jle	.LBB70_11
# BB#6:                                 # %lor.lhs.false6
	cmpl	$9, 28(%rsp)
	jg	.LBB70_11
# BB#7:                                 # %lor.lhs.false8
	cmpl	$0, 20(%rsp)
	js	.LBB70_11
# BB#8:                                 # %lor.lhs.false10
	cmpl	$250, 20(%rsp)
	jg	.LBB70_11
# BB#9:                                 # %lor.lhs.false12
	cmpl	$0, 24(%rsp)
	js	.LBB70_11
# BB#10:                                # %lor.lhs.false14
	cmpl	$5, 24(%rsp)
	jl	.LBB70_16
.LBB70_11:                              # %if.then16
	cmpq	$0, 40(%rsp)
	je	.LBB70_13
# BB#12:                                # %if.then18
	movq	40(%rsp), %rax
	movl	$-2, (%rax)
.LBB70_13:                              # %if.end19
	cmpq	$0, 8(%rsp)
	je	.LBB70_15
# BB#14:                                # %if.then21
	movq	8(%rsp), %rax
	movl	$-2, 5096(%rax)
.LBB70_15:                              # %if.end23
	movq	$0, 48(%rsp)
.LBB70_41:                              # %return
	movq	48(%rsp), %rax
	addq	$56, %rsp
	ret
.LBB70_16:                              # %if.end24
	movq	32(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB70_22
# BB#17:                                # %if.then25
	cmpq	$0, 40(%rsp)
	je	.LBB70_19
# BB#18:                                # %if.then27
	movq	40(%rsp), %rax
	movl	$-6, (%rax)
.LBB70_19:                              # %if.end28
	cmpq	$0, 8(%rsp)
	je	.LBB70_21
# BB#20:                                # %if.then30
	movq	8(%rsp), %rax
	movl	$-6, 5096(%rax)
.LBB70_21:                              # %if.end32
	movq	$0, 48(%rsp)
	jmp	.LBB70_41
.LBB70_22:                              # %if.end33
	movl	$5104, %edi             # imm = 0x13F0
	callq	malloc
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.LBB70_23
# BB#28:                                # %if.end44
	cmpq	$0, 40(%rsp)
	je	.LBB70_30
# BB#29:                                # %if.then46
	movq	40(%rsp), %rax
	movl	$0, (%rax)
.LBB70_30:                              # %if.end47
	cmpq	$0, 8(%rsp)
	je	.LBB70_32
# BB#31:                                # %if.then49
	movq	8(%rsp), %rax
	movl	$0, 5096(%rax)
.LBB70_32:                              # %if.end51
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
	jne	.LBB70_34
# BB#33:                                # %if.then55
	movl	$30, 20(%rsp)
.LBB70_34:                              # %if.end56
	movl	$5016, %edi             # imm = 0x1398
	addq	8(%rsp), %rdi
	movl	20(%rsp), %ecx
	movl	24(%rsp), %edx
	movl	28(%rsp), %esi
	callq	BZ2_bzCompressInit
	movl	%eax, 16(%rsp)
	testl	%eax, %eax
	je	.LBB70_40
# BB#35:                                # %if.then60
	cmpq	$0, 40(%rsp)
	je	.LBB70_37
# BB#36:                                # %if.then62
	movq	40(%rsp), %rax
	movl	16(%rsp), %ecx
	movl	%ecx, (%rax)
.LBB70_37:                              # %if.end63
	cmpq	$0, 8(%rsp)
	je	.LBB70_39
# BB#38:                                # %if.then65
	movq	8(%rsp), %rax
	movl	16(%rsp), %ecx
	movl	%ecx, 5096(%rax)
.LBB70_39:                              # %if.end67
	movq	8(%rsp), %rdi
	callq	free
	movq	$0, 48(%rsp)
	jmp	.LBB70_41
.LBB70_23:                              # %if.then36
	cmpq	$0, 40(%rsp)
	je	.LBB70_25
# BB#24:                                # %if.then38
	movq	40(%rsp), %rax
	movl	$-3, (%rax)
.LBB70_25:                              # %if.end39
	cmpq	$0, 8(%rsp)
	je	.LBB70_27
# BB#26:                                # %if.then41
	movq	8(%rsp), %rax
	movl	$-3, 5096(%rax)
.LBB70_27:                              # %if.end43
	movq	$0, 48(%rsp)
	jmp	.LBB70_41
.LBB70_40:                              # %if.end68
	movq	8(%rsp), %rax
	movl	$0, 5024(%rax)
	movq	8(%rsp), %rax
	movb	$1, 5100(%rax)
	movq	8(%rsp), %rax
	movq	%rax, 48(%rsp)
	jmp	.LBB70_41
.Ltmp272:
	.size	BZ2_bzWriteOpen, .Ltmp272-BZ2_bzWriteOpen
	.cfi_endproc

	.globl	BZ2_bzWrite
	.align	16, 0x90
	.type	BZ2_bzWrite,@function
BZ2_bzWrite:                            # @BZ2_bzWrite
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp275:
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
.Ltmp276:
	.cfi_def_cfa_offset 64
.Ltmp277:
	.cfi_offset %rbx, -16
	movq	%rdi, 40(%rsp)
	movq	%rsi, 32(%rsp)
	movq	%rdx, 24(%rsp)
	movl	%ecx, 20(%rsp)
	movq	32(%rsp), %rax
	movq	%rax, (%rsp)
	cmpq	$0, 40(%rsp)
	je	.LBB71_2
# BB#1:                                 # %if.then
	movq	40(%rsp), %rax
	movl	$0, (%rax)
.LBB71_2:                               # %if.end
	cmpq	$0, (%rsp)
	je	.LBB71_4
# BB#3:                                 # %if.then2
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
.LBB71_4:                               # %if.end3
	cmpq	$0, (%rsp)
	je	.LBB71_7
# BB#5:                                 # %lor.lhs.false
	cmpq	$0, 24(%rsp)
	je	.LBB71_7
# BB#6:                                 # %lor.lhs.false6
	cmpl	$0, 20(%rsp)
	js	.LBB71_7
# BB#11:                                # %if.end16
	movq	(%rsp), %rax
	cmpb	$0, 5012(%rax)
	je	.LBB71_12
# BB#16:                                # %if.end25
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB71_17
# BB#21:                                # %if.end35
	cmpl	$0, 20(%rsp)
	je	.LBB71_32
# BB#22:                                # %if.end45
	movq	(%rsp), %rax
	movl	20(%rsp), %ecx
	movl	%ecx, 5024(%rax)
	movq	(%rsp), %rax
	movq	24(%rsp), %rcx
	movq	%rcx, 5016(%rax)
	movl	$5000, %ebx             # imm = 0x1388
	.align	16, 0x90
.LBB71_23:                              # %while.body
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
	jne	.LBB71_24
# BB#28:                                # %if.end61
                                        #   in Loop: Header=BB71_23 Depth=1
	movq	(%rsp), %rax
	cmpl	$4999, 5048(%rax)       # imm = 0x1387
	ja	.LBB71_31
# BB#29:                                # %if.then65
                                        #   in Loop: Header=BB71_23 Depth=1
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
	jne	.LBB71_17
# BB#30:                                # %lor.lhs.false75
                                        #   in Loop: Header=BB71_23 Depth=1
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB71_17
.LBB71_31:                              # %if.end90
                                        #   in Loop: Header=BB71_23 Depth=1
	movq	(%rsp), %rax
	cmpl	$0, 5024(%rax)
	jne	.LBB71_23
.LBB71_32:                              # %if.then95
	cmpq	$0, 40(%rsp)
	je	.LBB71_34
# BB#33:                                # %if.then98
	movq	40(%rsp), %rax
	movl	$0, (%rax)
.LBB71_34:                              # %if.end99
	cmpq	$0, (%rsp)
	je	.LBB71_36
# BB#35:                                # %if.then102
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
	jmp	.LBB71_36
.LBB71_7:                               # %if.then8
	cmpq	$0, 40(%rsp)
	je	.LBB71_9
# BB#8:                                 # %if.then10
	movq	40(%rsp), %rax
	movl	$-2, (%rax)
.LBB71_9:                               # %if.end11
	cmpq	$0, (%rsp)
	je	.LBB71_36
# BB#10:                                # %if.then13
	movq	(%rsp), %rax
	movl	$-2, 5096(%rax)
.LBB71_36:                              # %return
	addq	$48, %rsp
	popq	%rbx
	ret
.LBB71_17:                              # %if.then27
	cmpq	$0, 40(%rsp)
	je	.LBB71_19
# BB#18:                                # %if.then29
	movq	40(%rsp), %rax
	movl	$-6, (%rax)
.LBB71_19:                              # %if.end30
	cmpq	$0, (%rsp)
	je	.LBB71_36
# BB#20:                                # %if.then32
	movq	(%rsp), %rax
	movl	$-6, 5096(%rax)
	jmp	.LBB71_36
.LBB71_12:                              # %if.then17
	cmpq	$0, 40(%rsp)
	je	.LBB71_14
# BB#13:                                # %if.then19
	movq	40(%rsp), %rax
	movl	$-1, (%rax)
.LBB71_14:                              # %if.end20
	cmpq	$0, (%rsp)
	je	.LBB71_36
# BB#15:                                # %if.then22
	movq	(%rsp), %rax
	movl	$-1, 5096(%rax)
	jmp	.LBB71_36
.LBB71_24:                              # %if.then53
	cmpq	$0, 40(%rsp)
	je	.LBB71_26
# BB#25:                                # %if.then55
	movq	40(%rsp), %rax
	movl	8(%rsp), %ecx
	movl	%ecx, (%rax)
.LBB71_26:                              # %if.end56
	cmpq	$0, (%rsp)
	je	.LBB71_36
# BB#27:                                # %if.then58
	movq	(%rsp), %rax
	movl	8(%rsp), %ecx
	movl	%ecx, 5096(%rax)
	jmp	.LBB71_36
.Ltmp278:
	.size	BZ2_bzWrite, .Ltmp278-BZ2_bzWrite
	.cfi_endproc

	.globl	BZ2_bzWriteClose
	.align	16, 0x90
	.type	BZ2_bzWriteClose,@function
BZ2_bzWriteClose:                       # @BZ2_bzWriteClose
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$56, %rsp
.Ltmp280:
	.cfi_def_cfa_offset 64
	movq	%r8, %rax
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
.Ltmp281:
	.size	BZ2_bzWriteClose, .Ltmp281-BZ2_bzWriteClose
	.cfi_endproc

	.globl	BZ2_bzWriteClose64
	.align	16, 0x90
	.type	BZ2_bzWriteClose64,@function
BZ2_bzWriteClose64:                     # @BZ2_bzWriteClose64
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp284:
	.cfi_def_cfa_offset 16
	subq	$80, %rsp
.Ltmp285:
	.cfi_def_cfa_offset 96
.Ltmp286:
	.cfi_offset %rbx, -16
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
# BB#5:                                 # %if.end6
	movq	(%rsp), %rax
	cmpb	$0, 5012(%rax)
	je	.LBB73_6
# BB#10:                                # %if.end15
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB73_11
# BB#15:                                # %if.end25
	cmpq	$0, 48(%rsp)
	je	.LBB73_17
# BB#16:                                # %if.then27
	movq	48(%rsp), %rax
	movl	$0, (%rax)
.LBB73_17:                              # %if.end28
	cmpq	$0, 40(%rsp)
	je	.LBB73_19
# BB#18:                                # %if.then30
	movq	40(%rsp), %rax
	movl	$0, (%rax)
.LBB73_19:                              # %if.end31
	cmpq	$0, 32(%rsp)
	je	.LBB73_21
# BB#20:                                # %if.then33
	movq	32(%rsp), %rax
	movl	$0, (%rax)
.LBB73_21:                              # %if.end34
	cmpq	$0, 24(%rsp)
	je	.LBB73_23
# BB#22:                                # %if.then36
	movq	24(%rsp), %rax
	movl	$0, (%rax)
.LBB73_23:                              # %if.end37
	cmpl	$0, 60(%rsp)
	jne	.LBB73_36
# BB#24:                                # %land.lhs.true
	movq	(%rsp), %rax
	cmpl	$0, 5096(%rax)
	jne	.LBB73_36
# BB#25:
	movl	$5000, %ebx             # imm = 0x1388
	.align	16, 0x90
.LBB73_26:                              # %while.body
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
	je	.LBB73_32
# BB#27:                                # %land.lhs.true46
                                        #   in Loop: Header=BB73_26 Depth=1
	cmpl	$4, 12(%rsp)
	jne	.LBB73_28
.LBB73_32:                              # %if.end56
                                        #   in Loop: Header=BB73_26 Depth=1
	movq	(%rsp), %rax
	cmpl	$4999, 5048(%rax)       # imm = 0x1387
	ja	.LBB73_35
# BB#33:                                # %if.then60
                                        #   in Loop: Header=BB73_26 Depth=1
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
	jne	.LBB73_11
# BB#34:                                # %lor.lhs.false
                                        #   in Loop: Header=BB73_26 Depth=1
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB73_11
.LBB73_35:                              # %if.end84
                                        #   in Loop: Header=BB73_26 Depth=1
	cmpl	$4, 12(%rsp)
	jne	.LBB73_26
.LBB73_36:                              # %if.end89
	cmpl	$0, 60(%rsp)
	jne	.LBB73_39
# BB#37:                                # %land.lhs.true91
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB73_39
# BB#38:                                # %if.then95
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	fflush
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB73_39
.LBB73_11:                              # %if.then17
	cmpq	$0, 72(%rsp)
	je	.LBB73_13
# BB#12:                                # %if.then19
	movq	72(%rsp), %rax
	movl	$-6, (%rax)
.LBB73_13:                              # %if.end20
	cmpq	$0, (%rsp)
	je	.LBB73_52
# BB#14:                                # %if.then22
	movq	(%rsp), %rax
	movl	$-6, 5096(%rax)
	jmp	.LBB73_52
.LBB73_1:                               # %if.then
	cmpq	$0, 72(%rsp)
	je	.LBB73_3
# BB#2:                                 # %if.then2
	movq	72(%rsp), %rax
	movl	$0, (%rax)
.LBB73_3:                               # %if.end
	cmpq	$0, (%rsp)
	je	.LBB73_52
# BB#4:                                 # %if.then4
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
	jmp	.LBB73_52
.LBB73_6:                               # %if.then7
	cmpq	$0, 72(%rsp)
	je	.LBB73_8
# BB#7:                                 # %if.then9
	movq	72(%rsp), %rax
	movl	$-1, (%rax)
.LBB73_8:                               # %if.end10
	cmpq	$0, (%rsp)
	je	.LBB73_52
# BB#9:                                 # %if.then12
	movq	(%rsp), %rax
	movl	$-1, 5096(%rax)
	jmp	.LBB73_52
.LBB73_39:                              # %if.end112
	cmpq	$0, 48(%rsp)
	je	.LBB73_41
# BB#40:                                # %if.then115
	movq	(%rsp), %rax
	movl	5028(%rax), %eax
	movq	48(%rsp), %rcx
	movl	%eax, (%rcx)
.LBB73_41:                              # %if.end117
	cmpq	$0, 40(%rsp)
	je	.LBB73_43
# BB#42:                                # %if.then120
	movq	(%rsp), %rax
	movl	5032(%rax), %eax
	movq	40(%rsp), %rcx
	movl	%eax, (%rcx)
.LBB73_43:                              # %if.end122
	cmpq	$0, 32(%rsp)
	je	.LBB73_45
# BB#44:                                # %if.then125
	movq	(%rsp), %rax
	movl	5052(%rax), %eax
	movq	32(%rsp), %rcx
	movl	%eax, (%rcx)
.LBB73_45:                              # %if.end127
	cmpq	$0, 24(%rsp)
	je	.LBB73_47
# BB#46:                                # %if.then130
	movq	(%rsp), %rax
	movl	5056(%rax), %eax
	movq	24(%rsp), %rcx
	movl	%eax, (%rcx)
.LBB73_47:                              # %if.end132
	cmpq	$0, 72(%rsp)
	je	.LBB73_49
# BB#48:                                # %if.then135
	movq	72(%rsp), %rax
	movl	$0, (%rax)
.LBB73_49:                              # %if.end136
	cmpq	$0, (%rsp)
	je	.LBB73_51
# BB#50:                                # %if.then139
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
.LBB73_51:                              # %if.end141
	movq	(%rsp), %rdi
	addq	$5016, %rdi             # imm = 0x1398
	callq	BZ2_bzCompressEnd
	movq	(%rsp), %rdi
	callq	free
.LBB73_52:                              # %return
	addq	$80, %rsp
	popq	%rbx
	ret
.LBB73_28:                              # %if.then48
	cmpq	$0, 72(%rsp)
	je	.LBB73_30
# BB#29:                                # %if.then50
	movq	72(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%ecx, (%rax)
.LBB73_30:                              # %if.end51
	cmpq	$0, (%rsp)
	je	.LBB73_52
# BB#31:                                # %if.then53
	movq	(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%ecx, 5096(%rax)
	jmp	.LBB73_52
.Ltmp287:
	.size	BZ2_bzWriteClose64, .Ltmp287-BZ2_bzWriteClose64
	.cfi_endproc

	.globl	BZ2_bzReadOpen
	.align	16, 0x90
	.type	BZ2_bzReadOpen,@function
BZ2_bzReadOpen:                         # @BZ2_bzReadOpen
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$72, %rsp
.Ltmp289:
	.cfi_def_cfa_offset 80
	movq	%rdi, 56(%rsp)
	movq	%rsi, 48(%rsp)
	movl	%edx, 44(%rsp)
	movl	%ecx, 40(%rsp)
	movq	%r8, 32(%rsp)
	movl	%r9d, 28(%rsp)
	movq	$0, 16(%rsp)
	cmpq	$0, 56(%rsp)
	je	.LBB74_2
# BB#1:                                 # %if.then
	movq	56(%rsp), %rax
	movl	$0, (%rax)
.LBB74_2:                               # %if.end
	cmpq	$0, 16(%rsp)
	je	.LBB74_4
# BB#3:                                 # %if.then2
	movq	16(%rsp), %rax
	movl	$0, 5096(%rax)
.LBB74_4:                               # %if.end3
	cmpq	$0, 48(%rsp)
	je	.LBB74_14
# BB#5:                                 # %lor.lhs.false
	cmpl	$0, 40(%rsp)
	je	.LBB74_7
# BB#6:                                 # %land.lhs.true
	cmpl	$1, 40(%rsp)
	jne	.LBB74_14
.LBB74_7:                               # %lor.lhs.false7
	cmpl	$0, 44(%rsp)
	js	.LBB74_14
# BB#8:                                 # %lor.lhs.false9
	cmpl	$4, 44(%rsp)
	jg	.LBB74_14
# BB#9:                                 # %lor.lhs.false11
	cmpq	$0, 32(%rsp)
	jne	.LBB74_11
# BB#10:                                # %land.lhs.true13
	cmpl	$0, 28(%rsp)
	jne	.LBB74_14
.LBB74_11:                              # %lor.lhs.false15
	cmpq	$0, 32(%rsp)
	je	.LBB74_19
# BB#12:                                # %land.lhs.true17
	cmpl	$0, 28(%rsp)
	js	.LBB74_14
# BB#13:                                # %lor.lhs.false19
	cmpl	$5001, 28(%rsp)         # imm = 0x1389
	jl	.LBB74_19
.LBB74_14:                              # %if.then21
	cmpq	$0, 56(%rsp)
	je	.LBB74_16
# BB#15:                                # %if.then23
	movq	56(%rsp), %rax
	movl	$-2, (%rax)
.LBB74_16:                              # %if.end24
	cmpq	$0, 16(%rsp)
	je	.LBB74_18
# BB#17:                                # %if.then26
	movq	16(%rsp), %rax
	movl	$-2, 5096(%rax)
.LBB74_18:                              # %if.end28
	movq	$0, 64(%rsp)
.LBB74_45:                              # %return
	movq	64(%rsp), %rax
	addq	$72, %rsp
	ret
.LBB74_19:                              # %if.end29
	movq	48(%rsp), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB74_25
# BB#20:                                # %if.then30
	cmpq	$0, 56(%rsp)
	je	.LBB74_22
# BB#21:                                # %if.then32
	movq	56(%rsp), %rax
	movl	$-6, (%rax)
.LBB74_22:                              # %if.end33
	cmpq	$0, 16(%rsp)
	je	.LBB74_24
# BB#23:                                # %if.then35
	movq	16(%rsp), %rax
	movl	$-6, 5096(%rax)
.LBB74_24:                              # %if.end37
	movq	$0, 64(%rsp)
	jmp	.LBB74_45
.LBB74_25:                              # %if.end38
	movl	$5104, %edi             # imm = 0x13F0
	callq	malloc
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	je	.LBB74_26
# BB#31:                                # %if.end49
	cmpq	$0, 56(%rsp)
	je	.LBB74_33
# BB#32:                                # %if.then51
	movq	56(%rsp), %rax
	movl	$0, (%rax)
.LBB74_33:                              # %if.end52
	cmpq	$0, 16(%rsp)
	je	.LBB74_35
# BB#34:                                # %if.then54
	movq	16(%rsp), %rax
	movl	$0, 5096(%rax)
.LBB74_35:                              # %if.end56
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
	jmp	.LBB74_36
	.align	16, 0x90
.LBB74_37:                              # %while.body
                                        #   in Loop: Header=BB74_36 Depth=1
	movq	16(%rsp), %rax
	movslq	5008(%rax), %rcx
	movq	32(%rsp), %rdx
	movb	(%rdx), %dl
	movb	%dl, 8(%rax,%rcx)
	movq	16(%rsp), %rax
	incl	5008(%rax)
	incq	32(%rsp)
	decl	28(%rsp)
.LBB74_36:                              # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 28(%rsp)
	jg	.LBB74_37
# BB#38:                                # %while.end
	movl	$5016, %edi             # imm = 0x1398
	addq	16(%rsp), %rdi
	movl	40(%rsp), %edx
	movl	44(%rsp), %esi
	callq	BZ2_bzDecompressInit
	movl	%eax, 12(%rsp)
	testl	%eax, %eax
	je	.LBB74_44
# BB#39:                                # %if.then65
	cmpq	$0, 56(%rsp)
	je	.LBB74_41
# BB#40:                                # %if.then67
	movq	56(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%ecx, (%rax)
.LBB74_41:                              # %if.end68
	cmpq	$0, 16(%rsp)
	je	.LBB74_43
# BB#42:                                # %if.then70
	movq	16(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%ecx, 5096(%rax)
.LBB74_43:                              # %if.end72
	movq	16(%rsp), %rdi
	callq	free
	movq	$0, 64(%rsp)
	jmp	.LBB74_45
.LBB74_26:                              # %if.then41
	cmpq	$0, 56(%rsp)
	je	.LBB74_28
# BB#27:                                # %if.then43
	movq	56(%rsp), %rax
	movl	$-3, (%rax)
.LBB74_28:                              # %if.end44
	cmpq	$0, 16(%rsp)
	je	.LBB74_30
# BB#29:                                # %if.then46
	movq	16(%rsp), %rax
	movl	$-3, 5096(%rax)
.LBB74_30:                              # %if.end48
	movq	$0, 64(%rsp)
	jmp	.LBB74_45
.LBB74_44:                              # %if.end73
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
	jmp	.LBB74_45
.Ltmp290:
	.size	BZ2_bzReadOpen, .Ltmp290-BZ2_bzReadOpen
	.cfi_endproc

	.globl	BZ2_bzReadClose
	.align	16, 0x90
	.type	BZ2_bzReadClose,@function
BZ2_bzReadClose:                        # @BZ2_bzReadClose
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp292:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rsi, (%rsp)
	cmpq	$0, 16(%rsp)
	je	.LBB75_2
# BB#1:                                 # %if.then
	movq	16(%rsp), %rax
	movl	$0, (%rax)
.LBB75_2:                               # %if.end
	cmpq	$0, (%rsp)
	je	.LBB75_4
# BB#3:                                 # %if.then2
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
.LBB75_4:                               # %if.end3
	cmpq	$0, (%rsp)
	je	.LBB75_5
# BB#9:                                 # %if.end13
	movq	(%rsp), %rax
	cmpb	$0, 5012(%rax)
	je	.LBB75_14
# BB#10:                                # %if.then14
	cmpq	$0, 16(%rsp)
	je	.LBB75_12
# BB#11:                                # %if.then16
	movq	16(%rsp), %rax
	movl	$-1, (%rax)
.LBB75_12:                              # %if.end17
	cmpq	$0, (%rsp)
	je	.LBB75_17
# BB#13:                                # %if.then19
	movq	(%rsp), %rax
	movl	$-1, 5096(%rax)
	addq	$24, %rsp
	ret
.LBB75_5:                               # %if.then5
	cmpq	$0, 16(%rsp)
	je	.LBB75_7
# BB#6:                                 # %if.then7
	movq	16(%rsp), %rax
	movl	$0, (%rax)
.LBB75_7:                               # %if.end8
	cmpq	$0, (%rsp)
	je	.LBB75_17
# BB#8:                                 # %if.then10
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
	addq	$24, %rsp
	ret
.LBB75_14:                              # %if.end22
	movq	(%rsp), %rax
	cmpb	$0, 5100(%rax)
	je	.LBB75_16
# BB#15:                                # %if.then24
	movq	(%rsp), %rdi
	addq	$5016, %rdi             # imm = 0x1398
	callq	BZ2_bzDecompressEnd
.LBB75_16:                              # %if.end25
	movq	(%rsp), %rdi
	callq	free
.LBB75_17:                              # %return
	addq	$24, %rsp
	ret
.Ltmp293:
	.size	BZ2_bzReadClose, .Ltmp293-BZ2_bzReadClose
	.cfi_endproc

	.globl	BZ2_bzRead
	.align	16, 0x90
	.type	BZ2_bzRead,@function
BZ2_bzRead:                             # @BZ2_bzRead
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$56, %rsp
.Ltmp295:
	.cfi_def_cfa_offset 64
	movq	%rdi, 40(%rsp)
	movq	%rsi, 32(%rsp)
	movq	%rdx, 24(%rsp)
	movl	%ecx, 20(%rsp)
	movq	32(%rsp), %rax
	movq	%rax, (%rsp)
	cmpq	$0, 40(%rsp)
	je	.LBB76_2
# BB#1:                                 # %if.then
	movq	40(%rsp), %rax
	movl	$0, (%rax)
.LBB76_2:                               # %if.end
	cmpq	$0, (%rsp)
	je	.LBB76_4
# BB#3:                                 # %if.then2
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
.LBB76_4:                               # %if.end3
	cmpq	$0, (%rsp)
	je	.LBB76_7
# BB#5:                                 # %lor.lhs.false
	cmpq	$0, 24(%rsp)
	je	.LBB76_7
# BB#6:                                 # %lor.lhs.false6
	cmpl	$0, 20(%rsp)
	js	.LBB76_7
# BB#12:                                # %if.end16
	movq	(%rsp), %rax
	cmpb	$0, 5012(%rax)
	je	.LBB76_18
# BB#13:                                # %if.then17
	cmpq	$0, 40(%rsp)
	je	.LBB76_15
# BB#14:                                # %if.then19
	movq	40(%rsp), %rax
	movl	$-1, (%rax)
.LBB76_15:                              # %if.end20
	cmpq	$0, (%rsp)
	je	.LBB76_17
# BB#16:                                # %if.then22
	movq	(%rsp), %rax
	movl	$-1, 5096(%rax)
.LBB76_17:                              # %if.end24
	movl	$0, 52(%rsp)
	jmp	.LBB76_68
.LBB76_7:                               # %if.then8
	cmpq	$0, 40(%rsp)
	je	.LBB76_9
# BB#8:                                 # %if.then10
	movq	40(%rsp), %rax
	movl	$-2, (%rax)
.LBB76_9:                               # %if.end11
	cmpq	$0, (%rsp)
	je	.LBB76_11
# BB#10:                                # %if.then13
	movq	(%rsp), %rax
	movl	$-2, 5096(%rax)
.LBB76_11:                              # %if.end15
	movl	$0, 52(%rsp)
.LBB76_68:                              # %return
	movl	52(%rsp), %eax
	addq	$56, %rsp
	ret
.LBB76_18:                              # %if.end25
	cmpl	$0, 20(%rsp)
	je	.LBB76_19
# BB#24:                                # %if.end35
	movq	(%rsp), %rax
	movl	20(%rsp), %ecx
	movl	%ecx, 5048(%rax)
	movq	(%rsp), %rax
	movq	24(%rsp), %rcx
	movq	%rcx, 5040(%rax)
	.align	16, 0x90
.LBB76_25:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	jne	.LBB76_26
# BB#31:                                # %if.end46
                                        #   in Loop: Header=BB76_25 Depth=1
	movq	(%rsp), %rax
	cmpl	$0, 5024(%rax)
	jne	.LBB76_40
# BB#32:                                # %land.lhs.true
                                        #   in Loop: Header=BB76_25 Depth=1
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	myfeof145
	testb	%al, %al
	jne	.LBB76_40
# BB#33:                                # %if.then52
                                        #   in Loop: Header=BB76_25 Depth=1
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
	jne	.LBB76_34
# BB#39:                                # %if.end69
                                        #   in Loop: Header=BB76_25 Depth=1
	movq	(%rsp), %rax
	movl	16(%rsp), %ecx
	movl	%ecx, 5008(%rax)
	movq	(%rsp), %rax
	movl	5008(%rax), %ecx
	movl	%ecx, 5024(%rax)
	movq	(%rsp), %rax
	leaq	8(%rax), %rcx
	movq	%rcx, 5016(%rax)
.LBB76_40:                              # %if.end76
                                        #   in Loop: Header=BB76_25 Depth=1
	movq	(%rsp), %rdi
	addq	$5016, %rdi             # imm = 0x1398
	callq	BZ2_bzDecompress
	movl	%eax, 12(%rsp)
	testl	%eax, %eax
	je	.LBB76_47
# BB#41:                                # %land.lhs.true81
                                        #   in Loop: Header=BB76_25 Depth=1
	cmpl	$4, 12(%rsp)
	jne	.LBB76_42
.LBB76_47:                              # %if.end94
                                        #   in Loop: Header=BB76_25 Depth=1
	cmpl	$0, 12(%rsp)
	jne	.LBB76_56
# BB#48:                                # %land.lhs.true97
                                        #   in Loop: Header=BB76_25 Depth=1
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	myfeof145
	testb	%al, %al
	je	.LBB76_56
# BB#49:                                # %land.lhs.true102
                                        #   in Loop: Header=BB76_25 Depth=1
	movq	(%rsp), %rax
	cmpl	$0, 5024(%rax)
	jne	.LBB76_56
# BB#50:                                # %land.lhs.true107
                                        #   in Loop: Header=BB76_25 Depth=1
	movq	(%rsp), %rax
	cmpl	$0, 5048(%rax)
	jne	.LBB76_51
	.align	16, 0x90
.LBB76_56:                              # %if.end122
                                        #   in Loop: Header=BB76_25 Depth=1
	cmpl	$4, 12(%rsp)
	je	.LBB76_57
# BB#62:                                # %if.end137
                                        #   in Loop: Header=BB76_25 Depth=1
	movq	(%rsp), %rax
	cmpl	$0, 5048(%rax)
	jne	.LBB76_25
# BB#63:                                # %if.then142
	cmpq	$0, 40(%rsp)
	je	.LBB76_65
# BB#64:                                # %if.then145
	movq	40(%rsp), %rax
	movl	$0, (%rax)
.LBB76_65:                              # %if.end146
	cmpq	$0, (%rsp)
	je	.LBB76_67
# BB#66:                                # %if.then149
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
.LBB76_67:                              # %if.end151
	movl	20(%rsp), %eax
	movl	%eax, 52(%rsp)
	jmp	.LBB76_68
.LBB76_19:                              # %if.then27
	cmpq	$0, 40(%rsp)
	je	.LBB76_21
# BB#20:                                # %if.then29
	movq	40(%rsp), %rax
	movl	$0, (%rax)
.LBB76_21:                              # %if.end30
	cmpq	$0, (%rsp)
	je	.LBB76_23
# BB#22:                                # %if.then32
	movq	(%rsp), %rax
	movl	$0, 5096(%rax)
.LBB76_23:                              # %if.end34
	movl	$0, 52(%rsp)
	jmp	.LBB76_68
.LBB76_26:                              # %if.then38
	cmpq	$0, 40(%rsp)
	je	.LBB76_28
# BB#27:                                # %if.then40
	movq	40(%rsp), %rax
	movl	$-6, (%rax)
.LBB76_28:                              # %if.end41
	cmpq	$0, (%rsp)
	je	.LBB76_30
# BB#29:                                # %if.then43
	movq	(%rsp), %rax
	movl	$-6, 5096(%rax)
.LBB76_30:                              # %if.end45
	movl	$0, 52(%rsp)
	jmp	.LBB76_68
.LBB76_57:                              # %if.then125
	cmpq	$0, 40(%rsp)
	je	.LBB76_59
# BB#58:                                # %if.then128
	movq	40(%rsp), %rax
	movl	$4, (%rax)
.LBB76_59:                              # %if.end129
	cmpq	$0, (%rsp)
	je	.LBB76_61
# BB#60:                                # %if.then132
	movq	(%rsp), %rax
	movl	$4, 5096(%rax)
.LBB76_61:                              # %if.end134
	movq	(%rsp), %rax
	movl	20(%rsp), %ecx
	subl	5048(%rax), %ecx
	movl	%ecx, 52(%rsp)
	jmp	.LBB76_68
.LBB76_42:                              # %if.then84
	cmpq	$0, 40(%rsp)
	je	.LBB76_44
# BB#43:                                # %if.then87
	movq	40(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%ecx, (%rax)
.LBB76_44:                              # %if.end88
	cmpq	$0, (%rsp)
	je	.LBB76_46
# BB#45:                                # %if.then91
	movq	(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%ecx, 5096(%rax)
.LBB76_46:                              # %if.end93
	movl	$0, 52(%rsp)
	jmp	.LBB76_68
.LBB76_34:                              # %if.then59
	cmpq	$0, 40(%rsp)
	je	.LBB76_36
# BB#35:                                # %if.then62
	movq	40(%rsp), %rax
	movl	$-6, (%rax)
.LBB76_36:                              # %if.end63
	cmpq	$0, (%rsp)
	je	.LBB76_38
# BB#37:                                # %if.then66
	movq	(%rsp), %rax
	movl	$-6, 5096(%rax)
.LBB76_38:                              # %if.end68
	movl	$0, 52(%rsp)
	jmp	.LBB76_68
.LBB76_51:                              # %if.then112
	cmpq	$0, 40(%rsp)
	je	.LBB76_53
# BB#52:                                # %if.then115
	movq	40(%rsp), %rax
	movl	$-7, (%rax)
.LBB76_53:                              # %if.end116
	cmpq	$0, (%rsp)
	je	.LBB76_55
# BB#54:                                # %if.then119
	movq	(%rsp), %rax
	movl	$-7, 5096(%rax)
.LBB76_55:                              # %if.end121
	movl	$0, 52(%rsp)
	jmp	.LBB76_68
.Ltmp296:
	.size	BZ2_bzRead, .Ltmp296-BZ2_bzRead
	.cfi_endproc

	.align	16, 0x90
	.type	myfeof145,@function
myfeof145:                              # @myfeof145
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp298:
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	callq	fgetc
	movl	%eax, 4(%rsp)
	cmpl	$-1, %eax
	jne	.LBB77_2
# BB#1:                                 # %if.then
	movb	$1, 23(%rsp)
	jmp	.LBB77_3
.LBB77_2:                               # %if.end
	movq	8(%rsp), %rsi
	movl	4(%rsp), %edi
	callq	ungetc
	movb	$0, 23(%rsp)
.LBB77_3:                               # %return
	movzbl	23(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp299:
	.size	myfeof145, .Ltmp299-myfeof145
	.cfi_endproc

	.globl	BZ2_bzReadGetUnused
	.align	16, 0x90
	.type	BZ2_bzReadGetUnused,@function
BZ2_bzReadGetUnused:                    # @BZ2_bzReadGetUnused
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movq	%rdx, -24(%rsp)
	movq	%rcx, -32(%rsp)
	movq	-16(%rsp), %rax
	movq	%rax, -40(%rsp)
	testq	%rax, %rax
	je	.LBB78_1
# BB#5:                                 # %if.end6
	movq	-40(%rsp), %rax
	cmpl	$4, 5096(%rax)
	je	.LBB78_10
# BB#6:                                 # %if.then9
	cmpq	$0, -8(%rsp)
	je	.LBB78_8
# BB#7:                                 # %if.then11
	movq	-8(%rsp), %rax
	movl	$-1, (%rax)
.LBB78_8:                               # %if.end12
	cmpq	$0, -40(%rsp)
	je	.LBB78_17
# BB#9:                                 # %if.then14
	movq	-40(%rsp), %rax
	movl	$-1, 5096(%rax)
	ret
.LBB78_10:                              # %if.end17
	cmpq	$0, -24(%rsp)
	je	.LBB78_1
# BB#11:                                # %lor.lhs.false
	cmpq	$0, -32(%rsp)
	je	.LBB78_1
# BB#12:                                # %if.end28
	cmpq	$0, -8(%rsp)
	je	.LBB78_14
# BB#13:                                # %if.then30
	movq	-8(%rsp), %rax
	movl	$0, (%rax)
.LBB78_14:                              # %if.end31
	cmpq	$0, -40(%rsp)
	je	.LBB78_16
# BB#15:                                # %if.then33
	movq	-40(%rsp), %rax
	movl	$0, 5096(%rax)
.LBB78_16:                              # %if.end35
	movq	-40(%rsp), %rax
	movl	5024(%rax), %eax
	movq	-32(%rsp), %rcx
	movl	%eax, (%rcx)
	movq	-40(%rsp), %rax
	movq	5016(%rax), %rax
	movq	-24(%rsp), %rcx
	movq	%rax, (%rcx)
	jmp	.LBB78_17
.LBB78_1:                               # %if.then
	cmpq	$0, -8(%rsp)
	je	.LBB78_3
# BB#2:                                 # %if.then2
	movq	-8(%rsp), %rax
	movl	$-2, (%rax)
.LBB78_3:                               # %if.end
	cmpq	$0, -40(%rsp)
	je	.LBB78_17
# BB#4:                                 # %if.then4
	movq	-40(%rsp), %rax
	movl	$-2, 5096(%rax)
	ret
.LBB78_17:                              # %return
	ret
.Ltmp300:
	.size	BZ2_bzReadGetUnused, .Ltmp300-BZ2_bzReadGetUnused
	.cfi_endproc

	.globl	BZ2_bzBuffToBuffCompress
	.align	16, 0x90
	.type	BZ2_bzBuffToBuffCompress,@function
BZ2_bzBuffToBuffCompress:               # @BZ2_bzBuffToBuffCompress
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$136, %rsp
.Ltmp302:
	.cfi_def_cfa_offset 144
	movq	%rdi, 120(%rsp)
	movq	%rsi, 112(%rsp)
	movq	%rdx, 104(%rsp)
	movl	%ecx, 100(%rsp)
	movl	%r8d, 96(%rsp)
	movl	%r9d, 92(%rsp)
	movl	144(%rsp), %eax
	movl	%eax, 88(%rsp)
	cmpq	$0, 120(%rsp)
	je	.LBB79_9
# BB#1:                                 # %lor.lhs.false
	cmpq	$0, 112(%rsp)
	je	.LBB79_9
# BB#2:                                 # %lor.lhs.false2
	cmpq	$0, 104(%rsp)
	je	.LBB79_9
# BB#3:                                 # %lor.lhs.false4
	cmpl	$0, 96(%rsp)
	jle	.LBB79_9
# BB#4:                                 # %lor.lhs.false6
	cmpl	$9, 96(%rsp)
	jg	.LBB79_9
# BB#5:                                 # %lor.lhs.false8
	cmpl	$0, 92(%rsp)
	js	.LBB79_9
# BB#6:                                 # %lor.lhs.false10
	cmpl	$4, 92(%rsp)
	jg	.LBB79_9
# BB#7:                                 # %lor.lhs.false12
	cmpl	$0, 88(%rsp)
	js	.LBB79_9
# BB#8:                                 # %lor.lhs.false14
	cmpl	$251, 88(%rsp)
	jl	.LBB79_10
.LBB79_9:                               # %if.then
	movl	$-2, 132(%rsp)
.LBB79_19:                              # %return
	movl	132(%rsp), %eax
	addq	$136, %rsp
	ret
.LBB79_10:                              # %if.end
	cmpl	$0, 88(%rsp)
	jne	.LBB79_12
# BB#11:                                # %if.then17
	movl	$30, 88(%rsp)
.LBB79_12:                              # %if.end18
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
	jne	.LBB79_18
# BB#13:                                # %if.end21
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
	jne	.LBB79_14
# BB#16:                                # %output_overflow
	leaq	8(%rsp), %rdi
	callq	BZ2_bzCompressEnd
	movl	$-8, 132(%rsp)
	jmp	.LBB79_19
.LBB79_14:                              # %if.end25
	cmpl	$4, 4(%rsp)
	je	.LBB79_15
# BB#17:                                # %errhandler
	leaq	8(%rsp), %rdi
	callq	BZ2_bzCompressEnd
.LBB79_18:                              # %errhandler
	movl	4(%rsp), %eax
	movl	%eax, 132(%rsp)
	jmp	.LBB79_19
.LBB79_15:                              # %if.end28
	movq	112(%rsp), %rax
	movl	40(%rsp), %ecx
	subl	%ecx, (%rax)
	leaq	8(%rsp), %rdi
	callq	BZ2_bzCompressEnd
	movl	$0, 132(%rsp)
	jmp	.LBB79_19
.Ltmp303:
	.size	BZ2_bzBuffToBuffCompress, .Ltmp303-BZ2_bzBuffToBuffCompress
	.cfi_endproc

	.globl	BZ2_bzBuffToBuffDecompress
	.align	16, 0x90
	.type	BZ2_bzBuffToBuffDecompress,@function
BZ2_bzBuffToBuffDecompress:             # @BZ2_bzBuffToBuffDecompress
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$136, %rsp
.Ltmp305:
	.cfi_def_cfa_offset 144
	movq	%rdi, 120(%rsp)
	movq	%rsi, 112(%rsp)
	movq	%rdx, 104(%rsp)
	movl	%ecx, 100(%rsp)
	movl	%r8d, 96(%rsp)
	movl	%r9d, 92(%rsp)
	cmpq	$0, 120(%rsp)
	je	.LBB80_7
# BB#1:                                 # %lor.lhs.false
	cmpq	$0, 112(%rsp)
	je	.LBB80_7
# BB#2:                                 # %lor.lhs.false2
	cmpq	$0, 104(%rsp)
	je	.LBB80_7
# BB#3:                                 # %lor.lhs.false4
	cmpl	$0, 96(%rsp)
	je	.LBB80_5
# BB#4:                                 # %land.lhs.true
	cmpl	$1, 96(%rsp)
	jne	.LBB80_7
.LBB80_5:                               # %lor.lhs.false7
	cmpl	$0, 92(%rsp)
	js	.LBB80_7
# BB#6:                                 # %lor.lhs.false9
	cmpl	$5, 92(%rsp)
	jl	.LBB80_8
.LBB80_7:                               # %if.then
	movl	$-2, 132(%rsp)
.LBB80_17:                              # %return
	movl	132(%rsp), %eax
	addq	$136, %rsp
	ret
.LBB80_8:                               # %if.end
	movq	$0, 64(%rsp)
	movq	$0, 72(%rsp)
	movq	$0, 80(%rsp)
	movl	96(%rsp), %edx
	movl	92(%rsp), %esi
	leaq	8(%rsp), %rdi
	callq	BZ2_bzDecompressInit
	movl	%eax, 4(%rsp)
	testl	%eax, %eax
	jne	.LBB80_16
# BB#9:                                 # %if.end13
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
	je	.LBB80_12
# BB#10:                                # %if.end17
	cmpl	$4, 4(%rsp)
	je	.LBB80_11
# BB#15:                                # %errhandler
	leaq	8(%rsp), %rdi
	callq	BZ2_bzDecompressEnd
.LBB80_16:                              # %errhandler
	movl	4(%rsp), %eax
	movl	%eax, 132(%rsp)
	jmp	.LBB80_17
.LBB80_12:                              # %output_overflow_or_eof
	cmpl	$0, 40(%rsp)
	je	.LBB80_14
# BB#13:                                # %if.then25
	leaq	8(%rsp), %rdi
	callq	BZ2_bzDecompressEnd
	movl	$-7, 132(%rsp)
	jmp	.LBB80_17
.LBB80_11:                              # %if.end20
	movq	112(%rsp), %rax
	movl	40(%rsp), %ecx
	subl	%ecx, (%rax)
	leaq	8(%rsp), %rdi
	callq	BZ2_bzDecompressEnd
	movl	$0, 132(%rsp)
	jmp	.LBB80_17
.LBB80_14:                              # %if.else
	leaq	8(%rsp), %rdi
	callq	BZ2_bzDecompressEnd
	movl	$-8, 132(%rsp)
	jmp	.LBB80_17
.Ltmp306:
	.size	BZ2_bzBuffToBuffDecompress, .Ltmp306-BZ2_bzBuffToBuffDecompress
	.cfi_endproc

	.globl	BZ2_bzopen
	.align	16, 0x90
	.type	BZ2_bzopen,@function
BZ2_bzopen:                             # @BZ2_bzopen
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp308:
	.cfi_def_cfa_offset 32
	movq	%rsi, %rax
	movq	%rdi, 16(%rsp)
	movq	%rax, 8(%rsp)
	movq	16(%rsp), %rdi
	movl	$-1, %esi
	movq	%rax, %rdx
	xorl	%ecx, %ecx
	callq	bzopen_or_bzdopen
	addq	$24, %rsp
	ret
.Ltmp309:
	.size	BZ2_bzopen, .Ltmp309-BZ2_bzopen
	.cfi_endproc

	.align	16, 0x90
	.type	bzopen_or_bzdopen,@function
bzopen_or_bzdopen:                      # @bzopen_or_bzdopen
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp312:
	.cfi_def_cfa_offset 16
	subq	$5104, %rsp             # imm = 0x13F0
.Ltmp313:
	.cfi_def_cfa_offset 5120
.Ltmp314:
	.cfi_offset %rbx, -16
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
	jne	.LBB82_2
# BB#1:                                 # %if.then
	movq	$0, 5096(%rsp)
	jmp	.LBB82_37
	.align	16, 0x90
.LBB82_8:                               # %sw.bb2
                                        #   in Loop: Header=BB82_2 Depth=1
	movl	$1, 12(%rsp)
	incq	5072(%rsp)
.LBB82_2:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	5072(%rsp), %rax
	cmpb	$0, (%rax)
	je	.LBB82_12
# BB#3:                                 # %while.body
                                        #   in Loop: Header=BB82_2 Depth=1
	movq	5072(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$119, %eax
	je	.LBB82_7
# BB#4:                                 # %while.body
                                        #   in Loop: Header=BB82_2 Depth=1
	cmpl	$115, %eax
	je	.LBB82_8
# BB#5:                                 # %while.body
                                        #   in Loop: Header=BB82_2 Depth=1
	cmpl	$114, %eax
	jne	.LBB82_9
# BB#6:                                 # %sw.bb
                                        #   in Loop: Header=BB82_2 Depth=1
	movl	$0, 56(%rsp)
	incq	5072(%rsp)
	jmp	.LBB82_2
	.align	16, 0x90
.LBB82_7:                               # %sw.bb1
                                        #   in Loop: Header=BB82_2 Depth=1
	movl	$1, 56(%rsp)
	incq	5072(%rsp)
	jmp	.LBB82_2
.LBB82_9:                               # %sw.default
                                        #   in Loop: Header=BB82_2 Depth=1
	movq	5072(%rsp), %rax
	movsbq	(%rax), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	testb	$8, 1(%rax,%rbx,2)
	je	.LBB82_11
# BB#10:                                # %if.then6
                                        #   in Loop: Header=BB82_2 Depth=1
	movq	5072(%rsp), %rax
	movsbl	(%rax), %eax
	addl	$-48, %eax
	movl	%eax, 60(%rsp)
.LBB82_11:                              # %sw.epilog
                                        #   in Loop: Header=BB82_2 Depth=1
	incq	5072(%rsp)
	jmp	.LBB82_2
.LBB82_12:                              # %while.end
	movl	$.L.str17125, %esi
	cmpl	$0, 56(%rsp)
	jne	.LBB82_14
# BB#13:                                # %select.mid
	movl	$.L.str18126, %esi
.LBB82_14:                              # %select.end
	leaq	40(%rsp), %rbx
	movq	%rbx, %rdi
	callq	strcat
	movq	%rbx, %rdi
	movl	$.L.str19127, %esi
	callq	strcat
	cmpl	$0, 5068(%rsp)
	je	.LBB82_15
# BB#21:                                # %if.else27
	movl	5084(%rsp), %edi
	leaq	40(%rsp), %rsi
	callq	fdopen
	jmp	.LBB82_22
.LBB82_15:                              # %if.then15
	cmpq	$0, 5088(%rsp)
	je	.LBB82_17
# BB#16:                                # %lor.lhs.false
	movq	5088(%rsp), %rdi
	movl	$.L.str20128, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB82_17
# BB#20:                                # %if.else
	movq	5088(%rsp), %rdi
	leaq	40(%rsp), %rsi
	callq	fopen
	jmp	.LBB82_22
.LBB82_17:                              # %if.then21
	cmpl	$0, 56(%rsp)
	je	.LBB82_19
# BB#18:                                # %cond.true
	movq	stdout(%rip), %rax
	jmp	.LBB82_22
.LBB82_19:                              # %cond.false
	movq	stdin(%rip), %rax
.LBB82_22:                              # %if.else27
	movq	%rax, 32(%rsp)
	cmpq	$0, 32(%rsp)
	je	.LBB82_23
# BB#24:                                # %if.end34
	cmpl	$0, 56(%rsp)
	je	.LBB82_30
# BB#25:                                # %if.then36
	cmpl	$0, 60(%rsp)
	jg	.LBB82_27
# BB#26:                                # %if.then39
	movl	$1, 60(%rsp)
.LBB82_27:                              # %if.end40
	cmpl	$10, 60(%rsp)
	jl	.LBB82_29
# BB#28:                                # %if.then43
	movl	$9, 60(%rsp)
.LBB82_29:                              # %if.end44
	movl	16(%rsp), %r8d
	movl	20(%rsp), %ecx
	movl	60(%rsp), %edx
	movq	32(%rsp), %rsi
	leaq	5064(%rsp), %rdi
	callq	BZ2_bzWriteOpen
	jmp	.LBB82_31
.LBB82_23:                              # %if.then33
	movq	$0, 5096(%rsp)
	jmp	.LBB82_37
.LBB82_30:                              # %if.else46
	movl	8(%rsp), %r9d
	movl	12(%rsp), %ecx
	movl	20(%rsp), %edx
	movq	32(%rsp), %rsi
	leaq	5064(%rsp), %rdi
	leaq	64(%rsp), %r8
	callq	BZ2_bzReadOpen
.LBB82_31:                              # %if.else46
	movq	%rax, 24(%rsp)
	cmpq	$0, 24(%rsp)
	je	.LBB82_32
# BB#36:                                # %if.end60
	movq	24(%rsp), %rax
	movq	%rax, 5096(%rsp)
	jmp	.LBB82_37
.LBB82_32:                              # %if.then52
	movq	32(%rsp), %rax
	cmpq	stdin(%rip), %rax
	je	.LBB82_35
# BB#33:                                # %land.lhs.true
	movq	32(%rsp), %rax
	cmpq	stdout(%rip), %rax
	je	.LBB82_35
# BB#34:                                # %if.then57
	movq	32(%rsp), %rdi
	callq	fclose
.LBB82_35:                              # %if.end59
	movq	$0, 5096(%rsp)
.LBB82_37:                              # %return
	movq	5096(%rsp), %rax
	addq	$5104, %rsp             # imm = 0x13F0
	popq	%rbx
	ret
.Ltmp315:
	.size	bzopen_or_bzdopen, .Ltmp315-bzopen_or_bzdopen
	.cfi_endproc

	.globl	BZ2_bzdopen
	.align	16, 0x90
	.type	BZ2_bzdopen,@function
BZ2_bzdopen:                            # @BZ2_bzdopen
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp317:
	.cfi_def_cfa_offset 32
	movq	%rsi, %rax
	movl	%edi, 20(%rsp)
	movq	%rax, 8(%rsp)
	movl	20(%rsp), %esi
	xorl	%edi, %edi
	movq	%rax, %rdx
	movl	$1, %ecx
	callq	bzopen_or_bzdopen
	addq	$24, %rsp
	ret
.Ltmp318:
	.size	BZ2_bzdopen, .Ltmp318-BZ2_bzdopen
	.cfi_endproc

	.globl	BZ2_bzread
	.align	16, 0x90
	.type	BZ2_bzread,@function
BZ2_bzread:                             # @BZ2_bzread
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp320:
	.cfi_def_cfa_offset 48
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movl	%edx, 12(%rsp)
	movq	24(%rsp), %rax
	cmpl	$4, 5096(%rax)
	jne	.LBB84_2
# BB#1:                                 # %if.then
	movl	$0, 36(%rsp)
	jmp	.LBB84_6
.LBB84_2:                               # %if.end
	movl	12(%rsp), %ecx
	movq	16(%rsp), %rdx
	movq	24(%rsp), %rsi
	leaq	8(%rsp), %rdi
	callq	BZ2_bzRead
	movl	%eax, 4(%rsp)
	cmpl	$0, 8(%rsp)
	je	.LBB84_4
# BB#3:                                 # %lor.lhs.false
	cmpl	$4, 8(%rsp)
	jne	.LBB84_5
.LBB84_4:                               # %if.then3
	movl	4(%rsp), %eax
	movl	%eax, 36(%rsp)
	jmp	.LBB84_6
.LBB84_5:                               # %if.else
	movl	$-1, 36(%rsp)
.LBB84_6:                               # %return
	movl	36(%rsp), %eax
	addq	$40, %rsp
	ret
.Ltmp321:
	.size	BZ2_bzread, .Ltmp321-BZ2_bzread
	.cfi_endproc

	.globl	BZ2_bzwrite
	.align	16, 0x90
	.type	BZ2_bzwrite,@function
BZ2_bzwrite:                            # @BZ2_bzwrite
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp323:
	.cfi_def_cfa_offset 48
	movl	%edx, %eax
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
	movl	$-1, 36(%rsp)
	jmp	.LBB85_3
.LBB85_1:                               # %if.then
	movl	12(%rsp), %eax
	movl	%eax, 36(%rsp)
.LBB85_3:                               # %return
	movl	36(%rsp), %eax
	addq	$40, %rsp
	ret
.Ltmp324:
	.size	BZ2_bzwrite, .Ltmp324-BZ2_bzwrite
	.cfi_endproc

	.globl	BZ2_bzflush
	.align	16, 0x90
	.type	BZ2_bzflush,@function
BZ2_bzflush:                            # @BZ2_bzflush
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -8(%rsp)
	xorl	%eax, %eax
	ret
.Ltmp325:
	.size	BZ2_bzflush, .Ltmp325-BZ2_bzflush
	.cfi_endproc

	.globl	BZ2_bzclose
	.align	16, 0x90
	.type	BZ2_bzclose,@function
BZ2_bzclose:                            # @BZ2_bzclose
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp327:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movq	(%rdi), %rax
	movq	%rax, (%rsp)
	cmpq	$0, 16(%rsp)
	je	.LBB87_8
# BB#1:                                 # %if.end
	movq	16(%rsp), %rax
	cmpb	$0, 5012(%rax)
	je	.LBB87_4
# BB#2:                                 # %if.then1
	movq	16(%rsp), %rsi
	leaq	12(%rsp), %rdi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	callq	BZ2_bzWriteClose
	cmpl	$0, 12(%rsp)
	je	.LBB87_5
# BB#3:                                 # %if.then3
	movq	16(%rsp), %rsi
	xorl	%edi, %edi
	movl	$1, %edx
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	callq	BZ2_bzWriteClose
	jmp	.LBB87_5
.LBB87_4:                               # %if.else
	movq	16(%rsp), %rsi
	leaq	12(%rsp), %rdi
	callq	BZ2_bzReadClose
.LBB87_5:                               # %if.end5
	movq	(%rsp), %rax
	cmpq	stdin(%rip), %rax
	je	.LBB87_8
# BB#6:                                 # %land.lhs.true
	movq	(%rsp), %rax
	cmpq	stdout(%rip), %rax
	je	.LBB87_8
# BB#7:                                 # %if.then8
	movq	(%rsp), %rdi
	callq	fclose
.LBB87_8:                               # %if.end9
	addq	$24, %rsp
	ret
.Ltmp328:
	.size	BZ2_bzclose, .Ltmp328-BZ2_bzclose
	.cfi_endproc

	.globl	BZ2_bzerror
	.align	16, 0x90
	.type	BZ2_bzerror,@function
BZ2_bzerror:                            # @BZ2_bzerror
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movq	-8(%rsp), %rax
	movl	5096(%rax), %eax
	movl	%eax, -20(%rsp)
	testl	%eax, %eax
	jle	.LBB88_2
# BB#1:                                 # %if.then
	movl	$0, -20(%rsp)
.LBB88_2:                               # %if.end
	movq	-16(%rsp), %rax
	movl	-20(%rsp), %ecx
	movl	%ecx, (%rax)
	xorl	%eax, %eax
	subl	-20(%rsp), %eax
	movslq	%eax, %rax
	movq	bzerrorstrings(,%rax,8), %rax
	ret
.Ltmp329:
	.size	BZ2_bzerror, .Ltmp329-BZ2_bzerror
	.cfi_endproc

	.align	16, 0x90
	.type	copy_output_until_stop,@function
copy_output_until_stop:                 # @copy_output_until_stop
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -8(%rsp)
	movb	$0, -9(%rsp)
	jmp	.LBB89_1
	.align	16, 0x90
.LBB89_4:                               # %if.then16
                                        #   in Loop: Header=BB89_1 Depth=1
	movq	-8(%rsp), %rax
	movq	(%rax), %rax
	incl	40(%rax)
.LBB89_1:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	-8(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 32(%rax)
	je	.LBB89_5
# BB#2:                                 # %if.end
                                        #   in Loop: Header=BB89_1 Depth=1
	movq	-8(%rsp), %rax
	movl	120(%rax), %ecx
	cmpl	116(%rax), %ecx
	jge	.LBB89_5
# BB#3:                                 # %if.end3
                                        #   in Loop: Header=BB89_1 Depth=1
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
	jne	.LBB89_1
	jmp	.LBB89_4
.LBB89_5:                               # %while.end
	movzbl	-9(%rsp), %eax
	ret
.Ltmp330:
	.size	copy_output_until_stop, .Ltmp330-copy_output_until_stop
	.cfi_endproc

	.align	16, 0x90
	.type	copy_input_until_stop,@function
copy_input_until_stop:                  # @copy_input_until_stop
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp332:
	.cfi_def_cfa_offset 48
	movq	%rdi, 32(%rsp)
	movb	$0, 31(%rsp)
	movq	32(%rsp), %rax
	cmpl	$2, 8(%rax)
	jne	.LBB90_14
	jmp	.LBB90_1
	.align	16, 0x90
.LBB90_28:                              # %if.end151
                                        #   in Loop: Header=BB90_14 Depth=1
	movq	32(%rsp), %rax
	decl	16(%rax)
.LBB90_14:                              # %while.body60
                                        # =>This Inner Loop Header: Depth=1
	movq	32(%rsp), %rax
	movl	108(%rax), %ecx
	cmpl	112(%rax), %ecx
	jge	.LBB90_29
# BB#15:                                # %if.end66
                                        #   in Loop: Header=BB90_14 Depth=1
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB90_29
# BB#16:                                # %if.end72
                                        #   in Loop: Header=BB90_14 Depth=1
	movq	32(%rsp), %rax
	cmpl	$0, 16(%rax)
	je	.LBB90_29
# BB#17:                                # %if.end76
                                        #   in Loop: Header=BB90_14 Depth=1
	movb	$1, 31(%rsp)
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	movl	%eax, 16(%rsp)
	movq	32(%rsp), %rcx
	cmpl	92(%rcx), %eax
	je	.LBB90_20
# BB#18:                                # %land.lhs.true84
                                        #   in Loop: Header=BB90_14 Depth=1
	movq	32(%rsp), %rax
	cmpl	$1, 96(%rax)
	jne	.LBB90_20
# BB#19:                                # %if.then88
                                        #   in Loop: Header=BB90_14 Depth=1
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
	jmp	.LBB90_26
	.align	16, 0x90
.LBB90_20:                              # %if.else113
                                        #   in Loop: Header=BB90_14 Depth=1
	movq	32(%rsp), %rax
	movl	16(%rsp), %ecx
	cmpl	92(%rax), %ecx
	jne	.LBB90_22
# BB#21:                                # %lor.lhs.false117
                                        #   in Loop: Header=BB90_14 Depth=1
	movq	32(%rsp), %rax
	cmpl	$255, 96(%rax)
	jne	.LBB90_25
.LBB90_22:                              # %if.then121
                                        #   in Loop: Header=BB90_14 Depth=1
	movq	32(%rsp), %rax
	cmpl	$255, 92(%rax)
	ja	.LBB90_24
# BB#23:                                # %if.then125
                                        #   in Loop: Header=BB90_14 Depth=1
	movq	32(%rsp), %rdi
	callq	add_pair_to_block
.LBB90_24:                              # %if.end126
                                        #   in Loop: Header=BB90_14 Depth=1
	movq	32(%rsp), %rax
	movl	16(%rsp), %ecx
	movl	%ecx, 92(%rax)
	movq	32(%rsp), %rax
	movl	$1, 96(%rax)
	jmp	.LBB90_26
.LBB90_25:                              # %if.else129
                                        #   in Loop: Header=BB90_14 Depth=1
	movq	32(%rsp), %rax
	incl	96(%rax)
	.align	16, 0x90
.LBB90_26:                              # %if.end133
                                        #   in Loop: Header=BB90_14 Depth=1
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
	jne	.LBB90_28
# BB#27:                                # %if.then147
                                        #   in Loop: Header=BB90_14 Depth=1
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
	jmp	.LBB90_28
	.align	16, 0x90
.LBB90_13:                              # %if.then55
                                        #   in Loop: Header=BB90_1 Depth=1
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB90_1:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	32(%rsp), %rax
	movl	108(%rax), %ecx
	cmpl	112(%rax), %ecx
	jge	.LBB90_29
# BB#2:                                 # %if.end
                                        #   in Loop: Header=BB90_1 Depth=1
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB90_29
# BB#3:                                 # %if.end5
                                        #   in Loop: Header=BB90_1 Depth=1
	movb	$1, 31(%rsp)
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	movl	%eax, 24(%rsp)
	movq	32(%rsp), %rcx
	cmpl	92(%rcx), %eax
	je	.LBB90_6
# BB#4:                                 # %land.lhs.true
                                        #   in Loop: Header=BB90_1 Depth=1
	movq	32(%rsp), %rax
	cmpl	$1, 96(%rax)
	jne	.LBB90_6
# BB#5:                                 # %if.then11
                                        #   in Loop: Header=BB90_1 Depth=1
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
	jmp	.LBB90_12
	.align	16, 0x90
.LBB90_6:                               # %if.else
                                        #   in Loop: Header=BB90_1 Depth=1
	movq	32(%rsp), %rax
	movl	24(%rsp), %ecx
	cmpl	92(%rax), %ecx
	jne	.LBB90_8
# BB#7:                                 # %lor.lhs.false
                                        #   in Loop: Header=BB90_1 Depth=1
	movq	32(%rsp), %rax
	cmpl	$255, 96(%rax)
	jne	.LBB90_11
.LBB90_8:                               # %if.then32
                                        #   in Loop: Header=BB90_1 Depth=1
	movq	32(%rsp), %rax
	cmpl	$255, 92(%rax)
	ja	.LBB90_10
# BB#9:                                 # %if.then36
                                        #   in Loop: Header=BB90_1 Depth=1
	movq	32(%rsp), %rdi
	callq	add_pair_to_block
.LBB90_10:                              # %if.end37
                                        #   in Loop: Header=BB90_1 Depth=1
	movq	32(%rsp), %rax
	movl	24(%rsp), %ecx
	movl	%ecx, 92(%rax)
	movq	32(%rsp), %rax
	movl	$1, 96(%rax)
	jmp	.LBB90_12
.LBB90_11:                              # %if.else40
                                        #   in Loop: Header=BB90_1 Depth=1
	movq	32(%rsp), %rax
	incl	96(%rax)
	.align	16, 0x90
.LBB90_12:                              # %if.end44
                                        #   in Loop: Header=BB90_1 Depth=1
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
	jne	.LBB90_1
	jmp	.LBB90_13
.LBB90_29:                              # %if.end155
	movzbl	31(%rsp), %eax
	addq	$40, %rsp
	ret
.Ltmp333:
	.size	copy_input_until_stop, .Ltmp333-copy_input_until_stop
	.cfi_endproc

	.align	16, 0x90
	.type	flush_RL,@function
flush_RL:                               # @flush_RL
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp335:
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	cmpl	$255, 92(%rdi)
	ja	.LBB91_2
# BB#1:                                 # %if.then
	movq	(%rsp), %rdi
	callq	add_pair_to_block
.LBB91_2:                               # %if.end
	movq	(%rsp), %rdi
	callq	init_RL
	popq	%rax
	ret
.Ltmp336:
	.size	flush_RL, .Ltmp336-flush_RL
	.cfi_endproc

	.align	16, 0x90
	.type	add_pair_to_block,@function
add_pair_to_block:                      # @add_pair_to_block
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -8(%rsp)
	movb	92(%rdi), %al
	movb	%al, -13(%rsp)
	movl	$0, -12(%rsp)
	jmp	.LBB92_1
	.align	16, 0x90
.LBB92_2:                               # %for.body
                                        #   in Loop: Header=BB92_1 Depth=1
	movq	-8(%rsp), %rax
	movl	648(%rax), %ecx
	movl	%ecx, %esi
	shrl	$24, %esi
	movzbl	-13(%rsp), %edx
	xorl	%esi, %edx
	shll	$8, %ecx
	xorl	BZ2_crc32Table(,%rdx,4), %ecx
	movl	%ecx, 648(%rax)
	incl	-12(%rsp)
.LBB92_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-8(%rsp), %rax
	movl	-12(%rsp), %ecx
	cmpl	96(%rax), %ecx
	jl	.LBB92_2
# BB#3:                                 # %for.end
	movq	-8(%rsp), %rax
	movl	92(%rax), %ecx
	movb	$1, 128(%rax,%rcx)
	movq	-8(%rsp), %rax
	movl	96(%rax), %eax
	cmpl	$3, %eax
	je	.LBB92_7
# BB#4:                                 # %for.end
	cmpl	$2, %eax
	je	.LBB92_8
# BB#5:                                 # %for.end
	cmpl	$1, %eax
	je	.LBB92_6
# BB#9:                                 # %sw.default
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
	jmp	.LBB92_10
.LBB92_7:                               # %sw.bb27
	movq	-8(%rsp), %rcx
	movq	64(%rcx), %rax
	movslq	108(%rcx), %rcx
	movb	-13(%rsp), %dl
	movb	%dl, (%rax,%rcx)
	movq	-8(%rsp), %rax
	incl	108(%rax)
.LBB92_8:                               # %sw.bb14
	movq	-8(%rsp), %rcx
	movq	64(%rcx), %rax
	movslq	108(%rcx), %rcx
	movb	-13(%rsp), %dl
	movb	%dl, (%rax,%rcx)
	movq	-8(%rsp), %rax
	incl	108(%rax)
.LBB92_6:                               # %sw.bb
	movq	-8(%rsp), %rcx
	movq	64(%rcx), %rax
	movslq	108(%rcx), %rcx
	movb	-13(%rsp), %dl
	movb	%dl, (%rax,%rcx)
.LBB92_10:                              # %sw.default
	movq	-8(%rsp), %rax
	incl	108(%rax)
	ret
.Ltmp337:
	.size	add_pair_to_block, .Ltmp337-add_pair_to_block
	.cfi_endproc

	.globl	BZ2_bsInitWrite
	.align	16, 0x90
	.type	BZ2_bsInitWrite,@function
BZ2_bsInitWrite:                        # @BZ2_bsInitWrite
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -8(%rsp)
	movl	$0, 644(%rdi)
	movq	-8(%rsp), %rax
	movl	$0, 640(%rax)
	ret
.Ltmp338:
	.size	BZ2_bsInitWrite, .Ltmp338-BZ2_bsInitWrite
	.cfi_endproc

	.globl	BZ2_compressBlock
	.align	16, 0x90
	.type	BZ2_compressBlock,@function
BZ2_compressBlock:                      # @BZ2_compressBlock
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp340:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movb	%sil, 15(%rsp)
	movq	16(%rsp), %rax
	cmpl	$0, 108(%rax)
	jle	.LBB94_6
# BB#1:                                 # %if.then
	movq	16(%rsp), %rax
	notl	648(%rax)
	movq	16(%rsp), %rax
	roll	652(%rax)
	movq	16(%rsp), %rax
	movl	648(%rax), %ecx
	xorl	%ecx, 652(%rax)
	movq	16(%rsp), %rax
	cmpl	$2, 660(%rax)
	jl	.LBB94_3
# BB#2:                                 # %if.then7
	movq	16(%rsp), %rax
	movl	$0, 116(%rax)
.LBB94_3:                               # %if.end
	movq	16(%rsp), %rax
	cmpl	$2, 656(%rax)
	jl	.LBB94_5
# BB#4:                                 # %if.then9
	movq	16(%rsp), %rax
	movl	108(%rax), %r9d
	movl	652(%rax), %r8d
	movl	648(%rax), %ecx
	movl	660(%rax), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str148, %esi
	xorb	%al, %al
	callq	fprintf
.LBB94_5:                               # %if.end14
	movq	16(%rsp), %rdi
	callq	BZ2_blockSort
.LBB94_6:                               # %if.end15
	movq	16(%rsp), %rax
	movslq	108(%rax), %rcx
	addq	32(%rax), %rcx
	movq	%rcx, 80(%rax)
	movq	16(%rsp), %rax
	cmpl	$1, 660(%rax)
	jne	.LBB94_8
# BB#7:                                 # %if.then19
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
.LBB94_8:                               # %if.end20
	movq	16(%rsp), %rax
	cmpl	$0, 108(%rax)
	jle	.LBB94_10
# BB#9:                                 # %if.then24
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
.LBB94_10:                              # %if.end26
	cmpb	$0, 15(%rsp)
	je	.LBB94_14
# BB#11:                                # %if.then27
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
	cmpl	$2, 656(%rax)
	jl	.LBB94_13
# BB#12:                                # %if.then32
	movq	16(%rsp), %rax
	movl	652(%rax), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str1149, %esi
	xorb	%al, %al
	callq	fprintf
.LBB94_13:                              # %if.end35
	movq	16(%rsp), %rdi
	callq	bsFinishWrite
.LBB94_14:                              # %if.end36
	addq	$24, %rsp
	ret
.Ltmp341:
	.size	BZ2_compressBlock, .Ltmp341-BZ2_compressBlock
	.cfi_endproc

	.align	16, 0x90
	.type	bsPutUChar,@function
bsPutUChar:                             # @bsPutUChar
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp343:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movb	%sil, 15(%rsp)
	movzbl	15(%rsp), %edx
	movq	16(%rsp), %rdi
	movl	$8, %esi
	callq	bsW
	addq	$24, %rsp
	ret
.Ltmp344:
	.size	bsPutUChar, .Ltmp344-bsPutUChar
	.cfi_endproc

	.align	16, 0x90
	.type	bsPutUInt32,@function
bsPutUInt32:                            # @bsPutUInt32
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp346:
	.cfi_def_cfa_offset 32
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
.Ltmp347:
	.size	bsPutUInt32, .Ltmp347-bsPutUInt32
	.cfi_endproc

	.align	16, 0x90
	.type	bsW,@function
bsW:                                    # @bsW
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movl	%edx, -16(%rsp)
	jmp	.LBB97_1
	.align	16, 0x90
.LBB97_2:                               # %while.body
                                        #   in Loop: Header=BB97_1 Depth=1
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
.LBB97_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-8(%rsp), %rax
	cmpl	$8, 644(%rax)
	jge	.LBB97_2
# BB#3:                                 # %while.end
	movq	-8(%rsp), %rax
	movl	$32, %ecx
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
.Ltmp348:
	.size	bsW, .Ltmp348-bsW
	.cfi_endproc

	.align	16, 0x90
	.type	generateMTFValues,@function
generateMTFValues:                      # @generateMTFValues
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$344, %rsp              # imm = 0x158
.Ltmp350:
	.cfi_def_cfa_offset 352
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
	jmp	.LBB98_1
	.align	16, 0x90
.LBB98_2:                               # %for.inc
                                        #   in Loop: Header=BB98_1 Depth=1
	movq	336(%rsp), %rax
	movslq	76(%rsp), %rcx
	movl	$0, 672(%rax,%rcx,4)
	incl	76(%rsp)
.LBB98_1:                               # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	76(%rsp), %eax
	cmpl	60(%rsp), %eax
	jle	.LBB98_2
# BB#3:                                 # %for.end
	movl	$0, 64(%rsp)
	movl	$0, 68(%rsp)
	movl	$0, 76(%rsp)
	jmp	.LBB98_4
	.align	16, 0x90
.LBB98_5:                               # %for.inc10
                                        #   in Loop: Header=BB98_4 Depth=1
	movslq	76(%rsp), %rax
	movb	%al, 80(%rsp,%rax)
	incl	76(%rsp)
.LBB98_4:                               # %for.cond4
                                        # =>This Inner Loop Header: Depth=1
	movq	336(%rsp), %rax
	movl	76(%rsp), %ecx
	cmpl	124(%rax), %ecx
	jl	.LBB98_5
# BB#6:                                 # %for.end12
	movl	$0, 76(%rsp)
	leaq	81(%rsp), %r8
	leaq	80(%rsp), %rcx
	jmp	.LBB98_7
	.align	16, 0x90
.LBB98_11:                              # %if.then32
                                        #   in Loop: Header=BB98_7 Depth=1
	incl	68(%rsp)
	incl	76(%rsp)
.LBB98_7:                               # %for.cond13
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB98_14 Depth 2
                                        #     Child Loop BB98_21 Depth 2
	movq	336(%rsp), %rdx
	movl	76(%rsp), %esi
	cmpl	108(%rdx), %esi
	jge	.LBB98_24
# BB#8:                                 # %for.body16
                                        #   in Loop: Header=BB98_7 Depth=1
	movslq	76(%rsp), %rdx
	movq	48(%rsp), %rsi
	movl	(%rsi,%rdx,4), %edx
	decl	%edx
	movl	%edx, 72(%rsp)
	jns	.LBB98_10
# BB#9:                                 # %if.then
                                        #   in Loop: Header=BB98_7 Depth=1
	movq	336(%rsp), %rdx
	movl	108(%rdx), %edx
	addl	%edx, 72(%rsp)
.LBB98_10:                              # %if.end
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
	je	.LBB98_11
# BB#12:                                # %if.else
                                        #   in Loop: Header=BB98_7 Depth=1
	cmpl	$0, 68(%rsp)
	jle	.LBB98_20
# BB#13:                                # %if.then36
                                        #   in Loop: Header=BB98_7 Depth=1
	decl	68(%rsp)
	jmp	.LBB98_14
	.align	16, 0x90
.LBB98_18:                              # %if.end55
                                        #   in Loop: Header=BB98_14 Depth=2
	movl	68(%rsp), %edx
	leal	-2(%rdx), %esi
	shrl	$31, %esi
	leal	-2(%rdx,%rsi), %edx
	sarl	%edx
	movl	%edx, 68(%rsp)
.LBB98_14:                              # %while.body
                                        #   Parent Loop BB98_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testb	$1, 68(%rsp)
	je	.LBB98_16
# BB#15:                                # %if.then37
                                        #   in Loop: Header=BB98_14 Depth=2
	movq	32(%rsp), %rdx
	movslq	64(%rsp), %rsi
	movw	$1, (%rdx,%rsi,2)
	incl	64(%rsp)
	movq	336(%rsp), %rdx
	incl	676(%rdx)
	jmp	.LBB98_17
	.align	16, 0x90
.LBB98_16:                              # %if.else44
                                        #   in Loop: Header=BB98_14 Depth=2
	movq	32(%rsp), %rdx
	movslq	64(%rsp), %rsi
	movw	$0, (%rdx,%rsi,2)
	incl	64(%rsp)
	movq	336(%rsp), %rdx
	incl	672(%rdx)
.LBB98_17:                              # %if.end51
                                        #   in Loop: Header=BB98_14 Depth=2
	cmpl	$2, 68(%rsp)
	jge	.LBB98_18
# BB#19:                                # %while.end
                                        #   in Loop: Header=BB98_7 Depth=1
	movl	$0, 68(%rsp)
.LBB98_20:                              # %if.end57
                                        #   in Loop: Header=BB98_7 Depth=1
	movb	81(%rsp), %dl
	movb	%dl, 30(%rsp)
	movb	80(%rsp), %dl
	movb	%dl, 81(%rsp)
	movq	%r8, 16(%rsp)
	movb	31(%rsp), %dl
	movb	%dl, 15(%rsp)
	jmp	.LBB98_21
	.align	16, 0x90
.LBB98_22:                              # %while.body66
                                        #   in Loop: Header=BB98_21 Depth=2
	incq	16(%rsp)
	movb	30(%rsp), %dl
	movb	%dl, 14(%rsp)
	movq	16(%rsp), %rdx
	movb	(%rdx), %dl
	movb	%dl, 30(%rsp)
	movq	16(%rsp), %rdx
	movb	14(%rsp), %al
	movb	%al, (%rdx)
.LBB98_21:                              # %while.cond
                                        #   Parent Loop BB98_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	30(%rsp), %edx
	movzbl	15(%rsp), %esi
	cmpl	%edx, %esi
	jne	.LBB98_22
# BB#23:                                # %while.end67
                                        #   in Loop: Header=BB98_7 Depth=1
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
	incl	76(%rsp)
	jmp	.LBB98_7
.LBB98_24:                              # %for.end84
	cmpl	$0, 68(%rsp)
	jle	.LBB98_32
# BB#25:                                # %if.then87
	decl	68(%rsp)
	jmp	.LBB98_26
	.align	16, 0x90
.LBB98_30:                              # %if.end111
                                        #   in Loop: Header=BB98_26 Depth=1
	movl	68(%rsp), %eax
	leal	-2(%rax), %ecx
	shrl	$31, %ecx
	leal	-2(%rax,%rcx), %eax
	sarl	%eax
	movl	%eax, 68(%rsp)
.LBB98_26:                              # %while.body90
                                        # =>This Inner Loop Header: Depth=1
	testb	$1, 68(%rsp)
	je	.LBB98_28
# BB#27:                                # %if.then93
                                        #   in Loop: Header=BB98_26 Depth=1
	movq	32(%rsp), %rax
	movslq	64(%rsp), %rcx
	movw	$1, (%rax,%rcx,2)
	incl	64(%rsp)
	movq	336(%rsp), %rax
	incl	676(%rax)
	jmp	.LBB98_29
	.align	16, 0x90
.LBB98_28:                              # %if.else100
                                        #   in Loop: Header=BB98_26 Depth=1
	movq	32(%rsp), %rax
	movslq	64(%rsp), %rcx
	movw	$0, (%rax,%rcx,2)
	incl	64(%rsp)
	movq	336(%rsp), %rax
	incl	672(%rax)
.LBB98_29:                              # %if.end107
                                        #   in Loop: Header=BB98_26 Depth=1
	cmpl	$2, 68(%rsp)
	jge	.LBB98_30
# BB#31:                                # %while.end114
	movl	$0, 68(%rsp)
.LBB98_32:                              # %if.end115
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
.Ltmp351:
	.size	generateMTFValues, .Ltmp351-generateMTFValues
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
.Ltmp353:
	.cfi_def_cfa_offset 240
	movq	%rdi, 224(%rsp)
	movq	72(%rdi), %rax
	movq	%rax, 104(%rsp)
	movq	224(%rsp), %rax
	cmpl	$3, 656(%rax)
	jl	.LBB99_2
# BB#1:                                 # %if.then
	movq	224(%rsp), %rax
	movl	668(%rax), %ecx
	movl	108(%rax), %edx
	movl	124(%rax), %r8d
	movq	stderr(%rip), %rdi
	movl	$.L.str2150, %esi
	xorb	%al, %al
	callq	fprintf
.LBB99_2:                               # %if.end
	movq	224(%rsp), %rax
	movl	124(%rax), %eax
	addl	$2, %eax
	movl	%eax, 176(%rsp)
	movl	$0, 216(%rsp)
	jmp	.LBB99_3
	.align	16, 0x90
.LBB99_7:                               # %for.inc9
                                        #   in Loop: Header=BB99_3 Depth=1
	incl	216(%rsp)
.LBB99_3:                               # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_5 Depth 2
	cmpl	$5, 216(%rsp)
	jg	.LBB99_8
# BB#4:                                 # %for.body
                                        #   in Loop: Header=BB99_3 Depth=1
	movl	$0, 220(%rsp)
	jmp	.LBB99_5
	.align	16, 0x90
.LBB99_6:                               # %for.inc
                                        #   in Loop: Header=BB99_5 Depth=2
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	220(%rsp), %rcx
	movb	$15, 37708(%rcx,%rax)
	incl	220(%rsp)
.LBB99_5:                               # %for.cond4
                                        #   Parent Loop BB99_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	220(%rsp), %eax
	cmpl	176(%rsp), %eax
	jge	.LBB99_7
	jmp	.LBB99_6
.LBB99_8:                               # %for.end11
	movq	224(%rsp), %rax
	cmpl	$0, 668(%rax)
	jg	.LBB99_10
# BB#9:                                 # %if.then14
	movl	$3001, %edi             # imm = 0xBB9
	callq	BZ2_bz__AssertH__fail
.LBB99_10:                              # %if.end15
	movq	224(%rsp), %rax
	cmpl	$199, 668(%rax)
	jg	.LBB99_12
# BB#11:                                # %if.then18
	movl	$2, 160(%rsp)
	jmp	.LBB99_19
.LBB99_12:                              # %if.else
	movq	224(%rsp), %rax
	cmpl	$599, 668(%rax)         # imm = 0x257
	jg	.LBB99_14
# BB#13:                                # %if.then21
	movl	$3, 160(%rsp)
	jmp	.LBB99_19
.LBB99_14:                              # %if.else22
	movq	224(%rsp), %rax
	cmpl	$1199, 668(%rax)        # imm = 0x4AF
	jg	.LBB99_16
# BB#15:                                # %if.then25
	movl	$4, 160(%rsp)
	jmp	.LBB99_19
.LBB99_16:                              # %if.else26
	movq	224(%rsp), %rax
	cmpl	$2399, 668(%rax)        # imm = 0x95F
	jg	.LBB99_18
# BB#17:                                # %if.then29
	movl	$5, 160(%rsp)
	jmp	.LBB99_19
.LBB99_18:                              # %if.else30
	movl	$6, 160(%rsp)
.LBB99_19:                              # %if.end34
	movl	160(%rsp), %eax
	movl	%eax, 100(%rsp)
	movq	224(%rsp), %rax
	movl	668(%rax), %eax
	movl	%eax, 96(%rsp)
	movl	$0, 204(%rsp)
	jmp	.LBB99_20
	.align	16, 0x90
.LBB99_39:                              # %for.end95
                                        #   in Loop: Header=BB99_20 Depth=1
	decl	100(%rsp)
	movl	200(%rsp), %eax
	incl	%eax
	movl	%eax, 204(%rsp)
	movl	88(%rsp), %eax
	subl	%eax, 96(%rsp)
.LBB99_20:                              # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_22 Depth 2
                                        #     Child Loop BB99_34 Depth 2
	cmpl	$0, 100(%rsp)
	jle	.LBB99_40
# BB#21:                                # %while.body
                                        #   in Loop: Header=BB99_20 Depth=1
	movl	96(%rsp), %eax
	cltd
	idivl	100(%rsp)
	movl	%eax, 92(%rsp)
	movl	204(%rsp), %eax
	decl	%eax
	movl	%eax, 200(%rsp)
	movl	$0, 88(%rsp)
	jmp	.LBB99_22
	.align	16, 0x90
.LBB99_25:                              # %while.body41
                                        #   in Loop: Header=BB99_22 Depth=2
	incl	200(%rsp)
	movslq	200(%rsp), %rax
	movq	224(%rsp), %rcx
	movl	672(%rcx,%rax,4), %eax
	addl	%eax, 88(%rsp)
.LBB99_22:                              # %while.cond37
                                        #   Parent Loop BB99_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorb	%al, %al
	movl	88(%rsp), %ecx
	cmpl	92(%rsp), %ecx
	jge	.LBB99_24
# BB#23:                                # %land.rhs
                                        #   in Loop: Header=BB99_22 Depth=2
	movl	176(%rsp), %eax
	decl	%eax
	cmpl	%eax, 200(%rsp)
	setl	%al
.LBB99_24:                              # %land.end
                                        #   in Loop: Header=BB99_22 Depth=2
	cmpb	$1, %al
	je	.LBB99_25
# BB#26:                                # %while.end
                                        #   in Loop: Header=BB99_20 Depth=1
	movl	200(%rsp), %eax
	cmpl	204(%rsp), %eax
	jle	.LBB99_31
# BB#27:                                # %land.lhs.true
                                        #   in Loop: Header=BB99_20 Depth=1
	movl	100(%rsp), %eax
	cmpl	160(%rsp), %eax
	je	.LBB99_31
# BB#28:                                # %land.lhs.true48
                                        #   in Loop: Header=BB99_20 Depth=1
	cmpl	$1, 100(%rsp)
	je	.LBB99_31
# BB#29:                                # %land.lhs.true50
                                        #   in Loop: Header=BB99_20 Depth=1
	movl	160(%rsp), %eax
	subl	100(%rsp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	andl	$-2, %ecx
	subl	%ecx, %eax
	cmpl	$1, %eax
	jne	.LBB99_31
# BB#30:                                # %if.then53
                                        #   in Loop: Header=BB99_20 Depth=1
	movslq	200(%rsp), %rax
	movq	224(%rsp), %rcx
	movl	672(%rcx,%rax,4), %eax
	subl	%eax, 88(%rsp)
	decl	200(%rsp)
	.align	16, 0x90
.LBB99_31:                              # %if.end58
                                        #   in Loop: Header=BB99_20 Depth=1
	movq	224(%rsp), %rax
	cmpl	$3, 656(%rax)
	jl	.LBB99_33
# BB#32:                                # %if.then61
                                        #   in Loop: Header=BB99_20 Depth=1
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
.LBB99_33:                              # %if.end68
                                        #   in Loop: Header=BB99_20 Depth=1
	movl	$0, 220(%rsp)
	jmp	.LBB99_34
	.align	16, 0x90
.LBB99_38:                              # %if.else85
                                        #   in Loop: Header=BB99_34 Depth=2
	movl	100(%rsp), %eax
	decl	%eax
	movslq	%eax, %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	220(%rsp), %rcx
	movb	$15, 37708(%rcx,%rax)
	incl	220(%rsp)
.LBB99_34:                              # %for.cond69
                                        #   Parent Loop BB99_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	220(%rsp), %eax
	cmpl	176(%rsp), %eax
	jge	.LBB99_39
# BB#35:                                # %for.body72
                                        #   in Loop: Header=BB99_34 Depth=2
	movl	220(%rsp), %eax
	cmpl	204(%rsp), %eax
	jl	.LBB99_38
# BB#36:                                # %land.lhs.true75
                                        #   in Loop: Header=BB99_34 Depth=2
	movl	220(%rsp), %eax
	cmpl	200(%rsp), %eax
	jg	.LBB99_38
# BB#37:                                # %if.then78
                                        #   in Loop: Header=BB99_34 Depth=2
	movl	100(%rsp), %eax
	decl	%eax
	movslq	%eax, %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	220(%rsp), %rcx
	movb	$0, 37708(%rcx,%rax)
	incl	220(%rsp)
	jmp	.LBB99_34
.LBB99_40:                              # %while.end99
	movl	$0, 184(%rsp)
	jmp	.LBB99_41
	.align	16, 0x90
.LBB99_91:                              # %for.inc1702
                                        #   in Loop: Header=BB99_41 Depth=1
	incl	184(%rsp)
.LBB99_41:                              # %for.cond100
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_43 Depth 2
                                        #     Child Loop BB99_46 Depth 2
                                        #       Child Loop BB99_48 Depth 3
                                        #     Child Loop BB99_53 Depth 2
                                        #     Child Loop BB99_56 Depth 2
                                        #       Child Loop BB99_60 Depth 3
                                        #       Child Loop BB99_71 Depth 3
                                        #         Child Loop BB99_73 Depth 4
                                        #       Child Loop BB99_66 Depth 3
                                        #       Child Loop BB99_81 Depth 3
                                        #     Child Loop BB99_85 Depth 2
                                        #     Child Loop BB99_89 Depth 2
	cmpl	$3, 184(%rsp)
	jg	.LBB99_92
# BB#42:                                # %for.body103
                                        #   in Loop: Header=BB99_41 Depth=1
	movl	$0, 216(%rsp)
	jmp	.LBB99_43
	.align	16, 0x90
.LBB99_44:                              # %for.inc110
                                        #   in Loop: Header=BB99_43 Depth=2
	movslq	216(%rsp), %rax
	movl	$0, 112(%rsp,%rax,4)
	incl	216(%rsp)
.LBB99_43:                              # %for.cond104
                                        #   Parent Loop BB99_41 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jl	.LBB99_44
# BB#45:                                # %for.end112
                                        #   in Loop: Header=BB99_41 Depth=1
	movl	$0, 216(%rsp)
	jmp	.LBB99_46
	.align	16, 0x90
.LBB99_50:                              # %for.inc128
                                        #   in Loop: Header=BB99_46 Depth=2
	incl	216(%rsp)
.LBB99_46:                              # %for.cond113
                                        #   Parent Loop BB99_41 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB99_48 Depth 3
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jge	.LBB99_51
# BB#47:                                # %for.body116
                                        #   in Loop: Header=BB99_46 Depth=2
	movl	$0, 220(%rsp)
	jmp	.LBB99_48
	.align	16, 0x90
.LBB99_49:                              # %for.inc125
                                        #   in Loop: Header=BB99_48 Depth=3
	movslq	216(%rsp), %rax
	imulq	$1032, %rax, %rax       # imm = 0x408
	addq	224(%rsp), %rax
	movslq	220(%rsp), %rcx
	movl	$0, 45448(%rax,%rcx,4)
	incl	220(%rsp)
.LBB99_48:                              # %for.cond117
                                        #   Parent Loop BB99_41 Depth=1
                                        #     Parent Loop BB99_46 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	220(%rsp), %eax
	cmpl	176(%rsp), %eax
	jge	.LBB99_50
	jmp	.LBB99_49
	.align	16, 0x90
.LBB99_51:                              # %for.end130
                                        #   in Loop: Header=BB99_41 Depth=1
	cmpl	$6, 160(%rsp)
	jne	.LBB99_55
# BB#52:                                # %if.then133
                                        #   in Loop: Header=BB99_41 Depth=1
	movl	$0, 220(%rsp)
	jmp	.LBB99_53
	.align	16, 0x90
.LBB99_54:                              # %for.inc183
                                        #   in Loop: Header=BB99_53 Depth=2
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
	incl	220(%rsp)
.LBB99_53:                              # %for.cond134
                                        #   Parent Loop BB99_41 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	220(%rsp), %eax
	cmpl	176(%rsp), %eax
	jl	.LBB99_54
.LBB99_55:                              # %if.end186
                                        #   in Loop: Header=BB99_41 Depth=1
	movl	$0, 180(%rsp)
	movl	$0, 196(%rsp)
	movl	$0, 204(%rsp)
	jmp	.LBB99_56
	.align	16, 0x90
.LBB99_79:                              # %if.end1665
                                        #   in Loop: Header=BB99_56 Depth=2
	movl	200(%rsp), %eax
	incl	%eax
	movl	%eax, 204(%rsp)
.LBB99_56:                              # %while.body188
                                        #   Parent Loop BB99_41 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB99_60 Depth 3
                                        #       Child Loop BB99_71 Depth 3
                                        #         Child Loop BB99_73 Depth 4
                                        #       Child Loop BB99_66 Depth 3
                                        #       Child Loop BB99_81 Depth 3
	movq	224(%rsp), %rax
	movl	204(%rsp), %ecx
	cmpl	668(%rax), %ecx
	jge	.LBB99_83
# BB#57:                                # %if.end193
                                        #   in Loop: Header=BB99_56 Depth=2
	movl	204(%rsp), %eax
	addl	$49, %eax
	movl	%eax, 200(%rsp)
	movq	224(%rsp), %rcx
	cmpl	668(%rcx), %eax
	jl	.LBB99_59
# BB#58:                                # %if.then199
                                        #   in Loop: Header=BB99_56 Depth=2
	movq	224(%rsp), %rax
	movl	668(%rax), %eax
	decl	%eax
	movl	%eax, 200(%rsp)
.LBB99_59:                              # %if.end202
                                        #   in Loop: Header=BB99_56 Depth=2
	movl	$0, 216(%rsp)
	jmp	.LBB99_60
	.align	16, 0x90
.LBB99_61:                              # %for.inc209
                                        #   in Loop: Header=BB99_60 Depth=3
	movslq	216(%rsp), %rax
	movw	$0, 144(%rsp,%rax,2)
	incl	216(%rsp)
.LBB99_60:                              # %for.cond203
                                        #   Parent Loop BB99_41 Depth=1
                                        #     Parent Loop BB99_56 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jl	.LBB99_61
# BB#62:                                # %for.end211
                                        #   in Loop: Header=BB99_56 Depth=2
	cmpl	$6, 160(%rsp)
	jne	.LBB99_70
# BB#63:                                # %land.lhs.true214
                                        #   in Loop: Header=BB99_56 Depth=2
	movl	200(%rsp), %eax
	subl	204(%rsp), %eax
	cmpl	$49, %eax
	jne	.LBB99_70
# BB#64:                                # %if.then219
                                        #   in Loop: Header=BB99_56 Depth=2
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
	jmp	.LBB99_65
	.align	16, 0x90
.LBB99_70:                              # %if.else1136
                                        #   in Loop: Header=BB99_56 Depth=2
	movl	204(%rsp), %eax
	movl	%eax, 212(%rsp)
	jmp	.LBB99_71
	.align	16, 0x90
.LBB99_75:                              # %for.inc1162
                                        #   in Loop: Header=BB99_71 Depth=3
	incl	212(%rsp)
.LBB99_71:                              # %for.cond1137
                                        #   Parent Loop BB99_41 Depth=1
                                        #     Parent Loop BB99_56 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB99_73 Depth 4
	movl	212(%rsp), %eax
	cmpl	200(%rsp), %eax
	jg	.LBB99_65
# BB#72:                                # %for.body1140
                                        #   in Loop: Header=BB99_71 Depth=3
	movslq	212(%rsp), %rax
	movq	104(%rsp), %rcx
	movw	(%rcx,%rax,2), %ax
	movw	%ax, 72(%rsp)
	movl	$0, 216(%rsp)
	jmp	.LBB99_73
	.align	16, 0x90
.LBB99_74:                              # %for.inc1159
                                        #   in Loop: Header=BB99_73 Depth=4
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rcx        # imm = 0x102
	addq	224(%rsp), %rcx
	movzwl	72(%rsp), %edx
	movzbl	37708(%rdx,%rcx), %edx
	movzwl	144(%rsp,%rax,2), %ecx
	addl	%edx, %ecx
	movw	%cx, 144(%rsp,%rax,2)
	incl	216(%rsp)
.LBB99_73:                              # %for.cond1144
                                        #   Parent Loop BB99_41 Depth=1
                                        #     Parent Loop BB99_56 Depth=2
                                        #       Parent Loop BB99_71 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jge	.LBB99_75
	jmp	.LBB99_74
	.align	16, 0x90
.LBB99_65:                              # %if.end1165
                                        #   in Loop: Header=BB99_56 Depth=2
	movl	$999999999, 188(%rsp)   # imm = 0x3B9AC9FF
	movl	$-1, 192(%rsp)
	movl	$0, 216(%rsp)
	jmp	.LBB99_66
	.align	16, 0x90
.LBB99_69:                              # %for.inc1180
                                        #   in Loop: Header=BB99_66 Depth=3
	incl	216(%rsp)
.LBB99_66:                              # %for.cond1166
                                        #   Parent Loop BB99_41 Depth=1
                                        #     Parent Loop BB99_56 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jge	.LBB99_76
# BB#67:                                # %for.body1169
                                        #   in Loop: Header=BB99_66 Depth=3
	movslq	216(%rsp), %rax
	movzwl	144(%rsp,%rax,2), %eax
	cmpl	188(%rsp), %eax
	jge	.LBB99_69
# BB#68:                                # %if.then1175
                                        #   in Loop: Header=BB99_66 Depth=3
	movslq	216(%rsp), %rax
	movzwl	144(%rsp,%rax,2), %eax
	movl	%eax, 188(%rsp)
	movl	216(%rsp), %eax
	movl	%eax, 192(%rsp)
	jmp	.LBB99_69
	.align	16, 0x90
.LBB99_76:                              # %for.end1182
                                        #   in Loop: Header=BB99_56 Depth=2
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
	jne	.LBB99_80
# BB#77:                                # %land.lhs.true1193
                                        #   in Loop: Header=BB99_56 Depth=2
	movl	200(%rsp), %eax
	subl	204(%rsp), %eax
	cmpl	$49, %eax
	jne	.LBB99_80
# BB#78:                                # %if.then1198
                                        #   in Loop: Header=BB99_56 Depth=2
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
	jmp	.LBB99_79
	.align	16, 0x90
.LBB99_80:                              # %if.else1649
                                        #   in Loop: Header=BB99_56 Depth=2
	movl	204(%rsp), %eax
	movl	%eax, 212(%rsp)
	jmp	.LBB99_81
	.align	16, 0x90
.LBB99_82:                              # %for.inc1662
                                        #   in Loop: Header=BB99_81 Depth=3
	movslq	212(%rsp), %rax
	movq	104(%rsp), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movslq	192(%rsp), %rcx
	imulq	$1032, %rcx, %rcx       # imm = 0x408
	addq	224(%rsp), %rcx
	incl	45448(%rcx,%rax,4)
	incl	212(%rsp)
.LBB99_81:                              # %for.cond1650
                                        #   Parent Loop BB99_41 Depth=1
                                        #     Parent Loop BB99_56 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	212(%rsp), %eax
	cmpl	200(%rsp), %eax
	jg	.LBB99_79
	jmp	.LBB99_82
	.align	16, 0x90
.LBB99_83:                              # %while.end1667
                                        #   in Loop: Header=BB99_41 Depth=1
	movq	224(%rsp), %rax
	cmpl	$3, 656(%rax)
	jl	.LBB99_88
# BB#84:                                # %if.then1671
                                        #   in Loop: Header=BB99_41 Depth=1
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
	jmp	.LBB99_85
	.align	16, 0x90
.LBB99_86:                              # %for.inc1682
                                        #   in Loop: Header=BB99_85 Depth=2
	movslq	216(%rsp), %rax
	movl	112(%rsp,%rax,4), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str5153, %esi
	xorb	%al, %al
	callq	fprintf
	incl	216(%rsp)
.LBB99_85:                              # %for.cond1675
                                        #   Parent Loop BB99_41 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jl	.LBB99_86
# BB#87:                                # %for.end1684
                                        #   in Loop: Header=BB99_41 Depth=1
	movq	stderr(%rip), %rdi
	movl	$.L.str6154, %esi
	xorb	%al, %al
	callq	fprintf
.LBB99_88:                              # %if.end1686
                                        #   in Loop: Header=BB99_41 Depth=1
	movl	$0, 216(%rsp)
	jmp	.LBB99_89
	.align	16, 0x90
.LBB99_90:                              # %for.inc1699
                                        #   in Loop: Header=BB99_89 Depth=2
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rdx        # imm = 0x102
	movq	224(%rsp), %rcx
	leaq	37708(%rcx,%rdx), %rdi
	imulq	$1032, %rax, %rax       # imm = 0x408
	leaq	45448(%rcx,%rax), %rsi
	movl	176(%rsp), %edx
	movl	$17, %ecx
	callq	BZ2_hbMakeCodeLengths
	incl	216(%rsp)
.LBB99_89:                              # %for.cond1687
                                        #   Parent Loop BB99_41 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jge	.LBB99_91
	jmp	.LBB99_90
.LBB99_92:                              # %for.end1704
	cmpl	$8, 160(%rsp)
	jl	.LBB99_94
# BB#93:                                # %if.then1707
	movl	$3002, %edi             # imm = 0xBBA
	callq	BZ2_bz__AssertH__fail
.LBB99_94:                              # %if.end1708
	cmpl	$32767, 180(%rsp)       # imm = 0x7FFF
	jg	.LBB99_96
# BB#95:                                # %land.lhs.true1711
	cmpl	$18003, 180(%rsp)       # imm = 0x4653
	jl	.LBB99_97
.LBB99_96:                              # %if.then1714
	movl	$3003, %edi             # imm = 0xBBB
	callq	BZ2_bz__AssertH__fail
.LBB99_97:                              # %if.end1715
	movl	$0, 212(%rsp)
	jmp	.LBB99_98
	.align	16, 0x90
.LBB99_99:                              # %for.inc1723
                                        #   in Loop: Header=BB99_98 Depth=1
	movslq	212(%rsp), %rax
	movb	%al, 66(%rsp,%rax)
	incl	212(%rsp)
.LBB99_98:                              # %for.cond1716
                                        # =>This Inner Loop Header: Depth=1
	movl	212(%rsp), %eax
	cmpl	160(%rsp), %eax
	jl	.LBB99_99
# BB#100:                               # %for.end1725
	movl	$0, 212(%rsp)
	jmp	.LBB99_101
	.align	16, 0x90
.LBB99_105:                             # %for.inc1751
                                        #   in Loop: Header=BB99_101 Depth=1
	movb	63(%rsp), %al
	movb	%al, 66(%rsp)
	movq	224(%rsp), %rax
	movslq	212(%rsp), %rcx
	movb	208(%rsp), %dl
	movb	%dl, 19706(%rax,%rcx)
	incl	212(%rsp)
.LBB99_101:                             # %for.cond1726
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_103 Depth 2
	movl	212(%rsp), %eax
	cmpl	180(%rsp), %eax
	jge	.LBB99_106
# BB#102:                               # %for.body1729
                                        #   in Loop: Header=BB99_101 Depth=1
	movslq	212(%rsp), %rax
	movq	224(%rsp), %rcx
	movb	1704(%rcx,%rax), %al
	movb	%al, 65(%rsp)
	movl	$0, 208(%rsp)
	movslq	208(%rsp), %rax
	movb	66(%rsp,%rax), %al
	movb	%al, 63(%rsp)
	jmp	.LBB99_103
	.align	16, 0x90
.LBB99_104:                             # %while.body1740
                                        #   in Loop: Header=BB99_103 Depth=2
	incl	208(%rsp)
	movb	63(%rsp), %al
	movb	%al, 64(%rsp)
	movslq	208(%rsp), %rax
	movb	66(%rsp,%rax), %al
	movb	%al, 63(%rsp)
	movslq	208(%rsp), %rax
	movb	64(%rsp), %cl
	movb	%cl, 66(%rsp,%rax)
.LBB99_103:                             # %while.cond1735
                                        #   Parent Loop BB99_101 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	63(%rsp), %eax
	movzbl	65(%rsp), %ecx
	cmpl	%eax, %ecx
	je	.LBB99_105
	jmp	.LBB99_104
.LBB99_106:                             # %for.end1753
	movl	$0, 216(%rsp)
	jmp	.LBB99_107
	.align	16, 0x90
.LBB99_119:                             # %for.inc1812
                                        #   in Loop: Header=BB99_107 Depth=1
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
	incl	216(%rsp)
.LBB99_107:                             # %for.cond1754
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_109 Depth 2
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jge	.LBB99_120
# BB#108:                               # %for.body1757
                                        #   in Loop: Header=BB99_107 Depth=1
	movl	$32, 172(%rsp)
	movl	$0, 168(%rsp)
	movl	$0, 212(%rsp)
	jmp	.LBB99_109
	.align	16, 0x90
.LBB99_114:                             # %for.inc1794
                                        #   in Loop: Header=BB99_109 Depth=2
	incl	212(%rsp)
.LBB99_109:                             # %for.cond1758
                                        #   Parent Loop BB99_107 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	212(%rsp), %eax
	cmpl	176(%rsp), %eax
	jge	.LBB99_115
# BB#110:                               # %for.body1761
                                        #   in Loop: Header=BB99_109 Depth=2
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	212(%rsp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	cmpl	168(%rsp), %eax
	jle	.LBB99_112
# BB#111:                               # %if.then1770
                                        #   in Loop: Header=BB99_109 Depth=2
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	212(%rsp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	movl	%eax, 168(%rsp)
.LBB99_112:                             # %if.end1777
                                        #   in Loop: Header=BB99_109 Depth=2
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	212(%rsp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	cmpl	172(%rsp), %eax
	jge	.LBB99_114
# BB#113:                               # %if.then1786
                                        #   in Loop: Header=BB99_109 Depth=2
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	212(%rsp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	movl	%eax, 172(%rsp)
	jmp	.LBB99_114
	.align	16, 0x90
.LBB99_115:                             # %for.end1796
                                        #   in Loop: Header=BB99_107 Depth=1
	cmpl	$18, 168(%rsp)
	jl	.LBB99_117
# BB#116:                               # %if.then1799
                                        #   in Loop: Header=BB99_107 Depth=1
	movl	$3004, %edi             # imm = 0xBBC
	callq	BZ2_bz__AssertH__fail
.LBB99_117:                             # %if.end1800
                                        #   in Loop: Header=BB99_107 Depth=1
	cmpl	$0, 172(%rsp)
	jg	.LBB99_119
# BB#118:                               # %if.then1803
                                        #   in Loop: Header=BB99_107 Depth=1
	movl	$3005, %edi             # imm = 0xBBD
	callq	BZ2_bz__AssertH__fail
	jmp	.LBB99_119
.LBB99_120:                             # %for.end1814
	movl	$0, 212(%rsp)
	jmp	.LBB99_121
	.align	16, 0x90
.LBB99_127:                             # %for.inc1837
                                        #   in Loop: Header=BB99_121 Depth=1
	incl	212(%rsp)
.LBB99_121:                             # %for.cond1816
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_123 Depth 2
	cmpl	$15, 212(%rsp)
	jg	.LBB99_128
# BB#122:                               # %for.body1819
                                        #   in Loop: Header=BB99_121 Depth=1
	movslq	212(%rsp), %rax
	movb	$0, 32(%rsp,%rax)
	movl	$0, 208(%rsp)
	jmp	.LBB99_123
	.align	16, 0x90
.LBB99_126:                             # %for.inc1834
                                        #   in Loop: Header=BB99_123 Depth=2
	incl	208(%rsp)
.LBB99_123:                             # %for.cond1822
                                        #   Parent Loop BB99_121 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$15, 208(%rsp)
	jg	.LBB99_127
# BB#124:                               # %for.body1825
                                        #   in Loop: Header=BB99_123 Depth=2
	movl	212(%rsp), %eax
	shll	$4, %eax
	addl	208(%rsp), %eax
	movslq	%eax, %rax
	movq	224(%rsp), %rcx
	cmpb	$0, 128(%rcx,%rax)
	je	.LBB99_126
# BB#125:                               # %if.then1830
                                        #   in Loop: Header=BB99_123 Depth=2
	movslq	212(%rsp), %rax
	movb	$1, 32(%rsp,%rax)
	jmp	.LBB99_126
.LBB99_128:                             # %for.end1839
	movq	224(%rsp), %rax
	movl	116(%rax), %eax
	movl	%eax, 156(%rsp)
	movl	$0, 212(%rsp)
	jmp	.LBB99_129
	.align	16, 0x90
.LBB99_132:                             # %if.then1847
                                        #   in Loop: Header=BB99_129 Depth=1
	callq	bsW
	incl	212(%rsp)
.LBB99_129:                             # %for.cond1840
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$15, 212(%rsp)
	jg	.LBB99_134
# BB#130:                               # %for.body1843
                                        #   in Loop: Header=BB99_129 Depth=1
	movslq	212(%rsp), %rax
	cmpb	$0, 32(%rsp,%rax)
	je	.LBB99_133
# BB#131:                               # %if.then1847
                                        #   in Loop: Header=BB99_129 Depth=1
	movq	224(%rsp), %rdi
	movl	$1, %esi
	movl	$1, %edx
	jmp	.LBB99_132
	.align	16, 0x90
.LBB99_133:                             # %if.else1848
                                        #   in Loop: Header=BB99_129 Depth=1
	movq	224(%rsp), %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	jmp	.LBB99_132
.LBB99_134:                             # %for.end1852
	movl	$0, 212(%rsp)
	jmp	.LBB99_135
	.align	16, 0x90
.LBB99_143:                             # %for.inc1878
                                        #   in Loop: Header=BB99_135 Depth=1
	incl	212(%rsp)
.LBB99_135:                             # %for.cond1853
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_138 Depth 2
	cmpl	$15, 212(%rsp)
	jg	.LBB99_144
# BB#136:                               # %for.body1856
                                        #   in Loop: Header=BB99_135 Depth=1
	movslq	212(%rsp), %rax
	cmpb	$0, 32(%rsp,%rax)
	je	.LBB99_143
# BB#137:                               # %if.then1860
                                        #   in Loop: Header=BB99_135 Depth=1
	movl	$0, 208(%rsp)
	jmp	.LBB99_138
	.align	16, 0x90
.LBB99_141:                             # %if.then1871
                                        #   in Loop: Header=BB99_138 Depth=2
	callq	bsW
	incl	208(%rsp)
.LBB99_138:                             # %for.cond1861
                                        #   Parent Loop BB99_135 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$15, 208(%rsp)
	jg	.LBB99_143
# BB#139:                               # %for.body1864
                                        #   in Loop: Header=BB99_138 Depth=2
	movl	212(%rsp), %eax
	shll	$4, %eax
	addl	208(%rsp), %eax
	movslq	%eax, %rax
	movq	224(%rsp), %rcx
	cmpb	$0, 128(%rcx,%rax)
	je	.LBB99_142
# BB#140:                               # %if.then1871
                                        #   in Loop: Header=BB99_138 Depth=2
	movq	224(%rsp), %rdi
	movl	$1, %esi
	movl	$1, %edx
	jmp	.LBB99_141
	.align	16, 0x90
.LBB99_142:                             # %if.else1872
                                        #   in Loop: Header=BB99_138 Depth=2
	movq	224(%rsp), %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	jmp	.LBB99_141
.LBB99_144:                             # %for.end1880
	movq	224(%rsp), %rax
	cmpl	$3, 656(%rax)
	jl	.LBB99_146
# BB#145:                               # %if.then1884
	movq	224(%rsp), %rax
	movl	116(%rax), %edx
	subl	156(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str7155, %esi
	xorb	%al, %al
	callq	fprintf
.LBB99_146:                             # %if.end1888
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
	jmp	.LBB99_147
	.align	16, 0x90
.LBB99_151:                             # %for.inc1905
                                        #   in Loop: Header=BB99_147 Depth=1
	movq	224(%rsp), %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	bsW
	incl	212(%rsp)
.LBB99_147:                             # %for.cond1890
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_149 Depth 2
	movl	212(%rsp), %eax
	cmpl	180(%rsp), %eax
	jge	.LBB99_152
# BB#148:                               # %for.body1893
                                        #   in Loop: Header=BB99_147 Depth=1
	movl	$0, 208(%rsp)
	jmp	.LBB99_149
	.align	16, 0x90
.LBB99_150:                             # %for.inc1902
                                        #   in Loop: Header=BB99_149 Depth=2
	movq	224(%rsp), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	bsW
	incl	208(%rsp)
.LBB99_149:                             # %for.cond1894
                                        #   Parent Loop BB99_147 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	212(%rsp), %rax
	movq	224(%rsp), %rcx
	movzbl	19706(%rcx,%rax), %eax
	cmpl	%eax, 208(%rsp)
	jge	.LBB99_151
	jmp	.LBB99_150
.LBB99_152:                             # %for.end1907
	movq	224(%rsp), %rax
	cmpl	$3, 656(%rax)
	jl	.LBB99_154
# BB#153:                               # %if.then1911
	movq	224(%rsp), %rax
	movl	116(%rax), %edx
	subl	156(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str8156, %esi
	xorb	%al, %al
	callq	fprintf
.LBB99_154:                             # %if.end1915
	movq	224(%rsp), %rax
	movl	116(%rax), %eax
	movl	%eax, 156(%rsp)
	movl	$0, 216(%rsp)
	jmp	.LBB99_155
	.align	16, 0x90
.LBB99_163:                             # %for.inc1958
                                        #   in Loop: Header=BB99_155 Depth=1
	incl	216(%rsp)
.LBB99_155:                             # %for.cond1917
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_157 Depth 2
                                        #       Child Loop BB99_158 Depth 3
                                        #       Child Loop BB99_160 Depth 3
	movl	216(%rsp), %eax
	cmpl	160(%rsp), %eax
	jge	.LBB99_164
# BB#156:                               # %for.body1920
                                        #   in Loop: Header=BB99_155 Depth=1
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	movq	224(%rsp), %rcx
	movzbl	37708(%rcx,%rax), %edx
	movl	%edx, 28(%rsp)
	movq	224(%rsp), %rdi
	movl	$5, %esi
	callq	bsW
	movl	$0, 212(%rsp)
	jmp	.LBB99_157
	.align	16, 0x90
.LBB99_162:                             # %for.inc1955
                                        #   in Loop: Header=BB99_157 Depth=2
	movq	224(%rsp), %rdi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	bsW
	incl	212(%rsp)
.LBB99_157:                             # %for.cond1927
                                        #   Parent Loop BB99_155 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB99_158 Depth 3
                                        #       Child Loop BB99_160 Depth 3
	movl	212(%rsp), %eax
	cmpl	176(%rsp), %eax
	jge	.LBB99_163
	jmp	.LBB99_158
	.align	16, 0x90
.LBB99_159:                             # %while.body1940
                                        #   in Loop: Header=BB99_158 Depth=3
	movq	224(%rsp), %rdi
	movl	$2, %esi
	movl	$2, %edx
	callq	bsW
	incl	28(%rsp)
.LBB99_158:                             # %while.cond1931
                                        #   Parent Loop BB99_155 Depth=1
                                        #     Parent Loop BB99_157 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	212(%rsp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	cmpl	%eax, 28(%rsp)
	jge	.LBB99_160
	jmp	.LBB99_159
	.align	16, 0x90
.LBB99_161:                             # %while.body1952
                                        #   in Loop: Header=BB99_160 Depth=3
	movq	224(%rsp), %rdi
	movl	$2, %esi
	movl	$3, %edx
	callq	bsW
	decl	28(%rsp)
.LBB99_160:                             # %while.cond1943
                                        #   Parent Loop BB99_155 Depth=1
                                        #     Parent Loop BB99_157 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	216(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	224(%rsp), %rax
	movslq	212(%rsp), %rcx
	movzbl	37708(%rcx,%rax), %eax
	cmpl	%eax, 28(%rsp)
	jle	.LBB99_162
	jmp	.LBB99_161
.LBB99_164:                             # %for.end1960
	movq	224(%rsp), %rax
	cmpl	$3, 656(%rax)
	jl	.LBB99_166
# BB#165:                               # %if.then1964
	movq	224(%rsp), %rax
	movl	116(%rax), %edx
	subl	156(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str9157, %esi
	xorb	%al, %al
	callq	fprintf
.LBB99_166:                             # %if.end1968
	movq	224(%rsp), %rax
	movl	116(%rax), %eax
	movl	%eax, 156(%rsp)
	movl	$0, 164(%rsp)
	movl	$0, 204(%rsp)
	jmp	.LBB99_167
	.align	16, 0x90
.LBB99_175:                             # %if.end2448
                                        #   in Loop: Header=BB99_167 Depth=1
	movl	200(%rsp), %eax
	incl	%eax
	movl	%eax, 204(%rsp)
	incl	164(%rsp)
.LBB99_167:                             # %while.body1971
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB99_177 Depth 2
	movq	224(%rsp), %rax
	movl	204(%rsp), %ecx
	cmpl	668(%rax), %ecx
	jge	.LBB99_179
# BB#168:                               # %if.end1976
                                        #   in Loop: Header=BB99_167 Depth=1
	movl	204(%rsp), %eax
	addl	$49, %eax
	movl	%eax, 200(%rsp)
	movq	224(%rsp), %rcx
	cmpl	668(%rcx), %eax
	jl	.LBB99_170
# BB#169:                               # %if.then1982
                                        #   in Loop: Header=BB99_167 Depth=1
	movq	224(%rsp), %rax
	movl	668(%rax), %eax
	decl	%eax
	movl	%eax, 200(%rsp)
.LBB99_170:                             # %if.end1985
                                        #   in Loop: Header=BB99_167 Depth=1
	movslq	164(%rsp), %rax
	movq	224(%rsp), %rcx
	movzbl	1704(%rcx,%rax), %eax
	cmpl	160(%rsp), %eax
	jl	.LBB99_172
# BB#171:                               # %if.then1992
                                        #   in Loop: Header=BB99_167 Depth=1
	movl	$3006, %edi             # imm = 0xBBE
	callq	BZ2_bz__AssertH__fail
.LBB99_172:                             # %if.end1993
                                        #   in Loop: Header=BB99_167 Depth=1
	cmpl	$6, 160(%rsp)
	jne	.LBB99_176
# BB#173:                               # %land.lhs.true1996
                                        #   in Loop: Header=BB99_167 Depth=1
	movl	200(%rsp), %eax
	subl	204(%rsp), %eax
	cmpl	$49, %eax
	jne	.LBB99_176
# BB#174:                               # %if.then2001
                                        #   in Loop: Header=BB99_167 Depth=1
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
	jmp	.LBB99_175
	.align	16, 0x90
.LBB99_176:                             # %if.else2419
                                        #   in Loop: Header=BB99_167 Depth=1
	movl	204(%rsp), %eax
	movl	%eax, 212(%rsp)
	jmp	.LBB99_177
	.align	16, 0x90
.LBB99_178:                             # %for.inc2445
                                        #   in Loop: Header=BB99_177 Depth=2
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
	incl	212(%rsp)
.LBB99_177:                             # %for.cond2420
                                        #   Parent Loop BB99_167 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	212(%rsp), %eax
	cmpl	200(%rsp), %eax
	jg	.LBB99_175
	jmp	.LBB99_178
.LBB99_179:                             # %while.end2451
	movl	164(%rsp), %eax
	cmpl	180(%rsp), %eax
	je	.LBB99_181
# BB#180:                               # %if.then2454
	movl	$3007, %edi             # imm = 0xBBF
	callq	BZ2_bz__AssertH__fail
.LBB99_181:                             # %if.end2455
	movq	224(%rsp), %rax
	cmpl	$3, 656(%rax)
	jl	.LBB99_183
# BB#182:                               # %if.then2459
	movq	224(%rsp), %rax
	movl	116(%rax), %edx
	subl	156(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str10158, %esi
	xorb	%al, %al
	callq	fprintf
.LBB99_183:                             # %if.end2463
	addq	$232, %rsp
	ret
.Ltmp354:
	.size	sendMTFValues, .Ltmp354-sendMTFValues
	.cfi_endproc

	.align	16, 0x90
	.type	bsFinishWrite,@function
bsFinishWrite:                          # @bsFinishWrite
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -8(%rsp)
	jmp	.LBB100_1
	.align	16, 0x90
.LBB100_2:                              # %while.body
                                        #   in Loop: Header=BB100_1 Depth=1
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
.LBB100_1:                              # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-8(%rsp), %rax
	cmpl	$0, 644(%rax)
	jg	.LBB100_2
# BB#3:                                 # %while.end
	ret
.Ltmp355:
	.size	bsFinishWrite, .Ltmp355-bsFinishWrite
	.cfi_endproc

	.align	16, 0x90
	.type	makeMaps_e,@function
makeMaps_e:                             # @makeMaps_e
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -8(%rsp)
	movl	$0, 124(%rdi)
	movl	$0, -12(%rsp)
	jmp	.LBB101_1
	.align	16, 0x90
.LBB101_4:                              # %for.inc
                                        #   in Loop: Header=BB101_1 Depth=1
	incl	-12(%rsp)
.LBB101_1:                              # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$255, -12(%rsp)
	jg	.LBB101_5
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB101_1 Depth=1
	movslq	-12(%rsp), %rax
	movq	-8(%rsp), %rcx
	cmpb	$0, 128(%rcx,%rax)
	je	.LBB101_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB101_1 Depth=1
	movq	-8(%rsp), %rax
	movb	124(%rax), %cl
	movslq	-12(%rsp), %rdx
	movb	%cl, 384(%rax,%rdx)
	movq	-8(%rsp), %rax
	incl	124(%rax)
	jmp	.LBB101_4
.LBB101_5:                              # %for.end
	ret
.Ltmp356:
	.size	makeMaps_e, .Ltmp356-makeMaps_e
	.cfi_endproc

	.globl	BZ2_decompress
	.align	16, 0x90
	.type	BZ2_decompress,@function
BZ2_decompress:                         # @BZ2_decompress
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$376, %rsp              # imm = 0x178
.Ltmp358:
	.cfi_def_cfa_offset 384
	movq	%rdi, 368(%rsp)
	movq	(%rdi), %rax
	movq	%rax, 344(%rsp)
	movq	368(%rsp), %rax
	cmpl	$10, 8(%rax)
	jne	.LBB102_2
# BB#1:                                 # %if.then
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
.LBB102_2:                              # %if.end
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
	jbe	.LBB102_3
# BB#517:                               # %sw.epilog
	movl	$4001, %edi             # imm = 0xFA1
	callq	BZ2_bz__AssertH__fail
	movl	$4002, %edi             # imm = 0xFA2
	callq	BZ2_bz__AssertH__fail
.LBB102_518:                            # %save_state_and_return
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
.LBB102_3:                              # %if.end
	jmpq	*.LJTI102_0(,%rax,8)
.LBB102_4:                              # %sw.bb
	movq	368(%rsp), %rax
	movl	$10, 8(%rax)
	jmp	.LBB102_5
.LBB102_9:                              # %if.then53
                                        #   in Loop: Header=BB102_5 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_5:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_10
# BB#6:                                 # %if.end33
                                        #   in Loop: Header=BB102_5 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_7
# BB#8:                                 # %if.end38
                                        #   in Loop: Header=BB102_5 Depth=1
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
	jne	.LBB102_5
	jmp	.LBB102_9
.LBB102_10:                             # %while.end
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
	movzbl	367(%rsp), %eax
	cmpl	$66, %eax
	je	.LBB102_12
# BB#11:                                # %if.then60
	movl	$-5, 360(%rsp)
	jmp	.LBB102_518
.LBB102_12:                             # %sw.bb62
	movq	368(%rsp), %rax
	movl	$11, 8(%rax)
	jmp	.LBB102_13
.LBB102_17:                             # %if.then107
                                        #   in Loop: Header=BB102_13 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_13:                             # %while.body64
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_18
# BB#14:                                # %if.end78
                                        #   in Loop: Header=BB102_13 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_15
# BB#16:                                # %if.end84
                                        #   in Loop: Header=BB102_13 Depth=1
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
	jne	.LBB102_13
	jmp	.LBB102_17
.LBB102_18:                             # %while.end112
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
	movzbl	367(%rsp), %eax
	cmpl	$90, %eax
	je	.LBB102_20
# BB#19:                                # %if.then116
	movl	$-5, 360(%rsp)
	jmp	.LBB102_518
.LBB102_20:                             # %sw.bb118
	movq	368(%rsp), %rax
	movl	$12, 8(%rax)
	jmp	.LBB102_21
.LBB102_25:                             # %if.then163
                                        #   in Loop: Header=BB102_21 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_21:                             # %while.body120
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_26
# BB#22:                                # %if.end134
                                        #   in Loop: Header=BB102_21 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_23
# BB#24:                                # %if.end140
                                        #   in Loop: Header=BB102_21 Depth=1
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
	jne	.LBB102_21
	jmp	.LBB102_25
.LBB102_15:                             # %if.then83
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_26:                             # %while.end168
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
	movzbl	367(%rsp), %eax
	cmpl	$104, %eax
	je	.LBB102_28
# BB#27:                                # %if.then172
	movl	$-5, 360(%rsp)
	jmp	.LBB102_518
.LBB102_28:                             # %sw.bb174
	movq	368(%rsp), %rax
	movl	$13, 8(%rax)
	jmp	.LBB102_29
.LBB102_33:                             # %if.then218
                                        #   in Loop: Header=BB102_29 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_29:                             # %while.body176
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_34
# BB#30:                                # %if.end189
                                        #   in Loop: Header=BB102_29 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_31
# BB#32:                                # %if.end195
                                        #   in Loop: Header=BB102_29 Depth=1
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
	jne	.LBB102_29
	jmp	.LBB102_33
.LBB102_23:                             # %if.then139
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_34:                             # %while.end223
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
	movq	368(%rsp), %rax
	cmpl	$49, 40(%rax)
	jl	.LBB102_36
# BB#35:                                # %lor.lhs.false
	movq	368(%rsp), %rax
	cmpl	$58, 40(%rax)
	jl	.LBB102_37
.LBB102_36:                             # %if.then230
	movl	$-5, 360(%rsp)
	jmp	.LBB102_518
.LBB102_31:                             # %if.then194
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_7:                              # %if.then37
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_37:                             # %if.end231
	movq	368(%rsp), %rax
	addl	$-48, 40(%rax)
	movq	368(%rsp), %rax
	cmpb	$0, 44(%rax)
	je	.LBB102_41
# BB#38:                                # %if.then234
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
	je	.LBB102_40
# BB#39:                                # %lor.lhs.false252
	movq	368(%rsp), %rax
	cmpq	$0, 3168(%rax)
	jne	.LBB102_43
.LBB102_40:                             # %if.then256
	movl	$-3, 360(%rsp)
	jmp	.LBB102_518
.LBB102_41:                             # %if.else
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
	je	.LBB102_42
.LBB102_43:                             # %sw.bb272
	movq	368(%rsp), %rax
	movl	$14, 8(%rax)
	jmp	.LBB102_44
.LBB102_48:                             # %if.then317
                                        #   in Loop: Header=BB102_44 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_44:                             # %while.body274
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_49
# BB#45:                                # %if.end288
                                        #   in Loop: Header=BB102_44 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_46
# BB#47:                                # %if.end294
                                        #   in Loop: Header=BB102_44 Depth=1
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
	jne	.LBB102_44
	jmp	.LBB102_48
.LBB102_49:                             # %while.end322
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
	cmpb	$23, %al
	jne	.LBB102_50
.LBB102_448:                            # %sw.bb2942
	movq	368(%rsp), %rax
	movl	$42, 8(%rax)
	jmp	.LBB102_449
.LBB102_453:                            # %if.then2989
                                        #   in Loop: Header=BB102_449 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_449:                            # %while.body2945
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_454
# BB#450:                               # %if.end2960
                                        #   in Loop: Header=BB102_449 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_451
# BB#452:                               # %if.end2966
                                        #   in Loop: Header=BB102_449 Depth=1
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
	jne	.LBB102_449
	jmp	.LBB102_453
.LBB102_454:                            # %while.end2994
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
	movzbl	367(%rsp), %eax
	cmpl	$114, %eax
	je	.LBB102_456
# BB#455:                               # %if.then2998
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_456:                            # %sw.bb3000
	movq	368(%rsp), %rax
	movl	$43, 8(%rax)
	jmp	.LBB102_457
.LBB102_461:                            # %if.then3047
                                        #   in Loop: Header=BB102_457 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_457:                            # %while.body3003
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_462
# BB#458:                               # %if.end3018
                                        #   in Loop: Header=BB102_457 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_459
# BB#460:                               # %if.end3024
                                        #   in Loop: Header=BB102_457 Depth=1
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
	jne	.LBB102_457
	jmp	.LBB102_461
.LBB102_451:                            # %if.then2965
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_462:                            # %while.end3052
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
	movzbl	367(%rsp), %eax
	cmpl	$69, %eax
	je	.LBB102_464
# BB#463:                               # %if.then3056
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_464:                            # %sw.bb3058
	movq	368(%rsp), %rax
	movl	$44, 8(%rax)
	jmp	.LBB102_465
.LBB102_469:                            # %if.then3105
                                        #   in Loop: Header=BB102_465 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_465:                            # %while.body3061
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_470
# BB#466:                               # %if.end3076
                                        #   in Loop: Header=BB102_465 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_467
# BB#468:                               # %if.end3082
                                        #   in Loop: Header=BB102_465 Depth=1
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
	jne	.LBB102_465
	jmp	.LBB102_469
.LBB102_459:                            # %if.then3023
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_470:                            # %while.end3110
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
	movzbl	367(%rsp), %eax
	cmpl	$56, %eax
	je	.LBB102_472
# BB#471:                               # %if.then3114
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_472:                            # %sw.bb3116
	movq	368(%rsp), %rax
	movl	$45, 8(%rax)
	jmp	.LBB102_473
.LBB102_477:                            # %if.then3163
                                        #   in Loop: Header=BB102_473 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_473:                            # %while.body3119
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_478
# BB#474:                               # %if.end3134
                                        #   in Loop: Header=BB102_473 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_475
# BB#476:                               # %if.end3140
                                        #   in Loop: Header=BB102_473 Depth=1
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
	jne	.LBB102_473
	jmp	.LBB102_477
.LBB102_467:                            # %if.then3081
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_478:                            # %while.end3168
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
	movzbl	367(%rsp), %eax
	cmpl	$80, %eax
	je	.LBB102_480
# BB#479:                               # %if.then3172
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_480:                            # %sw.bb3174
	movq	368(%rsp), %rax
	movl	$46, 8(%rax)
	jmp	.LBB102_481
.LBB102_485:                            # %if.then3221
                                        #   in Loop: Header=BB102_481 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_481:                            # %while.body3177
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_486
# BB#482:                               # %if.end3192
                                        #   in Loop: Header=BB102_481 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_483
# BB#484:                               # %if.end3198
                                        #   in Loop: Header=BB102_481 Depth=1
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
	jne	.LBB102_481
	jmp	.LBB102_485
.LBB102_475:                            # %if.then3139
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_486:                            # %while.end3226
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
	movzbl	367(%rsp), %eax
	cmpl	$144, %eax
	je	.LBB102_488
# BB#487:                               # %if.then3230
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_483:                            # %if.then3197
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_46:                             # %if.then293
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_50:                             # %if.end327
	movzbl	367(%rsp), %eax
	cmpl	$49, %eax
	je	.LBB102_52
# BB#51:                                # %if.then331
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_52:                             # %sw.bb333
	movq	368(%rsp), %rax
	movl	$15, 8(%rax)
	jmp	.LBB102_53
.LBB102_57:                             # %if.then378
                                        #   in Loop: Header=BB102_53 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_53:                             # %while.body335
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_58
# BB#54:                                # %if.end349
                                        #   in Loop: Header=BB102_53 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_55
# BB#56:                                # %if.end355
                                        #   in Loop: Header=BB102_53 Depth=1
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
	jne	.LBB102_53
	jmp	.LBB102_57
.LBB102_58:                             # %while.end383
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
	movzbl	367(%rsp), %eax
	cmpl	$65, %eax
	je	.LBB102_60
# BB#59:                                # %if.then387
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_60:                             # %sw.bb389
	movq	368(%rsp), %rax
	movl	$16, 8(%rax)
	jmp	.LBB102_61
.LBB102_65:                             # %if.then434
                                        #   in Loop: Header=BB102_61 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_61:                             # %while.body391
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_66
# BB#62:                                # %if.end405
                                        #   in Loop: Header=BB102_61 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_63
# BB#64:                                # %if.end411
                                        #   in Loop: Header=BB102_61 Depth=1
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
	jne	.LBB102_61
	jmp	.LBB102_65
.LBB102_66:                             # %while.end439
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
	movzbl	367(%rsp), %eax
	cmpl	$89, %eax
	je	.LBB102_68
# BB#67:                                # %if.then443
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_68:                             # %sw.bb445
	movq	368(%rsp), %rax
	movl	$17, 8(%rax)
	jmp	.LBB102_69
.LBB102_73:                             # %if.then490
                                        #   in Loop: Header=BB102_69 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_69:                             # %while.body447
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_74
# BB#70:                                # %if.end461
                                        #   in Loop: Header=BB102_69 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_71
# BB#72:                                # %if.end467
                                        #   in Loop: Header=BB102_69 Depth=1
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
	jne	.LBB102_69
	jmp	.LBB102_73
.LBB102_63:                             # %if.then410
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_74:                             # %while.end495
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
	movzbl	367(%rsp), %eax
	cmpl	$38, %eax
	je	.LBB102_76
# BB#75:                                # %if.then499
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_76:                             # %sw.bb501
	movq	368(%rsp), %rax
	movl	$18, 8(%rax)
	jmp	.LBB102_77
.LBB102_81:                             # %if.then546
                                        #   in Loop: Header=BB102_77 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_77:                             # %while.body503
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_82
# BB#78:                                # %if.end517
                                        #   in Loop: Header=BB102_77 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_79
# BB#80:                                # %if.end523
                                        #   in Loop: Header=BB102_77 Depth=1
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
	jne	.LBB102_77
	jmp	.LBB102_81
.LBB102_71:                             # %if.then466
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_82:                             # %while.end551
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
	movzbl	367(%rsp), %eax
	cmpl	$83, %eax
	je	.LBB102_84
# BB#83:                                # %if.then555
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_84:                             # %sw.bb557
	movq	368(%rsp), %rax
	movl	$19, 8(%rax)
	jmp	.LBB102_85
.LBB102_89:                             # %if.then602
                                        #   in Loop: Header=BB102_85 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_85:                             # %while.body559
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_90
# BB#86:                                # %if.end573
                                        #   in Loop: Header=BB102_85 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_87
# BB#88:                                # %if.end579
                                        #   in Loop: Header=BB102_85 Depth=1
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
	jne	.LBB102_85
	jmp	.LBB102_89
.LBB102_79:                             # %if.then522
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_90:                             # %while.end607
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
	movzbl	367(%rsp), %eax
	cmpl	$89, %eax
	je	.LBB102_92
# BB#91:                                # %if.then611
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_87:                             # %if.then578
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_55:                             # %if.then354
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_488:                            # %if.end3231
	movq	368(%rsp), %rax
	movl	$0, 3180(%rax)
.LBB102_489:                            # %sw.bb3232
	movq	368(%rsp), %rax
	movl	$47, 8(%rax)
	jmp	.LBB102_490
.LBB102_494:                            # %if.then3279
                                        #   in Loop: Header=BB102_490 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_490:                            # %while.body3235
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_495
# BB#491:                               # %if.end3250
                                        #   in Loop: Header=BB102_490 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_492
# BB#493:                               # %if.end3256
                                        #   in Loop: Header=BB102_490 Depth=1
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
	jne	.LBB102_490
	jmp	.LBB102_494
.LBB102_495:                            # %while.end3284
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
	movq	368(%rsp), %rax
	movl	3180(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 3180(%rax)
.LBB102_496:                            # %sw.bb3290
	movq	368(%rsp), %rax
	movl	$48, 8(%rax)
	jmp	.LBB102_497
.LBB102_501:                            # %if.then3337
                                        #   in Loop: Header=BB102_497 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_497:                            # %while.body3293
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_502
# BB#498:                               # %if.end3308
                                        #   in Loop: Header=BB102_497 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_499
# BB#500:                               # %if.end3314
                                        #   in Loop: Header=BB102_497 Depth=1
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
	jne	.LBB102_497
	jmp	.LBB102_501
.LBB102_502:                            # %while.end3342
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
	movq	368(%rsp), %rax
	movl	3180(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 3180(%rax)
.LBB102_503:                            # %sw.bb3348
	movq	368(%rsp), %rax
	movl	$49, 8(%rax)
	jmp	.LBB102_504
.LBB102_508:                            # %if.then3395
                                        #   in Loop: Header=BB102_504 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_504:                            # %while.body3351
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_509
# BB#505:                               # %if.end3366
                                        #   in Loop: Header=BB102_504 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_506
# BB#507:                               # %if.end3372
                                        #   in Loop: Header=BB102_504 Depth=1
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
	jne	.LBB102_504
	jmp	.LBB102_508
.LBB102_509:                            # %while.end3400
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
	movq	368(%rsp), %rax
	movl	3180(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 3180(%rax)
.LBB102_510:                            # %sw.bb3406
	movq	368(%rsp), %rax
	movl	$50, 8(%rax)
	jmp	.LBB102_511
.LBB102_515:                            # %if.then3453
                                        #   in Loop: Header=BB102_511 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_511:                            # %while.body3409
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_516
# BB#512:                               # %if.end3424
                                        #   in Loop: Header=BB102_511 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_513
# BB#514:                               # %if.end3430
                                        #   in Loop: Header=BB102_511 Depth=1
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
	jne	.LBB102_511
	jmp	.LBB102_515
.LBB102_516:                            # %while.end3458
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
	movq	368(%rsp), %rax
	movl	3180(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 3180(%rax)
	movq	368(%rsp), %rax
	movl	$1, 8(%rax)
	movl	$4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_506:                            # %if.then3371
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_513:                            # %if.then3429
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_499:                            # %if.then3313
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_492:                            # %if.then3255
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_92:                             # %if.end612
	movq	368(%rsp), %rax
	incl	48(%rax)
	movq	368(%rsp), %rax
	cmpl	$2, 52(%rax)
	jl	.LBB102_94
# BB#93:                                # %if.then616
	movq	368(%rsp), %rax
	movl	48(%rax), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str163, %esi
	xorb	%al, %al
	callq	fprintf
.LBB102_94:                             # %if.end619
	movq	368(%rsp), %rax
	movl	$0, 3176(%rax)
.LBB102_95:                             # %sw.bb620
	movq	368(%rsp), %rax
	movl	$20, 8(%rax)
	jmp	.LBB102_96
.LBB102_100:                            # %if.then665
                                        #   in Loop: Header=BB102_96 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_96:                             # %while.body622
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_101
# BB#97:                                # %if.end636
                                        #   in Loop: Header=BB102_96 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_98
# BB#99:                                # %if.end642
                                        #   in Loop: Header=BB102_96 Depth=1
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
	jne	.LBB102_96
	jmp	.LBB102_100
.LBB102_101:                            # %while.end670
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
	movq	368(%rsp), %rax
	movl	3176(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 3176(%rax)
.LBB102_102:                            # %sw.bb676
	movq	368(%rsp), %rax
	movl	$21, 8(%rax)
	jmp	.LBB102_103
.LBB102_107:                            # %if.then721
                                        #   in Loop: Header=BB102_103 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_103:                            # %while.body678
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_108
# BB#104:                               # %if.end692
                                        #   in Loop: Header=BB102_103 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_105
# BB#106:                               # %if.end698
                                        #   in Loop: Header=BB102_103 Depth=1
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
	jmp	.LBB102_107
.LBB102_108:                            # %while.end726
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
	movq	368(%rsp), %rax
	movl	3176(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 3176(%rax)
.LBB102_109:                            # %sw.bb732
	movq	368(%rsp), %rax
	movl	$22, 8(%rax)
	jmp	.LBB102_110
.LBB102_114:                            # %if.then777
                                        #   in Loop: Header=BB102_110 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_110:                            # %while.body734
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_115
# BB#111:                               # %if.end748
                                        #   in Loop: Header=BB102_110 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_112
# BB#113:                               # %if.end754
                                        #   in Loop: Header=BB102_110 Depth=1
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
	jne	.LBB102_110
	jmp	.LBB102_114
.LBB102_115:                            # %while.end782
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
	movq	368(%rsp), %rax
	movl	3176(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 3176(%rax)
.LBB102_116:                            # %sw.bb788
	movq	368(%rsp), %rax
	movl	$23, 8(%rax)
	jmp	.LBB102_117
.LBB102_121:                            # %if.then833
                                        #   in Loop: Header=BB102_117 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_117:                            # %while.body790
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_122
# BB#118:                               # %if.end804
                                        #   in Loop: Header=BB102_117 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_119
# BB#120:                               # %if.end810
                                        #   in Loop: Header=BB102_117 Depth=1
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
	jne	.LBB102_117
	jmp	.LBB102_121
.LBB102_122:                            # %while.end838
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
	movq	368(%rsp), %rax
	movl	3176(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 3176(%rax)
.LBB102_123:                            # %sw.bb844
	movq	368(%rsp), %rax
	movl	$24, 8(%rax)
	jmp	.LBB102_124
.LBB102_128:                            # %if.then889
                                        #   in Loop: Header=BB102_124 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_124:                            # %while.body846
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_129
# BB#125:                               # %if.end860
                                        #   in Loop: Header=BB102_124 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_126
# BB#127:                               # %if.end866
                                        #   in Loop: Header=BB102_124 Depth=1
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
	jmp	.LBB102_128
.LBB102_129:                            # %while.end894
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
	movq	368(%rsp), %rax
	movl	$0, 56(%rax)
.LBB102_130:                            # %sw.bb895
	movq	368(%rsp), %rax
	movl	$25, 8(%rax)
	jmp	.LBB102_131
.LBB102_135:                            # %if.then940
                                        #   in Loop: Header=BB102_131 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_131:                            # %while.body897
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_136
# BB#132:                               # %if.end911
                                        #   in Loop: Header=BB102_131 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_133
# BB#134:                               # %if.end917
                                        #   in Loop: Header=BB102_131 Depth=1
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
	jne	.LBB102_131
	jmp	.LBB102_135
.LBB102_126:                            # %if.then865
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_136:                            # %while.end945
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
	movq	368(%rsp), %rax
	movl	56(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 56(%rax)
.LBB102_137:                            # %sw.bb951
	movq	368(%rsp), %rax
	movl	$26, 8(%rax)
	jmp	.LBB102_138
.LBB102_142:                            # %if.then996
                                        #   in Loop: Header=BB102_138 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_138:                            # %while.body953
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_143
# BB#139:                               # %if.end967
                                        #   in Loop: Header=BB102_138 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_140
# BB#141:                               # %if.end973
                                        #   in Loop: Header=BB102_138 Depth=1
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
	jne	.LBB102_138
	jmp	.LBB102_142
.LBB102_133:                            # %if.then916
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_143:                            # %while.end1001
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
	movq	368(%rsp), %rax
	movl	56(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 56(%rax)
.LBB102_144:                            # %sw.bb1007
	movq	368(%rsp), %rax
	movl	$27, 8(%rax)
	jmp	.LBB102_145
.LBB102_149:                            # %if.then1052
                                        #   in Loop: Header=BB102_145 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_145:                            # %while.body1009
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$7, 36(%rax)
	jg	.LBB102_150
# BB#146:                               # %if.end1023
                                        #   in Loop: Header=BB102_145 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_147
# BB#148:                               # %if.end1029
                                        #   in Loop: Header=BB102_145 Depth=1
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
	jne	.LBB102_145
	jmp	.LBB102_149
.LBB102_140:                            # %if.then972
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_150:                            # %while.end1057
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
	movq	368(%rsp), %rax
	movl	56(%rax), %ecx
	shll	$8, %ecx
	movzbl	367(%rsp), %edx
	orl	%ecx, %edx
	movl	%edx, 56(%rax)
	movq	368(%rsp), %rax
	cmpl	$0, 56(%rax)
	js	.LBB102_151
# BB#152:                               # %if.end1067
	movq	368(%rsp), %rcx
	movl	56(%rcx), %eax
	imull	$100000, 40(%rcx), %ecx # imm = 0x186A0
	orl	$10, %ecx
	cmpl	%ecx, %eax
	jle	.LBB102_154
# BB#153:                               # %if.then1074
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_147:                            # %if.then1028
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_112:                            # %if.then753
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_119:                            # %if.then809
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_105:                            # %if.then697
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_98:                             # %if.then641
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_151:                            # %if.then1066
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_154:                            # %if.end1075
	movl	$0, 340(%rsp)
	jmp	.LBB102_155
.LBB102_42:                             # %if.then269
	movl	$-3, 360(%rsp)
	jmp	.LBB102_518
.LBB102_155:                            # %for.cond
	cmpl	$15, 340(%rsp)
	jg	.LBB102_165
.LBB102_156:                            # %sw.bb1078
	movq	368(%rsp), %rax
	movl	$28, 8(%rax)
	jmp	.LBB102_157
.LBB102_161:                            # %if.then1123
                                        #   in Loop: Header=BB102_157 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_157:                            # %while.body1080
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_162
# BB#158:                               # %if.end1094
                                        #   in Loop: Header=BB102_157 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_159
# BB#160:                               # %if.end1100
                                        #   in Loop: Header=BB102_157 Depth=1
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
	jne	.LBB102_157
	jmp	.LBB102_161
.LBB102_162:                            # %while.end1128
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
	movzbl	367(%rsp), %eax
	cmpl	$1, %eax
	jne	.LBB102_164
# BB#163:                               # %if.then1132
	movq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movb	$1, 3452(%rax,%rcx)
	incl	340(%rsp)
	jmp	.LBB102_155
.LBB102_159:                            # %if.then1099
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_164:                            # %if.else1133
	movq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movb	$0, 3452(%rax,%rcx)
	incl	340(%rsp)
	jmp	.LBB102_155
.LBB102_165:                            # %for.end
	movl	$0, 340(%rsp)
	jmp	.LBB102_166
.LBB102_167:                            # %for.inc1145
                                        #   in Loop: Header=BB102_166 Depth=1
	movq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movb	$0, 3196(%rax,%rcx)
	incl	340(%rsp)
.LBB102_166:                            # %for.cond1139
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$255, 340(%rsp)
	jle	.LBB102_167
# BB#168:                               # %for.end1147
	movl	$0, 340(%rsp)
.LBB102_169:                            # %for.cond1148
	cmpl	$15, 340(%rsp)
	jg	.LBB102_183
# BB#170:                               # %for.body1151
	movslq	340(%rsp), %rax
	movq	368(%rsp), %rcx
	cmpb	$0, 3452(%rcx,%rax)
	je	.LBB102_182
# BB#171:                               # %if.then1156
	movl	$0, 336(%rsp)
	jmp	.LBB102_172
.LBB102_183:                            # %for.end1228
	movq	368(%rsp), %rdi
	callq	makeMaps_d
	movq	368(%rsp), %rax
	cmpl	$0, 3192(%rax)
	je	.LBB102_184
# BB#185:                               # %if.end1232
	movq	368(%rsp), %rax
	movl	3192(%rax), %eax
	addl	$2, %eax
	movl	%eax, 328(%rsp)
.LBB102_186:                            # %sw.bb1235
	movq	368(%rsp), %rax
	movl	$30, 8(%rax)
	jmp	.LBB102_187
.LBB102_191:                            # %if.then1279
                                        #   in Loop: Header=BB102_187 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_187:                            # %while.body1237
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$2, 36(%rax)
	jg	.LBB102_192
# BB#188:                               # %if.end1250
                                        #   in Loop: Header=BB102_187 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_189
# BB#190:                               # %if.end1256
                                        #   in Loop: Header=BB102_187 Depth=1
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
	jne	.LBB102_187
	jmp	.LBB102_191
.LBB102_192:                            # %while.end1284
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
	cmpl	$2, %eax
	jl	.LBB102_194
# BB#193:                               # %lor.lhs.false1287
	cmpl	$7, 324(%rsp)
	jl	.LBB102_195
.LBB102_194:                            # %if.then1290
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_195:                            # %sw.bb1292
	movq	368(%rsp), %rax
	movl	$31, 8(%rax)
	jmp	.LBB102_196
.LBB102_200:                            # %if.then1336
                                        #   in Loop: Header=BB102_196 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_196:                            # %while.body1294
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$14, 36(%rax)
	jg	.LBB102_201
# BB#197:                               # %if.end1307
                                        #   in Loop: Header=BB102_196 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_198
# BB#199:                               # %if.end1313
                                        #   in Loop: Header=BB102_196 Depth=1
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
	jne	.LBB102_196
	jmp	.LBB102_200
.LBB102_201:                            # %while.end1341
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
	testl	%eax, %eax
	jle	.LBB102_202
# BB#203:                               # %if.end1345
	movl	$0, 340(%rsp)
	jmp	.LBB102_204
.LBB102_198:                            # %if.then1312
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_189:                            # %if.then1255
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_202:                            # %if.then1344
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_184:                            # %if.then1231
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_172:                            # %for.cond1157
	cmpl	$15, 336(%rsp)
	jg	.LBB102_182
.LBB102_173:                            # %sw.bb1161
	movq	368(%rsp), %rax
	movl	$29, 8(%rax)
	jmp	.LBB102_174
.LBB102_178:                            # %if.then1206
                                        #   in Loop: Header=BB102_174 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_174:                            # %while.body1163
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_179
# BB#175:                               # %if.end1177
                                        #   in Loop: Header=BB102_174 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_176
# BB#177:                               # %if.end1183
                                        #   in Loop: Header=BB102_174 Depth=1
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
	jne	.LBB102_174
	jmp	.LBB102_178
.LBB102_179:                            # %while.end1211
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
	movzbl	367(%rsp), %eax
	cmpl	$1, %eax
	jne	.LBB102_181
# BB#180:                               # %if.then1215
	movl	340(%rsp), %eax
	shll	$4, %eax
	addl	336(%rsp), %eax
	movslq	%eax, %rax
	movq	368(%rsp), %rcx
	movb	$1, 3196(%rcx,%rax)
.LBB102_181:                            # %for.inc1222
	incl	336(%rsp)
	jmp	.LBB102_172
.LBB102_176:                            # %if.then1182
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_182:                            # %for.inc1226
	incl	340(%rsp)
	jmp	.LBB102_169
.LBB102_204:                            # %for.cond1346
	movl	340(%rsp), %eax
	cmpl	320(%rsp), %eax
	jge	.LBB102_216
# BB#205:                               # %for.body1349
	movl	$0, 336(%rsp)
.LBB102_206:                            # %sw.bb1351
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB102_207 Depth 2
	movq	368(%rsp), %rax
	movl	$32, 8(%rax)
	jmp	.LBB102_207
.LBB102_211:                            # %if.then1397
                                        #   in Loop: Header=BB102_207 Depth=2
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_207:                            # %while.body1354
                                        #   Parent Loop BB102_206 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_212
# BB#208:                               # %if.end1368
                                        #   in Loop: Header=BB102_207 Depth=2
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_209
# BB#210:                               # %if.end1374
                                        #   in Loop: Header=BB102_207 Depth=2
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
	jmp	.LBB102_211
.LBB102_212:                            # %while.end1402
                                        #   in Loop: Header=BB102_206 Depth=1
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
	testb	%al, %al
	je	.LBB102_215
# BB#213:                               # %if.end1407
                                        #   in Loop: Header=BB102_206 Depth=1
	movl	336(%rsp), %eax
	incl	%eax
	movl	%eax, 336(%rsp)
	cmpl	324(%rsp), %eax
	jl	.LBB102_206
# BB#214:                               # %if.then1411
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_209:                            # %if.then1373
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_216:                            # %for.end1419
	movb	$0, 132(%rsp)
	jmp	.LBB102_217
.LBB102_218:                            # %for.inc1429
                                        #   in Loop: Header=BB102_217 Depth=1
	movzbl	132(%rsp), %eax
	movb	%al, 134(%rsp,%rax)
	incb	132(%rsp)
.LBB102_217:                            # %for.cond1422
                                        # =>This Inner Loop Header: Depth=1
	movzbl	132(%rsp), %eax
	cmpl	324(%rsp), %eax
	jl	.LBB102_218
# BB#219:                               # %for.end1431
	movl	$0, 340(%rsp)
	jmp	.LBB102_220
.LBB102_224:                            # %for.inc1456
                                        #   in Loop: Header=BB102_220 Depth=1
	movb	133(%rsp), %al
	movb	%al, 134(%rsp)
	movq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movb	133(%rsp), %dl
	movb	%dl, 7884(%rax,%rcx)
	incl	340(%rsp)
.LBB102_220:                            # %for.cond1432
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB102_222 Depth 2
	movl	340(%rsp), %eax
	cmpl	320(%rsp), %eax
	jge	.LBB102_225
# BB#221:                               # %for.body1435
                                        #   in Loop: Header=BB102_220 Depth=1
	movslq	340(%rsp), %rax
	movq	368(%rsp), %rcx
	movb	25886(%rcx,%rax), %al
	movb	%al, 132(%rsp)
	movzbl	132(%rsp), %eax
	movb	134(%rsp,%rax), %al
	movb	%al, 133(%rsp)
	jmp	.LBB102_222
	.align	16, 0x90
.LBB102_223:                            # %while.body1444
                                        #   in Loop: Header=BB102_222 Depth=2
	movzbl	132(%rsp), %eax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movb	134(%rsp,%rcx), %cl
	movb	%cl, 134(%rsp,%rax)
	decb	132(%rsp)
.LBB102_222:                            # %while.cond
                                        #   Parent Loop BB102_220 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	132(%rsp), %eax
	testl	%eax, %eax
	jle	.LBB102_224
	jmp	.LBB102_223
.LBB102_225:                            # %for.end1458
	movl	$0, 332(%rsp)
	jmp	.LBB102_226
.LBB102_215:                            # %for.inc1417
	movq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movb	336(%rsp), %dl
	movb	%dl, 25886(%rax,%rcx)
	incl	340(%rsp)
	jmp	.LBB102_204
.LBB102_226:                            # %for.cond1459
	movl	332(%rsp), %eax
	cmpl	324(%rsp), %eax
	jge	.LBB102_256
.LBB102_227:                            # %sw.bb1463
	movq	368(%rsp), %rax
	movl	$33, 8(%rax)
	jmp	.LBB102_228
.LBB102_232:                            # %if.then1509
                                        #   in Loop: Header=BB102_228 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_228:                            # %while.body1466
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$4, 36(%rax)
	jg	.LBB102_233
# BB#229:                               # %if.end1480
                                        #   in Loop: Header=BB102_228 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_230
# BB#231:                               # %if.end1486
                                        #   in Loop: Header=BB102_228 Depth=1
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
	jne	.LBB102_228
	jmp	.LBB102_232
.LBB102_233:                            # %while.end1514
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
	movl	$0, 340(%rsp)
	jmp	.LBB102_234
.LBB102_230:                            # %if.then1485
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_256:                            # %for.end1658
	movl	$0, 332(%rsp)
	jmp	.LBB102_257
.LBB102_265:                            # %for.inc1717
                                        #   in Loop: Header=BB102_257 Depth=1
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
	incl	332(%rsp)
.LBB102_257:                            # %for.cond1659
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB102_259 Depth 2
	movl	332(%rsp), %eax
	cmpl	324(%rsp), %eax
	jge	.LBB102_266
# BB#258:                               # %for.body1662
                                        #   in Loop: Header=BB102_257 Depth=1
	movl	$32, 356(%rsp)
	movl	$0, 352(%rsp)
	movl	$0, 340(%rsp)
	jmp	.LBB102_259
.LBB102_264:                            # %for.inc1699
                                        #   in Loop: Header=BB102_259 Depth=2
	incl	340(%rsp)
.LBB102_259:                            # %for.cond1663
                                        #   Parent Loop BB102_257 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	340(%rsp), %eax
	cmpl	328(%rsp), %eax
	jge	.LBB102_265
# BB#260:                               # %for.body1666
                                        #   in Loop: Header=BB102_259 Depth=2
	movslq	332(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movzbl	43888(%rcx,%rax), %eax
	cmpl	352(%rsp), %eax
	jle	.LBB102_262
# BB#261:                               # %if.then1675
                                        #   in Loop: Header=BB102_259 Depth=2
	movslq	332(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movzbl	43888(%rcx,%rax), %eax
	movl	%eax, 352(%rsp)
.LBB102_262:                            # %if.end1682
                                        #   in Loop: Header=BB102_259 Depth=2
	movslq	332(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movzbl	43888(%rcx,%rax), %eax
	cmpl	356(%rsp), %eax
	jge	.LBB102_264
# BB#263:                               # %if.then1691
                                        #   in Loop: Header=BB102_259 Depth=2
	movslq	332(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movzbl	43888(%rcx,%rax), %eax
	movl	%eax, 356(%rsp)
	jmp	.LBB102_264
.LBB102_266:                            # %for.end1719
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
	jmp	.LBB102_267
.LBB102_268:                            # %for.inc1730
                                        #   in Loop: Header=BB102_267 Depth=1
	movq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movl	$0, 68(%rax,%rcx,4)
	incl	340(%rsp)
.LBB102_267:                            # %for.cond1724
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$255, 340(%rsp)
	jle	.LBB102_268
# BB#269:                               # %for.end1732
	movl	$4095, 108(%rsp)        # imm = 0xFFF
	movl	$15, 116(%rsp)
	jmp	.LBB102_270
.LBB102_274:                            # %for.inc1756
                                        #   in Loop: Header=BB102_270 Depth=1
	movl	108(%rsp), %eax
	incl	%eax
	movq	368(%rsp), %rcx
	movslq	116(%rsp), %rdx
	movl	%eax, 7820(%rcx,%rdx,4)
	decl	116(%rsp)
.LBB102_270:                            # %for.cond1736
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB102_272 Depth 2
	cmpl	$0, 116(%rsp)
	js	.LBB102_275
# BB#271:                               # %for.body1739
                                        #   in Loop: Header=BB102_270 Depth=1
	movl	$15, 112(%rsp)
	jmp	.LBB102_272
.LBB102_273:                            # %for.inc1750
                                        #   in Loop: Header=BB102_272 Depth=2
	movl	116(%rsp), %eax
	shll	$4, %eax
	addl	112(%rsp), %eax
	movq	368(%rsp), %rcx
	movslq	108(%rsp), %rdx
	movb	%al, 3724(%rcx,%rdx)
	decl	108(%rsp)
	decl	112(%rsp)
.LBB102_272:                            # %for.cond1740
                                        #   Parent Loop BB102_270 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 112(%rsp)
	js	.LBB102_274
	jmp	.LBB102_273
.LBB102_275:                            # %for.end1758
	movl	$0, 296(%rsp)
	cmpl	$0, 308(%rsp)
	jne	.LBB102_279
# BB#276:                               # %if.then1761
	movl	312(%rsp), %eax
	incl	%eax
	movl	%eax, 312(%rsp)
	cmpl	320(%rsp), %eax
	jl	.LBB102_278
# BB#277:                               # %if.then1765
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_278:                            # %if.end1766
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
.LBB102_279:                            # %if.end1786
	decl	308(%rsp)
	movl	260(%rsp), %eax
	movl	%eax, 276(%rsp)
.LBB102_280:                            # %sw.bb1788
	movq	368(%rsp), %rax
	movl	$36, 8(%rax)
	jmp	.LBB102_281
.LBB102_288:                            # %if.then1836
                                        #   in Loop: Header=BB102_281 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_281:                            # %while.body1791
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	movl	36(%rax), %eax
	cmpl	276(%rsp), %eax
	jge	.LBB102_282
# BB#285:                               # %if.end1807
                                        #   in Loop: Header=BB102_281 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_286
# BB#287:                               # %if.end1813
                                        #   in Loop: Header=BB102_281 Depth=1
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
	jne	.LBB102_281
	jmp	.LBB102_288
.LBB102_282:                            # %if.then1795
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
	jmp	.LBB102_283
.LBB102_286:                            # %if.then1812
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_234:                            # %for.cond1515
	movl	340(%rsp), %eax
	cmpl	328(%rsp), %eax
	jl	.LBB102_235
# BB#255:                               # %for.inc1656
	incl	332(%rsp)
	jmp	.LBB102_226
.LBB102_235:                            # %while.body1520
	cmpl	$0, 284(%rsp)
	jle	.LBB102_237
# BB#236:                               # %lor.lhs.false1523
	cmpl	$21, 284(%rsp)
	jl	.LBB102_238
.LBB102_237:                            # %if.then1526
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_238:                            # %sw.bb1528
	movq	368(%rsp), %rax
	movl	$34, 8(%rax)
	jmp	.LBB102_239
.LBB102_243:                            # %if.then1575
                                        #   in Loop: Header=BB102_239 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_239:                            # %while.body1531
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_244
# BB#240:                               # %if.end1546
                                        #   in Loop: Header=BB102_239 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_241
# BB#242:                               # %if.end1552
                                        #   in Loop: Header=BB102_239 Depth=1
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
	jne	.LBB102_239
	jmp	.LBB102_243
.LBB102_244:                            # %while.end1580
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
	testb	%al, %al
	je	.LBB102_254
.LBB102_245:                            # %sw.bb1586
	movq	368(%rsp), %rax
	movl	$35, 8(%rax)
	jmp	.LBB102_246
.LBB102_250:                            # %if.then1633
                                        #   in Loop: Header=BB102_246 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_246:                            # %while.body1589
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_251
# BB#247:                               # %if.end1604
                                        #   in Loop: Header=BB102_246 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_248
# BB#249:                               # %if.end1610
                                        #   in Loop: Header=BB102_246 Depth=1
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
	jne	.LBB102_246
	jmp	.LBB102_250
.LBB102_251:                            # %while.end1638
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
	movzbl	367(%rsp), %eax
	testl	%eax, %eax
	je	.LBB102_252
# BB#253:                               # %if.else1644
	decl	284(%rsp)
	jmp	.LBB102_235
.LBB102_248:                            # %if.then1609
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_241:                            # %if.then1551
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_254:                            # %for.inc1653
	movslq	332(%rsp), %rax
	imulq	$258, %rax, %rax        # imm = 0x102
	addq	368(%rsp), %rax
	movslq	340(%rsp), %rcx
	movb	284(%rsp), %dl
	movb	%dl, 43888(%rcx,%rax)
	incl	340(%rsp)
	jmp	.LBB102_234
.LBB102_252:                            # %if.then1642
	incl	284(%rsp)
	jmp	.LBB102_235
.LBB102_283:                            # %while.body1843
	cmpl	$21, 276(%rsp)
	jl	.LBB102_289
# BB#284:                               # %if.then1846
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_289:                            # %if.end1847
	movslq	276(%rsp), %rax
	movq	248(%rsp), %rcx
	movl	272(%rsp), %edx
	cmpl	(%rcx,%rax,4), %edx
	jg	.LBB102_290
# BB#298:                               # %while.end1909
	movslq	276(%rsp), %rax
	movq	240(%rsp), %rcx
	movl	272(%rsp), %edx
	cmpl	(%rcx,%rax,4), %edx
	js	.LBB102_300
# BB#299:                               # %lor.lhs.false1915
	movslq	276(%rsp), %rax
	movq	240(%rsp), %rcx
	movl	272(%rsp), %edx
	subl	(%rcx,%rax,4), %edx
	cmpl	$258, %edx              # imm = 0x102
	jl	.LBB102_301
.LBB102_300:                            # %if.then1921
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_290:                            # %if.end1853
	incl	276(%rsp)
.LBB102_291:                            # %sw.bb1855
	movq	368(%rsp), %rax
	movl	$37, 8(%rax)
	jmp	.LBB102_292
.LBB102_296:                            # %if.then1901
                                        #   in Loop: Header=BB102_292 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_292:                            # %while.body1858
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_297
# BB#293:                               # %if.end1872
                                        #   in Loop: Header=BB102_292 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_294
# BB#295:                               # %if.end1878
                                        #   in Loop: Header=BB102_292 Depth=1
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
	jne	.LBB102_292
	jmp	.LBB102_296
.LBB102_297:                            # %while.end1906
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
	movl	272(%rsp), %ecx
	addl	%ecx, %ecx
	orl	%eax, %ecx
	movl	%ecx, 272(%rsp)
	jmp	.LBB102_283
.LBB102_294:                            # %if.then1877
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_301:                            # %if.end1922
	movslq	276(%rsp), %rax
	movq	240(%rsp), %rcx
	movl	272(%rsp), %edx
	subl	(%rcx,%rax,4), %edx
	movslq	%edx, %rax
	movq	232(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, 304(%rsp)
.LBB102_302:                            # %while.body1929
	movl	304(%rsp), %eax
	cmpl	316(%rsp), %eax
	jne	.LBB102_303
# BB#400:                               # %while.end2549
	movq	368(%rsp), %rax
	cmpl	$0, 56(%rax)
	js	.LBB102_402
# BB#401:                               # %lor.lhs.false2553
	movq	368(%rsp), %rax
	movl	56(%rax), %eax
	cmpl	296(%rsp), %eax
	jl	.LBB102_403
.LBB102_402:                            # %if.then2557
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_303:                            # %if.end1933
	cmpl	$0, 304(%rsp)
	je	.LBB102_305
# BB#304:                               # %lor.lhs.false1936
	cmpl	$1, 304(%rsp)
	jne	.LBB102_349
.LBB102_305:                            # %if.then1939
	movl	$-1, 292(%rsp)
	movl	$1, 288(%rsp)
	jmp	.LBB102_306
.LBB102_403:                            # %if.end2558
	movq	368(%rsp), %rax
	movl	$0, 1096(%rax)
	movl	$1, 340(%rsp)
	jmp	.LBB102_404
.LBB102_349:                            # %if.else2174
	movl	296(%rsp), %eax
	cmpl	300(%rsp), %eax
	jl	.LBB102_351
# BB#350:                               # %if.then2177
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_405:                            # %for.inc2571
                                        #   in Loop: Header=BB102_404 Depth=1
	movslq	340(%rsp), %rax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movq	368(%rsp), %rdx
	movl	68(%rdx,%rcx,4), %ecx
	movl	%ecx, 1096(%rdx,%rax,4)
	incl	340(%rsp)
.LBB102_404:                            # %for.cond2560
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$256, 340(%rsp)         # imm = 0x100
	jle	.LBB102_405
# BB#406:                               # %for.end2573
	movl	$1, 340(%rsp)
	jmp	.LBB102_407
.LBB102_351:                            # %if.end2178
	movl	304(%rsp), %eax
	decl	%eax
	movl	%eax, 64(%rsp)
	cmpl	$15, %eax
	ja	.LBB102_357
# BB#352:                               # %if.then2192
	movq	368(%rsp), %rax
	movl	7820(%rax), %eax
	movl	%eax, 76(%rsp)
	addl	64(%rsp), %eax
	movq	368(%rsp), %rcx
	movb	3724(%rcx,%rax), %al
	movb	%al, 367(%rsp)
	jmp	.LBB102_353
.LBB102_408:                            # %for.inc2586
                                        #   in Loop: Header=BB102_407 Depth=1
	movslq	340(%rsp), %rax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movq	368(%rsp), %rdx
	movl	1096(%rdx,%rcx,4), %ecx
	addl	%ecx, 1096(%rdx,%rax,4)
	incl	340(%rsp)
.LBB102_407:                            # %for.cond2574
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$256, 340(%rsp)         # imm = 0x100
	jle	.LBB102_408
# BB#409:                               # %for.end2588
	movl	$0, 340(%rsp)
	jmp	.LBB102_410
.LBB102_357:                            # %if.else2256
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
	jmp	.LBB102_358
.LBB102_354:                            # %while.body2202
                                        #   in Loop: Header=BB102_353 Depth=1
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
.LBB102_353:                            # %while.cond2199
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$4, 64(%rsp)
	jb	.LBB102_355
	jmp	.LBB102_354
.LBB102_414:                            # %for.inc2606
                                        #   in Loop: Header=BB102_410 Depth=1
	incl	340(%rsp)
.LBB102_410:                            # %for.cond2589
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$256, 340(%rsp)         # imm = 0x100
	jg	.LBB102_415
# BB#411:                               # %for.body2592
                                        #   in Loop: Header=BB102_410 Depth=1
	movslq	340(%rsp), %rax
	movq	368(%rsp), %rcx
	cmpl	$0, 1096(%rcx,%rax,4)
	js	.LBB102_413
# BB#412:                               # %lor.lhs.false2598
                                        #   in Loop: Header=BB102_410 Depth=1
	movslq	340(%rsp), %rax
	movq	368(%rsp), %rcx
	movl	1096(%rcx,%rax,4), %eax
	cmpl	296(%rsp), %eax
	jle	.LBB102_414
.LBB102_413:                            # %if.then2604
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_359:                            # %while.body2270
                                        #   in Loop: Header=BB102_358 Depth=1
	movslq	76(%rsp), %rax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movq	368(%rsp), %rdx
	movb	3724(%rdx,%rcx), %cl
	movb	%cl, 3724(%rdx,%rax)
	decl	76(%rsp)
.LBB102_358:                            # %while.cond2264
                                        # =>This Inner Loop Header: Depth=1
	movslq	72(%rsp), %rax
	movq	368(%rsp), %rcx
	movl	76(%rsp), %edx
	cmpl	7820(%rcx,%rax,4), %edx
	jg	.LBB102_359
# BB#360:                               # %while.end2279
	movq	368(%rsp), %rax
	movslq	72(%rsp), %rcx
	incl	7820(%rax,%rcx,4)
	jmp	.LBB102_361
.LBB102_356:                            # %while.body2241
                                        #   in Loop: Header=BB102_355 Depth=1
	movl	64(%rsp), %ecx
	movl	76(%rsp), %eax
	leal	-1(%rax,%rcx), %esi
	movq	368(%rsp), %rdx
	movb	3724(%rdx,%rsi), %sil
	addl	%ecx, %eax
	movb	%sil, 3724(%rdx,%rax)
	decl	64(%rsp)
.LBB102_355:                            # %while.cond2238
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 64(%rsp)
	jne	.LBB102_356
# BB#370:                               # %while.end2252
	movq	368(%rsp), %rax
	movslq	76(%rsp), %rcx
	movb	367(%rsp), %dl
	movb	%dl, 3724(%rax,%rcx)
	jmp	.LBB102_371
.LBB102_415:                            # %for.end2608
	movq	368(%rsp), %rax
	movl	$0, 16(%rax)
	movq	368(%rsp), %rax
	movb	$0, 12(%rax)
	movq	368(%rsp), %rax
	movl	$-1, 3184(%rax)
	movq	368(%rsp), %rax
	movl	$2, 8(%rax)
	movq	368(%rsp), %rax
	cmpl	$2, 52(%rax)
	jl	.LBB102_417
# BB#416:                               # %if.then2613
	movq	stderr(%rip), %rdi
	movl	$.L.str1164, %esi
	xorb	%al, %al
	callq	fprintf
.LBB102_417:                            # %if.end2615
	movq	368(%rsp), %rax
	cmpb	$0, 44(%rax)
	je	.LBB102_441
# BB#418:                               # %if.then2618
	movl	$0, 340(%rsp)
	jmp	.LBB102_419
.LBB102_362:                            # %while.body2287
                                        #   in Loop: Header=BB102_361 Depth=1
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
.LBB102_361:                            # %while.cond2284
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 72(%rsp)
	jg	.LBB102_362
# BB#363:                               # %while.end2308
	movq	368(%rsp), %rax
	decl	7820(%rax)
	movq	368(%rsp), %rax
	movslq	7820(%rax), %rcx
	movb	367(%rsp), %dl
	movb	%dl, 3724(%rax,%rcx)
	movq	368(%rsp), %rax
	cmpl	$0, 7820(%rax)
	jne	.LBB102_371
# BB#364:                               # %if.then2321
	movl	$4095, 80(%rsp)         # imm = 0xFFF
	movl	$15, 88(%rsp)
	jmp	.LBB102_365
.LBB102_441:                            # %if.else2849
	movl	$0, 340(%rsp)
	jmp	.LBB102_442
.LBB102_420:                            # %for.inc2628
                                        #   in Loop: Header=BB102_419 Depth=1
	movslq	340(%rsp), %rax
	movq	368(%rsp), %rcx
	movl	1096(%rcx,%rax,4), %edx
	movl	%edx, 2124(%rcx,%rax,4)
	incl	340(%rsp)
.LBB102_419:                            # %for.cond2619
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$256, 340(%rsp)         # imm = 0x100
	jle	.LBB102_420
# BB#421:                               # %for.end2630
	movl	$0, 340(%rsp)
	jmp	.LBB102_422
.LBB102_369:                            # %for.inc2348
                                        #   in Loop: Header=BB102_365 Depth=1
	movl	80(%rsp), %eax
	incl	%eax
	movq	368(%rsp), %rcx
	movslq	88(%rsp), %rdx
	movl	%eax, 7820(%rcx,%rdx,4)
	decl	88(%rsp)
.LBB102_365:                            # %for.cond2322
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB102_367 Depth 2
	cmpl	$0, 88(%rsp)
	js	.LBB102_371
# BB#366:                               # %for.body2325
                                        #   in Loop: Header=BB102_365 Depth=1
	movl	$15, 84(%rsp)
	jmp	.LBB102_367
.LBB102_368:                            # %for.inc2341
                                        #   in Loop: Header=BB102_367 Depth=2
	movslq	88(%rsp), %rcx
	movq	368(%rsp), %rax
	movl	7820(%rax,%rcx,4), %ecx
	addl	84(%rsp), %ecx
	movslq	%ecx, %rcx
	movb	3724(%rax,%rcx), %cl
	movslq	80(%rsp), %rdx
	movb	%cl, 3724(%rax,%rdx)
	decl	80(%rsp)
	decl	84(%rsp)
.LBB102_367:                            # %for.cond2326
                                        #   Parent Loop BB102_365 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 84(%rsp)
	js	.LBB102_369
	jmp	.LBB102_368
.LBB102_443:                            # %for.inc2871
                                        #   in Loop: Header=BB102_442 Depth=1
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
	incl	340(%rsp)
.LBB102_442:                            # %for.cond2850
                                        # =>This Inner Loop Header: Depth=1
	movl	340(%rsp), %eax
	cmpl	296(%rsp), %eax
	jl	.LBB102_443
# BB#444:                               # %for.end2873
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
	je	.LBB102_446
# BB#445:                               # %if.then2883
	movq	368(%rsp), %rax
	movl	$0, 24(%rax)
	movq	368(%rsp), %rax
	movl	$0, 28(%rax)
	movq	368(%rsp), %rax
	movl	60(%rax), %ecx
	movq	3152(%rax), %rdx
	movl	(%rdx,%rcx,4), %edx
	movl	$255, %ecx
	movl	%edx, 60(%rax)
	movq	368(%rsp), %rax
	andl	60(%rax), %ecx
	movl	%ecx, 64(%rax)
	movq	368(%rsp), %rax
	shrl	$8, 60(%rax)
	jmp	.LBB102_434
.LBB102_426:                            # %for.inc2690
                                        #   in Loop: Header=BB102_422 Depth=1
	movq	368(%rsp), %rax
	movzbl	367(%rsp), %ecx
	incl	2124(%rax,%rcx,4)
	incl	340(%rsp)
.LBB102_422:                            # %for.cond2631
                                        # =>This Inner Loop Header: Depth=1
	movl	340(%rsp), %eax
	cmpl	296(%rsp), %eax
	jge	.LBB102_427
# BB#423:                               # %for.body2634
                                        #   in Loop: Header=BB102_422 Depth=1
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
	jne	.LBB102_425
# BB#424:                               # %if.then2650
                                        #   in Loop: Header=BB102_422 Depth=1
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
	jmp	.LBB102_426
.LBB102_425:                            # %if.else2667
                                        #   in Loop: Header=BB102_422 Depth=1
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
	jmp	.LBB102_426
.LBB102_371:                            # %if.end2352
	movzbl	367(%rsp), %eax
	movq	368(%rsp), %rcx
	movzbl	3468(%rcx,%rax), %eax
	incl	68(%rcx,%rax,4)
	movq	368(%rsp), %rax
	cmpb	$0, 44(%rax)
	je	.LBB102_373
# BB#372:                               # %if.then2362
	movzbl	367(%rsp), %eax
	movq	368(%rsp), %rcx
	movzbl	3468(%rcx,%rax), %eax
	movq	3160(%rcx), %rcx
	movslq	296(%rsp), %rdx
	movw	%ax, (%rcx,%rdx,2)
	jmp	.LBB102_374
.LBB102_446:                            # %if.else2925
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
	jmp	.LBB102_447
.LBB102_427:                            # %for.end2692
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
.LBB102_428:                            # %do.body2709
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
	jne	.LBB102_430
# BB#429:                               # %if.then2735
                                        #   in Loop: Header=BB102_428 Depth=1
	movq	368(%rsp), %rax
	movq	3168(%rax), %rax
	movl	336(%rsp), %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movzbl	(%rax,%rcx), %edx
	andl	$240, %edx
	movzwl	342(%rsp), %esi
	orl	%edx, %esi
	jmp	.LBB102_431
.LBB102_430:                            # %if.else2749
                                        #   in Loop: Header=BB102_428 Depth=1
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
.LBB102_431:                            # %if.else2749
                                        #   in Loop: Header=BB102_428 Depth=1
	movb	%sil, (%rax,%rcx)
	movl	336(%rsp), %eax
	movl	%eax, 340(%rsp)
	movl	48(%rsp), %eax
	movl	%eax, 336(%rsp)
	movq	368(%rsp), %rax
	movl	340(%rsp), %ecx
	cmpl	56(%rax), %ecx
	jne	.LBB102_428
# BB#432:                               # %do.end2769
	movq	368(%rsp), %rax
	movl	56(%rax), %ecx
	movl	%ecx, 60(%rax)
	movq	368(%rsp), %rax
	movl	$0, 1092(%rax)
	movq	368(%rsp), %rax
	cmpb	$0, 20(%rax)
	je	.LBB102_440
# BB#433:                               # %if.then2773
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
.LBB102_434:                            # %if.then2773
	movq	368(%rsp), %rax
	incl	1092(%rax)
	movq	368(%rsp), %rax
	cmpl	$0, 24(%rax)
	jne	.LBB102_437
# BB#435:                               # %if.then2801
	movq	368(%rsp), %rax
	movslq	28(%rax), %rcx
	movl	BZ2_rNums(,%rcx,4), %ecx
	movl	%ecx, 24(%rax)
	movq	368(%rsp), %rax
	incl	28(%rax)
	movq	368(%rsp), %rax
	cmpl	$512, 28(%rax)          # imm = 0x200
	jne	.LBB102_437
# BB#436:                               # %if.then2811
	movq	368(%rsp), %rax
	movl	$0, 28(%rax)
.LBB102_437:                            # %if.end2814
	movq	368(%rsp), %rax
	decl	24(%rax)
	movq	368(%rsp), %rcx
	movl	$1, %eax
	cmpl	$1, 24(%rcx)
	je	.LBB102_439
# BB#438:                               # %select.mid
	xorl	%eax, %eax
.LBB102_439:                            # %select.end
	movq	368(%rsp), %rcx
	xorl	%eax, 64(%rcx)
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_373:                            # %if.else2370
	movzbl	367(%rsp), %eax
	movq	368(%rsp), %rcx
	movzbl	3468(%rcx,%rax), %eax
	movq	3152(%rcx), %rcx
	movslq	296(%rsp), %rdx
	movl	%eax, (%rcx,%rdx,4)
.LBB102_374:                            # %if.end2378
	incl	296(%rsp)
	cmpl	$0, 308(%rsp)
	jne	.LBB102_378
# BB#375:                               # %if.then2382
	movl	312(%rsp), %eax
	incl	%eax
	movl	%eax, 312(%rsp)
	cmpl	320(%rsp), %eax
	jl	.LBB102_377
# BB#376:                               # %if.then2386
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_440:                            # %if.else2821
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
.LBB102_447:                            # %if.else2925
	movq	368(%rsp), %rax
	incl	1092(%rax)
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_377:                            # %if.end2387
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
.LBB102_378:                            # %if.end2407
	decl	308(%rsp)
	movl	260(%rsp), %eax
	movl	%eax, 276(%rsp)
.LBB102_379:                            # %sw.bb2409
	movq	368(%rsp), %rax
	movl	$40, 8(%rax)
	jmp	.LBB102_380
.LBB102_387:                            # %if.then2457
                                        #   in Loop: Header=BB102_380 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_380:                            # %while.body2412
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	movl	36(%rax), %eax
	cmpl	276(%rsp), %eax
	jge	.LBB102_381
# BB#384:                               # %if.end2428
                                        #   in Loop: Header=BB102_380 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_385
# BB#386:                               # %if.end2434
                                        #   in Loop: Header=BB102_380 Depth=1
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
	jne	.LBB102_380
	jmp	.LBB102_387
.LBB102_381:                            # %if.then2416
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
	jmp	.LBB102_382
.LBB102_385:                            # %if.then2433
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_306:                            # %do.body
	cmpl	$0, 304(%rsp)
	je	.LBB102_307
# BB#308:                               # %if.else1945
	cmpl	$1, 304(%rsp)
	jne	.LBB102_311
# BB#309:                               # %if.then1948
	movl	288(%rsp), %eax
	addl	%eax, %eax
	jmp	.LBB102_310
.LBB102_307:                            # %if.then1942
	movl	288(%rsp), %eax
.LBB102_310:                            # %if.then1948
	addl	%eax, 292(%rsp)
.LBB102_311:                            # %if.end1952
	shll	288(%rsp)
	cmpl	$0, 308(%rsp)
	jne	.LBB102_315
# BB#312:                               # %if.then1956
	movl	312(%rsp), %eax
	incl	%eax
	movl	%eax, 312(%rsp)
	cmpl	320(%rsp), %eax
	jl	.LBB102_314
# BB#313:                               # %if.then1960
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_314:                            # %if.end1961
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
.LBB102_315:                            # %if.end1981
	decl	308(%rsp)
	movl	260(%rsp), %eax
	movl	%eax, 276(%rsp)
.LBB102_316:                            # %sw.bb1983
	movq	368(%rsp), %rax
	movl	$38, 8(%rax)
	jmp	.LBB102_317
.LBB102_324:                            # %if.then2031
                                        #   in Loop: Header=BB102_317 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_317:                            # %while.body1986
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	movl	36(%rax), %eax
	cmpl	276(%rsp), %eax
	jge	.LBB102_318
# BB#321:                               # %if.end2002
                                        #   in Loop: Header=BB102_317 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_322
# BB#323:                               # %if.end2008
                                        #   in Loop: Header=BB102_317 Depth=1
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
	jne	.LBB102_317
	jmp	.LBB102_324
.LBB102_318:                            # %if.then1990
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
	jmp	.LBB102_319
.LBB102_322:                            # %if.then2007
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_319:                            # %while.body2038
	cmpl	$21, 276(%rsp)
	jl	.LBB102_325
# BB#320:                               # %if.then2041
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_325:                            # %if.end2042
	movslq	276(%rsp), %rax
	movq	248(%rsp), %rcx
	movl	272(%rsp), %edx
	cmpl	(%rcx,%rax,4), %edx
	jg	.LBB102_326
# BB#334:                               # %while.end2104
	movslq	276(%rsp), %rax
	movq	240(%rsp), %rcx
	movl	272(%rsp), %edx
	cmpl	(%rcx,%rax,4), %edx
	js	.LBB102_336
# BB#335:                               # %lor.lhs.false2110
	movslq	276(%rsp), %rax
	movq	240(%rsp), %rcx
	movl	272(%rsp), %edx
	subl	(%rcx,%rax,4), %edx
	cmpl	$258, %edx              # imm = 0x102
	jl	.LBB102_337
.LBB102_336:                            # %if.then2116
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_326:                            # %if.end2048
	incl	276(%rsp)
.LBB102_327:                            # %sw.bb2050
	movq	368(%rsp), %rax
	movl	$39, 8(%rax)
	jmp	.LBB102_328
.LBB102_332:                            # %if.then2096
                                        #   in Loop: Header=BB102_328 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_328:                            # %while.body2053
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_333
# BB#329:                               # %if.end2067
                                        #   in Loop: Header=BB102_328 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_330
# BB#331:                               # %if.end2073
                                        #   in Loop: Header=BB102_328 Depth=1
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
	jne	.LBB102_328
	jmp	.LBB102_332
.LBB102_333:                            # %while.end2101
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
	movl	272(%rsp), %ecx
	addl	%ecx, %ecx
	orl	%eax, %ecx
	movl	%ecx, 272(%rsp)
	jmp	.LBB102_319
.LBB102_330:                            # %if.then2072
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.LBB102_337:                            # %do.cond
	movslq	276(%rsp), %rax
	movq	240(%rsp), %rcx
	movl	272(%rsp), %edx
	subl	(%rcx,%rax,4), %edx
	movslq	%edx, %rax
	movq	232(%rsp), %rcx
	movl	(%rcx,%rax,4), %ecx
	movl	%ecx, 304(%rsp)
	movb	$1, %al
	testl	%ecx, %ecx
	je	.LBB102_339
# BB#338:                               # %lor.rhs
	cmpl	$1, 304(%rsp)
	sete	%al
.LBB102_339:                            # %lor.end
	testb	%al, %al
	jne	.LBB102_306
# BB#340:                               # %do.end
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
	je	.LBB102_346
	jmp	.LBB102_341
.LBB102_344:                            # %if.end2149
                                        #   in Loop: Header=BB102_341 Depth=1
	movq	368(%rsp), %rax
	movq	3160(%rax), %rax
	movzbl	367(%rsp), %ecx
	movslq	296(%rsp), %rdx
	movw	%cx, (%rax,%rdx,2)
	incl	296(%rsp)
	decl	292(%rsp)
.LBB102_341:                            # %while.cond2142
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 292(%rsp)
	jle	.LBB102_302
# BB#342:                               # %while.body2145
                                        #   in Loop: Header=BB102_341 Depth=1
	movl	296(%rsp), %eax
	cmpl	300(%rsp), %eax
	jl	.LBB102_344
# BB#343:                               # %if.then2148
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_345:                            # %if.end2165
                                        #   in Loop: Header=BB102_346 Depth=1
	movq	368(%rsp), %rax
	movq	3152(%rax), %rax
	movslq	296(%rsp), %rcx
	movzbl	367(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	296(%rsp)
	decl	292(%rsp)
.LBB102_346:                            # %while.cond2158
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 292(%rsp)
	jle	.LBB102_302
# BB#347:                               # %while.body2161
                                        #   in Loop: Header=BB102_346 Depth=1
	movl	296(%rsp), %eax
	cmpl	300(%rsp), %eax
	jl	.LBB102_345
# BB#348:                               # %if.then2164
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_382:                            # %while.body2464
	cmpl	$21, 276(%rsp)
	jl	.LBB102_388
# BB#383:                               # %if.then2467
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_388:                            # %if.end2468
	movslq	276(%rsp), %rax
	movq	248(%rsp), %rcx
	movl	272(%rsp), %edx
	cmpl	(%rcx,%rax,4), %edx
	jg	.LBB102_389
# BB#397:                               # %while.end2530
	movslq	276(%rsp), %rax
	movq	240(%rsp), %rcx
	movl	272(%rsp), %edx
	cmpl	(%rcx,%rax,4), %edx
	js	.LBB102_399
# BB#398:                               # %lor.lhs.false2536
	movslq	276(%rsp), %rax
	movq	240(%rsp), %rcx
	movl	272(%rsp), %edx
	subl	(%rcx,%rax,4), %edx
	cmpl	$258, %edx              # imm = 0x102
	jl	.LBB102_301
.LBB102_399:                            # %if.then2542
	movl	$-4, 360(%rsp)
	jmp	.LBB102_518
.LBB102_389:                            # %if.end2474
	incl	276(%rsp)
.LBB102_390:                            # %sw.bb2476
	movq	368(%rsp), %rax
	movl	$41, 8(%rax)
	jmp	.LBB102_391
.LBB102_395:                            # %if.then2522
                                        #   in Loop: Header=BB102_391 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	incl	16(%rax)
.LBB102_391:                            # %while.body2479
                                        # =>This Inner Loop Header: Depth=1
	movq	368(%rsp), %rax
	cmpl	$0, 36(%rax)
	jg	.LBB102_396
# BB#392:                               # %if.end2493
                                        #   in Loop: Header=BB102_391 Depth=1
	movq	368(%rsp), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB102_393
# BB#394:                               # %if.end2499
                                        #   in Loop: Header=BB102_391 Depth=1
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
	jne	.LBB102_391
	jmp	.LBB102_395
.LBB102_396:                            # %while.end2527
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
	movl	272(%rsp), %ecx
	addl	%ecx, %ecx
	orl	%eax, %ecx
	movl	%ecx, 272(%rsp)
	jmp	.LBB102_382
.LBB102_393:                            # %if.then2498
	movl	$0, 360(%rsp)
	jmp	.LBB102_518
.Ltmp359:
	.size	BZ2_decompress, .Ltmp359-BZ2_decompress
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI102_0:
	.quad	.LBB102_4
	.quad	.LBB102_12
	.quad	.LBB102_20
	.quad	.LBB102_28
	.quad	.LBB102_43
	.quad	.LBB102_52
	.quad	.LBB102_60
	.quad	.LBB102_68
	.quad	.LBB102_76
	.quad	.LBB102_84
	.quad	.LBB102_95
	.quad	.LBB102_102
	.quad	.LBB102_109
	.quad	.LBB102_116
	.quad	.LBB102_123
	.quad	.LBB102_130
	.quad	.LBB102_137
	.quad	.LBB102_144
	.quad	.LBB102_156
	.quad	.LBB102_173
	.quad	.LBB102_186
	.quad	.LBB102_195
	.quad	.LBB102_206
	.quad	.LBB102_227
	.quad	.LBB102_238
	.quad	.LBB102_245
	.quad	.LBB102_280
	.quad	.LBB102_291
	.quad	.LBB102_316
	.quad	.LBB102_327
	.quad	.LBB102_379
	.quad	.LBB102_390
	.quad	.LBB102_448
	.quad	.LBB102_456
	.quad	.LBB102_464
	.quad	.LBB102_472
	.quad	.LBB102_480
	.quad	.LBB102_489
	.quad	.LBB102_496
	.quad	.LBB102_503
	.quad	.LBB102_510

	.text
	.align	16, 0x90
	.type	makeMaps_d,@function
makeMaps_d:                             # @makeMaps_d
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -8(%rsp)
	movl	$0, 3192(%rdi)
	movl	$0, -12(%rsp)
	jmp	.LBB103_1
	.align	16, 0x90
.LBB103_4:                              # %for.inc
                                        #   in Loop: Header=BB103_1 Depth=1
	incl	-12(%rsp)
.LBB103_1:                              # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$255, -12(%rsp)
	jg	.LBB103_5
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB103_1 Depth=1
	movslq	-12(%rsp), %rax
	movq	-8(%rsp), %rcx
	cmpb	$0, 3196(%rcx,%rax)
	je	.LBB103_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB103_1 Depth=1
	movq	-8(%rsp), %rax
	movslq	3192(%rax), %rcx
	movb	-12(%rsp), %dl
	movb	%dl, 3468(%rax,%rcx)
	movq	-8(%rsp), %rax
	incl	3192(%rax)
	jmp	.LBB103_4
.LBB103_5:                              # %for.end
	ret
.Ltmp360:
	.size	makeMaps_d, .Ltmp360-makeMaps_d
	.cfi_endproc

	.globl	BZ2_hbMakeCodeLengths
	.align	16, 0x90
	.type	BZ2_hbMakeCodeLengths,@function
BZ2_hbMakeCodeLengths:                  # @BZ2_hbMakeCodeLengths
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$5272, %rsp             # imm = 0x1498
.Ltmp362:
	.cfi_def_cfa_offset 5280
	movq	%rdi, 5264(%rsp)
	movq	%rsi, 5256(%rsp)
	movl	%edx, 5252(%rsp)
	movl	%ecx, 5248(%rsp)
	movl	$0, 5228(%rsp)
	jmp	.LBB104_1
	.align	16, 0x90
.LBB104_4:                              # %for.inc
                                        #   in Loop: Header=BB104_1 Depth=1
	shll	$8, %eax
	movl	5228(%rsp), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	movl	%eax, 2112(%rsp,%rcx,4)
	incl	5228(%rsp)
.LBB104_1:                              # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	5228(%rsp), %eax
	cmpl	5252(%rsp), %eax
	jge	.LBB104_5
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB104_1 Depth=1
	movl	$1, %eax
	movslq	5228(%rsp), %rcx
	movq	5256(%rsp), %rdx
	cmpl	$0, (%rdx,%rcx,4)
	je	.LBB104_4
# BB#3:                                 # %cond.false
                                        #   in Loop: Header=BB104_1 Depth=1
	movslq	5228(%rsp), %rax
	movq	5256(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	jmp	.LBB104_4
	.align	16, 0x90
.LBB104_46:                             # %if.end227
                                        #   in Loop: Header=BB104_5 Depth=1
	movl	$1, 5228(%rsp)
	jmp	.LBB104_47
	.align	16, 0x90
.LBB104_48:                             # %for.inc239
                                        #   in Loop: Header=BB104_47 Depth=2
	movslq	5228(%rsp), %rax
	movl	2112(%rsp,%rax,4), %eax
	movl	%eax, %ecx
	sarl	$8, %ecx
	movl	%ecx, 5224(%rsp)
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
	incl	%eax
	movl	%eax, 5224(%rsp)
	shll	$8, %eax
	movslq	5228(%rsp), %rcx
	movl	%eax, 2112(%rsp,%rcx,4)
	incl	5228(%rsp)
.LBB104_47:                             # %for.cond228
                                        #   Parent Loop BB104_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	5228(%rsp), %eax
	cmpl	5252(%rsp), %eax
	jle	.LBB104_48
.LBB104_5:                              # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB104_6 Depth 2
                                        #       Child Loop BB104_8 Depth 3
                                        #     Child Loop BB104_13 Depth 2
                                        #       Child Loop BB104_15 Depth 3
                                        #       Child Loop BB104_22 Depth 3
                                        #       Child Loop BB104_32 Depth 3
                                        #     Child Loop BB104_38 Depth 2
                                        #       Child Loop BB104_40 Depth 3
                                        #     Child Loop BB104_47 Depth 2
	movl	5252(%rsp), %eax
	movl	%eax, 5244(%rsp)
	movl	$0, 5240(%rsp)
	movl	$0, 4176(%rsp)
	movl	$0, 2112(%rsp)
	movl	$-2, 48(%rsp)
	movl	$1, 5228(%rsp)
	jmp	.LBB104_6
	.align	16, 0x90
.LBB104_10:                             # %for.inc36
                                        #   in Loop: Header=BB104_6 Depth=2
	movslq	44(%rsp), %rax
	movl	40(%rsp), %ecx
	movl	%ecx, 4176(%rsp,%rax,4)
	incl	5228(%rsp)
.LBB104_6:                              # %for.cond9
                                        #   Parent Loop BB104_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB104_8 Depth 3
	movl	5228(%rsp), %eax
	cmpl	5252(%rsp), %eax
	jg	.LBB104_11
# BB#7:                                 # %for.body11
                                        #   in Loop: Header=BB104_6 Depth=2
	movslq	5228(%rsp), %rax
	movl	$-1, 48(%rsp,%rax,4)
	incl	5240(%rsp)
	movslq	5240(%rsp), %rax
	movl	5228(%rsp), %ecx
	movl	%ecx, 4176(%rsp,%rax,4)
	movl	5240(%rsp), %eax
	movl	%eax, 44(%rsp)
	movslq	44(%rsp), %rax
	movl	4176(%rsp,%rax,4), %eax
	movl	%eax, 40(%rsp)
	jmp	.LBB104_8
	.align	16, 0x90
.LBB104_9:                              # %while.body27
                                        #   in Loop: Header=BB104_8 Depth=3
	movslq	44(%rsp), %rax
	movl	%eax, %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movl	4176(%rsp,%rcx,4), %ecx
	movl	%ecx, 4176(%rsp,%rax,4)
	sarl	44(%rsp)
.LBB104_8:                              # %while.cond19
                                        #   Parent Loop BB104_5 Depth=1
                                        #     Parent Loop BB104_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	40(%rsp), %rax
	movl	2112(%rsp,%rax,4), %eax
	movl	44(%rsp), %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movslq	4176(%rsp,%rcx,4), %rcx
	cmpl	2112(%rsp,%rcx,4), %eax
	jge	.LBB104_10
	jmp	.LBB104_9
	.align	16, 0x90
.LBB104_11:                             # %for.end38
                                        #   in Loop: Header=BB104_5 Depth=1
	cmpl	$260, 5240(%rsp)        # imm = 0x104
	jl	.LBB104_13
# BB#12:                                # %if.then
                                        #   in Loop: Header=BB104_5 Depth=1
	movl	$2001, %edi             # imm = 0x7D1
	callq	BZ2_bz__AssertH__fail
	jmp	.LBB104_13
	.align	16, 0x90
.LBB104_34:                             # %while.end198
                                        #   in Loop: Header=BB104_13 Depth=2
	movslq	12(%rsp), %rax
	movl	8(%rsp), %ecx
	movl	%ecx, 4176(%rsp,%rax,4)
.LBB104_13:                             # %while.cond40
                                        #   Parent Loop BB104_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB104_15 Depth 3
                                        #       Child Loop BB104_22 Depth 3
                                        #       Child Loop BB104_32 Depth 3
	cmpl	$2, 5240(%rsp)
	jl	.LBB104_35
# BB#14:                                # %while.body42
                                        #   in Loop: Header=BB104_13 Depth=2
	movl	4180(%rsp), %eax
	movl	%eax, 5236(%rsp)
	movslq	5240(%rsp), %rax
	movl	4176(%rsp,%rax,4), %eax
	movl	%eax, 4180(%rsp)
	decl	5240(%rsp)
	movl	$1, 36(%rsp)
	movslq	36(%rsp), %rax
	movl	4176(%rsp,%rax,4), %eax
	movl	%eax, 28(%rsp)
	jmp	.LBB104_15
	.align	16, 0x90
.LBB104_20:                             # %if.end82
                                        #   in Loop: Header=BB104_15 Depth=3
	movslq	32(%rsp), %rax
	movl	4176(%rsp,%rax,4), %eax
	movslq	36(%rsp), %rcx
	movl	%eax, 4176(%rsp,%rcx,4)
	movl	32(%rsp), %eax
	movl	%eax, 36(%rsp)
.LBB104_15:                             # %while.body55
                                        #   Parent Loop BB104_5 Depth=1
                                        #     Parent Loop BB104_13 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	36(%rsp), %eax
	addl	%eax, %eax
	movl	%eax, 32(%rsp)
	cmpl	5240(%rsp), %eax
	jg	.LBB104_21
# BB#16:                                # %if.end59
                                        #   in Loop: Header=BB104_15 Depth=3
	movl	32(%rsp), %eax
	cmpl	5240(%rsp), %eax
	jge	.LBB104_19
# BB#17:                                # %land.lhs.true
                                        #   in Loop: Header=BB104_15 Depth=3
	movslq	32(%rsp), %rcx
	movslq	4176(%rsp,%rcx,4), %rax
	incl	%ecx
	movslq	%ecx, %rcx
	movslq	4176(%rsp,%rcx,4), %rcx
	movl	2112(%rsp,%rcx,4), %ecx
	cmpl	2112(%rsp,%rax,4), %ecx
	jge	.LBB104_19
# BB#18:                                # %if.then71
                                        #   in Loop: Header=BB104_15 Depth=3
	incl	32(%rsp)
.LBB104_19:                             # %if.end73
                                        #   in Loop: Header=BB104_15 Depth=3
	movslq	32(%rsp), %rax
	movslq	4176(%rsp,%rax,4), %rax
	movslq	28(%rsp), %rcx
	movl	2112(%rsp,%rcx,4), %ecx
	cmpl	2112(%rsp,%rax,4), %ecx
	jge	.LBB104_20
.LBB104_21:                             # %while.end87
                                        #   in Loop: Header=BB104_13 Depth=2
	movslq	36(%rsp), %rax
	movl	28(%rsp), %ecx
	movl	%ecx, 4176(%rsp,%rax,4)
	movl	4180(%rsp), %eax
	movl	%eax, 5232(%rsp)
	movslq	5240(%rsp), %rax
	movl	4176(%rsp,%rax,4), %eax
	movl	%eax, 4180(%rsp)
	decl	5240(%rsp)
	movl	$1, 24(%rsp)
	movslq	24(%rsp), %rax
	movl	4176(%rsp,%rax,4), %eax
	movl	%eax, 16(%rsp)
	jmp	.LBB104_22
	.align	16, 0x90
.LBB104_27:                             # %if.end132
                                        #   in Loop: Header=BB104_22 Depth=3
	movslq	20(%rsp), %rax
	movl	4176(%rsp,%rax,4), %eax
	movslq	24(%rsp), %rcx
	movl	%eax, 4176(%rsp,%rcx,4)
	movl	20(%rsp), %eax
	movl	%eax, 24(%rsp)
.LBB104_22:                             # %while.body104
                                        #   Parent Loop BB104_5 Depth=1
                                        #     Parent Loop BB104_13 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	24(%rsp), %eax
	addl	%eax, %eax
	movl	%eax, 20(%rsp)
	cmpl	5240(%rsp), %eax
	jg	.LBB104_28
# BB#23:                                # %if.end108
                                        #   in Loop: Header=BB104_22 Depth=3
	movl	20(%rsp), %eax
	cmpl	5240(%rsp), %eax
	jge	.LBB104_26
# BB#24:                                # %land.lhs.true110
                                        #   in Loop: Header=BB104_22 Depth=3
	movslq	20(%rsp), %rcx
	movslq	4176(%rsp,%rcx,4), %rax
	incl	%ecx
	movslq	%ecx, %rcx
	movslq	4176(%rsp,%rcx,4), %rcx
	movl	2112(%rsp,%rcx,4), %ecx
	cmpl	2112(%rsp,%rax,4), %ecx
	jge	.LBB104_26
# BB#25:                                # %if.then121
                                        #   in Loop: Header=BB104_22 Depth=3
	incl	20(%rsp)
.LBB104_26:                             # %if.end123
                                        #   in Loop: Header=BB104_22 Depth=3
	movslq	20(%rsp), %rax
	movslq	4176(%rsp,%rax,4), %rax
	movslq	16(%rsp), %rcx
	movl	2112(%rsp,%rcx,4), %ecx
	cmpl	2112(%rsp,%rax,4), %ecx
	jge	.LBB104_27
.LBB104_28:                             # %while.end137
                                        #   in Loop: Header=BB104_13 Depth=2
	movslq	24(%rsp), %rax
	movl	16(%rsp), %ecx
	movl	%ecx, 4176(%rsp,%rax,4)
	movl	5244(%rsp), %eax
	incl	%eax
	movl	%eax, 5244(%rsp)
	movslq	5232(%rsp), %rcx
	movl	%eax, 48(%rsp,%rcx,4)
	movslq	5236(%rsp), %rcx
	movl	%eax, 48(%rsp,%rcx,4)
	movslq	5232(%rsp), %rax
	movl	2112(%rsp,%rax,4), %ecx
	movl	%ecx, %esi
	andl	$-256, %esi
	movslq	5236(%rsp), %rax
	movl	2112(%rsp,%rax,4), %edx
	movl	%edx, %eax
	andl	$-256, %eax
	addl	%esi, %eax
	movzbl	%cl, %ecx
	movzbl	%dl, %edx
	cmpl	%ecx, %edx
	jle	.LBB104_30
# BB#29:                                # %cond.true158
                                        #   in Loop: Header=BB104_13 Depth=2
	movslq	5236(%rsp), %rcx
	jmp	.LBB104_31
	.align	16, 0x90
.LBB104_30:                             # %cond.false162
                                        #   in Loop: Header=BB104_13 Depth=2
	movslq	5232(%rsp), %rcx
.LBB104_31:                             # %cond.false162
                                        #   in Loop: Header=BB104_13 Depth=2
	movzbl	2112(%rsp,%rcx,4), %ecx
	incl	%ecx
	orl	%ecx, %eax
	movslq	5244(%rsp), %rcx
	movl	%eax, 2112(%rsp,%rcx,4)
	movslq	5244(%rsp), %rax
	movl	$-1, 48(%rsp,%rax,4)
	incl	5240(%rsp)
	movslq	5240(%rsp), %rax
	movl	5244(%rsp), %ecx
	movl	%ecx, 4176(%rsp,%rax,4)
	movl	5240(%rsp), %eax
	movl	%eax, 12(%rsp)
	movslq	12(%rsp), %rax
	movl	4176(%rsp,%rax,4), %eax
	movl	%eax, 8(%rsp)
	jmp	.LBB104_32
	.align	16, 0x90
.LBB104_33:                             # %while.body191
                                        #   in Loop: Header=BB104_32 Depth=3
	movslq	12(%rsp), %rax
	movl	%eax, %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movl	4176(%rsp,%rcx,4), %ecx
	movl	%ecx, 4176(%rsp,%rax,4)
	sarl	12(%rsp)
.LBB104_32:                             # %while.cond182
                                        #   Parent Loop BB104_5 Depth=1
                                        #     Parent Loop BB104_13 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	8(%rsp), %rax
	movl	2112(%rsp,%rax,4), %eax
	movl	12(%rsp), %ecx
	sarl	%ecx
	movslq	%ecx, %rcx
	movslq	4176(%rsp,%rcx,4), %rcx
	cmpl	2112(%rsp,%rcx,4), %eax
	jge	.LBB104_34
	jmp	.LBB104_33
	.align	16, 0x90
.LBB104_35:                             # %while.end201
                                        #   in Loop: Header=BB104_5 Depth=1
	cmpl	$516, 5244(%rsp)        # imm = 0x204
	jl	.LBB104_37
# BB#36:                                # %if.then203
                                        #   in Loop: Header=BB104_5 Depth=1
	movl	$2002, %edi             # imm = 0x7D2
	callq	BZ2_bz__AssertH__fail
.LBB104_37:                             # %if.end204
                                        #   in Loop: Header=BB104_5 Depth=1
	movb	$0, 5219(%rsp)
	movl	$1, 5228(%rsp)
	jmp	.LBB104_38
	.align	16, 0x90
.LBB104_44:                             # %for.inc223
                                        #   in Loop: Header=BB104_38 Depth=2
	incl	5228(%rsp)
.LBB104_38:                             # %for.cond205
                                        #   Parent Loop BB104_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB104_40 Depth 3
	movl	5228(%rsp), %eax
	cmpl	5252(%rsp), %eax
	jg	.LBB104_45
# BB#39:                                # %for.body207
                                        #   in Loop: Header=BB104_38 Depth=2
	movl	$0, 5224(%rsp)
	movl	5228(%rsp), %eax
	movl	%eax, 5220(%rsp)
	jmp	.LBB104_40
	.align	16, 0x90
.LBB104_41:                             # %while.body212
                                        #   in Loop: Header=BB104_40 Depth=3
	movslq	5220(%rsp), %rax
	movl	48(%rsp,%rax,4), %eax
	movl	%eax, 5220(%rsp)
	incl	5224(%rsp)
.LBB104_40:                             # %while.cond208
                                        #   Parent Loop BB104_5 Depth=1
                                        #     Parent Loop BB104_38 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	5220(%rsp), %rax
	cmpl	$0, 48(%rsp,%rax,4)
	jns	.LBB104_41
# BB#42:                                # %while.end216
                                        #   in Loop: Header=BB104_38 Depth=2
	movl	5228(%rsp), %eax
	decl	%eax
	movslq	%eax, %rax
	movq	5264(%rsp), %rcx
	movb	5224(%rsp), %dl
	movb	%dl, (%rcx,%rax)
	movl	5224(%rsp), %eax
	cmpl	5248(%rsp), %eax
	jle	.LBB104_44
# BB#43:                                # %if.then221
                                        #   in Loop: Header=BB104_38 Depth=2
	movb	$1, 5219(%rsp)
	jmp	.LBB104_44
	.align	16, 0x90
.LBB104_45:                             # %for.end225
                                        #   in Loop: Header=BB104_5 Depth=1
	cmpb	$0, 5219(%rsp)
	jne	.LBB104_46
# BB#49:                                # %while.end242
	addq	$5272, %rsp             # imm = 0x1498
	ret
.Ltmp363:
	.size	BZ2_hbMakeCodeLengths, .Ltmp363-BZ2_hbMakeCodeLengths
	.cfi_endproc

	.globl	BZ2_hbAssignCodes
	.align	16, 0x90
	.type	BZ2_hbAssignCodes,@function
BZ2_hbAssignCodes:                      # @BZ2_hbAssignCodes
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movl	%edx, -20(%rsp)
	movl	%ecx, -24(%rsp)
	movl	%r8d, -28(%rsp)
	movl	$0, -36(%rsp)
	movl	-20(%rsp), %eax
	movl	%eax, -32(%rsp)
	jmp	.LBB105_1
	.align	16, 0x90
.LBB105_7:                              # %for.inc9
                                        #   in Loop: Header=BB105_1 Depth=1
	shll	-36(%rsp)
	incl	-32(%rsp)
.LBB105_1:                              # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB105_3 Depth 2
	movl	-32(%rsp), %eax
	cmpl	-24(%rsp), %eax
	jg	.LBB105_8
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB105_1 Depth=1
	movl	$0, -40(%rsp)
	jmp	.LBB105_3
	.align	16, 0x90
.LBB105_6:                              # %for.inc
                                        #   in Loop: Header=BB105_3 Depth=2
	incl	-40(%rsp)
.LBB105_3:                              # %for.cond1
                                        #   Parent Loop BB105_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-40(%rsp), %eax
	cmpl	-28(%rsp), %eax
	jge	.LBB105_7
# BB#4:                                 # %for.body3
                                        #   in Loop: Header=BB105_3 Depth=2
	movslq	-40(%rsp), %rax
	movq	-16(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	cmpl	-32(%rsp), %eax
	jne	.LBB105_6
# BB#5:                                 # %if.then
                                        #   in Loop: Header=BB105_3 Depth=2
	movq	-8(%rsp), %rax
	movslq	-40(%rsp), %rcx
	movl	-36(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	-36(%rsp)
	jmp	.LBB105_6
.LBB105_8:                              # %for.end11
	ret
.Ltmp364:
	.size	BZ2_hbAssignCodes, .Ltmp364-BZ2_hbAssignCodes
	.cfi_endproc

	.globl	BZ2_hbCreateDecodeTables
	.align	16, 0x90
	.type	BZ2_hbCreateDecodeTables,@function
BZ2_hbCreateDecodeTables:               # @BZ2_hbCreateDecodeTables
	.cfi_startproc
# BB#0:                                 # %entry
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
	jmp	.LBB106_1
	.align	16, 0x90
.LBB106_7:                              # %for.inc9
                                        #   in Loop: Header=BB106_1 Depth=1
	incl	-52(%rsp)
.LBB106_1:                              # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB106_3 Depth 2
	movl	-52(%rsp), %eax
	cmpl	-40(%rsp), %eax
	jg	.LBB106_8
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB106_1 Depth=1
	movl	$0, -56(%rsp)
	jmp	.LBB106_3
	.align	16, 0x90
.LBB106_6:                              # %for.inc
                                        #   in Loop: Header=BB106_3 Depth=2
	incl	-56(%rsp)
.LBB106_3:                              # %for.cond1
                                        #   Parent Loop BB106_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-56(%rsp), %eax
	cmpl	-44(%rsp), %eax
	jge	.LBB106_7
# BB#4:                                 # %for.body3
                                        #   in Loop: Header=BB106_3 Depth=2
	movslq	-56(%rsp), %rax
	movq	-32(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	cmpl	-52(%rsp), %eax
	jne	.LBB106_6
# BB#5:                                 # %if.then
                                        #   in Loop: Header=BB106_3 Depth=2
	movq	-24(%rsp), %rax
	movslq	-48(%rsp), %rcx
	movl	-56(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	-48(%rsp)
	jmp	.LBB106_6
.LBB106_8:                              # %for.end11
	movl	$0, -52(%rsp)
	jmp	.LBB106_9
	.align	16, 0x90
.LBB106_10:                             # %for.inc18
                                        #   in Loop: Header=BB106_9 Depth=1
	movq	-16(%rsp), %rax
	movslq	-52(%rsp), %rcx
	movl	$0, (%rax,%rcx,4)
	incl	-52(%rsp)
.LBB106_9:                              # %for.cond12
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$22, -52(%rsp)
	jle	.LBB106_10
# BB#11:                                # %for.end20
	movl	$0, -52(%rsp)
	jmp	.LBB106_12
	.align	16, 0x90
.LBB106_13:                             # %for.inc31
                                        #   in Loop: Header=BB106_12 Depth=1
	movslq	-52(%rsp), %rax
	movq	-32(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	-16(%rsp), %rcx
	incl	(%rcx,%rax,4)
	incl	-52(%rsp)
.LBB106_12:                             # %for.cond21
                                        # =>This Inner Loop Header: Depth=1
	movl	-52(%rsp), %eax
	cmpl	-44(%rsp), %eax
	jl	.LBB106_13
# BB#14:                                # %for.end33
	movl	$1, -52(%rsp)
	jmp	.LBB106_15
	.align	16, 0x90
.LBB106_16:                             # %for.inc43
                                        #   in Loop: Header=BB106_15 Depth=1
	movslq	-52(%rsp), %rax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movq	-16(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	addl	%ecx, (%rdx,%rax,4)
	incl	-52(%rsp)
.LBB106_15:                             # %for.cond34
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$22, -52(%rsp)
	jle	.LBB106_16
# BB#17:                                # %for.end45
	movl	$0, -52(%rsp)
	jmp	.LBB106_18
	.align	16, 0x90
.LBB106_19:                             # %for.inc52
                                        #   in Loop: Header=BB106_18 Depth=1
	movq	-8(%rsp), %rax
	movslq	-52(%rsp), %rcx
	movl	$0, (%rax,%rcx,4)
	incl	-52(%rsp)
.LBB106_18:                             # %for.cond46
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$22, -52(%rsp)
	jle	.LBB106_19
# BB#20:                                # %for.end54
	movl	$0, -60(%rsp)
	movl	-36(%rsp), %eax
	movl	%eax, -52(%rsp)
	jmp	.LBB106_21
	.align	16, 0x90
.LBB106_22:                             # %for.inc69
                                        #   in Loop: Header=BB106_21 Depth=1
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
	incl	-52(%rsp)
.LBB106_21:                             # %for.cond55
                                        # =>This Inner Loop Header: Depth=1
	movl	-52(%rsp), %eax
	cmpl	-40(%rsp), %eax
	jle	.LBB106_22
# BB#23:                                # %for.end71
	movl	-36(%rsp), %eax
	incl	%eax
	movl	%eax, -52(%rsp)
	jmp	.LBB106_24
	.align	16, 0x90
.LBB106_25:                             # %for.inc87
                                        #   in Loop: Header=BB106_24 Depth=1
	movslq	-52(%rsp), %rax
	leal	-1(%rax), %ecx
	movslq	%ecx, %rcx
	movq	-8(%rsp), %rdx
	movl	(%rdx,%rcx,4), %ecx
	leal	2(%rcx,%rcx), %ecx
	movq	-16(%rsp), %rdx
	subl	(%rdx,%rax,4), %ecx
	movl	%ecx, (%rdx,%rax,4)
	incl	-52(%rsp)
.LBB106_24:                             # %for.cond73
                                        # =>This Inner Loop Header: Depth=1
	movl	-52(%rsp), %eax
	cmpl	-40(%rsp), %eax
	jle	.LBB106_25
# BB#26:                                # %for.end89
	ret
.Ltmp365:
	.size	BZ2_hbCreateDecodeTables, .Ltmp365-BZ2_hbCreateDecodeTables
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
	movq	-24(%rsp), %rax
	jmp	.LBB107_3
.LBB107_2:                              # %if.else
	movl	$2147483647, %eax       # imm = 0x7FFFFFFF
	addq	-24(%rsp), %rax
.LBB107_3:                              # %if.else
	movq	%rax, seedi(%rip)
	cvtsi2ssq	seedi(%rip), %xmm0
	divss	.LCPI107_0(%rip), %xmm0
	cvtss2sd	%xmm0, %xmm0
	ret
.Ltmp366:
	.size	ran, .Ltmp366-ran
	.cfi_endproc

	.globl	spec_init
	.align	16, 0x90
	.type	spec_init,@function
spec_init:                              # @spec_init
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp368:
	.cfi_def_cfa_offset 32
	cmpl	$4, dbglvl(%rip)
	jl	.LBB108_2
# BB#1:                                 # %if.then
	movl	$.L.str175, %edi
	xorb	%al, %al
	callq	printf
.LBB108_2:                              # %if.end
	movl	$0, 20(%rsp)
	jmp	.LBB108_3
	.align	16, 0x90
.LBB108_9:                              # %for.inc29
                                        #   in Loop: Header=BB108_3 Depth=1
	incl	20(%rsp)
.LBB108_3:                              # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB108_7 Depth 2
	cmpl	$2, 20(%rsp)
	jg	.LBB108_10
# BB#4:                                 # %for.body
                                        #   in Loop: Header=BB108_3 Depth=1
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
# BB#5:                                 # %if.then16
                                        #   in Loop: Header=BB108_3 Depth=1
	movl	$.L.str1176, %edi
	xorb	%al, %al
	callq	printf
	xorl	%edi, %edi
	callq	exit
.LBB108_6:                              # %if.end18
                                        #   in Loop: Header=BB108_3 Depth=1
	movl	$0, 16(%rsp)
	jmp	.LBB108_7
	.align	16, 0x90
.LBB108_8:                              # %for.inc
                                        #   in Loop: Header=BB108_7 Depth=2
	movslq	20(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movq	spec_fd+16(,%rax,8), %rax
	movslq	16(%rsp), %rcx
	movb	$0, (%rax,%rcx)
	addl	$1024, 16(%rsp)         # imm = 0x400
.LBB108_7:                              # %for.cond19
                                        #   Parent Loop BB108_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	16(%rsp), %eax
	cmpl	12(%rsp), %eax
	jge	.LBB108_9
	jmp	.LBB108_8
.LBB108_10:                             # %for.end30
	xorl	%eax, %eax
	addq	$24, %rsp
	ret
.Ltmp369:
	.size	spec_init, .Ltmp369-spec_init
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
.Ltmp372:
	.cfi_def_cfa_offset 16
	subq	$4194320, %rsp          # imm = 0x400010
.Ltmp373:
	.cfi_def_cfa_offset 4194336
.Ltmp374:
	.cfi_offset %rbx, -16
	movl	%edi, 4194316(%rsp)
	cmpl	$5, dbglvl(%rip)
	jl	.LBB109_2
# BB#1:                                 # %if.then
	movl	$.L.str2177, %edi
	xorb	%al, %al
	callq	printf
.LBB109_2:                              # %if.end
	movl	$0, 4194312(%rsp)
	jmp	.LBB109_3
	.align	16, 0x90
.LBB109_9:                              # %for.inc13
                                        #   in Loop: Header=BB109_3 Depth=1
	incl	4194312(%rsp)
.LBB109_3:                              # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB109_7 Depth 2
	cmpl	$31, 4194312(%rsp)
	jg	.LBB109_10
# BB#4:                                 # %for.body
                                        #   in Loop: Header=BB109_3 Depth=1
	cmpl	$6, dbglvl(%rip)
	jl	.LBB109_6
# BB#5:                                 # %if.then3
                                        #   in Loop: Header=BB109_3 Depth=1
	movl	4194312(%rsp), %esi
	movl	$.L.str3178, %edi
	xorb	%al, %al
	callq	printf
.LBB109_6:                              # %if.end5
                                        #   in Loop: Header=BB109_3 Depth=1
	movl	$0, 4194308(%rsp)
	jmp	.LBB109_7
	.align	16, 0x90
.LBB109_8:                              # %for.inc
                                        #   in Loop: Header=BB109_7 Depth=2
	callq	ran
	mulsd	.LCPI109_1(%rip), %xmm0
	cvttsd2si	%xmm0, %eax
	movslq	4194312(%rsp), %rcx
	shlq	$17, %rcx
	leaq	(%rsp,%rcx), %rcx
	movslq	4194308(%rsp), %rdx
	movb	%al, (%rdx,%rcx)
	incl	4194308(%rsp)
.LBB109_7:                              # %for.cond6
                                        #   Parent Loop BB109_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$131071, 4194308(%rsp)  # imm = 0x1FFFF
	jg	.LBB109_9
	jmp	.LBB109_8
.LBB109_10:                             # %for.end15
	cmpl	$5, dbglvl(%rip)
	jl	.LBB109_12
# BB#11:                                # %if.then18
	movl	$.L.str4179, %edi
	xorb	%al, %al
	callq	printf
.LBB109_12:                             # %if.end20
	movl	$0, 4194312(%rsp)
	jmp	.LBB109_13
	.align	16, 0x90
.LBB109_14:                             # %for.inc34
                                        #   in Loop: Header=BB109_13 Depth=1
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
	addl	$131072, 4194312(%rsp)  # imm = 0x20000
.LBB109_13:                             # %for.cond21
                                        # =>This Inner Loop Header: Depth=1
	movslq	4194316(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	4194312(%rsp), %ecx
	cmpl	spec_fd(,%rax,8), %ecx
	jl	.LBB109_14
# BB#15:                                # %for.end35
	movslq	4194316(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	$1048576, spec_fd+4(,%rax,8) # imm = 0x100000
	xorl	%eax, %eax
	addq	$4194320, %rsp          # imm = 0x400010
	popq	%rbx
	ret
.Ltmp375:
	.size	spec_random_load, .Ltmp375-spec_random_load
	.cfi_endproc

	.globl	spec_load
	.align	16, 0x90
	.type	spec_load,@function
spec_load:                              # @spec_load
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp379:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp380:
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
.Ltmp381:
	.cfi_def_cfa_offset 64
.Ltmp382:
	.cfi_offset %rbx, -24
.Ltmp383:
	.cfi_offset %r14, -16
	movl	%edi, 36(%rsp)
	movq	%rsi, 24(%rsp)
	movl	%edx, 20(%rsp)
	movq	24(%rsp), %rdi
	xorl	%esi, %esi
	xorb	%al, %al
	callq	open
	movl	%eax, 16(%rsp)
	testl	%eax, %eax
	jns	.LBB110_2
# BB#1:                                 # %if.then
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
.LBB110_2:                              # %if.end
	movslq	36(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	$0, spec_fd+4(,%rax,8)
	movslq	36(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	$0, spec_fd+8(,%rax,8)
	movl	$0, 8(%rsp)
	jmp	.LBB110_3
	.align	16, 0x90
.LBB110_7:                              # %for.inc
                                        #   in Loop: Header=BB110_3 Depth=1
	movslq	36(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	12(%rsp), %ecx
	addl	%ecx, spec_fd+4(,%rax,8)
	movl	12(%rsp), %eax
	addl	%eax, 8(%rsp)
.LBB110_3:                              # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	8(%rsp), %eax
	cmpl	20(%rsp), %eax
	jge	.LBB110_8
# BB#4:                                 # %for.body
                                        #   in Loop: Header=BB110_3 Depth=1
	movslq	36(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movslq	8(%rsp), %rsi
	addq	spec_fd+16(,%rax,8), %rsi
	movl	16(%rsp), %edi
	movl	$131072, %edx           # imm = 0x20000
	callq	read
	movl	%eax, 12(%rsp)
	testl	%eax, %eax
	je	.LBB110_8
# BB#5:                                 # %if.end13
                                        #   in Loop: Header=BB110_3 Depth=1
	cmpl	$0, 12(%rsp)
	jns	.LBB110_7
# BB#6:                                 # %if.then16
                                        #   in Loop: Header=BB110_3 Depth=1
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
	jmp	.LBB110_7
.LBB110_8:                              # %for.end
	movl	16(%rsp), %edi
	callq	close
	jmp	.LBB110_9
	.align	16, 0x90
.LBB110_14:                             # %if.end48
                                        #   in Loop: Header=BB110_9 Depth=1
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
.LBB110_9:                              # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movslq	36(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd+4(,%rax,8), %eax
	cmpl	20(%rsp), %eax
	jge	.LBB110_15
# BB#10:                                # %while.body
                                        #   in Loop: Header=BB110_9 Depth=1
	movslq	36(%rsp), %rax
	leaq	(%rax,%rax,2), %rcx
	movl	20(%rsp), %eax
	subl	spec_fd+4(,%rcx,8), %eax
	movl	%eax, 4(%rsp)
	movslq	36(%rsp), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	cmpl	spec_fd+4(,%rcx,8), %eax
	jle	.LBB110_12
# BB#11:                                # %if.then39
                                        #   in Loop: Header=BB110_9 Depth=1
	movslq	36(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd+4(,%rax,8), %eax
	movl	%eax, 4(%rsp)
.LBB110_12:                             # %if.end43
                                        #   in Loop: Header=BB110_9 Depth=1
	cmpl	$4, dbglvl(%rip)
	jl	.LBB110_14
# BB#13:                                # %if.then46
                                        #   in Loop: Header=BB110_9 Depth=1
	movl	4(%rsp), %esi
	movl	$.L.str7182, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB110_14
.LBB110_15:                             # %while.end
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	ret
.Ltmp384:
	.size	spec_load, .Ltmp384-spec_load
	.cfi_endproc

	.globl	spec_read
	.align	16, 0x90
	.type	spec_read,@function
spec_read:                              # @spec_read
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp386:
	.cfi_def_cfa_offset 32
	movl	%edi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movl	%edx, 4(%rsp)
	movl	$0, (%rsp)
	cmpl	$5, dbglvl(%rip)
	jl	.LBB111_2
# BB#1:                                 # %if.then
	movl	4(%rsp), %ecx
	movq	8(%rsp), %rdx
	movl	16(%rsp), %esi
	movl	$.L.str8183, %edi
	xorb	%al, %al
	callq	printf
.LBB111_2:                              # %if.end
	cmpl	$4, 16(%rsp)
	jl	.LBB111_4
# BB#3:                                 # %if.then2
	movl	16(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str9184, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
.LBB111_4:                              # %if.end4
	movslq	16(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd+8(,%rax,8), %ecx
	cmpl	spec_fd+4(,%rax,8), %ecx
	jl	.LBB111_8
# BB#5:                                 # %if.then8
	cmpl	$5, dbglvl(%rip)
	jl	.LBB111_7
# BB#6:                                 # %if.then10
	movl	$.L.str10185, %edi
	xorb	%al, %al
	callq	printf
.LBB111_7:                              # %if.end12
	movl	$-1, 20(%rsp)
	jmp	.LBB111_14
.LBB111_8:                              # %if.end13
	movslq	16(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd+8(,%rax,8), %ecx
	addl	4(%rsp), %ecx
	cmpl	spec_fd+4(,%rax,8), %ecx
	jl	.LBB111_10
# BB#9:                                 # %if.then21
	movslq	16(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd+4(,%rax,8), %ecx
	subl	spec_fd+8(,%rax,8), %ecx
	movl	%ecx, (%rsp)
	jmp	.LBB111_11
.LBB111_10:                             # %if.else
	movl	4(%rsp), %eax
	movl	%eax, (%rsp)
.LBB111_11:                             # %if.end28
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
	cmpl	$5, dbglvl(%rip)
	jl	.LBB111_13
# BB#12:                                # %if.then43
	movl	(%rsp), %esi
	movl	$.L.str11186, %edi
	xorb	%al, %al
	callq	printf
.LBB111_13:                             # %if.end45
	movl	(%rsp), %eax
	movl	%eax, 20(%rsp)
.LBB111_14:                             # %return
	movl	20(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp387:
	.size	spec_read, .Ltmp387-spec_read
	.cfi_endproc

	.globl	spec_fread
	.align	16, 0x90
	.type	spec_fread,@function
spec_fread:                             # @spec_fread
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp389:
	.cfi_def_cfa_offset 48
	movq	%rdi, 24(%rsp)
	movl	%esi, 20(%rsp)
	movl	%edx, 16(%rsp)
	movl	%ecx, 12(%rsp)
	movl	$0, 8(%rsp)
	cmpl	$5, dbglvl(%rip)
	jl	.LBB112_2
# BB#1:                                 # %if.then
	movl	12(%rsp), %r8d
	movl	16(%rsp), %ecx
	movl	20(%rsp), %edx
	movq	24(%rsp), %rsi
	movl	$.L.str12187, %edi
	xorb	%al, %al
	callq	printf
.LBB112_2:                              # %if.end
	cmpl	$4, 12(%rsp)
	jl	.LBB112_4
# BB#3:                                 # %if.then2
	movl	12(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str13188, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
.LBB112_4:                              # %if.end4
	movslq	12(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd+8(,%rax,8), %ecx
	cmpl	spec_fd+4(,%rax,8), %ecx
	jl	.LBB112_8
# BB#5:                                 # %if.then8
	cmpl	$5, dbglvl(%rip)
	jl	.LBB112_7
# BB#6:                                 # %if.then10
	movl	$.L.str10185, %edi
	xorb	%al, %al
	callq	printf
.LBB112_7:                              # %if.end12
	movl	$-1, 36(%rsp)
	jmp	.LBB112_14
.LBB112_8:                              # %if.end13
	movslq	12(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	20(%rsp), %ecx
	imull	16(%rsp), %ecx
	addl	spec_fd+8(,%rax,8), %ecx
	cmpl	spec_fd+4(,%rax,8), %ecx
	jl	.LBB112_10
# BB#9:                                 # %if.then21
	movslq	12(%rsp), %rax
	leaq	(%rax,%rax,2), %rcx
	movl	spec_fd+4(,%rcx,8), %eax
	subl	spec_fd+8(,%rcx,8), %eax
	cltd
	idivl	20(%rsp)
	jmp	.LBB112_11
.LBB112_10:                             # %if.else
	movl	16(%rsp), %eax
.LBB112_11:                             # %if.else
	movl	%eax, 8(%rsp)
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
	cmpl	$5, dbglvl(%rip)
	jl	.LBB112_13
# BB#12:                                # %if.then44
	movl	8(%rsp), %esi
	imull	20(%rsp), %esi
	movl	$.L.str11186, %edi
	xorb	%al, %al
	callq	printf
.LBB112_13:                             # %if.end47
	movl	8(%rsp), %eax
	movl	%eax, 36(%rsp)
.LBB112_14:                             # %return
	movl	36(%rsp), %eax
	addq	$40, %rsp
	ret
.Ltmp390:
	.size	spec_fread, .Ltmp390-spec_fread
	.cfi_endproc

	.globl	spec_getc
	.align	16, 0x90
	.type	spec_getc,@function
spec_getc:                              # @spec_getc
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp392:
	.cfi_def_cfa_offset 32
	movl	%edi, 16(%rsp)
	movl	$0, 12(%rsp)
	cmpl	$5, dbglvl(%rip)
	jl	.LBB113_2
# BB#1:                                 # %if.then
	movl	16(%rsp), %esi
	movl	$.L.str14189, %edi
	xorb	%al, %al
	callq	printf
.LBB113_2:                              # %if.end
	cmpl	$4, 16(%rsp)
	jl	.LBB113_4
# BB#3:                                 # %if.then2
	movl	16(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str9184, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
.LBB113_4:                              # %if.end4
	movslq	16(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd+8(,%rax,8), %ecx
	cmpl	spec_fd+4(,%rax,8), %ecx
	jl	.LBB113_8
# BB#5:                                 # %if.then8
	cmpl	$5, dbglvl(%rip)
	jl	.LBB113_7
# BB#6:                                 # %if.then10
	movl	$.L.str10185, %edi
	xorb	%al, %al
	callq	printf
.LBB113_7:                              # %if.end12
	movl	$-1, 20(%rsp)
	jmp	.LBB113_11
.LBB113_8:                              # %if.end13
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
	cmpl	$5, dbglvl(%rip)
	jl	.LBB113_10
# BB#9:                                 # %if.then23
	movl	12(%rsp), %esi
	movl	$.L.str11186, %edi
	xorb	%al, %al
	callq	printf
.LBB113_10:                             # %if.end25
	movl	12(%rsp), %eax
	movl	%eax, 20(%rsp)
.LBB113_11:                             # %return
	movl	20(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp393:
	.size	spec_getc, .Ltmp393-spec_getc
	.cfi_endproc

	.globl	spec_ungetc
	.align	16, 0x90
	.type	spec_ungetc,@function
spec_ungetc:                            # @spec_ungetc
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp395:
	.cfi_def_cfa_offset 32
	movb	%dil, 23(%rsp)
	movl	%esi, 16(%rsp)
	movl	$0, 12(%rsp)
	cmpl	$5, dbglvl(%rip)
	jl	.LBB114_2
# BB#1:                                 # %if.then
	movl	16(%rsp), %esi
	movl	$.L.str15190, %edi
	xorb	%al, %al
	callq	printf
.LBB114_2:                              # %if.end
	cmpl	$4, 16(%rsp)
	jl	.LBB114_4
# BB#3:                                 # %if.then2
	movl	16(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str9184, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
.LBB114_4:                              # %if.end4
	movslq	16(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	cmpl	$0, spec_fd+8(,%rax,8)
	jg	.LBB114_6
# BB#5:                                 # %if.then6
	movslq	16(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	spec_fd+8(,%rax,8), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str16191, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
.LBB114_6:                              # %if.end11
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
	je	.LBB114_8
# BB#7:                                 # %if.then22
	movq	stderr(%rip), %rdi
	movl	$.L.str17192, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
.LBB114_8:                              # %if.end24
	cmpl	$5, dbglvl(%rip)
	jl	.LBB114_10
# BB#9:                                 # %if.then27
	movl	12(%rsp), %esi
	movl	$.L.str11186, %edi
	xorb	%al, %al
	callq	printf
.LBB114_10:                             # %if.end29
	movzbl	23(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp396:
	.size	spec_ungetc, .Ltmp396-spec_ungetc
	.cfi_endproc

	.globl	spec_rewind
	.align	16, 0x90
	.type	spec_rewind,@function
spec_rewind:                            # @spec_rewind
	.cfi_startproc
# BB#0:                                 # %entry
	movl	%edi, -4(%rsp)
	movslq	-4(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	$0, spec_fd+8(,%rax,8)
	xorl	%eax, %eax
	ret
.Ltmp397:
	.size	spec_rewind, .Ltmp397-spec_rewind
	.cfi_endproc

	.globl	spec_reset
	.align	16, 0x90
	.type	spec_reset,@function
spec_reset:                             # @spec_reset
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp399:
	.cfi_def_cfa_offset 16
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
.Ltmp400:
	.size	spec_reset, .Ltmp400-spec_reset
	.cfi_endproc

	.globl	spec_write
	.align	16, 0x90
	.type	spec_write,@function
spec_write:                             # @spec_write
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp402:
	.cfi_def_cfa_offset 32
	movl	%edi, 20(%rsp)
	movq	%rsi, 8(%rsp)
	movl	%edx, 4(%rsp)
	cmpl	$5, dbglvl(%rip)
	jl	.LBB117_2
# BB#1:                                 # %if.then
	movl	4(%rsp), %ecx
	movq	8(%rsp), %rdx
	movl	20(%rsp), %esi
	movl	$.L.str18193, %edi
	xorb	%al, %al
	callq	printf
.LBB117_2:                              # %if.end
	cmpl	$4, 20(%rsp)
	jl	.LBB117_4
# BB#3:                                 # %if.then2
	movl	20(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str19194, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
.LBB117_4:                              # %if.end4
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
	cmpl	$5, dbglvl(%rip)
	jl	.LBB117_6
# BB#5:                                 # %if.then18
	movl	4(%rsp), %esi
	movl	$.L.str11186, %edi
	xorb	%al, %al
	callq	printf
.LBB117_6:                              # %if.end20
	movl	4(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp403:
	.size	spec_write, .Ltmp403-spec_write
	.cfi_endproc

	.globl	spec_fwrite
	.align	16, 0x90
	.type	spec_fwrite,@function
spec_fwrite:                            # @spec_fwrite
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp405:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movl	%esi, 12(%rsp)
	movl	%edx, 8(%rsp)
	movl	%ecx, 4(%rsp)
	cmpl	$5, dbglvl(%rip)
	jl	.LBB118_2
# BB#1:                                 # %if.then
	movl	4(%rsp), %r8d
	movl	8(%rsp), %ecx
	movl	12(%rsp), %edx
	movq	16(%rsp), %rsi
	movl	$.L.str20195, %edi
	xorb	%al, %al
	callq	printf
.LBB118_2:                              # %if.end
	cmpl	$4, 4(%rsp)
	jl	.LBB118_4
# BB#3:                                 # %if.then2
	movl	4(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str21196, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
.LBB118_4:                              # %if.end4
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
	cmpl	$5, dbglvl(%rip)
	jl	.LBB118_6
# BB#5:                                 # %if.then20
	movl	8(%rsp), %esi
	movl	$.L.str11186, %edi
	xorb	%al, %al
	callq	printf
.LBB118_6:                              # %if.end22
	movl	8(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp406:
	.size	spec_fwrite, .Ltmp406-spec_fwrite
	.cfi_endproc

	.globl	spec_putc
	.align	16, 0x90
	.type	spec_putc,@function
spec_putc:                              # @spec_putc
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp408:
	.cfi_def_cfa_offset 16
	movb	%dil, 7(%rsp)
	movl	%esi, (%rsp)
	cmpl	$5, dbglvl(%rip)
	jl	.LBB119_2
# BB#1:                                 # %if.then
	movl	(%rsp), %edx
	movzbl	7(%rsp), %esi
	movl	$.L.str22197, %edi
	xorb	%al, %al
	callq	printf
.LBB119_2:                              # %if.end
	cmpl	$4, (%rsp)
	jl	.LBB119_4
# BB#3:                                 # %if.then3
	movl	(%rsp), %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str19194, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
.LBB119_4:                              # %if.end5
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
.Ltmp409:
	.size	spec_putc, .Ltmp409-spec_putc
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


	.section	".note.GNU-stack","",@progbits
