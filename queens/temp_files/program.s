	.file	"program.prof"
	.text
	.globl	place
	.align	16, 0x90
	.type	place,@function
place:                                  # @place
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp2:
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
.Ltmp3:
	.cfi_def_cfa_offset 32
.Ltmp4:
	.cfi_offset %rbx, -16
	incl	EdgeProfCounters(%rip)
	movl	%edi, 8(%rsp)
	movl	$1, 4(%rsp)
	incl	EdgeProfCounters+4(%rip)
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_7:                                # %if.end
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	EdgeProfCounters+28(%rip)
	incl	EdgeProfCounters+36(%rip)
	incl	4(%rsp)
	incl	EdgeProfCounters+40(%rip)
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	4(%rsp), %eax
	cmpl	8(%rsp), %eax
	jge	.LBB0_8
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	EdgeProfCounters+8(%rip)
	movslq	4(%rsp), %rax
	movl	a(,%rax,4), %eax
	movslq	8(%rsp), %rcx
	cmpl	a(,%rcx,4), %eax
	je	.LBB0_3
# BB#4:                                 # %lor.lhs.false
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	EdgeProfCounters+20(%rip)
	movslq	4(%rsp), %rax
	movl	a(,%rax,4), %edi
	movslq	8(%rsp), %rax
	subl	a(,%rax,4), %edi
	xorb	%al, %al
	callq	abs
	movl	%eax, %ebx
	movl	4(%rsp), %edi
	subl	8(%rsp), %edi
	xorb	%al, %al
	callq	abs
	cmpl	%eax, %ebx
	jne	.LBB0_7
# BB#5:                                 # %lor.lhs.false.if.then_crit_edge
	incl	EdgeProfCounters+24(%rip)
	jmp	.LBB0_6
.LBB0_8:                                # %for.end
	incl	EdgeProfCounters+12(%rip)
	movl	$1, 12(%rsp)
	incl	EdgeProfCounters+44(%rip)
	jmp	.LBB0_9
.LBB0_3:                                # %for.body.if.then_crit_edge
	incl	EdgeProfCounters+16(%rip)
.LBB0_6:                                # %if.then
	movl	$0, 12(%rsp)
	incl	EdgeProfCounters+32(%rip)
.LBB0_9:                                # %return
	movl	12(%rsp), %eax
	addq	$16, %rsp
	popq	%rbx
	ret
.Ltmp5:
	.size	place, .Ltmp5-place
	.cfi_endproc

	.globl	print_sol
	.align	16, 0x90
	.type	print_sol,@function
print_sol:                              # @print_sol
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp7:
	.cfi_def_cfa_offset 32
	incl	EdgeProfCounters+48(%rip)
	movl	%edi, 20(%rsp)
	movl	count(%rip), %edx
	incl	%edx
	movl	%edx, count(%rip)
	movq	fp(%rip), %rdi
	movl	$.L.str, %esi
	xorb	%al, %al
	callq	fprintf
	movl	$1, 16(%rsp)
	incl	EdgeProfCounters+52(%rip)
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_8:                                # %for.end
                                        #   in Loop: Header=BB1_1 Depth=1
	incl	EdgeProfCounters+72(%rip)
	movq	fp(%rip), %rdi
	movl	$.L.str3, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+100(%rip)
	incl	16(%rsp)
	incl	EdgeProfCounters+104(%rip)
.LBB1_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	movl	16(%rsp), %eax
	cmpl	20(%rsp), %eax
	jg	.LBB1_9
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	incl	EdgeProfCounters+56(%rip)
	movl	$1, 12(%rsp)
	incl	EdgeProfCounters+64(%rip)
	jmp	.LBB1_3
	.align	16, 0x90
.LBB1_7:                                # %if.end
                                        #   in Loop: Header=BB1_3 Depth=2
	incl	EdgeProfCounters+92(%rip)
	incl	12(%rsp)
	incl	EdgeProfCounters+96(%rip)
.LBB1_3:                                # %for.cond1
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	12(%rsp), %eax
	cmpl	20(%rsp), %eax
	jg	.LBB1_8
