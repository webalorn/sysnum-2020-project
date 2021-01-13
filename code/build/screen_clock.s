	.text
	.file	"screen_clock.cpp"
	.globl	_Z10memcpyCharPcPKcj    # -- Begin function _Z10memcpyCharPcPKcj
	.p2align	1
	.type	_Z10memcpyCharPcPKcj,@function
_Z10memcpyCharPcPKcj:                   # @_Z10memcpyCharPcPKcj
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
	.size	_Z10memcpyCharPcPKcj, .Lfunc_end0-_Z10memcpyCharPcPKcj
                                        # -- End function
	.globl	memcpy                  # -- Begin function memcpy
	.p2align	1
	.type	memcpy,@function
memcpy:                                 # @memcpy
# %bb.0:
	addi	a3, zero, 4
	bltu	a2, a3, .LBB1_4
# %bb.1:
	addi	a3, zero, 3
	add	a4, zero, a2
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
	.p2align	1
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
	.p2align	1
	.type	__mulsi3,@function
__mulsi3:                               # @__mulsi3
# %bb.0:
	mv	a2, zero
	beqz	a1, .LBB3_2
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	andi	a3, a1, 1
	neg	a3, a3
	and	a3, a3, a0
	add	a2, a2, a3
	srli	a1, a1, 1
	slli	a0, a0, 1
	bnez	a1, .LBB3_1
.LBB3_2:
	add	a0, zero, a2
	ret
.Lfunc_end3:
	.size	__mulsi3, .Lfunc_end3-__mulsi3
                                        # -- End function
	.globl	__muldi3                # -- Begin function __muldi3
	.p2align	1
	.type	__muldi3,@function
__muldi3:                               # @__muldi3
# %bb.0:
	mv	a2, zero
	beqz	a1, .LBB4_2
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	andi	a3, a1, 1
	neg	a3, a3
	and	a3, a3, a0
	add	a2, a2, a3
	srai	a1, a1, 1
	slli	a0, a0, 1
	bnez	a1, .LBB4_1
.LBB4_2:
	add	a0, zero, a2
	ret
.Lfunc_end4:
	.size	__muldi3, .Lfunc_end4-__muldi3
                                        # -- End function
	.globl	__udivsi3               # -- Begin function __udivsi3
	.p2align	1
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
	add	a5, zero, a1
	j	.LBB5_5
.LBB5_8:
	add	a0, zero, a2
	ret
.LBB5_9:
	mv	a0, zero
	ret
.Lfunc_end5:
	.size	__udivsi3, .Lfunc_end5-__udivsi3
                                        # -- End function
	.globl	__divsi3                # -- Begin function __divsi3
	.p2align	1
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
	or	a2, a2, a1
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
	add	a0, zero, a4
	j	.LBB6_4
.LBB6_7:
	bgez	a6, .LBB6_9
# %bb.8:
	neg	a2, a2
.LBB6_9:
	add	a0, zero, a2
	ret
.Lfunc_end6:
	.size	__divsi3, .Lfunc_end6-__divsi3
                                        # -- End function
	.globl	__umodsi3               # -- Begin function __umodsi3
	.p2align	1
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
	add	a3, zero, a1
	j	.LBB7_5
.Lfunc_end7:
	.size	__umodsi3, .Lfunc_end7-__umodsi3
                                        # -- End function
	.globl	_Z8uint2strjPDijDs      # -- Begin function _Z8uint2strjPDijDs
	.p2align	1
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
	add	a4, zero, a3
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
	.p2align	1
	.type	_Z6malloci,@function
_Z6malloci:                             # @_Z6malloci
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	beqz	a0, .LBB9_7
# %bb.1:
	add	s0, zero, a0
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
	add	a1, a1, a3
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
	add	a0, a0, a1
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
	.p2align	1
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
	.p2align	1
	.type	_Znwj,@function
_Znwj:                                  # @_Znwj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	beqz	a0, .LBB11_7
# %bb.1:
	add	s0, zero, a0
	lui	s1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(s1)
	beqz	a1, .LBB11_8
# %bb.2:
	lui	a0, %hi(allocSize)
	lw	a2, %lo(allocSize)(a0)
	mv	a0, zero
	add	a3, zero, a1
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
	add	a1, a1, a3
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
	add	a0, a0, a1
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
	.p2align	1
	.type	_Znaj,@function
_Znaj:                                  # @_Znaj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	beqz	a0, .LBB12_7
# %bb.1:
	add	s0, zero, a0
	lui	s1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(s1)
	beqz	a1, .LBB12_8
# %bb.2:
	lui	a0, %hi(allocSize)
	lw	a2, %lo(allocSize)(a0)
	mv	a0, zero
	add	a3, zero, a1
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
	add	a1, a1, a3
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
	add	a0, a0, a1
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
	.p2align	1
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
	.p2align	1
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
	.p2align	1
	.type	_Z14initMemManagerv,@function
_Z14initMemManagerv:                    # @_Z14initMemManagerv
# %bb.0:
	lui	a0, %hi(__asm__freept)
	lw	a1, %lo(__asm__freept)(a0)
	lui	a2, %hi(allocPos)
	sw	a1, %lo(allocPos)(a2)
	lui	a2, 1
	addi	a2, a2, -896
	add	a2, a2, a1
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
	.p2align	1
	.type	_ZlsR13TextOutStreamc,@function
_ZlsR13TextOutStreamc:                  # @_ZlsR13TextOutStreamc
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	add	s0, zero, a0
	lw	a0, 0(a0)
	lw	a2, 0(a0)
	add	a0, zero, s0
	jalr	a2
	add	a0, zero, s0
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end16:
	.size	_ZlsR13TextOutStreamc, .Lfunc_end16-_ZlsR13TextOutStreamc
                                        # -- End function
	.globl	_ZlsR13TextOutStreamPKDi # -- Begin function _ZlsR13TextOutStreamPKDi
	.p2align	1
	.type	_ZlsR13TextOutStreamPKDi,@function
_ZlsR13TextOutStreamPKDi:               # @_ZlsR13TextOutStreamPKDi
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	add	a2, zero, a1
	lw	a1, 0(a1)
	add	s0, zero, a0
	beqz	a1, .LBB17_3
