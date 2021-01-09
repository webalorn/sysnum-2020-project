	.text
	.file	"clock.cpp"
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -16
	sw	s0, 12(sp)
	sw	s1, 8(sp)
	sw	s2, 4(sp)
	sw	s3, 0(sp)
	lui	a0, 655360
	addi	a1, zero, 10
	sw	a1, 4(a0)
	addi	a7, zero, 48
	addi	a6, zero, 58
	addi	a3, zero, 8
	addi	t0, zero, 49
	addi	a5, zero, 50
	addi	a2, zero, 51
	addi	a1, zero, 52
	addi	a4, zero, 53
	addi	t1, zero, 54
	addi	t2, zero, 55
	addi	t3, zero, 56
	addi	t4, zero, 57
	addi	t5, zero, 13
	addi	t6, zero, 1
	j	.LBB0_2
.LBB0_1:                                #   in Loop: Header=BB0_2 Depth=1
	sw	t6, 0(a0)
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
                                        #       Child Loop BB0_4 Depth 3
                                        #         Child Loop BB0_5 Depth 4
	addi	s2, zero, 48
	addi	s3, zero, 48
.LBB0_3:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_4 Depth 3
                                        #         Child Loop BB0_5 Depth 4
	sw	s2, 4(a0)
	sw	s3, 4(a0)
	sw	a6, 4(a0)
	addi	s0, zero, 48
.LBB0_4:                                #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_3 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_5 Depth 4
	sw	s0, 4(a0)
	addi	s1, zero, 48
.LBB0_5:                                #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_3 Depth=2
                                        #       Parent Loop BB0_4 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	sw	s1, 4(a0)
	sw	a6, 4(a0)
	sw	a7, 4(a0)
	sw	a7, 4(a0)
	sw	a3, 4(a0)
	sw	t0, 4(a0)
	sw	a3, 4(a0)
	sw	a5, 4(a0)
	sw	a3, 4(a0)
	sw	a2, 4(a0)
	sw	a3, 4(a0)
	sw	a1, 4(a0)
	sw	a3, 4(a0)
	sw	a4, 4(a0)
	sw	a3, 4(a0)
	sw	t1, 4(a0)
	sw	a3, 4(a0)
	sw	t2, 4(a0)
	sw	a3, 4(a0)
	sw	t3, 4(a0)
	sw	a3, 4(a0)
	sw	t4, 4(a0)
	sw	a3, 4(a0)
	sw	a3, 4(a0)
	sw	t0, 4(a0)
	sw	a7, 4(a0)
	sw	a3, 4(a0)
	sw	t0, 4(a0)
	sw	a3, 4(a0)
	sw	a5, 4(a0)
	sw	a3, 4(a0)
	sw	a2, 4(a0)
	sw	a3, 4(a0)
	sw	a1, 4(a0)
	sw	a3, 4(a0)
	sw	a4, 4(a0)
	sw	a3, 4(a0)
	sw	t1, 4(a0)
	sw	a3, 4(a0)
	sw	t2, 4(a0)
	sw	a3, 4(a0)
	sw	t3, 4(a0)
	sw	a3, 4(a0)
	sw	t4, 4(a0)
	sw	a3, 4(a0)
	sw	a3, 4(a0)
	sw	a5, 4(a0)
	sw	a7, 4(a0)
	sw	a3, 4(a0)
	sw	t0, 4(a0)
	sw	a3, 4(a0)
	sw	a5, 4(a0)
	sw	a3, 4(a0)
	sw	a2, 4(a0)
	sw	a3, 4(a0)
	sw	a1, 4(a0)
	sw	a3, 4(a0)
	sw	a4, 4(a0)
	sw	a3, 4(a0)
	sw	t1, 4(a0)
	sw	a3, 4(a0)
	sw	t2, 4(a0)
	sw	a3, 4(a0)
	sw	t3, 4(a0)
	sw	a3, 4(a0)
	sw	t4, 4(a0)
	sw	a3, 4(a0)
	sw	a3, 4(a0)
	sw	a2, 4(a0)
	sw	a7, 4(a0)
	sw	a3, 4(a0)
	sw	t0, 4(a0)
	sw	a3, 4(a0)
	sw	a5, 4(a0)
	sw	a3, 4(a0)
	sw	a2, 4(a0)
	sw	a3, 4(a0)
	sw	a1, 4(a0)
	sw	a3, 4(a0)
	sw	a4, 4(a0)
	sw	a3, 4(a0)
	sw	t1, 4(a0)
	sw	a3, 4(a0)
	sw	t2, 4(a0)
	sw	a3, 4(a0)
	sw	t3, 4(a0)
	sw	a3, 4(a0)
	sw	t4, 4(a0)
	sw	a3, 4(a0)
	sw	a3, 4(a0)
	sw	a1, 4(a0)
	sw	a7, 4(a0)
	sw	a3, 4(a0)
	sw	t0, 4(a0)
	sw	a3, 4(a0)
	sw	a5, 4(a0)
	sw	a3, 4(a0)
	sw	a2, 4(a0)
	sw	a3, 4(a0)
	sw	a1, 4(a0)
	sw	a3, 4(a0)
	sw	a4, 4(a0)
	sw	a3, 4(a0)
	sw	t1, 4(a0)
	sw	a3, 4(a0)
	sw	t2, 4(a0)
	sw	a3, 4(a0)
	sw	t3, 4(a0)
	sw	a3, 4(a0)
	sw	t4, 4(a0)
	sw	a3, 4(a0)
	sw	a3, 4(a0)
	sw	a4, 4(a0)
	sw	a7, 4(a0)
	sw	a3, 4(a0)
	sw	t0, 4(a0)
	sw	a3, 4(a0)
	sw	a5, 4(a0)
	sw	a3, 4(a0)
	sw	a2, 4(a0)
	sw	a3, 4(a0)
	sw	a1, 4(a0)
	sw	a3, 4(a0)
	sw	a4, 4(a0)
	sw	a3, 4(a0)
	sw	t1, 4(a0)
	sw	a3, 4(a0)
	sw	t2, 4(a0)
	sw	a3, 4(a0)
	sw	t3, 4(a0)
	sw	a3, 4(a0)
	sw	t4, 4(a0)
	sw	a3, 4(a0)
	sw	a3, 4(a0)
	addi	s1, s1, 1
	sw	a3, 4(a0)
	sw	a3, 4(a0)
	bne	s1, a6, .LBB0_5
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=3
	addi	s0, s0, 1
	sw	a3, 4(a0)
	bne	s0, t1, .LBB0_4
# %bb.7:                                #   in Loop: Header=BB0_3 Depth=2
	sw	t5, 4(a0)
	addi	s1, s3, 1
	xori	s0, s1, 58
	seqz	s0, s0
	addi	s3, zero, 48
	bne	s1, a6, .LBB0_10
# %bb.8:                                #   in Loop: Header=BB0_3 Depth=2
	add	s2, s2, s0
	bne	s3, a1, .LBB0_3
.LBB0_9:                                #   in Loop: Header=BB0_3 Depth=2
	beq	s2, a5, .LBB0_1
	j	.LBB0_3
.LBB0_10:                               #   in Loop: Header=BB0_3 Depth=2
	mv	s3, s1
	add	s2, s2, s0
	beq	s3, a1, .LBB0_9
	j	.LBB0_3
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
