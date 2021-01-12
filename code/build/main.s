	.text
	.file	"main.cpp"
	.globl	memcpy                  # -- Begin function memcpy
	.p2align	2
	.type	memcpy,@function
memcpy:                                 # @memcpy
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	j	.LBB0_1
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -20(s0)
	mv	a1, zero
	beq	a0, a1, .LBB0_3
	j	.LBB0_2
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	lw	a0, -20(s0)
	addi	a0, a0, -1
	sw	a0, -20(s0)
	lw	a0, -16(s0)
	lb	a0, 0(a0)
	lw	a1, -12(s0)
	sb	a0, 0(a1)
	lw	a0, -12(s0)
	addi	a0, a0, 1
	sw	a0, -12(s0)
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB0_1
.LBB0_3:
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	memcpy, .Lfunc_end0-memcpy
                                        # -- End function
	.globl	__mulsi3                # -- Begin function __mulsi3
	.p2align	2
	.type	__mulsi3,@function
__mulsi3:                               # @__mulsi3
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	mv	a0, zero
	sw	a0, -20(s0)
	addi	a0, zero, 1
	sw	a0, -24(s0)
	j	.LBB1_1
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	mv	a1, zero
	beq	a0, a1, .LBB1_5
	j	.LBB1_2
.LBB1_2:                                #   in Loop: Header=BB1_1 Depth=1
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	and	a0, a0, a1
	mv	a1, zero
	beq	a0, a1, .LBB1_4
	j	.LBB1_3
.LBB1_3:                                #   in Loop: Header=BB1_1 Depth=1
	lw	a0, -12(s0)
	lw	a1, -20(s0)
	add	a0, a1, a0
	sw	a0, -20(s0)
	j	.LBB1_4
.LBB1_4:                                #   in Loop: Header=BB1_1 Depth=1
	lw	a0, -16(s0)
	srli	a0, a0, 1
	sw	a0, -16(s0)
	lw	a0, -12(s0)
	slli	a0, a0, 1
	sw	a0, -12(s0)
	j	.LBB1_1