# %bb.1:
	addi	s1, a2, 4
.LBB17_2:                               # =>This Inner Loop Header: Depth=1
	lw	a0, 0(s0)
	lw	a2, 0(a0)
	add	a0, zero, s0
	jalr	a2
	lw	a1, 0(s1)
	addi	s1, s1, 4
	bnez	a1, .LBB17_2
.LBB17_3:
	add	a0, zero, s0
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end17:
	.size	_ZlsR13TextOutStreamPKDi, .Lfunc_end17-_ZlsR13TextOutStreamPKDi
                                        # -- End function
	.globl	_ZlsR13TextOutStreamPKc # -- Begin function _ZlsR13TextOutStreamPKc
	.p2align	1
	.type	_ZlsR13TextOutStreamPKc,@function
_ZlsR13TextOutStreamPKc:                # @_ZlsR13TextOutStreamPKc
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	lbu	a2, 0(a1)
	add	s0, zero, a0
	beqz	a2, .LBB18_3
# %bb.1:
	addi	s1, a1, 1
.LBB18_2:                               # =>This Inner Loop Header: Depth=1
	lw	a0, 0(s0)
	lw	a3, 0(a0)
	andi	a1, a2, 255
	add	a0, zero, s0
	jalr	a3
	lbu	a2, 0(s1)
	addi	s1, s1, 1
	bnez	a2, .LBB18_2
.LBB18_3:
	add	a0, zero, s0
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end18:
	.size	_ZlsR13TextOutStreamPKc, .Lfunc_end18-_ZlsR13TextOutStreamPKc
                                        # -- End function
	.globl	_ZlsR13TextOutStreamj   # -- Begin function _ZlsR13TextOutStreamj
	.p2align	1
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
	add	s2, zero, a0
	beqz	a1, .LBB19_8
# %bb.1:
	add	s1, zero, a1
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
	add	a0, zero, s2
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
	add	a0, zero, s2
	jalr	a2
.LBB19_9:
	add	a0, zero, s2
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
	.p2align	1
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
	add	s1, zero, a1
	add	s2, zero, a0
	bge	a2, a1, .LBB20_4
# %bb.1:
	bnez	s1, .LBB20_5
