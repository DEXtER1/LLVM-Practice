	.file	"progO3.tail.bc"
	.text
	.globl	place
	.align	16, 0x90
	.type	place,@function
place:                                  # @place
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp7:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp8:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp9:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp10:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp11:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp12:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp13:
	.cfi_def_cfa_offset 64
.Ltmp14:
	.cfi_offset %rbx, -56
.Ltmp15:
	.cfi_offset %r12, -48
.Ltmp16:
	.cfi_offset %r13, -40
.Ltmp17:
	.cfi_offset %r14, -32
.Ltmp18:
	.cfi_offset %r15, -24
.Ltmp19:
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	movslq	%ebx, %r15
	movl	%r15d, %r12d
	negl	%r12d
	movl	$1, %r13d
	.align	16, 0x90
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, %ebp
	cmpl	%ebx, %r13d
	jge	.LBB0_4
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	a(,%r15,4), %eax
	movl	a(,%r13,4), %edi
	xorl	%ebp, %ebp
	subl	%eax, %edi
	je	.LBB0_4
# BB#3:                                 # %lor.lhs.false
                                        #   in Loop: Header=BB0_1 Depth=1
	xorb	%al, %al
	callq	abs
	movl	%eax, %r14d
	leal	(%r12,%r13), %edi
	xorb	%al, %al
	callq	abs
	incq	%r13
	cmpl	%eax, %r14d
	jne	.LBB0_1
.LBB0_4:                                # %return
	movl	%ebp, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp20:
	.size	place, .Ltmp20-place
	.cfi_endproc

	.globl	print_sol
	.align	16, 0x90
	.type	print_sol,@function
print_sol:                              # @print_sol
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp26:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp27:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp28:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp29:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp30:
	.cfi_def_cfa_offset 48
.Ltmp31:
	.cfi_offset %rbx, -40
.Ltmp32:
	.cfi_offset %r14, -32
.Ltmp33:
	.cfi_offset %r15, -24
.Ltmp34:
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	movl	count(%rip), %edx
	incl	%edx
	movl	%edx, count(%rip)
	movq	fp(%rip), %rdi
	movl	$.L.str, %esi
	xorb	%al, %al
	callq	fprintf
	testl	%ebx, %ebx
	jle	.LBB1_8
# BB#1:                                 # %for.cond1.preheader.lr.ph.for.cond1.preheader.lr.ph.split_crit_edge
	leal	1(%rbx), %ebp
	movl	$1, %r14d
	.align	16, 0x90
.LBB1_2:                                # %for.body3.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	xorl	%r15d, %r15d
	.align	16, 0x90
.LBB1_3:                                # %for.body3
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	incl	%r15d
	movq	fp(%rip), %rcx
	cmpl	a(,%r14,4), %r15d
	jne	.LBB1_5
# BB#4:                                 # %if.then
                                        #   in Loop: Header=BB1_3 Depth=2
	movl	$.L.str1, %edi
	jmp	.LBB1_6
	.align	16, 0x90
.LBB1_5:                                # %if.else
                                        #   in Loop: Header=BB1_3 Depth=2
	movl	$.L.str2, %edi
.LBB1_6:                                # %if.else
                                        #   in Loop: Header=BB1_3 Depth=2
	movl	$2, %esi
	movl	$1, %edx
	callq	fwrite
	cmpl	%r15d, %ebx
	jne	.LBB1_3
# BB#7:                                 # %for.end
                                        #   in Loop: Header=BB1_2 Depth=1
	movq	fp(%rip), %rsi
	movl	$10, %edi
	callq	fputc
	incq	%r14
	cmpl	%ebp, %r14d
	jne	.LBB1_2
.LBB1_8:                                # %for.end11
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp35:
	.size	print_sol, .Ltmp35-print_sol
	.cfi_endproc

	.globl	queen
	.align	16, 0x90
	.type	queen,@function
queen:                                  # @queen
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp43:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp44:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp45:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp46:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp47:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp48:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp49:
	.cfi_def_cfa_offset 64