.LBB1_5:
	lw	a0, -20(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end1:
	.size	__mulsi3, .Lfunc_end1-__mulsi3
                                        # -- End function
	.globl	__udivsi3               # -- Begin function __udivsi3
	.p2align	2
	.type	__udivsi3,@function
__udivsi3:                              # @__udivsi3
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	addi	a0, zero, 1
	sw	a0, -20(s0)
	mv	a0, zero
	sw	a0, -24(s0)
	j	.LBB2_1
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	lw	a1, -12(s0)
	srli	a1, a1, 1
	bltu	a1, a0, .LBB2_3
	j	.LBB2_2
.LBB2_2:                                #   in Loop: Header=BB2_1 Depth=1
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a0, -16(s0)
	slli	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB2_1
.LBB2_3:
	j	.LBB2_4
.LBB2_4:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -20(s0)
	mv	a1, zero
	beq	a0, a1, .LBB2_8
	j	.LBB2_5
.LBB2_5:                                #   in Loop: Header=BB2_4 Depth=1
	lw	a0, -20(s0)
	addi	a0, a0, -1
	sw	a0, -20(s0)
	lw	a0, -24(s0)
	slli	a0, a0, 1
	sw	a0, -24(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	bltu	a0, a1, .LBB2_7
	j	.LBB2_6
.LBB2_6:                                #   in Loop: Header=BB2_4 Depth=1
	lw	a0, -16(s0)
	lw	a1, -12(s0)
	sub	a0, a1, a0
	sw	a0, -12(s0)
	lw	a0, -24(s0)
	addi	a0, a0, 1
	sw	a0, -24(s0)
	j	.LBB2_7
.LBB2_7:                                #   in Loop: Header=BB2_4 Depth=1
	lw	a0, -16(s0)
	srli	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB2_4
.LBB2_8:
	lw	a0, -24(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end2:
	.size	__udivsi3, .Lfunc_end2-__udivsi3
                                        # -- End function
	.globl	__umodsi3               # -- Begin function __umodsi3
	.p2align	2
	.type	__umodsi3,@function
__umodsi3:                              # @__umodsi3
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	addi	a0, zero, 1
	sw	a0, -20(s0)
	j	.LBB3_1
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	lw	a1, -12(s0)
	srli	a1, a1, 1
	bltu	a1, a0, .LBB3_3
	j	.LBB3_2
.LBB3_2:                                #   in Loop: Header=BB3_1 Depth=1
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a0, -16(s0)
	slli	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB3_1
.LBB3_3:
	j	.LBB3_4
.LBB3_4:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -20(s0)
	mv	a1, zero
	beq	a0, a1, .LBB3_8
	j	.LBB3_5
.LBB3_5:                                #   in Loop: Header=BB3_4 Depth=1
	lw	a0, -20(s0)
	addi	a0, a0, -1
	sw	a0, -20(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	bltu	a0, a1, .LBB3_7
	j	.LBB3_6
.LBB3_6:                                #   in Loop: Header=BB3_4 Depth=1
	lw	a0, -16(s0)
	lw	a1, -12(s0)
	sub	a0, a1, a0
	sw	a0, -12(s0)
	j	.LBB3_7
.LBB3_7:                                #   in Loop: Header=BB3_4 Depth=1
	lw	a0, -16(s0)
	srli	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB3_4
.LBB3_8:
	lw	a0, -12(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end3:
	.size	__umodsi3, .Lfunc_end3-__umodsi3
                                        # -- End function
	.globl	_Z8uint2strjPDijDs      # -- Begin function _Z8uint2strjPDijDs
	.p2align	2
	.type	_Z8uint2strjPDijDs,@function
_Z8uint2strjPDijDs:                     # @_Z8uint2strjPDijDs
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	mv	a4, a3
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	sh	a3, -22(s0)
	mv	a0, zero
	sb	a0, -23(s0)
	lw	a0, -20(s0)
	addi	a1, zero, 10
	sub	a0, a1, a0
	sw	a0, -28(s0)
	j	.LBB4_1
.LBB4_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_3 Depth 2
	lw	a0, -28(s0)
	addi	a1, zero, 9
	bltu	a1, a0, .LBB4_10
	j	.LBB4_2
.LBB4_2:                                #   in Loop: Header=BB4_1 Depth=1
	mv	a0, zero
	sw	a0, -32(s0)
	j	.LBB4_3
.LBB4_3:                                #   Parent Loop BB4_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -20(s0)
	lw	a1, -28(s0)
	lui	a2, %hi(_ZL8digits32)
	addi	a2, a2, %lo(_ZL8digits32)
	slli	a1, a1, 2
	add	a1, a1, a2
	lw	a1, 0(a1)
	bltu	a0, a1, .LBB4_5
	j	.LBB4_4
.LBB4_4:                                #   in Loop: Header=BB4_3 Depth=2
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	lw	a0, -28(s0)
	lui	a1, %hi(_ZL8digits32)
	addi	a1, a1, %lo(_ZL8digits32)
	slli	a0, a0, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	lw	a1, -12(s0)
	sub	a0, a1, a0
	sw	a0, -12(s0)
	j	.LBB4_3
.LBB4_5:                                #   in Loop: Header=BB4_1 Depth=1
	lw	a0, -32(s0)
	mv	a1, zero
	bne	a0, a1, .LBB4_7
	j	.LBB4_6
.LBB4_6:                                #   in Loop: Header=BB4_1 Depth=1
	lbu	a0, -23(s0)
	andi	a0, a0, 1
	mv	a1, zero
	beq	a0, a1, .LBB4_8
	j	.LBB4_7
.LBB4_7:                                #   in Loop: Header=BB4_1 Depth=1
	addi	a0, zero, 1
	sb	a0, -23(s0)
	j	.LBB4_8
.LBB4_8:                                #   in Loop: Header=BB4_1 Depth=1
	j	.LBB4_9
.LBB4_9:                                #   in Loop: Header=BB4_1 Depth=1
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB4_1
.LBB4_10:
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end4:
	.size	_Z8uint2strjPDijDs, .Lfunc_end4-_Z8uint2strjPDijDs
                                        # -- End function
	.globl	_Z6malloci              # -- Begin function _Z6malloci
	.p2align	2
	.type	_Z6malloci,@function
_Z6malloci:                             # @_Z6malloci
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -16(s0)
	mv	a0, zero
	sw	a0, -20(s0)
	j	.LBB5_1
.LBB5_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -20(s0)
	lui	a1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(a1)
	bgeu	a0, a1, .LBB5_6
	j	.LBB5_2
.LBB5_2:                                #   in Loop: Header=BB5_1 Depth=1
	lui	a0, %hi(allocSize)
	lw	a0, %lo(allocSize)(a0)
	lw	a1, -20(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	lw	a1, -16(s0)
	blt	a0, a1, .LBB5_4
	j	.LBB5_3
.LBB5_3:
	lui	a0, %hi(allocSize)
	lw	a0, %lo(allocSize)(a0)
	lw	a1, -20(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a1, 0(a0)
	mv	a2, zero
	sub	a1, a2, a1
	sw	a1, 0(a0)
	lui	a0, %hi(allocPos)
	lw	a0, %lo(allocPos)(a0)
	lw	a1, -20(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	sw	a0, -12(s0)
	j	.LBB5_9
.LBB5_4:                                #   in Loop: Header=BB5_1 Depth=1
	j	.LBB5_5
.LBB5_5:                                #   in Loop: Header=BB5_1 Depth=1
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB5_1
.LBB5_6:
	lui	a0, %hi(nbBlocks)
	lw	a0, %lo(nbBlocks)(a0)
	addi	a1, zero, 100
	bne	a0, a1, .LBB5_8
	j	.LBB5_7
.LBB5_7:
	addi	a0, zero, 29
	call	exit
	j	.LBB5_8
.LBB5_8:
	lui	a0, %hi(__asm__freept)
	lw	a1, %lo(__asm__freept)(a0)
	sw	a1, -24(s0)
	lw	a1, -24(s0)
	lui	a2, %hi(allocPos)
	lw	a2, %lo(allocPos)(a2)
	lui	a3, %hi(nbBlocks)
	lw	a4, %lo(nbBlocks)(a3)
	slli	a4, a4, 2
	add	a2, a2, a4
	sw	a1, 0(a2)
	lw	a1, -16(s0)
	mv	a2, zero
	sub	a1, a2, a1
	lui	a2, %hi(allocSize)
	lw	a2, %lo(allocSize)(a2)
	lw	a4, %lo(nbBlocks)(a3)
	slli	a4, a4, 2
	add	a2, a2, a4
	sw	a1, 0(a2)
	lw	a1, %lo(nbBlocks)(a3)
	addi	a1, a1, 1
	sw	a1, %lo(nbBlocks)(a3)
	lw	a1, -16(s0)
	lw	a2, %lo(__asm__freept)(a0)
	add	a1, a2, a1
	sw	a1, %lo(__asm__freept)(a0)
	lw	a0, -24(s0)
	sw	a0, -12(s0)
	j	.LBB5_9
.LBB5_9:
	lw	a0, -12(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end5:
	.size	_Z6malloci, .Lfunc_end5-_Z6malloci
                                        # -- End function
	.globl	_Z4freePv               # -- Begin function _Z4freePv
	.p2align	2
	.type	_Z4freePv,@function
_Z4freePv:                              # @_Z4freePv
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	mv	a0, zero
	sw	a0, -16(s0)
	j	.LBB6_1
.LBB6_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	lui	a1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(a1)
	bgeu	a0, a1, .LBB6_6
	j	.LBB6_2
.LBB6_2:                                #   in Loop: Header=BB6_1 Depth=1
	lui	a0, %hi(allocPos)
	lw	a0, %lo(allocPos)(a0)
	lw	a1, -16(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	lw	a1, -12(s0)
	bne	a0, a1, .LBB6_4
	j	.LBB6_3
.LBB6_3:
	lui	a0, %hi(allocSize)
	lw	a0, %lo(allocSize)(a0)
	lw	a1, -16(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a1, 0(a0)
	mv	a2, zero
	sub	a1, a2, a1
	sw	a1, 0(a0)
	j	.LBB6_7
.LBB6_4:                                #   in Loop: Header=BB6_1 Depth=1
	j	.LBB6_5
.LBB6_5:                                #   in Loop: Header=BB6_1 Depth=1
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB6_1
.LBB6_6:
	addi	a0, zero, 40
	call	exit
	j	.LBB6_7
.LBB6_7:
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end6:
	.size	_Z4freePv, .Lfunc_end6-_Z4freePv
                                        # -- End function
	.globl	_Znwj                   # -- Begin function _Znwj
	.p2align	2
	.type	_Znwj,@function
_Znwj:                                  # @_Znwj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	call	_Z6malloci
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end7:
	.size	_Znwj, .Lfunc_end7-_Znwj
                                        # -- End function
	.globl	_Znaj                   # -- Begin function _Znaj
	.p2align	2
	.type	_Znaj,@function
_Znaj:                                  # @_Znaj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	call	_Z6malloci
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end8:
	.size	_Znaj, .Lfunc_end8-_Znaj
                                        # -- End function
	.globl	_ZdaPv                  # -- Begin function _ZdaPv
	.p2align	2
	.type	_ZdaPv,@function
_ZdaPv:                                 # @_ZdaPv
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	call	_Z4freePv
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end9:
	.size	_ZdaPv, .Lfunc_end9-_ZdaPv
                                        # -- End function
	.globl	_ZdlPv                  # -- Begin function _ZdlPv
	.p2align	2
	.type	_ZdlPv,@function
_ZdlPv:                                 # @_ZdlPv
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	call	_Z4freePv
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end10:
	.size	_ZdlPv, .Lfunc_end10-_ZdlPv
                                        # -- End function
	.globl	_Z14initMemManagerv     # -- Begin function _Z14initMemManagerv
	.p2align	2
	.type	_Z14initMemManagerv,@function
_Z14initMemManagerv:                    # @_Z14initMemManagerv
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	lui	a0, %hi(__asm__freept)
	lw	a1, %lo(__asm__freept)(a0)
	lui	a2, %hi(allocPos)
	sw	a1, %lo(allocPos)(a2)
	lw	a1, %lo(__asm__freept)(a0)
	addi	a1, a1, 400
	sw	a1, %lo(__asm__freept)(a0)
	lw	a1, %lo(__asm__freept)(a0)
	lui	a2, %hi(allocSize)
	sw	a1, %lo(allocSize)(a2)
	lw	a1, %lo(__asm__freept)(a0)
	addi	a1, a1, 400
	sw	a1, %lo(__asm__freept)(a0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end11:
	.size	_Z14initMemManagerv, .Lfunc_end11-_Z14initMemManagerv
                                        # -- End function
	.globl	_ZlsR13TextOutStreamc   # -- Begin function _ZlsR13TextOutStreamc
	.p2align	2
	.type	_ZlsR13TextOutStreamc,@function
_ZlsR13TextOutStreamc:                  # @_ZlsR13TextOutStreamc
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	mv	a2, a1
	sw	a0, -12(s0)
	sb	a1, -13(s0)
	lw	a0, -12(s0)
	lbu	a1, -13(s0)
	lw	a3, 0(a0)
	lw	a3, 0(a3)
	sw	a2, -20(s0)
	jalr	a3
	lw	a0, -12(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end12:
	.size	_ZlsR13TextOutStreamc, .Lfunc_end12-_ZlsR13TextOutStreamc
                                        # -- End function
	.globl	_ZlsR13TextOutStreamPKDi # -- Begin function _ZlsR13TextOutStreamPKDi
	.p2align	2
	.type	_ZlsR13TextOutStreamPKDi,@function
_ZlsR13TextOutStreamPKDi:               # @_ZlsR13TextOutStreamPKDi
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	j	.LBB13_1
.LBB13_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	lw	a0, 0(a0)
	mv	a1, zero
	beq	a0, a1, .LBB13_3
	j	.LBB13_2
.LBB13_2:                               #   in Loop: Header=BB13_1 Depth=1
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lw	a1, 0(a1)
	lw	a2, 0(a0)
	lw	a2, 0(a2)
	jalr	a2
	lw	a0, -16(s0)
	addi	a0, a0, 4
	sw	a0, -16(s0)
	j	.LBB13_1
.LBB13_3:
	lw	a0, -12(s0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end13:
	.size	_ZlsR13TextOutStreamPKDi, .Lfunc_end13-_ZlsR13TextOutStreamPKDi
                                        # -- End function
	.globl	_ZlsR13TextOutStreamPKc # -- Begin function _ZlsR13TextOutStreamPKc
	.p2align	2
	.type	_ZlsR13TextOutStreamPKc,@function
_ZlsR13TextOutStreamPKc:                # @_ZlsR13TextOutStreamPKc
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	j	.LBB14_1
.LBB14_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	lbu	a0, 0(a0)
	mv	a1, zero
	beq	a0, a1, .LBB14_3
	j	.LBB14_2
.LBB14_2:                               #   in Loop: Header=BB14_1 Depth=1
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lbu	a1, 0(a1)
	lw	a2, 0(a0)
	lw	a2, 0(a2)
	jalr	a2
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB14_1
.LBB14_3:
	lw	a0, -12(s0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end14:
	.size	_ZlsR13TextOutStreamPKc, .Lfunc_end14-_ZlsR13TextOutStreamPKc
                                        # -- End function
	.globl	_ZlsR13TextOutStreamj   # -- Begin function _ZlsR13TextOutStreamj
	.p2align	2
	.type	_ZlsR13TextOutStreamj,@function
_ZlsR13TextOutStreamj:                  # @_ZlsR13TextOutStreamj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	addi	a2, zero, 10
	call	_ZN13TextOutStream11send_digitsEjj
	lw	a0, -12(s0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end15:
	.size	_ZlsR13TextOutStreamj, .Lfunc_end15-_ZlsR13TextOutStreamj
                                        # -- End function
	.section	.text._ZN13TextOutStream11send_digitsEjj,"axG",@progbits,_ZN13TextOutStream11send_digitsEjj,comdat
	.weak	_ZN13TextOutStream11send_digitsEjj # -- Begin function _ZN13TextOutStream11send_digitsEjj
	.p2align	2
	.type	_ZN13TextOutStream11send_digitsEjj,@function
_ZN13TextOutStream11send_digitsEjj:     # @_ZN13TextOutStream11send_digitsEjj
# %bb.0:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	addi	s0, sp, 48
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	mv	a2, zero
	sw	a0, -36(s0)
	bne	a1, a2, .LBB16_2
	j	.LBB16_1
.LBB16_1:
	lw	a0, -36(s0)
	lw	a1, 0(a0)
	lw	a1, 0(a1)
	addi	a2, zero, 48
	sw	a1, -40(s0)
	mv	a1, a2
	lw	a2, -40(s0)
	jalr	a2
	j	.LBB16_13
.LBB16_2:
	mv	a0, zero
	sb	a0, -21(s0)
	lw	a0, -20(s0)
	addi	a1, zero, 10
	sub	a0, a1, a0
	sw	a0, -28(s0)
	j	.LBB16_3
.LBB16_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB16_5 Depth 2
	lw	a0, -28(s0)
	addi	a1, zero, 9
	bltu	a1, a0, .LBB16_12
	j	.LBB16_4
.LBB16_4:                               #   in Loop: Header=BB16_3 Depth=1
	mv	a0, zero
	sw	a0, -32(s0)
	j	.LBB16_5
.LBB16_5:                               #   Parent Loop BB16_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -16(s0)
	lw	a1, -28(s0)
	lui	a2, %hi(_ZL8digits32)
	addi	a2, a2, %lo(_ZL8digits32)
	slli	a1, a1, 2
	add	a1, a1, a2
	lw	a1, 0(a1)
	bltu	a0, a1, .LBB16_7
	j	.LBB16_6
.LBB16_6:                               #   in Loop: Header=BB16_5 Depth=2
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	lw	a0, -28(s0)
	lui	a1, %hi(_ZL8digits32)
	addi	a1, a1, %lo(_ZL8digits32)
	slli	a0, a0, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	lw	a1, -16(s0)
	sub	a0, a1, a0
	sw	a0, -16(s0)
	j	.LBB16_5
.LBB16_7:                               #   in Loop: Header=BB16_3 Depth=1
	lw	a0, -32(s0)
	mv	a1, zero
	bne	a0, a1, .LBB16_9
	j	.LBB16_8
.LBB16_8:                               #   in Loop: Header=BB16_3 Depth=1
	lbu	a0, -21(s0)
	andi	a0, a0, 1
	mv	a1, zero
	beq	a0, a1, .LBB16_10
	j	.LBB16_9
.LBB16_9:                               #   in Loop: Header=BB16_3 Depth=1
	addi	a0, zero, 1
	sb	a0, -21(s0)
	lw	a0, -32(s0)
	addi	a1, a0, 48
	lw	a0, -36(s0)
	lw	a2, 0(a0)
	lw	a2, 0(a2)
	jalr	a2
	j	.LBB16_10
.LBB16_10:                              #   in Loop: Header=BB16_3 Depth=1
	j	.LBB16_11
.LBB16_11:                              #   in Loop: Header=BB16_3 Depth=1
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB16_3
.LBB16_12:
	j	.LBB16_13
.LBB16_13:
	lw	s0, 40(sp)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end16:
	.size	_ZN13TextOutStream11send_digitsEjj, .Lfunc_end16-_ZN13TextOutStream11send_digitsEjj
                                        # -- End function
	.text
	.globl	_ZlsR13TextOutStreami   # -- Begin function _ZlsR13TextOutStreami
	.p2align	2
	.type	_ZlsR13TextOutStreami,@function
_ZlsR13TextOutStreami:                  # @_ZlsR13TextOutStreami
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	addi	a2, zero, 10
	call	_ZN13TextOutStream11send_digitsEij
	lw	a0, -12(s0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end17:
	.size	_ZlsR13TextOutStreami, .Lfunc_end17-_ZlsR13TextOutStreami
                                        # -- End function
	.section	.text._ZN13TextOutStream11send_digitsEij,"axG",@progbits,_ZN13TextOutStream11send_digitsEij,comdat
	.weak	_ZN13TextOutStream11send_digitsEij # -- Begin function _ZN13TextOutStream11send_digitsEij
	.p2align	2
	.type	_ZN13TextOutStream11send_digitsEij,@function
_ZN13TextOutStream11send_digitsEij:     # @_ZN13TextOutStream11send_digitsEij
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	addi	a2, zero, -1
	sw	a0, -24(s0)
	blt	a2, a1, .LBB18_2
	j	.LBB18_1
.LBB18_1:
	lw	a0, -16(s0)
	mv	a1, zero
	sub	a0, a1, a0
	sw	a0, -16(s0)
	lw	a0, -24(s0)
	lw	a1, 0(a0)
	lw	a1, 0(a1)
	addi	a2, zero, 45
	sw	a1, -28(s0)
	mv	a1, a2
	lw	a2, -28(s0)
	jalr	a2
	j	.LBB18_2
.LBB18_2:
	lw	a1, -16(s0)
	addi	a2, zero, 10
	lw	a0, -24(s0)
	call	_ZN13TextOutStream11send_digitsEjj
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end18:
	.size	_ZN13TextOutStream11send_digitsEij, .Lfunc_end18-_ZN13TextOutStream11send_digitsEij
                                        # -- End function
	.text
	.globl	_ZlsR13TextOutStreamDi  # -- Begin function _ZlsR13TextOutStreamDi
	.p2align	2
	.type	_ZlsR13TextOutStreamDi,@function
_ZlsR13TextOutStreamDi:                 # @_ZlsR13TextOutStreamDi
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lw	a2, 0(a0)
	lw	a2, 0(a2)
	jalr	a2
	lw	a0, -12(s0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end19:
	.size	_ZlsR13TextOutStreamDi, .Lfunc_end19-_ZlsR13TextOutStreamDi
                                        # -- End function
	.globl	_ZlsR13TextOutStreamRK6string # -- Begin function _ZlsR13TextOutStreamRK6string
	.p2align	2
	.type	_ZlsR13TextOutStreamRK6string,@function
_ZlsR13TextOutStreamRK6string:          # @_ZlsR13TextOutStreamRK6string
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -16(s0)
	sw	a0, -20(s0)
	lw	a0, -20(s0)
	call	_ZNK6vectorIjE5beginEv
	sw	a0, -24(s0)
	lw	a0, -20(s0)
	call	_ZNK6vectorIjE3endEv
	sw	a0, -28(s0)
	j	.LBB20_1
.LBB20_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -24(s0)
	lw	a1, -28(s0)
	beq	a0, a1, .LBB20_4
	j	.LBB20_2
.LBB20_2:                               #   in Loop: Header=BB20_1 Depth=1
	lw	a0, -24(s0)
	lw	a0, 0(a0)
	sw	a0, -32(s0)
	lw	a0, -12(s0)
	lw	a1, -32(s0)
	lw	a2, 0(a0)
	lw	a2, 0(a2)
	jalr	a2
	j	.LBB20_3
.LBB20_3:                               #   in Loop: Header=BB20_1 Depth=1
	lw	a0, -24(s0)
	addi	a0, a0, 4
	sw	a0, -24(s0)
	j	.LBB20_1
.LBB20_4:
	lw	a0, -12(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end20:
	.size	_ZlsR13TextOutStreamRK6string, .Lfunc_end20-_ZlsR13TextOutStreamRK6string
                                        # -- End function
	.section	.text._ZNK6vectorIjE5beginEv,"axG",@progbits,_ZNK6vectorIjE5beginEv,comdat
	.weak	_ZNK6vectorIjE5beginEv  # -- Begin function _ZNK6vectorIjE5beginEv
	.p2align	2
	.type	_ZNK6vectorIjE5beginEv,@function
_ZNK6vectorIjE5beginEv:                 # @_ZNK6vectorIjE5beginEv
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	lw	a0, 8(a0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end21:
	.size	_ZNK6vectorIjE5beginEv, .Lfunc_end21-_ZNK6vectorIjE5beginEv
                                        # -- End function
	.section	.text._ZNK6vectorIjE3endEv,"axG",@progbits,_ZNK6vectorIjE3endEv,comdat
	.weak	_ZNK6vectorIjE3endEv    # -- Begin function _ZNK6vectorIjE3endEv
	.p2align	2
	.type	_ZNK6vectorIjE3endEv,@function
_ZNK6vectorIjE3endEv:                   # @_ZNK6vectorIjE3endEv
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	lw	a1, 8(a0)
	lw	a0, 0(a0)
	slli	a0, a0, 2
	add	a0, a1, a0
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end22:
	.size	_ZNK6vectorIjE3endEv, .Lfunc_end22-_ZNK6vectorIjE3endEv
                                        # -- End function
	.text
	.globl	_ZplRK6stringS1_        # -- Begin function _ZplRK6stringS1_
	.p2align	2
	.type	_ZplRK6stringS1_,@function
_ZplRK6stringS1_:                       # @_ZplRK6stringS1_
# %bb.0:
	addi	sp, sp, -64
	sw	ra, 60(sp)
	sw	s0, 56(sp)
	addi	s0, sp, 64
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	lw	a1, -16(s0)
	sw	a0, -44(s0)
	mv	a0, a1
	call	_ZNK6vectorIjE4sizeEv
	sw	a0, -24(s0)
	lw	a0, -20(s0)
	call	_ZNK6vectorIjE4sizeEv
	sw	a0, -28(s0)
	mv	a0, zero
	sb	a0, -29(s0)
	lw	a1, -24(s0)
	lw	a2, -28(s0)
	add	a1, a1, a2
	lw	a2, -44(s0)
	sw	a0, -48(s0)
	mv	a0, a2
	lw	a2, -48(s0)
	call	_ZN6stringC2Eij
	lw	a0, -48(s0)
	sw	a0, -36(s0)
	j	.LBB23_1
.LBB23_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -36(s0)
	lw	a1, -24(s0)
	bgeu	a0, a1, .LBB23_4
	j	.LBB23_2
.LBB23_2:                               #   in Loop: Header=BB23_1 Depth=1
	lw	a0, -16(s0)
	lw	a1, -36(s0)
	call	_ZNK6vectorIjE3getEj
	lw	a0, 0(a0)
	lw	a1, -36(s0)
	lw	a2, -44(s0)
	sw	a0, -52(s0)
	mv	a0, a2
	call	_ZN6vectorIjEixEi
	lw	a1, -52(s0)
	sw	a1, 0(a0)
	j	.LBB23_3
.LBB23_3:                               #   in Loop: Header=BB23_1 Depth=1
	lw	a0, -36(s0)
	addi	a0, a0, 1
	sw	a0, -36(s0)
	j	.LBB23_1
.LBB23_4:
	mv	a0, zero
	sw	a0, -40(s0)
	j	.LBB23_5
.LBB23_5:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -40(s0)
	lw	a1, -28(s0)
	bgeu	a0, a1, .LBB23_8
	j	.LBB23_6
.LBB23_6:                               #   in Loop: Header=BB23_5 Depth=1
	lw	a0, -20(s0)
	lw	a1, -40(s0)
	call	_ZNK6vectorIjE3getEj
	lw	a0, 0(a0)
	lw	a1, -24(s0)
	lw	a2, -40(s0)
	add	a1, a1, a2
	lw	a2, -44(s0)
	sw	a0, -56(s0)
	mv	a0, a2
	call	_ZN6vectorIjEixEi
	lw	a1, -56(s0)
	sw	a1, 0(a0)
	j	.LBB23_7
.LBB23_7:                               #   in Loop: Header=BB23_5 Depth=1
	lw	a0, -40(s0)
	addi	a0, a0, 1
	sw	a0, -40(s0)
	j	.LBB23_5
.LBB23_8:
	addi	a0, zero, 1
	sb	a0, -29(s0)
	lbu	a0, -29(s0)
	bnez	a0, .LBB23_10
	j	.LBB23_9
.LBB23_9:
	lw	a0, -44(s0)
	call	_ZN6stringD2Ev
	j	.LBB23_10
.LBB23_10:
	lw	s0, 56(sp)
	lw	ra, 60(sp)
	addi	sp, sp, 64
	ret
.Lfunc_end23:
	.size	_ZplRK6stringS1_, .Lfunc_end23-_ZplRK6stringS1_
                                        # -- End function
	.section	.text._ZNK6vectorIjE4sizeEv,"axG",@progbits,_ZNK6vectorIjE4sizeEv,comdat
	.weak	_ZNK6vectorIjE4sizeEv   # -- Begin function _ZNK6vectorIjE4sizeEv
	.p2align	2
	.type	_ZNK6vectorIjE4sizeEv,@function
_ZNK6vectorIjE4sizeEv:                  # @_ZNK6vectorIjE4sizeEv
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	lw	a0, 0(a0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end24:
	.size	_ZNK6vectorIjE4sizeEv, .Lfunc_end24-_ZNK6vectorIjE4sizeEv
                                        # -- End function
	.section	.text._ZN6stringC2Eij,"axG",@progbits,_ZN6stringC2Eij,comdat
	.weak	_ZN6stringC2Eij         # -- Begin function _ZN6stringC2Eij
	.p2align	2
	.type	_ZN6stringC2Eij,@function
_ZN6stringC2Eij:                        # @_ZN6stringC2Eij
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lw	a2, -20(s0)
	call	_ZN6vectorIjEC2Ejj
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end25:
	.size	_ZN6stringC2Eij, .Lfunc_end25-_ZN6stringC2Eij
                                        # -- End function
	.section	.text._ZNK6vectorIjE3getEj,"axG",@progbits,_ZNK6vectorIjE3getEj,comdat
	.weak	_ZNK6vectorIjE3getEj    # -- Begin function _ZNK6vectorIjE3getEj
	.p2align	2
	.type	_ZNK6vectorIjE3getEj,@function
_ZNK6vectorIjE3getEj:                   # @_ZNK6vectorIjE3getEj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	lw	a0, 8(a0)
	lw	a1, -16(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end26:
	.size	_ZNK6vectorIjE3getEj, .Lfunc_end26-_ZNK6vectorIjE3getEj
                                        # -- End function
	.section	.text._ZN6vectorIjEixEi,"axG",@progbits,_ZN6vectorIjEixEi,comdat
	.weak	_ZN6vectorIjEixEi       # -- Begin function _ZN6vectorIjEixEi
	.p2align	2
	.type	_ZN6vectorIjEixEi,@function
_ZN6vectorIjEixEi:                      # @_ZN6vectorIjEixEi
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	lw	a0, 8(a0)
	lw	a1, -16(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end27:
	.size	_ZN6vectorIjEixEi, .Lfunc_end27-_ZN6vectorIjEixEi
                                        # -- End function
	.section	.text._ZN6stringD2Ev,"axG",@progbits,_ZN6stringD2Ev,comdat
	.weak	_ZN6stringD2Ev          # -- Begin function _ZN6stringD2Ev
	.p2align	2
	.type	_ZN6stringD2Ev,@function
_ZN6stringD2Ev:                         # @_ZN6stringD2Ev
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	call	_ZN6vectorIjED2Ev
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end28:
	.size	_ZN6stringD2Ev, .Lfunc_end28-_ZN6stringD2Ev
                                        # -- End function
	.text
	.globl	_Z6hdd_cdjPKDi          # -- Begin function _Z6hdd_cdjPKDi
	.p2align	2
	.type	_Z6hdd_cdjPKDi,@function
_Z6hdd_cdjPKDi:                         # @_Z6hdd_cdjPKDi
# %bb.0:
	addi	sp, sp, -64
	sw	ra, 60(sp)
	sw	s0, 56(sp)
	addi	s0, sp, 64
	sw	a0, -16(s0)
	sw	a1, -20(s0)
	lw	a0, -20(s0)
	call	_Z6strlenPKDi
	sw	a0, -24(s0)
	lw	a0, -16(s0)
	addi	a0, a0, 4
	call	_Z10read_drivej
	sw	a0, -28(s0)
	lw	a0, -16(s0)
	addi	a0, a0, 8
	sw	a0, -16(s0)
	mv	a0, zero
	sw	a0, -32(s0)
	j	.LBB29_1
.LBB29_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB29_3 Depth 2
	lw	a0, -32(s0)
	lw	a1, -28(s0)
	bgeu	a0, a1, .LBB29_12
	j	.LBB29_2
.LBB29_2:                               #   in Loop: Header=BB29_1 Depth=1
	lw	a0, -16(s0)
	call	_Z10read_drivej
	sw	a0, -36(s0)
	lw	a0, -16(s0)
	addi	a0, a0, 4
	call	_Z10read_drivej
	sw	a0, -40(s0)
	lw	a0, -16(s0)
	addi	a0, a0, 8
	sw	a0, -16(s0)
	lw	a0, -24(s0)
	lw	a1, -40(s0)
	xor	a0, a0, a1
	seqz	a0, a0
	sb	a0, -41(s0)
	mv	a0, zero
	sw	a0, -48(s0)
	j	.LBB29_3
.LBB29_3:                               #   Parent Loop BB29_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -48(s0)
	lw	a1, -40(s0)
	bgeu	a0, a1, .LBB29_8
	j	.LBB29_4
.LBB29_4:                               #   in Loop: Header=BB29_3 Depth=2
	lbu	a0, -41(s0)
	andi	a0, a0, 1
	mv	a1, zero
	mv	a2, a1
	sw	a2, -52(s0)
	beq	a0, a1, .LBB29_6
	j	.LBB29_5
.LBB29_5:                               #   in Loop: Header=BB29_3 Depth=2
	lw	a0, -16(s0)
	call	_Z10read_drivej
	lw	a1, -20(s0)
	lw	a2, -48(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	lw	a1, 0(a1)
	xor	a0, a0, a1
	seqz	a0, a0
	sw	a0, -52(s0)
	j	.LBB29_6
.LBB29_6:                               #   in Loop: Header=BB29_3 Depth=2
	lw	a0, -52(s0)
	andi	a0, a0, 1
	sb	a0, -41(s0)
	lw	a0, -16(s0)
	addi	a0, a0, 4
	sw	a0, -16(s0)
	j	.LBB29_7
.LBB29_7:                               #   in Loop: Header=BB29_3 Depth=2
	lw	a0, -48(s0)
	addi	a0, a0, 1
	sw	a0, -48(s0)
	j	.LBB29_3
.LBB29_8:                               #   in Loop: Header=BB29_1 Depth=1
	lbu	a0, -41(s0)
	andi	a0, a0, 1
	mv	a1, zero
	beq	a0, a1, .LBB29_10
	j	.LBB29_9
.LBB29_9:
	lw	a0, -36(s0)
	sw	a0, -12(s0)
	j	.LBB29_13
.LBB29_10:                              #   in Loop: Header=BB29_1 Depth=1
	j	.LBB29_11
.LBB29_11:                              #   in Loop: Header=BB29_1 Depth=1
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB29_1
.LBB29_12:
	mv	a0, zero
	sw	a0, -12(s0)
	j	.LBB29_13
.LBB29_13:
	lw	a0, -12(s0)
	lw	s0, 56(sp)
	lw	ra, 60(sp)
	addi	sp, sp, 64
	ret
.Lfunc_end29:
	.size	_Z6hdd_cdjPKDi, .Lfunc_end29-_Z6hdd_cdjPKDi
                                        # -- End function
	.section	.text._Z6strlenPKDi,"axG",@progbits,_Z6strlenPKDi,comdat
	.weak	_Z6strlenPKDi           # -- Begin function _Z6strlenPKDi
	.p2align	2
	.type	_Z6strlenPKDi,@function
_Z6strlenPKDi:                          # @_Z6strlenPKDi
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	mv	a0, zero
	sw	a0, -16(s0)
	j	.LBB30_1
.LBB30_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -12(s0)
	lw	a0, 0(a0)
	mv	a1, zero
	beq	a0, a1, .LBB30_3
	j	.LBB30_2
.LBB30_2:                               #   in Loop: Header=BB30_1 Depth=1
	lw	a0, -12(s0)
	addi	a0, a0, 4
	sw	a0, -12(s0)
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB30_1
.LBB30_3:
	lw	a0, -16(s0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end30:
	.size	_Z6strlenPKDi, .Lfunc_end30-_Z6strlenPKDi
                                        # -- End function
	.section	.text._Z10read_drivej,"axG",@progbits,_Z10read_drivej,comdat
	.weak	_Z10read_drivej         # -- Begin function _Z10read_drivej
	.p2align	2
	.type	_Z10read_drivej,@function
_Z10read_drivej:                        # @_Z10read_drivej
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	lui	a1, 655360
	sw	a0, 8(a1)
	lui	a0, 524288
	lw	a0, 4(a0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end31:
	.size	_Z10read_drivej, .Lfunc_end31-_Z10read_drivej
                                        # -- End function
	.text
	.globl	_Z8hdd_rootv            # -- Begin function _Z8hdd_rootv
	.p2align	2
	.type	_Z8hdd_rootv,@function
_Z8hdd_rootv:                           # @_Z8hdd_rootv
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	addi	a0, zero, 4
	call	_Z10read_drivej
	addi	a0, a0, 16
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end32:
	.size	_Z8hdd_rootv, .Lfunc_end32-_Z8hdd_rootv
                                        # -- End function
	.globl	_ZrsR4FileRj            # -- Begin function _ZrsR4FileRj
	.p2align	2
	.type	_ZrsR4FileRj,@function
_ZrsR4FileRj:                           # @_ZrsR4FileRj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	lw	a1, 0(a0)
	lw	a1, 0(a1)
	jalr	a1
	lw	a1, -16(s0)
	sw	a0, 0(a1)
	lw	a0, -12(s0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end33:
	.size	_ZrsR4FileRj, .Lfunc_end33-_ZrsR4FileRj
                                        # -- End function
	.globl	_Z19numberOfBytesInCharh # -- Begin function _Z19numberOfBytesInCharh
	.p2align	2
	.type	_Z19numberOfBytesInCharh,@function
_Z19numberOfBytesInCharh:               # @_Z19numberOfBytesInCharh
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	mv	a1, a0
	sb	a0, -13(s0)
	lbu	a0, -13(s0)
	addi	a2, zero, 127
	blt	a2, a0, .LBB34_2
	j	.LBB34_1
.LBB34_1:
	addi	a0, zero, 1
	sw	a0, -12(s0)
	j	.LBB34_7
.LBB34_2:
	lbu	a0, -13(s0)
	addi	a1, zero, 223
	blt	a1, a0, .LBB34_4
	j	.LBB34_3
.LBB34_3:
	addi	a0, zero, 2
	sw	a0, -12(s0)
	j	.LBB34_7
.LBB34_4:
	lbu	a0, -13(s0)
	addi	a1, zero, 239
	blt	a1, a0, .LBB34_6
	j	.LBB34_5
.LBB34_5:
	addi	a0, zero, 3
	sw	a0, -12(s0)
	j	.LBB34_7
.LBB34_6:
	addi	a0, zero, 4
	sw	a0, -12(s0)
	j	.LBB34_7
.LBB34_7:
	lw	a0, -12(s0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end34:
	.size	_Z19numberOfBytesInCharh, .Lfunc_end34-_Z19numberOfBytesInCharh
                                        # -- End function
	.globl	_Z9read_utf8R4File      # -- Begin function _Z9read_utf8R4File
	.p2align	2
	.type	_Z9read_utf8R4File,@function
_Z9read_utf8R4File:                     # @_Z9read_utf8R4File
# %bb.0:
	addi	sp, sp, -64
	sw	ra, 60(sp)
	sw	s0, 56(sp)
	addi	s0, sp, 64
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	mv	a1, zero
	sb	a1, -17(s0)
	sw	a0, -28(s0)
	sw	a1, -32(s0)
	lw	a2, -32(s0)
	call	_ZN6stringC2Eij
	lw	a0, -16(s0)
	call	_ZN4File4sizeEv
	lw	a1, -28(s0)
	sw	a0, -36(s0)
	mv	a0, a1
	lw	a1, -36(s0)
	call	_ZN6vectorIjE7reserveEj
	j	.LBB35_1
.LBB35_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	call	_ZN4File3eofEv
	bnez	a0, .LBB35_13
	j	.LBB35_2
.LBB35_2:                               #   in Loop: Header=BB35_1 Depth=1
	lw	a0, -16(s0)
	lw	a1, 0(a0)
	lw	a1, 4(a1)
	jalr	a1
	sw	a0, -24(s0)
	lw	a0, -24(s0)
	addi	a1, zero, 240
	bltu	a0, a1, .LBB35_4
	j	.LBB35_3
.LBB35_3:                               #   in Loop: Header=BB35_1 Depth=1
	lw	a0, -24(s0)
	andi	a0, a0, 31
	sw	a0, -24(s0)
	lw	a0, -24(s0)
	slli	a0, a0, 6
	lw	a1, -16(s0)
	lw	a2, 0(a1)
	lw	a2, 4(a2)
	sw	a0, -40(s0)
	mv	a0, a1
	jalr	a2
	andi	a0, a0, 63
	lw	a1, -40(s0)
	or	a0, a1, a0
	sw	a0, -24(s0)
	lw	a0, -24(s0)
	slli	a0, a0, 6
	lw	a1, -16(s0)
	lw	a2, 0(a1)
	lw	a2, 4(a2)
	sw	a0, -44(s0)
	mv	a0, a1
	jalr	a2
	andi	a0, a0, 63
	lw	a1, -44(s0)
	or	a0, a1, a0
	sw	a0, -24(s0)
	lw	a0, -24(s0)
	slli	a0, a0, 6
	lw	a1, -16(s0)
	lw	a2, 0(a1)
	lw	a2, 4(a2)
	sw	a0, -48(s0)
	mv	a0, a1
	jalr	a2
	andi	a0, a0, 63
	lw	a1, -48(s0)
	or	a0, a1, a0
	sw	a0, -24(s0)
	j	.LBB35_10
.LBB35_4:                               #   in Loop: Header=BB35_1 Depth=1
	lw	a0, -24(s0)
	addi	a1, zero, 224
	bltu	a0, a1, .LBB35_6
	j	.LBB35_5
.LBB35_5:                               #   in Loop: Header=BB35_1 Depth=1
	lw	a0, -24(s0)
	andi	a0, a0, 15
	sw	a0, -24(s0)
	lw	a0, -24(s0)
	slli	a0, a0, 6
	lw	a1, -16(s0)
	lw	a2, 0(a1)
	lw	a2, 4(a2)
	sw	a0, -52(s0)
	mv	a0, a1
	jalr	a2
	andi	a0, a0, 63
	lw	a1, -52(s0)
	or	a0, a1, a0
	sw	a0, -24(s0)
	lw	a0, -24(s0)
	slli	a0, a0, 6
	lw	a1, -16(s0)
	lw	a2, 0(a1)
	lw	a2, 4(a2)
	sw	a0, -56(s0)
	mv	a0, a1
	jalr	a2
	andi	a0, a0, 63
	lw	a1, -56(s0)
	or	a0, a1, a0
	sw	a0, -24(s0)
	j	.LBB35_9
.LBB35_6:                               #   in Loop: Header=BB35_1 Depth=1
	lw	a0, -24(s0)
	addi	a1, zero, 128
	bltu	a0, a1, .LBB35_8
	j	.LBB35_7
.LBB35_7:                               #   in Loop: Header=BB35_1 Depth=1
	lw	a0, -24(s0)
	andi	a0, a0, 7
	sw	a0, -24(s0)
	lw	a0, -24(s0)
	slli	a0, a0, 6
	lw	a1, -16(s0)
	lw	a2, 0(a1)
	lw	a2, 4(a2)
	sw	a0, -60(s0)
	mv	a0, a1
	jalr	a2
	andi	a0, a0, 63
	lw	a1, -60(s0)
	or	a0, a1, a0
	sw	a0, -24(s0)
	j	.LBB35_8
.LBB35_8:                               #   in Loop: Header=BB35_1 Depth=1
	j	.LBB35_9
.LBB35_9:                               #   in Loop: Header=BB35_1 Depth=1
	j	.LBB35_10
.LBB35_10:                              #   in Loop: Header=BB35_1 Depth=1
	lw	a0, -24(s0)
	mv	a1, zero
	beq	a0, a1, .LBB35_12
	j	.LBB35_11
.LBB35_11:                              #   in Loop: Header=BB35_1 Depth=1
	addi	a1, s0, -24
	lw	a0, -28(s0)
	call	_ZN6vectorIjE9push_backERKj
	j	.LBB35_12
.LBB35_12:                              #   in Loop: Header=BB35_1 Depth=1
	j	.LBB35_1
.LBB35_13:
	addi	a0, zero, 1
	sb	a0, -17(s0)
	lbu	a0, -17(s0)
	bnez	a0, .LBB35_15
	j	.LBB35_14
.LBB35_14:
	lw	a0, -28(s0)
	call	_ZN6stringD2Ev
	j	.LBB35_15
.LBB35_15:
	lw	s0, 56(sp)
	lw	ra, 60(sp)
	addi	sp, sp, 64
	ret
.Lfunc_end35:
	.size	_Z9read_utf8R4File, .Lfunc_end35-_Z9read_utf8R4File
                                        # -- End function
	.section	.text._ZN6vectorIjE7reserveEj,"axG",@progbits,_ZN6vectorIjE7reserveEj,comdat
	.weak	_ZN6vectorIjE7reserveEj # -- Begin function _ZN6vectorIjE7reserveEj
	.p2align	2
	.type	_ZN6vectorIjE7reserveEj,@function
_ZN6vectorIjE7reserveEj:                # @_ZN6vectorIjE7reserveEj
# %bb.0:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	addi	s0, sp, 48
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lw	a2, 4(a0)
	sw	a0, -28(s0)
	bgeu	a2, a1, .LBB36_13
	j	.LBB36_1
.LBB36_1:
	j	.LBB36_2
.LBB36_2:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -28(s0)
	lw	a1, 4(a0)
	lw	a2, -16(s0)
	bgeu	a1, a2, .LBB36_4
	j	.LBB36_3
.LBB36_3:                               #   in Loop: Header=BB36_2 Depth=1
	lw	a0, -28(s0)
	lw	a1, 4(a0)
	add	a1, a1, a1
	sw	a1, 4(a0)
	j	.LBB36_2
.LBB36_4:
	lw	a0, -28(s0)
	lw	a1, 4(a0)
	lui	a2, 262144
	addi	a2, a2, -1
	and	a2, a1, a2
	xor	a2, a2, a1
	snez	a2, a2
	slli	a1, a1, 2
	addi	a3, zero, -1
	mv	a4, zero
	sw	a1, -32(s0)
	sw	a4, -36(s0)
	sw	a3, -40(s0)
	bne	a2, a4, .LBB36_6
# %bb.5:
	lw	a0, -32(s0)
	sw	a0, -40(s0)
.LBB36_6:
	lw	a0, -40(s0)
	call	_Znaj
	sw	a0, -20(s0)
	lw	a0, -36(s0)
	sw	a0, -24(s0)
	j	.LBB36_7
.LBB36_7:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -24(s0)
	lw	a1, -28(s0)
	lw	a2, 0(a1)
	bgeu	a0, a2, .LBB36_10
	j	.LBB36_8
.LBB36_8:                               #   in Loop: Header=BB36_7 Depth=1
	lw	a0, -28(s0)
	lw	a1, 8(a0)
	lw	a2, -24(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	lw	a1, 0(a1)
	lw	a3, -20(s0)
	add	a2, a3, a2
	sw	a1, 0(a2)
	j	.LBB36_9
.LBB36_9:                               #   in Loop: Header=BB36_7 Depth=1
	lw	a0, -24(s0)
	addi	a0, a0, 1
	sw	a0, -24(s0)
	j	.LBB36_7
.LBB36_10:
	lw	a0, -28(s0)
	lw	a1, 8(a0)
	mv	a2, zero
	sw	a1, -44(s0)
	beq	a1, a2, .LBB36_12
	j	.LBB36_11
.LBB36_11:
	lw	a0, -44(s0)
	call	_ZdlPv
	j	.LBB36_12
.LBB36_12:
	lw	a0, -20(s0)
	lw	a1, -28(s0)
	sw	a0, 8(a1)
	j	.LBB36_13
.LBB36_13:
	lw	s0, 40(sp)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end36:
	.size	_ZN6vectorIjE7reserveEj, .Lfunc_end36-_ZN6vectorIjE7reserveEj
                                        # -- End function
	.section	.text._ZN4File4sizeEv,"axG",@progbits,_ZN4File4sizeEv,comdat
	.weak	_ZN4File4sizeEv         # -- Begin function _ZN4File4sizeEv
	.p2align	2
	.type	_ZN4File4sizeEv,@function
_ZN4File4sizeEv:                        # @_ZN4File4sizeEv
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	sw	a0, -16(s0)
	call	_ZN4File3eofEv
	mv	a1, zero
	beq	a0, a1, .LBB37_2
	j	.LBB37_1
.LBB37_1:
	mv	a0, zero
	sw	a0, -20(s0)
	j	.LBB37_3
.LBB37_2:
	lw	a0, -16(s0)
	lw	a1, 8(a0)
	lw	a2, 4(a0)
	sub	a1, a1, a2
	sw	a1, -20(s0)
	j	.LBB37_3
.LBB37_3:
	lw	a0, -20(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end37:
	.size	_ZN4File4sizeEv, .Lfunc_end37-_ZN4File4sizeEv
                                        # -- End function
	.section	.text._ZN4File3eofEv,"axG",@progbits,_ZN4File3eofEv,comdat
	.weak	_ZN4File3eofEv          # -- Begin function _ZN4File3eofEv
	.p2align	2
	.type	_ZN4File3eofEv,@function
_ZN4File3eofEv:                         # @_ZN4File3eofEv
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	lw	a1, 4(a0)
	lw	a0, 8(a0)
	sltu	a0, a1, a0
	xori	a0, a0, 1
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end38:
	.size	_ZN4File3eofEv, .Lfunc_end38-_ZN4File3eofEv
                                        # -- End function
	.section	.text._ZN6vectorIjE9push_backERKj,"axG",@progbits,_ZN6vectorIjE9push_backERKj,comdat
	.weak	_ZN6vectorIjE9push_backERKj # -- Begin function _ZN6vectorIjE9push_backERKj
	.p2align	2
	.type	_ZN6vectorIjE9push_backERKj,@function
_ZN6vectorIjE9push_backERKj:            # @_ZN6vectorIjE9push_backERKj
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	lw	a1, 0(a0)
	lw	a2, 4(a0)
	sw	a0, -20(s0)
	bltu	a1, a2, .LBB39_2
	j	.LBB39_1
.LBB39_1:
	lw	a0, -20(s0)
	lw	a1, 4(a0)
	add	a1, a1, a1
	call	_ZN6vectorIjE7reserveEj
	j	.LBB39_2
.LBB39_2:
	lw	a0, -16(s0)
	lw	a0, 0(a0)
	lw	a1, -20(s0)
	lw	a2, 8(a1)
	lw	a3, 0(a1)
	slli	a3, a3, 2
	add	a2, a2, a3
	sw	a0, 0(a2)
	lw	a0, 0(a1)
	addi	a0, a0, 1
	sw	a0, 0(a1)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end39:
	.size	_ZN6vectorIjE9push_backERKj, .Lfunc_end39-_ZN6vectorIjE9push_backERKj
                                        # -- End function
	.text
	.globl	_Z12setScreenPosjj      # -- Begin function _Z12setScreenPosjj
	.p2align	2
	.type	_Z12setScreenPosjj,@function
_Z12setScreenPosjj:                     # @_Z12setScreenPosjj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a1, -12(s0)
	lw	a2, -16(s0)
	addi	a0, zero, 1
	mv	a3, zero
	call	_Z16send_screen_wordjjjj
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end40:
	.size	_Z12setScreenPosjj, .Lfunc_end40-_Z12setScreenPosjj
                                        # -- End function
	.section	.text._Z16send_screen_wordjjjj,"axG",@progbits,_Z16send_screen_wordjjjj,comdat
	.weak	_Z16send_screen_wordjjjj # -- Begin function _Z16send_screen_wordjjjj
	.p2align	2
	.type	_Z16send_screen_wordjjjj,@function
_Z16send_screen_wordjjjj:               # @_Z16send_screen_wordjjjj
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	sw	a3, -24(s0)
	lw	a0, -24(s0)
	slli	a0, a0, 8
	lw	a1, -20(s0)
	add	a0, a1, a0
	sw	a0, -20(s0)
	lw	a0, -20(s0)
	slli	a0, a0, 8
	lw	a1, -16(s0)
	add	a0, a1, a0
	sw	a0, -16(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	slli	a1, a1, 8
	add	a0, a0, a1
	lui	a1, 655360
	sw	a0, 12(a1)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end41:
	.size	_Z16send_screen_wordjjjj, .Lfunc_end41-_Z16send_screen_wordjjjj
                                        # -- End function
	.text
	.globl	_Z14setScreenColorjjj   # -- Begin function _Z14setScreenColorjjj
	.p2align	2
	.type	_Z14setScreenColorjjj,@function
_Z14setScreenColorjjj:                  # @_Z14setScreenColorjjj
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	lw	a1, -12(s0)
	lw	a2, -16(s0)
	lw	a3, -20(s0)
	addi	a0, zero, 2
	call	_Z16send_screen_wordjjjj
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end42:
	.size	_Z14setScreenColorjjj, .Lfunc_end42-_Z14setScreenColorjjj
                                        # -- End function
	.globl	_Z8setPixeljj           # -- Begin function _Z8setPixeljj
	.p2align	2
	.type	_Z8setPixeljj,@function
_Z8setPixeljj:                          # @_Z8setPixeljj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a1, -12(s0)
	lw	a2, -16(s0)
	addi	a0, zero, 3
	mv	a3, zero
	call	_Z16send_screen_wordjjjj
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end43:
	.size	_Z8setPixeljj, .Lfunc_end43-_Z8setPixeljj
                                        # -- End function
	.globl	_Z13drawRectanglejj     # -- Begin function _Z13drawRectanglejj
	.p2align	2
	.type	_Z13drawRectanglejj,@function
_Z13drawRectanglejj:                    # @_Z13drawRectanglejj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a1, -12(s0)
	lw	a2, -16(s0)
	addi	a0, zero, 4
	mv	a3, zero
	call	_Z16send_screen_wordjjjj
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end44:
	.size	_Z13drawRectanglejj, .Lfunc_end44-_Z13drawRectanglejj
                                        # -- End function
	.globl	_Z11drawTexturej        # -- Begin function _Z11drawTexturej
	.p2align	2
	.type	_Z11drawTexturej,@function
_Z11drawTexturej:                       # @_Z11drawTexturej
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lw	a1, -12(s0)
	addi	a0, zero, 5
	mv	a2, zero
	sw	a2, -16(s0)
	lw	a3, -16(s0)
	call	_Z16send_screen_wordjjjj
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end45:
	.size	_Z11drawTexturej, .Lfunc_end45-_Z11drawTexturej
                                        # -- End function
	.globl	_Z19startSendingTexturej # -- Begin function _Z19startSendingTexturej
	.p2align	2
	.type	_Z19startSendingTexturej,@function
_Z19startSendingTexturej:               # @_Z19startSendingTexturej
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lw	a1, -12(s0)
	addi	a0, zero, 6
	mv	a2, zero
	sw	a2, -16(s0)
	lw	a3, -16(s0)
	call	_Z16send_screen_wordjjjj
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end46:
	.size	_Z19startSendingTexturej, .Lfunc_end46-_Z19startSendingTexturej
                                        # -- End function
	.globl	_Z16sendTexturePixeljjjj # -- Begin function _Z16sendTexturePixeljjjj
	.p2align	2
	.type	_Z16sendTexturePixeljjjj,@function
_Z16sendTexturePixeljjjj:               # @_Z16sendTexturePixeljjjj
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	sw	a3, -24(s0)
	lw	a0, -24(s0)
	mv	a1, zero
	bne	a0, a1, .LBB47_2
	j	.LBB47_1
.LBB47_1:
	addi	a0, zero, 1
	mv	a1, zero
	sw	a0, -28(s0)
	lw	a2, -28(s0)
	sw	a1, -32(s0)
	mv	a1, a2
	lw	a3, -32(s0)
	call	_Z16send_screen_wordjjjj
	j	.LBB47_3
.LBB47_2:
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lw	a2, -20(s0)
	lw	a3, -24(s0)
	call	_Z16send_screen_wordjjjj
	j	.LBB47_3
.LBB47_3:
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end47:
	.size	_Z16sendTexturePixeljjjj, .Lfunc_end47-_Z16sendTexturePixeljjjj
                                        # -- End function
	.globl	_Z13refreshScreenv      # -- Begin function _Z13refreshScreenv
	.p2align	2
	.type	_Z13refreshScreenv,@function
_Z13refreshScreenv:                     # @_Z13refreshScreenv
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	addi	a0, zero, 42
	mv	a1, zero
	sw	a1, -12(s0)
	lw	a2, -12(s0)
	lw	a3, -12(s0)
	call	_Z16send_screen_wordjjjj
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end48:
	.size	_Z13refreshScreenv, .Lfunc_end48-_Z13refreshScreenv
                                        # -- End function
	.globl	_Z11sendTextureR4Filej  # -- Begin function _Z11sendTextureR4Filej
	.p2align	2
	.type	_Z11sendTextureR4Filej,@function
_Z11sendTextureR4Filej:                 # @_Z11sendTextureR4Filej
# %bb.0:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	addi	s0, sp, 48
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	addi	a1, s0, -20
	call	_ZrsR4FileRj
	addi	a1, s0, -24
	call	_ZrsR4FileRj
	lw	a1, -24(s0)
	lw	a2, -20(s0)
	sw	a0, -36(s0)
	mv	a0, a1
	mv	a1, a2
	call	_Z12setScreenPosjj
	lw	a0, -16(s0)
	call	_Z19startSendingTexturej
	mv	a0, zero
	sw	a0, -28(s0)
	j	.LBB49_1
.LBB49_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB49_3 Depth 2
	lw	a0, -28(s0)
	lw	a1, -20(s0)
	bgeu	a0, a1, .LBB49_8
	j	.LBB49_2
.LBB49_2:                               #   in Loop: Header=BB49_1 Depth=1
	mv	a0, zero
	sw	a0, -32(s0)
	j	.LBB49_3
.LBB49_3:                               #   Parent Loop BB49_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -32(s0)
	lw	a1, -24(s0)
	bgeu	a0, a1, .LBB49_6
	j	.LBB49_4
.LBB49_4:                               #   in Loop: Header=BB49_3 Depth=2
	lw	a0, -12(s0)
	lw	a1, 0(a0)
	lw	a1, 0(a1)
	jalr	a1
	lui	a1, 655360
	sw	a0, 12(a1)
	j	.LBB49_5
.LBB49_5:                               #   in Loop: Header=BB49_3 Depth=2
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB49_3
.LBB49_6:                               #   in Loop: Header=BB49_1 Depth=1
	j	.LBB49_7
.LBB49_7:                               #   in Loop: Header=BB49_1 Depth=1
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB49_1
.LBB49_8:
	lw	s0, 40(sp)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end49:
	.size	_Z11sendTextureR4Filej, .Lfunc_end49-_Z11sendTextureR4Filej
                                        # -- End function
	.globl	_Z9load_tilejjPKDi      # -- Begin function _Z9load_tilejjPKDi
	.p2align	2
	.type	_Z9load_tilejjPKDi,@function
_Z9load_tilejjPKDi:                     # @_Z9load_tilejjPKDi
# %bb.0:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	addi	s0, sp, 48
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	lw	a0, -16(s0)
	lw	a1, -20(s0)
	call	_Z6hdd_cdjPKDi
	addi	a1, s0, -32
	sw	a0, -36(s0)
	mv	a0, a1
	lw	a2, -36(s0)
	sw	a1, -40(s0)
	mv	a1, a2
	call	_ZN4FileC2Ej
	lw	a1, -12(s0)
	lw	a0, -40(s0)
	call	_Z11sendTextureR4Filej
	lw	s0, 40(sp)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end50:
	.size	_Z9load_tilejjPKDi, .Lfunc_end50-_Z9load_tilejjPKDi
                                        # -- End function
	.section	.text._ZN4FileC2Ej,"axG",@progbits,_ZN4FileC2Ej,comdat
	.weak	_ZN4FileC2Ej            # -- Begin function _ZN4FileC2Ej
	.p2align	2
	.type	_ZN4FileC2Ej,@function
_ZN4FileC2Ej:                           # @_ZN4FileC2Ej
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	sw	a0, -20(s0)
	call	_ZN7IStreamC2Ev
	lui	a0, %hi(_ZTV4File)
	addi	a0, a0, %lo(_ZTV4File)
	addi	a0, a0, 8
	lw	a1, -20(s0)
	sw	a0, 0(a1)
	lw	a0, -16(s0)
	addi	a0, a0, 8
	sw	a0, 4(a1)
	lw	a0, 4(a1)
	lw	a2, -16(s0)
	addi	a2, a2, 4
	sw	a0, -24(s0)
	mv	a0, a2
	call	_Z10read_drivej
	lw	a1, -24(s0)
	add	a0, a1, a0
	lw	a1, -20(s0)
	sw	a0, 8(a1)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end51:
	.size	_ZN4FileC2Ej, .Lfunc_end51-_ZN4FileC2Ej
                                        # -- End function
	.text
	.globl	_Z19load_alphabet_tilesj # -- Begin function _Z19load_alphabet_tilesj
	.p2align	2
	.type	_Z19load_alphabet_tilesj,@function
_Z19load_alphabet_tilesj:               # @_Z19load_alphabet_tilesj
# %bb.0:
	addi	sp, sp, -80
	sw	ra, 76(sp)
	sw	s0, 72(sp)
	addi	s0, sp, 80
	sw	a0, -12(s0)
	lui	a0, %hi(.L__const._Z19load_alphabet_tilesj.name)
	addi	a1, a0, %lo(.L__const._Z19load_alphabet_tilesj.name)
	lw	a2, 20(a1)
	sw	a2, -16(s0)
	lw	a2, 16(a1)
	sw	a2, -20(s0)
	lw	a2, 12(a1)
	sw	a2, -24(s0)
	lw	a2, 8(a1)
	sw	a2, -28(s0)
	lw	a1, 4(a1)
	sw	a1, -32(s0)
	lw	a0, %lo(.L__const._Z19load_alphabet_tilesj.name)(a0)
	sw	a0, -36(s0)
	lui	a0, %hi(.L__const._Z19load_alphabet_tilesj.name_upper)
	addi	a1, a0, %lo(.L__const._Z19load_alphabet_tilesj.name_upper)
	lw	a2, 28(a1)
	sw	a2, -40(s0)
	lw	a2, 24(a1)
	sw	a2, -44(s0)
	lw	a2, 20(a1)
	sw	a2, -48(s0)
	lw	a2, 16(a1)
	sw	a2, -52(s0)
	lw	a2, 12(a1)
	sw	a2, -56(s0)
	lw	a2, 8(a1)
	sw	a2, -60(s0)
	lw	a1, 4(a1)
	sw	a1, -64(s0)
	lw	a0, %lo(.L__const._Z19load_alphabet_tilesj.name_upper)(a0)
	sw	a0, -68(s0)
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str)
	addi	a2, a0, %lo(.L.str)
	addi	a0, zero, 32
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 97
	sw	a0, -72(s0)
	j	.LBB52_1
.LBB52_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -72(s0)
	addi	a1, zero, 122
	bltu	a1, a0, .LBB52_4
	j	.LBB52_2
.LBB52_2:                               #   in Loop: Header=BB52_1 Depth=1
	lw	a0, -72(s0)
	sw	a0, -36(s0)
	lw	a0, -72(s0)
	lw	a1, -12(s0)
	addi	a2, s0, -36
	call	_Z9load_tilejjPKDi
	j	.LBB52_3
.LBB52_3:                               #   in Loop: Header=BB52_1 Depth=1
	lw	a0, -72(s0)
	addi	a0, a0, 1
	sw	a0, -72(s0)
	j	.LBB52_1
.LBB52_4:
	addi	a0, zero, 65
	sw	a0, -76(s0)
	j	.LBB52_5
.LBB52_5:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -76(s0)
	addi	a1, zero, 90
	bltu	a1, a0, .LBB52_8
	j	.LBB52_6
.LBB52_6:                               #   in Loop: Header=BB52_5 Depth=1
	lw	a0, -76(s0)
	sw	a0, -60(s0)
	lw	a0, -76(s0)
	lw	a1, -12(s0)
	addi	a2, s0, -68
	call	_Z9load_tilejjPKDi
	j	.LBB52_7
.LBB52_7:                               #   in Loop: Header=BB52_5 Depth=1
	lw	a0, -76(s0)
	addi	a0, a0, 1
	sw	a0, -76(s0)
	j	.LBB52_5
.LBB52_8:
	addi	a0, zero, 48
	sw	a0, -80(s0)
	j	.LBB52_9
.LBB52_9:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -80(s0)
	addi	a1, zero, 57
	bltu	a1, a0, .LBB52_12
	j	.LBB52_10
.LBB52_10:                              #   in Loop: Header=BB52_9 Depth=1
	lw	a0, -80(s0)
	sw	a0, -36(s0)
	lw	a0, -80(s0)
	lw	a1, -12(s0)
	addi	a2, s0, -36
	call	_Z9load_tilejjPKDi
	j	.LBB52_11
.LBB52_11:                              #   in Loop: Header=BB52_9 Depth=1
	lw	a0, -80(s0)
	addi	a0, a0, 1
	sw	a0, -80(s0)
	j	.LBB52_9
.LBB52_12:
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.1)
	addi	a2, a0, %lo(.L.str.1)
	addi	a0, zero, 58
	call	_Z9load_tilejjPKDi
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.2)
	addi	a2, a0, %lo(.L.str.2)
	addi	a0, zero, 40
	call	_Z9load_tilejjPKDi
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.3)
	addi	a2, a0, %lo(.L.str.3)
	addi	a0, zero, 41
	call	_Z9load_tilejjPKDi
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.4)
	addi	a2, a0, %lo(.L.str.4)
	addi	a0, zero, 91
	call	_Z9load_tilejjPKDi
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.5)
	addi	a2, a0, %lo(.L.str.5)
	addi	a0, zero, 93
	call	_Z9load_tilejjPKDi
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.6)
	addi	a2, a0, %lo(.L.str.6)
	addi	a0, zero, 59
	call	_Z9load_tilejjPKDi
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.7)
	addi	a2, a0, %lo(.L.str.7)
	addi	a0, zero, 46
	call	_Z9load_tilejjPKDi
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.8)
	addi	a2, a0, %lo(.L.str.8)
	addi	a0, zero, 37
	call	_Z9load_tilejjPKDi
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.9)
	addi	a2, a0, %lo(.L.str.9)
	addi	a0, zero, 45
	call	_Z9load_tilejjPKDi
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.10)
	addi	a2, a0, %lo(.L.str.10)
	addi	a0, zero, 44
	call	_Z9load_tilejjPKDi
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.11)
	addi	a2, a0, %lo(.L.str.11)
	addi	a0, zero, 33
	call	_Z9load_tilejjPKDi
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.12)
	addi	a2, a0, %lo(.L.str.12)
	addi	a0, zero, 63
	call	_Z9load_tilejjPKDi
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.13)
	addi	a2, a0, %lo(.L.str.13)
	addi	a0, zero, 47
	call	_Z9load_tilejjPKDi
	lw	a1, -12(s0)
	lui	a0, %hi(.L.str.14)
	addi	a2, a0, %lo(.L.str.14)
	addi	a0, zero, 92
	call	_Z9load_tilejjPKDi
	lw	s0, 72(sp)
	lw	ra, 76(sp)
	addi	sp, sp, 80
	ret
.Lfunc_end52:
	.size	_Z19load_alphabet_tilesj, .Lfunc_end52-_Z19load_alphabet_tilesj
                                        # -- End function
	.globl	_Z15load_game_tilesj    # -- Begin function _Z15load_game_tilesj
	.p2align	2
	.type	_Z15load_game_tilesj,@function
_Z15load_game_tilesj:                   # @_Z15load_game_tilesj
# %bb.0:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	addi	s0, sp, 48
	sw	a0, -12(s0)
	lui	a0, %hi(.L__const._Z15load_game_tilesj.name)
	addi	a1, a0, %lo(.L__const._Z15load_game_tilesj.name)
	lw	a2, 24(a1)
	sw	a2, -16(s0)
	lw	a2, 20(a1)
	sw	a2, -20(s0)
	lw	a2, 16(a1)
	sw	a2, -24(s0)
	lw	a2, 12(a1)
	sw	a2, -28(s0)
	lw	a2, 8(a1)
	sw	a2, -32(s0)
	lw	a1, 4(a1)
	sw	a1, -36(s0)
	lw	a0, %lo(.L__const._Z15load_game_tilesj.name)(a0)
	sw	a0, -40(s0)
	mv	a0, zero
	sw	a0, -44(s0)
	j	.LBB53_1
.LBB53_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -44(s0)
	addi	a1, zero, 98
	bltu	a1, a0, .LBB53_4
	j	.LBB53_2
.LBB53_2:                               #   in Loop: Header=BB53_1 Depth=1
	lw	a0, -44(s0)
	addi	a0, a0, 1
	addi	a1, s0, -40
	addi	a2, zero, 2
	addi	a3, zero, 48
	call	_Z8uint2strjPDijDs
	j	.LBB53_3
.LBB53_3:                               #   in Loop: Header=BB53_1 Depth=1
	lw	a0, -44(s0)
	addi	a0, a0, 1
	sw	a0, -44(s0)
	j	.LBB53_1
.LBB53_4:
	lw	s0, 40(sp)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end53:
	.size	_Z15load_game_tilesj, .Lfunc_end53-_Z15load_game_tilesj
                                        # -- End function
	.globl	_Z14load_all_tilesj     # -- Begin function _Z14load_all_tilesj
	.p2align	2
	.type	_Z14load_all_tilesj,@function
_Z14load_all_tilesj:                    # @_Z14load_all_tilesj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	lui	a1, %hi(.L.str.15)
	addi	a1, a1, %lo(.L.str.15)
	call	_Z6hdd_cdjPKDi
	call	_Z19load_alphabet_tilesj
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end54:
	.size	_Z14load_all_tilesj, .Lfunc_end54-_Z14load_all_tilesj
                                        # -- End function
	.globl	_Z8comparerjj           # -- Begin function _Z8comparerjj
	.p2align	2
	.type	_Z8comparerjj,@function
_Z8comparerjj:                          # @_Z8comparerjj
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -16(s0)
	lw	a1, -12(s0)
	sltu	a0, a1, a0
	xori	a0, a0, 1
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	lui	a0, %hi(_ZL4cout)
	addi	a0, a0, %lo(_ZL4cout)
	call	_ZlsR13TextOutStreamj
	lui	a1, %hi(.L.str.16)
	addi	a1, a1, %lo(.L.str.16)
	call	_ZlsR13TextOutStreamPKc
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end55:
	.size	_Z8comparerjj, .Lfunc_end55-_Z8comparerjj
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	call	_Z14initMemManagerv
	lui	a0, %hi(_ZL4cout)
	addi	a0, a0, %lo(_ZL4cout)
	lui	a1, %hi(.L.str.17)
	addi	a1, a1, %lo(.L.str.17)
	sw	a0, -12(s0)
	call	_ZlsR13TextOutStreamPKc
	addi	a1, zero, -20
	sw	a1, -16(s0)
	call	_ZlsR13TextOutStreamj
	lui	a1, %hi(.L.str.16)
	addi	a1, a1, %lo(.L.str.16)
	sw	a1, -20(s0)
	call	_ZlsR13TextOutStreamPKc
	lui	a1, 244141
	addi	a1, a1, -1536
	lw	a2, -12(s0)
	sw	a0, -24(s0)
	mv	a0, a2
	sw	a1, -28(s0)
	call	_ZlsR13TextOutStreamj
	lw	a1, -20(s0)
	call	_ZlsR13TextOutStreamPKc
	lw	a1, -28(s0)
	sw	a0, -32(s0)
	mv	a0, a1
	call	_Z8comparerjj
	lui	a0, 23185
	addi	a0, a0, 1516
	lw	a1, -28(s0)
	call	_Z8comparerjj
	lui	a0, 267326
	addi	a0, a0, -20
	lw	a1, -28(s0)
	call	_Z8comparerjj
	lw	a0, -16(s0)
	lw	a1, -28(s0)
	call	_Z8comparerjj
	mv	a0, zero
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end56:
	.size	main, .Lfunc_end56-main
                                        # -- End function
	.section	.text._ZN6vectorIjEC2Ejj,"axG",@progbits,_ZN6vectorIjEC2Ejj,comdat
	.weak	_ZN6vectorIjEC2Ejj      # -- Begin function _ZN6vectorIjEC2Ejj
	.p2align	2
	.type	_ZN6vectorIjEC2Ejj,@function
_ZN6vectorIjEC2Ejj:                     # @_ZN6vectorIjEC2Ejj
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	lw	a0, -12(s0)
	mv	a1, zero
	sw	a1, 0(a0)
	addi	a1, zero, 2
	sw	a1, 4(a0)
	addi	a2, zero, 8
	sw	a0, -24(s0)
	mv	a0, a2
	sw	a1, -28(s0)
	call	_Znaj
	lw	a1, -24(s0)
	sw	a0, 8(a1)
	lw	a1, -16(s0)
	lw	a2, -20(s0)
	lw	a0, -24(s0)
	call	_ZN6vectorIjE6resizeEjj
	lw	a0, -24(s0)
	lw	a1, -28(s0)
	call	_ZN6vectorIjE7reserveEj
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end57:
	.size	_ZN6vectorIjEC2Ejj, .Lfunc_end57-_ZN6vectorIjEC2Ejj
                                        # -- End function
	.section	.text._ZN6vectorIjE6resizeEjj,"axG",@progbits,_ZN6vectorIjE6resizeEjj,comdat
	.weak	_ZN6vectorIjE6resizeEjj # -- Begin function _ZN6vectorIjE6resizeEjj
	.p2align	2
	.type	_ZN6vectorIjE6resizeEjj,@function
_ZN6vectorIjE6resizeEjj:                # @_ZN6vectorIjE6resizeEjj
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lw	a2, 0(a0)
	sw	a0, -24(s0)
	bgeu	a2, a1, .LBB58_8
	j	.LBB58_1
.LBB58_1:
	j	.LBB58_2
.LBB58_2:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	lw	a2, 4(a1)
	bgeu	a2, a0, .LBB58_4
	j	.LBB58_3
.LBB58_3:                               #   in Loop: Header=BB58_2 Depth=1
	lw	a1, -16(s0)
	lw	a0, -24(s0)
	call	_ZN6vectorIjE7reserveEj
	j	.LBB58_2
.LBB58_4:
	j	.LBB58_5
.LBB58_5:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -24(s0)
	lw	a1, 0(a0)
	lw	a2, -16(s0)
	bgeu	a1, a2, .LBB58_7
	j	.LBB58_6
.LBB58_6:                               #   in Loop: Header=BB58_5 Depth=1
	lw	a0, -20(s0)
	lw	a1, -24(s0)
	lw	a2, 8(a1)
	lw	a3, 0(a1)
	slli	a3, a3, 2
	add	a2, a2, a3
	sw	a0, 0(a2)
	lw	a0, 0(a1)
	addi	a0, a0, 1
	sw	a0, 0(a1)
	j	.LBB58_5
.LBB58_7:
	j	.LBB58_9
.LBB58_8:
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	sw	a0, 0(a1)
	j	.LBB58_9
.LBB58_9:
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end58:
	.size	_ZN6vectorIjE6resizeEjj, .Lfunc_end58-_ZN6vectorIjE6resizeEjj
                                        # -- End function
	.section	.text._ZN6vectorIjED2Ev,"axG",@progbits,_ZN6vectorIjED2Ev,comdat
	.weak	_ZN6vectorIjED2Ev       # -- Begin function _ZN6vectorIjED2Ev
	.p2align	2
	.type	_ZN6vectorIjED2Ev,@function
_ZN6vectorIjED2Ev:                      # @_ZN6vectorIjED2Ev
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	lw	a0, 8(a0)
	mv	a1, zero
	sw	a0, -16(s0)
	beq	a0, a1, .LBB59_2
	j	.LBB59_1
.LBB59_1:
	lw	a0, -16(s0)
	call	_ZdlPv
	j	.LBB59_2
.LBB59_2:
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end59:
	.size	_ZN6vectorIjED2Ev, .Lfunc_end59-_ZN6vectorIjED2Ev
                                        # -- End function
	.section	.text._ZN7IStreamC2Ev,"axG",@progbits,_ZN7IStreamC2Ev,comdat
	.weak	_ZN7IStreamC2Ev         # -- Begin function _ZN7IStreamC2Ev
	.p2align	2
	.type	_ZN7IStreamC2Ev,@function
_ZN7IStreamC2Ev:                        # @_ZN7IStreamC2Ev
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	lui	a1, %hi(_ZTV7IStream)
	addi	a1, a1, %lo(_ZTV7IStream)
	addi	a1, a1, 8
	sw	a1, 0(a0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end60:
	.size	_ZN7IStreamC2Ev, .Lfunc_end60-_ZN7IStreamC2Ev
                                        # -- End function
	.section	.text._ZN4File8readWordEv,"axG",@progbits,_ZN4File8readWordEv,comdat
	.weak	_ZN4File8readWordEv     # -- Begin function _ZN4File8readWordEv
	.p2align	2
	.type	_ZN4File8readWordEv,@function
_ZN4File8readWordEv:                    # @_ZN4File8readWordEv
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	lw	a1, 4(a0)
	sw	a0, -20(s0)
	mv	a0, a1
	call	_Z10read_drivej
	sw	a0, -16(s0)
	lw	a0, -20(s0)
	lw	a1, 4(a0)
	addi	a1, a1, 4
	sw	a1, 4(a0)
	lw	a0, -16(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end61:
	.size	_ZN4File8readWordEv, .Lfunc_end61-_ZN4File8readWordEv
                                        # -- End function
	.section	.text._ZN4File8readByteEv,"axG",@progbits,_ZN4File8readByteEv,comdat
	.weak	_ZN4File8readByteEv     # -- Begin function _ZN4File8readByteEv
	.p2align	2
	.type	_ZN4File8readByteEv,@function
_ZN4File8readByteEv:                    # @_ZN4File8readByteEv
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	lw	a1, 4(a0)
	sw	a0, -24(s0)
	mv	a0, a1
	call	_Z10read_drivej
	sw	a0, -16(s0)
	lw	a0, -24(s0)
	lw	a1, 4(a0)
	addi	a1, a1, 1
	sw	a1, 4(a0)
	lbu	a1, -13(s0)
	sb	a1, -17(s0)
	lbu	a0, -17(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end62:
	.size	_ZN4File8readByteEv, .Lfunc_end62-_ZN4File8readByteEv
                                        # -- End function
	.section	.text._ZN17StandardOutStream9send_wordEj,"axG",@progbits,_ZN17StandardOutStream9send_wordEj,comdat
	.weak	_ZN17StandardOutStream9send_wordEj # -- Begin function _ZN17StandardOutStream9send_wordEj
	.p2align	2
	.type	_ZN17StandardOutStream9send_wordEj,@function
_ZN17StandardOutStream9send_wordEj:     # @_ZN17StandardOutStream9send_wordEj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -16(s0)
	lui	a1, 655360
	sw	a0, 4(a1)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end63:
	.size	_ZN17StandardOutStream9send_wordEj, .Lfunc_end63-_ZN17StandardOutStream9send_wordEj
                                        # -- End function
	.type	_ZL8digits32,@object    # @_ZL8digits32
	.section	.rodata,"a",@progbits
	.p2align	2
_ZL8digits32:
	.word	1000000000              # 0x3b9aca00
	.word	100000000               # 0x5f5e100
	.word	10000000                # 0x989680
	.word	1000000                 # 0xf4240
	.word	100000                  # 0x186a0
	.word	10000                   # 0x2710
	.word	1000                    # 0x3e8
	.word	100                     # 0x64
	.word	10                      # 0xa
	.word	1                       # 0x1
	.size	_ZL8digits32, 40

	.type	__asm__freept,@object   # @__asm__freept
	.section	.sbss,"aw",@nobits
	.globl	__asm__freept
	.p2align	2
__asm__freept:
	.word	0                       # 0x0
	.size	__asm__freept, 4

	.type	nbBlocks,@object        # @nbBlocks
	.globl	nbBlocks
	.p2align	2
nbBlocks:
	.word	0                       # 0x0
	.size	nbBlocks, 4

	.type	allocPos,@object        # @allocPos
	.globl	allocPos
	.p2align	2
allocPos:
	.word	0
	.size	allocPos, 4

	.type	allocSize,@object       # @allocSize
	.globl	allocSize
	.p2align	2
allocSize:
	.word	0
	.size	allocSize, 4

	.type	.L__const._Z19load_alphabet_tilesj.name,@object # @__const._Z19load_alphabet_tilesj.name
	.section	.rodata.str4.4,"aMS",@progbits,4
	.p2align	2
.L__const._Z19load_alphabet_tilesj.name:
	.word	63                      # 0x3f
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L__const._Z19load_alphabet_tilesj.name, 24

	.type	.L__const._Z19load_alphabet_tilesj.name_upper,@object # @__const._Z19load_alphabet_tilesj.name_upper
	.p2align	2
.L__const._Z19load_alphabet_tilesj.name_upper:
	.word	117                     # 0x75
	.word	95                      # 0x5f
	.word	63                      # 0x3f
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L__const._Z19load_alphabet_tilesj.name_upper, 32

	.type	.L.str,@object          # @.str
	.p2align	2
.L.str:
	.word	115                     # 0x73
	.word	112                     # 0x70
	.word	97                      # 0x61
	.word	99                      # 0x63
	.word	101                     # 0x65
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str, 40

	.type	.L.str.1,@object        # @.str.1
	.p2align	2
.L.str.1:
	.word	50                      # 0x32
	.word	100                     # 0x64
	.word	111                     # 0x6f
	.word	116                     # 0x74
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str.1, 36

	.type	.L.str.2,@object        # @.str.2
	.p2align	2
.L.str.2:
	.word	40                      # 0x28
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str.2, 24

	.type	.L.str.3,@object        # @.str.3
	.p2align	2
.L.str.3:
	.word	41                      # 0x29
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str.3, 24

	.type	.L.str.4,@object        # @.str.4
	.p2align	2
.L.str.4:
	.word	91                      # 0x5b
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str.4, 24

	.type	.L.str.5,@object        # @.str.5
	.p2align	2
.L.str.5:
	.word	93                      # 0x5d
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str.5, 24

	.type	.L.str.6,@object        # @.str.6
	.p2align	2
.L.str.6:
	.word	95                      # 0x5f
	.word	100                     # 0x64
	.word	111                     # 0x6f
	.word	116                     # 0x74
	.word	95                      # 0x5f
	.word	99                      # 0x63
	.word	111                     # 0x6f
	.word	109                     # 0x6d
	.word	109                     # 0x6d
	.word	97                      # 0x61
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str.6, 60

	.type	.L.str.7,@object        # @.str.7
	.p2align	2
.L.str.7:
	.word	95                      # 0x5f
	.word	100                     # 0x64
	.word	111                     # 0x6f
	.word	116                     # 0x74
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str.7, 36

	.type	.L.str.8,@object        # @.str.8
	.p2align	2
.L.str.8:
	.word	95                      # 0x5f
	.word	112                     # 0x70
	.word	101                     # 0x65
	.word	114                     # 0x72
	.word	99                      # 0x63
	.word	101                     # 0x65
	.word	110                     # 0x6e
	.word	116                     # 0x74
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str.8, 52

	.type	.L.str.9,@object        # @.str.9
	.p2align	2
.L.str.9:
	.word	45                      # 0x2d
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str.9, 24

	.type	.L.str.10,@object       # @.str.10
	.p2align	2
.L.str.10:
	.word	44                      # 0x2c
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str.10, 24

	.type	.L.str.11,@object       # @.str.11
	.p2align	2
.L.str.11:
	.word	33                      # 0x21
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str.11, 24

	.type	.L.str.12,@object       # @.str.12
	.p2align	2
.L.str.12:
	.word	63                      # 0x3f
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str.12, 24

	.type	.L.str.13,@object       # @.str.13
	.p2align	2
.L.str.13:
	.word	115                     # 0x73
	.word	108                     # 0x6c
	.word	97                      # 0x61
	.word	115                     # 0x73
	.word	104                     # 0x68
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str.13, 40

	.type	.L.str.14,@object       # @.str.14
	.p2align	2
.L.str.14:
	.word	98                      # 0x62
	.word	97                      # 0x61
	.word	99                      # 0x63
	.word	107                     # 0x6b
	.word	115                     # 0x73
	.word	108                     # 0x6c
	.word	97                      # 0x61
	.word	115                     # 0x73
	.word	104                     # 0x68
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str.14, 56

	.type	.L__const._Z15load_game_tilesj.name,@object # @__const._Z15load_game_tilesj.name
	.p2align	2
.L__const._Z15load_game_tilesj.name:
	.word	63                      # 0x3f
	.word	63                      # 0x3f
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L__const._Z15load_game_tilesj.name, 28

	.type	.L.str.15,@object       # @.str.15
	.p2align	2
.L.str.15:
	.word	97                      # 0x61
	.word	108                     # 0x6c
	.word	112                     # 0x70
	.word	104                     # 0x68
	.word	97                      # 0x61
	.word	98                      # 0x62
	.word	101                     # 0x65
	.word	116                     # 0x74
	.word	0                       # 0x0
	.size	.L.str.15, 36

	.type	.L.str.16,@object       # @.str.16
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.16:
	.asciz	"\n"
	.size	.L.str.16, 2

	.type	.L.str.17,@object       # @.str.17
.L.str.17:
	.asciz	"-> "
	.size	.L.str.17, 4

	.type	_ZTV4File,@object       # @_ZTV4File
	.section	.rodata._ZTV4File,"aG",@progbits,_ZTV4File,comdat
	.weak	_ZTV4File
	.p2align	2
_ZTV4File:
	.word	0
	.word	_ZTI4File
	.word	_ZN4File8readWordEv
	.word	_ZN4File8readByteEv
	.size	_ZTV4File, 16

	.type	_ZTS4File,@object       # @_ZTS4File
	.section	.rodata._ZTS4File,"aG",@progbits,_ZTS4File,comdat
	.weak	_ZTS4File
_ZTS4File:
	.asciz	"4File"
	.size	_ZTS4File, 6

	.type	_ZTS7IStream,@object    # @_ZTS7IStream
	.section	.rodata._ZTS7IStream,"aG",@progbits,_ZTS7IStream,comdat
	.weak	_ZTS7IStream
_ZTS7IStream:
	.asciz	"7IStream"
	.size	_ZTS7IStream, 9

	.type	_ZTI7IStream,@object    # @_ZTI7IStream
	.section	.rodata._ZTI7IStream,"aG",@progbits,_ZTI7IStream,comdat
	.weak	_ZTI7IStream
	.p2align	2
_ZTI7IStream:
	.word	_ZTVN10__cxxabiv117__class_type_infoE+8
	.word	_ZTS7IStream
	.size	_ZTI7IStream, 8

	.type	_ZTI4File,@object       # @_ZTI4File
	.section	.rodata._ZTI4File,"aG",@progbits,_ZTI4File,comdat
	.weak	_ZTI4File
	.p2align	2
_ZTI4File:
	.word	_ZTVN10__cxxabiv120__si_class_type_infoE+8
	.word	_ZTS4File
	.word	_ZTI7IStream
	.size	_ZTI4File, 12

	.type	_ZTV7IStream,@object    # @_ZTV7IStream
	.section	.rodata._ZTV7IStream,"aG",@progbits,_ZTV7IStream,comdat
	.weak	_ZTV7IStream
	.p2align	2
_ZTV7IStream:
	.word	0
	.word	_ZTI7IStream
	.word	__cxa_pure_virtual
	.word	__cxa_pure_virtual
	.size	_ZTV7IStream, 16

	.type	_ZTV17StandardOutStream,@object # @_ZTV17StandardOutStream
	.section	.rodata._ZTV17StandardOutStream,"aG",@progbits,_ZTV17StandardOutStream,comdat
	.weak	_ZTV17StandardOutStream
	.p2align	2
_ZTV17StandardOutStream:
	.word	0
	.word	_ZTI17StandardOutStream
	.word	_ZN17StandardOutStream9send_wordEj
	.size	_ZTV17StandardOutStream, 12

	.type	_ZL4cout,@object        # @_ZL4cout
	.section	.sdata,"aw",@progbits
	.p2align	2
_ZL4cout:
	.word	_ZTV17StandardOutStream+8
	.size	_ZL4cout, 4

	.type	_ZTS17StandardOutStream,@object # @_ZTS17StandardOutStream
	.section	.rodata._ZTS17StandardOutStream,"aG",@progbits,_ZTS17StandardOutStream,comdat
	.weak	_ZTS17StandardOutStream
_ZTS17StandardOutStream:
	.asciz	"17StandardOutStream"
	.size	_ZTS17StandardOutStream, 20

	.type	_ZTS13TextOutStream,@object # @_ZTS13TextOutStream
	.section	.rodata._ZTS13TextOutStream,"aG",@progbits,_ZTS13TextOutStream,comdat
	.weak	_ZTS13TextOutStream
_ZTS13TextOutStream:
	.asciz	"13TextOutStream"
	.size	_ZTS13TextOutStream, 16

	.type	_ZTS7OStream,@object    # @_ZTS7OStream
	.section	.rodata._ZTS7OStream,"aG",@progbits,_ZTS7OStream,comdat
	.weak	_ZTS7OStream
_ZTS7OStream:
	.asciz	"7OStream"
	.size	_ZTS7OStream, 9

	.type	_ZTI7OStream,@object    # @_ZTI7OStream
	.section	.rodata._ZTI7OStream,"aG",@progbits,_ZTI7OStream,comdat
	.weak	_ZTI7OStream
	.p2align	2
_ZTI7OStream:
	.word	_ZTVN10__cxxabiv117__class_type_infoE+8
	.word	_ZTS7OStream
	.size	_ZTI7OStream, 8

	.type	_ZTI13TextOutStream,@object # @_ZTI13TextOutStream
	.section	.rodata._ZTI13TextOutStream,"aG",@progbits,_ZTI13TextOutStream,comdat
	.weak	_ZTI13TextOutStream
	.p2align	2
_ZTI13TextOutStream:
	.word	_ZTVN10__cxxabiv120__si_class_type_infoE+8
	.word	_ZTS13TextOutStream
	.word	_ZTI7OStream
	.size	_ZTI13TextOutStream, 12

	.type	_ZTI17StandardOutStream,@object # @_ZTI17StandardOutStream
	.section	.rodata._ZTI17StandardOutStream,"aG",@progbits,_ZTI17StandardOutStream,comdat
	.weak	_ZTI17StandardOutStream
	.p2align	2
_ZTI17StandardOutStream:
	.word	_ZTVN10__cxxabiv120__si_class_type_infoE+8
	.word	_ZTS17StandardOutStream
	.word	_ZTI13TextOutStream
	.size	_ZTI17StandardOutStream, 12

	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z8uint2strjPDijDs
	.addrsig_sym _Z6malloci
	.addrsig_sym exit
	.addrsig_sym _Z4freePv
	.addrsig_sym _Znaj
	.addrsig_sym _ZdlPv
	.addrsig_sym _Z14initMemManagerv
	.addrsig_sym _ZlsR13TextOutStreamPKc
	.addrsig_sym _ZlsR13TextOutStreamj
	.addrsig_sym _ZN13TextOutStream11send_digitsEjj
	.addrsig_sym _ZN13TextOutStream11send_digitsEij
	.addrsig_sym _ZNK6vectorIjE5beginEv
	.addrsig_sym _ZNK6vectorIjE3endEv
	.addrsig_sym _ZNK6vectorIjE4sizeEv
	.addrsig_sym _ZNK6vectorIjE3getEj
	.addrsig_sym _ZN6vectorIjEixEi
	.addrsig_sym _Z6hdd_cdjPKDi
	.addrsig_sym _Z6strlenPKDi
	.addrsig_sym _Z10read_drivej
	.addrsig_sym _ZrsR4FileRj
	.addrsig_sym _ZN6vectorIjE7reserveEj
	.addrsig_sym _ZN4File4sizeEv
	.addrsig_sym _ZN4File3eofEv
	.addrsig_sym _ZN6vectorIjE9push_backERKj
	.addrsig_sym _Z12setScreenPosjj
	.addrsig_sym _Z16send_screen_wordjjjj
	.addrsig_sym _Z19startSendingTexturej
	.addrsig_sym _Z11sendTextureR4Filej
	.addrsig_sym _Z9load_tilejjPKDi
	.addrsig_sym _Z19load_alphabet_tilesj
	.addrsig_sym _Z8comparerjj
	.addrsig_sym _ZN6vectorIjE6resizeEjj
	.addrsig_sym _ZL8digits32
	.addrsig_sym __asm__freept
	.addrsig_sym nbBlocks
	.addrsig_sym allocPos
	.addrsig_sym allocSize
	.addrsig_sym _ZTVN10__cxxabiv120__si_class_type_infoE
	.addrsig_sym _ZTS4File
	.addrsig_sym _ZTVN10__cxxabiv117__class_type_infoE
	.addrsig_sym _ZTS7IStream
	.addrsig_sym _ZTI7IStream
	.addrsig_sym _ZTI4File
	.addrsig_sym _ZL4cout
	.addrsig_sym _ZTS17StandardOutStream
	.addrsig_sym _ZTS13TextOutStream
	.addrsig_sym _ZTS7OStream
	.addrsig_sym _ZTI7OStream
	.addrsig_sym _ZTI13TextOutStream
	.addrsig_sym _ZTI17StandardOutStream