# BB#4:                                 # %for.body3
                                        #   in Loop: Header=BB1_3 Depth=2
	incl	EdgeProfCounters+68(%rip)
	movslq	16(%rsp), %rax
	movl	a(,%rax,4), %eax
	cmpl	12(%rsp), %eax
	jne	.LBB1_6
# BB#5:                                 # %if.then
                                        #   in Loop: Header=BB1_3 Depth=2
	incl	EdgeProfCounters+76(%rip)
	movq	fp(%rip), %rdi
	movl	$.L.str1, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+84(%rip)
	jmp	.LBB1_7
	.align	16, 0x90
.LBB1_6:                                # %if.else
                                        #   in Loop: Header=BB1_3 Depth=2
	incl	EdgeProfCounters+80(%rip)
	movq	fp(%rip), %rdi
	movl	$.L.str2, %esi
	xorb	%al, %al
	callq	fprintf
	incl	EdgeProfCounters+88(%rip)
	jmp	.LBB1_7
.LBB1_9:                                # %for.end11
	incl	EdgeProfCounters+60(%rip)
	addq	$24, %rsp
	ret
.Ltmp8:
	.size	print_sol, .Ltmp8-print_sol
	.cfi_endproc

	.globl	queen
	.align	16, 0x90
	.type	queen,@function
queen:                                  # @queen
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp10:
	.cfi_def_cfa_offset 16
	incl	EdgeProfCounters+108(%rip)
	movl	%edi, 4(%rsp)
	movl	$1, (%rsp)
	movslq	(%rsp), %rax
	movl	$0, a(,%rax,4)
	incl	EdgeProfCounters+112(%rip)
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_13:                               # %if.else20
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+156(%rip)
	decl	(%rsp)
	incl	EdgeProfCounters+180(%rip)
	incl	EdgeProfCounters+184(%rip)
.LBB2_1:                                # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_3 Depth 2
	cmpl	$0, (%rsp)
	je	.LBB2_14
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+116(%rip)
	movslq	(%rsp), %rax
	incl	a(,%rax,4)
	incl	EdgeProfCounters+124(%rip)
	jmp	.LBB2_3
	.align	16, 0x90
.LBB2_7:                                # %while.body9
                                        #   in Loop: Header=BB2_3 Depth=2
	incl	EdgeProfCounters+140(%rip)
	movslq	(%rsp), %rax
	incl	a(,%rax,4)
	incl	EdgeProfCounters+148(%rip)
.LBB2_3:                                # %while.cond5
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	(%rsp), %rax
	movl	a(,%rax,4), %eax
	cmpl	4(%rsp), %eax
	jg	.LBB2_4
# BB#5:                                 # %land.rhs
                                        #   in Loop: Header=BB2_3 Depth=2
	incl	EdgeProfCounters+128(%rip)
	movl	(%rsp), %edi
	callq	place
	incl	EdgeProfCounters+136(%rip)
	testl	%eax, %eax
	sete	%al
	jmp	.LBB2_6
	.align	16, 0x90
.LBB2_4:                                # %while.cond5.land.end_crit_edge
                                        #   in Loop: Header=BB2_3 Depth=2
	incl	EdgeProfCounters+132(%rip)
	xorb	%al, %al
.LBB2_6:                                # %land.end
                                        #   in Loop: Header=BB2_3 Depth=2
	cmpb	$1, %al
	je	.LBB2_7
# BB#8:                                 # %while.end
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+144(%rip)
	movslq	(%rsp), %rax
	movl	a(,%rax,4), %eax
	cmpl	4(%rsp), %eax
	jg	.LBB2_13
# BB#9:                                 # %if.then
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+152(%rip)
	movl	(%rsp), %eax
	cmpl	4(%rsp), %eax
	jne	.LBB2_11
# BB#10:                                # %if.then16
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+160(%rip)
	movl	4(%rsp), %edi
	callq	print_sol
	incl	EdgeProfCounters+168(%rip)
	jmp	.LBB2_12
	.align	16, 0x90
.LBB2_11:                               # %if.else
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+164(%rip)
	incl	(%rsp)
	movslq	(%rsp), %rax
	movl	$0, a(,%rax,4)
	incl	EdgeProfCounters+172(%rip)
