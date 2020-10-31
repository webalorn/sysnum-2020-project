	.text
	.file	"clock.cpp"
	.globl	main                    # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	a4, zero, 48
	addi	a5, zero, 10
	lui	a0, 655360
	addi	a1, zero, 58
	addi	t1, zero, 54
	addi	t0, zero, 52
	addi	a7, zero, 50
	addi	a6, zero, 1
	addi	t2, zero, 13
	addi	a2, zero, 48
	addi	a3, zero, 48
	addi	t5, zero, 48
	addi	t4, zero, 48
	addi	t3, zero, 48
	j	.LBB0_3
.LBB0_1:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a2, zero, 48
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	sw	t2, 4(a0)
	sw	t3, 4(a0)
	sw	t4, 4(a0)
	sw	a1, 4(a0)
	sw	t5, 4(a0)
	sw	a3, 4(a0)
	sw	a1, 4(a0)
	sw	a2, 4(a0)
	add	a4, zero, a5
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	sw	a5, 4(a0)
	addi	a5, a4, 1
	bne	a5, a1, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a2, a2, 1
	addi	a5, zero, 48
	bne	a2, t1, .LBB0_2
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a3, a3, 1
	addi	a5, zero, 48
	bne	a3, a1, .LBB0_1
# %bb.6:                                #   in Loop: Header=BB0_3 Depth=1
	addi	t5, t5, 1
	addi	a5, zero, 48
	beq	t5, t1, .LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a2, zero, 48
	addi	a3, zero, 48
	j	.LBB0_2
.LBB0_8:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a3, t4, 1
	xori	a2, a3, 58
	seqz	a2, a2
	addi	a5, zero, 48
	addi	t4, zero, 48
	beq	a3, a1, .LBB0_10
# %bb.9:                                #   in Loop: Header=BB0_3 Depth=1
	add	t4, zero, a3
.LBB0_10:                               #   in Loop: Header=BB0_3 Depth=1
	add	t3, t3, a2
	bne	t4, t0, .LBB0_13
# %bb.11:                               #   in Loop: Header=BB0_3 Depth=1
	bne	t3, a7, .LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_3 Depth=1
	sw	a6, 0(a0)
	addi	t3, zero, 50
	addi	t4, zero, 52
.LBB0_13:                               #   in Loop: Header=BB0_3 Depth=1
	addi	a2, zero, 48
	addi	a3, zero, 48
	addi	t5, zero, 48
	j	.LBB0_2
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