# %bb.2:
	lw	a0, 0(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 48
	add	a0, zero, s2
	jalr	a2
.LBB20_3:
	add	a0, zero, s2
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
	add	a0, zero, s2
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
	add	a0, zero, s2
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
	.p2align	1
	.type	_ZlsR13TextOutStreamDi,@function
_ZlsR13TextOutStreamDi:                 # @_ZlsR13TextOutStreamDi
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	add	s0, zero, a0
	lw	a0, 0(a0)
	lw	a2, 0(a0)
	add	a0, zero, s0
	jalr	a2
	add	a0, zero, s0
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end21:
	.size	_ZlsR13TextOutStreamDi, .Lfunc_end21-_ZlsR13TextOutStreamDi
                                        # -- End function
	.globl	_ZlsR13TextOutStreamRK6string # -- Begin function _ZlsR13TextOutStreamRK6string
	.p2align	1
	.type	_ZlsR13TextOutStreamRK6string,@function
_ZlsR13TextOutStreamRK6string:          # @_ZlsR13TextOutStreamRK6string
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	sw	s2, 0(sp)
	lw	a2, 0(a1)
	add	s2, zero, a0
	beqz	a2, .LBB22_3
# %bb.1:
	lw	s1, 8(a1)
	slli	s0, a2, 2
.LBB22_2:                               # =>This Inner Loop Header: Depth=1
	lw	a0, 0(s2)
	lw	a1, 0(s1)
	lw	a2, 0(a0)
	add	a0, zero, s2
	jalr	a2
	addi	s0, s0, -4
	addi	s1, s1, 4
	bnez	s0, .LBB22_2
.LBB22_3:
	add	a0, zero, s2
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
	.p2align	1
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
	add	s2, zero, a2
	add	s0, zero, a1
	lw	s4, 0(a1)
	lw	s1, 0(a2)
	add	s3, zero, a0
	add	a1, s1, s4
	mv	a2, zero
	call	_ZN6vectorIDiEC2EjDi
	beqz	s4, .LBB23_3
# %bb.1:
	lw	a0, 8(s0)
	lw	a1, 8(s3)
	add	a2, zero, s4
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
	.globl	_Z9to_stringj           # -- Begin function _Z9to_stringj
	.p2align	1
	.type	_Z9to_stringj,@function
_Z9to_stringj:                          # @_Z9to_stringj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	add	s0, zero, a0
	mv	a1, zero
	mv	a2, zero
	call	_ZN6vectorIDiEC2EjDi
	addi	a1, zero, 11
	add	a0, zero, s0
	call	_ZN6vectorIDiE7reserveEj
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end24:
	.size	_Z9to_stringj, .Lfunc_end24-_Z9to_stringj
                                        # -- End function
	.section	.text._ZN6vectorIDiE7reserveEj,"axG",@progbits,_ZN6vectorIDiE7reserveEj,comdat
	.weak	_ZN6vectorIDiE7reserveEj # -- Begin function _ZN6vectorIDiE7reserveEj
	.p2align	1
	.type	_ZN6vectorIDiE7reserveEj,@function
_ZN6vectorIDiE7reserveEj:               # @_ZN6vectorIDiE7reserveEj
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	add	s0, zero, a0
	lw	a0, 4(a0)
	bgeu	a0, a1, .LBB25_26
.LBB25_1:                               # =>This Inner Loop Header: Depth=1
	slli	a0, a0, 1
	bltu	a0, a1, .LBB25_1
# %bb.2:
	sw	a0, 4(s0)
	lui	a1, 262144
	addi	a1, a1, -1
	and	a1, a1, a0
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
	add	a3, zero, a0
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
	add	a0, a0, a2
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
	add	a3, zero, a0
	add	a4, zero, s2
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
	.p2align	1
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
	add	a2, zero, a1
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
	.p2align	1
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
	.p2align	1
	.type	_ZrsR4FileRj,@function
_ZrsR4FileRj:                           # @_ZrsR4FileRj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	add	s0, zero, a0
	lw	a0, 0(a0)
	lw	a2, 0(a0)
	add	s1, zero, a1
	add	a0, zero, s0
	jalr	a2
	sw	a0, 0(s1)
	add	a0, zero, s0
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end28:
	.size	_ZrsR4FileRj, .Lfunc_end28-_ZrsR4FileRj
                                        # -- End function
	.globl	_Z19numberOfBytesInCharh # -- Begin function _Z19numberOfBytesInCharh
	.p2align	1
	.type	_Z19numberOfBytesInCharh,@function
_Z19numberOfBytesInCharh:               # @_Z19numberOfBytesInCharh
# %bb.0:
	slli	a1, a0, 24
	srai	a2, a1, 24
	addi	a3, zero, -1
	addi	a1, zero, 1
	bge	a3, a2, .LBB29_2
.LBB29_1:
	add	a0, zero, a1
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
	add	a0, zero, a1
	ret
.Lfunc_end29:
	.size	_Z19numberOfBytesInCharh, .Lfunc_end29-_Z19numberOfBytesInCharh
                                        # -- End function
	.globl	_Z9read_utf8R4File      # -- Begin function _Z9read_utf8R4File
	.p2align	1
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
	add	s0, zero, a1
	add	s2, zero, a0
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
	add	a1, zero, a0
.LBB30_2:
	add	a0, zero, s2
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
	add	a0, a0, a2
	sw	s1, 0(a0)
	sw	a1, 0(s2)
.LBB30_5:                               #   in Loop: Header=BB30_6 Depth=1
	lw	a0, 4(s0)
	lw	a1, 8(s0)
	bgeu	a0, a1, .LBB30_16
.LBB30_6:                               # =>This Inner Loop Header: Depth=1
	lw	a0, 0(s0)
	lw	a1, 4(a0)
	add	a0, zero, s0
	jalr	a1
	add	s1, zero, a0
	bltu	a0, s3, .LBB30_8
# %bb.7:                                #   in Loop: Header=BB30_6 Depth=1
	lw	a0, 0(s0)
	lw	a1, 4(a0)
	slli	a0, s1, 6
	andi	s1, a0, 1984
	add	a0, zero, s0
	jalr	a1
	lw	a1, 0(s0)
	lw	a1, 4(a1)
	andi	a0, a0, 63
	or	s1, s1, a0
	add	a0, zero, s0
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
	add	a0, zero, s0
	jalr	a1
	lw	a1, 0(s0)
	lw	a1, 4(a1)
	andi	a0, a0, 63
	or	a0, a0, s1
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
	add	a0, zero, s0
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
	add	a0, zero, s2
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
	.globl	_Z12setScreenPosjj      # -- Begin function _Z12setScreenPosjj
	.p2align	1
	.type	_Z12setScreenPosjj,@function
_Z12setScreenPosjj:                     # @_Z12setScreenPosjj
# %bb.0:
	slli	a1, a1, 8
	add	a0, a0, a1
	slli	a0, a0, 8
	ori	a0, a0, 1
	lui	a1, 655360
	sw	a0, 12(a1)
	ret
.Lfunc_end31:
	.size	_Z12setScreenPosjj, .Lfunc_end31-_Z12setScreenPosjj
                                        # -- End function
	.globl	_Z14setScreenColorjjj   # -- Begin function _Z14setScreenColorjjj
	.p2align	1
	.type	_Z14setScreenColorjjj,@function
_Z14setScreenColorjjj:                  # @_Z14setScreenColorjjj
# %bb.0:
	slli	a2, a2, 8
	add	a1, a1, a2
	slli	a1, a1, 8
	add	a0, a0, a1
	slli	a0, a0, 8
	ori	a0, a0, 2
	lui	a1, 655360
	sw	a0, 12(a1)
	ret
.Lfunc_end32:
	.size	_Z14setScreenColorjjj, .Lfunc_end32-_Z14setScreenColorjjj
                                        # -- End function
	.globl	_Z8setPixeljj           # -- Begin function _Z8setPixeljj
	.p2align	1
	.type	_Z8setPixeljj,@function
_Z8setPixeljj:                          # @_Z8setPixeljj
# %bb.0:
	slli	a1, a1, 8
	add	a0, a0, a1
	slli	a0, a0, 8
	ori	a0, a0, 3
	lui	a1, 655360
	sw	a0, 12(a1)
	ret
.Lfunc_end33:
	.size	_Z8setPixeljj, .Lfunc_end33-_Z8setPixeljj
                                        # -- End function
	.globl	_Z13setPixelColorjjjjj  # -- Begin function _Z13setPixelColorjjjjj
	.p2align	1
	.type	_Z13setPixelColorjjjjj,@function
_Z13setPixelColorjjjjj:                 # @_Z13setPixelColorjjjjj
# %bb.0:
	slli	a4, a4, 8
	add	a3, a3, a4
	slli	a3, a3, 8
	add	a2, a2, a3
	slli	a2, a2, 8
	ori	a2, a2, 2
	lui	a3, 655360
	sw	a2, 12(a3)
	slli	a1, a1, 8
	add	a0, a0, a1
	slli	a0, a0, 8
	ori	a0, a0, 3
	sw	a0, 12(a3)
	ret
.Lfunc_end34:
	.size	_Z13setPixelColorjjjjj, .Lfunc_end34-_Z13setPixelColorjjjjj
                                        # -- End function
	.globl	_Z13drawRectanglejj     # -- Begin function _Z13drawRectanglejj
	.p2align	1
	.type	_Z13drawRectanglejj,@function
_Z13drawRectanglejj:                    # @_Z13drawRectanglejj
# %bb.0:
	slli	a1, a1, 8
	add	a0, a0, a1
	slli	a0, a0, 8
	ori	a0, a0, 4
	lui	a1, 655360
	sw	a0, 12(a1)
	ret
.Lfunc_end35:
	.size	_Z13drawRectanglejj, .Lfunc_end35-_Z13drawRectanglejj
                                        # -- End function
	.globl	_Z11drawTexturej        # -- Begin function _Z11drawTexturej
	.p2align	1
	.type	_Z11drawTexturej,@function
_Z11drawTexturej:                       # @_Z11drawTexturej
# %bb.0:
	slli	a0, a0, 8
	ori	a0, a0, 5
	lui	a1, 655360
	sw	a0, 12(a1)
	ret
.Lfunc_end36:
	.size	_Z11drawTexturej, .Lfunc_end36-_Z11drawTexturej
                                        # -- End function
	.globl	_Z19startSendingTexturej # -- Begin function _Z19startSendingTexturej
	.p2align	1
	.type	_Z19startSendingTexturej,@function
_Z19startSendingTexturej:               # @_Z19startSendingTexturej
# %bb.0:
	slli	a0, a0, 8
	ori	a0, a0, 6
	lui	a1, 655360
	sw	a0, 12(a1)
	ret
.Lfunc_end37:
	.size	_Z19startSendingTexturej, .Lfunc_end37-_Z19startSendingTexturej
                                        # -- End function
	.globl	_Z16sendTexturePixeljjjj # -- Begin function _Z16sendTexturePixeljjjj
	.p2align	1
	.type	_Z16sendTexturePixeljjjj,@function
_Z16sendTexturePixeljjjj:               # @_Z16sendTexturePixeljjjj
# %bb.0:
	beqz	a3, .LBB38_2
# %bb.1:
	slli	a3, a3, 8
	add	a2, a2, a3
	slli	a2, a2, 8
	add	a1, a1, a2
	slli	a1, a1, 8
	add	a0, a0, a1
	j	.LBB38_3
.LBB38_2:
	lui	a0, 16
	addi	a0, a0, 257
.LBB38_3:
	lui	a1, 655360
	sw	a0, 12(a1)
	ret
.Lfunc_end38:
	.size	_Z16sendTexturePixeljjjj, .Lfunc_end38-_Z16sendTexturePixeljjjj
                                        # -- End function
	.globl	_Z13refreshScreenv      # -- Begin function _Z13refreshScreenv
	.p2align	1
	.type	_Z13refreshScreenv,@function
_Z13refreshScreenv:                     # @_Z13refreshScreenv
# %bb.0:
	lui	a0, 655360
	addi	a1, zero, 42
	sw	a1, 12(a0)
	ret
.Lfunc_end39:
	.size	_Z13refreshScreenv, .Lfunc_end39-_Z13refreshScreenv
                                        # -- End function
	.globl	_Z11sendTextureR4Filej  # -- Begin function _Z11sendTextureR4Filej
	.p2align	1
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
	add	s0, zero, a0
	lw	a0, 0(a0)
	lw	a2, 0(a0)
	add	s3, zero, a1
	add	a0, zero, s0
	jalr	a2
	lw	a1, 0(s0)
	lw	a1, 0(a1)
	add	s2, zero, a0
	add	a0, zero, s0
	jalr	a1
	add	s4, zero, a0
	slli	a0, s2, 8
	add	a0, a0, s4
	slli	a0, a0, 8
	ori	a0, a0, 1
	lui	s5, 655360
	sw	a0, 12(s5)
	slli	a0, s3, 8
	ori	a0, a0, 6
	sw	a0, 12(s5)
	beqz	s2, .LBB40_5
# %bb.1:
	mv	s3, zero
	j	.LBB40_3
.LBB40_2:                               #   in Loop: Header=BB40_3 Depth=1
	addi	s3, s3, 1
	beq	s3, s2, .LBB40_5
.LBB40_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB40_4 Depth 2
	add	s1, zero, s4
	beqz	s4, .LBB40_2
.LBB40_4:                               #   Parent Loop BB40_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, 0(s0)
	lw	a1, 0(a0)
	add	a0, zero, s0
	jalr	a1
	addi	s1, s1, -1
	sw	a0, 12(s5)
	bnez	s1, .LBB40_4
	j	.LBB40_2
.LBB40_5:
	lw	s5, 4(sp)
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end40:
	.size	_Z11sendTextureR4Filej, .Lfunc_end40-_Z11sendTextureR4Filej
                                        # -- End function
	.globl	_Z16drawFullTrianglejjjjjjjjj # -- Begin function _Z16drawFullTrianglejjjjjjjjj
	.p2align	1
	.type	_Z16drawFullTrianglejjjjjjjjj,@function
_Z16drawFullTrianglejjjjjjjjj:          # @_Z16drawFullTrianglejjjjjjjjj
# %bb.0:
	lw	t0, 0(sp)
	slli	a1, a1, 8
	add	a0, a0, a1
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
.Lfunc_end41:
	.size	_Z16drawFullTrianglejjjjjjjjj, .Lfunc_end41-_Z16drawFullTrianglejjjjjjjjj
                                        # -- End function
	.globl	_Z9load_tilejjPKDi      # -- Begin function _Z9load_tilejjPKDi
	.p2align	1
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
	beqz	a3, .LBB42_3
# %bb.1:
	mv	a5, zero
	addi	a3, a2, 4
.LBB42_2:                               # =>This Inner Loop Header: Depth=1
	lw	a4, 0(a3)
	addi	a5, a5, 1
	addi	a3, a3, 4
	bnez	a4, .LBB42_2
	j	.LBB42_4
.LBB42_3:
	mv	a5, zero
.LBB42_4:
	addi	a3, a1, 4
	lui	t0, 655360
	sw	a3, 8(t0)
	lui	t1, 524288
	lw	a6, 4(t1)
	beqz	a6, .LBB42_12
# %bb.5:
	mv	t2, zero
	addi	a1, a1, 8
.LBB42_6:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB42_10 Depth 2
	sw	a1, 8(t0)
	lw	a7, 4(t1)
	addi	a3, a1, 4
	sw	a3, 8(t0)
	lw	s1, 4(t1)
	addi	a1, a1, 8
	xor	a3, a5, s1
	seqz	a3, a3
	add	a4, zero, a2
	bnez	s1, .LBB42_10
.LBB42_7:                               #   in Loop: Header=BB42_6 Depth=1
	bnez	a3, .LBB42_13
# %bb.8:                                #   in Loop: Header=BB42_6 Depth=1
	addi	t2, t2, 1
	bne	t2, a6, .LBB42_6
	j	.LBB42_12
.LBB42_9:                               #   in Loop: Header=BB42_10 Depth=2
	addi	a1, a1, 4
	addi	s1, s1, -1
	addi	a4, a4, 4
	beqz	s1, .LBB42_7
.LBB42_10:                              #   Parent Loop BB42_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	s0, a3, 1
	mv	a3, zero
	beqz	s0, .LBB42_9
# %bb.11:                               #   in Loop: Header=BB42_10 Depth=2
	sw	a1, 8(t0)
	lw	a3, 4(t1)
	lw	s0, 0(a4)
	xor	a3, a3, s0
	seqz	a3, a3
	j	.LBB42_9
.LBB42_12:
	mv	a7, zero
.LBB42_13:
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
	add	a1, a1, s3
	slli	a1, a1, 8
	ori	a1, a1, 1
	sw	a1, 12(t0)
	slli	a0, a0, 8
	ori	a0, a0, 6
	sw	a0, 12(t0)
	beqz	s2, .LBB42_18
# %bb.14:
	mv	s4, zero
	addi	s0, sp, 8
	lui	s5, 655360
	j	.LBB42_16
.LBB42_15:                              #   in Loop: Header=BB42_16 Depth=1
	addi	s4, s4, 1
	beq	s4, s2, .LBB42_18
.LBB42_16:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB42_17 Depth 2
	add	s1, zero, s3
	beqz	s3, .LBB42_15
.LBB42_17:                              #   Parent Loop BB42_16 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, 8(sp)
	lw	a1, 0(a0)
	add	a0, zero, s0
	jalr	a1
	addi	s1, s1, -1
	sw	a0, 12(s5)
	bnez	s1, .LBB42_17
	j	.LBB42_15
.LBB42_18:
	lw	s5, 20(sp)
	lw	s4, 24(sp)
	lw	s3, 28(sp)
	lw	s2, 32(sp)
	lw	s1, 36(sp)
	lw	s0, 40(sp)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end42:
	.size	_Z9load_tilejjPKDi, .Lfunc_end42-_Z9load_tilejjPKDi
                                        # -- End function
	.globl	_Z19load_alphabet_tilesj # -- Begin function _Z19load_alphabet_tilesj
	.p2align	1
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
	add	s2, zero, a0
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
	add	a1, zero, s2
	call	_Z9load_tilejjPKDi
	addi	s1, zero, 97
	addi	s3, sp, 36
	addi	s0, zero, 123
.LBB43_1:                               # =>This Inner Loop Header: Depth=1
	sw	s1, 36(sp)
	add	a0, zero, s1
	add	a1, zero, s2
	add	a2, zero, s3
	call	_Z9load_tilejjPKDi
	addi	s1, s1, 1
	bne	s1, s0, .LBB43_1
# %bb.2:
	addi	s1, zero, 65
	addi	s3, sp, 4
	addi	s0, zero, 91
.LBB43_3:                               # =>This Inner Loop Header: Depth=1
	sw	s1, 12(sp)
	add	a0, zero, s1
	add	a1, zero, s2
	add	a2, zero, s3
	call	_Z9load_tilejjPKDi
	addi	s1, s1, 1
	bne	s1, s0, .LBB43_3
# %bb.4:
	addi	a0, zero, 48
	sw	a0, 36(sp)
	addi	s1, sp, 36
	addi	a0, zero, 48
	add	a1, zero, s2
	add	a2, zero, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 49
	sw	a0, 36(sp)
	addi	a0, zero, 49
	add	a1, zero, s2
	add	a2, zero, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 50
	sw	a0, 36(sp)
	addi	a0, zero, 50
	add	a1, zero, s2
	add	a2, zero, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 51
	sw	a0, 36(sp)
	addi	a0, zero, 51
	add	a1, zero, s2
	add	a2, zero, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 52
	sw	a0, 36(sp)
	addi	a0, zero, 52
	add	a1, zero, s2
	add	a2, zero, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 53
	sw	a0, 36(sp)
	addi	a0, zero, 53
	add	a1, zero, s2
	add	a2, zero, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 54
	sw	a0, 36(sp)
	addi	a0, zero, 54
	add	a1, zero, s2
	add	a2, zero, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 55
	sw	a0, 36(sp)
	addi	a0, zero, 55
	add	a1, zero, s2
	add	a2, zero, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 56
	sw	a0, 36(sp)
	addi	a0, zero, 56
	add	a1, zero, s2
	add	a2, zero, s1
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 57
	sw	a0, 36(sp)
	addi	a0, zero, 57
	add	a1, zero, s2
	add	a2, zero, s1
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.1)
	addi	a2, a0, %lo(.L.str.1)
	addi	a0, zero, 58
	add	a1, zero, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.2)
	addi	a2, a0, %lo(.L.str.2)
	addi	a0, zero, 40
	add	a1, zero, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.3)
	addi	a2, a0, %lo(.L.str.3)
	addi	a0, zero, 41
	add	a1, zero, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.4)
	addi	a2, a0, %lo(.L.str.4)
	addi	a0, zero, 91
	add	a1, zero, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.5)
	addi	a2, a0, %lo(.L.str.5)
	addi	a0, zero, 93
	add	a1, zero, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.6)
	addi	a2, a0, %lo(.L.str.6)
	addi	a0, zero, 59
	add	a1, zero, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.7)
	addi	a2, a0, %lo(.L.str.7)
	addi	a0, zero, 46
	add	a1, zero, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.8)
	addi	a2, a0, %lo(.L.str.8)
	addi	a0, zero, 37
	add	a1, zero, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.9)
	addi	a2, a0, %lo(.L.str.9)
	addi	a0, zero, 45
	add	a1, zero, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.10)
	addi	a2, a0, %lo(.L.str.10)
	addi	a0, zero, 44
	add	a1, zero, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.11)
	addi	a2, a0, %lo(.L.str.11)
	addi	a0, zero, 33
	add	a1, zero, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.12)
	addi	a2, a0, %lo(.L.str.12)
	addi	a0, zero, 63
	add	a1, zero, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.13)
	addi	a2, a0, %lo(.L.str.13)
	addi	a0, zero, 47
	add	a1, zero, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.14)
	addi	s0, a0, %lo(.L.str.14)
	addi	a0, zero, 92
	add	a1, zero, s2
	add	a2, zero, s0
	call	_Z9load_tilejjPKDi
	addi	a0, zero, 92
	add	a1, zero, s2
	add	a2, zero, s0
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.15)
	addi	a2, a0, %lo(.L.str.15)
	addi	a0, zero, 60
	add	a1, zero, s2
	call	_Z9load_tilejjPKDi
	lui	a0, %hi(.L.str.16)
	addi	a2, a0, %lo(.L.str.16)
	addi	a0, zero, 62
	add	a1, zero, s2
	lw	s3, 60(sp)
	lw	s2, 64(sp)
	lw	s1, 68(sp)
	lw	s0, 72(sp)
	lw	ra, 76(sp)
	addi	sp, sp, 80
	tail	_Z9load_tilejjPKDi