.Ltmp50:
	.cfi_offset %rbx, -56
.Ltmp51:
	.cfi_offset %r12, -48
.Ltmp52:
	.cfi_offset %r13, -40
.Ltmp53:
	.cfi_offset %r14, -32
.Ltmp54:
	.cfi_offset %r15, -24
.Ltmp55:
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	movl	$0, a+4(%rip)
	movl	$1, %ecx
	.align	16, 0x90
.LBB2_1:                                # %while.body.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_14 Depth 2
                                        #       Child Loop BB2_15 Depth 3
                                        #     Child Loop BB2_2 Depth 2
                                        #       Child Loop BB2_3 Depth 3
                                        #         Child Loop BB2_4 Depth 4
	movl	%ecx, 4(%rsp)           # 4-byte Spill
	movslq	%ecx, %r12
	cmpl	%ebx, %r12d
	je	.LBB2_2
# BB#12:                                # %while.body
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	a(,%r12,4), %eax
	incl	%eax
	movl	%eax, a(,%r12,4)
	movl	$1, %r13d
	jmp	.LBB2_14
	.align	16, 0x90
.LBB2_11:                               # %if.then16.us.while.body.us_crit_edge
                                        #   in Loop: Header=BB2_2 Depth=2
	movl	%ebx, %edi
	callq	print_sol
.LBB2_2:                                # %while.body.us
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_3 Depth 3
                                        #         Child Loop BB2_4 Depth 4
	movl	a(,%r12,4), %eax
	incl	%eax
	movl	%eax, a(,%r12,4)
	movl	$1, %r15d
	jmp	.LBB2_3
	.align	16, 0x90
.LBB2_8:                                # %while.cond5.loopexit.us
                                        #   in Loop: Header=BB2_3 Depth=3
	incl	%eax
	movl	%eax, a(,%r12,4)
.LBB2_3:                                # %while.body.us
                                        #   Parent Loop BB2_1 Depth=1
                                        #     Parent Loop BB2_2 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_4 Depth 4
	cmpl	%ebx, %eax
	movq	%r15, %r13
	jg	.LBB2_10
.LBB2_4:                                # %for.cond.i.us
                                        #   Parent Loop BB2_1 Depth=1
                                        #     Parent Loop BB2_2 Depth=2
                                        #       Parent Loop BB2_3 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	%r13d, %ebp
	subl	%ebx, %ebp
	jge	.LBB2_9
# BB#5:                                 # %for.body.i.us
                                        #   in Loop: Header=BB2_4 Depth=4
	movl	a(,%r12,4), %ecx
	movl	a(,%r13,4), %eax
	movl	%eax, %edi
	subl	%ecx, %edi
	je	.LBB2_8
# BB#6:                                 # %lor.lhs.false.i.us
                                        #   in Loop: Header=BB2_4 Depth=4
	xorb	%al, %al
	callq	abs
	movl	%eax, %r14d
	movl	%ebp, %edi
	xorb	%al, %al
	callq	abs
	incq	%r13
	cmpl	%eax, %r14d
	jne	.LBB2_4
# BB#7:                                 # %lor.lhs.false.i.us.while.cond5.loopexit.us_crit_edge
                                        #   in Loop: Header=BB2_3 Depth=3
	movl	a(,%r12,4), %eax
	jmp	.LBB2_8
.LBB2_9:                                # %while.end.loopexit.us
                                        #   in Loop: Header=BB2_2 Depth=2
	movl	a(,%r12,4), %eax
	.align	16, 0x90
.LBB2_10:                               # %while.end.us
                                        #   in Loop: Header=BB2_2 Depth=2
	cmpl	%ebx, %eax
	jg	.LBB2_24
	jmp	.LBB2_11
	.align	16, 0x90
.LBB2_13:                               # %while.cond5.loopexit
                                        #   in Loop: Header=BB2_14 Depth=2
	incl	%eax
	movl	%eax, a(,%r12,4)
