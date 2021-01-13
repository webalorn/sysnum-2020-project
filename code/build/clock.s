	.text
	.file	"clock.cpp"
	.globl	__mulsi3                # -- Begin function __mulsi3
	.p2align	2
	.type	__mulsi3,@function
__mulsi3:                               # @__mulsi3
# %bb.0:
	mv	a2, zero
	beqz	a1, .LBB0_2
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	andi	a3, a1, 1
	neg	a3, a3
	and	a3, a3, a0
	add	a2, a3, a2
	srli	a1, a1, 1
	slli	a0, a0, 1
	bnez	a1, .LBB0_1
.LBB0_2:
	mv	a0, a2
	ret
.Lfunc_end0:
	.size	__mulsi3, .Lfunc_end0-__mulsi3
                                        # -- End function
	.globl	__udivsi3               # -- Begin function __udivsi3
	.p2align	2
	.type	__udivsi3,@function
__udivsi3:                              # @__udivsi3
# %bb.0:
	srli	a2, a0, 1
	addi	a3, zero, 1
	bltu	a2, a1, .LBB1_3
# %bb.1:
	addi	a3, zero, 1
.LBB1_2:                                # =>This Inner Loop Header: Depth=1
	slli	a1, a1, 1
	addi	a3, a3, 1
	bgeu	a2, a1, .LBB1_2
.LBB1_3:
	mv	a2, zero
	bnez	a3, .LBB1_6
.LBB1_4:
	mv	a0, a2
	ret
.LBB1_5:                                #   in Loop: Header=BB1_6 Depth=1
	sub	a0, a0, a5
	or	a2, a2, a4
	srli	a1, a1, 1
	beqz	a3, .LBB1_4
.LBB1_6:                                # =>This Inner Loop Header: Depth=1
	mv	a5, zero
	addi	a3, a3, -1
	slli	a2, a2, 1
	sltu	a4, a0, a1
	xori	a4, a4, 1
	bltu	a0, a1, .LBB1_5
# %bb.7:                                #   in Loop: Header=BB1_6 Depth=1
	mv	a5, a1
	j	.LBB1_5
.Lfunc_end1:
	.size	__udivsi3, .Lfunc_end1-__udivsi3
                                        # -- End function
	.globl	_Z9breakdownRjS_j       # -- Begin function _Z9breakdownRjS_j
	.p2align	2
	.type	_Z9breakdownRjS_j,@function
_Z9breakdownRjS_j:                      # @_Z9breakdownRjS_j
# %bb.0:
	lw	a3, 0(a0)
	bgeu	a2, a3, .LBB2_2
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a1)
	addi	a3, a3, 1
	sw	a3, 0(a1)
	lw	a3, 0(a0)
	sub	a3, a3, a2
	sw	a3, 0(a0)
	bltu	a2, a3, .LBB2_1
.LBB2_2:
	ret
.Lfunc_end2:
	.size	_Z9breakdownRjS_j, .Lfunc_end2-_Z9breakdownRjS_j
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -80
	sw	ra, 76(sp)
	sw	s0, 72(sp)
	sw	s1, 68(sp)
	sw	s2, 64(sp)
	sw	s3, 60(sp)
	sw	s4, 56(sp)
	sw	s5, 52(sp)
	sw	s6, 48(sp)
	sw	s7, 44(sp)
	sw	s8, 40(sp)
	addi	a0, zero, 48
	sw	a0, 36(sp)
	sw	a0, 32(sp)
	sw	a0, 28(sp)
	sw	a0, 24(sp)
	sw	a0, 20(sp)
	sw	a0, 16(sp)
	lui	s1, 524288
	lw	a0, 4(s1)
	lui	a1, 786635
	addi	a1, a1, -1264
	add	s2, a0, a1
	lui	a0, 21
	addi	a1, a0, 384
	mv	a0, s2
	call	__udivsi3
	mv	s3, a0
	lui	a0, 1048555
	addi	a1, a0, -384
	mv	a0, s3
	call	__mulsi3
	add	a0, a0, s2
	sw	a0, 12(sp)
	lui	a0, 9
	addi	a2, a0, -864
	addi	s2, sp, 12
	addi	a1, sp, 16
	mv	a0, s2
	call	_Z9breakdownRjS_j
	lui	a0, 1
	addi	a2, a0, -496
	addi	a1, sp, 20
	mv	a0, s2
	call	_Z9breakdownRjS_j
	addi	a1, sp, 24
	addi	a2, zero, 600
	mv	a0, s2
	call	_Z9breakdownRjS_j
	addi	a1, sp, 28
	addi	a2, zero, 60
	mv	a0, s2
	call	_Z9breakdownRjS_j
	addi	a1, sp, 32
	addi	a2, zero, 10
	addi	s4, zero, 10
	mv	a0, s2
	call	_Z9breakdownRjS_j
	addi	a1, sp, 36
	addi	a2, zero, 1
	mv	a0, s2
	call	_Z9breakdownRjS_j
	lui	s0, 655360
	sw	s4, 4(s0)
	mv	a0, s3
	call	_Z8showDatej
	lw	a0, 16(sp)
	sw	a0, 4(s0)
	lw	a0, 20(sp)
	sw	a0, 4(s0)
	addi	s2, zero, 58
	sw	s2, 4(s0)
	lw	a0, 24(sp)
	sw	a0, 4(s0)
	lw	a0, 28(sp)
	sw	a0, 4(s0)
	sw	s2, 4(s0)
	lw	a4, 32(sp)
	sw	a4, 4(s0)
	lw	a5, 36(sp)
	sw	a5, 4(s0)
	lw	a3, 28(sp)
	lw	a2, 24(sp)
	lw	a1, 20(sp)
	lw	a6, 16(sp)
	addi	s4, zero, 8
	addi	s5, zero, 54
	addi	s6, zero, 52
	addi	s7, zero, 50
	addi	s8, zero, 13
	j	.LBB3_6