.Lfunc_end43:
	.size	_Z19load_alphabet_tilesj, .Lfunc_end43-_Z19load_alphabet_tilesj
                                        # -- End function
	.globl	_Z15load_game_tilesj    # -- Begin function _Z15load_game_tilesj
	.p2align	1
	.type	_Z15load_game_tilesj,@function
_Z15load_game_tilesj:                   # @_Z15load_game_tilesj
# %bb.0:
	mv	a2, zero
	addi	a0, zero, 9
	addi	a1, zero, 99
	j	.LBB44_2
.LBB44_1:                               #   in Loop: Header=BB44_2 Depth=1
	beq	a2, a1, .LBB44_7
.LBB44_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB44_4 Depth 2
                                        #     Child Loop BB44_6 Depth 2
	add	a4, zero, a2
	addi	a2, a2, 1
	add	a3, zero, a2
	bltu	a4, a0, .LBB44_6
# %bb.3:                                #   in Loop: Header=BB44_2 Depth=1
	add	a3, zero, a2
.LBB44_4:                               #   Parent Loop BB44_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	a3, a3, -10
	bltu	a0, a3, .LBB44_4
# %bb.5:                                #   in Loop: Header=BB44_2 Depth=1
	beqz	a3, .LBB44_1
.LBB44_6:                               #   Parent Loop BB44_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	a3, a3, -1
	bnez	a3, .LBB44_6
	j	.LBB44_1
