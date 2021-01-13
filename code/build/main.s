	.text
	.file	"main.cpp"
	.globl	_Z6memcpyPcPKcj         # -- Begin function _Z6memcpyPcPKcj
	.p2align	2
	.type	_Z6memcpyPcPKcj,@function
_Z6memcpyPcPKcj:                        # @_Z6memcpyPcPKcj
# %bb.0:
	beqz	a2, .LBB0_2
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	lb	a3, 0(a1)
	addi	a2, a2, -1
	sb	a3, 0(a0)
	addi	a0, a0, 1
	addi	a1, a1, 1
	bnez	a2, .LBB0_1
.LBB0_2:
	ret
.Lfunc_end0:
	.size	_Z6memcpyPcPKcj, .Lfunc_end0-_Z6memcpyPcPKcj
                                        # -- End function
	.globl	memcpy                  # -- Begin function memcpy
	.p2align	2
	.type	memcpy,@function
memcpy:                                 # @memcpy
# %bb.0:
	addi	a3, zero, 4
	bltu	a2, a3, .LBB1_4
# %bb.1:
	addi	a3, zero, 3
	mv	a4, a2
.LBB1_2:                                # =>This Inner Loop Header: Depth=1
	lw	a5, 0(a1)
	addi	a4, a4, -4
	sw	a5, 0(a0)
	addi	a0, a0, 4
	addi	a1, a1, 4
	bltu	a3, a4, .LBB1_2
# %bb.3:
	andi	a2, a2, 3
.LBB1_4:
	beqz	a2, .LBB1_6
.LBB1_5:                                # =>This Inner Loop Header: Depth=1
	lb	a3, 0(a1)
	addi	a2, a2, -1
	sb	a3, 0(a0)
	addi	a0, a0, 1
	addi	a1, a1, 1
	bnez	a2, .LBB1_5
.LBB1_6:
	ret
.Lfunc_end1:
	.size	memcpy, .Lfunc_end1-memcpy
                                        # -- End function
	.globl	memset                  # -- Begin function memset
	.p2align	2
	.type	memset,@function
memset:                                 # @memset
# %bb.0:
	beqz	a2, .LBB2_2
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	addi	a2, a2, -1
	sb	a1, 0(a0)
	addi	a0, a0, 1
	addi	a1, a1, 1
	bnez	a2, .LBB2_1
.LBB2_2:
	ret
.Lfunc_end2:
	.size	memset, .Lfunc_end2-memset
                                        # -- End function
	.globl	__mulsi3                # -- Begin function __mulsi3
	.p2align	2
	.type	__mulsi3,@function
__mulsi3:                               # @__mulsi3
# %bb.0:
	mv	a2, zero
	beqz	a1, .LBB3_2
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	andi	a3, a1, 1
	neg	a3, a3
	and	a3, a3, a0
	add	a2, a3, a2
	srli	a1, a1, 1
	slli	a0, a0, 1
	bnez	a1, .LBB3_1
.LBB3_2:
	mv	a0, a2
	ret
.Lfunc_end3:
	.size	__mulsi3, .Lfunc_end3-__mulsi3
                                        # -- End function
	.globl	__muldi3                # -- Begin function __muldi3
	.p2align	2
	.type	__muldi3,@function
__muldi3:                               # @__muldi3
# %bb.0:
	mv	a2, zero
	beqz	a1, .LBB4_2
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	andi	a3, a1, 1
	neg	a3, a3
	and	a3, a3, a0
	add	a2, a3, a2
	srai	a1, a1, 1
	slli	a0, a0, 1
	bnez	a1, .LBB4_1
.LBB4_2:
	mv	a0, a2
	ret
.Lfunc_end4:
	.size	__muldi3, .Lfunc_end4-__muldi3
                                        # -- End function
	.globl	__udivsi3               # -- Begin function __udivsi3
	.p2align	2
	.type	__udivsi3,@function
__udivsi3:                              # @__udivsi3
# %bb.0:
	srli	a2, a0, 1
	addi	a3, zero, 1
	bltu	a2, a1, .LBB5_4
# %bb.1:
	addi	a3, zero, 1
.LBB5_2:                                # =>This Inner Loop Header: Depth=1
	slli	a1, a1, 1
	addi	a3, a3, 1
	bgeu	a2, a1, .LBB5_2
# %bb.3:
	beqz	a3, .LBB5_9
.LBB5_4:
	mv	a2, zero
	j	.LBB5_6
.LBB5_5:                                #   in Loop: Header=BB5_6 Depth=1
	sub	a0, a0, a5
	or	a2, a2, a4
	srli	a1, a1, 1
	beqz	a3, .LBB5_8
.LBB5_6:                                # =>This Inner Loop Header: Depth=1
	mv	a5, zero
	addi	a3, a3, -1
	slli	a2, a2, 1
	sltu	a4, a0, a1
	xori	a4, a4, 1
	bltu	a0, a1, .LBB5_5
# %bb.7:                                #   in Loop: Header=BB5_6 Depth=1
	mv	a5, a1
	j	.LBB5_5
.LBB5_8:
	mv	a0, a2
	ret
.LBB5_9:
	mv	a0, zero
	ret
.Lfunc_end5:
	.size	__udivsi3, .Lfunc_end5-__udivsi3
                                        # -- End function
	.globl	__divsi3                # -- Begin function __divsi3
	.p2align	2
	.type	__divsi3,@function
__divsi3:                               # @__divsi3
# %bb.0:
	srai	a2, a0, 31
	add	a3, a0, a2
	xor	a3, a3, a2
	srai	a2, a1, 31
	add	a4, a1, a2
	xor	a4, a4, a2
	srli	a2, a3, 1
	addi	a5, zero, 1
	blt	a2, a4, .LBB6_3
# %bb.1:
	addi	a5, zero, 1
.LBB6_2:                                # =>This Inner Loop Header: Depth=1
	slli	a4, a4, 1
	addi	a5, a5, 1
	bge	a2, a4, .LBB6_2
.LBB6_3:
	mv	a2, zero
	xor	a6, a1, a0
	j	.LBB6_5
.LBB6_4:                                #   in Loop: Header=BB6_5 Depth=1
	sub	a3, a3, a0
	or	a2, a1, a2
	srai	a4, a4, 1
	beqz	a5, .LBB6_7
.LBB6_5:                                # =>This Inner Loop Header: Depth=1
	mv	a0, zero
	addi	a5, a5, -1
	slli	a1, a2, 1
	slt	a2, a3, a4
	xori	a2, a2, 1
	blt	a3, a4, .LBB6_4
# %bb.6:                                #   in Loop: Header=BB6_5 Depth=1
	mv	a0, a4
	j	.LBB6_4
.LBB6_7:
	bgez	a6, .LBB6_9
# %bb.8:
	neg	a2, a2
.LBB6_9:
	mv	a0, a2
	ret
.Lfunc_end6:
	.size	__divsi3, .Lfunc_end6-__divsi3
                                        # -- End function
	.globl	__umodsi3               # -- Begin function __umodsi3
	.p2align	2
	.type	__umodsi3,@function
__umodsi3:                              # @__umodsi3
# %bb.0:
	srli	a3, a0, 1
	addi	a2, zero, 1
	bltu	a3, a1, .LBB7_6
# %bb.1:
	addi	a2, zero, 1
.LBB7_2:                                # =>This Inner Loop Header: Depth=1
	slli	a1, a1, 1
	addi	a2, a2, 1
	bgeu	a3, a1, .LBB7_2
# %bb.3:
	bnez	a2, .LBB7_6
.LBB7_4:
	ret
.LBB7_5:                                #   in Loop: Header=BB7_6 Depth=1
	sub	a0, a0, a3
	srli	a1, a1, 1
	beqz	a2, .LBB7_4
.LBB7_6:                                # =>This Inner Loop Header: Depth=1
	mv	a3, zero
	addi	a2, a2, -1
	bltu	a0, a1, .LBB7_5
# %bb.7:                                #   in Loop: Header=BB7_6 Depth=1
	mv	a3, a1
	j	.LBB7_5
.Lfunc_end7:
	.size	__umodsi3, .Lfunc_end7-__umodsi3
                                        # -- End function
	.globl	_Z8uint2strjPDijDs      # -- Begin function _Z8uint2strjPDijDs
	.p2align	2
	.type	_Z8uint2strjPDijDs,@function
_Z8uint2strjPDijDs:                     # @_Z8uint2strjPDijDs
# %bb.0:
	addi	a6, zero, 10
	sub	a2, a6, a2
	addi	a4, zero, 9
	bltu	a4, a2, .LBB8_10
# %bb.1:
	mv	t0, zero
	lui	a4, %hi(_ZL8digits32)
	addi	a7, a4, %lo(_ZL8digits32)
	j	.LBB8_4
.LBB8_2:                                #   in Loop: Header=BB8_4 Depth=1
	mv	a4, a3
.LBB8_3:                                #   in Loop: Header=BB8_4 Depth=1
	sw	a4, 0(a1)
	addi	a2, a2, 1
	addi	a1, a1, 4
	beq	a2, a6, .LBB8_10
.LBB8_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_7 Depth 2
	slli	a4, a2, 2
	add	a4, a4, a7
	lw	a5, 0(a4)
	bgeu	a0, a5, .LBB8_6
# %bb.5:                                #   in Loop: Header=BB8_4 Depth=1
	mv	a4, zero
	j	.LBB8_8
.LBB8_6:                                #   in Loop: Header=BB8_4 Depth=1
	mv	a4, zero
.LBB8_7:                                #   Parent Loop BB8_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sub	a0, a0, a5
	addi	a4, a4, 1
	bgeu	a0, a5, .LBB8_7
.LBB8_8:                                #   in Loop: Header=BB8_4 Depth=1
	snez	a5, a4
	or	t0, t0, a5
	andi	a5, t0, 1
	beqz	a5, .LBB8_2
# %bb.9:                                #   in Loop: Header=BB8_4 Depth=1
	addi	a4, a4, 48
	j	.LBB8_3
.LBB8_10:
	ret
.Lfunc_end8:
	.size	_Z8uint2strjPDijDs, .Lfunc_end8-_Z8uint2strjPDijDs
                                        # -- End function
	.globl	_Z6malloci              # -- Begin function _Z6malloci
	.p2align	2
	.type	_Z6malloci,@function
_Z6malloci:                             # @_Z6malloci
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	beqz	a0, .LBB9_7
# %bb.1:
	mv	s0, a0
	lui	s1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(s1)
	beqz	a1, .LBB9_8
# %bb.2:
	lui	a0, %hi(allocSize)
	lw	a2, %lo(allocSize)(a0)
	mv	a0, zero
	mv	a3, zero
.LBB9_3:                                # =>This Inner Loop Header: Depth=1
	add	a4, a2, a0
	lw	a5, 0(a4)
	bge	a5, s0, .LBB9_10
# %bb.4:                                #   in Loop: Header=BB9_3 Depth=1
	addi	a3, a3, 1
	addi	a0, a0, 4
	bltu	a3, a1, .LBB9_3
# %bb.5:
	addi	a0, zero, 100
	bne	a1, a0, .LBB9_9
# %bb.6:
	addi	a0, zero, 29
	call	exit
	lui	a0, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(a0)
	j	.LBB9_9
.LBB9_7:
	mv	a0, zero
	j	.LBB9_11
.LBB9_8:
	mv	a1, zero
.LBB9_9:
	lui	a2, %hi(__asm__freept)
	lui	a0, %hi(allocPos)
	lw	a3, %lo(allocPos)(a0)
	lw	a0, %lo(__asm__freept)(a2)
	slli	a1, a1, 2
	add	a3, a3, a1
	sw	a0, 0(a3)
	lui	a3, %hi(allocSize)
	lw	a3, %lo(allocSize)(a3)
	neg	a4, s0
	add	a1, a3, a1
	sw	a4, 0(a1)
	lw	a1, %lo(nbBlocks)(s1)
	lw	a3, %lo(__asm__freept)(a2)
	addi	a1, a1, 1
	sw	a1, %lo(nbBlocks)(s1)
	add	a1, a3, s0
	sw	a1, %lo(__asm__freept)(a2)
	j	.LBB9_11
.LBB9_10:
	neg	a1, a5
	sw	a1, 0(a4)
	lui	a1, %hi(allocPos)
	lw	a1, %lo(allocPos)(a1)
	add	a0, a1, a0
	lw	a0, 0(a0)
.LBB9_11:
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end9:
	.size	_Z6malloci, .Lfunc_end9-_Z6malloci
                                        # -- End function
	.globl	_Z4freePv               # -- Begin function _Z4freePv
	.p2align	2
	.type	_Z4freePv,@function
_Z4freePv:                              # @_Z4freePv
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	beqz	a0, .LBB10_7
# %bb.1:
	lui	a1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(a1)
	beqz	a1, .LBB10_5
# %bb.2:
	lui	a2, %hi(allocPos)
	lw	a3, %lo(allocPos)(a2)
	mv	a2, zero
	mv	a4, zero
.LBB10_3:                               # =>This Inner Loop Header: Depth=1
	add	a5, a3, a2
	lw	a5, 0(a5)
	beq	a5, a0, .LBB10_6
# %bb.4:                                #   in Loop: Header=BB10_3 Depth=1
	addi	a4, a4, 1
	addi	a2, a2, 4
	bltu	a4, a1, .LBB10_3
.LBB10_5:
	addi	a0, zero, 40
	call	exit
	j	.LBB10_7
.LBB10_6:
	lui	a0, %hi(allocSize)
	lw	a0, %lo(allocSize)(a0)
	add	a0, a0, a2
	lw	a1, 0(a0)
	neg	a1, a1
	sw	a1, 0(a0)
.LBB10_7:
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end10:
	.size	_Z4freePv, .Lfunc_end10-_Z4freePv
                                        # -- End function
	.globl	_Znwj                   # -- Begin function _Znwj
	.p2align	2
	.type	_Znwj,@function
_Znwj:                                  # @_Znwj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	beqz	a0, .LBB11_7
# %bb.1:
	mv	s0, a0
	lui	s1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(s1)
	beqz	a1, .LBB11_8
# %bb.2:
	lui	a0, %hi(allocSize)
	lw	a2, %lo(allocSize)(a0)
	mv	a0, zero
	mv	a3, a1
.LBB11_3:                               # =>This Inner Loop Header: Depth=1
	add	a4, a2, a0
	lw	a5, 0(a4)
	bge	a5, s0, .LBB11_10
# %bb.4:                                #   in Loop: Header=BB11_3 Depth=1
	addi	a3, a3, -1
	addi	a0, a0, 4
	bnez	a3, .LBB11_3
# %bb.5:
	addi	a0, zero, 100
	bne	a1, a0, .LBB11_9
# %bb.6:
	addi	a0, zero, 29
	call	exit
	lui	a0, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(a0)
	j	.LBB11_9
.LBB11_7:
	mv	a0, zero
	j	.LBB11_11
.LBB11_8:
	mv	a1, zero
.LBB11_9:
	lui	a2, %hi(__asm__freept)
	lui	a0, %hi(allocPos)
	lw	a3, %lo(allocPos)(a0)
	lw	a0, %lo(__asm__freept)(a2)
	slli	a1, a1, 2
	add	a3, a3, a1
	sw	a0, 0(a3)
	lui	a3, %hi(allocSize)
	lw	a3, %lo(allocSize)(a3)
	neg	a4, s0
	add	a1, a3, a1
	sw	a4, 0(a1)
	lw	a1, %lo(nbBlocks)(s1)
	lw	a3, %lo(__asm__freept)(a2)
	addi	a1, a1, 1
	sw	a1, %lo(nbBlocks)(s1)
	add	a1, a3, s0
	sw	a1, %lo(__asm__freept)(a2)
	j	.LBB11_11
.LBB11_10:
	neg	a1, a5
	sw	a1, 0(a4)
	lui	a1, %hi(allocPos)
	lw	a1, %lo(allocPos)(a1)
	add	a0, a1, a0
	lw	a0, 0(a0)
.LBB11_11:
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end11:
	.size	_Znwj, .Lfunc_end11-_Znwj
                                        # -- End function
	.globl	_Znaj                   # -- Begin function _Znaj
	.p2align	2
	.type	_Znaj,@function
_Znaj:                                  # @_Znaj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	beqz	a0, .LBB12_7
# %bb.1:
	mv	s0, a0
	lui	s1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(s1)
	beqz	a1, .LBB12_8
# %bb.2:
	lui	a0, %hi(allocSize)
	lw	a2, %lo(allocSize)(a0)
	mv	a0, zero
	mv	a3, a1
.LBB12_3:                               # =>This Inner Loop Header: Depth=1
	add	a4, a2, a0
	lw	a5, 0(a4)
	bge	a5, s0, .LBB12_10
# %bb.4:                                #   in Loop: Header=BB12_3 Depth=1
	addi	a3, a3, -1
	addi	a0, a0, 4
	bnez	a3, .LBB12_3
# %bb.5:
	addi	a0, zero, 100
	bne	a1, a0, .LBB12_9
# %bb.6:
	addi	a0, zero, 29
	call	exit
	lui	a0, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(a0)
	j	.LBB12_9
.LBB12_7:
	mv	a0, zero
	j	.LBB12_11
.LBB12_8:
	mv	a1, zero
.LBB12_9:
	lui	a2, %hi(__asm__freept)
	lui	a0, %hi(allocPos)
	lw	a3, %lo(allocPos)(a0)
	lw	a0, %lo(__asm__freept)(a2)
	slli	a1, a1, 2
	add	a3, a3, a1
	sw	a0, 0(a3)
	lui	a3, %hi(allocSize)
	lw	a3, %lo(allocSize)(a3)
	neg	a4, s0
	add	a1, a3, a1
	sw	a4, 0(a1)
	lw	a1, %lo(nbBlocks)(s1)
	lw	a3, %lo(__asm__freept)(a2)
	addi	a1, a1, 1
	sw	a1, %lo(nbBlocks)(s1)
	add	a1, a3, s0
	sw	a1, %lo(__asm__freept)(a2)
	j	.LBB12_11
.LBB12_10:
	neg	a1, a5
	sw	a1, 0(a4)
	lui	a1, %hi(allocPos)
	lw	a1, %lo(allocPos)(a1)
	add	a0, a1, a0
	lw	a0, 0(a0)
.LBB12_11:
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end12:
	.size	_Znaj, .Lfunc_end12-_Znaj
                                        # -- End function
	.globl	_ZdaPv                  # -- Begin function _ZdaPv
	.p2align	2
	.type	_ZdaPv,@function
_ZdaPv:                                 # @_ZdaPv
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	beqz	a0, .LBB13_7
# %bb.1:
	lui	a1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(a1)
	beqz	a1, .LBB13_5
# %bb.2:
	lui	a2, %hi(allocPos)
	lw	a2, %lo(allocPos)(a2)
	mv	a3, zero
.LBB13_3:                               # =>This Inner Loop Header: Depth=1
	add	a4, a2, a3
	lw	a4, 0(a4)
	beq	a4, a0, .LBB13_6
# %bb.4:                                #   in Loop: Header=BB13_3 Depth=1
	addi	a1, a1, -1
	addi	a3, a3, 4
	bnez	a1, .LBB13_3
.LBB13_5:
	addi	a0, zero, 40
	call	exit
	j	.LBB13_7
.LBB13_6:
	lui	a0, %hi(allocSize)
	lw	a0, %lo(allocSize)(a0)
	add	a0, a0, a3
	lw	a1, 0(a0)
	neg	a1, a1
	sw	a1, 0(a0)
.LBB13_7:
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end13:
	.size	_ZdaPv, .Lfunc_end13-_ZdaPv
                                        # -- End function
	.globl	_ZdlPv                  # -- Begin function _ZdlPv
	.p2align	2
	.type	_ZdlPv,@function
_ZdlPv:                                 # @_ZdlPv
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	beqz	a0, .LBB14_7
# %bb.1:
	lui	a1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(a1)
	beqz	a1, .LBB14_5
# %bb.2:
	lui	a2, %hi(allocPos)
	lw	a2, %lo(allocPos)(a2)
	mv	a3, zero
.LBB14_3:                               # =>This Inner Loop Header: Depth=1
	add	a4, a2, a3
	lw	a4, 0(a4)
	beq	a4, a0, .LBB14_6
# %bb.4:                                #   in Loop: Header=BB14_3 Depth=1
	addi	a1, a1, -1
	addi	a3, a3, 4
	bnez	a1, .LBB14_3
.LBB14_5:
	addi	a0, zero, 40
	call	exit
	j	.LBB14_7
.LBB14_6:
	lui	a0, %hi(allocSize)
	lw	a0, %lo(allocSize)(a0)
	add	a0, a0, a3
	lw	a1, 0(a0)
	neg	a1, a1
	sw	a1, 0(a0)
.LBB14_7:
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end14:
	.size	_ZdlPv, .Lfunc_end14-_ZdlPv
                                        # -- End function
	.globl	_Z14initMemManagerv     # -- Begin function _Z14initMemManagerv
	.p2align	2
	.type	_Z14initMemManagerv,@function
_Z14initMemManagerv:                    # @_Z14initMemManagerv
# %bb.0:
	lui	a0, %hi(__asm__freept)
	lw	a1, %lo(__asm__freept)(a0)
	lui	a2, %hi(allocPos)
	sw	a1, %lo(allocPos)(a2)
	lui	a2, 1
	addi	a2, a2, -896
	add	a2, a1, a2
	lui	a3, %hi(allocSize)
	sw	a2, %lo(allocSize)(a3)
	lui	a2, 2
	addi	a2, a2, -1792
	add	a1, a1, a2
	sw	a1, %lo(__asm__freept)(a0)
	ret
.Lfunc_end15:
	.size	_Z14initMemManagerv, .Lfunc_end15-_Z14initMemManagerv
                                        # -- End function
	.globl	_ZlsR13TextOutStreamc   # -- Begin function _ZlsR13TextOutStreamc
	.p2align	2
	.type	_ZlsR13TextOutStreamc,@function
_ZlsR13TextOutStreamc:                  # @_ZlsR13TextOutStreamc
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	mv	s0, a0
	lw	a0, 0(a0)
	lw	a2, 0(a0)
	mv	a0, s0
	jalr	a2
	mv	a0, s0
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end16:
	.size	_ZlsR13TextOutStreamc, .Lfunc_end16-_ZlsR13TextOutStreamc
                                        # -- End function
	.globl	_ZlsR13TextOutStreamPKDi # -- Begin function _ZlsR13TextOutStreamPKDi
	.p2align	2
	.type	_ZlsR13TextOutStreamPKDi,@function
_ZlsR13TextOutStreamPKDi:               # @_ZlsR13TextOutStreamPKDi
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	mv	a2, a1
	lw	a1, 0(a1)
	mv	s0, a0
	beqz	a1, .LBB17_3
# %bb.1:
	addi	s1, a2, 4
.LBB17_2:                               # =>This Inner Loop Header: Depth=1
	lw	a0, 0(s0)
	lw	a2, 0(a0)
	mv	a0, s0
	jalr	a2
	lw	a1, 0(s1)
	addi	s1, s1, 4
	bnez	a1, .LBB17_2
.LBB17_3:
	mv	a0, s0
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end17:
	.size	_ZlsR13TextOutStreamPKDi, .Lfunc_end17-_ZlsR13TextOutStreamPKDi
                                        # -- End function
	.globl	_ZlsR13TextOutStreamPKc # -- Begin function _ZlsR13TextOutStreamPKc
	.p2align	2
	.type	_ZlsR13TextOutStreamPKc,@function
_ZlsR13TextOutStreamPKc:                # @_ZlsR13TextOutStreamPKc
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	lbu	a2, 0(a1)
	mv	s0, a0
	beqz	a2, .LBB18_3
# %bb.1:
	addi	s1, a1, 1
.LBB18_2:                               # =>This Inner Loop Header: Depth=1
	lw	a0, 0(s0)
	lw	a3, 0(a0)
	andi	a1, a2, 255
	mv	a0, s0
	jalr	a3
	lbu	a2, 0(s1)
	addi	s1, s1, 1
	bnez	a2, .LBB18_2
.LBB18_3:
	mv	a0, s0
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end18:
	.size	_ZlsR13TextOutStreamPKc, .Lfunc_end18-_ZlsR13TextOutStreamPKc
                                        # -- End function
	.globl	_ZlsR13TextOutStreamj   # -- Begin function _ZlsR13TextOutStreamj
	.p2align	2
	.type	_ZlsR13TextOutStreamj,@function
_ZlsR13TextOutStreamj:                  # @_ZlsR13TextOutStreamj
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	sw	s4, 8(sp)
	mv	s2, a0
	beqz	a1, .LBB19_8
# %bb.1:
	mv	s1, a1
	mv	s0, zero
	mv	a0, zero
	lui	a1, %hi(_ZL8digits32)
	addi	s3, a1, %lo(_ZL8digits32)
	addi	s4, zero, 10
	j	.LBB19_4
.LBB19_2:                               #   in Loop: Header=BB19_4 Depth=1
	lw	a0, 0(s2)
	lw	a2, 0(a0)
	addi	a1, a1, 48
	mv	a0, s2
	jalr	a2
	addi	a0, zero, 1
.LBB19_3:                               #   in Loop: Header=BB19_4 Depth=1
	addi	s0, s0, 1
	beq	s0, s4, .LBB19_9
.LBB19_4:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB19_7 Depth 2
	slli	a1, s0, 2
	add	a1, a1, s3
	lw	a2, 0(a1)
	bgeu	s1, a2, .LBB19_6
# %bb.5:                                #   in Loop: Header=BB19_4 Depth=1
	andi	a2, a0, 1
	mv	a1, zero
	mv	a0, zero
	bnez	a2, .LBB19_2
	j	.LBB19_3
.LBB19_6:                               #   in Loop: Header=BB19_4 Depth=1
	mv	a1, zero
.LBB19_7:                               #   Parent Loop BB19_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sub	s1, s1, a2
	addi	a1, a1, 1
	bgeu	s1, a2, .LBB19_7
	j	.LBB19_2