.LBB3_1:                                #   in Loop: Header=BB3_6 Depth=1
	sw	a6, 4(s0)
	sw	a1, 4(s0)
	sw	s2, 4(s0)
	addi	a2, zero, 48
.LBB3_2:                                #   in Loop: Header=BB3_6 Depth=1
	sw	a2, 4(s0)
	addi	a3, zero, 48
.LBB3_3:                                #   in Loop: Header=BB3_6 Depth=1
	sw	a3, 4(s0)
	sw	s2, 4(s0)
	addi	a4, zero, 48
.LBB3_4:                                #   in Loop: Header=BB3_6 Depth=1
	sw	a4, 4(s0)
	addi	a5, zero, 48
.LBB3_5:                                #   in Loop: Header=BB3_6 Depth=1
	sw	a5, 4(s0)
.LBB3_6:                                # =>This Inner Loop Header: Depth=1
	lw	a0, 0(s1)
	beqz	a0, .LBB3_6
# %bb.7:                                #   in Loop: Header=BB3_6 Depth=1
	addi	a5, a5, 1
	sw	s4, 4(s0)
	bne	a5, s2, .LBB3_5
# %bb.8:                                #   in Loop: Header=BB3_6 Depth=1
	addi	a4, a4, 1
	sw	s4, 4(s0)
	bne	a4, s5, .LBB3_4
# %bb.9:                                #   in Loop: Header=BB3_6 Depth=1
	addi	a3, a3, 1
	sw	s4, 4(s0)
	sw	s4, 4(s0)
	bne	a3, s2, .LBB3_3
# %bb.10:                               #   in Loop: Header=BB3_6 Depth=1
	addi	a2, a2, 1
	sw	s4, 4(s0)
	bne	a2, s5, .LBB3_2
# %bb.11:                               #   in Loop: Header=BB3_6 Depth=1
	sw	s4, 4(s0)
	sw	s4, 4(s0)
	sw	s4, 4(s0)
	addi	a3, a1, 1
	xori	a0, a3, 58
	seqz	a2, a0
	addi	a1, zero, 48
	beq	a3, s2, .LBB3_13
# %bb.12:                               #   in Loop: Header=BB3_6 Depth=1
	mv	a1, a3
.LBB3_13:                               #   in Loop: Header=BB3_6 Depth=1
	add	a6, a6, a2
	bne	a1, s6, .LBB3_1
# %bb.14:                               #   in Loop: Header=BB3_6 Depth=1
	bne	a6, s7, .LBB3_1
# %bb.15:                               #   in Loop: Header=BB3_6 Depth=1
	sw	s8, 4(s0)
	addi	s3, s3, 1
	mv	a0, s3
	call	_Z8showDatej
	addi	a6, zero, 48
	addi	a1, zero, 48
	j	.LBB3_1
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
                                        # -- End function
	.section	.text._Z8showDatej,"axG",@progbits,_Z8showDatej,comdat
	.weak	_Z8showDatej            # -- Begin function _Z8showDatej
	.p2align	2
	.type	_Z8showDatej,@function
_Z8showDatej:                           # @_Z8showDatej
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	sw	s4, 8(sp)
	mv	s0, a0
	addi	a1, zero, 1461
	call	__udivsi3
	mv	s1, a0
	addi	a1, zero, -1461
	call	__mulsi3
	add	a0, a0, s0
	addi	a1, zero, 366
	slli	s2, s1, 2
	bltu	a0, a1, .LBB4_3
# %bb.1:
	addi	a0, a0, -366
	addi	a1, zero, 365
	addi	s3, zero, 28
	bltu	a0, a1, .LBB4_4