.LBB44_7:
	ret
.Lfunc_end44:
	.size	_Z15load_game_tilesj, .Lfunc_end44-_Z15load_game_tilesj
                                        # -- End function
	.globl	_Z14load_all_tilesj     # -- Begin function _Z14load_all_tilesj
	.p2align	1
	.type	_Z14load_all_tilesj,@function
_Z14load_all_tilesj:                    # @_Z14load_all_tilesj
# %bb.0:
	addi	a1, a0, 4
	lui	t0, 655360
	sw	a1, 8(t0)
	lui	t1, 524288
	lw	a7, 4(t1)
	beqz	a7, .LBB45_9
# %bb.1:
	mv	t2, zero
	addi	a5, a0, 8
	lui	a0, %hi(.L.str.17)
	addi	a6, a0, %lo(.L.str.17)
.LBB45_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB45_5 Depth 2
	sw	a5, 8(t0)
	lw	a0, 4(t1)
	addi	a1, a5, 4
	sw	a1, 8(t0)
	lw	a3, 4(t1)
	addi	a5, a5, 8
	xori	a1, a3, 8
	seqz	a1, a1
	beqz	a3, .LBB45_7
# %bb.3:                                #   in Loop: Header=BB45_2 Depth=1
	add	a2, zero, a6
	j	.LBB45_5