.LBB19_8:
	lw	a0, 0(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 48
	mv	a0, s2
	jalr	a2
.LBB19_9:
	mv	a0, s2
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end19:
	.size	_ZlsR13TextOutStreamj, .Lfunc_end19-_ZlsR13TextOutStreamj
                                        # -- End function
	.globl	_ZlsR13TextOutStreami   # -- Begin function _ZlsR13TextOutStreami
	.p2align	2
	.type	_ZlsR13TextOutStreami,@function
_ZlsR13TextOutStreami:                  # @_ZlsR13TextOutStreami
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	sw	s4, 8(sp)
	addi	a2, zero, -1
	mv	s1, a1
	mv	s2, a0
	bge	a2, a1, .LBB20_4
# %bb.1:
	bnez	s1, .LBB20_5
# %bb.2:
	lw	a0, 0(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 48
	mv	a0, s2
	jalr	a2
.LBB20_3:
	mv	a0, s2
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.LBB20_4:
	lw	a0, 0(s2)
	lw	a2, 0(a0)
	neg	s1, s1
	addi	a1, zero, 45
	mv	a0, s2
	jalr	a2
.LBB20_5:
	mv	s0, zero
	mv	a0, zero
	lui	a1, %hi(_ZL8digits32)
	addi	s3, a1, %lo(_ZL8digits32)
	addi	s4, zero, 10
	j	.LBB20_8
.LBB20_6:                               #   in Loop: Header=BB20_8 Depth=1
	lw	a0, 0(s2)
	lw	a2, 0(a0)
	addi	a1, a1, 48
	mv	a0, s2
	jalr	a2
	addi	a0, zero, 1
.LBB20_7:                               #   in Loop: Header=BB20_8 Depth=1
	addi	s0, s0, 1
	beq	s0, s4, .LBB20_3
.LBB20_8:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB20_11 Depth 2
	slli	a1, s0, 2
	add	a1, a1, s3
	lw	a2, 0(a1)
	bgeu	s1, a2, .LBB20_10
# %bb.9:                                #   in Loop: Header=BB20_8 Depth=1
	andi	a2, a0, 1
	mv	a1, zero
	mv	a0, zero
	bnez	a2, .LBB20_6
	j	.LBB20_7
.LBB20_10:                              #   in Loop: Header=BB20_8 Depth=1
	mv	a1, zero
.LBB20_11:                              #   Parent Loop BB20_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sub	s1, s1, a2
	addi	a1, a1, 1
	bgeu	s1, a2, .LBB20_11
	j	.LBB20_6
.Lfunc_end20:
	.size	_ZlsR13TextOutStreami, .Lfunc_end20-_ZlsR13TextOutStreami
                                        # -- End function
	.globl	_ZlsR13TextOutStreamDi  # -- Begin function _ZlsR13TextOutStreamDi
	.p2align	2
	.type	_ZlsR13TextOutStreamDi,@function
_ZlsR13TextOutStreamDi:                 # @_ZlsR13TextOutStreamDi
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	mv	s0, a0
	lw	a0, 0(a0)
	lw	a2, 0(a0)
	mv	a0, s0
	jalr	a2
	mv	a0, s0
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end21:
	.size	_ZlsR13TextOutStreamDi, .Lfunc_end21-_ZlsR13TextOutStreamDi
                                        # -- End function
	.globl	_ZlsR13TextOutStreamRK6string # -- Begin function _ZlsR13TextOutStreamRK6string
	.p2align	2
	.type	_ZlsR13TextOutStreamRK6string,@function
_ZlsR13TextOutStreamRK6string:          # @_ZlsR13TextOutStreamRK6string
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	sw	s2, 0(sp)
	lw	a2, 0(a1)
	mv	s2, a0
	beqz	a2, .LBB22_3
# %bb.1:
	lw	s1, 8(a1)
	slli	s0, a2, 2
.LBB22_2:                               # =>This Inner Loop Header: Depth=1
	lw	a0, 0(s2)
	lw	a1, 0(s1)
	lw	a2, 0(a0)
	mv	a0, s2
	jalr	a2
	addi	s0, s0, -4
	addi	s1, s1, 4
	bnez	s0, .LBB22_2
.LBB22_3:
	mv	a0, s2
	lw	s2, 0(sp)
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end22:
	.size	_ZlsR13TextOutStreamRK6string, .Lfunc_end22-_ZlsR13TextOutStreamRK6string
                                        # -- End function
	.globl	_ZplRK6stringS1_        # -- Begin function _ZplRK6stringS1_
	.p2align	2
	.type	_ZplRK6stringS1_,@function
_ZplRK6stringS1_:                       # @_ZplRK6stringS1_
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	sw	s4, 8(sp)
	mv	s2, a2
	mv	s0, a1
	lw	s4, 0(a1)
	lw	s1, 0(a2)
	mv	s3, a0
	add	a1, s1, s4
	mv	a2, zero
	call	_ZN6vectorIDiEC2EjDi
	beqz	s4, .LBB23_3
# %bb.1:
	lw	a0, 8(s0)
	lw	a1, 8(s3)
	mv	a2, s4
.LBB23_2:                               # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a0)
	sw	a3, 0(a1)
	addi	a2, a2, -1
	addi	a1, a1, 4
	addi	a0, a0, 4
	bnez	a2, .LBB23_2
.LBB23_3:
	beqz	s1, .LBB23_6
# %bb.4:
	lw	a1, 8(s3)
	lw	a0, 8(s2)
	slli	a2, s4, 2
	add	a1, a1, a2
.LBB23_5:                               # =>This Inner Loop Header: Depth=1
	lw	a2, 0(a0)
	sw	a2, 0(a1)
	addi	s1, s1, -1
	addi	a0, a0, 4
	addi	a1, a1, 4
	bnez	s1, .LBB23_5
.LBB23_6:
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end23:
	.size	_ZplRK6stringS1_, .Lfunc_end23-_ZplRK6stringS1_
                                        # -- End function
	.globl	_Z9to_stringjR6string   # -- Begin function _Z9to_stringjR6string
	.p2align	2
	.type	_Z9to_stringjR6string,@function
_Z9to_stringjR6string:                  # @_Z9to_stringjR6string
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	sw	s4, 8(sp)
	sw	s5, 4(sp)
	mv	s2, a1
	mv	s1, a0
	addi	a1, zero, 11
	mv	a0, s2
	call	_ZN6vectorIDiE7reserveEj
	mv	a0, zero
	mv	s0, zero
	mv	a1, zero
	sw	zero, 0(s2)
	lui	a2, %hi(_ZL8digits32)
	addi	s3, a2, %lo(_ZL8digits32)
	addi	s4, zero, 10
	j	.LBB24_3
.LBB24_1:                               #   in Loop: Header=BB24_3 Depth=1
	lw	a1, 8(s2)
	slli	a0, a0, 2
	add	a0, a1, a0
	sw	s5, 0(a0)
	sw	a2, 0(s2)
	addi	a1, zero, 1
	mv	a0, a2
.LBB24_2:                               #   in Loop: Header=BB24_3 Depth=1
	addi	s0, s0, 1
	beq	s0, s4, .LBB24_9
.LBB24_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB24_6 Depth 2
	slli	a2, s0, 2
	add	a2, a2, s3
	lw	a2, 0(a2)
	bgeu	s1, a2, .LBB24_5
# %bb.4:                                #   in Loop: Header=BB24_3 Depth=1
	andi	a2, a1, 1
	mv	a1, zero
	beqz	a2, .LBB24_2
	j	.LBB24_7
.LBB24_5:                               #   in Loop: Header=BB24_3 Depth=1
	mv	a1, zero
.LBB24_6:                               #   Parent Loop BB24_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sub	s1, s1, a2
	addi	a1, a1, 1
	bgeu	s1, a2, .LBB24_6
.LBB24_7:                               #   in Loop: Header=BB24_3 Depth=1
	lw	a3, 4(s2)
	addi	a2, a0, 1
	addi	s5, a1, 48
	bltu	a2, a3, .LBB24_1
# %bb.8:                                #   in Loop: Header=BB24_3 Depth=1
	slli	a1, a3, 1
	mv	a0, s2
	call	_ZN6vectorIDiE7reserveEj
	lw	a0, 0(s2)
	addi	a2, a0, 1
	j	.LBB24_1
.LBB24_9:
	lw	s5, 4(sp)
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end24:
	.size	_Z9to_stringjR6string, .Lfunc_end24-_Z9to_stringjR6string
                                        # -- End function
	.section	.text._ZN6vectorIDiE7reserveEj,"axG",@progbits,_ZN6vectorIDiE7reserveEj,comdat
	.weak	_ZN6vectorIDiE7reserveEj # -- Begin function _ZN6vectorIDiE7reserveEj
	.p2align	2
	.type	_ZN6vectorIDiE7reserveEj,@function
_ZN6vectorIDiE7reserveEj:               # @_ZN6vectorIDiE7reserveEj
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	mv	s0, a0
	lw	a0, 4(a0)
	bgeu	a0, a1, .LBB25_26
.LBB25_1:                               # =>This Inner Loop Header: Depth=1
	slli	a0, a0, 1
	bltu	a0, a1, .LBB25_1
# %bb.2:
	sw	a0, 4(s0)
	lui	a1, 262144
	addi	a1, a1, -1
	and	a1, a0, a1
	xor	a1, a1, a0
	snez	a1, a1
	addi	s1, zero, -1
	bnez	a1, .LBB25_4
# %bb.3:
	slli	s1, a0, 2
.LBB25_4:
	beqz	s1, .LBB25_11
# %bb.5:
	lui	s3, %hi(nbBlocks)
	lw	a0, %lo(nbBlocks)(s3)
	beqz	a0, .LBB25_12
# %bb.6:
	lui	a1, %hi(allocSize)
	lw	a2, %lo(allocSize)(a1)
	mv	a1, zero
	mv	a3, a0
.LBB25_7:                               # =>This Inner Loop Header: Depth=1
	add	a4, a2, a1
	lw	a5, 0(a4)
	bge	a5, s1, .LBB25_14
# %bb.8:                                #   in Loop: Header=BB25_7 Depth=1
	addi	a3, a3, -1
	addi	a1, a1, 4
	bnez	a3, .LBB25_7
# %bb.9:
	addi	a1, zero, 100
	bne	a0, a1, .LBB25_13
# %bb.10:
	addi	a0, zero, 29
	call	exit
	lui	a0, %hi(nbBlocks)
	lw	a0, %lo(nbBlocks)(a0)
	j	.LBB25_13
.LBB25_11:
	mv	s2, zero
	j	.LBB25_15
.LBB25_12:
	mv	a0, zero
.LBB25_13:
	lui	a1, %hi(__asm__freept)
	lui	a2, %hi(allocPos)
	lw	a2, %lo(allocPos)(a2)
	lw	s2, %lo(__asm__freept)(a1)
	slli	a0, a0, 2
	add	a2, a2, a0
	sw	s2, 0(a2)
	lui	a2, %hi(allocSize)
	lw	a2, %lo(allocSize)(a2)
	neg	a3, s1
	add	a0, a2, a0
	sw	a3, 0(a0)
	lw	a0, %lo(nbBlocks)(s3)
	lw	a2, %lo(__asm__freept)(a1)
	addi	a0, a0, 1
	sw	a0, %lo(nbBlocks)(s3)
	add	a0, a2, s1
	sw	a0, %lo(__asm__freept)(a1)
	j	.LBB25_15
.LBB25_14:
	neg	a0, a5
	sw	a0, 0(a4)
	lui	a0, %hi(allocPos)
	lw	a0, %lo(allocPos)(a0)
	add	a0, a0, a1
	lw	s2, 0(a0)
.LBB25_15:
	lw	a1, 0(s0)
	lw	a0, 8(s0)
	beqz	a1, .LBB25_18
# %bb.16:
	mv	a2, zero
	mv	a3, a0
	mv	a4, s2
.LBB25_17:                              # =>This Inner Loop Header: Depth=1
	lw	a5, 0(a3)
	sw	a5, 0(a4)
	addi	a2, a2, 1
	addi	a4, a4, 4
	addi	a3, a3, 4
	bltu	a2, a1, .LBB25_17
	j	.LBB25_19
.LBB25_18:
	beqz	a0, .LBB25_25
.LBB25_19:
	lui	a1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(a1)
	beqz	a1, .LBB25_23
# %bb.20:
	lui	a2, %hi(allocPos)
	lw	a2, %lo(allocPos)(a2)
	mv	a3, zero
.LBB25_21:                              # =>This Inner Loop Header: Depth=1
	add	a4, a2, a3
	lw	a4, 0(a4)
	beq	a4, a0, .LBB25_24
# %bb.22:                               #   in Loop: Header=BB25_21 Depth=1
	addi	a1, a1, -1
	addi	a3, a3, 4
	bnez	a1, .LBB25_21
.LBB25_23:
	addi	a0, zero, 40
	call	exit
	j	.LBB25_25
.LBB25_24:
	lui	a0, %hi(allocSize)
	lw	a0, %lo(allocSize)(a0)
	add	a0, a0, a3
	lw	a1, 0(a0)
	neg	a1, a1
	sw	a1, 0(a0)
.LBB25_25:
	sw	s2, 8(s0)
.LBB25_26:
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end25:
	.size	_ZN6vectorIDiE7reserveEj, .Lfunc_end25-_ZN6vectorIDiE7reserveEj
                                        # -- End function
	.text
	.globl	_Z6hdd_cdjPKDi          # -- Begin function _Z6hdd_cdjPKDi
	.p2align	2
	.type	_Z6hdd_cdjPKDi,@function
_Z6hdd_cdjPKDi:                         # @_Z6hdd_cdjPKDi
# %bb.0:
	lw	a2, 0(a1)
	beqz	a2, .LBB26_3
# %bb.1:
	mv	t2, zero
	addi	a2, a1, 4
.LBB26_2:                               # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a2)
	addi	t2, t2, 1
	addi	a2, a2, 4
	bnez	a3, .LBB26_2
	j	.LBB26_4
.LBB26_3:
	mv	t2, zero
.LBB26_4:
	addi	a2, a0, 4
	lui	a7, 655360
	sw	a2, 8(a7)
	lui	t0, 524288
	lw	a6, 4(t0)
	beqz	a6, .LBB26_12
# %bb.5:
	mv	t1, zero
	addi	a3, a0, 8
.LBB26_6:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB26_10 Depth 2
	sw	a3, 8(a7)
	lw	a0, 4(t0)
	addi	a2, a3, 4
	sw	a2, 8(a7)
	lw	a4, 4(t0)
	addi	a3, a3, 8
	xor	a2, t2, a4
	seqz	t3, a2
	mv	a2, a1
	bnez	a4, .LBB26_10
.LBB26_7:                               #   in Loop: Header=BB26_6 Depth=1
	bnez	t3, .LBB26_13
# %bb.8:                                #   in Loop: Header=BB26_6 Depth=1
	addi	t1, t1, 1
	bne	t1, a6, .LBB26_6
	j	.LBB26_12
.LBB26_9:                               #   in Loop: Header=BB26_10 Depth=2
	addi	a3, a3, 4
	addi	a4, a4, -1
	addi	a2, a2, 4
	beqz	a4, .LBB26_7
.LBB26_10:                              #   Parent Loop BB26_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	a5, t3, 1
	mv	t3, zero
	beqz	a5, .LBB26_9
# %bb.11:                               #   in Loop: Header=BB26_10 Depth=2
	sw	a3, 8(a7)
	lw	t3, 4(t0)
	lw	a5, 0(a2)
	xor	a5, t3, a5
	seqz	t3, a5
	j	.LBB26_9
.LBB26_12:
	mv	a0, zero
.LBB26_13:
	ret
.Lfunc_end26:
	.size	_Z6hdd_cdjPKDi, .Lfunc_end26-_Z6hdd_cdjPKDi
                                        # -- End function
	.globl	_Z8hdd_rootv            # -- Begin function _Z8hdd_rootv
	.p2align	2
	.type	_Z8hdd_rootv,@function
_Z8hdd_rootv:                           # @_Z8hdd_rootv
# %bb.0:
	lui	a0, 655360
	addi	a1, zero, 4
	sw	a1, 8(a0)
	lui	a0, 524288
	lw	a0, 4(a0)
	addi	a0, a0, 16
	ret
.Lfunc_end27:
	.size	_Z8hdd_rootv, .Lfunc_end27-_Z8hdd_rootv
                                        # -- End function
	.globl	_ZrsR4FileRj            # -- Begin function _ZrsR4FileRj
	.p2align	2
	.type	_ZrsR4FileRj,@function
_ZrsR4FileRj:                           # @_ZrsR4FileRj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	mv	s0, a0
	lw	a0, 0(a0)
	lw	a2, 0(a0)
	mv	s1, a1
	mv	a0, s0
	jalr	a2
	sw	a0, 0(s1)
	mv	a0, s0
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end28:
	.size	_ZrsR4FileRj, .Lfunc_end28-_ZrsR4FileRj
                                        # -- End function
	.globl	_Z19numberOfBytesInCharh # -- Begin function _Z19numberOfBytesInCharh
	.p2align	2
	.type	_Z19numberOfBytesInCharh,@function
_Z19numberOfBytesInCharh:               # @_Z19numberOfBytesInCharh
# %bb.0:
	slli	a1, a0, 24
	srai	a2, a1, 24
	addi	a3, zero, -1
	addi	a1, zero, 1
	bge	a3, a2, .LBB29_2
.LBB29_1:
	mv	a0, a1
	ret
.LBB29_2:
	addi	a2, zero, 224
	addi	a1, zero, 2
	bltu	a0, a2, .LBB29_1
# %bb.3:
	addi	a2, zero, 240
	addi	a1, zero, 3
	bltu	a0, a2, .LBB29_1
# %bb.4:
	addi	a1, zero, 4
	mv	a0, a1
	ret
.Lfunc_end29:
	.size	_Z19numberOfBytesInCharh, .Lfunc_end29-_Z19numberOfBytesInCharh
                                        # -- End function
	.globl	_Z9read_utf8R4File      # -- Begin function _Z9read_utf8R4File
	.p2align	2
	.type	_Z9read_utf8R4File,@function
_Z9read_utf8R4File:                     # @_Z9read_utf8R4File
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	sw	s4, 8(sp)
	sw	s5, 4(sp)
	mv	s0, a1
	mv	s2, a0
	mv	a1, zero
	mv	a2, zero
	call	_ZN6vectorIDiEC2EjDi
	lw	a0, 4(s0)
	lw	a1, 8(s0)
	sub	a0, a1, a0
	sltu	a2, a1, a0
	mv	a1, zero
	bnez	a2, .LBB30_2
# %bb.1:
	mv	a1, a0
.LBB30_2:
	mv	a0, s2
	call	_ZN6vectorIDiE7reserveEj
	lw	a0, 4(s0)
	lw	a1, 8(s0)
	bgeu	a0, a1, .LBB30_16
# %bb.3:
	addi	s3, zero, 240
	addi	s4, zero, 224
	addi	s5, zero, -1
	j	.LBB30_6
.LBB30_4:                               #   in Loop: Header=BB30_6 Depth=1
	lw	a2, 8(s2)
	slli	a0, a0, 2
	add	a0, a2, a0
	sw	s1, 0(a0)
	sw	a1, 0(s2)
.LBB30_5:                               #   in Loop: Header=BB30_6 Depth=1
	lw	a0, 4(s0)
	lw	a1, 8(s0)
	bgeu	a0, a1, .LBB30_16
.LBB30_6:                               # =>This Inner Loop Header: Depth=1
	lw	a0, 0(s0)
	lw	a1, 4(a0)
	mv	a0, s0
	jalr	a1
	mv	s1, a0
	bltu	a0, s3, .LBB30_8
# %bb.7:                                #   in Loop: Header=BB30_6 Depth=1
	lw	a0, 0(s0)
	lw	a1, 4(a0)
	slli	a0, s1, 6
	andi	s1, a0, 1984
	mv	a0, s0
	jalr	a1
	lw	a1, 0(s0)
	lw	a1, 4(a1)
	andi	a0, a0, 63
	or	s1, s1, a0
	mv	a0, s0
	jalr	a1
	lw	a1, 0(s0)
	andi	a0, a0, 63
	lw	a1, 4(a1)
	slli	a2, s1, 12
	slli	a0, a0, 6
	or	s1, a0, a2
	j	.LBB30_12
.LBB30_8:                               #   in Loop: Header=BB30_6 Depth=1
	bltu	s1, s4, .LBB30_10
# %bb.9:                                #   in Loop: Header=BB30_6 Depth=1
	lw	a0, 0(s0)
	lw	a1, 4(a0)
	slli	a0, s1, 6
	andi	s1, a0, 960
	mv	a0, s0
	jalr	a1
	lw	a1, 0(s0)
	lw	a1, 4(a1)
	andi	a0, a0, 63
	or	a0, s1, a0
	slli	s1, a0, 6
	j	.LBB30_12
.LBB30_10:                              #   in Loop: Header=BB30_6 Depth=1
	slli	a0, s1, 24
	srai	a0, a0, 24
	blt	s5, a0, .LBB30_13
# %bb.11:                               #   in Loop: Header=BB30_6 Depth=1
	lw	a0, 0(s0)
	lw	a1, 4(a0)
	slli	a0, s1, 6
	andi	s1, a0, 448
.LBB30_12:                              #   in Loop: Header=BB30_6 Depth=1
	mv	a0, s0
	jalr	a1
	andi	a0, a0, 63
	or	s1, s1, a0
.LBB30_13:                              #   in Loop: Header=BB30_6 Depth=1
	beqz	s1, .LBB30_5
# %bb.14:                               #   in Loop: Header=BB30_6 Depth=1
	lw	a0, 0(s2)
	lw	a2, 4(s2)
	addi	a1, a0, 1
	bltu	a1, a2, .LBB30_4
# %bb.15:                               #   in Loop: Header=BB30_6 Depth=1
	slli	a1, a2, 1
	mv	a0, s2
	call	_ZN6vectorIDiE7reserveEj
	lw	a0, 0(s2)
	addi	a1, a0, 1
	j	.LBB30_4
.LBB30_16:
	lw	s5, 4(sp)
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end30:
	.size	_Z9read_utf8R4File, .Lfunc_end30-_Z9read_utf8R4File
                                        # -- End function
	.globl	_Z11sendTextureR4Filej  # -- Begin function _Z11sendTextureR4Filej
	.p2align	2
	.type	_Z11sendTextureR4Filej,@function
_Z11sendTextureR4Filej:                 # @_Z11sendTextureR4Filej
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	sw	s4, 8(sp)
	sw	s5, 4(sp)
	mv	s0, a0
	lw	a0, 0(a0)
	lw	a2, 0(a0)
	mv	s3, a1
	mv	a0, s0
	jalr	a2
	lw	a1, 0(s0)
	lw	a1, 0(a1)
	mv	s2, a0
	mv	a0, s0
	jalr	a1
	mv	s4, a0
	slli	a0, s2, 8
	add	a0, s4, a0
	slli	a0, a0, 8
	ori	a0, a0, 1
	lui	s5, 655360
	sw	a0, 12(s5)
	slli	a0, s3, 8
	ori	a0, a0, 6
	sw	a0, 12(s5)
	beqz	s2, .LBB31_5
# %bb.1:
	mv	s3, zero
	j	.LBB31_3
.LBB31_2:                               #   in Loop: Header=BB31_3 Depth=1
	addi	s3, s3, 1
	beq	s3, s2, .LBB31_5
.LBB31_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB31_4 Depth 2
	mv	s1, s4
	beqz	s4, .LBB31_2
.LBB31_4:                               #   Parent Loop BB31_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, 0(s0)
	lw	a1, 0(a0)
	mv	a0, s0
	jalr	a1
	addi	s1, s1, -1
	sw	a0, 12(s5)
	bnez	s1, .LBB31_4
	j	.LBB31_2
.LBB31_5:
	lw	s5, 4(sp)
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end31:
	.size	_Z11sendTextureR4Filej, .Lfunc_end31-_Z11sendTextureR4Filej
                                        # -- End function
	.globl	_Z16drawFullTrianglejjjjjjjjj # -- Begin function _Z16drawFullTrianglejjjjjjjjj
	.p2align	2
	.type	_Z16drawFullTrianglejjjjjjjjj,@function
_Z16drawFullTrianglejjjjjjjjj:          # @_Z16drawFullTrianglejjjjjjjjj
# %bb.0:
	lw	t0, 0(sp)
	slli	a1, a1, 8
	add	a0, a1, a0
	slli	a0, a0, 8
	ori	a0, a0, 1
	lui	a1, 655360
	sw	a0, 12(a1)
	slli	a0, a3, 8
	add	a0, a0, a2
	slli	a0, a0, 8
	ori	a0, a0, 7
	sw	a0, 12(a1)
	slli	a0, a5, 8
	add	a0, a0, a4
	slli	a0, a0, 8
	ori	a0, a0, 8
	sw	a0, 12(a1)
	slli	a0, t0, 8
	add	a0, a0, a7
	slli	a0, a0, 8
	add	a0, a0, a6
	slli	a0, a0, 8
	ori	a0, a0, 9
	sw	a0, 12(a1)
	ret
.Lfunc_end32:
	.size	_Z16drawFullTrianglejjjjjjjjj, .Lfunc_end32-_Z16drawFullTrianglejjjjjjjjj
                                        # -- End function
	.globl	_Z9load_tilejjPKDi      # -- Begin function _Z9load_tilejjPKDi
	.p2align	2
	.type	_Z9load_tilejjPKDi,@function
_Z9load_tilejjPKDi:                     # @_Z9load_tilejjPKDi
# %bb.0:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	sw	s1, 36(sp)
	sw	s2, 32(sp)
	sw	s3, 28(sp)
	sw	s4, 24(sp)
	sw	s5, 20(sp)
	lw	a3, 0(a2)
	beqz	a3, .LBB33_3
# %bb.1:
	mv	a5, zero
	addi	a3, a2, 4
.LBB33_2:                               # =>This Inner Loop Header: Depth=1
	lw	a4, 0(a3)
	addi	a5, a5, 1
	addi	a3, a3, 4
	bnez	a4, .LBB33_2
	j	.LBB33_4
.LBB33_3:
	mv	a5, zero
.LBB33_4:
	addi	a3, a1, 4
	lui	t0, 655360
	sw	a3, 8(t0)
	lui	t1, 524288
	lw	a6, 4(t1)
	beqz	a6, .LBB33_12
# %bb.5:
	mv	t2, zero
	addi	a1, a1, 8
.LBB33_6:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB33_10 Depth 2
	sw	a1, 8(t0)
	lw	a7, 4(t1)
	addi	a3, a1, 4
	sw	a3, 8(t0)
	lw	s1, 4(t1)
	addi	a1, a1, 8
	xor	a3, a5, s1
	seqz	a3, a3
	mv	a4, a2
	bnez	s1, .LBB33_10
.LBB33_7:                               #   in Loop: Header=BB33_6 Depth=1
	bnez	a3, .LBB33_13
# %bb.8:                                #   in Loop: Header=BB33_6 Depth=1
	addi	t2, t2, 1
	bne	t2, a6, .LBB33_6
	j	.LBB33_12
.LBB33_9:                               #   in Loop: Header=BB33_10 Depth=2
	addi	a1, a1, 4
	addi	s1, s1, -1
	addi	a4, a4, 4
	beqz	s1, .LBB33_7
.LBB33_10:                              #   Parent Loop BB33_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	s0, a3, 1
	mv	a3, zero
	beqz	s0, .LBB33_9
# %bb.11:                               #   in Loop: Header=BB33_10 Depth=2
	sw	a1, 8(t0)
	lw	a3, 4(t1)
	lw	s0, 0(a4)
	xor	a3, a3, s0
	seqz	a3, a3
	j	.LBB33_9
.LBB33_12:
	mv	a7, zero
.LBB33_13:
	lui	a1, %hi(_ZTV4File+8)
	addi	a1, a1, %lo(_ZTV4File+8)
	sw	a1, 8(sp)
	addi	a1, a7, 4
	sw	a1, 8(t0)
	lw	a1, 4(t1)
	addi	a2, a7, 8
	add	a1, a1, a2
	sw	a1, 16(sp)
	sw	a2, 8(t0)
	lw	s2, 4(t1)
	addi	a1, a7, 12
	sw	a1, 8(t0)
	lw	s3, 4(t1)
	addi	a1, a7, 16
	sw	a1, 12(sp)
	slli	a1, s2, 8
	add	a1, s3, a1
	slli	a1, a1, 8
	ori	a1, a1, 1
	sw	a1, 12(t0)
	slli	a0, a0, 8
	ori	a0, a0, 6
	sw	a0, 12(t0)
	beqz	s2, .LBB33_18
# %bb.14:
	mv	s4, zero
	addi	s0, sp, 8
	lui	s5, 655360
	j	.LBB33_16
.LBB33_15:                              #   in Loop: Header=BB33_16 Depth=1
	addi	s4, s4, 1
	beq	s4, s2, .LBB33_18
.LBB33_16:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB33_17 Depth 2
	mv	s1, s3
	beqz	s3, .LBB33_15
.LBB33_17:                              #   Parent Loop BB33_16 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, 8(sp)
	lw	a1, 0(a0)
	mv	a0, s0
	jalr	a1
	addi	s1, s1, -1
	sw	a0, 12(s5)
	bnez	s1, .LBB33_17
	j	.LBB33_15
.LBB33_18:
	lw	s5, 20(sp)
	lw	s4, 24(sp)
	lw	s3, 28(sp)
	lw	s2, 32(sp)
	lw	s1, 36(sp)
	lw	s0, 40(sp)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end33:
	.size	_Z9load_tilejjPKDi, .Lfunc_end33-_Z9load_tilejjPKDi
                                        # -- End function
	.globl	_Z19load_alphabet_tilesj # -- Begin function _Z19load_alphabet_tilesj
	.p2align	2
	.type	_Z19load_alphabet_tilesj,@function
_Z19load_alphabet_tilesj:               # @_Z19load_alphabet_tilesj
# %bb.0:
	addi	sp, sp, -80
	sw	ra, 76(sp)
	sw	s0, 72(sp)
	sw	s1, 68(sp)
	sw	s2, 64(sp)
	sw	s3, 60(sp)
	lui	a1, %hi(.L.str.12)
	lw	a2, %lo(.L.str.12)(a1)
	addi	a1, a1, %lo(.L.str.12)
	lw	a3, 20(a1)
	mv	s2, a0
	sw	a2, 36(sp)
	sw	a3, 56(sp)
	lw	a0, 16(a1)
	lw	a2, 12(a1)
	lw	a3, 8(a1)
	lw	a1, 4(a1)
	sw	a0, 52(sp)
	sw	a2, 48(sp)
	sw	a3, 44(sp)
	sw	a1, 40(sp)
	lui	a0, %hi(.L__const._Z19load_alphabet_tilesj.name_upper)
	addi	a1, a0, %lo(.L__const._Z19load_alphabet_tilesj.name_upper)
	lw	a2, 28(a1)
	lw	a3, 24(a1)
	lw	a4, 20(a1)
	lw	a5, 16(a1)
	sw	a2, 32(sp)
	sw	a3, 28(sp)
	sw	a4, 24(sp)
	sw	a5, 20(sp)
	lw	a2, 12(a1)
	lw	a3, 8(a1)
	lw	a1, 4(a1)
	lw	a0, %lo(.L__const._Z19load_alphabet_tilesj.name_upper)(a0)
	sw	a2, 16(sp)
	sw	a3, 12(sp)
	sw	a1, 8(sp)
	sw	a0, 4(sp)
	lui	a0, %hi(.L.str)
	addi	a2, a0, %lo(.L.str)
	addi	a0, zero, 32
	mv	a1, s2
	call	_Z9load_tilejjPKDi
	addi	s1, zero, 97
	addi	s3, sp, 36
	addi	s0, zero, 123
.LBB34_1:                               # =>This Inner Loop Header: Depth=1
	sw	s1, 36(sp)
	mv	a0, s1
	mv	a1, s2
	mv	a2, s3
	call	_Z9load_tilejjPKDi
	addi	s1, s1, 1
	bne	s1, s0, .LBB34_1
# %bb.2:
	addi	s1, zero, 65
	addi	s3, sp, 4
	addi	s0, zero, 91
.LBB34_3:                               # =>This Inner Loop Header: Depth=1
	sw	s1, 12(sp)
	mv	a0, s1
	mv	a1, s2
	mv	a2, s3
	call	_Z9load_tilejjPKDi
	addi	s1, s1, 1
	bne	s1, s0, .LBB34_3
# %bb.4:
	addi	a0, zero, 48
	sw	a0, 36(sp)
	addi	s1, sp, 36
	addi	a0, zero, 48
	mv	a1, s2
	mv	a2, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 49
	sw	a0, 36(sp)
	addi	a0, zero, 49
	mv	a1, s2
	mv	a2, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 50
	sw	a0, 36(sp)
	addi	a0, zero, 50
	mv	a1, s2
	mv	a2, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 51
	sw	a0, 36(sp)
	addi	a0, zero, 51
	mv	a1, s2
	mv	a2, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 52
	sw	a0, 36(sp)
	addi	a0, zero, 52
	mv	a1, s2
	mv	a2, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 53
	sw	a0, 36(sp)
	addi	a0, zero, 53
	mv	a1, s2
	mv	a2, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 54
	sw	a0, 36(sp)
	addi	a0, zero, 54
	mv	a1, s2
	mv	a2, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 55
	sw	a0, 36(sp)
	addi	a0, zero, 55
	mv	a1, s2
	mv	a2, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 56
	sw	a0, 36(sp)
	addi	a0, zero, 56
	mv	a1, s2
	mv	a2, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 57
	sw	a0, 36(sp)
	addi	a0, zero, 57
	mv	a1, s2
	mv	a2, s1
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.1)
	addi	a2, a0, %lo(.L.str.1)
	addi	a0, zero, 58
	mv	a1, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.2)
	addi	a2, a0, %lo(.L.str.2)
	addi	a0, zero, 40
	mv	a1, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.3)
	addi	a2, a0, %lo(.L.str.3)
	addi	a0, zero, 41
	mv	a1, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.4)
	addi	a2, a0, %lo(.L.str.4)
	addi	a0, zero, 91
	mv	a1, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.5)
	addi	a2, a0, %lo(.L.str.5)
	addi	a0, zero, 93
	mv	a1, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.6)
	addi	a2, a0, %lo(.L.str.6)
	addi	a0, zero, 59
	mv	a1, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.7)
	addi	a2, a0, %lo(.L.str.7)
	addi	a0, zero, 46
	mv	a1, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.8)
	addi	a2, a0, %lo(.L.str.8)
	addi	a0, zero, 37
	mv	a1, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.9)
	addi	a2, a0, %lo(.L.str.9)
	addi	a0, zero, 45
	mv	a1, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.10)
	addi	a2, a0, %lo(.L.str.10)
	addi	a0, zero, 44
	mv	a1, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.11)
	addi	a2, a0, %lo(.L.str.11)
	addi	a0, zero, 33
	mv	a1, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.12)
	addi	a2, a0, %lo(.L.str.12)
	addi	a0, zero, 63
	mv	a1, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.13)
	addi	a2, a0, %lo(.L.str.13)
	addi	a0, zero, 47
	mv	a1, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.14)
	addi	s0, a0, %lo(.L.str.14)
	addi	a0, zero, 92
	mv	a1, s2
	mv	a2, s0
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 92
	mv	a1, s2
	mv	a2, s0
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.15)
	addi	a2, a0, %lo(.L.str.15)
	addi	a0, zero, 60
	mv	a1, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.16)
	addi	a2, a0, %lo(.L.str.16)
	addi	a0, zero, 62
	mv	a1, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.17)
	addi	a2, a0, %lo(.L.str.17)
	addi	a0, zero, 64
	mv	a1, s2
	lw	s3, 60(sp)
	lw	s2, 64(sp)
	lw	s1, 68(sp)
	lw	s0, 72(sp)
	lw	ra, 76(sp)
	addi	sp, sp, 80
	tail	_Z9load_tilejjPKDi