.LBB2_12:                               # %if.else
                                        #   in Loop: Header=BB2_1 Depth=1
	incl	EdgeProfCounters+176(%rip)
	incl	EdgeProfCounters+184(%rip)
	jmp	.LBB2_1
.LBB2_14:                               # %while.end22
	incl	EdgeProfCounters+120(%rip)
	popq	%rax
	ret
.Ltmp11:
	.size	queen, .Ltmp11-queen
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI3_0:
	.quad	4696837146684686336     # double 1.000000e+06
                                        #  (0x412e848000000000)
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp14:
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
.Ltmp15:
	.cfi_def_cfa_offset 48
.Ltmp16:
	.cfi_offset %rbx, -16
	movq	%rsi, %rbx
	movl	$EdgeProfCounters, %edx
	movl	$51, %ecx
	callq	llvm_start_edge_profiling
	incl	EdgeProfCounters+188(%rip)
	movl	$0, 28(%rsp)
	movl	%eax, 24(%rsp)
	movq	%rbx, 16(%rsp)
	movq	16(%rbx), %rdi
	movl	$.L.str4, %esi
	callq	fopen
	movq	%rax, fp(%rip)
	testq	%rax, %rax
	je	.LBB3_2
# BB#1:                                 # %entry.if.end_crit_edge
	incl	EdgeProfCounters+196(%rip)
	jmp	.LBB3_3
.LBB3_2:                                # %if.then
	incl	EdgeProfCounters+192(%rip)
	movq	16(%rsp), %rax
	movq	16(%rax), %rsi
	movl	$.L.str5, %edi
	xorb	%al, %al
	callq	printf
	xorl	%edi, %edi
	callq	exit
	incl	EdgeProfCounters+200(%rip)
.LBB3_3:                                # %if.end
	callq	clock
	movq	%rax, begin(%rip)
	movq	16(%rsp), %rax
	movq	8(%rax), %rdi
	xorb	%al, %al
	callq	atoi
	movl	%eax, 8(%rsp)
	movl	%eax, %edi
	callq	queen
	callq	clock
	movq	%rax, end(%rip)
	subq	begin(%rip), %rax
	cvtsi2sdq	%rax, %xmm0
	divsd	.LCPI3_0(%rip), %xmm0
	movsd	%xmm0, (%rsp)           # 8-byte Spill
	movsd	%xmm0, time_spent(%rip)
	movq	16(%rsp), %rax
	movq	8(%rax), %rdi
	xorb	%al, %al
	callq	atoi
	movl	count(%rip), %edx
	movl	$.L.str6, %edi
	movsd	(%rsp), %xmm0           # 8-byte Reload
	movl	%eax, %esi
	movb	$1, %al
	callq	printf
	movq	fp(%rip), %rdi
	callq	fclose
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	ret
.Ltmp17:
	.size	main, .Ltmp17-main
	.cfi_endproc

	.type	count,@object           # @count
	.bss
	.globl	count
	.align	4
count:
	.long	0                       # 0x0
	.size	count, 4

	.type	a,@object               # @a
	.comm	a,120,16
	.type	fp,@object              # @fp
	.comm	fp,8,8
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "\n\nSolution #%d:\n"
	.size	.L.str, 17

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "Q\t"
	.size	.L.str1, 3

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "*\t"
	.size	.L.str2, 3

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "\n"
	.size	.L.str3, 2

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	 "w"
	.size	.L.str4, 2

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	 "\n\n\nCould not open file %s"
	.size	.L.str5, 26

	.type	begin,@object           # @begin
	.comm	begin,8,8
	.type	end,@object             # @end
	.comm	end,8,8
	.type	time_spent,@object      # @time_spent
	.comm	time_spent,8,8
	.type	.L.str6,@object         # @.str6
.L.str6:
	.asciz	 "\nDuration: %f \t Queens: %d \t Solutions: %d"
	.size	.L.str6, 43

	.type	EdgeProfCounters,@object # @EdgeProfCounters
	.local	EdgeProfCounters
	.comm	EdgeProfCounters,204,16

	.section	".note.GNU-stack","",@progbits