.LBB45_4:                               #   in Loop: Header=BB45_5 Depth=2
	addi	a5, a5, 4
	addi	a3, a3, -1
	addi	a2, a2, 4
	beqz	a3, .LBB45_7
.LBB45_5:                               #   Parent Loop BB45_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	a4, a1, 1
	mv	a1, zero
	beqz	a4, .LBB45_4
# %bb.6:                                #   in Loop: Header=BB45_5 Depth=2
	sw	a5, 8(t0)
	lw	a1, 4(t1)
	lw	a4, 0(a2)
	xor	a1, a1, a4
	seqz	a1, a1
	j	.LBB45_4
.LBB45_7:                               #   in Loop: Header=BB45_2 Depth=1
	bnez	a1, .LBB45_10
# %bb.8:                                #   in Loop: Header=BB45_2 Depth=1
	addi	t2, t2, 1
	bne	t2, a7, .LBB45_2
.LBB45_9:
	mv	a0, zero
.LBB45_10:
	tail	_Z19load_alphabet_tilesj
.Lfunc_end45:
	.size	_Z14load_all_tilesj, .Lfunc_end45-_Z14load_all_tilesj
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -64
	sw	ra, 60(sp)
	sw	s0, 56(sp)
	sw	s1, 52(sp)
	sw	s2, 48(sp)
	sw	s3, 44(sp)
	lui	a0, %hi(__asm__freept)
	lw	a1, %lo(__asm__freept)(a0)
	lui	a2, %hi(allocPos)
	sw	a1, %lo(allocPos)(a2)
	lui	a2, 1
	addi	a2, a2, -896
	add	a2, a2, a1
	lui	a3, %hi(allocSize)
	sw	a2, %lo(allocSize)(a3)
	lui	a2, 2
	lui	s2, %hi(_ZL4cout)
	lw	a3, %lo(_ZL4cout)(s2)
	addi	a2, a2, -1792
	add	a1, a1, a2
	sw	a1, %lo(__asm__freept)(a0)
	lw	a2, 0(a3)
	addi	s0, s2, %lo(_ZL4cout)
	addi	a1, zero, 67
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 108
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 111
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 99
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 107
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 32
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 111
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 110
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 32
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 115
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 99
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 114
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 101
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 101
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 110
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 32
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	lui	a0, 31
	addi	a1, a0, 1392
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 10
	add	a0, zero, s0
	jalr	a2
	lui	s1, 655360
	addi	a0, zero, 4
	sw	a0, 8(s1)
	lui	a0, 524288
	lw	s3, 4(a0)
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 76
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 111
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 97
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 100
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 105
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 110
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 103
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 32
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 115
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 112
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 114
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 105
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 116
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 101
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 115
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 46
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 46
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 46
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 10
	add	a0, zero, s0
	jalr	a2
	addi	a0, s3, 16
	call	_Z19load_alphabet_tilesj
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 68
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 111
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 110
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 101
	add	a0, zero, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 10
	add	a0, zero, s0
	jalr	a2
	mv	a4, zero
	mv	a3, zero
	mv	a0, zero
	addi	a5, zero, 72
	lui	a1, %hi(.L.str.21+4)
	addi	a1, a1, %lo(.L.str.21+4)
	addi	a2, zero, 6
	j	.LBB46_3