.Lfunc_end34:
	.size	_Z19load_alphabet_tilesj, .Lfunc_end34-_Z19load_alphabet_tilesj
                                        # -- End function
	.globl	_Z15load_game_tilesj    # -- Begin function _Z15load_game_tilesj
	.p2align	2
	.type	_Z15load_game_tilesj,@function
_Z15load_game_tilesj:                   # @_Z15load_game_tilesj
# %bb.0:
	mv	a2, zero
	addi	a0, zero, 9
	addi	a1, zero, 99
	j	.LBB35_2
.LBB35_1:                               #   in Loop: Header=BB35_2 Depth=1
	beq	a2, a1, .LBB35_7
.LBB35_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB35_4 Depth 2
                                        #     Child Loop BB35_6 Depth 2
	mv	a4, a2
	addi	a2, a2, 1
	mv	a3, a2
	bltu	a4, a0, .LBB35_6
# %bb.3:                                #   in Loop: Header=BB35_2 Depth=1
	mv	a3, a2
.LBB35_4:                               #   Parent Loop BB35_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	a3, a3, -10
	bltu	a0, a3, .LBB35_4
# %bb.5:                                #   in Loop: Header=BB35_2 Depth=1
	beqz	a3, .LBB35_1
.LBB35_6:                               #   Parent Loop BB35_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	a3, a3, -1
	bnez	a3, .LBB35_6
	j	.LBB35_1
.LBB35_7:
	ret
.Lfunc_end35:
	.size	_Z15load_game_tilesj, .Lfunc_end35-_Z15load_game_tilesj
                                        # -- End function
	.globl	_Z14load_all_tilesj     # -- Begin function _Z14load_all_tilesj
	.p2align	2
	.type	_Z14load_all_tilesj,@function
_Z14load_all_tilesj:                    # @_Z14load_all_tilesj
# %bb.0:
	addi	a1, a0, 4
	lui	t0, 655360
	sw	a1, 8(t0)
	lui	t1, 524288
	lw	a7, 4(t1)
	beqz	a7, .LBB36_9
# %bb.1:
	mv	t2, zero
	addi	a5, a0, 8
	lui	a0, %hi(.L.str.18)
	addi	a6, a0, %lo(.L.str.18)
.LBB36_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB36_5 Depth 2
	sw	a5, 8(t0)
	lw	a0, 4(t1)
	addi	a1, a5, 4
	sw	a1, 8(t0)
	lw	a3, 4(t1)
	addi	a5, a5, 8
	xori	a1, a3, 8
	seqz	a1, a1
	beqz	a3, .LBB36_7
# %bb.3:                                #   in Loop: Header=BB36_2 Depth=1
	mv	a2, a6
	j	.LBB36_5
.LBB36_4:                               #   in Loop: Header=BB36_5 Depth=2
	addi	a5, a5, 4
	addi	a3, a3, -1
	addi	a2, a2, 4
	beqz	a3, .LBB36_7
.LBB36_5:                               #   Parent Loop BB36_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	a4, a1, 1
	mv	a1, zero
	beqz	a4, .LBB36_4
# %bb.6:                                #   in Loop: Header=BB36_5 Depth=2
	sw	a5, 8(t0)
	lw	a1, 4(t1)
	lw	a4, 0(a2)
	xor	a1, a1, a4
	seqz	a1, a1
	j	.LBB36_4
.LBB36_7:                               #   in Loop: Header=BB36_2 Depth=1
	bnez	a1, .LBB36_10
# %bb.8:                                #   in Loop: Header=BB36_2 Depth=1
	addi	t2, t2, 1
	bne	t2, a7, .LBB36_2
.LBB36_9:
	mv	a0, zero
.LBB36_10:
	tail	_Z19load_alphabet_tilesj
.Lfunc_end36:
	.size	_Z14load_all_tilesj, .Lfunc_end36-_Z14load_all_tilesj
                                        # -- End function
	.globl	_Z11computeDatej        # -- Begin function _Z11computeDatej
	.p2align	2
	.type	_Z11computeDatej,@function
_Z11computeDatej:                       # @_Z11computeDatej
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
	add	a1, a0, s0
	addi	a0, zero, 366
	slli	s3, s1, 2
	bltu	a1, a0, .LBB37_3
# %bb.1:
	addi	a1, a1, -366
	addi	a0, zero, 365
	addi	s2, zero, 28
	bltu	a1, a0, .LBB37_4
# %bb.2:
	addi	s4, s0, -731
	addi	a1, zero, 1461
	mv	a0, s1
	call	__mulsi3
	mv	s0, a0
	sub	a0, s4, a0
	addi	a1, zero, 365
	call	__udivsi3
	add	s1, a0, s3
	addi	a1, zero, -365
	call	__mulsi3
	add	a1, s4, a0
	addi	a0, s1, 2006
	sub	a1, a1, s0
	j	.LBB37_5
.LBB37_3:
	addi	a0, s3, 2004
	addi	s2, zero, 29
	j	.LBB37_5
.LBB37_4:
	addi	a0, s3, 2005
.LBB37_5:
	addi	a2, zero, 31
	addi	a3, zero, 1
	bltu	a1, a2, .LBB37_19
# %bb.6:
	addi	a1, a1, -31
	addi	a3, zero, 2
	bltu	a1, s2, .LBB37_19
# %bb.7:
	sub	a2, a1, s2
	addi	a1, zero, 31
	addi	a3, zero, 3
	bgeu	a2, a1, .LBB37_9
# %bb.8:
	mv	a1, a2
	j	.LBB37_19
.LBB37_9:
	addi	a1, a2, -31
	addi	a4, zero, 30
	addi	a3, zero, 4
	bltu	a1, a4, .LBB37_19
# %bb.10:
	addi	a1, a2, -61
	addi	a4, zero, 31
	addi	a3, zero, 5
	bltu	a1, a4, .LBB37_19
# %bb.11:
	addi	a1, a2, -92
	addi	a4, zero, 30
	addi	a3, zero, 6
	bltu	a1, a4, .LBB37_19
# %bb.12:
	addi	a1, a2, -122
	addi	a4, zero, 31
	addi	a3, zero, 7
	bltu	a1, a4, .LBB37_19
# %bb.13:
	addi	a1, a2, -153
	addi	a3, zero, 8
	bltu	a1, a4, .LBB37_19
# %bb.14:
	addi	a1, a2, -184
	addi	a4, zero, 30
	addi	a3, zero, 9
	bltu	a1, a4, .LBB37_19
# %bb.15:
	addi	a1, a2, -214
	addi	a4, zero, 31
	addi	a3, zero, 10
	bltu	a1, a4, .LBB37_19
# %bb.16:
	addi	a1, a2, -245
	addi	a4, zero, 30
	addi	a3, zero, 11
	bltu	a1, a4, .LBB37_19
# %bb.17:
	addi	a1, a2, -275
	addi	a4, zero, 31
	addi	a3, zero, 12
	bltu	a1, a4, .LBB37_19
# %bb.18:
	addi	a1, a2, -306
	addi	a3, zero, 13
.LBB37_19:
	lui	a2, %hi(dateYear)
	sw	a0, %lo(dateYear)(a2)
	lui	a0, %hi(dateMonths)
	sw	a3, %lo(dateMonths)(a0)
	addi	a0, a1, 1
	lui	a1, %hi(dateDays)
	sw	a0, %lo(dateDays)(a1)
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end37:
	.size	_Z11computeDatej, .Lfunc_end37-_Z11computeDatej
                                        # -- End function
	.globl	_Z13breakdownTimeRjS_j  # -- Begin function _Z13breakdownTimeRjS_j
	.p2align	2
	.type	_Z13breakdownTimeRjS_j,@function
_Z13breakdownTimeRjS_j:                 # @_Z13breakdownTimeRjS_j
# %bb.0:
	lw	a3, 0(a0)
	bgeu	a2, a3, .LBB38_2
.LBB38_1:                               # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a1)
	addi	a3, a3, 1
	sw	a3, 0(a1)
	lw	a3, 0(a0)
	sub	a3, a3, a2
	sw	a3, 0(a0)
	bltu	a2, a3, .LBB38_1
.LBB38_2:
	ret
.Lfunc_end38:
	.size	_Z13breakdownTimeRjS_j, .Lfunc_end38-_Z13breakdownTimeRjS_j
                                        # -- End function
	.globl	_Z10setDateStrPDi       # -- Begin function _Z10setDateStrPDi
	.p2align	2
	.type	_Z10setDateStrPDi,@function
_Z10setDateStrPDi:                      # @_Z10setDateStrPDi
# %bb.0:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	sw	s1, 36(sp)
	sw	s2, 32(sp)
	sw	s3, 28(sp)
	sw	s4, 24(sp)
	sw	s5, 20(sp)
	sw	s6, 16(sp)
	lui	a1, %hi(dateDays)
	lw	s1, %lo(dateDays)(a1)
	mv	s2, a0
	addi	a1, zero, 10
	addi	s4, zero, 10
	mv	a0, s1
	call	__udivsi3
	addi	a1, a0, 48
	sw	a1, 0(s2)
	addi	a1, zero, -10
	call	__mulsi3
	add	a0, s1, a0
	addi	a0, a0, 48
	sw	a0, 4(s2)
	lui	a0, %hi(dateMonths)
	lw	s1, %lo(dateMonths)(a0)
	addi	a1, zero, 10
	mv	a0, s1
	call	__udivsi3
	addi	a1, a0, 48
	sw	a1, 12(s2)
	addi	a1, zero, -10
	call	__mulsi3
	add	a0, s1, a0
	addi	a0, a0, 48
	sw	a0, 16(s2)
	mv	s3, sp
	mv	a0, s3
	mv	a1, zero
	mv	a2, zero
	call	_ZN6vectorIDiEC2EjDi
	lui	a0, %hi(dateYear)
	lw	s1, %lo(dateYear)(a0)
	addi	a1, zero, 11
	mv	a0, s3
	call	_ZN6vectorIDiE7reserveEj
	mv	a0, zero
	mv	s0, zero
	mv	a1, zero
	sw	zero, 0(sp)
	lui	a2, %hi(_ZL8digits32)
	addi	s5, a2, %lo(_ZL8digits32)
	j	.LBB39_3
.LBB39_1:                               #   in Loop: Header=BB39_3 Depth=1
	lw	a1, 8(sp)
	slli	a0, a0, 2
	add	a0, a1, a0
	sw	s6, 0(a0)
	sw	a2, 0(sp)
	addi	a1, zero, 1
	mv	a0, a2
.LBB39_2:                               #   in Loop: Header=BB39_3 Depth=1
	addi	s0, s0, 1
	beq	s0, s4, .LBB39_9
.LBB39_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB39_6 Depth 2
	slli	a2, s0, 2
	add	a2, a2, s5
	lw	a2, 0(a2)
	bgeu	s1, a2, .LBB39_5
# %bb.4:                                #   in Loop: Header=BB39_3 Depth=1
	andi	a2, a1, 1
	mv	a1, zero
	beqz	a2, .LBB39_2
	j	.LBB39_7
.LBB39_5:                               #   in Loop: Header=BB39_3 Depth=1
	mv	a1, zero
.LBB39_6:                               #   Parent Loop BB39_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sub	s1, s1, a2
	addi	a1, a1, 1
	bgeu	s1, a2, .LBB39_6
.LBB39_7:                               #   in Loop: Header=BB39_3 Depth=1
	lw	a3, 4(sp)
	addi	a2, a0, 1
	addi	s6, a1, 48
	bltu	a2, a3, .LBB39_1
# %bb.8:                                #   in Loop: Header=BB39_3 Depth=1
	slli	a1, a3, 1
	mv	a0, s3
	call	_ZN6vectorIDiE7reserveEj
	lw	a0, 0(sp)
	addi	a2, a0, 1
	j	.LBB39_1
.LBB39_9:
	lw	a0, 8(sp)
	lw	a1, 0(a0)
	sw	a1, 24(s2)
	lw	a1, 4(a0)
	sw	a1, 28(s2)
	lw	a1, 8(a0)
	sw	a1, 32(s2)
	lw	a1, 12(a0)
	sw	a1, 36(s2)
	lui	a1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(a1)
	beqz	a1, .LBB39_13
# %bb.10:
	lui	a2, %hi(allocPos)
	lw	a2, %lo(allocPos)(a2)
	mv	a3, zero
.LBB39_11:                              # =>This Inner Loop Header: Depth=1
	add	a4, a2, a3
	lw	a4, 0(a4)
	beq	a4, a0, .LBB39_14
# %bb.12:                               #   in Loop: Header=BB39_11 Depth=1
	addi	a1, a1, -1
	addi	a3, a3, 4
	bnez	a1, .LBB39_11
.LBB39_13:
	addi	a0, zero, 40
	call	exit
	j	.LBB39_15
.LBB39_14:
	lui	a0, %hi(allocSize)
	lw	a0, %lo(allocSize)(a0)
	add	a0, a0, a3
	lw	a1, 0(a0)
	neg	a1, a1
	sw	a1, 0(a0)
.LBB39_15:
	lw	s6, 16(sp)
	lw	s5, 20(sp)
	lw	s4, 24(sp)
	lw	s3, 28(sp)
	lw	s2, 32(sp)
	lw	s1, 36(sp)
	lw	s0, 40(sp)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end39:
	.size	_Z10setDateStrPDi, .Lfunc_end39-_Z10setDateStrPDi
                                        # -- End function
	.globl	_Z8runClockv            # -- Begin function _Z8runClockv
	.p2align	2
	.type	_Z8runClockv,@function
_Z8runClockv:                           # @_Z8runClockv
# %bb.0:
	addi	sp, sp, -176
	sw	ra, 172(sp)
	sw	s0, 168(sp)
	sw	s1, 164(sp)
	sw	s2, 160(sp)
	sw	s3, 156(sp)
	sw	s4, 152(sp)
	sw	s5, 148(sp)
	sw	s6, 144(sp)
	sw	s7, 140(sp)
	sw	s8, 136(sp)
	sw	s9, 132(sp)
	sw	s10, 128(sp)
	sw	s11, 124(sp)
	lui	a0, 1048575
	addi	a0, a0, 496
	sw	a0, 16(sp)
	lui	a0, 786626
	addi	a0, a0, -401
	sw	a0, 12(sp)
	lui	a0, %hi(.L__const._Z12runClockFastv.time_str)
	addi	a1, a0, %lo(.L__const._Z12runClockFastv.time_str)
	addi	a0, sp, 88
	addi	a2, zero, 36
	call	memcpy
	lui	a0, %hi(.L__const._Z12runClockFastv.date_str)
	addi	a1, a0, %lo(.L__const._Z12runClockFastv.date_str)
	addi	a0, sp, 44
	addi	a2, zero, 44
	call	memcpy
	lui	s9, 524288
	lui	a0, 786635
	addi	a0, a0, -1264
	sw	a0, 32(sp)
	lui	a0, 21
	addi	a0, a0, 384
	sw	a0, 36(sp)
	lui	a0, 1048555
	addi	a0, a0, -384
	sw	a0, 28(sp)
	lui	a0, 9
	addi	a1, a0, -863
	sw	a1, 24(sp)
	addi	a0, a0, -864
	sw	a0, 8(sp)
	lui	a0, 1048567
	addi	a0, a0, 864
	sw	a0, 4(sp)
	lui	a0, 1
	addi	a1, a0, -495
	sw	a1, 20(sp)
	addi	a0, a0, -496
	sw	a0, 0(sp)
	addi	s5, zero, 1
	lui	s6, 655360
	addi	s11, zero, 14
	addi	s3, zero, 8
	j	.LBB40_3
.LBB40_1:                               #   in Loop: Header=BB40_3 Depth=1
	addi	a0, s6, 12
	addi	a1, zero, 42
	sw	a1, 0(a0)
.LBB40_2:                               #   in Loop: Header=BB40_3 Depth=1
	andi	a0, s10, 1
	bnez	a0, .LBB40_36
.LBB40_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB40_6 Depth 2
                                        #     Child Loop BB40_10 Depth 2
                                        #     Child Loop BB40_28 Depth 2
                                        #     Child Loop BB40_34 Depth 2
	lui	a0, %hi(app)
	lw	a0, %lo(app)(a0)
	lw	a1, 0(s9)
	beqz	a1, .LBB40_8
# %bb.4:                                #   in Loop: Header=BB40_3 Depth=1
	lw	a1, 8(a0)
	j	.LBB40_6
.LBB40_5:                               #   in Loop: Header=BB40_6 Depth=2
	lw	a2, 0(s9)
	beqz	a2, .LBB40_8
.LBB40_6:                               #   Parent Loop BB40_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	a1, a1, 1
	sw	a1, 8(a0)
	sw	s5, 16(a0)
	bne	a1, s3, .LBB40_5
# %bb.7:                                #   in Loop: Header=BB40_6 Depth=2
	lw	a2, 4(a0)
	mv	a1, zero
	addi	a2, a2, 1
	sw	a2, 4(a0)
	sw	zero, 8(a0)
	j	.LBB40_5
.LBB40_8:                               #   in Loop: Header=BB40_3 Depth=1
	lw	a1, 12(a0)
	mv	s10, zero
	j	.LBB40_10
.LBB40_9:                               #   in Loop: Header=BB40_10 Depth=2
	sw	zero, 12(a0)
	xori	a1, a1, 37
	seqz	a1, a1
	or	s10, s10, a1
	mv	a1, zero
.LBB40_10:                              #   Parent Loop BB40_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	bnez	a1, .LBB40_9
# %bb.11:                               #   in Loop: Header=BB40_10 Depth=2
	lw	a1, 8(s9)
	sw	a1, 12(a0)
	bnez	a1, .LBB40_9
# %bb.12:                               #   in Loop: Header=BB40_3 Depth=1
	lw	a1, 16(a0)
	beqz	a1, .LBB40_2
# %bb.13:                               #   in Loop: Header=BB40_3 Depth=1
	lw	s2, 4(a0)
	sw	zero, 16(a0)
	lw	a0, 32(sp)
	add	s1, s2, a0
	mv	a0, s1
	lw	a1, 36(sp)
	call	__udivsi3
	mv	s0, a0
	lw	a1, 28(sp)
	call	__mulsi3
	add	s7, a0, s1
	mv	a0, s0
	call	_Z11computeDatej
	addi	a0, sp, 44
	call	_Z10setDateStrPDi
	addi	s4, zero, 48
	addi	s1, zero, 48
	lw	a0, 24(sp)
	bltu	s7, a0, .LBB40_15