# %bb.2:
	addi	s4, s0, -731
	addi	a1, zero, 1461
	mv	a0, s1
	call	__mulsi3
	mv	s1, a0
	sub	a0, s4, a0
	addi	a1, zero, 365
	call	__udivsi3
	mv	s0, a0
	addi	a1, zero, -365
	call	__mulsi3
	add	a0, s4, a0
	add	a1, s0, s2
	addi	s2, a1, 2006
	sub	a0, a0, s1
	j	.LBB4_5
.LBB4_3:
	addi	s2, s2, 2004
	addi	s3, zero, 29
	j	.LBB4_5
.LBB4_4:
	addi	s2, s2, 2005
.LBB4_5:
	addi	a1, zero, 31
	addi	s4, zero, 1
	bltu	a0, a1, .LBB4_19
# %bb.6:
	addi	a0, a0, -31
	addi	s4, zero, 2
	bltu	a0, s3, .LBB4_19
# %bb.7:
	sub	a1, a0, s3
	addi	a0, zero, 31
	addi	s4, zero, 3
	bgeu	a1, a0, .LBB4_9
# %bb.8:
	mv	a0, a1
	j	.LBB4_19
.LBB4_9:
	addi	a0, a1, -31
	addi	a2, zero, 30
	addi	s4, zero, 4
	bltu	a0, a2, .LBB4_19
# %bb.10:
	addi	a0, a1, -61
	addi	a2, zero, 31
	addi	s4, zero, 5
	bltu	a0, a2, .LBB4_19
# %bb.11:
	addi	a0, a1, -92
	addi	a2, zero, 30
	addi	s4, zero, 6
	bltu	a0, a2, .LBB4_19
# %bb.12:
	addi	a0, a1, -122
	addi	a2, zero, 31
	addi	s4, zero, 7
	bltu	a0, a2, .LBB4_19
# %bb.13:
	addi	a0, a1, -153
	addi	s4, zero, 8
	bltu	a0, a2, .LBB4_19
# %bb.14:
	addi	a0, a1, -184
	addi	a2, zero, 30
	addi	s4, zero, 9
	bltu	a0, a2, .LBB4_19
# %bb.15:
	addi	a0, a1, -214
	addi	a2, zero, 31
	addi	s4, zero, 10
	bltu	a0, a2, .LBB4_19
# %bb.16:
	addi	a0, a1, -245
	addi	a2, zero, 30
	addi	s4, zero, 11
	bltu	a0, a2, .LBB4_19
# %bb.17:
	addi	a0, a1, -275
	addi	a2, zero, 31
	addi	s4, zero, 12
	bltu	a0, a2, .LBB4_19
# %bb.18:
	addi	a0, a1, -306
	addi	s4, zero, 13
.LBB4_19:
	addi	a1, a0, 1
	addi	s3, zero, 10
	addi	s0, zero, 48
	bltu	a1, s3, .LBB4_21
# %bb.20:
	addi	s1, a0, -9
	addi	a1, zero, 10
	mv	a0, s1
	call	__udivsi3
	addi	s0, a0, 49
	addi	a1, zero, -10
	call	__mulsi3
	add	a1, s1, a0
.LBB4_21:
	lui	a0, 655360
	sw	s0, 4(a0)
	addi	a1, a1, 48
	sw	a1, 4(a0)
	addi	a1, zero, 47
	sw	a1, 4(a0)
	bltu	s4, s3, .LBB4_23
# %bb.22:
	addi	a1, zero, 49
	sw	a1, 4(a0)
	addi	s4, s4, -10
	j	.LBB4_24
.LBB4_23:
	addi	a0, a0, 4
	addi	a1, zero, 48
	sw	a1, 0(a0)
.LBB4_24:
	addi	a0, s4, 48
	lui	s3, 655360
	sw	a0, 4(s3)
	addi	a0, zero, 47
	sw	a0, 4(s3)
	addi	a1, zero, 1000
	mv	a0, s2
	call	__udivsi3
	mv	s1, a0
	addi	a1, zero, -1000
	call	__mulsi3
	add	s0, a0, s2
	addi	a0, s1, 48
	sw	a0, 4(s3)
	addi	a1, zero, 100
	mv	a0, s0
	call	__udivsi3
	mv	s1, a0
	addi	a1, zero, -100
	call	__mulsi3
	add	s0, a0, s0
	addi	a0, s1, 48
	sw	a0, 4(s3)
	addi	a1, zero, 10
	mv	a0, s0
	call	__udivsi3
	mv	s1, a0
	addi	a1, zero, -10
	call	__mulsi3
	addi	a1, s1, 48
	sw	a1, 4(s3)
	add	a0, s0, a0
	addi	a0, a0, 48
	sw	a0, 4(s3)
	addi	a0, zero, 32
	sw	a0, 4(s3)
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end4:
	.size	_Z8showDatej, .Lfunc_end4-_Z8showDatej
                                        # -- End function
	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
