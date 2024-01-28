	.text
	.file	"inssort2.ll"
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
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_7
# %bb.1:                                # %forbody.preheader
	movq	A@GOTPCREL(%rip), %rax
	movsd	.LCPI0_1(%rip), %xmm1           # xmm1 = mem[0],zero
	movsd	.LCPI0_0(%rip), %xmm2           # xmm2 = mem[0],zero
	movsd	.LCPI0_2(%rip), %xmm3           # xmm3 = mem[0],zero
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %endcond
                                        #   in Loop: Header=BB0_3 Depth=1
	movsd	-8(%rsp), %xmm0                 # xmm0 = mem[0],zero
	movsd	-16(%rsp), %xmm4                # xmm4 = mem[0],zero
	addsd	%xmm2, %xmm4
	cvtsd2ss	%xmm4, %xmm4
	cvttss2si	%xmm4, %ecx
	movslq	%ecx, %rcx
	movsd	%xmm0, (%rax,%rcx,8)
	movsd	-24(%rsp), %xmm4                # xmm4 = mem[0],zero
	addsd	%xmm2, %xmm4
	movsd	%xmm4, -24(%rsp)
	ucomisd	%xmm3, %xmm4
	jae	.LBB0_8
.LBB0_3:                                # %forbody
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	movsd	-24(%rsp), %xmm0                # xmm0 = mem[0],zero
	xorps	%xmm4, %xmm4
	cvtsd2ss	%xmm0, %xmm4
	cvttss2si	%xmm4, %ecx
	movslq	%ecx, %rcx
	movsd	(%rax,%rcx,8), %xmm4            # xmm4 = mem[0],zero
	movsd	%xmm4, -8(%rsp)
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rsp)
	ucomisd	%xmm0, %xmm1
	jae	.LBB0_2
	.p2align	4, 0x90
.LBB0_4:                                # %forbody
                                        #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cvtsd2ss	%xmm0, %xmm0
	cvttss2si	%xmm0, %ecx
	movslq	%ecx, %rcx
	ucomisd	(%rax,%rcx,8), %xmm4
	jae	.LBB0_2
# %bb.5:                                # %forbody10
                                        #   in Loop: Header=BB0_4 Depth=2
	movsd	-16(%rsp), %xmm0                # xmm0 = mem[0],zero
	xorps	%xmm4, %xmm4
	cvtsd2ss	%xmm0, %xmm4
	cvttss2si	%xmm4, %ecx
	movslq	%ecx, %rcx
	movsd	(%rax,%rcx,8), %xmm4            # xmm4 = mem[0],zero
	movaps	%xmm0, %xmm5
	addsd	%xmm2, %xmm5
	cvtsd2ss	%xmm5, %xmm5
	cvttss2si	%xmm5, %ecx
	movslq	%ecx, %rcx
	movsd	%xmm4, (%rax,%rcx,8)
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rsp)
	ucomisd	%xmm0, %xmm1
	jae	.LBB0_2
# %bb.6:                                # %forbody10
                                        #   in Loop: Header=BB0_4 Depth=2
	movsd	-8(%rsp), %xmm4                 # xmm4 = mem[0],zero
	jmp	.LBB0_4
.LBB0_7:
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = mem[0],zero
.LBB0_8:                                # %endcond31
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