# %bb.14:                               #   in Loop: Header=BB40_3 Depth=1
	lw	a0, 12(sp)
	add	s2, s2, a0
	mv	a0, s0
	lw	a1, 36(sp)
	call	__mulsi3
	mv	s0, a0
	sub	a0, s2, a0
	lw	a1, 8(sp)
	call	__udivsi3
	mv	s1, a0
	lw	a1, 4(sp)
	call	__mulsi3
	add	a0, s2, a0
	addi	s1, s1, 49
	sub	a0, a0, s0
	addi	s7, a0, 1
.LBB40_15:                              #   in Loop: Header=BB40_3 Depth=1
	lw	a0, 20(sp)
	bltu	s7, a0, .LBB40_17
# %bb.16:                               #   in Loop: Header=BB40_3 Depth=1
	lw	s0, 16(sp)
	add	s2, s7, s0
	addi	a0, s2, -1
	lw	a1, 0(sp)
	call	__udivsi3
	addi	s4, a0, 49
	mv	a1, s0
	call	__mulsi3
	add	s7, s2, a0
.LBB40_17:                              #   in Loop: Header=BB40_3 Depth=1
	addi	s0, zero, 48
	addi	a0, zero, 601
	sw	s4, 40(sp)
	bltu	s7, a0, .LBB40_19
# %bb.18:                               #   in Loop: Header=BB40_3 Depth=1
	addi	a0, s7, -601
	addi	a1, zero, 600
	call	__udivsi3
	addi	s4, a0, 49
	addi	a1, zero, -600
	call	__mulsi3
	add	a0, s7, a0
	addi	s7, a0, -600
	addi	a0, zero, 61
	bgeu	s7, a0, .LBB40_20
	j	.LBB40_21
.LBB40_19:                              #   in Loop: Header=BB40_3 Depth=1
	addi	s4, zero, 48
	addi	a0, zero, 61
	bltu	s7, a0, .LBB40_21
.LBB40_20:                              #   in Loop: Header=BB40_3 Depth=1
	addi	a0, s7, -61
	addi	a1, zero, 60
	call	__udivsi3
	addi	s0, a0, 49
	addi	a1, zero, -60
	call	__mulsi3
	add	a0, s7, a0
	addi	s7, a0, -60
.LBB40_21:                              #   in Loop: Header=BB40_3 Depth=1
	addi	s8, zero, 48
	addi	a0, zero, 11
	bltu	s7, a0, .LBB40_23
# %bb.22:                               #   in Loop: Header=BB40_3 Depth=1
	addi	a0, s7, -11
	addi	a1, zero, 10
	call	__udivsi3
	addi	s2, a0, 49
	addi	a1, zero, -10
	call	__mulsi3
	add	a0, s7, a0
	addi	s7, a0, -10
	bltu	s5, s7, .LBB40_24
	j	.LBB40_25
.LBB40_23:                              #   in Loop: Header=BB40_3 Depth=1
	addi	s2, zero, 48
	bgeu	s5, s7, .LBB40_25
.LBB40_24:                              #   in Loop: Header=BB40_3 Depth=1
	addi	s8, s7, 47
.LBB40_25:                              #   in Loop: Header=BB40_3 Depth=1
	mv	a1, zero
	sw	s1, 88(sp)
	lw	a0, 40(sp)
	sw	a0, 92(sp)
	sw	s4, 100(sp)
	sw	s0, 104(sp)
	sw	s2, 112(sp)
	sw	s8, 116(sp)
	addi	a0, zero, 46
	addi	a3, zero, 22
	addi	a2, sp, 92
	j	.LBB40_28
.LBB40_26:                              #   in Loop: Header=BB40_28 Depth=2
	addi	a3, a3, 7
.LBB40_27:                              #   in Loop: Header=BB40_28 Depth=2
	lw	s1, 0(a2)
	addi	a2, a2, 4
	beqz	s1, .LBB40_30
.LBB40_28:                              #   Parent Loop BB40_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a4, a0, 8
	add	a4, a4, a3
	slli	a4, a4, 8
	ori	a4, a4, 1
	sw	a4, 12(s6)
	slli	a4, s1, 8
	ori	a4, a4, 5
	addi	a1, a1, 1
	sw	a4, 12(s6)
	bne	a1, s11, .LBB40_26
# %bb.29:                               #   in Loop: Header=BB40_28 Depth=2
	mv	a1, zero
	addi	a0, a0, 7
	addi	a3, zero, 22
	j	.LBB40_27
.LBB40_30:                              #   in Loop: Header=BB40_3 Depth=1
	lw	a4, 44(sp)
	beqz	a4, .LBB40_1
# %bb.31:                               #   in Loop: Header=BB40_3 Depth=1
	mv	a2, zero
	addi	a0, zero, 20
	addi	a3, zero, 15
	addi	a1, sp, 48
	j	.LBB40_34
.LBB40_32:                              #   in Loop: Header=BB40_34 Depth=2
	addi	a3, a3, 7
.LBB40_33:                              #   in Loop: Header=BB40_34 Depth=2
	lw	a4, 0(a1)
	addi	a1, a1, 4
	beqz	a4, .LBB40_1
.LBB40_34:                              #   Parent Loop BB40_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a5, a0, 8
	add	a5, a5, a3
	slli	a5, a5, 8
	ori	a5, a5, 1
	sw	a5, 12(s6)
	slli	a4, a4, 8
	ori	a4, a4, 5
	addi	a2, a2, 1
	sw	a4, 12(s6)
	bne	a2, s11, .LBB40_32
# %bb.35:                               #   in Loop: Header=BB40_34 Depth=2
	mv	a2, zero
	addi	a0, a0, 7
	addi	a3, zero, 15
	j	.LBB40_33
.LBB40_36:
	lw	s11, 124(sp)
	lw	s10, 128(sp)
	lw	s9, 132(sp)
	lw	s8, 136(sp)
	lw	s7, 140(sp)
	lw	s6, 144(sp)
	lw	s5, 148(sp)
	lw	s4, 152(sp)
	lw	s3, 156(sp)
	lw	s2, 160(sp)
	lw	s1, 164(sp)
	lw	s0, 168(sp)
	lw	ra, 172(sp)
	addi	sp, sp, 176
	ret
.Lfunc_end40:
	.size	_Z8runClockv, .Lfunc_end40-_Z8runClockv
                                        # -- End function
	.globl	_Z12runClockFastv       # -- Begin function _Z12runClockFastv
	.p2align	2
	.type	_Z12runClockFastv,@function
_Z12runClockFastv:                      # @_Z12runClockFastv
# %bb.0:
	addi	sp, sp, -144
	sw	ra, 140(sp)
	sw	s0, 136(sp)
	sw	s1, 132(sp)
	sw	s2, 128(sp)
	sw	s3, 124(sp)
	sw	s4, 120(sp)
	sw	s5, 116(sp)
	sw	s6, 112(sp)
	sw	s7, 108(sp)
	sw	s8, 104(sp)
	sw	s9, 100(sp)
	sw	s10, 96(sp)
	sw	s11, 92(sp)
	lui	a0, %hi(.L__const._Z12runClockFastv.time_str)
	addi	a1, a0, %lo(.L__const._Z12runClockFastv.time_str)
	addi	a0, sp, 56
	addi	a2, zero, 36
	call	memcpy
	lui	a0, %hi(.L__const._Z12runClockFastv.date_str)
	addi	a1, a0, %lo(.L__const._Z12runClockFastv.date_str)
	addi	s3, sp, 12
	addi	a2, zero, 44
	mv	a0, s3
	call	memcpy
	lui	a0, %hi(app)
	lw	a0, %lo(app)(a0)
	lw	s2, 4(a0)
	lui	a0, 786635
	addi	a0, a0, -1264
	add	s0, s2, a0
	lui	a0, 21
	addi	s4, a0, 384
	mv	a0, s0
	mv	a1, s4
	call	__udivsi3
	mv	s6, a0
	lui	a0, 1048555
	addi	a1, a0, -384
	mv	a0, s6
	call	__mulsi3
	add	s1, a0, s0
	mv	a0, s6
	call	_Z11computeDatej
	mv	a0, s3
	call	_Z10setDateStrPDi
	addi	s5, zero, 48
	lui	s0, 9
	addi	a0, s0, -863
	addi	s7, zero, 48
	bltu	s1, a0, .LBB41_2
# %bb.1:
	lui	a0, 786626
	addi	a0, a0, -401
	add	s1, s2, a0
	mv	a0, s6
	mv	a1, s4
	call	__mulsi3
	mv	s3, a0
	sub	a0, s1, a0
	addi	a1, s0, -864
	call	__udivsi3
	mv	s0, a0
	lui	a0, 1048567
	addi	a1, a0, 864
	mv	a0, s0
	call	__mulsi3
	add	a0, s1, a0
	addi	s7, s0, 49
	sub	a0, a0, s3
	addi	s1, a0, 1
.LBB41_2:
	lui	a1, 1
	addi	a0, a1, -495
	sw	s6, 8(sp)
	bltu	s1, a0, .LBB41_4
# %bb.3:
	lui	a0, 1048575
	addi	s3, a0, 496
	add	a0, s1, s3
	addi	a0, a0, -1
	addi	a1, a1, -496
	call	__udivsi3
	addi	s5, a0, 49
	mv	a1, s3
	call	__mulsi3
	add	a0, s1, a0
	add	s1, a0, s3
.LBB41_4:
	addi	a0, zero, 601
	addi	s6, zero, 48
	bltu	s1, a0, .LBB41_6
# %bb.5:
	addi	a0, s1, -601
	addi	a1, zero, 600
	call	__udivsi3
	addi	s4, a0, 49
	addi	a1, zero, -600
	call	__mulsi3
	add	a0, s1, a0
	addi	s1, a0, -600
	addi	a0, zero, 61
	bgeu	s1, a0, .LBB41_7
	j	.LBB41_8
.LBB41_6:
	addi	s4, zero, 48
	addi	a0, zero, 61
	bltu	s1, a0, .LBB41_8
.LBB41_7:
	addi	a0, s1, -61
	addi	a1, zero, 60
	call	__udivsi3
	addi	s6, a0, 49
	addi	a1, zero, -60
	call	__mulsi3
	add	a0, s1, a0
	addi	s1, a0, -60
.LBB41_8:
	addi	a0, zero, 11
	addi	s11, zero, 48
	bltu	s1, a0, .LBB41_10
# %bb.9:
	addi	a0, s1, -11
	addi	a1, zero, 10
	call	__udivsi3
	addi	s8, a0, 49
	addi	a1, zero, -10
	call	__mulsi3
	add	a0, s1, a0
	addi	s1, a0, -10
	addi	s0, zero, 1
	bltu	s0, s1, .LBB41_11
	j	.LBB41_12
.LBB41_10:
	addi	s8, zero, 48
	addi	s0, zero, 1
	bgeu	s0, s1, .LBB41_12
.LBB41_11:
	addi	s11, s1, 47
.LBB41_12:
	addi	a6, sp, 60
	addi	a7, sp, 16
	lui	t0, %hi(app)
	lui	s1, 524288
	addi	t1, zero, 58
	addi	t2, zero, 54
	addi	t3, zero, 52
	addi	t4, zero, 50
	addi	t5, sp, 12
	lui	s2, 655360
	addi	t6, zero, 42
	addi	s9, zero, 14
	addi	s10, zero, 8
	j	.LBB41_14
.LBB41_13:                              #   in Loop: Header=BB41_14 Depth=1
	andi	a0, s3, 1
	sw	t6, 12(s2)
	bnez	a0, .LBB41_47
.LBB41_14:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB41_17 Depth 2
                                        #     Child Loop BB41_21 Depth 2
                                        #     Child Loop BB41_39 Depth 2
                                        #     Child Loop BB41_45 Depth 2
	lw	a0, %lo(app)(t0)
	lw	a1, 0(s1)
	beqz	a1, .LBB41_19
# %bb.15:                               #   in Loop: Header=BB41_14 Depth=1
	lw	a1, 8(a0)
	j	.LBB41_17
.LBB41_16:                              #   in Loop: Header=BB41_17 Depth=2
	lw	a2, 0(s1)
	beqz	a2, .LBB41_19
.LBB41_17:                              #   Parent Loop BB41_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	a1, a1, 1
	sw	a1, 8(a0)
	sw	s0, 16(a0)
	bne	a1, s10, .LBB41_16
# %bb.18:                               #   in Loop: Header=BB41_17 Depth=2
	lw	a2, 4(a0)
	mv	a1, zero
	addi	a2, a2, 1
	sw	a2, 4(a0)
	sw	zero, 8(a0)
	j	.LBB41_16
.LBB41_19:                              #   in Loop: Header=BB41_14 Depth=1
	lw	a1, 12(a0)
	mv	s3, zero
	j	.LBB41_21
.LBB41_20:                              #   in Loop: Header=BB41_21 Depth=2
	sw	zero, 12(a0)
	xori	a1, a1, 37
	seqz	a1, a1
	or	s3, s3, a1
	mv	a1, zero
.LBB41_21:                              #   Parent Loop BB41_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	bnez	a1, .LBB41_20
# %bb.22:                               #   in Loop: Header=BB41_21 Depth=2
	lw	a1, 8(s1)
	sw	a1, 12(a0)
	bnez	a1, .LBB41_20
# %bb.23:                               #   in Loop: Header=BB41_14 Depth=1
	addi	s11, s11, 1
	bne	s11, t1, .LBB41_35
# %bb.24:                               #   in Loop: Header=BB41_14 Depth=1
	addi	s8, s8, 1
	addi	s11, zero, 48
	bne	s8, t2, .LBB41_35
# %bb.25:                               #   in Loop: Header=BB41_14 Depth=1
	addi	s6, s6, 1
	addi	s11, zero, 48
	beq	s6, t1, .LBB41_27
# %bb.26:                               #   in Loop: Header=BB41_14 Depth=1
	addi	s8, zero, 48
	j	.LBB41_35
.LBB41_27:                              #   in Loop: Header=BB41_14 Depth=1
	addi	s4, s4, 1
	addi	s11, zero, 48
	bne	s4, t2, .LBB41_32
# %bb.28:                               #   in Loop: Header=BB41_14 Depth=1
	addi	s5, s5, 1
	beq	s5, t1, .LBB41_33
# %bb.29:                               #   in Loop: Header=BB41_14 Depth=1
	addi	s11, zero, 48
	bne	s5, t3, .LBB41_34
# %bb.30:                               #   in Loop: Header=BB41_14 Depth=1
	bne	s7, t4, .LBB41_34
# %bb.31:                               #   in Loop: Header=BB41_14 Depth=1
	lw	a0, 8(sp)
	addi	a0, a0, 1
	sw	a0, 8(sp)
	mv	s4, a6
	mv	s5, a7
	mv	s6, t5
	call	_Z11computeDatej
	mv	a0, s6
	call	_Z10setDateStrPDi
	addi	t6, zero, 42
	mv	t5, s6
	addi	t4, zero, 50
	addi	t3, zero, 52
	addi	t2, zero, 54
	addi	t1, zero, 58
	lui	t0, %hi(app)
	mv	a7, s5
	mv	a6, s4
	addi	s11, zero, 48
	addi	s8, zero, 48
	addi	s6, zero, 48
	addi	s4, zero, 48
	addi	s5, zero, 48
	addi	s7, zero, 48
	j	.LBB41_35
.LBB41_32:                              #   in Loop: Header=BB41_14 Depth=1
	addi	s8, zero, 48
	addi	s6, zero, 48
	j	.LBB41_35
.LBB41_33:                              #   in Loop: Header=BB41_14 Depth=1
	addi	s7, s7, 1
	addi	s11, zero, 48
	addi	s8, zero, 48
	addi	s6, zero, 48
	addi	s4, zero, 48
	addi	s5, zero, 48
	j	.LBB41_35
.LBB41_34:                              #   in Loop: Header=BB41_14 Depth=1
	addi	s8, zero, 48
	addi	s6, zero, 48
	addi	s4, zero, 48
.LBB41_35:                              #   in Loop: Header=BB41_14 Depth=1
	sw	s7, 56(sp)
	sw	s5, 60(sp)
	sw	s4, 68(sp)
	sw	s6, 72(sp)
	sw	s8, 80(sp)
	sw	s11, 84(sp)
	beqz	s7, .LBB41_41
# %bb.36:                               #   in Loop: Header=BB41_14 Depth=1
	mv	a2, zero
	addi	a0, zero, 46
	addi	a3, zero, 22
	mv	a1, a6
	mv	a4, s7
	j	.LBB41_39
.LBB41_37:                              #   in Loop: Header=BB41_39 Depth=2
	addi	a3, a3, 7
.LBB41_38:                              #   in Loop: Header=BB41_39 Depth=2
	lw	a4, 0(a1)
	addi	a1, a1, 4
	beqz	a4, .LBB41_41
.LBB41_39:                              #   Parent Loop BB41_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a5, a0, 8
	add	a5, a5, a3
	slli	a5, a5, 8
	ori	a5, a5, 1
	sw	a5, 12(s2)
	slli	a4, a4, 8
	ori	a4, a4, 5
	addi	a2, a2, 1
	sw	a4, 12(s2)
	bne	a2, s9, .LBB41_37
# %bb.40:                               #   in Loop: Header=BB41_39 Depth=2
	mv	a2, zero
	addi	a0, a0, 7
	addi	a3, zero, 22
	j	.LBB41_38
.LBB41_41:                              #   in Loop: Header=BB41_14 Depth=1
	lw	a4, 12(sp)
	beqz	a4, .LBB41_13
# %bb.42:                               #   in Loop: Header=BB41_14 Depth=1
	mv	a2, zero
	addi	a0, zero, 20
	addi	a3, zero, 15
	mv	a1, a7
	j	.LBB41_45
.LBB41_43:                              #   in Loop: Header=BB41_45 Depth=2
	addi	a3, a3, 7
.LBB41_44:                              #   in Loop: Header=BB41_45 Depth=2
	lw	a4, 0(a1)
	addi	a1, a1, 4
	beqz	a4, .LBB41_13
.LBB41_45:                              #   Parent Loop BB41_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a5, a0, 8
	add	a5, a5, a3
	slli	a5, a5, 8
	ori	a5, a5, 1
	sw	a5, 12(s2)
	slli	a4, a4, 8
	ori	a4, a4, 5
	addi	a2, a2, 1
	sw	a4, 12(s2)
	bne	a2, s9, .LBB41_43
# %bb.46:                               #   in Loop: Header=BB41_45 Depth=2
	mv	a2, zero
	addi	a0, a0, 7
	addi	a3, zero, 15
	j	.LBB41_44
.LBB41_47:
	lw	s11, 92(sp)
	lw	s10, 96(sp)
	lw	s9, 100(sp)
	lw	s8, 104(sp)
	lw	s7, 108(sp)
	lw	s6, 112(sp)
	lw	s5, 116(sp)
	lw	s4, 120(sp)
	lw	s3, 124(sp)
	lw	s2, 128(sp)
	lw	s1, 132(sp)
	lw	s0, 136(sp)
	lw	ra, 140(sp)
	addi	sp, sp, 144
	ret
.Lfunc_end41:
	.size	_Z12runClockFastv, .Lfunc_end41-_Z12runClockFastv
                                        # -- End function
	.globl	_ZplRK4VectS1_          # -- Begin function _ZplRK4VectS1_
	.p2align	2
	.type	_ZplRK4VectS1_,@function
_ZplRK4VectS1_:                         # @_ZplRK4VectS1_
# %bb.0:
	lw	a6, 0(a1)
	lw	a4, 0(a2)
	lw	a5, 4(a1)
	lw	a3, 4(a2)
	lw	a1, 8(a1)
	lw	a2, 8(a2)
	add	a4, a4, a6
	add	a3, a3, a5
	add	a1, a2, a1
	sw	a4, 0(a0)
	sw	a3, 4(a0)
	sw	a1, 8(a0)
	ret
.Lfunc_end42:
	.size	_ZplRK4VectS1_, .Lfunc_end42-_ZplRK4VectS1_
                                        # -- End function
	.globl	_ZmiRK4VectS1_          # -- Begin function _ZmiRK4VectS1_
	.p2align	2
	.type	_ZmiRK4VectS1_,@function
_ZmiRK4VectS1_:                         # @_ZmiRK4VectS1_
# %bb.0:
	lw	a6, 0(a1)
	lw	a4, 0(a2)
	lw	a5, 4(a1)
	lw	a3, 4(a2)
	lw	a1, 8(a1)
	lw	a2, 8(a2)
	sub	a4, a6, a4
	sub	a3, a5, a3
	sub	a1, a1, a2
	sw	a4, 0(a0)
	sw	a3, 4(a0)
	sw	a1, 8(a0)
	ret
.Lfunc_end43:
	.size	_ZmiRK4VectS1_, .Lfunc_end43-_ZmiRK4VectS1_
                                        # -- End function
	.globl	_Z3dotRK4VectS1_        # -- Begin function _Z3dotRK4VectS1_
	.p2align	2
	.type	_Z3dotRK4VectS1_,@function
_Z3dotRK4VectS1_:                       # @_Z3dotRK4VectS1_
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	sw	s2, 0(sp)
	mv	s0, a1
	mv	s1, a0
	lw	a1, 0(a0)
	lw	a0, 0(s0)
	call	__mulsi3
	lw	a1, 4(s1)
	lw	a2, 4(s0)
	mv	s2, a0
	mv	a0, a2
	call	__mulsi3
	lw	a1, 8(s1)
	lw	a2, 8(s0)
	add	s0, a0, s2
	mv	a0, a2
	call	__mulsi3
	add	a0, s0, a0
	lw	s2, 0(sp)
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end44:
	.size	_Z3dotRK4VectS1_, .Lfunc_end44-_Z3dotRK4VectS1_
                                        # -- End function
	.globl	_Z12initGeometryv       # -- Begin function _Z12initGeometryv
	.p2align	2
	.type	_Z12initGeometryv,@function
_Z12initGeometryv:                      # @_Z12initGeometryv
# %bb.0:
	lui	a0, %hi(cameraPos)
	addi	a1, zero, -64
	sw	a1, %lo(cameraPos)(a0)
	addi	a0, a0, %lo(cameraPos)
	sw	zero, 4(a0)
	sw	zero, 8(a0)
	lui	a0, %hi(cameraVect)
	addi	a1, zero, 64
	sw	a1, %lo(cameraVect)(a0)
	addi	a0, a0, %lo(cameraVect)
	sw	zero, 4(a0)
	sw	zero, 8(a0)
	lui	a0, %hi(origin)
	sw	zero, %lo(origin)(a0)
	addi	a0, a0, %lo(origin)
	sw	zero, 4(a0)
	sw	zero, 8(a0)
	ret
.Lfunc_end45:
	.size	_Z12initGeometryv, .Lfunc_end45-_Z12initGeometryv
                                        # -- End function
	.globl	_Z12projOnScreenRK4Vect # -- Begin function _Z12projOnScreenRK4Vect
	.p2align	2
	.type	_Z12projOnScreenRK4Vect,@function
_Z12projOnScreenRK4Vect:                # @_Z12projOnScreenRK4Vect
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	mv	s0, a0
	lw	a0, 0(a0)
	lw	a1, 4(s0)
	addi	s1, a0, 64
	beqz	s1, .LBB46_2
# %bb.1:
	slli	a0, a1, 6
	mv	a1, s1
	call	__divsi3
	lw	a1, 8(s0)
	addi	s0, a0, 50
	slli	a0, a1, 6
	mv	a1, s1
	call	__divsi3
	addi	a1, zero, 50
	sub	a1, a1, a0
	j	.LBB46_3
.LBB46_2:
	addi	s0, zero, -64
.LBB46_3:
	mv	a0, s0
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end46:
	.size	_Z12projOnScreenRK4Vect, .Lfunc_end46-_Z12projOnScreenRK4Vect
                                        # -- End function
	.globl	_Z4drawRK8Trianglejjj   # -- Begin function _Z4drawRK8Trianglejjj
	.p2align	2
	.type	_Z4drawRK8Trianglejjj,@function
_Z4drawRK8Trianglejjj:                  # @_Z4drawRK8Trianglejjj
# %bb.0:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	sw	s1, 36(sp)
	sw	s2, 32(sp)
	sw	s3, 28(sp)
	sw	s4, 24(sp)
	sw	s5, 20(sp)
	sw	s6, 16(sp)
	sw	s7, 12(sp)
	sw	s8, 8(sp)
	mv	s1, a0
	lw	a0, 0(a0)
	lw	s7, 4(s1)
	mv	s4, a3
	mv	s3, a2
	mv	s2, a1
	addi	s0, a0, 64
	addi	s5, zero, -64
	beqz	s0, .LBB47_2
# %bb.1:
	slli	a0, s7, 6
	mv	a1, s0
	call	__divsi3
	lw	a1, 8(s1)
	addi	s6, a0, 50
	slli	a0, a1, 6
	mv	a1, s0
	call	__divsi3
	addi	a1, zero, 50
	sub	s7, a1, a0
	j	.LBB47_3
.LBB47_2:
	addi	s6, zero, -64
.LBB47_3:
	lw	a0, 12(s1)
	lw	s8, 16(s1)
	addi	s0, a0, 64
	beqz	s0, .LBB47_5
# %bb.4:
	slli	a0, s8, 6
	mv	a1, s0
	call	__divsi3
	lw	a1, 20(s1)
	addi	s5, a0, 50
	slli	a0, a1, 6
	mv	a1, s0
	call	__divsi3
	addi	a1, zero, 50
	sub	s8, a1, a0
.LBB47_5:
	lw	a1, 24(s1)
	lw	a0, 28(s1)
	addi	s0, a1, 64
	beqz	s0, .LBB47_7
# %bb.6:
	slli	a0, a0, 6
	mv	a1, s0
	call	__divsi3
	lw	a1, 32(s1)
	addi	s1, a0, 50
	slli	a0, a1, 6
	mv	a1, s0
	call	__divsi3
	addi	a1, zero, 50
	sub	a0, a1, a0
	j	.LBB47_8
.LBB47_7:
	addi	s1, zero, -64
