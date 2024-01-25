	.text
	.file	"sqrt2.ll"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function iterate
.LCPI0_0:
	.quad	0x3f1a36e2eb1c432d              # double 1.0E-4
.LCPI0_1:
	.quad	0x4000000000000000              # double 2
	.text
	.globl	iterate
	.p2align	4, 0x90
	.type	iterate,@function
iterate:                                # @iterate
	.cfi_startproc
# %bb.0:                                # %entry
	movsd	%xmm0, -24(%rsp)
	movsd	%xmm1, -32(%rsp)
	movabsq	$4547007122018943789, %rax      # imm = 0x3F1A36E2EB1C432D
	movq	%rax, -16(%rsp)
	mulsd	%xmm1, %xmm1
	movsd	%xmm1, -8(%rsp)
	movapd	%xmm1, %xmm3
	subsd	%xmm0, %xmm3
	movsd	.LCPI0_0(%rip), %xmm2           # xmm2 = mem[0],zero
	ucomisd	%xmm3, %xmm2
	jb	.LBB0_2
# %bb.1:                                # %entry
	subsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm2
	jae	.LBB0_5
.LBB0_2:                                # %forbody.preheader
	movsd	.LCPI0_1(%rip), %xmm0           # xmm0 = mem[0],zero
	.p2align	4, 0x90
.LBB0_3:                                # %forbody
                                        # =>This Inner Loop Header: Depth=1
	movsd	-32(%rsp), %xmm2                # xmm2 = mem[0],zero
	movsd	-24(%rsp), %xmm1                # xmm1 = mem[0],zero
	movapd	%xmm1, %xmm3
	divsd	%xmm2, %xmm3
	addsd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm2
	movsd	%xmm2, -8(%rsp)
	divsd	%xmm0, %xmm3
	movsd	%xmm3, -32(%rsp)
	movsd	-16(%rsp), %xmm3                # xmm3 = mem[0],zero
	movapd	%xmm2, %xmm4
	subsd	%xmm1, %xmm4
	ucomisd	%xmm4, %xmm3
	jb	.LBB0_3
# %bb.4:                                # %forbody
                                        #   in Loop: Header=BB0_3 Depth=1
	subsd	%xmm2, %xmm1
	ucomisd	%xmm1, %xmm3
	jb	.LBB0_3
.LBB0_5:                                # %endcond
	movsd	-32(%rsp), %xmm0                # xmm0 = mem[0],zero
	retq
.Lfunc_end0:
	.size	iterate, .Lfunc_end0-iterate
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function sqrt
.LCPI1_0:
	.quad	0x3ff0000000000000              # double 1
.LCPI1_1:
	.quad	0x4000000000000000              # double 2
	.text
	.globl	sqrt
	.p2align	4, 0x90
	.type	sqrt,@function
sqrt:                                   # @sqrt
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movapd	%xmm0, %xmm1
	movsd	%xmm0, (%rsp)
	movsd	.LCPI1_0(%rip), %xmm0           # xmm0 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	je	.LBB1_5
# %bb.1:                                # %falseexp
	movsd	(%rsp), %xmm0                   # xmm0 = mem[0],zero
	ucomisd	.LCPI1_0(%rip), %xmm0
	jae	.LBB1_3
# %bb.2:                                # %trueexp4
	movsd	(%rsp), %xmm0                   # xmm0 = mem[0],zero
	movsd	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero
	subsd	%xmm0, %xmm1
	jmp	.LBB1_4
.LBB1_3:                                # %falseexp7
	movsd	(%rsp), %xmm0                   # xmm0 = mem[0],zero
	movapd	%xmm0, %xmm1
	divsd	.LCPI1_1(%rip), %xmm1
.LBB1_4:                                # %endcond11
	callq	iterate@PLT
.LBB1_5:                                # %endcond11
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	sqrt, .Lfunc_end1-sqrt
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
