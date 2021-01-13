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
	bltu	a2, a1, .LBB1_4
# %bb.1:
	addi	a3, zero, 1
.LBB1_2:                                # =>This Inner Loop Header: Depth=1
	slli	a1, a1, 1
	addi	a3, a3, 1
	bgeu	a2, a1, .LBB1_2
# %bb.3:
	beqz	a3, .LBB1_9
.LBB1_4:
	mv	a2, zero
	j	.LBB1_6
.LBB1_5:                                #   in Loop: Header=BB1_6 Depth=1
	sub	a0, a0, a5
	or	a2, a2, a4
	srli	a1, a1, 1
	beqz	a3, .LBB1_8
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
.LBB1_8:
	mv	a0, a2
	ret
.LBB1_9:
	mv	a0, zero
	ret
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
	addi	sp, sp, -64
	sw	ra, 60(sp)
	sw	s0, 56(sp)
	sw	s1, 52(sp)
	sw	s2, 48(sp)
	sw	s3, 44(sp)
	sw	s4, 40(sp)
	sw	s5, 36(sp)
	sw	s6, 32(sp)
	sw	s7, 28(sp)
	sw	s8, 24(sp)
	sw	s9, 20(sp)
	sw	s10, 16(sp)
	sw	s11, 12(sp)
	lui	a0, 524288
	lw	s4, 4(a0)
	lui	a0, 786635
	addi	a0, a0, -1264
	add	s1, s4, a0
	lui	a0, 21
	addi	s2, a0, 384
	mv	a0, s1
	mv	a1, s2
	call	__udivsi3
	mv	s7, a0
	lui	a0, 1048555
	addi	a1, a0, -384
	mv	a0, s7
	call	__mulsi3
	add	s0, a0, s1
	addi	s5, zero, 48
	lui	s1, 9
	addi	a0, s1, -863
	addi	s3, zero, 48
	bltu	s0, a0, .LBB3_2
# %bb.1:
	lui	a0, 786626
	addi	a0, a0, -401
	add	s0, s4, a0
	mv	a0, s7
	mv	a1, s2
	call	__mulsi3
	mv	s2, a0
	sub	a0, s0, a0
	addi	a1, s1, -864
	call	__udivsi3
	mv	s3, a0
	lui	a0, 1048567
	addi	a1, a0, 864
	mv	a0, s3
	call	__mulsi3
	add	a0, s0, a0
	addi	s3, s3, 49
	sub	a0, a0, s2
	addi	s0, a0, 1
.LBB3_2:
	lui	a1, 1
	addi	a0, a1, -495
	bltu	s0, a0, .LBB3_4
# %bb.3:
	lui	a0, 1048575
	addi	s2, a0, 496
	add	a0, s0, s2
	addi	a0, a0, -1
	addi	a1, a1, -496
	call	__udivsi3
	addi	s5, a0, 49
	mv	a1, s2
	call	__mulsi3
	add	a0, s0, a0
	add	s0, a0, s2
.LBB3_4:
	addi	a0, zero, 601
	addi	s6, zero, 48
	bltu	s0, a0, .LBB3_6
# %bb.5:
	addi	a0, s0, -601
	addi	a1, zero, 600
	call	__udivsi3
	addi	s2, a0, 49
	addi	a1, zero, -600
	call	__mulsi3
	add	a0, s0, a0
	addi	s0, a0, -600
	addi	a0, zero, 61
	bgeu	s0, a0, .LBB3_7
	j	.LBB3_8
.LBB3_6:
	addi	s2, zero, 48
	addi	a0, zero, 61
	bltu	s0, a0, .LBB3_8
.LBB3_7:
	addi	a0, s0, -61
	addi	a1, zero, 60
	call	__udivsi3
	addi	s6, a0, 49
	addi	a1, zero, -60
	call	__mulsi3
	add	a0, s0, a0
	addi	s0, a0, -60
.LBB3_8:
	addi	a0, zero, 11
	addi	s11, zero, 48
	bltu	s0, a0, .LBB3_10
# %bb.9:
	addi	a0, s0, -11
	addi	a1, zero, 10
	call	__udivsi3
	addi	s4, a0, 49
	addi	a1, zero, -10
	call	__mulsi3
	add	a0, s0, a0
	addi	s0, a0, -10
	addi	a0, zero, 1
	bltu	a0, s0, .LBB3_11
	j	.LBB3_12
.LBB3_10:
	addi	s4, zero, 48
	addi	a0, zero, 1
	bgeu	a0, s0, .LBB3_12
.LBB3_11:
	addi	s11, s0, 47