.LBB47_8:
	slli	a1, s7, 8
	add	a1, a1, s6
	slli	a1, a1, 8
	ori	a1, a1, 1
	lui	a2, 655360
	sw	a1, 12(a2)
	slli	a1, s8, 8
	add	a1, a1, s5
	slli	a1, a1, 8
	ori	a1, a1, 7
	sw	a1, 12(a2)
	slli	a0, a0, 8
	add	a0, a0, s1
	slli	a0, a0, 8
	ori	a0, a0, 8
	sw	a0, 12(a2)
	slli	a0, s4, 8
	add	a0, a0, s3
	slli	a0, a0, 8
	add	a0, a0, s2
	slli	a0, a0, 8
	ori	a0, a0, 9
	sw	a0, 12(a2)
	lw	s8, 8(sp)
	lw	s7, 12(sp)
	lw	s6, 16(sp)
	lw	s5, 20(sp)
	lw	s4, 24(sp)
	lw	s3, 28(sp)
	lw	s2, 32(sp)
	lw	s1, 36(sp)
	lw	s0, 40(sp)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end47:
	.size	_Z4drawRK8Trianglejjj, .Lfunc_end47-_Z4drawRK8Trianglejjj
                                        # -- End function
	.globl	_Z13sortTrianglesP8TrianglePji # -- Begin function _Z13sortTrianglesP8TrianglePji
	.p2align	2
	.type	_Z13sortTrianglesP8TrianglePji,@function
_Z13sortTrianglesP8TrianglePji:         # @_Z13sortTrianglesP8TrianglePji
# %bb.0:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	sw	s1, 36(sp)
	sw	s2, 32(sp)
	sw	s3, 28(sp)
	sw	s4, 24(sp)
	sw	s5, 20(sp)
	sw	s6, 16(sp)
	sw	s7, 12(sp)
	sw	s8, 8(sp)
	sw	s9, 4(sp)
	sw	s10, 0(sp)
	addi	a3, zero, 2
	blt	a2, a3, .LBB48_11
# %bb.1:
	mv	s2, a1
	mv	s3, a0
	addi	s4, zero, 1
	addi	s5, zero, 8
	j	.LBB48_3
.LBB48_2:                               #   in Loop: Header=BB48_3 Depth=1
	sub	a0, s8, s2
	srai	a2, a0, 2
	mv	a0, s3
	mv	a1, s2
	call	_Z13sortTrianglesP8TrianglePji
	addi	s2, s8, 4
	sub	a0, s6, s8
	srai	a1, a0, 2
	addi	a2, a1, -1
	bge	s5, a0, .LBB48_11
.LBB48_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB48_8 Depth 2
	slli	a0, a2, 1
	andi	a0, a0, -4
	add	a0, s2, a0
	lw	a1, 0(a0)
	lw	a3, 0(s2)
	sw	a1, 0(s2)
	sw	a3, 0(a0)
	slli	a0, a2, 2
	add	s6, s2, a0
	mv	s8, s2
	beq	a2, s4, .LBB48_2
# %bb.4:                                #   in Loop: Header=BB48_3 Depth=1
	lw	s7, 0(s2)
	addi	s1, a0, -4
	mv	s0, s2
	mv	s8, s2
	j	.LBB48_8
.LBB48_5:                               #   in Loop: Header=BB48_8 Depth=2
	sw	a0, 4(s0)
	lw	s7, 0(s8)
	sw	s9, 4(s8)
.LBB48_6:                               #   in Loop: Header=BB48_8 Depth=2
	sw	s7, 4(s8)
	addi	a0, s8, 4
	sw	s9, 0(s8)
	mv	s8, a0
.LBB48_7:                               #   in Loop: Header=BB48_8 Depth=2
	addi	s1, s1, -4
	addi	s0, s0, 4
	beqz	s1, .LBB48_2
.LBB48_8:                               #   Parent Loop BB48_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	s9, 4(s0)
	addi	a1, zero, 40
	mv	a0, s9
	call	__mulsi3
	add	a0, s3, a0
	lw	s10, 36(a0)
	addi	a1, zero, 40
	mv	a0, s7
	call	__mulsi3
	add	a0, s3, a0
	lw	a0, 36(a0)
	bge	s10, a0, .LBB48_7
# %bb.9:                                #   in Loop: Header=BB48_8 Depth=2
	lw	a0, 4(s8)
	bne	s0, s8, .LBB48_5
# %bb.10:                               #   in Loop: Header=BB48_8 Depth=2
	mv	s9, a0
	j	.LBB48_6
.LBB48_11:
	lw	s10, 0(sp)
	lw	s9, 4(sp)
	lw	s8, 8(sp)
	lw	s7, 12(sp)
	lw	s6, 16(sp)
	lw	s5, 20(sp)
	lw	s4, 24(sp)
	lw	s3, 28(sp)
	lw	s2, 32(sp)
	lw	s1, 36(sp)
	lw	s0, 40(sp)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end48:
	.size	_Z13sortTrianglesP8TrianglePji, .Lfunc_end48-_Z13sortTrianglesP8TrianglePji
                                        # -- End function
	.globl	_Z13cos32_computei      # -- Begin function _Z13cos32_computei
	.p2align	2
	.type	_Z13cos32_computei,@function
_Z13cos32_computei:                     # @_Z13cos32_computei
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	mv	a1, a0
	call	__mulsi3
	mv	s0, a0
	lui	s1, 1
	addi	a1, s1, -1685
	call	__mulsi3
	addi	s1, s1, -813
	mv	a1, s1
	call	__udivsi3
	lui	a1, 1048569
	addi	a1, a1, -1445
	add	a0, a0, a1
	mv	a1, s0
	call	__mulsi3
	mv	a1, s1
	call	__divsi3
	lui	a1, 16
	addi	a1, a1, -40
	add	a0, a0, a1
	srai	a0, a0, 6
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end49:
	.size	_Z13cos32_computei, .Lfunc_end49-_Z13cos32_computei
                                        # -- End function
	.globl	_Z5cos32i               # -- Begin function _Z5cos32i
	.p2align	2
	.type	_Z5cos32i,@function
_Z5cos32i:                              # @_Z5cos32i
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	sw	s4, 8(sp)
	addi	a1, zero, -1
	addi	a2, zero, 360
	j	.LBB50_2
.LBB50_1:                               #   in Loop: Header=BB50_2 Depth=1
	add	a0, a0, a3
.LBB50_2:                               # =>This Inner Loop Header: Depth=1
	addi	a3, zero, 360
	bge	a1, a0, .LBB50_1
# %bb.3:                                #   in Loop: Header=BB50_2 Depth=1
	addi	a3, zero, -360
	blt	a2, a0, .LBB50_1
# %bb.4:
	lui	a1, 1048569
	addi	s3, a1, -1445
	lui	a1, 16
	addi	s2, a1, -40
	lui	s0, 1
	addi	a1, zero, 271
	addi	s4, s0, -1685
	blt	a0, a1, .LBB50_6
# %bb.5:
	addi	a1, zero, 360
	sub	a0, a1, a0
	mv	a1, a0
	call	__mulsi3
	mv	s1, a0
	mv	a1, s4
	call	__mulsi3
	addi	s0, s0, -813
	j	.LBB50_12
.LBB50_6:
	addi	a1, zero, 181
	blt	a0, a1, .LBB50_8
# %bb.7:
	addi	a0, a0, -180
	j	.LBB50_10
.LBB50_8:
	addi	a1, zero, 91
	blt	a0, a1, .LBB50_11
# %bb.9:
	addi	a1, zero, 180
	sub	a0, a1, a0
.LBB50_10:
	mv	a1, a0
	call	__mulsi3
	mv	s1, a0
	mv	a1, s4
	call	__mulsi3
	lui	a1, 1
	addi	s0, a1, -813
	mv	a1, s0
	call	__udivsi3
	add	a0, a0, s3
	mv	a1, s1
	call	__mulsi3
	mv	a1, s0
	call	__divsi3
	add	a0, a0, s2
	srai	a0, a0, 6
	neg	a0, a0
	j	.LBB50_13
.LBB50_11:
	mv	a1, a0
	call	__mulsi3
	mv	s1, a0
	mv	a1, s4
	call	__mulsi3
	lui	a1, 1
	addi	s0, a1, -813
.LBB50_12:
	mv	a1, s0
	call	__udivsi3
	add	a0, a0, s3
	mv	a1, s1
	call	__mulsi3
	mv	a1, s0
	call	__divsi3
	add	a0, a0, s2
	srai	a0, a0, 6
.LBB50_13:
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end50:
	.size	_Z5cos32i, .Lfunc_end50-_Z5cos32i
                                        # -- End function
	.globl	_Z5sin32i               # -- Begin function _Z5sin32i
	.p2align	2
	.type	_Z5sin32i,@function
_Z5sin32i:                              # @_Z5sin32i
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	sw	s4, 8(sp)
	addi	a1, zero, 90
	sub	a0, a1, a0
	addi	a1, zero, -1
	addi	a2, zero, 360
	j	.LBB51_2
.LBB51_1:                               #   in Loop: Header=BB51_2 Depth=1
	add	a0, a0, a3
.LBB51_2:                               # =>This Inner Loop Header: Depth=1
	addi	a3, zero, 360
	bge	a1, a0, .LBB51_1
# %bb.3:                                #   in Loop: Header=BB51_2 Depth=1
	addi	a3, zero, -360
	blt	a2, a0, .LBB51_1
# %bb.4:
	lui	a1, 1048569
	addi	s3, a1, -1445
	lui	a1, 16
	addi	s2, a1, -40
	lui	s0, 1
	addi	a1, zero, 271
	addi	s4, s0, -1685
	blt	a0, a1, .LBB51_6
# %bb.5:
	addi	a1, zero, 360
	sub	a0, a1, a0
	mv	a1, a0
	call	__mulsi3
	mv	s1, a0
	mv	a1, s4
	call	__mulsi3
	addi	s0, s0, -813
	j	.LBB51_12
.LBB51_6:
	addi	a1, zero, 181
	blt	a0, a1, .LBB51_8
# %bb.7:
	addi	a0, a0, -180
	j	.LBB51_10
.LBB51_8:
	addi	a1, zero, 91
	blt	a0, a1, .LBB51_11
# %bb.9:
	addi	a1, zero, 180
	sub	a0, a1, a0
.LBB51_10:
	mv	a1, a0
	call	__mulsi3
	mv	s1, a0
	mv	a1, s4
	call	__mulsi3
	lui	a1, 1
	addi	s0, a1, -813
	mv	a1, s0
	call	__udivsi3
	add	a0, a0, s3
	mv	a1, s1
	call	__mulsi3
	mv	a1, s0
	call	__divsi3
	add	a0, a0, s2
	srai	a0, a0, 6
	neg	a0, a0
	j	.LBB51_13
.LBB51_11:
	mv	a1, a0
	call	__mulsi3
	mv	s1, a0
	mv	a1, s4
	call	__mulsi3
	lui	a1, 1
	addi	s0, a1, -813
.LBB51_12:
	mv	a1, s0
	call	__udivsi3
	add	a0, a0, s3
	mv	a1, s1
	call	__mulsi3
	mv	a1, s0
	call	__divsi3
	add	a0, a0, s2
	srai	a0, a0, 6
.LBB51_13:
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end51:
	.size	_Z5sin32i, .Lfunc_end51-_Z5sin32i
                                        # -- End function
	.globl	_Z13applyRotationP8TriangleS0_j4Vecti # -- Begin function _Z13applyRotationP8TriangleS0_j4Vecti
	.p2align	2
	.type	_Z13applyRotationP8TriangleS0_j4Vecti,@function
_Z13applyRotationP8TriangleS0_j4Vecti:  # @_Z13applyRotationP8TriangleS0_j4Vecti
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
	mv	s6, a4
	mv	s2, a3
	mv	s3, a2
	mv	s8, a1
	mv	s7, a0
	addi	a1, zero, -1
	addi	a2, zero, 360
	mv	a0, a4
	j	.LBB52_2
.LBB52_1:                               #   in Loop: Header=BB52_2 Depth=1
	add	a0, a0, a3
.LBB52_2:                               # =>This Inner Loop Header: Depth=1
	addi	a3, zero, 360
	bge	a1, a0, .LBB52_1
# %bb.3:                                #   in Loop: Header=BB52_2 Depth=1
	addi	a3, zero, -360
	blt	a2, a0, .LBB52_1
# %bb.4:
	lui	a1, 1048569
	addi	s0, a1, -1445
	lui	a1, 16
	addi	s9, a1, -40
	lui	s1, 1
	addi	a1, zero, 271
	addi	s5, s1, -1685
	blt	a0, a1, .LBB52_6
# %bb.5:
	addi	a1, zero, 360
	sub	a0, a1, a0
	mv	a1, a0
	call	__mulsi3
	mv	s4, a0
	mv	a1, s5
	call	__mulsi3
	addi	s1, s1, -813
	j	.LBB52_12
.LBB52_6:
	addi	a1, zero, 181
	blt	a0, a1, .LBB52_8
# %bb.7:
	addi	a0, a0, -180
	j	.LBB52_10
.LBB52_8:
	addi	a1, zero, 91
	blt	a0, a1, .LBB52_11
# %bb.9:
	addi	a1, zero, 180
	sub	a0, a1, a0
.LBB52_10:
	mv	a1, a0
	call	__mulsi3
	mv	s4, a0
	mv	a1, s5
	call	__mulsi3
	lui	a1, 1
	addi	s1, a1, -813
	mv	a1, s1
	call	__udivsi3
	add	a0, a0, s0
	mv	a1, s4
	call	__mulsi3
	mv	a1, s1
	call	__divsi3
	add	a0, a0, s9
	srai	a0, a0, 6
	neg	s11, a0
	j	.LBB52_13
.LBB52_11:
	mv	a1, a0
	call	__mulsi3
	mv	s4, a0
	mv	a1, s5
	call	__mulsi3
	lui	a1, 1
	addi	s1, a1, -813
.LBB52_12:
	mv	a1, s1
	call	__udivsi3
	add	a0, a0, s0
	mv	a1, s4
	call	__mulsi3
	mv	a1, s1
	call	__divsi3
	add	a0, a0, s9
	srai	s11, a0, 6
.LBB52_13:
	addi	a0, zero, 90
	sub	a0, a0, s6
	addi	a1, zero, -1
	addi	a2, zero, 360
	j	.LBB52_15
.LBB52_14:                              #   in Loop: Header=BB52_15 Depth=1
	add	a0, a0, a3
.LBB52_15:                              # =>This Inner Loop Header: Depth=1
	addi	a3, zero, 360
	bge	a1, a0, .LBB52_14
# %bb.16:                               #   in Loop: Header=BB52_15 Depth=1
	addi	a3, zero, -360
	blt	a2, a0, .LBB52_14
# %bb.17:
	addi	a1, zero, 271
	blt	a0, a1, .LBB52_19
# %bb.18:
	addi	a1, zero, 360
	sub	a0, a1, a0
	j	.LBB52_24
.LBB52_19:
	addi	a1, zero, 181
	blt	a0, a1, .LBB52_21
# %bb.20:
	addi	a0, a0, -180
	j	.LBB52_23
.LBB52_21:
	addi	a1, zero, 91
	blt	a0, a1, .LBB52_24
# %bb.22:
	addi	a1, zero, 180
	sub	a0, a1, a0
.LBB52_23:
	mv	a1, a0
	call	__mulsi3
	mv	s6, a0
	mv	a1, s5
	call	__mulsi3
	lui	a1, 1
	addi	s1, a1, -813
	mv	a1, s1
	call	__udivsi3
	add	a0, a0, s0
	mv	a1, s6
	call	__mulsi3
	mv	a1, s1
	call	__divsi3
	add	a0, a0, s9
	srai	a0, a0, 6
	neg	s5, a0
	bnez	s3, .LBB52_25
	j	.LBB52_26
.LBB52_24:
	mv	a1, a0
	call	__mulsi3
	mv	s6, a0
	mv	a1, s5
	call	__mulsi3
	lui	a1, 1
	addi	s1, a1, -813
	mv	a1, s1
	call	__udivsi3
	add	a0, a0, s0
	mv	a1, s6
	call	__mulsi3
	mv	a1, s1
	call	__divsi3
	add	a0, a0, s9
	srai	s5, a0, 6
	beqz	s3, .LBB52_26
.LBB52_25:                              # =>This Inner Loop Header: Depth=1
	lw	a0, 0(s7)
	lw	s1, 0(s2)
	lw	a1, 4(s7)
	lw	s10, 4(s2)
	sub	s0, a0, s1
	sub	s6, a1, s10
	mv	a0, s0
	mv	a1, s11
	call	__mulsi3
	mv	s9, a0
	mv	a0, s6
	mv	a1, s5
	call	__mulsi3
	sub	a0, s9, a0
	srai	a0, a0, 10
	add	a0, a0, s1
	sw	a0, 8(sp)
	sw	a0, 0(s8)
	mv	a0, s0
	mv	a1, s5
	call	__mulsi3
	mv	s0, a0
	mv	a0, s6
	mv	a1, s11
	call	__mulsi3
	add	a0, a0, s0
	srai	a0, a0, 10
	add	a0, a0, s10
	sw	a0, 4(s8)
	lw	a0, 8(s7)
	sw	a0, 8(s8)
	lw	a0, 12(s7)
	lw	s1, 0(s2)
	lw	a1, 16(s7)
	mv	s9, s11
	lw	s11, 4(s2)
	sub	s0, a0, s1
	sub	s6, a1, s11
	mv	a0, s0
	mv	a1, s9
	call	__mulsi3
	mv	s10, a0
	mv	a0, s6
	mv	a1, s5
	call	__mulsi3
	sub	a0, s10, a0
	srai	a0, a0, 10
	add	s10, a0, s1
	sw	s10, 12(s8)
	mv	a0, s0
	mv	a1, s5
	call	__mulsi3
	mv	s0, a0
	mv	a0, s6
	mv	a1, s9
	call	__mulsi3
	add	a0, a0, s0
	srai	a0, a0, 10
	add	a0, a0, s11
	sw	a0, 16(s8)
	lw	a0, 20(s7)
	sw	a0, 20(s8)
	lw	a0, 24(s7)
	lw	s1, 0(s2)
	lw	a1, 28(s7)
	mv	s4, s3
	mv	s3, s2
	lw	s2, 4(s2)
	sub	s0, a0, s1
	sub	s6, a1, s2
	mv	a0, s0
	mv	a1, s9
	call	__mulsi3
	mv	s11, a0
	mv	a0, s6
	mv	a1, s5
	call	__mulsi3
	sub	a0, s11, a0
	mv	s11, s9
	srai	a0, a0, 10
	add	s1, a0, s1
	sw	s1, 24(s8)
	mv	a0, s0
	mv	a1, s5
	call	__mulsi3
	mv	s0, a0
	mv	a0, s6
	mv	a1, s9
	call	__mulsi3
	add	a0, a0, s0
	srai	a0, a0, 10
	add	a0, a0, s2
	mv	s2, s3
	mv	s3, s4
	sw	a0, 28(s8)
	lw	a0, 32(s7)
	sw	a0, 32(s8)
	lw	a0, 8(sp)
	add	a0, s10, a0
	add	a0, a0, s1
	sw	a0, 36(s8)
	addi	s3, s4, -1
	addi	s7, s7, 40
	addi	s8, s8, 40
	bnez	s3, .LBB52_25
.LBB52_26:
	lw	s11, 12(sp)
	lw	s10, 16(sp)
	lw	s9, 20(sp)
	lw	s8, 24(sp)
	lw	s7, 28(sp)
	lw	s6, 32(sp)
	lw	s5, 36(sp)
	lw	s4, 40(sp)
	lw	s3, 44(sp)
	lw	s2, 48(sp)
	lw	s1, 52(sp)
	lw	s0, 56(sp)
	lw	ra, 60(sp)
	addi	sp, sp, 64
	ret
.Lfunc_end52:
	.size	_Z13applyRotationP8TriangleS0_j4Vecti, .Lfunc_end52-_Z13applyRotationP8TriangleS0_j4Vecti
                                        # -- End function
	.globl	_Z8getLightRK8Triangle  # -- Begin function _Z8getLightRK8Triangle
	.p2align	2
	.type	_Z8getLightRK8Triangle,@function
_Z8getLightRK8Triangle:                 # @_Z8getLightRK8Triangle
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	lw	a5, 0(a0)
	lw	a4, 12(a0)
	lw	a2, 16(a0)
	lw	a1, 4(a0)
	mv	s1, a2
	mv	s0, a4
	blt	a4, a5, .LBB53_2
# %bb.1:
	mv	s1, a1
	mv	s0, a5
.LBB53_2:
	blt	a5, a4, .LBB53_4
# %bb.3:
	mv	a2, a1
	mv	a4, a5
.LBB53_4:
	lw	a1, 24(a0)
	lw	a5, 28(a0)
	mv	a3, a5
	mv	a0, a1
	blt	a1, s0, .LBB53_6
# %bb.5:
	mv	a3, s1
	mv	a0, s0
.LBB53_6:
	blt	a4, a1, .LBB53_8
# %bb.7:
	mv	a5, a2
	mv	a1, a4
.LBB53_8:
	sub	a0, a1, a0
	sub	s1, a5, a3
	mv	a1, a0
	call	__mulsi3
	mv	s0, a0
	mv	a0, s1
	mv	a1, s1
	call	__mulsi3
	mv	s1, a0
	or	a0, s0, a0
	beqz	a0, .LBB53_12
# %bb.9:
	addi	a1, zero, 250
	mv	a0, s1
	call	__mulsi3
	add	a1, s0, s1
	call	__udivsi3
	addi	a1, zero, 200
	blt	a0, a1, .LBB53_11
# %bb.10:
	addi	a0, zero, 200
.LBB53_11:
	addi	a0, a0, 55
	j	.LBB53_13
.LBB53_12:
	addi	a0, zero, 255
.LBB53_13:
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end53:
	.size	_Z8getLightRK8Triangle, .Lfunc_end53-_Z8getLightRK8Triangle
                                        # -- End function
	.globl	_Z13drawTrianglesPK8TrianglePKjj # -- Begin function _Z13drawTrianglesPK8TrianglePKjj
	.p2align	2
	.type	_Z13drawTrianglesPK8TrianglePKjj,@function
_Z13drawTrianglesPK8TrianglePKjj:       # @_Z13drawTrianglesPK8TrianglePKjj
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
	addi	s6, a2, -1
	sw	a0, 8(sp)
	bltz	s6, .LBB54_28
# %bb.1:
	slli	a0, s6, 2
	add	s7, a1, a0
	j	.LBB54_5
.LBB54_2:                               #   in Loop: Header=BB54_5 Depth=1
	mv	a0, s5
	mv	a1, zero
	mv	a2, zero
.LBB54_3:                               #   in Loop: Header=BB54_5 Depth=1
	call	_Z4drawRK8Trianglejjj
.LBB54_4:                               #   in Loop: Header=BB54_5 Depth=1
	addi	s6, s6, -1
	addi	s7, s7, -4
	addi	a0, zero, -1
	bge	a0, s6, .LBB54_28
.LBB54_5:                               # =>This Inner Loop Header: Depth=1
	lw	s4, 0(s7)
	addi	a1, zero, 40
	mv	a0, s4
	call	__mulsi3
	lw	a1, 8(sp)
	add	s5, a1, a0
	lw	s3, 0(s5)
	lw	s2, 12(s5)
	lw	s10, 16(s5)
	lw	s8, 4(s5)
	mv	a0, s10
	mv	a2, s2
	blt	s2, s3, .LBB54_7
# %bb.6:                                #   in Loop: Header=BB54_5 Depth=1
	mv	a0, s8
	mv	a2, s3
.LBB54_7:                               #   in Loop: Header=BB54_5 Depth=1
	mv	a1, s10
	mv	a3, s2
	blt	s3, s2, .LBB54_9
# %bb.8:                                #   in Loop: Header=BB54_5 Depth=1
	mv	a1, s8
	mv	a3, s3
.LBB54_9:                               #   in Loop: Header=BB54_5 Depth=1
	lw	s9, 24(s5)
	lw	s11, 28(s5)
	mv	a4, s11
	mv	a5, s9
	blt	s9, a2, .LBB54_11
# %bb.10:                               #   in Loop: Header=BB54_5 Depth=1
	mv	a4, a0
	mv	a5, a2
.LBB54_11:                              #   in Loop: Header=BB54_5 Depth=1
	mv	a2, s11
	mv	a0, s9
	blt	a3, s9, .LBB54_13
# %bb.12:                               #   in Loop: Header=BB54_5 Depth=1
	mv	a2, a1
	mv	a0, a3
.LBB54_13:                              #   in Loop: Header=BB54_5 Depth=1
	sub	a0, a0, a5
	sub	s0, a2, a4
	mv	a1, a0
	call	__mulsi3
	mv	s1, a0
	mv	a0, s0
	mv	a1, s0
	call	__mulsi3
	mv	s0, a0
	or	a0, s1, a0
	beqz	a0, .LBB54_22
# %bb.14:                               #   in Loop: Header=BB54_5 Depth=1
	addi	a1, zero, 250
	mv	a0, s0
	call	__mulsi3
	add	a1, s1, s0
	call	__udivsi3
	addi	a1, zero, 200
	blt	a0, a1, .LBB54_16
# %bb.15:                               #   in Loop: Header=BB54_5 Depth=1
	addi	a0, zero, 200
.LBB54_16:                              #   in Loop: Header=BB54_5 Depth=1
	addi	a3, a0, 55
	addi	a0, zero, 3
	bltu	a0, s4, .LBB54_23
.LBB54_17:                              #   in Loop: Header=BB54_5 Depth=1
	addi	s0, s3, 64
	addi	s3, zero, -64
	sw	a3, 4(sp)
	beqz	s0, .LBB54_25
# %bb.18:                               #   in Loop: Header=BB54_5 Depth=1
	slli	a0, s8, 6
	mv	a1, s0
	call	__divsi3
	addi	s5, a0, 50
	addi	a1, zero, 40
	mv	a0, s4
	call	__mulsi3
	lw	a1, 8(sp)
	add	a0, a1, a0
	lw	a0, 8(a0)
	slli	a0, a0, 6
	mv	a1, s0
	call	__divsi3
	addi	a1, zero, 50
	sub	s8, a1, a0
	addi	s0, s2, 64
	beqz	s0, .LBB54_20
.LBB54_19:                              #   in Loop: Header=BB54_5 Depth=1
	slli	a0, s10, 6
	mv	a1, s0
	call	__divsi3
	addi	s3, a0, 50
	addi	a1, zero, 40
	mv	a0, s4
	call	__mulsi3
	lw	a1, 8(sp)
	add	a0, a1, a0
	lw	a0, 20(a0)
	slli	a0, a0, 6
	mv	a1, s0
	call	__divsi3
	addi	a1, zero, 50
	sub	s10, a1, a0
.LBB54_20:                              #   in Loop: Header=BB54_5 Depth=1
	addi	s0, s9, 64
	beqz	s0, .LBB54_26
