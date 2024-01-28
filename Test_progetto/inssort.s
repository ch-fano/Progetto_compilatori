	.text
	.file	"inssort.ll"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function inssort
.LCPI0_0:
	.quad	0x3ff0000000000000              # double 1
.LCPI0_1:
	.quad	0xbff0000000000000              # double -1
.LCPI0_2:
	.quad	0x4024000000000000              # double 10
	.text
	.globl	inssort
	.p2align	4, 0x90
	.type	inssort,@function
inssort:                                # @inssort
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movabsq	$4607182418800017408, %rbx      # imm = 0x3FF0000000000000
	movq	%rbx, 16(%rsp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_1
# %bb.2:                                # %forbody.preheader
	movq	A@GOTPCREL(%rip), %r14
	movabsq	$4621819117588971520, %r15      # imm = 0x4024000000000000
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_9:                                # %endcond36
                                        #   in Loop: Header=BB0_3 Depth=1
	movsd	.LCPI0_0(%rip), %xmm1           # xmm1 = mem[0],zero
	ucomisd	24(%rsp), %xmm1
	movapd	%xmm1, %xmm0
	je	.LBB0_10
.LBB0_11:                               # %endcond49
                                        #   in Loop: Header=BB0_3 Depth=1
	movsd	16(%rsp), %xmm2                 # xmm2 = mem[0],zero
	addsd	%xmm1, %xmm2
	movsd	%xmm2, 16(%rsp)
	ucomisd	.LCPI0_2(%rip), %xmm2
	jae	.LBB0_12
.LBB0_3:                                # %forbody
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	movsd	16(%rsp), %xmm0                 # xmm0 = mem[0],zero
	xorps	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	cvttss2si	%xmm1, %eax
	cltq
	movsd	(%r14,%rax,8), %xmm1            # xmm1 = mem[0],zero
	movsd	%xmm1, 8(%rsp)
	movq	%rbx, 24(%rsp)
	movsd	.LCPI0_1(%rip), %xmm1           # xmm1 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rsp)
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_7:                                # %falseexp
                                        #   in Loop: Header=BB0_4 Depth=2
	movsd	8(%rsp), %xmm0                  # xmm0 = mem[0],zero
	movsd	(%rsp), %xmm1                   # xmm1 = mem[0],zero
	movsd	.LCPI0_0(%rip), %xmm2           # xmm2 = mem[0],zero
	addsd	%xmm2, %xmm1
	cvtsd2ss	%xmm1, %xmm1
	cvttss2si	%xmm1, %eax
	cltq
	movsd	%xmm0, (%r14,%rax,8)
	xorps	%xmm0, %xmm0
	movapd	%xmm2, %xmm1
	callq	printval@PLT
	movsd	(%rsp), %xmm0                   # xmm0 = mem[0],zero
	addsd	.LCPI0_0(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	cvttss2si	%xmm0, %eax
	cltq
	movsd	(%r14,%rax,8), %xmm0            # xmm0 = mem[0],zero
	xorpd	%xmm1, %xmm1
	callq	printval@PLT
	movsd	8(%rsp), %xmm0                  # xmm0 = mem[0],zero
	xorpd	%xmm1, %xmm1
	callq	printval@PLT
	movq	%r15, 24(%rsp)
.LBB0_8:                                # %endcond
                                        #   in Loop: Header=BB0_4 Depth=2
	movsd	(%rsp), %xmm0                   # xmm0 = mem[0],zero
	subsd	24(%rsp), %xmm0
	movsd	%xmm0, (%rsp)
	movsd	.LCPI0_1(%rip), %xmm1           # xmm1 = mem[0],zero
.LBB0_4:                                # %forbody
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ucomisd	%xmm0, %xmm1
	jae	.LBB0_9
# %bb.5:                                # %forbody6
                                        #   in Loop: Header=BB0_4 Depth=2
	movsd	8(%rsp), %xmm0                  # xmm0 = mem[0],zero
	movsd	(%rsp), %xmm1                   # xmm1 = mem[0],zero
	cvtsd2ss	%xmm1, %xmm1
	cvttss2si	%xmm1, %eax
	cltq
	ucomisd	(%r14,%rax,8), %xmm0
	jae	.LBB0_7
# %bb.6:                                # %trueexp
                                        #   in Loop: Header=BB0_4 Depth=2
	movsd	(%rsp), %xmm0                   # xmm0 = mem[0],zero
	xorps	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	cvttss2si	%xmm1, %eax
	cltq
	movsd	(%r14,%rax,8), %xmm1            # xmm1 = mem[0],zero
	movsd	.LCPI0_0(%rip), %xmm2           # xmm2 = mem[0],zero
	addsd	%xmm2, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	cvttss2si	%xmm0, %eax
	cltq
	movsd	%xmm1, (%r14,%rax,8)
	xorps	%xmm0, %xmm0
	movapd	%xmm2, %xmm1
	callq	printval@PLT
	movsd	(%rsp), %xmm0                   # xmm0 = mem[0],zero
	addsd	.LCPI0_0(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	cvttss2si	%xmm0, %eax
	cltq
	movsd	(%r14,%rax,8), %xmm0            # xmm0 = mem[0],zero
	xorpd	%xmm1, %xmm1
	callq	printval@PLT
	movsd	(%rsp), %xmm0                   # xmm0 = mem[0],zero
	cvtsd2ss	%xmm0, %xmm0
	cvttss2si	%xmm0, %eax
	cltq
	movsd	(%r14,%rax,8), %xmm0            # xmm0 = mem[0],zero
	xorpd	%xmm1, %xmm1
	callq	printval@PLT
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_10:                               # %trueexp39
                                        #   in Loop: Header=BB0_3 Depth=1
	movsd	8(%rsp), %xmm0                  # xmm0 = mem[0],zero
	movsd	%xmm0, (%r14)
	xorps	%xmm0, %xmm0
	movsd	.LCPI0_0(%rip), %xmm1           # xmm1 = mem[0],zero
	callq	printval@PLT
	xorps	%xmm0, %xmm0
	movsd	.LCPI0_0(%rip), %xmm1           # xmm1 = mem[0],zero
	callq	printval@PLT
	xorps	%xmm0, %xmm0
	movsd	.LCPI0_0(%rip), %xmm1           # xmm1 = mem[0],zero
	callq	printval@PLT
	movsd	(%r14), %xmm0                   # xmm0 = mem[0],zero
	xorps	%xmm1, %xmm1
	callq	printval@PLT
	movsd	8(%rsp), %xmm0                  # xmm0 = mem[0],zero
	xorps	%xmm1, %xmm1
	callq	printval@PLT
	xorpd	%xmm0, %xmm0
	movsd	.LCPI0_0(%rip), %xmm1           # xmm1 = mem[0],zero
	jmp	.LBB0_11
.LBB0_1:
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = mem[0],zero
.LBB0_12:                               # %endcond56
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	inssort, .Lfunc_end0-inssort
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main
.LCPI1_0:
	.quad	0x3ff0000000000000              # double 1
.LCPI1_1:
	.quad	0x4024000000000000              # double 10
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	callq	timek@PLT
	movsd	%xmm0, 24(%rsp)
	callq	randinit@PLT
	movq	$0, 16(%rsp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB1_3
# %bb.1:                                # %forbody.preheader
	movq	A@GOTPCREL(%rip), %rbx
	.p2align	4, 0x90
.LBB1_2:                                # %forbody
                                        # =>This Inner Loop Header: Depth=1
	callq	randk@PLT
	movsd	16(%rsp), %xmm1                 # xmm1 = mem[0],zero
	cvtsd2ss	%xmm1, %xmm1
	cvttss2si	%xmm1, %eax
	cltq
	movsd	%xmm0, (%rbx,%rax,8)
	xorps	%xmm1, %xmm1
	callq	printval@PLT
	movsd	16(%rsp), %xmm0                 # xmm0 = mem[0],zero
	addsd	.LCPI1_0(%rip), %xmm0
	movsd	%xmm0, 16(%rsp)
	ucomisd	.LCPI1_1(%rip), %xmm0
	jb	.LBB1_2
.LBB1_3:                                # %endcond
	movsd	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero
	xorpd	%xmm0, %xmm0
	callq	printval@PLT
	xorpd	%xmm0, %xmm0
	movsd	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero
	callq	printval@PLT
	callq	inssort@PLT
	xorpd	%xmm0, %xmm0
	movsd	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero
	callq	printval@PLT
	xorpd	%xmm0, %xmm0
	movsd	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero
	callq	printval@PLT
	movsd	.LCPI1_0(%rip), %xmm0           # xmm0 = mem[0],zero
	movq	$0, 8(%rsp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB1_6
# %bb.4:                                # %forbody19.preheader
	movq	A@GOTPCREL(%rip), %rbx
	.p2align	4, 0x90
.LBB1_5:                                # %forbody19
                                        # =>This Inner Loop Header: Depth=1
	movsd	8(%rsp), %xmm0                  # xmm0 = mem[0],zero
	xorpd	%xmm1, %xmm1
	callq	printval@PLT
	movsd	8(%rsp), %xmm0                  # xmm0 = mem[0],zero
	cvtsd2ss	%xmm0, %xmm0
	cvttss2si	%xmm0, %eax
	cltq
	movsd	(%rbx,%rax,8), %xmm0            # xmm0 = mem[0],zero
	xorpd	%xmm1, %xmm1
	callq	printval@PLT
	movsd	8(%rsp), %xmm1                  # xmm1 = mem[0],zero
	addsd	.LCPI1_0(%rip), %xmm1
	movsd	%xmm1, 8(%rsp)
	ucomisd	.LCPI1_1(%rip), %xmm1
	jb	.LBB1_5
.LBB1_6:                                # %endcond30
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	A,@object                       # @A
	.comm	A,1,8
	.section	".note.GNU-stack","",@progbits
