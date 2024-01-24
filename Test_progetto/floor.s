	.text
	.file	"floor.ll"
	.globl	pow2                            # -- Begin function pow2
	.p2align	4, 0x90
	.type	pow2,@function
pow2:                                   # @pow2
	.cfi_startproc
# %bb.0:                                # %entry
	movapd	%xmm0, %xmm2
	movsd	%xmm0, -8(%rsp)
	movsd	%xmm1, -16(%rsp)
	addsd	%xmm1, %xmm1
	xorpd	%xmm0, %xmm0
	ucomisd	%xmm1, %xmm2
	jae	.LBB0_2
# %bb.1:                                # %trueexp
	movsd	-16(%rsp), %xmm0                # xmm0 = mem[0],zero
.LBB0_2:                                # %endcond
	retq
.Lfunc_end0:
	.size	pow2, .Lfunc_end0-pow2
	.cfi_endproc
                                        # -- End function
	.globl	intpart                         # -- Begin function intpart
	.p2align	4, 0x90
	.type	intpart,@function
intpart:                                # @intpart
	.cfi_startproc
# %bb.0:                                # %entry
	movsd	%xmm0, -16(%rsp)
	movsd	%xmm1, -24(%rsp)
	movq	$0, -8(%rsp)
	xorps	%xmm0, %xmm0
	xorl	%eax, %eax
	testb	%al, %al
	je	.LBB1_1
# %bb.2:                                # %endcond8
	retq
.LBB1_1:                                # %trueexp5
	movsd	-24(%rsp), %xmm0                # xmm0 = mem[0],zero
	retq
.Lfunc_end1:
	.size	intpart, .Lfunc_end1-intpart
	.cfi_endproc
                                        # -- End function
	.globl	floor                           # -- Begin function floor
	.p2align	4, 0x90
	.type	floor,@function
floor:                                  # @floor
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movsd	%xmm0, (%rsp)
	xorps	%xmm1, %xmm1
	callq	intpart@PLT
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	floor, .Lfunc_end2-floor
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