# %bb.21:                               #   in Loop: Header=BB54_5 Depth=1
	slli	a0, s11, 6
	mv	a1, s0
	call	__divsi3
	addi	s1, a0, 50
	addi	a1, zero, 40
	mv	a0, s4
	call	__mulsi3
	lw	a1, 8(sp)
	add	a0, a1, a0
	lw	a0, 32(a0)
	slli	a0, a0, 6
	mv	a1, s0
	call	__divsi3
	addi	a1, zero, 50
	sub	s11, a1, a0
	j	.LBB54_27
.LBB54_22:                              #   in Loop: Header=BB54_5 Depth=1
	addi	a3, zero, 255
	addi	a0, zero, 3
	bgeu	a0, s4, .LBB54_17
.LBB54_23:                              #   in Loop: Header=BB54_5 Depth=1
	addi	a0, zero, 7
	bltu	a0, s4, .LBB54_2
# %bb.24:                               #   in Loop: Header=BB54_5 Depth=1
	mv	a0, s5
	mv	a1, zero
	mv	a2, a3
	mv	a3, zero
	j	.LBB54_3
.LBB54_25:                              #   in Loop: Header=BB54_5 Depth=1
	addi	s5, zero, -64
	addi	s0, s2, 64
	bnez	s0, .LBB54_19
	j	.LBB54_20
.LBB54_26:                              #   in Loop: Header=BB54_5 Depth=1
	addi	s1, zero, -64
.LBB54_27:                              #   in Loop: Header=BB54_5 Depth=1
	lw	a2, 4(sp)
	slli	a0, s8, 8
	add	a0, a0, s5
	slli	a0, a0, 8
	ori	a0, a0, 1
	lui	a1, 655360
	sw	a0, 12(a1)
	slli	a0, s10, 8
	add	a0, a0, s3
	slli	a0, a0, 8
	ori	a0, a0, 7
	sw	a0, 12(a1)
	slli	a0, s11, 8
	add	a0, a0, s1
	slli	a0, a0, 8
	ori	a0, a0, 8
	sw	a0, 12(a1)
	slli	a0, a2, 8
	ori	a0, a0, 9
	sw	a0, 12(a1)
	j	.LBB54_4
.LBB54_28:
	lw	s11, 12(sp)
	lw	s10, 16(sp)
	lw	s9, 20(sp)
	lw	s8, 24(sp)
	lw	s7, 28(sp)
	lw	s6, 32(sp)
	lw	s5, 36(sp)
	lw	s4, 40(sp)
	lw	s3, 44(sp)
	lw	s2, 48(sp)
	lw	s1, 52(sp)
	lw	s0, 56(sp)
	lw	ra, 60(sp)
	addi	sp, sp, 64
	ret
.Lfunc_end54:
	.size	_Z13drawTrianglesPK8TrianglePKjj, .Lfunc_end54-_Z13drawTrianglesPK8TrianglePKjj
                                        # -- End function
	.globl	_Z9applyMoveP8Trianglejiii # -- Begin function _Z9applyMoveP8Trianglejiii
	.p2align	2
	.type	_Z9applyMoveP8Trianglejiii,@function
_Z9applyMoveP8Trianglejiii:             # @_Z9applyMoveP8Trianglejiii
# %bb.0:
	beqz	a1, .LBB55_2
.LBB55_1:                               # =>This Inner Loop Header: Depth=1
	lw	a5, 0(a0)
	lw	a6, 4(a0)
	add	a5, a5, a2
	sw	a5, 0(a0)
	lw	a7, 8(a0)
	add	a5, a6, a3
	sw	a5, 4(a0)
	lw	a6, 12(a0)
	add	a5, a7, a4
	sw	a5, 8(a0)
	lw	a7, 16(a0)
	add	a5, a6, a2
	sw	a5, 12(a0)
	lw	a6, 20(a0)
	add	a5, a7, a3
	sw	a5, 16(a0)
	lw	a7, 24(a0)
	add	a5, a6, a4
	sw	a5, 20(a0)
	lw	a6, 28(a0)
	add	a7, a7, a2
	lw	t0, 32(a0)
	sw	a7, 24(a0)
	add	a5, a6, a3
	sw	a5, 28(a0)
	add	a5, t0, a4
	sw	a5, 32(a0)
	addi	a1, a1, -1
	addi	a0, a0, 40
	bnez	a1, .LBB55_1
.LBB55_2:
	ret
.Lfunc_end55:
	.size	_Z9applyMoveP8Trianglejiii, .Lfunc_end55-_Z9applyMoveP8Trianglejiii
                                        # -- End function
	.globl	_Z16run3dSceneObjectP8Triangle4VectPjj # -- Begin function _Z16run3dSceneObjectP8Triangle4VectPjj
	.p2align	2
	.type	_Z16run3dSceneObjectP8Triangle4VectPjj,@function
_Z16run3dSceneObjectP8Triangle4VectPjj: # @_Z16run3dSceneObjectP8Triangle4VectPjj
# %bb.0:
	addi	sp, sp, -112
	sw	ra, 108(sp)
	sw	s0, 104(sp)
	sw	s1, 100(sp)
	sw	s2, 96(sp)
	sw	s3, 92(sp)
	sw	s4, 88(sp)
	sw	s5, 84(sp)
	sw	s6, 80(sp)
	sw	s7, 76(sp)
	sw	s8, 72(sp)
	sw	s9, 68(sp)
	sw	s10, 64(sp)
	sw	s11, 60(sp)
	mv	s0, a3
	mv	a6, a2
	mv	s1, a1
	mv	a7, a0
	mv	t0, zero
	lui	a0, %hi(cameraPos)
	addi	a1, zero, -64
	sw	a1, %lo(cameraPos)(a0)
	addi	a0, a0, %lo(cameraPos)
	sw	zero, 4(a0)
	sw	zero, 8(a0)
	lui	a0, %hi(cameraVect)
	addi	a1, zero, 64
	sw	a1, %lo(cameraVect)(a0)
	addi	a0, a0, %lo(cameraVect)
	sw	zero, 4(a0)
	sw	zero, 8(a0)
	lui	a0, %hi(origin)
	sw	zero, %lo(origin)(a0)
	addi	a0, a0, %lo(origin)
	sw	zero, 4(a0)
	sw	zero, 8(a0)
	addi	s9, a7, 20
	addi	s10, a7, 16
	addi	t1, zero, 45
	addi	ra, zero, 5
	addi	s11, zero, 1
	addi	t2, zero, 10
	lui	a1, %hi(app)
	lui	s2, 524288
	addi	t3, zero, 360
	addi	t4, zero, 29
	addi	t5, zero, -29
	lui	t6, 655360
	lui	a0, 16
	addi	a0, a0, 256
	sw	a0, 36(sp)
	lui	a0, 903366
	addi	a0, a0, 1026
	sw	a0, 32(sp)
	lui	a0, 1606
	addi	a0, a0, 1028
	sw	a0, 28(sp)
	lui	a0, %hi(triangleArray)
	addi	a0, a0, %lo(triangleArray)
	sw	a0, 40(sp)
	addi	s6, zero, 72
	addi	s7, zero, 71
	addi	s8, zero, 73
	addi	s3, zero, 74
	addi	s4, zero, 75
	addi	s5, zero, 8
	addi	a0, zero, 1
	sw	a0, 44(sp)
.LBB56_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB56_3 Depth 2
                                        #       Child Loop BB56_6 Depth 3
                                        #       Child Loop BB56_10 Depth 3
                                        #         Child Loop BB56_22 Depth 4
                                        #         Child Loop BB56_34 Depth 4
                                        #         Child Loop BB56_30 Depth 4
                                        #         Child Loop BB56_16 Depth 4
	lw	a0, %lo(app)(a1)
	j	.LBB56_3
.LBB56_2:                               #   in Loop: Header=BB56_3 Depth=2
	lw	a1, 16(a0)
	bnez	a1, .LBB56_37
.LBB56_3:                               #   Parent Loop BB56_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB56_6 Depth 3
                                        #       Child Loop BB56_10 Depth 3
                                        #         Child Loop BB56_22 Depth 4
                                        #         Child Loop BB56_34 Depth 4
                                        #         Child Loop BB56_30 Depth 4
                                        #         Child Loop BB56_16 Depth 4
	lw	a1, 0(s2)
	beqz	a1, .LBB56_8
# %bb.4:                                #   in Loop: Header=BB56_3 Depth=2
	lw	a1, 8(a0)
	j	.LBB56_6
.LBB56_5:                               #   in Loop: Header=BB56_6 Depth=3
	lw	a2, 0(s2)
	beqz	a2, .LBB56_8
.LBB56_6:                               #   Parent Loop BB56_1 Depth=1
                                        #     Parent Loop BB56_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	addi	a1, a1, 1
	sw	a1, 8(a0)
	sw	s11, 16(a0)
	bne	a1, s5, .LBB56_5
# %bb.7:                                #   in Loop: Header=BB56_6 Depth=3
	lw	a2, 4(a0)
	mv	a1, zero
	addi	a2, a2, 1
	sw	a2, 4(a0)
	sw	zero, 8(a0)
	j	.LBB56_5
.LBB56_8:                               #   in Loop: Header=BB56_3 Depth=2
	lw	a1, 12(a0)
	j	.LBB56_10
.LBB56_9:                               #   in Loop: Header=BB56_10 Depth=3
	lw	a2, 4(s1)
	mv	a1, zero
	addi	a2, a2, -25
	sw	a2, 4(s1)
.LBB56_10:                              #   Parent Loop BB56_1 Depth=1
                                        #     Parent Loop BB56_3 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB56_22 Depth 4
                                        #         Child Loop BB56_34 Depth 4
                                        #         Child Loop BB56_30 Depth 4
                                        #         Child Loop BB56_16 Depth 4
	mv	a2, a1
	bnez	a1, .LBB56_12
# %bb.11:                               #   in Loop: Header=BB56_10 Depth=3
	lw	a2, 8(s2)
	sw	a2, 12(a0)
	beqz	a2, .LBB56_2
.LBB56_12:                              #   in Loop: Header=BB56_10 Depth=3
	mv	a1, zero
	sw	zero, 12(a0)
	blt	s6, a2, .LBB56_17
# %bb.13:                               #   in Loop: Header=BB56_10 Depth=3
	bge	s7, a2, .LBB56_24
# %bb.14:                               #   in Loop: Header=BB56_10 Depth=3
	beqz	s0, .LBB56_9
# %bb.15:                               #   in Loop: Header=BB56_10 Depth=3
	mv	a1, s10
	mv	a2, s0
.LBB56_16:                              #   Parent Loop BB56_1 Depth=1
                                        #     Parent Loop BB56_3 Depth=2
                                        #       Parent Loop BB56_10 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	lw	a3, -12(a1)
	lw	a4, 0(a1)
	addi	a3, a3, -25
	lw	a5, 12(a1)
	sw	a3, -12(a1)
	addi	a3, a4, -25
	sw	a3, 0(a1)
	addi	a3, a5, -25
	sw	a3, 12(a1)
	addi	a2, a2, -1
	addi	a1, a1, 40
	bnez	a2, .LBB56_16
	j	.LBB56_9
.LBB56_17:                              #   in Loop: Header=BB56_10 Depth=3
	beq	a2, s8, .LBB56_28
# %bb.18:                               #   in Loop: Header=BB56_10 Depth=3
	beq	a2, s3, .LBB56_32
# %bb.19:                               #   in Loop: Header=BB56_10 Depth=3
	bne	a2, s4, .LBB56_10
# %bb.20:                               #   in Loop: Header=BB56_10 Depth=3
	beqz	s0, .LBB56_23
# %bb.21:                               #   in Loop: Header=BB56_10 Depth=3
	mv	a1, s9
	mv	a2, s0
.LBB56_22:                              #   Parent Loop BB56_1 Depth=1
                                        #     Parent Loop BB56_3 Depth=2
                                        #       Parent Loop BB56_10 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	lw	a3, -12(a1)
	lw	a4, 0(a1)
	addi	a3, a3, -25
	lw	a5, 12(a1)
	sw	a3, -12(a1)
	addi	a3, a4, -25
	sw	a3, 0(a1)
	addi	a3, a5, -25
	sw	a3, 12(a1)
	addi	a2, a2, -1
	addi	a1, a1, 40
	bnez	a2, .LBB56_22
.LBB56_23:                              #   in Loop: Header=BB56_10 Depth=3
	lw	a2, 8(s1)
	mv	a1, zero
	addi	a2, a2, -25
	sw	a2, 8(s1)
	j	.LBB56_10
.LBB56_24:                              #   in Loop: Header=BB56_10 Depth=3
	addi	a3, zero, 9
	beq	a2, a3, .LBB56_36
# %bb.25:                               #   in Loop: Header=BB56_10 Depth=3
	addi	a3, zero, 37
	beq	a2, a3, .LBB56_47
# %bb.26:                               #   in Loop: Header=BB56_10 Depth=3
	addi	a3, zero, 58
	bne	a2, a3, .LBB56_10
# %bb.27:                               #   in Loop: Header=BB56_10 Depth=3
	mv	a1, zero
	lw	a2, 44(sp)
	xori	a2, a2, 1
	sw	a2, 44(sp)
	j	.LBB56_10
.LBB56_28:                              #   in Loop: Header=BB56_10 Depth=3
	beqz	s0, .LBB56_31
# %bb.29:                               #   in Loop: Header=BB56_10 Depth=3
	mv	a1, s10
	mv	a2, s0
.LBB56_30:                              #   Parent Loop BB56_1 Depth=1
                                        #     Parent Loop BB56_3 Depth=2
                                        #       Parent Loop BB56_10 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	lw	a3, -12(a1)
	lw	a4, 0(a1)
	addi	a3, a3, 25
	lw	a5, 12(a1)
	sw	a3, -12(a1)
	addi	a3, a4, 25
	sw	a3, 0(a1)
	addi	a3, a5, 25
	sw	a3, 12(a1)
	addi	a2, a2, -1
	addi	a1, a1, 40
	bnez	a2, .LBB56_30
.LBB56_31:                              #   in Loop: Header=BB56_10 Depth=3
	lw	a2, 4(s1)
	mv	a1, zero
	addi	a2, a2, 25
	sw	a2, 4(s1)
	j	.LBB56_10
.LBB56_32:                              #   in Loop: Header=BB56_10 Depth=3
	beqz	s0, .LBB56_35
# %bb.33:                               #   in Loop: Header=BB56_10 Depth=3
	mv	a1, s9
	mv	a2, s0
.LBB56_34:                              #   Parent Loop BB56_1 Depth=1
                                        #     Parent Loop BB56_3 Depth=2
                                        #       Parent Loop BB56_10 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	lw	a3, -12(a1)
	lw	a4, 0(a1)
	addi	a3, a3, 25
	lw	a5, 12(a1)
	sw	a3, -12(a1)
	addi	a3, a4, 25
	sw	a3, 0(a1)
	addi	a3, a5, 25
	sw	a3, 12(a1)
	addi	a2, a2, -1
	addi	a1, a1, 40
	bnez	a2, .LBB56_34
.LBB56_35:                              #   in Loop: Header=BB56_10 Depth=3
	lw	a2, 8(s1)
	mv	a1, zero
	addi	a2, a2, 25
	sw	a2, 8(s1)
	j	.LBB56_10
.LBB56_36:                              #   in Loop: Header=BB56_10 Depth=3
	mv	a1, zero
	neg	t2, t2
	j	.LBB56_10
.LBB56_37:                              #   in Loop: Header=BB56_1 Depth=1
	lw	a1, 44(sp)
	andi	a1, a1, 1
	sw	zero, 16(a0)
	beqz	a1, .LBB56_42
# %bb.38:                               #   in Loop: Header=BB56_1 Depth=1
	add	t1, t2, t1
	blt	t1, t3, .LBB56_40
# %bb.39:                               #   in Loop: Header=BB56_1 Depth=1
	addi	t1, t1, -360
	j	.LBB56_42
.LBB56_40:                              #   in Loop: Header=BB56_1 Depth=1
	bgez	t1, .LBB56_42
# %bb.41:                               #   in Loop: Header=BB56_1 Depth=1
	addi	t1, t1, 360
.LBB56_42:                              #   in Loop: Header=BB56_1 Depth=1
	add	t0, ra, t0
	addi	a0, zero, -5
	blt	t4, t0, .LBB56_44
# %bb.43:                               #   in Loop: Header=BB56_1 Depth=1
	mv	a0, ra
.LBB56_44:                              #   in Loop: Header=BB56_1 Depth=1
	sw	t2, 8(sp)
	sw	t1, 16(sp)
	sw	a7, 20(sp)
	sw	a6, 24(sp)
	addi	a1, zero, 5
	blt	t0, t5, .LBB56_46
# %bb.45:                               #   in Loop: Header=BB56_1 Depth=1
	mv	a1, a0
.LBB56_46:                              #   in Loop: Header=BB56_1 Depth=1
	sw	a1, 4(sp)
	sw	s11, 12(t6)
	mv	a0, t0
	lw	a1, 36(sp)
	sw	t0, 12(sp)
	call	__mulsi3
	lw	a1, 32(sp)
	add	a0, a0, a1
	lui	a1, 655360
	sw	a0, 12(a1)
	lui	a0, 655360
	lw	a1, 28(sp)
	sw	a1, 12(a0)
	lw	a0, 8(s1)
	sw	a0, 56(sp)
	lw	a0, 4(s1)
	sw	a0, 52(sp)
	lw	a0, 0(s1)
	sw	a0, 48(sp)
	lw	a0, 20(sp)
	lw	a1, 40(sp)
	mv	a2, s0
	addi	a3, sp, 48
	lw	a4, 16(sp)
	call	_Z13applyRotationP8TriangleS0_j4Vecti
	lw	a0, 40(sp)
	lw	a1, 24(sp)
	mv	a2, s0
	call	_Z13sortTrianglesP8TrianglePji
	lw	a0, 40(sp)
	lw	a1, 24(sp)
	mv	a2, s0
	call	_Z13drawTrianglesPK8TrianglePKjj
	lw	ra, 4(sp)
	lui	t6, 655360
	lw	t1, 16(sp)
	lw	t0, 12(sp)
	lw	a7, 20(sp)
	lw	a6, 24(sp)
	addi	a0, zero, 42
	sw	a0, 12(t6)
	lw	t2, 8(sp)
	lui	a1, %hi(app)
	addi	t3, zero, 360
	addi	t4, zero, 29
	addi	t5, zero, -29
	j	.LBB56_1
.LBB56_47:
	lw	s11, 60(sp)
	lw	s10, 64(sp)
	lw	s9, 68(sp)
	lw	s8, 72(sp)
	lw	s7, 76(sp)
	lw	s6, 80(sp)
	lw	s5, 84(sp)
	lw	s4, 88(sp)
	lw	s3, 92(sp)
	lw	s2, 96(sp)
	lw	s1, 100(sp)
	lw	s0, 104(sp)
	lw	ra, 108(sp)
	addi	sp, sp, 112
	ret
.Lfunc_end56:
	.size	_Z16run3dSceneObjectP8Triangle4VectPjj, .Lfunc_end56-_Z16run3dSceneObjectP8Triangle4VectPjj
                                        # -- End function
	.globl	_Z9run3dCubev           # -- Begin function _Z9run3dCubev
	.p2align	2
	.type	_Z9run3dCubev,@function
_Z9run3dCubev:                          # @_Z9run3dCubev
# %bb.0:
	addi	sp, sp, -384
	sw	ra, 380(sp)
	addi	a2, zero, 300
	sw	a2, 56(sp)
	addi	a0, zero, -100
	sw	a0, 60(sp)
	addi	a1, zero, 60
	sw	a1, 64(sp)
	sw	a2, 68(sp)
	addi	a4, zero, 100
	sw	a4, 72(sp)
	sw	a1, 76(sp)
	sw	a2, 80(sp)
	sw	a0, 84(sp)
	addi	a3, zero, -140
	sw	a3, 88(sp)
	addi	a5, zero, 900
	sw	a5, 92(sp)
	sw	a2, 96(sp)
	sw	a4, 100(sp)
	sw	a1, 104(sp)
	sw	a2, 108(sp)
	sw	a4, 112(sp)
	sw	a3, 116(sp)
	sw	a2, 120(sp)
	sw	a0, 124(sp)
	sw	a3, 128(sp)
	sw	a5, 132(sp)
	addi	a5, zero, 500
	sw	a5, 136(sp)
	sw	a0, 140(sp)
	sw	a1, 144(sp)
	sw	a5, 148(sp)
	sw	a4, 152(sp)
	sw	a1, 156(sp)
	sw	a5, 160(sp)
	sw	a0, 164(sp)
	sw	a3, 168(sp)
	addi	a6, zero, 1500
	sw	a6, 172(sp)
	sw	a5, 176(sp)
	sw	a4, 180(sp)
	sw	a1, 184(sp)
	sw	a5, 188(sp)
	sw	a4, 192(sp)
	sw	a3, 196(sp)
	sw	a5, 200(sp)
	sw	a0, 204(sp)
	sw	a3, 208(sp)
	sw	a6, 212(sp)
	sw	a2, 216(sp)
	sw	a4, 220(sp)
	sw	a1, 224(sp)
	sw	a5, 228(sp)
	sw	a4, 232(sp)
	sw	a1, 236(sp)
	sw	a2, 240(sp)
	sw	a4, 244(sp)
	sw	a3, 248(sp)
	addi	a6, zero, 1100
	sw	a6, 252(sp)
	sw	a2, 256(sp)
	sw	a4, 260(sp)
	sw	a3, 264(sp)
	sw	a5, 268(sp)
	sw	a4, 272(sp)
	sw	a1, 276(sp)
	sw	a5, 280(sp)
	sw	a4, 284(sp)
	sw	a3, 288(sp)
	addi	a4, zero, 1300
	sw	a4, 292(sp)
	sw	a2, 296(sp)
	sw	a0, 300(sp)
	sw	a1, 304(sp)
	sw	a2, 308(sp)
	sw	a0, 312(sp)
	sw	a3, 316(sp)
	sw	a5, 320(sp)
	sw	a0, 324(sp)
	sw	a3, 328(sp)
	sw	a6, 332(sp)
	sw	a2, 336(sp)
	sw	a0, 340(sp)
	sw	a1, 344(sp)
	sw	a5, 348(sp)
	sw	a0, 352(sp)
	sw	a3, 356(sp)
	sw	a5, 360(sp)
	sw	a0, 364(sp)
	sw	a1, 368(sp)
	sw	a4, 372(sp)
	lui	a0, %hi(.L__const._Z9run3dCubev.triOrder)
	addi	a1, a0, %lo(.L__const._Z9run3dCubev.triOrder)
	lw	a2, 28(a1)
	lw	a3, 24(a1)
	lw	a4, 20(a1)
	lw	a5, 16(a1)
	sw	a2, 52(sp)
	sw	a3, 48(sp)
	sw	a4, 44(sp)
	sw	a5, 40(sp)
	lw	a2, 12(a1)
	lw	a3, 8(a1)
	lw	a1, 4(a1)
	lw	a0, %lo(.L__const._Z9run3dCubev.triOrder)(a0)
	sw	a2, 36(sp)
	sw	a3, 32(sp)
	sw	a1, 28(sp)
	sw	a0, 24(sp)
	addi	a0, zero, 400
	sw	a0, 8(sp)
	sw	zero, 12(sp)
	sw	zero, 16(sp)
	addi	a0, sp, 56
	addi	a1, sp, 8
	addi	a2, sp, 24
	addi	a3, zero, 8
	call	_Z16run3dSceneObjectP8Triangle4VectPjj
	lw	ra, 380(sp)
	addi	sp, sp, 384
	ret
.Lfunc_end57:
	.size	_Z9run3dCubev, .Lfunc_end57-_Z9run3dCubev
                                        # -- End function
	.globl	_Z12run3dDiamondv       # -- Begin function _Z12run3dDiamondv
	.p2align	2
	.type	_Z12run3dDiamondv,@function
_Z12run3dDiamondv:                      # @_Z12run3dDiamondv
# %bb.0:
	addi	sp, sp, -560
	sw	ra, 556(sp)
	sw	s0, 552(sp)
	sw	s1, 548(sp)
	addi	s1, zero, 400
	sw	s1, 64(sp)
	sw	zero, 68(sp)
	addi	t2, zero, 160
	sw	t2, 72(sp)
	sw	s1, 76(sp)
	addi	a6, zero, 100
	sw	a6, 80(sp)
	addi	a0, zero, -40
	sw	a0, 84(sp)
	addi	a2, zero, 487
	sw	a2, 88(sp)
	addi	a3, zero, 50
	sw	a3, 92(sp)
	sw	a0, 96(sp)
	addi	a7, zero, 1287
	sw	a7, 100(sp)
	sw	s1, 104(sp)
	sw	zero, 108(sp)
	sw	t2, 112(sp)
	sw	s1, 116(sp)
	addi	t0, zero, -100
	sw	t0, 120(sp)
	sw	a0, 124(sp)
	addi	s0, zero, 313
	sw	s0, 128(sp)
	addi	a1, zero, -50
	sw	a1, 132(sp)
	sw	a0, 136(sp)
	addi	t1, zero, 1113
	sw	t1, 140(sp)
	sw	s1, 144(sp)
	sw	zero, 148(sp)
	addi	t3, zero, -240
	sw	t3, 152(sp)
	sw	a2, 156(sp)
	sw	a3, 160(sp)
	sw	a0, 164(sp)
	sw	a2, 168(sp)
	sw	a1, 172(sp)
	sw	a0, 176(sp)
	addi	a5, zero, 1374
	sw	a5, 180(sp)
	sw	s1, 184(sp)
	sw	zero, 188(sp)
	sw	t3, 192(sp)
	sw	s0, 196(sp)
	sw	a1, 200(sp)
	sw	a0, 204(sp)
	sw	s0, 208(sp)
	sw	a3, 212(sp)
	sw	a0, 216(sp)
	addi	a4, zero, 1026
	sw	a4, 220(sp)
	sw	s1, 224(sp)
	sw	zero, 228(sp)
	sw	t2, 232(sp)
	sw	a2, 236(sp)
	sw	a3, 240(sp)
	sw	a0, 244(sp)
	sw	a2, 248(sp)
	sw	a1, 252(sp)
	sw	a0, 256(sp)
	sw	a5, 260(sp)
	sw	s1, 264(sp)
	sw	zero, 268(sp)
	sw	t2, 272(sp)
	sw	s0, 276(sp)
	sw	a1, 280(sp)
	sw	a0, 284(sp)
	sw	s0, 288(sp)
	sw	a3, 292(sp)
	sw	a0, 296(sp)
	sw	a4, 300(sp)
	sw	s1, 304(sp)
	sw	zero, 308(sp)
	sw	t3, 312(sp)
	sw	a2, 316(sp)
	sw	a1, 320(sp)
	sw	a0, 324(sp)
	sw	s1, 328(sp)
	sw	t0, 332(sp)
	sw	a0, 336(sp)
	sw	a7, 340(sp)
	sw	s1, 344(sp)
	sw	zero, 348(sp)
	sw	t3, 352(sp)
	sw	s0, 356(sp)
	sw	a3, 360(sp)
	sw	a0, 364(sp)
	sw	s1, 368(sp)
	sw	a6, 372(sp)
	sw	a0, 376(sp)
	sw	t1, 380(sp)
	sw	s1, 384(sp)
	sw	zero, 388(sp)
	sw	t2, 392(sp)
	sw	a2, 396(sp)
	sw	a1, 400(sp)
	sw	a0, 404(sp)
	sw	s1, 408(sp)
	sw	t0, 412(sp)
	sw	a0, 416(sp)
	sw	a7, 420(sp)
	sw	s1, 424(sp)
	sw	zero, 428(sp)
	sw	t2, 432(sp)
	sw	s0, 436(sp)
	sw	a3, 440(sp)
	sw	a0, 444(sp)
	sw	s1, 448(sp)
	sw	a6, 452(sp)
	sw	a0, 456(sp)
	sw	t1, 460(sp)
	sw	s1, 464(sp)
	sw	zero, 468(sp)
	sw	t3, 472(sp)
	sw	s1, 476(sp)
	sw	a6, 480(sp)
	sw	a0, 484(sp)
	sw	a2, 488(sp)
	sw	a3, 492(sp)
	sw	a0, 496(sp)
	sw	a7, 500(sp)
	sw	s1, 504(sp)
	sw	zero, 508(sp)
	sw	t3, 512(sp)
	sw	s1, 516(sp)
	sw	t0, 520(sp)
	sw	a0, 524(sp)
	sw	s0, 528(sp)
	sw	a1, 532(sp)
	sw	a0, 536(sp)
	sw	t1, 540(sp)
	lui	a0, %hi(.L__const._Z16run3dDiamondDiagv.triOrder)
	addi	a1, a0, %lo(.L__const._Z16run3dDiamondDiagv.triOrder)
	addi	s0, sp, 16
	addi	a2, zero, 48
	mv	a0, s0
	call	memcpy
	sw	s1, 0(sp)
	sw	zero, 4(sp)
	sw	zero, 8(sp)
	addi	a0, sp, 64
	mv	a1, sp
	addi	a3, zero, 12
	mv	a2, s0
	call	_Z16run3dSceneObjectP8Triangle4VectPjj
	lw	s1, 548(sp)
	lw	s0, 552(sp)
	lw	ra, 556(sp)
	addi	sp, sp, 560
	ret
