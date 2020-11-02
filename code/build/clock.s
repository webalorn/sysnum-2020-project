	.text
	.file	"clock.cpp"
	.globl	_Z9breakdownRjS_j       # -- Begin function _Z9breakdownRjS_j
	.p2align	2
	.type	_Z9breakdownRjS_j,@function
_Z9breakdownRjS_j:                      # @_Z9breakdownRjS_j
# %bb.0:
	lw	a3, 0(a0)
	bgeu	a2, a3, .LBB0_2
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a1)
	addi	a3, a3, 1
	sw	a3, 0(a1)
	lw	a3, 0(a0)
	sub	a3, a3, a2
	sw	a3, 0(a0)
	bltu	a2, a3, .LBB0_1
.LBB0_2:
	ret
.Lfunc_end0:
	.size	_Z9breakdownRjS_j, .Lfunc_end0-_Z9breakdownRjS_j
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	sw	s1, 36(sp)
	sw	s2, 32(sp)
	addi	a0, zero, 48
	sw	a0, 28(sp)
	sw	a0, 24(sp)
	sw	a0, 20(sp)
	sw	a0, 16(sp)
	sw	a0, 12(sp)
	sw	a0, 8(sp)
	lui	s1, 524288
	lw	a0, 4(s1)
	sw	a0, 4(sp)
	lui	a0, 9
	addi	a2, a0, -864
	addi	s0, sp, 4
	addi	a1, sp, 8
	mv	a0, s0
	call	_Z9breakdownRjS_j
	lui	a0, 1
	addi	a2, a0, -496
	addi	a1, sp, 12
	mv	a0, s0
	call	_Z9breakdownRjS_j
	addi	a1, sp, 16
	addi	a2, zero, 600
	mv	a0, s0
	call	_Z9breakdownRjS_j
	addi	a1, sp, 20
	addi	a2, zero, 60
	mv	a0, s0
	call	_Z9breakdownRjS_j
	addi	a1, sp, 24
	addi	a2, zero, 10
	addi	s2, zero, 10
	mv	a0, s0
	call	_Z9breakdownRjS_j
	addi	a1, sp, 28
	addi	a2, zero, 1
	mv	a0, s0
	call	_Z9breakdownRjS_j
	lui	a0, 655360
	sw	s2, 4(a0)
	lw	a1, 8(sp)
	sw	a1, 4(a0)
	lw	a1, 12(sp)
	sw	a1, 4(a0)
	addi	a1, zero, 58
	sw	a1, 4(a0)
	lw	a2, 16(sp)
	sw	a2, 4(a0)
	lw	a2, 20(sp)
	sw	a2, 4(a0)
	sw	a1, 4(a0)
	lw	a4, 24(sp)
	sw	a4, 4(a0)
	lw	a3, 28(sp)
	sw	a3, 4(a0)
	lw	s0, 20(sp)
	lw	t2, 16(sp)
	lw	t0, 12(sp)
	lw	a7, 8(sp)
	addi	a2, zero, 8
	addi	t1, zero, 54
	addi	a6, zero, 13
	j	.LBB1_6
.LBB1_1:                                #   in Loop: Header=BB1_6 Depth=1
	sw	a7, 4(a0)
	sw	t0, 4(a0)
	sw	a1, 4(a0)
.LBB1_2:                                #   in Loop: Header=BB1_6 Depth=1
	sw	t2, 4(a0)
	addi	s0, zero, 48
.LBB1_3:                                #   in Loop: Header=BB1_6 Depth=1
	sw	s0, 4(a0)
	sw	a1, 4(a0)
	addi	a4, zero, 48
.LBB1_4:                                #   in Loop: Header=BB1_6 Depth=1
	sw	a4, 4(a0)
	addi	a3, zero, 48
.LBB1_5:                                #   in Loop: Header=BB1_6 Depth=1
	sw	a3, 4(a0)
.LBB1_6:                                # =>This Inner Loop Header: Depth=1
	lw	a5, 0(s1)
	beqz	a5, .LBB1_6
# %bb.7:                                #   in Loop: Header=BB1_6 Depth=1
	addi	a3, a3, 1
	sw	a2, 4(a0)
	bne	a3, a1, .LBB1_5
# %bb.8:                                #   in Loop: Header=BB1_6 Depth=1
	addi	a4, a4, 1
	sw	a2, 4(a0)
	bne	a4, t1, .LBB1_4
# %bb.9:                                #   in Loop: Header=BB1_6 Depth=1
	addi	s0, s0, 1
	sw	a2, 4(a0)
	sw	a2, 4(a0)
	bne	s0, a1, .LBB1_3
# %bb.10:                               #   in Loop: Header=BB1_6 Depth=1
	addi	t2, t2, 1
	sw	a2, 4(a0)
	bne	t2, t1, .LBB1_2
# %bb.11:                               #   in Loop: Header=BB1_6 Depth=1
	sw	a6, 4(a0)
	addi	a4, t0, 1
	xori	a3, a4, 58
	seqz	a3, a3
	add	a3, a7, a3
	addi	t2, zero, 48
	addi	s0, zero, 48
	beq	a4, a1, .LBB1_13
# %bb.12:                               #   in Loop: Header=BB1_6 Depth=1
	mv	s0, a4
.LBB1_13:                               #   in Loop: Header=BB1_6 Depth=1
	xori	a4, s0, 52
	xori	a5, a3, 50
	or	a4, a4, a5
	addi	a7, zero, 48
	addi	t0, zero, 48
	beqz	a4, .LBB1_1
# %bb.14:                               #   in Loop: Header=BB1_6 Depth=1
	mv	a7, a3
	mv	t0, s0
	j	.LBB1_1
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
                                        # -- End function
	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
