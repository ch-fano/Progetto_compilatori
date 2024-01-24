	.text
	.file	"fibonacciIt.ll"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function fibo
.LCPI0_0:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	fibo
	.p2align	4, 0x90
	.type	fibo,@function
fibo:                                   # @fibo
	.cfi_startproc
# %bb.0:                                # %entry
	movsd	%xmm0, -16(%rsp)
	movq	$0, -32(%rsp)
	movabsq	$4607182418800017408, %rax      # imm = 0x3FF0000000000000
	movq	%rax, -40(%rsp)
	movq	%rax, -24(%rsp)
	movsd	.LCPI0_0(%rip), %xmm1           # xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	jae	.LBB0_2
	.p2align	4, 0x90
.LBB0_1:                                # %forbody
                                        # =>This Inner Loop Header: Depth=1
	movsd	-40(%rsp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, -8(%rsp)
	movsd	-32(%rsp), %xmm2                # xmm2 = mem[0],zero
	addsd	%xmm0, %xmm2
	movsd	%xmm2, -40(%rsp)
	movsd	%xmm0, -32(%rsp)
	movsd	-24(%rsp), %xmm0                # xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rsp)
	ucomisd	-16(%rsp), %xmm0
	jb	.LBB0_1
.LBB0_2:                                # %endcond
	movsd	-40(%rsp), %xmm0                # xmm0 = mem[0],zero
	retq
.Lfunc_end0:
	.size	fibo, .Lfunc_end0-fibo
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