.Lfunc_end58:
	.size	_Z12run3dDiamondv, .Lfunc_end58-_Z12run3dDiamondv
                                        # -- End function
	.globl	_Z16run3dDiamondDiagv   # -- Begin function _Z16run3dDiamondDiagv
	.p2align	2
	.type	_Z16run3dDiamondDiagv,@function
_Z16run3dDiamondDiagv:                  # @_Z16run3dDiamondDiagv
# %bb.0:
	addi	sp, sp, -560
	sw	ra, 556(sp)
	sw	s0, 552(sp)
	sw	s1, 548(sp)
	sw	s2, 544(sp)
	addi	t0, zero, 600
	sw	t0, 64(sp)
	sw	zero, 68(sp)
	addi	t1, zero, 133
	sw	t1, 72(sp)
	addi	s2, zero, 500
	sw	s2, 76(sp)
	addi	a6, zero, 100
	sw	a6, 80(sp)
	addi	a0, zero, -40
	sw	a0, 84(sp)
	addi	a2, zero, 575
	sw	a2, 88(sp)
	addi	a3, zero, 50
	sw	a3, 92(sp)
	addi	a4, zero, -83
	sw	a4, 96(sp)
	addi	t4, zero, 1675
	sw	t4, 100(sp)
	sw	t0, 104(sp)
	sw	zero, 108(sp)
	sw	t1, 112(sp)
	sw	s2, 116(sp)
	addi	a7, zero, -100
	sw	a7, 120(sp)
	sw	a0, 124(sp)
	addi	a1, zero, 425
	sw	a1, 128(sp)
	addi	a5, zero, -50
	sw	a5, 132(sp)
	addi	s0, zero, 3
	sw	s0, 136(sp)
	addi	t5, zero, 1525
	sw	t5, 140(sp)
	addi	t2, zero, 400
	sw	t2, 144(sp)
	sw	zero, 148(sp)
	addi	t3, zero, -213
	sw	t3, 152(sp)
	sw	a2, 156(sp)
	sw	a3, 160(sp)
	sw	a4, 164(sp)
	sw	a2, 168(sp)
	sw	a5, 172(sp)
	sw	a4, 176(sp)
	addi	s1, zero, 1550
	sw	s1, 180(sp)
	sw	t2, 184(sp)
	sw	zero, 188(sp)
	sw	t3, 192(sp)
	sw	a1, 196(sp)
	sw	a5, 200(sp)
	sw	s0, 204(sp)
	sw	a1, 208(sp)
	sw	a3, 212(sp)
	sw	s0, 216(sp)
	addi	s1, zero, 1250
	sw	s1, 220(sp)
	sw	t0, 224(sp)
	sw	zero, 228(sp)
	sw	t1, 232(sp)
	sw	a2, 236(sp)
	sw	a3, 240(sp)
	sw	a4, 244(sp)
	sw	a2, 248(sp)
	sw	a5, 252(sp)
	sw	a4, 256(sp)
	addi	s1, zero, 1750
	sw	s1, 260(sp)
	sw	t0, 264(sp)
	sw	zero, 268(sp)
	sw	t1, 272(sp)
	sw	a1, 276(sp)
	sw	a5, 280(sp)
	sw	s0, 284(sp)
	sw	a1, 288(sp)
	sw	a3, 292(sp)
	sw	s0, 296(sp)
	addi	s1, zero, 1450
	sw	s1, 300(sp)
	sw	t2, 304(sp)
	sw	zero, 308(sp)
	sw	t3, 312(sp)
	sw	a2, 316(sp)
	sw	a5, 320(sp)
	sw	a4, 324(sp)
	sw	s2, 328(sp)
	sw	a7, 332(sp)
	sw	a0, 336(sp)
	addi	t6, zero, 1475
	sw	t6, 340(sp)
	sw	t2, 344(sp)
	sw	zero, 348(sp)
	sw	t3, 352(sp)
	sw	a1, 356(sp)
	sw	a3, 360(sp)
	sw	s0, 364(sp)
	sw	s2, 368(sp)
	sw	a6, 372(sp)
	sw	a0, 376(sp)
	addi	s1, zero, 1325
	sw	s1, 380(sp)
	sw	t0, 384(sp)
	sw	zero, 388(sp)
	sw	t1, 392(sp)
	sw	a2, 396(sp)
	sw	a5, 400(sp)
	sw	a4, 404(sp)
	sw	s2, 408(sp)
	sw	a7, 412(sp)
	sw	a0, 416(sp)
	sw	t4, 420(sp)
	sw	t0, 424(sp)
	sw	zero, 428(sp)
	sw	t1, 432(sp)
	sw	a1, 436(sp)
	sw	a3, 440(sp)
	sw	s0, 444(sp)
	sw	s2, 448(sp)
	sw	a6, 452(sp)
	sw	a0, 456(sp)
	sw	t5, 460(sp)
	sw	t2, 464(sp)
	sw	zero, 468(sp)
	sw	t3, 472(sp)
	sw	s2, 476(sp)
	sw	a6, 480(sp)
	sw	a0, 484(sp)
	sw	a2, 488(sp)
	sw	a3, 492(sp)
	sw	a4, 496(sp)
	sw	t6, 500(sp)
	sw	t2, 504(sp)
	sw	zero, 508(sp)
	sw	t3, 512(sp)
	sw	s2, 516(sp)
	sw	a7, 520(sp)
	sw	a0, 524(sp)
	sw	a1, 528(sp)
	sw	a5, 532(sp)
	sw	s0, 536(sp)
	sw	s1, 540(sp)
	lui	a0, %hi(.L__const._Z16run3dDiamondDiagv.triOrder)
	addi	a1, a0, %lo(.L__const._Z16run3dDiamondDiagv.triOrder)
	addi	s0, sp, 16
	addi	a2, zero, 48
	mv	a0, s0
	call	memcpy
	sw	s2, 0(sp)
	sw	zero, 4(sp)
	sw	zero, 8(sp)
	addi	a0, sp, 64
	mv	a1, sp
	addi	a3, zero, 12
	mv	a2, s0
	call	_Z16run3dSceneObjectP8Triangle4VectPjj
	lw	s2, 544(sp)
	lw	s1, 548(sp)
	lw	s0, 552(sp)
	lw	ra, 556(sp)
	addi	sp, sp, 560
	ret
.Lfunc_end59:
	.size	_Z16run3dDiamondDiagv, .Lfunc_end59-_Z16run3dDiamondDiagv
                                        # -- End function
	.globl	_Z10run3dScenev         # -- Begin function _Z10run3dScenev
	.p2align	2
	.type	_Z10run3dScenev,@function
_Z10run3dScenev:                        # @_Z10run3dScenev
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	call	_Z9run3dCubev
	call	_Z12run3dDiamondv
	lw	ra, 12(sp)
	addi	sp, sp, 16
	tail	_Z16run3dDiamondDiagv
.Lfunc_end60:
	.size	_Z10run3dScenev, .Lfunc_end60-_Z10run3dScenev
                                        # -- End function
	.globl	_Z9runEditorv           # -- Begin function _Z9runEditorv
	.p2align	2
	.type	_Z9runEditorv,@function
_Z9runEditorv:                          # @_Z9runEditorv
# %bb.0:
	addi	sp, sp, -848
	sw	ra, 844(sp)
	sw	s0, 840(sp)
	sw	s1, 836(sp)
	sw	s2, 832(sp)
	sw	s3, 828(sp)
	sw	s4, 824(sp)
	sw	s5, 820(sp)
	sw	s6, 816(sp)
	sw	s7, 812(sp)
	sw	s8, 808(sp)
	sw	s9, 804(sp)
	sw	s10, 800(sp)
	sw	s11, 796(sp)
	lui	s1, %hi(_ZL4cout)
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	s0, s1, %lo(_ZL4cout)
	addi	a1, zero, 101
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 100
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 105
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 116
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 111
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 114
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 46
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 46
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 46
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 10
	mv	a0, s0
	jalr	a2
	lui	a0, %hi(.L__const._Z9runEditorv.text)
	addi	a1, a0, %lo(.L__const._Z9runEditorv.text)
	addi	s9, sp, 8
	addi	a2, zero, 788
	mv	a0, s9
	call	memcpy
	mv	t4, zero
	mv	a2, zero
	lui	a0, %hi(app)
	lw	a0, %lo(app)(a0)
	addi	a1, zero, 18
	lui	a7, 524288
	addi	s7, zero, 8
	addi	t0, zero, 195
	addi	a6, zero, 4
	lui	t3, 655360
	addi	t1, zero, 42
	addi	t2, zero, 14
	addi	a5, zero, 194
	addi	s6, zero, 26
	addi	t6, zero, 39
	addi	t5, zero, 43
	addi	s10, zero, 37
	addi	s4, zero, 58
	addi	s2, zero, 51
	addi	s3, zero, 50
	addi	s1, zero, 60
	addi	s5, zero, 32
	addi	s8, zero, 1
.LBB61_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB61_4 Depth 2
                                        #     Child Loop BB61_8 Depth 2
                                        #     Child Loop BB61_41 Depth 2
	lw	a3, 0(a7)
	beqz	a3, .LBB61_6
# %bb.2:                                #   in Loop: Header=BB61_1 Depth=1
	lw	a3, 8(a0)
	j	.LBB61_4
.LBB61_3:                               #   in Loop: Header=BB61_4 Depth=2
	lw	a4, 0(a7)
	beqz	a4, .LBB61_6
.LBB61_4:                               #   Parent Loop BB61_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	a3, a3, 1
	sw	a3, 8(a0)
	sw	s8, 16(a0)
	bne	a3, s7, .LBB61_3
# %bb.5:                                #   in Loop: Header=BB61_4 Depth=2
	lw	a4, 4(a0)
	mv	a3, zero
	addi	a4, a4, 1
	sw	a4, 4(a0)
	sw	zero, 8(a0)
	j	.LBB61_3
.LBB61_6:                               #   in Loop: Header=BB61_1 Depth=1
	lw	s0, 12(a0)
	j	.LBB61_8
.LBB61_7:                               #   in Loop: Header=BB61_8 Depth=2
	mv	a1, a4
	beq	a3, s10, .LBB61_44
.LBB61_8:                               #   Parent Loop BB61_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mv	a3, s0
	bnez	s0, .LBB61_10
# %bb.9:                                #   in Loop: Header=BB61_8 Depth=2
	lw	a3, 8(a7)
	sw	a3, 12(a0)
	beqz	a3, .LBB61_30
.LBB61_10:                              #   in Loop: Header=BB61_8 Depth=2
	sw	zero, 12(a0)
	bltu	a5, a1, .LBB61_14
# %bb.11:                               #   in Loop: Header=BB61_8 Depth=2
	bltu	s6, a3, .LBB61_15
# %bb.12:                               #   in Loop: Header=BB61_8 Depth=2
	andi	a4, a2, 1
	addi	a2, zero, 64
	bnez	a4, .LBB61_16
# %bb.13:                               #   in Loop: Header=BB61_8 Depth=2
	addi	a2, zero, 96
	j	.LBB61_16
.LBB61_14:                              #   in Loop: Header=BB61_8 Depth=2
	mv	a4, a1
	j	.LBB61_26
.LBB61_15:                              #   in Loop: Header=BB61_8 Depth=2
	addi	a2, zero, 21
	bgeu	a3, s10, .LBB61_18
.LBB61_16:                              #   in Loop: Header=BB61_8 Depth=2
	add	a2, a3, a2
	addi	a4, a1, 1
	slli	a1, a1, 2
	add	a1, s9, a1
	sw	a2, 0(a1)
	addi	a2, zero, 1
	beq	a3, t6, .LBB61_26
.LBB61_17:                              #   in Loop: Header=BB61_8 Depth=2
	beq	a3, t5, .LBB61_26
	j	.LBB61_25
.LBB61_18:                              #   in Loop: Header=BB61_8 Depth=2
	beq	a3, s4, .LBB61_22
# %bb.19:                               #   in Loop: Header=BB61_8 Depth=2
	beq	a3, s2, .LBB61_23
# %bb.20:                               #   in Loop: Header=BB61_8 Depth=2
	bne	a3, s3, .LBB61_29
# %bb.21:                               #   in Loop: Header=BB61_8 Depth=2
	addi	a2, zero, 44
	j	.LBB61_24
.LBB61_22:                              #   in Loop: Header=BB61_8 Depth=2
	addi	a2, zero, 32
	j	.LBB61_24
.LBB61_23:                              #   in Loop: Header=BB61_8 Depth=2
	addi	a2, zero, 46
.LBB61_24:                              #   in Loop: Header=BB61_8 Depth=2
	addi	a4, a1, 1
	slli	a1, a1, 2
	add	a1, s9, a1
	sw	a2, 0(a1)
.LBB61_25:                              #   in Loop: Header=BB61_8 Depth=2
	mv	a2, zero
.LBB61_26:                              #   in Loop: Header=BB61_8 Depth=2
	mv	s0, zero
	bne	a3, s1, .LBB61_7
# %bb.27:                               #   in Loop: Header=BB61_8 Depth=2
	mv	a1, zero
	beqz	a4, .LBB61_8
# %bb.28:                               #   in Loop: Header=BB61_8 Depth=2
	mv	s0, zero
	addi	a1, a4, -1
	slli	a3, a4, 2
	add	a3, s9, a3
	sw	s5, 0(a3)
	j	.LBB61_8
.LBB61_29:                              #   in Loop: Header=BB61_8 Depth=2
	mv	a4, a1
	addi	a2, zero, 1
	bne	a3, t6, .LBB61_17
	j	.LBB61_26
.LBB61_30:                              #   in Loop: Header=BB61_1 Depth=1
	lw	a3, 16(a0)
	beqz	a3, .LBB61_1
# %bb.31:                               #   in Loop: Header=BB61_1 Depth=1
	addi	a3, t4, 1
	sw	zero, 16(a0)
	mv	t4, zero
	bne	a3, s7, .LBB61_34
# %bb.32:                               #   in Loop: Header=BB61_1 Depth=1
	bgeu	t0, a1, .LBB61_35
.LBB61_33:                              #   in Loop: Header=BB61_1 Depth=1
	lw	a6, 8(sp)
	bnez	a6, .LBB61_38
	j	.LBB61_43
.LBB61_34:                              #   in Loop: Header=BB61_1 Depth=1
	mv	t4, a3
	bltu	t0, a1, .LBB61_33
.LBB61_35:                              #   in Loop: Header=BB61_1 Depth=1
	slli	a3, a1, 2
	add	a3, s9, a3
	addi	a4, zero, 64
	bltu	t4, a6, .LBB61_37
# %bb.36:                               #   in Loop: Header=BB61_1 Depth=1
	addi	a4, zero, 32
.LBB61_37:                              #   in Loop: Header=BB61_1 Depth=1
	sw	a4, 0(a3)
	lw	a6, 8(sp)
	beqz	a6, .LBB61_43
.LBB61_38:                              #   in Loop: Header=BB61_1 Depth=1
	mv	s0, zero
	addi	ra, zero, 1
	addi	a4, sp, 12
	addi	s11, zero, 1
	j	.LBB61_41
.LBB61_39:                              #   in Loop: Header=BB61_41 Depth=2
	addi	ra, ra, 7
.LBB61_40:                              #   in Loop: Header=BB61_41 Depth=2
	lw	a6, 0(a4)
	addi	a4, a4, 4
	beqz	a6, .LBB61_43
.LBB61_41:                              #   Parent Loop BB61_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a3, s11, 8
	add	a3, a3, ra
	slli	a3, a3, 8
	ori	a3, a3, 1
	sw	a3, 12(t3)
	slli	a3, a6, 8
	ori	a3, a3, 5
	addi	s0, s0, 1
	sw	a3, 12(t3)
	bne	s0, t2, .LBB61_39
# %bb.42:                               #   in Loop: Header=BB61_41 Depth=2
	mv	s0, zero
	addi	s11, s11, 7
	addi	ra, zero, 1
	j	.LBB61_40
.LBB61_43:                              #   in Loop: Header=BB61_1 Depth=1
	sw	t1, 12(t3)
	addi	a6, zero, 4
	j	.LBB61_1
.LBB61_44:
	lw	s11, 796(sp)
	lw	s10, 800(sp)
	lw	s9, 804(sp)
	lw	s8, 808(sp)
	lw	s7, 812(sp)
	lw	s6, 816(sp)
	lw	s5, 820(sp)
	lw	s4, 824(sp)
	lw	s3, 828(sp)
	lw	s2, 832(sp)
	lw	s1, 836(sp)
	lw	s0, 840(sp)
	lw	ra, 844(sp)
	addi	sp, sp, 848
	ret
.Lfunc_end61:
	.size	_Z9runEditorv, .Lfunc_end61-_Z9runEditorv
                                        # -- End function
	.globl	_Z9menuEntryiPKDi       # -- Begin function _Z9menuEntryiPKDi
	.p2align	2
	.type	_Z9menuEntryiPKDi,@function
_Z9menuEntryiPKDi:                      # @_Z9menuEntryiPKDi
# %bb.0:
	lw	a5, 0(a1)
	beqz	a5, .LBB62_6
# %bb.1:
	mv	a4, zero
	slli	a0, a0, 4
	addi	a0, a0, 46
	addi	a1, a1, 4
	addi	a3, zero, 30
	lui	a7, 655360
	addi	a6, zero, 20
	j	.LBB62_4
.LBB62_2:                               #   in Loop: Header=BB62_4 Depth=1
	addi	a3, a3, 7
.LBB62_3:                               #   in Loop: Header=BB62_4 Depth=1
	lw	a5, 0(a1)
	addi	a1, a1, 4
	beqz	a5, .LBB62_6
.LBB62_4:                               # =>This Inner Loop Header: Depth=1
	slli	a2, a0, 8
	add	a2, a2, a3
	slli	a2, a2, 8
	ori	a2, a2, 1
	sw	a2, 12(a7)
	slli	a2, a5, 8
	ori	a2, a2, 5
	addi	a4, a4, 1
	sw	a2, 12(a7)
	bne	a4, a6, .LBB62_2
# %bb.5:                                #   in Loop: Header=BB62_4 Depth=1
	mv	a4, zero
	addi	a0, a0, 7
	addi	a3, zero, 30
	j	.LBB62_3
.LBB62_6:
	ret
.Lfunc_end62:
	.size	_Z9menuEntryiPKDi, .Lfunc_end62-_Z9menuEntryiPKDi
                                        # -- End function
	.globl	_Z7runMenuv             # -- Begin function _Z7runMenuv
	.p2align	2
	.type	_Z7runMenuv,@function
_Z7runMenuv:                            # @_Z7runMenuv
# %bb.0:
	addi	sp, sp, -128
	sw	ra, 124(sp)
	sw	s0, 120(sp)
	sw	s1, 116(sp)
	sw	s2, 112(sp)
	sw	s3, 108(sp)
	sw	s4, 104(sp)
	sw	s5, 100(sp)
	sw	s6, 96(sp)
	sw	s7, 92(sp)
	sw	s8, 88(sp)
	sw	s9, 84(sp)
	sw	s10, 80(sp)
	sw	s11, 76(sp)
	mv	a0, zero
	lui	s0, %hi(app)
	lw	a1, %lo(app)(s0)
	lui	s1, 524288
	lui	a2, 226
	addi	a3, a2, -511
	sw	a3, 72(sp)
	lui	s3, 655360
	lui	a3, 4
	addi	a4, a3, 773
	sw	a4, 68(sp)
	addi	a2, a2, 1281
	sw	a2, 64(sp)
	lui	s7, 7
	addi	a2, s7, -1019
	sw	a2, 60(sp)
	lui	a2, 227
	addi	a4, a2, -1023
	sw	a4, 56(sp)
	addi	a4, s7, -251
	sw	a4, 52(sp)
	addi	a2, a2, 769
	sw	a2, 48(sp)
	lui	a4, 6
	addi	a2, a4, 773
	sw	a2, 44(sp)
	lui	a2, 228
	addi	a2, a2, -1535
	sw	a2, 40(sp)
	addi	a2, s7, -1275
	sw	a2, 36(sp)
	lui	a2, 482
	addi	a5, a2, -511
	sw	a5, 32(sp)
	addi	a3, a3, 1541
	sw	a3, 28(sp)
	addi	a2, a2, 1281
	sw	a2, 24(sp)
	addi	a2, a4, 261
	sw	a2, 20(sp)
	lui	a2, 3
	addi	a2, a2, 773
	sw	a2, 16(sp)
	lui	a2, 5
	addi	a2, a2, 261
	sw	a2, 12(sp)
	lui	a2, 225
	addi	a2, a2, 1025
	sw	a2, 8(sp)
	addi	s9, zero, 3
	addi	s2, zero, 75
	addi	s11, zero, 1
	addi	s5, zero, 74
	addi	s6, zero, 59
	addi	s8, zero, 2
	addi	s10, zero, 8
	j	.LBB63_2
.LBB63_1:                               #   in Loop: Header=BB63_2 Depth=1
	andi	a2, s4, 1
	bnez	a2, .LBB63_31
.LBB63_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB63_5 Depth 2
                                        #     Child Loop BB63_9 Depth 2
	lw	a2, 0(s1)
	beqz	a2, .LBB63_7
# %bb.3:                                #   in Loop: Header=BB63_2 Depth=1
	lw	a2, 8(a1)
	j	.LBB63_5
.LBB63_4:                               #   in Loop: Header=BB63_5 Depth=2
	lw	a3, 0(s1)
	beqz	a3, .LBB63_7
.LBB63_5:                               #   Parent Loop BB63_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	a2, a2, 1
	sw	a2, 8(a1)
	sw	s11, 16(a1)
	bne	a2, s10, .LBB63_4
# %bb.6:                                #   in Loop: Header=BB63_5 Depth=2
	lw	a3, 4(a1)
	mv	a2, zero
	addi	a3, a3, 1
	sw	a3, 4(a1)
	sw	zero, 8(a1)
	j	.LBB63_4
.LBB63_7:                               #   in Loop: Header=BB63_2 Depth=1
	mv	s4, zero
	j	.LBB63_9
.LBB63_8:                               #   in Loop: Header=BB63_9 Depth=2
	addi	a0, a0, 1
	lw	a1, %lo(app)(s0)
.LBB63_9:                               #   Parent Loop BB63_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a2, 12(a1)
	bnez	a2, .LBB63_11
# %bb.10:                               #   in Loop: Header=BB63_9 Depth=2
	lw	a2, 8(s1)
	sw	a2, 12(a1)
	beqz	a2, .LBB63_29
.LBB63_11:                              #   in Loop: Header=BB63_9 Depth=2
	sw	zero, 12(a1)
	blt	s9, a0, .LBB63_13
# %bb.12:                               #   in Loop: Header=BB63_9 Depth=2
	beq	a2, s2, .LBB63_8
.LBB63_13:                              #   in Loop: Header=BB63_9 Depth=2
	blt	a0, s11, .LBB63_16
# %bb.14:                               #   in Loop: Header=BB63_9 Depth=2
	bne	a2, s5, .LBB63_16
# %bb.15:                               #   in Loop: Header=BB63_9 Depth=2
	addi	a0, a0, -1
	lw	a1, %lo(app)(s0)
	j	.LBB63_9
.LBB63_16:                              #   in Loop: Header=BB63_9 Depth=2
	bne	a2, s6, .LBB63_27
# %bb.17:                               #   in Loop: Header=BB63_9 Depth=2
	bge	s11, a0, .LBB63_22
# %bb.18:                               #   in Loop: Header=BB63_9 Depth=2
	beq	a0, s8, .LBB63_25
# %bb.19:                               #   in Loop: Header=BB63_9 Depth=2
	beq	a0, s9, .LBB63_26
# %bb.20:                               #   in Loop: Header=BB63_9 Depth=2
	addi	a1, zero, 4
	bne	a0, a1, .LBB63_27
# %bb.21:                               #   in Loop: Header=BB63_9 Depth=2
	addi	s4, zero, 1
	addi	a0, zero, 4
	lw	a1, %lo(app)(s0)
	j	.LBB63_9
.LBB63_22:                              #   in Loop: Header=BB63_9 Depth=2
	beqz	a0, .LBB63_28
# %bb.23:                               #   in Loop: Header=BB63_9 Depth=2
	bne	a0, s11, .LBB63_27
# %bb.24:                               #   in Loop: Header=BB63_9 Depth=2
	call	_Z12runClockFastv
	addi	a0, zero, 1
	lw	a1, %lo(app)(s0)
	j	.LBB63_9