.LBB3_12:
	lui	s0, 655360
	addi	a0, zero, 10
	sw	a0, 4(s0)
	sw	s7, 8(sp)
	mv	a0, s7
	call	_Z8showDatej
	addi	s7, s0, 4
	addi	s8, zero, 58
	addi	s1, zero, 8
	addi	s9, zero, 54
	addi	s10, zero, 52
	addi	a0, zero, 50
	j	.LBB3_15
.LBB3_13:                               #   in Loop: Header=BB3_15 Depth=1
	addi	s3, s3, 1
.LBB3_14:                               #   in Loop: Header=BB3_15 Depth=1
	addi	s5, zero, 48
	addi	s2, zero, 48
	addi	s6, zero, 48
	addi	s4, zero, 48
	addi	s11, zero, 48
.LBB3_15:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_16 Depth 2
                                        #       Child Loop BB3_17 Depth 3
                                        #         Child Loop BB3_18 Depth 4
                                        #           Child Loop BB3_19 Depth 5
	sw	s3, 4(s0)
	sw	s5, 4(s0)
	sw	s8, 0(s7)
.LBB3_16:                               #   Parent Loop BB3_15 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_17 Depth 3
                                        #         Child Loop BB3_18 Depth 4
                                        #           Child Loop BB3_19 Depth 5
	sw	s2, 0(s7)
.LBB3_17:                               #   Parent Loop BB3_15 Depth=1
                                        #     Parent Loop BB3_16 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_18 Depth 4
                                        #           Child Loop BB3_19 Depth 5
	sw	s6, 4(s0)
	sw	s8, 0(s7)
.LBB3_18:                               #   Parent Loop BB3_15 Depth=1
                                        #     Parent Loop BB3_16 Depth=2
                                        #       Parent Loop BB3_17 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB3_19 Depth 5
	sw	s4, 0(s7)
.LBB3_19:                               #   Parent Loop BB3_15 Depth=1
                                        #     Parent Loop BB3_16 Depth=2
                                        #       Parent Loop BB3_17 Depth=3
                                        #         Parent Loop BB3_18 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	sw	s11, 4(s0)
	addi	s11, s11, 1
	sw	s1, 4(s0)
	bne	s11, s8, .LBB3_19
# %bb.20:                               #   in Loop: Header=BB3_18 Depth=4
	addi	s4, s4, 1
	sw	s1, 4(s0)
	addi	s11, zero, 48
	bne	s4, s9, .LBB3_18
# %bb.21:                               #   in Loop: Header=BB3_17 Depth=3
	addi	s6, s6, 1
	sw	s1, 4(s0)
	sw	s1, 4(s0)
	addi	s4, zero, 48
	addi	s11, zero, 48
	bne	s6, s8, .LBB3_17
# %bb.22:                               #   in Loop: Header=BB3_16 Depth=2
	addi	s2, s2, 1
	sw	s1, 4(s0)
	addi	s6, zero, 48
	addi	s4, zero, 48
	addi	s11, zero, 48
	bne	s2, s9, .LBB3_16
# %bb.23:                               #   in Loop: Header=BB3_15 Depth=1
	sw	s1, 4(s0)
	sw	s1, 4(s0)
	addi	s5, s5, 1
	sw	s1, 4(s0)
	beq	s5, s8, .LBB3_13
# %bb.24:                               #   in Loop: Header=BB3_15 Depth=1
	addi	s2, zero, 48
	addi	s6, zero, 48
	addi	s4, zero, 48
	addi	s11, zero, 48
	bne	s5, s10, .LBB3_15
# %bb.25:                               #   in Loop: Header=BB3_15 Depth=1
	addi	s6, zero, 48
	addi	s4, zero, 48
	addi	s11, zero, 48
	bne	s3, a0, .LBB3_15
# %bb.26:                               #   in Loop: Header=BB3_15 Depth=1
	addi	a0, zero, 13
	sw	a0, 4(s0)
	lw	a0, 8(sp)
	addi	a0, a0, 1
	sw	a0, 8(sp)
	call	_Z8showDatej
	addi	a0, zero, 50
	addi	s3, zero, 48
	j	.LBB3_14
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
	addi	s0, s0, -731
	addi	a1, zero, 1461
	mv	a0, s1
	call	__mulsi3
	mv	s1, a0
	sub	a0, s0, a0
	addi	a1, zero, 365
	call	__udivsi3
	add	s2, a0, s2
	addi	a1, zero, -365
	call	__mulsi3
	add	a0, s0, a0
	addi	s2, s2, 2006
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