.LBB2_14:                               # %while.cond5.loopexit
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_15 Depth 3
	cmpl	%ebx, %eax
	movq	%r13, %r15
	jg	.LBB2_20
.LBB2_15:                               # %for.cond.i
                                        #   Parent Loop BB2_1 Depth=1
                                        #     Parent Loop BB2_14 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	%r15d, %ebp
	subl	4(%rsp), %ebp           # 4-byte Folded Reload
	jge	.LBB2_19
# BB#16:                                # %for.body.i
                                        #   in Loop: Header=BB2_15 Depth=3
	movl	a(,%r12,4), %ecx
	movl	a(,%r15,4), %eax
	movl	%eax, %edi
	subl	%ecx, %edi
	je	.LBB2_13
# BB#17:                                # %lor.lhs.false.i
                                        #   in Loop: Header=BB2_15 Depth=3
	xorb	%al, %al
	callq	abs
	movl	%eax, %r14d
	movl	%ebp, %edi
	xorb	%al, %al
	callq	abs
	incq	%r15
	cmpl	%eax, %r14d
	jne	.LBB2_15
# BB#18:                                # %lor.lhs.false.i.while.cond5.loopexit_crit_edge
                                        #   in Loop: Header=BB2_14 Depth=2
	movl	a(,%r12,4), %eax
	jmp	.LBB2_13
	.align	16, 0x90
.LBB2_19:                               # %while.end.loopexit
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	a(,%r12,4), %eax
.LBB2_20:                               # %while.end
                                        #   in Loop: Header=BB2_1 Depth=1
	cmpl	%ebx, %eax
	jle	.LBB2_21
.LBB2_24:                               # %if.else20
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	4(%rsp), %ecx           # 4-byte Reload
	decl	%ecx
	jmp	.LBB2_22
	.align	16, 0x90
.LBB2_21:                               # %if.else
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	4(%rsp), %ecx           # 4-byte Reload
	incl	%ecx
	movslq	%ecx, %rax
	movl	$0, a(,%rax,4)
.LBB2_22:                               # %while.cond.outer.backedge
                                        #   in Loop: Header=BB2_1 Depth=1
	testl	%ecx, %ecx
	jne	.LBB2_1
# BB#23:                                # %while.end22
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp56:
	.size	queen, .Ltmp56-queen
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
.Ltmp59:
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
.Ltmp60:
	.cfi_def_cfa_offset 32
.Ltmp61:
	.cfi_offset %rbx, -16
	movq	%rsi, %rbx
	movq	16(%rbx), %rdi
	movl	$.L.str4, %esi
	callq	fopen
	movq	%rax, fp(%rip)
	testq	%rax, %rax
	je	.LBB3_2
# BB#1:                                 # %if.end
	callq	clock
	movq	%rax, begin(%rip)
	movq	8(%rbx), %rdi
	xorb	%al, %al
	callq	atoi
	movl	%eax, %edi
	callq	queen
	callq	clock
	movq	%rax, end(%rip)
	subq	begin(%rip), %rax
	cvtsi2sdq	%rax, %xmm0
	divsd	.LCPI3_0(%rip), %xmm0
	movsd	%xmm0, 8(%rsp)          # 8-byte Spill
	movsd	%xmm0, time_spent(%rip)
	movq	8(%rbx), %rdi
	xorb	%al, %al
	callq	atoi
	movl	count(%rip), %edx
	movl	$.L.str6, %edi
	movsd	8(%rsp), %xmm0          # 8-byte Reload
	movl	%eax, %esi
	movb	$1, %al
	callq	printf
	movq	fp(%rip), %rdi
	callq	fclose
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	ret
.LBB3_2:                                # %if.then
	movq	16(%rbx), %rsi
	movl	$.L.str5, %edi
	xorb	%al, %al
	callq	printf
	xorl	%edi, %edi
	callq	exit
.Ltmp62:
	.size	main, .Ltmp62-main
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


	.section	".note.GNU-stack","",@progbits