.LBB63_25:                              #   in Loop: Header=BB63_9 Depth=2
	call	_Z9runEditorv
	addi	a0, zero, 2
	lw	a1, %lo(app)(s0)
	j	.LBB63_9
.LBB63_26:                              #   in Loop: Header=BB63_9 Depth=2
	call	_Z9run3dCubev
	call	_Z12run3dDiamondv
	call	_Z16run3dDiamondDiagv
	addi	a0, zero, 3
.LBB63_27:                              #   in Loop: Header=BB63_9 Depth=2
	lw	a1, %lo(app)(s0)
	j	.LBB63_9
.LBB63_28:                              #   in Loop: Header=BB63_9 Depth=2
	call	_Z8runClockv
	mv	a0, zero
	lw	a1, %lo(app)(s0)
	j	.LBB63_9
.LBB63_29:                              #   in Loop: Header=BB63_2 Depth=1
	lw	a2, 16(a1)
	beqz	a2, .LBB63_1
# %bb.30:                               #   in Loop: Header=BB63_2 Depth=1
	sw	zero, 16(a1)
	lw	a2, 72(sp)
	sw	a2, 12(s3)
	lw	a2, 68(sp)
	sw	a2, 12(s3)
	lw	a2, 64(sp)
	sw	a2, 12(s3)
	lw	a2, 60(sp)
	sw	a2, 12(s3)
	lw	a2, 56(sp)
	sw	a2, 12(s3)
	lw	a7, 52(sp)
	sw	a7, 12(s3)
	lw	a2, 48(sp)
	sw	a2, 12(s3)
	lw	a2, 44(sp)
	sw	a2, 12(s3)
	lw	a2, 40(sp)
	sw	a2, 12(s3)
	lw	a2, 36(sp)
	sw	a2, 12(s3)
	lw	a2, 32(sp)
	sw	a2, 12(s3)
	lw	a2, 28(sp)
	sw	a2, 12(s3)
	lw	a2, 24(sp)
	sw	a2, 12(s3)
	lw	a2, 20(sp)
	sw	a2, 12(s3)
	lui	a3, 483
	addi	a2, a3, -1023
	sw	a2, 12(s3)
	addi	a2, s7, 773
	sw	a2, 12(s3)
	addi	a2, a3, 769
	sw	a2, 12(s3)
	addi	a2, s7, 1029
	sw	a2, 12(s3)
	lui	a4, 738
	addi	a3, a4, -511
	sw	a3, 12(s3)
	lui	a6, 4
	addi	a3, a6, 1285
	sw	a3, 12(s3)
	addi	a3, a4, 1281
	sw	a3, 12(s3)
	lui	a3, 6
	addi	a3, a3, 1029
	sw	a3, 12(s3)
	lui	a4, 739
	addi	a3, a4, -1023
	sw	a3, 12(s3)
	addi	a3, s7, -1787
	sw	a3, 12(s3)
	addi	a4, a4, 769
	sw	a4, 12(s3)
	sw	a2, 12(s3)
	lui	a5, 740
	addi	a4, a5, -1535
	sw	a4, 12(s3)
	sw	a7, 12(s3)
	addi	a4, a5, 257
	sw	a4, 12(s3)
	addi	a4, s7, 517
	sw	a4, 12(s3)
	lui	a5, 994
	addi	a4, a5, -511
	sw	a4, 12(s3)
	lw	a4, 16(sp)
	sw	a4, 12(s3)
	addi	a4, a5, 1281
	sw	a4, 12(s3)
	addi	a4, a6, 1029
	sw	a4, 12(s3)
	lui	a5, 1250
	addi	a4, a5, -511
	sw	a4, 12(s3)
	lw	a4, 12(sp)
	sw	a4, 12(s3)
	addi	a4, a5, 1281
	sw	a4, 12(s3)
	addi	a4, s7, 1285
	sw	a4, 12(s3)
	lui	a5, 1251
	addi	a4, a5, -1023
	sw	a4, 12(s3)
	sw	a3, 12(s3)
	addi	a3, a5, 769
	sw	a3, 12(s3)
	sw	a2, 12(s3)
	slli	a2, a0, 20
	lw	a3, 8(sp)
	or	a2, a2, a3
	sw	a2, 12(s3)
	addi	a2, a6, -507
	sw	a2, 12(s3)
	addi	a2, s3, 12
	addi	a3, zero, 42
	sw	a3, 0(a2)
	j	.LBB63_1
.LBB63_31:
	lw	s11, 76(sp)
	lw	s10, 80(sp)
	lw	s9, 84(sp)
	lw	s8, 88(sp)
	lw	s7, 92(sp)
	lw	s6, 96(sp)
	lw	s5, 100(sp)
	lw	s4, 104(sp)
	lw	s3, 108(sp)
	lw	s2, 112(sp)
	lw	s1, 116(sp)
	lw	s0, 120(sp)
	lw	ra, 124(sp)
	addi	sp, sp, 128
	ret
.Lfunc_end63:
	.size	_Z7runMenuv, .Lfunc_end63-_Z7runMenuv
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	mv	s0, sp
	mv	a0, s0
	call	_ZN3AppC2Ev
	lui	a0, %hi(app)
	sw	s0, %lo(app)(a0)
	call	_Z7runMenuv
	mv	a0, zero
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end64:
	.size	main, .Lfunc_end64-main
                                        # -- End function
	.section	.text._ZN3AppC2Ev,"axG",@progbits,_ZN3AppC2Ev,comdat
	.weak	_ZN3AppC2Ev             # -- Begin function _ZN3AppC2Ev
	.p2align	2
	.type	_ZN3AppC2Ev,@function
_ZN3AppC2Ev:                            # @_ZN3AppC2Ev
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	mv	s2, a0
	sw	zero, 16(a0)
	sw	zero, 12(a0)
	sw	zero, 8(a0)
	sw	zero, 4(a0)
	lui	a0, %hi(__asm__freept)
	lw	a1, %lo(__asm__freept)(a0)
	lui	a2, %hi(allocPos)
	sw	a1, %lo(allocPos)(a2)
	lui	a2, 1
	addi	a2, a2, -896
	add	a2, a1, a2
	lui	a3, %hi(allocSize)
	sw	a2, %lo(allocSize)(a3)
	lui	a2, 2
	lui	s0, %hi(_ZL4cout)
	lw	a3, %lo(_ZL4cout)(s0)
	addi	a2, a2, -1792
	add	a1, a1, a2
	sw	a1, %lo(__asm__freept)(a0)
	lw	a2, 0(a3)
	addi	s1, s0, %lo(_ZL4cout)
	addi	a1, zero, 65
	mv	a0, s1
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s0)
	lw	a2, 0(a0)
	addi	a1, zero, 112
	mv	a0, s1
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s0)
	lw	a2, 0(a0)
	addi	a1, zero, 112
	mv	a0, s1
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s0)
	lw	a2, 0(a0)
	addi	a1, zero, 32
	mv	a0, s1
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s0)
	lw	a2, 0(a0)
	addi	a1, zero, 115
	mv	a0, s1
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s0)
	lw	a2, 0(a0)
	addi	a1, zero, 116
	mv	a0, s1
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s0)
	lw	a2, 0(a0)
	addi	a1, zero, 97
	mv	a0, s1
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s0)
	lw	a2, 0(a0)
	addi	a1, zero, 114
	mv	a0, s1
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s0)
	lw	a2, 0(a0)
	addi	a1, zero, 116
	mv	a0, s1
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s0)
	lw	a2, 0(a0)
	addi	a1, zero, 101
	mv	a0, s1
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s0)
	lw	a2, 0(a0)
	addi	a1, zero, 100
	mv	a0, s1
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s0)
	lw	a2, 0(a0)
	addi	a1, zero, 32
	mv	a0, s1
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s0)
	lw	a2, 0(a0)
	lui	s3, 31
	addi	a1, s3, 1317
	mv	a0, s1
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s0)
	lw	a2, 0(a0)
	addi	a1, s3, 1033
	mv	a0, s1
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s0)
	lw	a2, 0(a0)
	addi	a1, zero, 10
	mv	a0, s1
	jalr	a2
	lui	a0, 655360
	addi	a1, zero, 4
	sw	a1, 8(a0)
	lui	a1, 524288
	lw	a2, 4(a1)
	addi	a3, a2, 16
	sw	a3, 0(s2)
	addi	a3, a2, 20
	sw	a3, 8(a0)
	lw	a7, 4(a1)
	beqz	a7, .LBB65_9
# %bb.1:
	mv	a4, zero
	addi	a5, a2, 24
	lui	a2, %hi(.L.str.31)
	addi	a6, a2, %lo(.L.str.31)
.LBB65_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB65_5 Depth 2
	sw	a5, 8(a0)
	lw	t0, 4(a1)
	addi	a3, a5, 4
	sw	a3, 8(a0)
	lw	s0, 4(a1)
	addi	a5, a5, 8
	xori	a3, s0, 6
	seqz	s1, a3
	beqz	s0, .LBB65_7
# %bb.3:                                #   in Loop: Header=BB65_2 Depth=1
	mv	a3, a6
	j	.LBB65_5
.LBB65_4:                               #   in Loop: Header=BB65_5 Depth=2
	addi	a5, a5, 4
	addi	s0, s0, -1
	addi	a3, a3, 4
	beqz	s0, .LBB65_7
.LBB65_5:                               #   Parent Loop BB65_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	a2, s1, 1
	mv	s1, zero
	beqz	a2, .LBB65_4
# %bb.6:                                #   in Loop: Header=BB65_5 Depth=2
	sw	a5, 8(a0)
	lw	a2, 4(a1)
	lw	s1, 0(a3)
	xor	a2, a2, s1
	seqz	s1, a2
	j	.LBB65_4
.LBB65_7:                               #   in Loop: Header=BB65_2 Depth=1
	bnez	s1, .LBB65_10
# %bb.8:                                #   in Loop: Header=BB65_2 Depth=1
	addi	a4, a4, 1
	bne	a4, a7, .LBB65_2
.LBB65_9:
	mv	t0, zero
.LBB65_10:
	addi	a2, t0, 4
	sw	a2, 8(a0)
	lw	a7, 4(a1)
	addi	s2, s2, 4
	beqz	a7, .LBB65_19
# %bb.11:
	mv	a1, zero
	addi	a2, t0, 8
	lui	a3, 655360
	lui	a4, 524288
	lui	a5, %hi(.L.str.18)
	addi	a6, a5, %lo(.L.str.18)
.LBB65_12:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB65_15 Depth 2
	sw	a2, 8(a3)
	lw	s3, 4(a4)
	addi	a5, a2, 4
	sw	a5, 8(a3)
	lw	s1, 4(a4)
	addi	a2, a2, 8
	xori	a5, s1, 8
	seqz	s0, a5
	beqz	s1, .LBB65_17
# %bb.13:                               #   in Loop: Header=BB65_12 Depth=1
	mv	a5, a6
	j	.LBB65_15
.LBB65_14:                              #   in Loop: Header=BB65_15 Depth=2
	addi	a2, a2, 4
	addi	s1, s1, -1
	addi	a5, a5, 4
	beqz	s1, .LBB65_17
.LBB65_15:                              #   Parent Loop BB65_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	a0, s0, 1
	mv	s0, zero
	beqz	a0, .LBB65_14
# %bb.16:                               #   in Loop: Header=BB65_15 Depth=2
	sw	a2, 8(a3)
	lw	a0, 4(a4)
	lw	s0, 0(a5)
	xor	a0, a0, s0
	seqz	s0, a0
	j	.LBB65_14
.LBB65_17:                              #   in Loop: Header=BB65_12 Depth=1
	bnez	s0, .LBB65_20
# %bb.18:                               #   in Loop: Header=BB65_12 Depth=1
	addi	a1, a1, 1
	bne	a1, a7, .LBB65_12
.LBB65_19:
	mv	s3, zero
.LBB65_20:
	lui	s1, %hi(_ZL4cout)
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	s0, s1, %lo(_ZL4cout)
	addi	a1, zero, 76
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 111
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 97
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 100
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 105
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 110
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 103
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 32
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 115
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 112
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 114
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 105
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 116
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 101
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 115
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 46
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 46
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 46
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 10
	mv	a0, s0
	jalr	a2
	mv	a0, s3
	call	_Z19load_alphabet_tilesj
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 83
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 112
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 114
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 105
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 116
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 101
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 115
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 32
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 108
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 111
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 97
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 100
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 101
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 100
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 10
	mv	a0, s0
	jalr	a2
	lui	a0, 524288
	lw	a0, 12(a0)
	sw	a0, 0(s2)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end65:
	.size	_ZN3AppC2Ev, .Lfunc_end65-_ZN3AppC2Ev
                                        # -- End function
	.section	.text._ZN6vectorIDiEC2EjDi,"axG",@progbits,_ZN6vectorIDiEC2EjDi,comdat
	.weak	_ZN6vectorIDiEC2EjDi    # -- Begin function _ZN6vectorIDiEC2EjDi
	.p2align	2
	.type	_ZN6vectorIDiEC2EjDi,@function
_ZN6vectorIDiEC2EjDi:                   # @_ZN6vectorIDiEC2EjDi
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	mv	s0, a0
	sw	zero, 0(a0)
	addi	a0, zero, 2
	sw	a0, 4(s0)
	lui	s3, %hi(nbBlocks)
	lw	a6, %lo(nbBlocks)(s3)
	mv	s2, a2
	mv	s1, a1
	beqz	a6, .LBB66_6
# %bb.1:
	lui	a0, %hi(allocSize)
	lw	a2, %lo(allocSize)(a0)
	mv	a1, zero
	addi	a3, zero, 7
	mv	a4, a6
.LBB66_2:                               # =>This Inner Loop Header: Depth=1
	add	a5, a2, a1
	lw	a0, 0(a5)
	blt	a3, a0, .LBB66_8
# %bb.3:                                #   in Loop: Header=BB66_2 Depth=1
	addi	a4, a4, -1
	addi	a1, a1, 4
	bnez	a4, .LBB66_2
# %bb.4:
	addi	a0, zero, 100
	bne	a6, a0, .LBB66_7
# %bb.5:
	addi	a0, zero, 29
	call	exit
	lui	a0, %hi(nbBlocks)
	lw	a6, %lo(nbBlocks)(a0)
	j	.LBB66_7
.LBB66_6:
	mv	a6, zero
.LBB66_7:
	lui	a0, %hi(__asm__freept)
	lui	a1, %hi(allocPos)
	lw	a2, %lo(allocPos)(a1)
	lw	a1, %lo(__asm__freept)(a0)
	slli	a3, a6, 2
	add	a2, a2, a3
	sw	a1, 0(a2)
	lui	a2, %hi(allocSize)
	lw	a2, %lo(allocSize)(a2)
	add	a2, a2, a3
	addi	a3, zero, -8
	sw	a3, 0(a2)
	lw	a2, %lo(nbBlocks)(s3)
	lw	a3, %lo(__asm__freept)(a0)
	addi	a2, a2, 1
	sw	a2, %lo(nbBlocks)(s3)
	addi	a2, a3, 8
	sw	a2, %lo(__asm__freept)(a0)
	j	.LBB66_9
.LBB66_8:
	neg	a0, a0
	sw	a0, 0(a5)
	lui	a0, %hi(allocPos)
	lw	a0, %lo(allocPos)(a0)
	add	a0, a0, a1
	lw	a1, 0(a0)
.LBB66_9:
	lw	a2, 0(s0)
	sw	a1, 8(s0)
	bgeu	a2, s1, .LBB66_16
# %bb.10:
	lw	a0, 4(s0)
	bgeu	a0, s1, .LBB66_13
.LBB66_11:                              # =>This Inner Loop Header: Depth=1
	mv	a0, s0
	mv	a1, s1
	call	_ZN6vectorIDiE7reserveEj
	lw	a0, 4(s0)
	bltu	a0, s1, .LBB66_11
# %bb.12:
	lw	a2, 0(s0)
.LBB66_13:
	bgeu	a2, s1, .LBB66_17
# %bb.14:
	lw	a1, 8(s0)
	sub	a0, s1, a2
	slli	a2, a2, 2
	add	a1, a1, a2
.LBB66_15:                              # =>This Inner Loop Header: Depth=1
	sw	s2, 0(a1)
	addi	a0, a0, -1
	addi	a1, a1, 4
	bnez	a0, .LBB66_15
.LBB66_16:
	sw	s1, 0(s0)
.LBB66_17:
	addi	a1, zero, 2
	mv	a0, s0
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	tail	_ZN6vectorIDiE7reserveEj
.Lfunc_end66:
	.size	_ZN6vectorIDiEC2EjDi, .Lfunc_end66-_ZN6vectorIDiEC2EjDi
                                        # -- End function
	.section	.text._ZN4File8readWordEv,"axG",@progbits,_ZN4File8readWordEv,comdat
	.weak	_ZN4File8readWordEv     # -- Begin function _ZN4File8readWordEv
	.p2align	2
	.type	_ZN4File8readWordEv,@function
_ZN4File8readWordEv:                    # @_ZN4File8readWordEv
# %bb.0:
	lw	a1, 4(a0)
	lui	a2, 655360
	sw	a1, 8(a2)
	lui	a1, 524288
	lw	a1, 4(a1)
	lw	a2, 4(a0)
	addi	a2, a2, 4
	sw	a2, 4(a0)
	mv	a0, a1
	ret
.Lfunc_end67:
	.size	_ZN4File8readWordEv, .Lfunc_end67-_ZN4File8readWordEv
                                        # -- End function
	.section	.text._ZN4File8readByteEv,"axG",@progbits,_ZN4File8readByteEv,comdat
	.weak	_ZN4File8readByteEv     # -- Begin function _ZN4File8readByteEv
	.p2align	2
	.type	_ZN4File8readByteEv,@function
_ZN4File8readByteEv:                    # @_ZN4File8readByteEv
# %bb.0:
	lw	a1, 4(a0)
	lui	a2, 655360
	sw	a1, 8(a2)
	lui	a1, 524288
	lw	a1, 4(a1)
	lw	a2, 4(a0)
	addi	a2, a2, 1
	srli	a1, a1, 24
	sw	a2, 4(a0)
	mv	a0, a1
	ret
.Lfunc_end68:
	.size	_ZN4File8readByteEv, .Lfunc_end68-_ZN4File8readByteEv
                                        # -- End function
	.section	.text._ZN17StandardOutStream9send_wordEj,"axG",@progbits,_ZN17StandardOutStream9send_wordEj,comdat
	.weak	_ZN17StandardOutStream9send_wordEj # -- Begin function _ZN17StandardOutStream9send_wordEj
	.p2align	2
	.type	_ZN17StandardOutStream9send_wordEj,@function
_ZN17StandardOutStream9send_wordEj:     # @_ZN17StandardOutStream9send_wordEj
# %bb.0:
	lui	a0, 655360
	sw	a1, 4(a0)
	ret
.Lfunc_end69:
	.size	_ZN17StandardOutStream9send_wordEj, .Lfunc_end69-_ZN17StandardOutStream9send_wordEj
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

	.type	.L__const._Z19load_alphabet_tilesj.name_upper,@object # @__const._Z19load_alphabet_tilesj.name_upper
	.section	.rodata.str4.4,"aMS",@progbits,4
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

	.type	.L.str.15,@object       # @.str.15
	.p2align	2
.L.str.15:
	.word	76                      # 0x4c
	.word	97                      # 0x61
	.word	121                     # 0x79
	.word	101                     # 0x65
	.word	114                     # 0x72
	.word	32                      # 0x20
	.word	49                      # 0x31
	.word	95                      # 0x5f
	.word	97                      # 0x61
	.word	108                     # 0x6c
	.word	112                     # 0x70
	.word	104                     # 0x68
	.word	97                      # 0x61
	.word	95                      # 0x5f
	.word	56                      # 0x38
	.word	50                      # 0x32
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str.15, 84

	.type	.L.str.16,@object       # @.str.16
	.p2align	2
.L.str.16:
	.word	76                      # 0x4c
	.word	97                      # 0x61
	.word	121                     # 0x79
	.word	101                     # 0x65
	.word	114                     # 0x72
	.word	32                      # 0x20
	.word	49                      # 0x31
	.word	95                      # 0x5f
	.word	97                      # 0x61
	.word	108                     # 0x6c
	.word	112                     # 0x70
	.word	104                     # 0x68
	.word	97                      # 0x61
	.word	95                      # 0x5f
	.word	56                      # 0x38
	.word	51                      # 0x33
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str.16, 84

	.type	.L.str.17,@object       # @.str.17
	.p2align	2
.L.str.17:
	.word	76                      # 0x4c
	.word	97                      # 0x61
	.word	121                     # 0x79
	.word	101                     # 0x65
	.word	114                     # 0x72
	.word	32                      # 0x20
	.word	49                      # 0x31
	.word	95                      # 0x5f
	.word	97                      # 0x61
	.word	108                     # 0x6c
	.word	112                     # 0x70
	.word	104                     # 0x68
	.word	97                      # 0x61
	.word	95                      # 0x5f
	.word	56                      # 0x38
	.word	53                      # 0x35
	.word	46                      # 0x2e
	.word	115                     # 0x73
	.word	98                      # 0x62
	.word	105                     # 0x69
	.word	0                       # 0x0
	.size	.L.str.17, 84

	.type	.L.str.18,@object       # @.str.18
	.p2align	2
.L.str.18:
	.word	97                      # 0x61
	.word	108                     # 0x6c
	.word	112                     # 0x70
	.word	104                     # 0x68
	.word	97                      # 0x61
	.word	98                      # 0x62
	.word	101                     # 0x65
	.word	116                     # 0x74
	.word	0                       # 0x0
	.size	.L.str.18, 36

	.type	app,@object             # @app
	.section	.sbss,"aw",@nobits
	.globl	app
	.p2align	2
app:
	.word	0
	.size	app, 4

	.type	dateYear,@object        # @dateYear
	.globl	dateYear
	.p2align	2
dateYear:
	.word	0                       # 0x0
	.size	dateYear, 4

	.type	dateMonths,@object      # @dateMonths
	.globl	dateMonths
	.p2align	2
dateMonths:
	.word	0                       # 0x0
	.size	dateMonths, 4

	.type	dateDays,@object        # @dateDays
	.globl	dateDays
	.p2align	2
dateDays:
	.word	0                       # 0x0
	.size	dateDays, 4

	.type	.L__const._Z12runClockFastv.time_str,@object # @__const._Z12runClockFastv.time_str
	.section	.rodata.str4.4,"aMS",@progbits,4
	.p2align	2
.L__const._Z12runClockFastv.time_str:
	.word	48                      # 0x30
	.word	48                      # 0x30
	.word	58                      # 0x3a
	.word	48                      # 0x30
	.word	48                      # 0x30
	.word	58                      # 0x3a
	.word	48                      # 0x30
	.word	48                      # 0x30
	.word	0                       # 0x0
	.size	.L__const._Z12runClockFastv.time_str, 36

	.type	.L__const._Z12runClockFastv.date_str,@object # @__const._Z12runClockFastv.date_str
	.p2align	2
.L__const._Z12runClockFastv.date_str:
	.word	48                      # 0x30
	.word	48                      # 0x30
	.word	47                      # 0x2f
	.word	48                      # 0x30
	.word	48                      # 0x30
	.word	47                      # 0x2f
	.word	48                      # 0x30
	.word	48                      # 0x30
	.word	48                      # 0x30
	.word	48                      # 0x30
	.word	0                       # 0x0
	.size	.L__const._Z12runClockFastv.date_str, 44

	.type	triangleArray,@object   # @triangleArray
	.bss
	.globl	triangleArray
	.p2align	2
triangleArray:
	.zero	400
	.size	triangleArray, 400

	.type	cameraPos,@object       # @cameraPos
	.globl	cameraPos
	.p2align	2
cameraPos:
	.zero	12
	.size	cameraPos, 12

	.type	cameraVect,@object      # @cameraVect
	.globl	cameraVect
	.p2align	2
cameraVect:
	.zero	12
	.size	cameraVect, 12

	.type	origin,@object          # @origin
	.globl	origin
	.p2align	2
origin:
	.zero	12
	.size	origin, 12

	.type	.L__const._Z9run3dCubev.triOrder,@object # @__const._Z9run3dCubev.triOrder
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	2
.L__const._Z9run3dCubev.triOrder:
	.word	0                       # 0x0
	.word	1                       # 0x1
	.word	2                       # 0x2
	.word	3                       # 0x3
	.word	4                       # 0x4
	.word	5                       # 0x5
	.word	6                       # 0x6
	.word	7                       # 0x7
	.size	.L__const._Z9run3dCubev.triOrder, 32

	.type	.L__const._Z16run3dDiamondDiagv.triOrder,@object # @__const._Z16run3dDiamondDiagv.triOrder
	.section	.rodata,"a",@progbits
	.p2align	2
.L__const._Z16run3dDiamondDiagv.triOrder:
	.word	0                       # 0x0
	.word	1                       # 0x1
	.word	2                       # 0x2
	.word	3                       # 0x3
	.word	4                       # 0x4
	.word	5                       # 0x5
	.word	6                       # 0x6
	.word	7                       # 0x7
	.word	8                       # 0x8
	.word	9                       # 0x9
	.word	10                      # 0xa
	.word	11                      # 0xb
	.size	.L__const._Z16run3dDiamondDiagv.triOrder, 48

	.type	.L__const._Z9runEditorv.text,@object # @__const._Z9runEditorv.text
	.section	.rodata.str4.4,"aMS",@progbits,4
	.p2align	2
.L__const._Z9runEditorv.text:
	.word	87                      # 0x57
	.word	114                     # 0x72
	.word	105                     # 0x69
	.word	116                     # 0x74
	.word	101                     # 0x65
	.word	32                      # 0x20
	.word	115                     # 0x73
	.word	111                     # 0x6f
	.word	109                     # 0x6d
	.word	101                     # 0x65
	.word	32                      # 0x20
	.word	116                     # 0x74
	.word	101                     # 0x65
	.word	120                     # 0x78
	.word	116                     # 0x74
	.word	46                      # 0x2e
	.word	46                      # 0x2e
	.word	46                      # 0x2e
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	32                      # 0x20
	.word	0                       # 0x0
	.size	.L__const._Z9runEditorv.text, 788

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

	.type	.L.str.31,@object       # @.str.31
	.section	.rodata.str4.4,"aMS",@progbits,4
	.p2align	2
.L.str.31:
	.word	105                     # 0x69
	.word	109                     # 0x6d
	.word	97                      # 0x61
	.word	103                     # 0x67
	.word	101                     # 0x65
	.word	115                     # 0x73
	.word	0                       # 0x0
	.size	.L.str.31, 28

	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym triangleArray
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
