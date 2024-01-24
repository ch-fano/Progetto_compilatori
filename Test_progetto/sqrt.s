	.text
	.file	"sqrt.ll"
	.globl	err                             # -- Begin function err
	.p2align	4, 0x90
	.type	err,@function
err:                                    # @err
	.cfi_startproc
# %bb.0:                                # %entry
	movapd	%xmm0, %xmm2
	movsd	%xmm0, -16(%rsp)
	movsd	%xmm1, -8(%rsp)
	xorpd	%xmm0, %xmm0
	ucomisd	%xmm1, %xmm2
	jae	.LBB0_2
# %bb.1:                                # %trueexp
	movsd	-8(%rsp), %xmm0                 # xmm0 = mem[0],zero
	subsd	-16(%rsp), %xmm0
.LBB0_2:                                # %endcond
	retq
.Lfunc_end0:
	.size	err, .Lfunc_end0-err
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function iterate
.LCPI1_0:
	.quad	0x3f1a36e2eb1c432d              # double 1.0E-4
.LCPI1_1:
	.quad	0x4000000000000000              # double 2
	.text
	.globl	iterate
	.p2align	4, 0x90
	.type	iterate,@function
iterate:                                # @iterate
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movaps	%xmm0, %xmm2
	movsd	%xmm0, 16(%rsp)
	movsd	%xmm1, (%rsp)
	movabsq	$4547007122018943789, %rax      # imm = 0x3F1A36E2EB1C432D
	movq	%rax, 24(%rsp)
	mulsd	%xmm1, %xmm1
	movsd	%xmm1, 32(%rsp)
	movapd	%xmm1, %xmm0
	movaps	%xmm2, %xmm1
	callq	err@PLT
	movsd	.LCPI1_0(%rip), %xmm1           # xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	jae	.LBB1_3
	.p2align	4, 0x90
.LBB1_1:                                # %forbody
                                        # =>This Inner Loop Header: Depth=1
	movsd	(%rsp), %xmm0                   # xmm0 = mem[0],zero
	movsd	16(%rsp), %xmm1                 # xmm1 = mem[0],zero
	movapd	%xmm1, %xmm2
	divsd	%xmm0, %xmm2
	addsd	%xmm0, %xmm2
	mulsd	%xmm0, %xmm0
	movsd	%xmm0, 32(%rsp)
	divsd	.LCPI1_1(%rip), %xmm2
	movsd	%xmm2, (%rsp)
	movsd	24(%rsp), %xmm2                 # xmm2 = mem[0],zero
	movsd	%xmm2, 8(%rsp)                  # 8-byte Spill
	callq	err@PLT
	movsd	8(%rsp), %xmm1                  # 8-byte Reload
                                        # xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	jb	.LBB1_1
.LBB1_3:                                # %endcond
	movsd	(%rsp), %xmm0                   # xmm0 = mem[0],zero
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	iterate, .Lfunc_end1-iterate
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function sqrt
.LCPI2_0:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	sqrt
	.p2align	4, 0x90
	.type	sqrt,@function
sqrt:                                   # @sqrt
	.cfi_startproc
# %bb.0:                                # %entry
	movapd	%xmm0, %xmm1
	movsd	%xmm0, -8(%rsp)
	movsd	.LCPI2_0(%rip), %xmm0           # xmm0 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	je	.LBB2_2
# %bb.1:                                # %falseexp
	xorpd	%xmm0, %xmm0
.LBB2_2:                                # %endcond
	retq
.Lfunc_end2:
	.size	sqrt, .Lfunc_end2-sqrt
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
