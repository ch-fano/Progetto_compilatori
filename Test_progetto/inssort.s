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
	movabsq	$4607182418800017408, %rax      # imm = 0x3FF0000000000000
	movq	%rax, -24(%rsp)
	xorl	%ecx, %ecx
	testb	%cl, %cl
	jne	.LBB0_11
# %bb.1:                                # %forbody.preheader
	movq	A@GOTPCREL(%rip), %rcx
	movsd	.LCPI0_1(%rip), %xmm1           # xmm1 = mem[0],zero
	movsd	.LCPI0_0(%rip), %xmm2           # xmm2 = mem[0],zero
	movabsq	$4621819117588971520, %rdx      # imm = 0x4024000000000000
	movsd	.LCPI0_2(%rip), %xmm3           # xmm3 = mem[0],zero
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_2:                                # %endcond22
                                        #   in Loop: Header=BB0_4 Depth=1
	ucomisd	-8(%rsp), %xmm2
	movapd	%xmm2, %xmm0
	je	.LBB0_10
.LBB0_3:                                # %endcond28
                                        #   in Loop: Header=BB0_4 Depth=1
	movsd	-24(%rsp), %xmm4                # xmm4 = mem[0],zero
	addsd	%xmm2, %xmm4
	movsd	%xmm4, -24(%rsp)
	ucomisd	%xmm3, %xmm4
	jae	.LBB0_12
.LBB0_4:                                # %forbody
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
	movsd	-24(%rsp), %xmm0                # xmm0 = mem[0],zero
	xorps	%xmm4, %xmm4
	cvtsd2ss	%xmm0, %xmm4
	cvttss2si	%xmm4, %esi
	movslq	%esi, %rsi
	movsd	(%rcx,%rsi,8), %xmm4            # xmm4 = mem[0],zero
	movsd	%xmm4, -16(%rsp)
	movq	%rax, -8(%rsp)
	addsd	%xmm1, %xmm0
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_5:                                # %falseexp
                                        #   in Loop: Header=BB0_7 Depth=2
	movsd	-16(%rsp), %xmm0                # xmm0 = mem[0],zero
	movsd	-32(%rsp), %xmm4                # xmm4 = mem[0],zero
	addsd	%xmm2, %xmm4
	cvtsd2ss	%xmm4, %xmm4
	cvttss2si	%xmm4, %esi
	movslq	%esi, %rsi
	movsd	%xmm0, (%rcx,%rsi,8)
	movq	%rdx, -8(%rsp)
.LBB0_6:                                # %endcond
                                        #   in Loop: Header=BB0_7 Depth=2
	movsd	-32(%rsp), %xmm0                # xmm0 = mem[0],zero
	subsd	-8(%rsp), %xmm0
.LBB0_7:                                # %forbody
                                        #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsd	%xmm0, -32(%rsp)
	ucomisd	%xmm0, %xmm1
	jae	.LBB0_2
# %bb.8:                                # %forbody6
                                        #   in Loop: Header=BB0_7 Depth=2
	movsd	-16(%rsp), %xmm0                # xmm0 = mem[0],zero
	movsd	-32(%rsp), %xmm4                # xmm4 = mem[0],zero
	cvtsd2ss	%xmm4, %xmm4
	cvttss2si	%xmm4, %esi
	movslq	%esi, %rsi
	ucomisd	(%rcx,%rsi,8), %xmm0
	jae	.LBB0_5
# %bb.9:                                # %trueexp
                                        #   in Loop: Header=BB0_7 Depth=2
	movsd	-32(%rsp), %xmm0                # xmm0 = mem[0],zero
	xorps	%xmm4, %xmm4
	cvtsd2ss	%xmm0, %xmm4
	cvttss2si	%xmm4, %esi
	movslq	%esi, %rsi
	movsd	(%rcx,%rsi,8), %xmm4            # xmm4 = mem[0],zero
	addsd	%xmm2, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	cvttss2si	%xmm0, %esi
	movslq	%esi, %rsi
	movsd	%xmm4, (%rcx,%rsi,8)
	jmp	.LBB0_6
	.p2align	4, 0x90
.LBB0_10:                               # %trueexp25
                                        #   in Loop: Header=BB0_4 Depth=1
	movsd	-16(%rsp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, (%rcx)
	xorpd	%xmm0, %xmm0
	jmp	.LBB0_3
.LBB0_11:
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = mem[0],zero
.LBB0_12:                               # %endcond35
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
	movq	$0, 8(%rsp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB1_3
# %bb.1:                                # %forbody.preheader
	movq	A@GOTPCREL(%rip), %rbx
	.p2align	4, 0x90
.LBB1_2:                                # %forbody
                                        # =>This Inner Loop Header: Depth=1
	callq	randk@PLT
	movsd	8(%rsp), %xmm1                  # xmm1 = mem[0],zero
	cvtsd2ss	%xmm1, %xmm1
	cvttss2si	%xmm1, %eax
	cltq
	movsd	%xmm0, (%rbx,%rax,8)
	xorps	%xmm1, %xmm1
	callq	printval@PLT
	movsd	8(%rsp), %xmm0                  # xmm0 = mem[0],zero
	addsd	.LCPI1_0(%rip), %xmm0
	movsd	%xmm0, 8(%rsp)
	ucomisd	.LCPI1_1(%rip), %xmm0
	jb	.LBB1_2
.LBB1_3:                                # %endcond
	movsd	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero
	xorpd	%xmm0, %xmm0
	callq	printval@PLT
	callq	inssort@PLT
	movsd	.LCPI1_0(%rip), %xmm0           # xmm0 = mem[0],zero
	movq	$0, 16(%rsp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB1_6
# %bb.4:                                # %forbody16.preheader
	movq	A@GOTPCREL(%rip), %rbx
	.p2align	4, 0x90
.LBB1_5:                                # %forbody16
                                        # =>This Inner Loop Header: Depth=1
	movsd	16(%rsp), %xmm0                 # xmm0 = mem[0],zero
	cvtsd2ss	%xmm0, %xmm0
	cvttss2si	%xmm0, %eax
	cltq
	movsd	(%rbx,%rax,8), %xmm0            # xmm0 = mem[0],zero
	xorpd	%xmm1, %xmm1
	callq	printval@PLT
	movsd	16(%rsp), %xmm1                 # xmm1 = mem[0],zero
	addsd	.LCPI1_0(%rip), %xmm1
	movsd	%xmm1, 16(%rsp)
	ucomisd	.LCPI1_1(%rip), %xmm1
	jb	.LBB1_5
.LBB1_6:                                # %endcond25
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
	.comm	A,80,16
	.section	".note.GNU-stack","",@progbits