.LBB46_1:                               #   in Loop: Header=BB46_3 Depth=1
	addi	a3, a3, 7
.LBB46_2:                               #   in Loop: Header=BB46_3 Depth=1
	lw	a5, 0(a1)
	addi	a1, a1, 4
	beqz	a5, .LBB46_5
.LBB46_3:                               # =>This Inner Loop Header: Depth=1
	slli	s0, a0, 8
	add	s0, s0, a3
	slli	s0, s0, 8
	ori	s0, s0, 1
	sw	s0, 12(s1)
	slli	a5, a5, 8
	ori	a5, a5, 5
	addi	a4, a4, 1
	sw	a5, 12(s1)
	bne	a4, a2, .LBB46_1
# %bb.4:                                #   in Loop: Header=BB46_3 Depth=1
	mv	a3, zero
	mv	a4, zero
	addi	a0, a0, 7
	j	.LBB46_2
.LBB46_5:
	lui	s0, 655360
	addi	s2, zero, 42
	sw	s2, 12(s0)
	lui	a0, %hi(.L__const.main.time_str)
	addi	a1, a0, %lo(.L__const.main.time_str)
	addi	a0, sp, 8
	addi	a2, zero, 36
	call	memcpy
	addi	t6, zero, 48
	addi	a7, sp, 12
	addi	t0, zero, 58
	addi	a6, zero, 54
	addi	a3, zero, 14
	addi	t4, zero, 48
	addi	t3, zero, 48
	addi	t2, zero, 48
	addi	t1, zero, 48
	addi	t5, zero, 48
	j	.LBB46_7
.LBB46_6:                               #   in Loop: Header=BB46_7 Depth=1
	sw	s2, 12(s0)
.LBB46_7:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB46_22 Depth 2
	addi	t6, t6, 1
	bne	t6, t0, .LBB46_18
# %bb.8:                                #   in Loop: Header=BB46_7 Depth=1
	addi	t4, t4, 1
	addi	t6, zero, 48
	bne	t4, a6, .LBB46_18
# %bb.9:                                #   in Loop: Header=BB46_7 Depth=1
	addi	t3, t3, 1
	addi	t6, zero, 48
	beq	t3, t0, .LBB46_11
# %bb.10:                               #   in Loop: Header=BB46_7 Depth=1
	addi	t4, zero, 48
	j	.LBB46_18
.LBB46_11:                              #   in Loop: Header=BB46_7 Depth=1
	addi	t2, t2, 1
	addi	t6, zero, 48
	beq	t2, a6, .LBB46_13
# %bb.12:                               #   in Loop: Header=BB46_7 Depth=1
	addi	t4, zero, 48
	addi	t3, zero, 48
	j	.LBB46_18
.LBB46_13:                              #   in Loop: Header=BB46_7 Depth=1
	addi	a2, t1, 1
	xori	a0, a2, 58
	seqz	a1, a0
	addi	t6, zero, 48
	addi	a0, zero, 48
	beq	a2, t0, .LBB46_15
# %bb.14:                               #   in Loop: Header=BB46_7 Depth=1
	add	a0, zero, a2
.LBB46_15:                              #   in Loop: Header=BB46_7 Depth=1
	add	a1, a1, t5
	xori	a2, a0, 52
	xori	a5, a1, 50
	or	a2, a2, a5
	addi	t1, zero, 48
	addi	t5, zero, 48
	beqz	a2, .LBB46_17
# %bb.16:                               #   in Loop: Header=BB46_7 Depth=1
	add	t1, zero, a0
	add	t5, zero, a1
.LBB46_17:                              #   in Loop: Header=BB46_7 Depth=1
	addi	t4, zero, 48
	addi	t3, zero, 48
	addi	t2, zero, 48
.LBB46_18:                              #   in Loop: Header=BB46_7 Depth=1
	sw	t5, 8(sp)
	sw	t1, 12(sp)
	sw	t2, 20(sp)
	sw	t3, 24(sp)
	sw	t4, 32(sp)
	sw	t6, 36(sp)
	beqz	t5, .LBB46_6
# %bb.19:                               #   in Loop: Header=BB46_7 Depth=1
	mv	s1, zero
	addi	a2, zero, 46
	addi	a1, zero, 22
	add	a0, zero, a7
	add	a5, zero, t5
	j	.LBB46_22
.LBB46_20:                              #   in Loop: Header=BB46_22 Depth=2
	addi	a1, a1, 7
.LBB46_21:                              #   in Loop: Header=BB46_22 Depth=2
	lw	a5, 0(a0)
	addi	a0, a0, 4
	beqz	a5, .LBB46_6
.LBB46_22:                              #   Parent Loop BB46_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a4, a2, 8
	add	a4, a4, a1
	slli	a4, a4, 8
	ori	a4, a4, 1
	sw	a4, 12(s0)
	slli	a4, a5, 8
	ori	a4, a4, 5
	addi	s1, s1, 1
	sw	a4, 12(s0)
	bne	s1, a3, .LBB46_20
# %bb.23:                               #   in Loop: Header=BB46_22 Depth=2
	mv	s1, zero
	addi	a2, a2, 7
	addi	a1, zero, 22
	j	.LBB46_21
.Lfunc_end46:
	.size	main, .Lfunc_end46-main
                                        # -- End function
	.section	.text._ZN6vectorIDiEC2EjDi,"axG",@progbits,_ZN6vectorIDiEC2EjDi,comdat
	.weak	_ZN6vectorIDiEC2EjDi    # -- Begin function _ZN6vectorIDiEC2EjDi
	.p2align	1
	.type	_ZN6vectorIDiEC2EjDi,@function
