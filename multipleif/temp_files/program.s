	.file	"prog.tail.bc"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI0_0:
	.quad	4696837146684686336     # double 1.000000e+06
                                        #  (0x412e848000000000)
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$56, %rsp
.Ltmp1:
	.cfi_def_cfa_offset 64
	movl	$0, 52(%rsp)
	movl	$.L.str, %edi
	movl	$.L.str1, %esi
	callq	fopen
	movq	%rax, 40(%rsp)
	testq	%rax, %rax
	jne	.LBB0_2
# BB#1:                                 # %if.then
	movl	$.L.str2, %edi
	xorb	%al, %al
	callq	printf
	xorl	%edi, %edi
	callq	exit
.LBB0_2:                                # %if.end
	callq	clock
	movq	%rax, 32(%rsp)
	movl	$0, 12(%rsp)
	movl	$0, 8(%rsp)
	movl	$0, 4(%rsp)
	.align	16, 0x90
.LBB0_3:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	movl	12(%rsp), %eax
	incl	%eax
	movslq	%eax, %rax
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movl	%eax, 12(%rsp)
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$34, %rcx
	addl	%edx, %ecx
	imull	$10, %ecx, %ecx
	cmpl	%ecx, %eax
	je	.LBB0_5
# BB#4:                                 # %if.then4
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	12(%rsp), %edx
	movq	40(%rsp), %rdi
	movl	$.L.str3, %esi
	xorb	%al, %al
	callq	fprintf
	jmp	.LBB0_6
	.align	16, 0x90
.LBB0_5:                                # %if.else
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	40(%rsp), %rdi
	movl	$.L.str4, %esi
	xorb	%al, %al
	callq	fprintf
.LBB0_6:                                # %if.end7
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	12(%rsp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	andl	$-2, %ecx
	cmpl	%ecx, %eax
	je	.LBB0_8
# BB#7:                                 # %lor.lhs.false
                                        #   in Loop: Header=BB0_3 Depth=1
	movslq	12(%rsp), %rax
	imulq	$1431655766, %rax, %rcx # imm = 0x55555556
	movq	%rcx, %rdx
	shrq	$63, %rdx
	shrq	$32, %rcx
	addl	%edx, %ecx
	leal	(%rcx,%rcx,2), %ecx
	cmpl	%ecx, %eax
	jne	.LBB0_9
.LBB0_8:                                # %if.then12
                                        #   in Loop: Header=BB0_3 Depth=1
	incl	8(%rsp)
	jmp	.LBB0_10
	.align	16, 0x90
.LBB0_9:                                # %if.else14
                                        #   in Loop: Header=BB0_3 Depth=1
	incl	4(%rsp)
.LBB0_10:                               # %do.cond
                                        #   in Loop: Header=BB0_3 Depth=1
	cmpl	$10000000, 12(%rsp)     # imm = 0x989680
	jl	.LBB0_3
# BB#11:                                # %do.end
	callq	clock
	movq	%rax, 24(%rsp)
	subq	32(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	divsd	.LCPI0_0(%rip), %xmm0
	movsd	%xmm0, 16(%rsp)
	movl	$.L.str5, %edi
	movb	$1, %al
	callq	printf
	movq	40(%rsp), %rdi
	callq	fclose
	xorl	%eax, %eax
	addq	$56, %rsp
	ret
.Ltmp2:
	.size	main, .Ltmp2-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "sample.txt"
	.size	.L.str, 11

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "w"
	.size	.L.str1, 2

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "\n\n\n\n------>Couldn't open sample.txt for writing.\n"
	.size	.L.str2, 50

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "%d"
	.size	.L.str3, 3

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	 "\n"
	.size	.L.str4, 2

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	 "\n---->Time Spent: %f"
	.size	.L.str5, 21


	.section	".note.GNU-stack","",@progbits