_ZN6vectorIDiEC2EjDi:                   # @_ZN6vectorIDiEC2EjDi
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	add	s0, zero, a0
	sw	zero, 0(a0)
	addi	a0, zero, 2
	sw	a0, 4(s0)
	lui	s3, %hi(nbBlocks)
	lw	a6, %lo(nbBlocks)(s3)
	add	s2, zero, a2
	add	s1, zero, a1
	beqz	a6, .LBB47_6
# %bb.1:
	lui	a0, %hi(allocSize)
	lw	a2, %lo(allocSize)(a0)
	mv	a1, zero
	addi	a3, zero, 7
	add	a4, zero, a6
.LBB47_2:                               # =>This Inner Loop Header: Depth=1
	add	a5, a2, a1
	lw	a0, 0(a5)
	blt	a3, a0, .LBB47_8
# %bb.3:                                #   in Loop: Header=BB47_2 Depth=1
	addi	a4, a4, -1
	addi	a1, a1, 4
	bnez	a4, .LBB47_2
# %bb.4:
	addi	a0, zero, 100
	bne	a6, a0, .LBB47_7
# %bb.5:
	addi	a0, zero, 29
	call	exit
	lui	a0, %hi(nbBlocks)
	lw	a6, %lo(nbBlocks)(a0)
	j	.LBB47_7
.LBB47_6:
	mv	a6, zero
.LBB47_7:
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
	j	.LBB47_9
.LBB47_8:
	neg	a0, a0
	sw	a0, 0(a5)
	lui	a0, %hi(allocPos)
	lw	a0, %lo(allocPos)(a0)
	add	a0, a0, a1
	lw	a1, 0(a0)
.LBB47_9:
	lw	a2, 0(s0)
	sw	a1, 8(s0)
	bgeu	a2, s1, .LBB47_16
# %bb.10:
	lw	a0, 4(s0)
	bgeu	a0, s1, .LBB47_13
.LBB47_11:                              # =>This Inner Loop Header: Depth=1
	add	a0, zero, s0
	add	a1, zero, s1
	call	_ZN6vectorIDiE7reserveEj
	lw	a0, 4(s0)
	bltu	a0, s1, .LBB47_11
# %bb.12:
	lw	a2, 0(s0)
.LBB47_13:
	bgeu	a2, s1, .LBB47_17
# %bb.14:
	lw	a1, 8(s0)
	sub	a0, s1, a2
	slli	a2, a2, 2
	add	a1, a1, a2
.LBB47_15:                              # =>This Inner Loop Header: Depth=1
	sw	s2, 0(a1)
	addi	a0, a0, -1
	addi	a1, a1, 4
	bnez	a0, .LBB47_15
.LBB47_16:
	sw	s1, 0(s0)
.LBB47_17:
	addi	a1, zero, 2
	add	a0, zero, s0
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	tail	_ZN6vectorIDiE7reserveEj
.Lfunc_end47:
	.size	_ZN6vectorIDiEC2EjDi, .Lfunc_end47-_ZN6vectorIDiEC2EjDi
                                        # -- End function
	.section	.text._ZN4File8readWordEv,"axG",@progbits,_ZN4File8readWordEv,comdat
	.weak	_ZN4File8readWordEv     # -- Begin function _ZN4File8readWordEv
	.p2align	1
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
	add	a0, zero, a1
	ret
.Lfunc_end48:
	.size	_ZN4File8readWordEv, .Lfunc_end48-_ZN4File8readWordEv
                                        # -- End function
	.section	.text._ZN4File8readByteEv,"axG",@progbits,_ZN4File8readByteEv,comdat
	.weak	_ZN4File8readByteEv     # -- Begin function _ZN4File8readByteEv
	.p2align	1
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
	add	a0, zero, a1
	ret
.Lfunc_end49:
	.size	_ZN4File8readByteEv, .Lfunc_end49-_ZN4File8readByteEv
                                        # -- End function
	.section	.text._ZN17StandardOutStream9send_wordEj,"axG",@progbits,_ZN17StandardOutStream9send_wordEj,comdat
	.weak	_ZN17StandardOutStream9send_wordEj # -- Begin function _ZN17StandardOutStream9send_wordEj
	.p2align	1
	.type	_ZN17StandardOutStream9send_wordEj,@function
_ZN17StandardOutStream9send_wordEj:     # @_ZN17StandardOutStream9send_wordEj
# %bb.0:
	lui	a0, 655360
	sw	a1, 4(a0)
	ret
.Lfunc_end50:
	.size	_ZN17StandardOutStream9send_wordEj, .Lfunc_end50-_ZN17StandardOutStream9send_wordEj
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
	.word	97                      # 0x61
	.word	108                     # 0x6c
	.word	112                     # 0x70
	.word	104                     # 0x68
	.word	97                      # 0x61
	.word	98                      # 0x62
	.word	101                     # 0x65
	.word	116                     # 0x74
	.word	0                       # 0x0
	.size	.L.str.17, 36

	.type	.L.str.21,@object       # @.str.21
	.p2align	2
.L.str.21:
	.word	72                      # 0x48
	.word	101                     # 0x65
	.word	108                     # 0x6c
	.word	108                     # 0x6c
	.word	111                     # 0x6f
	.word	32                      # 0x20
	.word	116                     # 0x74
	.word	104                     # 0x68
	.word	101                     # 0x65
	.word	114                     # 0x72
	.word	101                     # 0x65
	.word	32                      # 0x20
	.word	33                      # 0x21
	.word	0                       # 0x0
	.size	.L.str.21, 56

	.type	.L__const.main.time_str,@object # @__const.main.time_str
	.p2align	2
.L__const.main.time_str:
	.word	48                      # 0x30
	.word	48                      # 0x30
	.word	58                      # 0x3a
	.word	48                      # 0x30
	.word	48                      # 0x30
	.word	58                      # 0x3a
	.word	48                      # 0x30
	.word	48                      # 0x30
	.word	0                       # 0x0
	.size	.L__const.main.time_str, 36

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

	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
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
