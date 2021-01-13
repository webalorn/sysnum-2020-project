	.text
	.file	"main.cpp"
	.globl	_Z10memcpyCharPcPKcj    # -- Begin function _Z10memcpyCharPcPKcj
	.p2align	2
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
	.globl	_Z9to_stringj           # -- Begin function _Z9to_stringj
	.p2align	2
	.type	_Z9to_stringj,@function
_Z9to_stringj:                          # @_Z9to_stringj
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	mv	s0, a0
	mv	a1, zero
	mv	a2, zero
	call	_ZN6vectorIDiEC2EjDi
	addi	a1, zero, 11
	mv	a0, s0
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
	.globl	_Z12setScreenPosjj      # -- Begin function _Z12setScreenPosjj
	.p2align	2
	.type	_Z12setScreenPosjj,@function
_Z12setScreenPosjj:                     # @_Z12setScreenPosjj
# %bb.0:
	slli	a1, a1, 8
	add	a0, a1, a0
	slli	a0, a0, 8
	ori	a0, a0, 1
	lui	a1, 655360
	sw	a0, 12(a1)
	ret
.Lfunc_end31:
	.size	_Z12setScreenPosjj, .Lfunc_end31-_Z12setScreenPosjj
                                        # -- End function
	.globl	_Z14setScreenColorjjj   # -- Begin function _Z14setScreenColorjjj
	.p2align	2
	.type	_Z14setScreenColorjjj,@function
_Z14setScreenColorjjj:                  # @_Z14setScreenColorjjj
# %bb.0:
	slli	a2, a2, 8
	add	a1, a2, a1
	slli	a1, a1, 8
	add	a0, a1, a0
	slli	a0, a0, 8
	ori	a0, a0, 2
	lui	a1, 655360
	sw	a0, 12(a1)
	ret
.Lfunc_end32:
	.size	_Z14setScreenColorjjj, .Lfunc_end32-_Z14setScreenColorjjj
                                        # -- End function
	.globl	_Z8setPixeljj           # -- Begin function _Z8setPixeljj
	.p2align	2
	.type	_Z8setPixeljj,@function
_Z8setPixeljj:                          # @_Z8setPixeljj
# %bb.0:
	slli	a1, a1, 8
	add	a0, a1, a0
	slli	a0, a0, 8
	ori	a0, a0, 3
	lui	a1, 655360
	sw	a0, 12(a1)
	ret
.Lfunc_end33:
	.size	_Z8setPixeljj, .Lfunc_end33-_Z8setPixeljj
                                        # -- End function
	.globl	_Z13setPixelColorjjjjj  # -- Begin function _Z13setPixelColorjjjjj
	.p2align	2
	.type	_Z13setPixelColorjjjjj,@function
_Z13setPixelColorjjjjj:                 # @_Z13setPixelColorjjjjj
# %bb.0:
	slli	a4, a4, 8
	add	a3, a4, a3
	slli	a3, a3, 8
	add	a2, a3, a2
	slli	a2, a2, 8
	ori	a2, a2, 2
	lui	a3, 655360
	sw	a2, 12(a3)
	slli	a1, a1, 8
	add	a0, a1, a0
	slli	a0, a0, 8
	ori	a0, a0, 3
	sw	a0, 12(a3)
	ret
.Lfunc_end34:
	.size	_Z13setPixelColorjjjjj, .Lfunc_end34-_Z13setPixelColorjjjjj
                                        # -- End function
	.globl	_Z13drawRectanglejj     # -- Begin function _Z13drawRectanglejj
	.p2align	2
	.type	_Z13drawRectanglejj,@function
_Z13drawRectanglejj:                    # @_Z13drawRectanglejj
# %bb.0:
	slli	a1, a1, 8
	add	a0, a1, a0
	slli	a0, a0, 8
	ori	a0, a0, 4
	lui	a1, 655360
	sw	a0, 12(a1)
	ret
.Lfunc_end35:
	.size	_Z13drawRectanglejj, .Lfunc_end35-_Z13drawRectanglejj
                                        # -- End function
	.globl	_Z11drawTexturej        # -- Begin function _Z11drawTexturej
	.p2align	2
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
	.p2align	2
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
	.p2align	2
	.type	_Z16sendTexturePixeljjjj,@function
_Z16sendTexturePixeljjjj:               # @_Z16sendTexturePixeljjjj
# %bb.0:
	beqz	a3, .LBB38_2
# %bb.1:
	slli	a3, a3, 8
	add	a2, a3, a2
	slli	a2, a2, 8
	add	a1, a2, a1
	slli	a1, a1, 8
	add	a0, a1, a0
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
	.p2align	2
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
	beqz	s2, .LBB40_5
# %bb.1:
	mv	s3, zero
	j	.LBB40_3
.LBB40_2:                               #   in Loop: Header=BB40_3 Depth=1
	addi	s3, s3, 1
	beq	s3, s2, .LBB40_5
.LBB40_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB40_4 Depth 2
	mv	s1, s4
	beqz	s4, .LBB40_2
.LBB40_4:                               #   Parent Loop BB40_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, 0(s0)
	lw	a1, 0(a0)
	mv	a0, s0
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
.Lfunc_end41:
	.size	_Z16drawFullTrianglejjjjjjjjj, .Lfunc_end41-_Z16drawFullTrianglejjjjjjjjj
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
	mv	a4, a2
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
	add	a1, s3, a1
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
	mv	s1, s3
	beqz	s3, .LBB42_15
.LBB42_17:                              #   Parent Loop BB42_16 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, 8(sp)
	lw	a1, 0(a0)
	mv	a0, s0
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
.LBB43_1:                               # =>This Inner Loop Header: Depth=1
	sw	s1, 36(sp)
	mv	a0, s1
	mv	a1, s2
	mv	a2, s3
	call	_Z9load_tilejjPKDi
	addi	s1, s1, 1
	bne	s1, s0, .LBB43_1
# %bb.2:
	addi	s1, zero, 65
	addi	s3, sp, 4
	addi	s0, zero, 91
.LBB43_3:                               # =>This Inner Loop Header: Depth=1
	sw	s1, 12(sp)
	mv	a0, s1
	mv	a1, s2
	mv	a2, s3
	call	_Z9load_tilejjPKDi
	addi	s1, s1, 1
	bne	s1, s0, .LBB43_3
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
	.p2align	2
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
	mv	a4, a2
	addi	a2, a2, 1
	mv	a3, a2
	bltu	a4, a0, .LBB44_6
# %bb.3:                                #   in Loop: Header=BB44_2 Depth=1
	mv	a3, a2
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
	.p2align	2
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
	mv	a2, a6
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
	.globl	_Z13breakdownTimeRjS_j  # -- Begin function _Z13breakdownTimeRjS_j
	.p2align	2
	.type	_Z13breakdownTimeRjS_j,@function
_Z13breakdownTimeRjS_j:                 # @_Z13breakdownTimeRjS_j
# %bb.0:
	lw	a3, 0(a0)
	bgeu	a2, a3, .LBB46_2
.LBB46_1:                               # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a1)
	addi	a3, a3, 1
	sw	a3, 0(a1)
	lw	a3, 0(a0)
	sub	a3, a3, a2
	sw	a3, 0(a0)
	bltu	a2, a3, .LBB46_1
.LBB46_2:
	ret
.Lfunc_end46:
	.size	_Z13breakdownTimeRjS_j, .Lfunc_end46-_Z13breakdownTimeRjS_j
                                        # -- End function
	.globl	_Z8runClockv            # -- Begin function _Z8runClockv
	.p2align	2
	.type	_Z8runClockv,@function
_Z8runClockv:                           # @_Z8runClockv
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
	lui	a0, 1048575
	addi	a0, a0, 496
	sw	a0, 20(sp)
	lui	a0, 1048567
	addi	a0, a0, 864
	sw	a0, 16(sp)
	lui	a0, %hi(.L__const._Z12runClockFastv.time_str)
	addi	a1, a0, %lo(.L__const._Z12runClockFastv.time_str)
	addi	a0, sp, 40
	addi	a2, zero, 36
	call	memcpy
	lui	a0, %hi(app)
	lw	s0, %lo(app)(a0)
	lui	s1, 524288
	lui	a0, 9
	addi	a1, a0, -863
	sw	a1, 28(sp)
	addi	a0, a0, -864
	sw	a0, 12(sp)
	lui	a0, 1
	addi	a1, a0, -495
	sw	a1, 24(sp)
	addi	a0, a0, -496
	sw	a0, 8(sp)
	addi	s5, zero, 1
	lui	s9, 655360
	addi	s10, zero, 14
	addi	s11, zero, 8
	j	.LBB47_3
.LBB47_1:                               #   in Loop: Header=BB47_3 Depth=1
	addi	a0, s9, 12
	addi	a1, zero, 42
	sw	a1, 0(a0)
.LBB47_2:                               #   in Loop: Header=BB47_3 Depth=1
	andi	a0, s2, 1
	bnez	a0, .LBB47_31
.LBB47_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB47_6 Depth 2
                                        #     Child Loop BB47_10 Depth 2
                                        #     Child Loop BB47_29 Depth 2
	lw	a0, 0(s1)
	beqz	a0, .LBB47_8
# %bb.4:                                #   in Loop: Header=BB47_3 Depth=1
	lw	a0, 8(s0)
	j	.LBB47_6
.LBB47_5:                               #   in Loop: Header=BB47_6 Depth=2
	lw	a1, 0(s1)
	beqz	a1, .LBB47_8
.LBB47_6:                               #   Parent Loop BB47_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	a0, a0, 1
	sw	a0, 8(s0)
	sw	s5, 16(s0)
	bne	a0, s11, .LBB47_5
# %bb.7:                                #   in Loop: Header=BB47_6 Depth=2
	lw	a1, 4(s0)
	mv	a0, zero
	addi	a1, a1, 1
	sw	a1, 4(s0)
	sw	zero, 8(s0)
	j	.LBB47_5
.LBB47_8:                               #   in Loop: Header=BB47_3 Depth=1
	lw	a0, 12(s0)
	mv	s2, zero
	j	.LBB47_10
.LBB47_9:                               #   in Loop: Header=BB47_10 Depth=2
	sw	zero, 12(s0)
	xori	a0, a0, 37
	seqz	a0, a0
	or	s2, s2, a0
	mv	a0, zero
.LBB47_10:                              #   Parent Loop BB47_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	bnez	a0, .LBB47_9
# %bb.11:                               #   in Loop: Header=BB47_10 Depth=2
	lw	a0, 8(s1)
	sw	a0, 12(s0)
	bnez	a0, .LBB47_9
# %bb.12:                               #   in Loop: Header=BB47_3 Depth=1
	lw	a0, 16(s0)
	beqz	a0, .LBB47_2
# %bb.13:                               #   in Loop: Header=BB47_3 Depth=1
	lw	s6, 4(s0)
	sw	zero, 16(s0)
	addi	s8, zero, 48
	lw	a0, 28(sp)
	bltu	s6, a0, .LBB47_15
# %bb.14:                               #   in Loop: Header=BB47_3 Depth=1
	lw	s7, 16(sp)
	add	s4, s6, s7
	addi	a0, s4, -1
	lw	a1, 12(sp)
	call	__udivsi3
	addi	s3, a0, 49
	mv	a1, s7
	call	__mulsi3
	add	s6, s4, a0
	lw	a0, 24(sp)
	bgeu	s6, a0, .LBB47_16
	j	.LBB47_17
.LBB47_15:                              #   in Loop: Header=BB47_3 Depth=1
	addi	s3, zero, 48
	lw	a0, 24(sp)
	bltu	s6, a0, .LBB47_17
.LBB47_16:                              #   in Loop: Header=BB47_3 Depth=1
	lw	s7, 20(sp)
	add	s4, s6, s7
	addi	a0, s4, -1
	lw	a1, 8(sp)
	call	__udivsi3
	addi	s8, a0, 49
	mv	a1, s7
	call	__mulsi3
	add	s6, s4, a0
.LBB47_17:                              #   in Loop: Header=BB47_3 Depth=1
	addi	a0, zero, 601
	bltu	s6, a0, .LBB47_20
# %bb.18:                               #   in Loop: Header=BB47_3 Depth=1
	addi	a0, s6, -601
	addi	a1, zero, 600
	call	__udivsi3
	addi	a1, a0, 49
	sw	a1, 32(sp)
	addi	a1, zero, -600
	call	__mulsi3
	add	a0, s6, a0
	addi	s6, a0, -600
	addi	a0, zero, 61
	bgeu	s6, a0, .LBB47_21
.LBB47_19:                              #   in Loop: Header=BB47_3 Depth=1
	addi	a0, zero, 48
	sw	a0, 36(sp)
	j	.LBB47_22
.LBB47_20:                              #   in Loop: Header=BB47_3 Depth=1
	addi	a0, zero, 48
	sw	a0, 32(sp)
	addi	a0, zero, 61
	bltu	s6, a0, .LBB47_19
.LBB47_21:                              #   in Loop: Header=BB47_3 Depth=1
	addi	a0, s6, -61
	addi	a1, zero, 60
	call	__udivsi3
	addi	a1, a0, 49
	sw	a1, 36(sp)
	addi	a1, zero, -60
	call	__mulsi3
	add	a0, s6, a0
	addi	s6, a0, -60
.LBB47_22:                              #   in Loop: Header=BB47_3 Depth=1
	addi	s4, zero, 48
	mv	s7, s8
	addi	a0, zero, 11
	bltu	s6, a0, .LBB47_24
# %bb.23:                               #   in Loop: Header=BB47_3 Depth=1
	addi	a0, s6, -11
	addi	a1, zero, 10
	call	__udivsi3
	addi	s8, a0, 49
	addi	a1, zero, -10
	call	__mulsi3
	add	a0, s6, a0
	addi	s6, a0, -10
	lw	a0, 32(sp)
	bltu	s5, s6, .LBB47_25
	j	.LBB47_26
.LBB47_24:                              #   in Loop: Header=BB47_3 Depth=1
	addi	s8, zero, 48
	lw	a0, 32(sp)
	bgeu	s5, s6, .LBB47_26
.LBB47_25:                              #   in Loop: Header=BB47_3 Depth=1
	addi	s4, s6, 47
.LBB47_26:                              #   in Loop: Header=BB47_3 Depth=1
	mv	a1, zero
	sw	s3, 40(sp)
	sw	s7, 44(sp)
	sw	a0, 52(sp)
	lw	a0, 36(sp)
	sw	a0, 56(sp)
	sw	s8, 64(sp)
	sw	s4, 68(sp)
	addi	a0, zero, 46
	addi	a3, zero, 22
	addi	a2, sp, 44
	j	.LBB47_29
.LBB47_27:                              #   in Loop: Header=BB47_29 Depth=2
	addi	a3, a3, 7
.LBB47_28:                              #   in Loop: Header=BB47_29 Depth=2
	lw	s3, 0(a2)
	addi	a2, a2, 4
	beqz	s3, .LBB47_1
.LBB47_29:                              #   Parent Loop BB47_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a4, a0, 8
	add	a4, a4, a3
	slli	a4, a4, 8
	ori	a4, a4, 1
	sw	a4, 12(s9)
	slli	a4, s3, 8
	ori	a4, a4, 5
	addi	a1, a1, 1
	sw	a4, 12(s9)
	bne	a1, s10, .LBB47_27
# %bb.30:                               #   in Loop: Header=BB47_29 Depth=2
	mv	a1, zero
	addi	a0, a0, 7
	addi	a3, zero, 22
	j	.LBB47_28
.LBB47_31:
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
.Lfunc_end47:
	.size	_Z8runClockv, .Lfunc_end47-_Z8runClockv
                                        # -- End function
	.globl	_Z12runClockFastv       # -- Begin function _Z12runClockFastv
	.p2align	2
	.type	_Z12runClockFastv,@function
_Z12runClockFastv:                      # @_Z12runClockFastv
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
	lui	a0, %hi(.L__const._Z12runClockFastv.time_str)
	addi	a1, a0, %lo(.L__const._Z12runClockFastv.time_str)
	addi	a0, sp, 8
	addi	a2, zero, 36
	call	memcpy
	lui	a0, %hi(app)
	lw	a0, %lo(app)(a0)
	addi	s2, zero, 48
	addi	a7, sp, 12
	lui	s7, 524288
	addi	t1, zero, 58
	addi	a6, zero, 54
	lui	s6, 655360
	addi	t0, zero, 42
	addi	s3, zero, 14
	addi	s4, zero, 1
	addi	s5, zero, 8
	addi	t6, zero, 48
	addi	t2, zero, 48
	addi	t4, zero, 48
	addi	t5, zero, 48
	addi	t3, zero, 48
	j	.LBB48_2
.LBB48_1:                               #   in Loop: Header=BB48_2 Depth=1
	andi	a1, s1, 1
	sw	t0, 12(s6)
	bnez	a1, .LBB48_28
.LBB48_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB48_5 Depth 2
                                        #     Child Loop BB48_9 Depth 2
                                        #     Child Loop BB48_26 Depth 2
	lw	a1, 0(s7)
	beqz	a1, .LBB48_7
# %bb.3:                                #   in Loop: Header=BB48_2 Depth=1
	lw	a1, 8(a0)
	j	.LBB48_5
.LBB48_4:                               #   in Loop: Header=BB48_5 Depth=2
	lw	a3, 0(s7)
	beqz	a3, .LBB48_7
.LBB48_5:                               #   Parent Loop BB48_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	a1, a1, 1
	sw	a1, 8(a0)
	sw	s4, 16(a0)
	bne	a1, s5, .LBB48_4
# %bb.6:                                #   in Loop: Header=BB48_5 Depth=2
	lw	a3, 4(a0)
	mv	a1, zero
	addi	a3, a3, 1
	sw	a3, 4(a0)
	sw	zero, 8(a0)
	j	.LBB48_4
.LBB48_7:                               #   in Loop: Header=BB48_2 Depth=1
	lw	a1, 12(a0)
	mv	s1, zero
	j	.LBB48_9
.LBB48_8:                               #   in Loop: Header=BB48_9 Depth=2
	sw	zero, 12(a0)
	xori	a1, a1, 37
	seqz	a1, a1
	or	s1, s1, a1
	mv	a1, zero
.LBB48_9:                               #   Parent Loop BB48_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	bnez	a1, .LBB48_8
# %bb.10:                               #   in Loop: Header=BB48_9 Depth=2
	lw	a1, 8(s7)
	sw	a1, 12(a0)
	bnez	a1, .LBB48_8
# %bb.11:                               #   in Loop: Header=BB48_2 Depth=1
	addi	s2, s2, 1
	bne	s2, t1, .LBB48_22
# %bb.12:                               #   in Loop: Header=BB48_2 Depth=1
	addi	t6, t6, 1
	addi	s2, zero, 48
	bne	t6, a6, .LBB48_22
# %bb.13:                               #   in Loop: Header=BB48_2 Depth=1
	addi	t3, t3, 1
	addi	t6, zero, 48
	bne	t3, t1, .LBB48_21
# %bb.14:                               #   in Loop: Header=BB48_2 Depth=1
	addi	t5, t5, 1
	addi	t3, zero, 48
	bne	t5, a6, .LBB48_20
# %bb.15:                               #   in Loop: Header=BB48_2 Depth=1
	addi	a4, t4, 1
	xori	a1, a4, 58
	seqz	a3, a1
	addi	t3, zero, 48
	addi	a1, zero, 48
	beq	a4, t1, .LBB48_17
# %bb.16:                               #   in Loop: Header=BB48_2 Depth=1
	mv	a1, a4
.LBB48_17:                              #   in Loop: Header=BB48_2 Depth=1
	add	a3, t2, a3
	xori	a4, a1, 52
	xori	a5, a3, 50
	or	a4, a4, a5
	addi	t4, zero, 48
	addi	t2, zero, 48
	beqz	a4, .LBB48_19
# %bb.18:                               #   in Loop: Header=BB48_2 Depth=1
	mv	t4, a1
	mv	t2, a3
.LBB48_19:                              #   in Loop: Header=BB48_2 Depth=1
	addi	t5, zero, 48
.LBB48_20:                              #   in Loop: Header=BB48_2 Depth=1
	addi	t6, zero, 48
.LBB48_21:                              #   in Loop: Header=BB48_2 Depth=1
	addi	s2, zero, 48
.LBB48_22:                              #   in Loop: Header=BB48_2 Depth=1
	sw	t2, 8(sp)
	sw	t4, 12(sp)
	sw	t5, 20(sp)
	sw	t3, 24(sp)
	sw	t6, 32(sp)
	sw	s2, 36(sp)
	beqz	t2, .LBB48_1
# %bb.23:                               #   in Loop: Header=BB48_2 Depth=1
	mv	a4, zero
	addi	s0, zero, 46
	addi	a3, zero, 22
	mv	a1, a7
	mv	a5, t2
	j	.LBB48_26
.LBB48_24:                              #   in Loop: Header=BB48_26 Depth=2
	addi	a3, a3, 7
.LBB48_25:                              #   in Loop: Header=BB48_26 Depth=2
	lw	a5, 0(a1)
	addi	a1, a1, 4
	beqz	a5, .LBB48_1
.LBB48_26:                              #   Parent Loop BB48_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a2, s0, 8
	add	a2, a2, a3
	slli	a2, a2, 8
	ori	a2, a2, 1
	sw	a2, 12(s6)
	slli	a2, a5, 8
	ori	a2, a2, 5
	addi	a4, a4, 1
	sw	a2, 12(s6)
	bne	a4, s3, .LBB48_24
# %bb.27:                               #   in Loop: Header=BB48_26 Depth=2
	mv	a4, zero
	addi	s0, s0, 7
	addi	a3, zero, 22
	j	.LBB48_25
.LBB48_28:
	lw	s7, 44(sp)
	lw	s6, 48(sp)
	lw	s5, 52(sp)
	lw	s4, 56(sp)
	lw	s3, 60(sp)
	lw	s2, 64(sp)
	lw	s1, 68(sp)
	lw	s0, 72(sp)
	lw	ra, 76(sp)
	addi	sp, sp, 80
	ret
.Lfunc_end48:
	.size	_Z12runClockFastv, .Lfunc_end48-_Z12runClockFastv
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
.Lfunc_end49:
	.size	_ZplRK4VectS1_, .Lfunc_end49-_ZplRK4VectS1_
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
.Lfunc_end50:
	.size	_ZmiRK4VectS1_, .Lfunc_end50-_ZmiRK4VectS1_
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
.Lfunc_end51:
	.size	_Z3dotRK4VectS1_, .Lfunc_end51-_Z3dotRK4VectS1_
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
.Lfunc_end52:
	.size	_Z12initGeometryv, .Lfunc_end52-_Z12initGeometryv
                                        # -- End function
	.globl	_Z12projOnScreenRK4Vect # -- Begin function _Z12projOnScreenRK4Vect
	.p2align	2
	.type	_Z12projOnScreenRK4Vect,@function
_Z12projOnScreenRK4Vect:                # @_Z12projOnScreenRK4Vect
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
	lw	s7, 0(a0)
	lui	a1, %hi(cameraPos)
	lw	s9, %lo(cameraPos)(a1)
	lw	s2, 4(a0)
	addi	a1, a1, %lo(cameraPos)
	lw	s10, 4(a1)
	lw	a0, 8(a0)
	lw	s11, 8(a1)
	lui	s0, %hi(cameraVect)
	lw	s5, %lo(cameraVect)(s0)
	sub	a1, s7, s9
	sub	s3, s2, s10
	sub	s1, a0, s11
	mv	a0, s5
	call	__mulsi3
	addi	s0, s0, %lo(cameraVect)
	lw	s6, 4(s0)
	mv	s4, a0
	mv	a0, s6
	mv	a1, s3
	call	__mulsi3
	lw	s8, 8(s0)
	add	s0, a0, s4
	mv	a0, s8
	sw	s1, 8(sp)
	mv	a1, s1
	call	__mulsi3
	add	s4, s0, a0
	beqz	s4, .LBB53_2
# %bb.1:
	lui	a0, %hi(origin)
	lw	a1, %lo(origin)(a0)
	addi	a0, a0, %lo(origin)
	lw	a2, 4(a0)
	lw	a3, 8(a0)
	sub	a0, a1, s9
	sub	s0, a2, s10
	sub	s7, a3, s11
	mv	a1, s5
	call	__mulsi3
	mv	s1, a0
	mv	a0, s0
	mv	a1, s6
	call	__mulsi3
	add	s0, a0, s1
	mv	a0, s7
	mv	a1, s8
	call	__mulsi3
	add	s0, s0, a0
	mv	a0, s0
	mv	a1, s3
	call	__mulsi3
	mv	a1, s4
	call	__divsi3
	addi	s7, a0, 50
	mv	a0, s0
	lw	a1, 8(sp)
	call	__mulsi3
	mv	a1, s4
	call	__divsi3
	addi	a1, zero, 50
	sub	s2, a1, a0
.LBB53_2:
	mv	a0, s7
	mv	a1, s2
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
.Lfunc_end53:
	.size	_Z12projOnScreenRK4Vect, .Lfunc_end53-_Z12projOnScreenRK4Vect
                                        # -- End function
	.globl	_Z4drawRK8Trianglejjj   # -- Begin function _Z4drawRK8Trianglejjj
	.p2align	2
	.type	_Z4drawRK8Trianglejjj,@function
_Z4drawRK8Trianglejjj:                  # @_Z4drawRK8Trianglejjj
# %bb.0:
	addi	sp, sp, -96
	sw	ra, 92(sp)
	sw	s0, 88(sp)
	sw	s1, 84(sp)
	sw	s2, 80(sp)
	sw	s3, 76(sp)
	sw	s4, 72(sp)
	sw	s5, 68(sp)
	sw	s6, 64(sp)
	sw	s7, 60(sp)
	sw	s8, 56(sp)
	sw	s9, 52(sp)
	sw	s10, 48(sp)
	sw	s11, 44(sp)
	sw	a3, 20(sp)
	sw	a2, 24(sp)
	sw	a1, 28(sp)
	mv	s4, a0
	lw	s2, 0(a0)
	lui	a0, %hi(cameraPos)
	lw	s10, %lo(cameraPos)(a0)
	lw	s11, 4(s4)
	addi	a0, a0, %lo(cameraPos)
	lw	a3, 4(a0)
	lw	a2, 8(s4)
	lw	a0, 8(a0)
	lui	s0, %hi(cameraVect)
	lw	s5, %lo(cameraVect)(s0)
	sub	a1, s2, s10
	sw	a3, 40(sp)
	sub	s9, s11, a3
	sw	a0, 36(sp)
	sub	s8, a2, a0
	mv	a0, s5
	call	__mulsi3
	addi	s1, s0, %lo(cameraVect)
	lw	s6, 4(s1)
	mv	s0, a0
	mv	a0, s6
	mv	a1, s9
	call	__mulsi3
	lw	s7, 8(s1)
	add	s0, a0, s0
	mv	a0, s7
	mv	a1, s8
	call	__mulsi3
	add	s3, s0, a0
	sw	s10, 32(sp)
	beqz	s3, .LBB54_2
# %bb.1:
	lui	a0, %hi(origin)
	lw	a1, %lo(origin)(a0)
	addi	a0, a0, %lo(origin)
	lw	a2, 4(a0)
	lw	a3, 8(a0)
	sub	a0, a1, s10
	lw	a1, 40(sp)
	sub	s10, a2, a1
	lw	a1, 36(sp)
	sub	s11, a3, a1
	mv	a1, s5
	call	__mulsi3
	mv	s2, a0
	mv	a0, s10
	lw	s10, 32(sp)
	mv	a1, s6
	call	__mulsi3
	add	s0, a0, s2
	mv	a0, s11
	mv	a1, s7
	call	__mulsi3
	add	s0, s0, a0
	mv	a0, s0
	mv	a1, s9
	call	__mulsi3
	mv	a1, s3
	call	__divsi3
	addi	s2, a0, 50
	mv	a0, s0
	mv	a1, s8
	call	__mulsi3
	mv	a1, s3
	call	__divsi3
	addi	a1, zero, 50
	sub	s11, a1, a0
.LBB54_2:
	sw	s11, 12(sp)
	sw	s2, 16(sp)
	lw	s1, 12(s4)
	lw	s11, 16(s4)
	lw	a1, 20(s4)
	sub	a0, s1, s10
	lw	a2, 40(sp)
	sub	s9, s11, a2
	lw	a2, 36(sp)
	sub	s8, a1, a2
	mv	a1, s5
	call	__mulsi3
	mv	s0, a0
	mv	a0, s9
	mv	a1, s6
	call	__mulsi3
	add	s0, a0, s0
	mv	a0, s8
	mv	a1, s7
	call	__mulsi3
	add	s10, s0, a0
	beqz	s10, .LBB54_4
# %bb.3:
	lui	a0, %hi(origin)
	lw	a1, %lo(origin)(a0)
	addi	a0, a0, %lo(origin)
	lw	a2, 4(a0)
	lw	a3, 8(a0)
	lw	a0, 32(sp)
	sub	a0, a1, a0
	lw	a1, 40(sp)
	sub	s2, a2, a1
	lw	a1, 36(sp)
	sub	s3, a3, a1
	mv	a1, s5
	call	__mulsi3
	mv	s0, a0
	mv	a0, s2
	mv	a1, s6
	call	__mulsi3
	add	s0, a0, s0
	mv	a0, s3
	mv	a1, s7
	call	__mulsi3
	add	s0, s0, a0
	mv	a0, s0
	mv	a1, s9
	call	__mulsi3
	mv	a1, s10
	call	__divsi3
	addi	s1, a0, 50
	mv	a0, s0
	mv	a1, s8
	call	__mulsi3
	mv	a1, s10
	call	__divsi3
	addi	a1, zero, 50
	sub	s11, a1, a0
.LBB54_4:
	mv	s10, s1
	lw	s3, 24(s4)
	lw	s1, 28(s4)
	lw	a1, 32(s4)
	lw	s4, 32(sp)
	sub	a0, s3, s4
	lw	a2, 40(sp)
	sub	s2, s1, a2
	lw	a2, 36(sp)
	sub	s8, a1, a2
	mv	a1, s5
	call	__mulsi3
	mv	s0, a0
	mv	a0, s2
	mv	a1, s6
	call	__mulsi3
	add	s0, a0, s0
	mv	a0, s8
	mv	a1, s7
	call	__mulsi3
	add	s0, s0, a0
	beqz	s0, .LBB54_6
# %bb.5:
	lui	a0, %hi(origin)
	lw	a1, %lo(origin)(a0)
	addi	a0, a0, %lo(origin)
	lw	a2, 4(a0)
	lw	a3, 8(a0)
	sub	a0, a1, s4
	lw	a1, 40(sp)
	sub	s9, a2, a1
	lw	a1, 36(sp)
	sub	s3, a3, a1
	mv	a1, s5
	call	__mulsi3
	mv	s1, a0
	mv	a0, s9
	mv	a1, s6
	call	__mulsi3
	add	s1, a0, s1
	mv	a0, s3
	mv	a1, s7
	call	__mulsi3
	add	s1, s1, a0
	mv	a0, s1
	mv	a1, s2
	call	__mulsi3
	mv	a1, s0
	call	__divsi3
	addi	s3, a0, 50
	mv	a0, s1
	mv	a1, s8
	call	__mulsi3
	mv	a1, s0
	call	__divsi3
	addi	a1, zero, 50
	sub	s1, a1, a0
.LBB54_6:
	lw	a0, 12(sp)
	slli	a0, a0, 8
	lw	a1, 16(sp)
	add	a0, a0, a1
	slli	a0, a0, 8
	ori	a0, a0, 1
	lui	a1, 655360
	sw	a0, 12(a1)
	slli	a0, s11, 8
	add	a0, a0, s10
	slli	a0, a0, 8
	ori	a0, a0, 7
	sw	a0, 12(a1)
	slli	a0, s1, 8
	add	a0, a0, s3
	slli	a0, a0, 8
	ori	a0, a0, 8
	sw	a0, 12(a1)
	lw	a0, 20(sp)
	slli	a0, a0, 8
	lw	a2, 24(sp)
	add	a0, a0, a2
	slli	a0, a0, 8
	lw	a2, 28(sp)
	add	a0, a0, a2
	slli	a0, a0, 8
	ori	a0, a0, 9
	sw	a0, 12(a1)
	lw	s11, 44(sp)
	lw	s10, 48(sp)
	lw	s9, 52(sp)
	lw	s8, 56(sp)
	lw	s7, 60(sp)
	lw	s6, 64(sp)
	lw	s5, 68(sp)
	lw	s4, 72(sp)
	lw	s3, 76(sp)
	lw	s2, 80(sp)
	lw	s1, 84(sp)
	lw	s0, 88(sp)
	lw	ra, 92(sp)
	addi	sp, sp, 96
	ret
.Lfunc_end54:
	.size	_Z4drawRK8Trianglejjj, .Lfunc_end54-_Z4drawRK8Trianglejjj
                                        # -- End function
	.globl	_ZltRK8TriangleS1_      # -- Begin function _ZltRK8TriangleS1_
	.p2align	2
	.type	_ZltRK8TriangleS1_,@function
_ZltRK8TriangleS1_:                     # @_ZltRK8TriangleS1_
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	sw	s4, 8(sp)
	sw	s5, 4(sp)
	sw	s6, 0(sp)
	mv	s0, a0
	lw	a2, 36(a0)
	lui	s3, %hi(cameraPos)
	lw	s2, %lo(cameraPos)(s3)
	mv	s6, a1
	mv	a0, s2
	mv	a1, a2
	call	__mulsi3
	lw	a1, 40(s0)
	addi	s1, s3, %lo(cameraPos)
	lw	s3, 4(s1)
	mv	s4, a0
	mv	a0, s3
	call	__mulsi3
	lw	a1, 44(s0)
	lw	s5, 8(s1)
	add	s0, a0, s4
	mv	a0, s5
	call	__mulsi3
	lw	a1, 36(s6)
	add	s1, s0, a0
	mv	a0, a1
	mv	a1, s2
	call	__mulsi3
	lw	a1, 40(s6)
	mv	s0, a0
	mv	a0, a1
	mv	a1, s3
	call	__mulsi3
	lw	a1, 44(s6)
	add	s0, a0, s0
	mv	a0, a1
	mv	a1, s5
	call	__mulsi3
	add	a0, s0, a0
	slt	a0, s1, a0
	lw	s6, 0(sp)
	lw	s5, 4(sp)
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end55:
	.size	_ZltRK8TriangleS1_, .Lfunc_end55-_ZltRK8TriangleS1_
                                        # -- End function
	.globl	_Z13sortTrianglesP8TrianglePji # -- Begin function _Z13sortTrianglesP8TrianglePji
	.p2align	2
	.type	_Z13sortTrianglesP8TrianglePji,@function
_Z13sortTrianglesP8TrianglePji:         # @_Z13sortTrianglesP8TrianglePji
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
	addi	a3, zero, 2
	blt	a2, a3, .LBB56_11
# %bb.1:
	mv	a4, a1
	mv	s3, a0
	lui	a0, %hi(cameraPos)
	addi	a0, a0, %lo(cameraPos)
	sw	a0, 8(sp)
	j	.LBB56_3
.LBB56_2:                               #   in Loop: Header=BB56_3 Depth=1
	lw	a1, 4(sp)
	sub	a0, s2, a1
	srai	a2, a0, 2
	mv	a0, s3
	call	_Z13sortTrianglesP8TrianglePji
	addi	a4, s2, 8
	lw	a0, 0(sp)
	sub	a0, a0, s2
	srai	a1, a0, 2
	addi	a2, a1, -2
	addi	a1, zero, 12
	bge	a1, a0, .LBB56_11
.LBB56_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB56_8 Depth 2
	slli	a0, a2, 1
	andi	a0, a0, -4
	add	a0, a4, a0
	lw	a1, 0(a0)
	lw	a3, 0(a4)
	sw	a1, 0(a4)
	sw	a3, 0(a0)
	slli	a0, a2, 2
	add	a1, a4, a0
	sw	a1, 0(sp)
	sw	a4, 4(sp)
	mv	s2, a4
	addi	a1, zero, 1
	beq	a2, a1, .LBB56_2
# %bb.4:                                #   in Loop: Header=BB56_3 Depth=1
	lw	s2, 4(sp)
	lw	s4, 0(s2)
	addi	s8, a0, -4
	mv	s9, s2
	j	.LBB56_8
.LBB56_5:                               #   in Loop: Header=BB56_8 Depth=2
	sw	a0, 4(s9)
	lw	s4, 0(s2)
	sw	s5, 4(s2)
.LBB56_6:                               #   in Loop: Header=BB56_8 Depth=2
	sw	s4, 4(s2)
	addi	a0, s2, 4
	sw	s5, 0(s2)
	mv	s2, a0
.LBB56_7:                               #   in Loop: Header=BB56_8 Depth=2
	addi	s8, s8, -4
	addi	s9, s9, 4
	beqz	s8, .LBB56_2
.LBB56_8:                               #   Parent Loop BB56_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	s5, 4(s9)
	addi	a1, zero, 48
	mv	a0, s5
	call	__mulsi3
	add	s0, s3, a0
	lw	a1, 36(s0)
	lui	a0, %hi(cameraPos)
	lw	s6, %lo(cameraPos)(a0)
	mv	a0, s6
	call	__mulsi3
	lw	a1, 40(s0)
	lw	s1, 8(sp)
	lw	s7, 4(s1)
	mv	s10, a0
	mv	a0, s7
	call	__mulsi3
	lw	a1, 44(s0)
	lw	s0, 8(s1)
	add	s1, a0, s10
	mv	a0, s0
	call	__mulsi3
	add	s10, s1, a0
	addi	a1, zero, 48
	mv	a0, s4
	call	__mulsi3
	add	s11, s3, a0
	lw	a0, 36(s11)
	mv	a1, s6
	call	__mulsi3
	lw	a1, 40(s11)
	mv	s1, a0
	mv	a0, a1
	mv	a1, s7
	call	__mulsi3
	lw	a1, 44(s11)
	add	s1, a0, s1
	mv	a0, a1
	mv	a1, s0
	call	__mulsi3
	add	a0, s1, a0
	bge	s10, a0, .LBB56_7
# %bb.9:                                #   in Loop: Header=BB56_8 Depth=2
	lw	a0, 4(s2)
	bne	s9, s2, .LBB56_5
# %bb.10:                               #   in Loop: Header=BB56_8 Depth=2
	mv	s5, a0
	j	.LBB56_6
.LBB56_11:
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
.Lfunc_end56:
	.size	_Z13sortTrianglesP8TrianglePji, .Lfunc_end56-_Z13sortTrianglesP8TrianglePji
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
.Lfunc_end57:
	.size	_Z13cos32_computei, .Lfunc_end57-_Z13cos32_computei
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
	j	.LBB58_2
.LBB58_1:                               #   in Loop: Header=BB58_2 Depth=1
	add	a0, a0, a3
.LBB58_2:                               # =>This Inner Loop Header: Depth=1
	addi	a3, zero, 360
	bge	a1, a0, .LBB58_1
# %bb.3:                                #   in Loop: Header=BB58_2 Depth=1
	addi	a3, zero, -360
	blt	a2, a0, .LBB58_1
# %bb.4:
	lui	a1, 1048569
	addi	s3, a1, -1445
	lui	a1, 16
	addi	s2, a1, -40
	lui	s0, 1
	addi	a1, zero, 271
	addi	s4, s0, -1685
	blt	a0, a1, .LBB58_6
# %bb.5:
	addi	a1, zero, 360
	sub	a0, a1, a0
	mv	a1, a0
	call	__mulsi3
	mv	s1, a0
	mv	a1, s4
	call	__mulsi3
	addi	s0, s0, -813
	j	.LBB58_12
.LBB58_6:
	addi	a1, zero, 181
	blt	a0, a1, .LBB58_8
# %bb.7:
	addi	a0, a0, -180
	j	.LBB58_10
.LBB58_8:
	addi	a1, zero, 91
	blt	a0, a1, .LBB58_11
# %bb.9:
	addi	a1, zero, 180
	sub	a0, a1, a0
.LBB58_10:
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
	j	.LBB58_13
.LBB58_11:
	mv	a1, a0
	call	__mulsi3
	mv	s1, a0
	mv	a1, s4
	call	__mulsi3
	lui	a1, 1
	addi	s0, a1, -813
.LBB58_12:
	mv	a1, s0
	call	__udivsi3
	add	a0, a0, s3
	mv	a1, s1
	call	__mulsi3
	mv	a1, s0
	call	__divsi3
	add	a0, a0, s2
	srai	a0, a0, 6
.LBB58_13:
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end58:
	.size	_Z5cos32i, .Lfunc_end58-_Z5cos32i
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
	j	.LBB59_2
.LBB59_1:                               #   in Loop: Header=BB59_2 Depth=1
	add	a0, a0, a3
.LBB59_2:                               # =>This Inner Loop Header: Depth=1
	addi	a3, zero, 360
	bge	a1, a0, .LBB59_1
# %bb.3:                                #   in Loop: Header=BB59_2 Depth=1
	addi	a3, zero, -360
	blt	a2, a0, .LBB59_1
# %bb.4:
	lui	a1, 1048569
	addi	s3, a1, -1445
	lui	a1, 16
	addi	s2, a1, -40
	lui	s0, 1
	addi	a1, zero, 271
	addi	s4, s0, -1685
	blt	a0, a1, .LBB59_6
# %bb.5:
	addi	a1, zero, 360
	sub	a0, a1, a0
	mv	a1, a0
	call	__mulsi3
	mv	s1, a0
	mv	a1, s4
	call	__mulsi3
	addi	s0, s0, -813
	j	.LBB59_12
.LBB59_6:
	addi	a1, zero, 181
	blt	a0, a1, .LBB59_8
# %bb.7:
	addi	a0, a0, -180
	j	.LBB59_10
.LBB59_8:
	addi	a1, zero, 91
	blt	a0, a1, .LBB59_11
# %bb.9:
	addi	a1, zero, 180
	sub	a0, a1, a0
.LBB59_10:
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
	j	.LBB59_13
.LBB59_11:
	mv	a1, a0
	call	__mulsi3
	mv	s1, a0
	mv	a1, s4
	call	__mulsi3
	lui	a1, 1
	addi	s0, a1, -813
.LBB59_12:
	mv	a1, s0
	call	__udivsi3
	add	a0, a0, s3
	mv	a1, s1
	call	__mulsi3
	mv	a1, s0
	call	__divsi3
	add	a0, a0, s2
	srai	a0, a0, 6
.LBB59_13:
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end59:
	.size	_Z5sin32i, .Lfunc_end59-_Z5sin32i
                                        # -- End function
	.globl	_Z13applyRotationP8TriangleS0_j4Vecti # -- Begin function _Z13applyRotationP8TriangleS0_j4Vecti
	.p2align	2
	.type	_Z13applyRotationP8TriangleS0_j4Vecti,@function
_Z13applyRotationP8TriangleS0_j4Vecti:  # @_Z13applyRotationP8TriangleS0_j4Vecti
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
	sw	s9, 36(sp)
	sw	s10, 32(sp)
	sw	s11, 28(sp)
	mv	s6, a4
	mv	s7, a3
	mv	s0, a2
	mv	s11, a1
	mv	s3, a0
	addi	a1, zero, -1
	addi	a2, zero, 360
	mv	a0, a4
	j	.LBB60_2
.LBB60_1:                               #   in Loop: Header=BB60_2 Depth=1
	add	a0, a0, a3
.LBB60_2:                               # =>This Inner Loop Header: Depth=1
	addi	a3, zero, 360
	bge	a1, a0, .LBB60_1
# %bb.3:                                #   in Loop: Header=BB60_2 Depth=1
	addi	a3, zero, -360
	blt	a2, a0, .LBB60_1
# %bb.4:
	lui	a1, 1048569
	addi	s2, a1, -1445
	lui	a1, 16
	addi	s9, a1, -40
	lui	s1, 1
	addi	a1, zero, 271
	addi	s5, s1, -1685
	blt	a0, a1, .LBB60_6
# %bb.5:
	addi	a1, zero, 360
	sub	a0, a1, a0
	mv	a1, a0
	call	__mulsi3
	mv	s4, a0
	mv	a1, s5
	call	__mulsi3
	addi	s1, s1, -813
	j	.LBB60_12
.LBB60_6:
	addi	a1, zero, 181
	blt	a0, a1, .LBB60_8
# %bb.7:
	addi	a0, a0, -180
	j	.LBB60_10
.LBB60_8:
	addi	a1, zero, 91
	blt	a0, a1, .LBB60_11
# %bb.9:
	addi	a1, zero, 180
	sub	a0, a1, a0
.LBB60_10:
	mv	a1, a0
	call	__mulsi3
	mv	s4, a0
	mv	a1, s5
	call	__mulsi3
	lui	a1, 1
	addi	s1, a1, -813
	mv	a1, s1
	call	__udivsi3
	add	a0, a0, s2
	mv	a1, s4
	call	__mulsi3
	mv	a1, s1
	call	__divsi3
	add	a0, a0, s9
	srai	a0, a0, 6
	neg	s8, a0
	j	.LBB60_13
.LBB60_11:
	mv	a1, a0
	call	__mulsi3
	mv	s4, a0
	mv	a1, s5
	call	__mulsi3
	lui	a1, 1
	addi	s1, a1, -813
.LBB60_12:
	mv	a1, s1
	call	__udivsi3
	add	a0, a0, s2
	mv	a1, s4
	call	__mulsi3
	mv	a1, s1
	call	__divsi3
	add	a0, a0, s9
	srai	s8, a0, 6
.LBB60_13:
	addi	a0, zero, 90
	sub	a0, a0, s6
	addi	a1, zero, -1
	addi	a2, zero, 360
	j	.LBB60_15
.LBB60_14:                              #   in Loop: Header=BB60_15 Depth=1
	add	a0, a0, a3
.LBB60_15:                              # =>This Inner Loop Header: Depth=1
	addi	a3, zero, 360
	bge	a1, a0, .LBB60_14
# %bb.16:                               #   in Loop: Header=BB60_15 Depth=1
	addi	a3, zero, -360
	blt	a2, a0, .LBB60_14
# %bb.17:
	addi	a1, zero, 271
	blt	a0, a1, .LBB60_19
# %bb.18:
	addi	a1, zero, 360
	sub	a0, a1, a0
	j	.LBB60_24
.LBB60_19:
	addi	a1, zero, 181
	blt	a0, a1, .LBB60_21
# %bb.20:
	addi	a0, a0, -180
	j	.LBB60_23
.LBB60_21:
	addi	a1, zero, 91
	blt	a0, a1, .LBB60_24
# %bb.22:
	addi	a1, zero, 180
	sub	a0, a1, a0
.LBB60_23:
	mv	a1, a0
	call	__mulsi3
	mv	s6, a0
	mv	a1, s5
	call	__mulsi3
	lui	a1, 1
	addi	s1, a1, -813
	mv	a1, s1
	call	__udivsi3
	add	a0, a0, s2
	mv	a1, s6
	call	__mulsi3
	mv	a1, s1
	call	__divsi3
	add	a0, a0, s9
	srai	a0, a0, 6
	neg	s2, a0
	bnez	s0, .LBB60_25
	j	.LBB60_27
.LBB60_24:
	mv	a1, a0
	call	__mulsi3
	mv	s6, a0
	mv	a1, s5
	call	__mulsi3
	lui	a1, 1
	addi	s1, a1, -813
	mv	a1, s1
	call	__udivsi3
	add	a0, a0, s2
	mv	a1, s6
	call	__mulsi3
	mv	a1, s1
	call	__divsi3
	add	a0, a0, s9
	srai	s2, a0, 6
	beqz	s0, .LBB60_27
.LBB60_25:
	mv	s5, s8
.LBB60_26:                              # =>This Inner Loop Header: Depth=1
	sw	s0, 24(sp)
	lw	a0, 0(s3)
	lw	s1, 0(s7)
	lw	a1, 4(s3)
	lw	s10, 4(s7)
	sub	s0, a0, s1
	sub	s6, a1, s10
	mv	a0, s0
	mv	a1, s5
	call	__mulsi3
	mv	s9, a0
	mv	a0, s6
	mv	a1, s2
	call	__mulsi3
	sub	a0, s9, a0
	srai	a0, a0, 10
	add	a0, a0, s1
	sw	a0, 20(sp)
	sw	a0, 0(s11)
	mv	a0, s0
	mv	a1, s2
	call	__mulsi3
	mv	s0, a0
	mv	a0, s6
	mv	a1, s5
	call	__mulsi3
	add	a0, a0, s0
	srai	a0, a0, 10
	add	a0, a0, s10
	sw	a0, 16(sp)
	sw	a0, 4(s11)
	lw	a0, 8(s3)
	sw	a0, 12(sp)
	sw	a0, 8(s11)
	lw	a0, 12(s3)
	mv	s8, s2
	lw	s2, 0(s7)
	lw	a1, 16(s3)
	lw	s4, 4(s7)
	sub	s0, a0, s2
	sub	s6, a1, s4
	mv	a0, s0
	mv	a1, s5
	call	__mulsi3
	mv	s1, a0
	mv	a0, s6
	mv	a1, s8
	call	__mulsi3
	sub	a0, s1, a0
	srai	a0, a0, 10
	add	s2, a0, s2
	sw	s2, 12(s11)
	mv	a0, s0
	mv	a1, s8
	call	__mulsi3
	mv	s0, a0
	mv	a0, s6
	mv	a1, s5
	call	__mulsi3
	add	a0, a0, s0
	srai	a0, a0, 10
	add	a0, a0, s4
	sw	a0, 8(sp)
	sw	a0, 16(s11)
	lw	s4, 20(s3)
	sw	s4, 20(s11)
	lw	a0, 24(s3)
	lw	s9, 0(s7)
	lw	a1, 28(s3)
	mv	s10, s7
	lw	s7, 4(s7)
	sub	s0, a0, s9
	sub	s6, a1, s7
	mv	a0, s0
	mv	a1, s5
	call	__mulsi3
	mv	s1, a0
	mv	a0, s6
	mv	a1, s8
	call	__mulsi3
	sub	a0, s1, a0
	srai	a0, a0, 10
	add	s1, a0, s9
	sw	s1, 24(s11)
	mv	a0, s0
	mv	a1, s8
	call	__mulsi3
	mv	s0, a0
	mv	a0, s6
	mv	a1, s5
	call	__mulsi3
	add	a0, a0, s0
	srai	a0, a0, 10
	add	a0, a0, s7
	mv	s7, s10
	sw	a0, 28(s11)
	lw	a1, 32(s3)
	sw	a1, 32(s11)
	lw	a2, 20(sp)
	add	a2, s2, a2
	mv	s2, s8
	lw	s0, 24(sp)
	add	a2, a2, s1
	lw	a3, 16(sp)
	lw	a4, 8(sp)
	add	a3, a4, a3
	add	a0, a3, a0
	lw	a3, 12(sp)
	add	a3, s4, a3
	add	a1, a3, a1
	sw	a2, 36(s11)
	sw	a0, 40(s11)
	sw	a1, 44(s11)
	addi	s0, s0, -1
	addi	s3, s3, 48
	addi	s11, s11, 48
	bnez	s0, .LBB60_26
.LBB60_27:
	lw	s11, 28(sp)
	lw	s10, 32(sp)
	lw	s9, 36(sp)
	lw	s8, 40(sp)
	lw	s7, 44(sp)
	lw	s6, 48(sp)
	lw	s5, 52(sp)
	lw	s4, 56(sp)
	lw	s3, 60(sp)
	lw	s2, 64(sp)
	lw	s1, 68(sp)
	lw	s0, 72(sp)
	lw	ra, 76(sp)
	addi	sp, sp, 80
	ret
.Lfunc_end60:
	.size	_Z13applyRotationP8TriangleS0_j4Vecti, .Lfunc_end60-_Z13applyRotationP8TriangleS0_j4Vecti
                                        # -- End function
	.globl	_Z13drawTrianglesP8Trianglej # -- Begin function _Z13drawTrianglesP8Trianglej
	.p2align	2
	.type	_Z13drawTrianglesP8Trianglej,@function
_Z13drawTrianglesP8Trianglej:           # @_Z13drawTrianglesP8Trianglej
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	beqz	a1, .LBB61_3
# %bb.1:
	mv	s0, a1
	mv	s1, a0
.LBB61_2:                               # =>This Inner Loop Header: Depth=1
	addi	a1, zero, 255
	mv	a0, s1
	mv	a2, zero
	mv	a3, zero
	call	_Z4drawRK8Trianglejjj
	addi	s0, s0, -1
	addi	s1, s1, 48
	bnez	s0, .LBB61_2
.LBB61_3:
	lui	a0, 655360
	addi	a1, zero, 42
	sw	a1, 12(a0)
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end61:
	.size	_Z13drawTrianglesP8Trianglej, .Lfunc_end61-_Z13drawTrianglesP8Trianglej
                                        # -- End function
	.globl	_Z10run3dScenev         # -- Begin function _Z10run3dScenev
	.p2align	2
	.type	_Z10run3dScenev,@function
_Z10run3dScenev:                        # @_Z10run3dScenev
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
	mv	s6, zero
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
	addi	a0, zero, 410
	sw	a0, 24(sp)
	addi	a1, zero, -100
	sw	a1, 28(sp)
	sw	zero, 32(sp)
	sw	a0, 36(sp)
	addi	a1, zero, 120
	sw	a1, 40(sp)
	sw	a1, 44(sp)
	sw	a0, 48(sp)
	sw	zero, 52(sp)
	sw	zero, 56(sp)
	addi	a0, zero, 1230
	sw	a0, 60(sp)
	addi	a0, zero, 20
	sw	a0, 64(sp)
	sw	a1, 68(sp)
	addi	s5, zero, 400
	sw	s5, 72(sp)
	addi	a0, zero, 100
	sw	a0, 76(sp)
	sw	zero, 80(sp)
	sw	s5, 84(sp)
	sw	zero, 88(sp)
	sw	a0, 92(sp)
	sw	s5, 96(sp)
	sw	zero, 100(sp)
	sw	zero, 104(sp)
	addi	a1, zero, 1200
	sw	a1, 108(sp)
	sw	a0, 112(sp)
	sw	a0, 116(sp)
	addi	s0, zero, 1
	sw	s0, 20(sp)
	sw	zero, 16(sp)
	lui	s7, %hi(app)
	lui	s1, 524288
	addi	a3, zero, 349
	lui	a0, %hi(triangleArray)
	addi	s8, a0, %lo(triangleArray)
	addi	s10, sp, 24
	mv	s3, sp
	addi	s4, sp, 16
	addi	s11, zero, 42
	addi	s9, zero, 37
	addi	s2, zero, 8
.LBB62_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB62_4 Depth 2
                                        #     Child Loop BB62_8 Depth 2
	lw	a4, %lo(app)(s7)
	lw	a1, 0(s1)
	beqz	a1, .LBB62_6
# %bb.2:                                #   in Loop: Header=BB62_1 Depth=1
	lw	a1, 8(a4)
	j	.LBB62_4
.LBB62_3:                               #   in Loop: Header=BB62_4 Depth=2
	lw	a2, 0(s1)
	beqz	a2, .LBB62_6
.LBB62_4:                               #   Parent Loop BB62_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	a1, a1, 1
	sw	a1, 8(a4)
	sw	s0, 16(a4)
	bne	a1, s2, .LBB62_3
# %bb.5:                                #   in Loop: Header=BB62_4 Depth=2
	lw	a2, 4(a4)
	mv	a1, zero
	addi	a2, a2, 1
	sw	a2, 4(a4)
	sw	zero, 8(a4)
	j	.LBB62_3
.LBB62_6:                               #   in Loop: Header=BB62_1 Depth=1
	lw	a1, 12(a4)
	j	.LBB62_8
.LBB62_7:                               #   in Loop: Header=BB62_8 Depth=2
	mv	a2, a1
	sw	zero, 12(a4)
	mv	a1, zero
	beq	a2, s9, .LBB62_13
.LBB62_8:                               #   Parent Loop BB62_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	bnez	a1, .LBB62_7
# %bb.9:                                #   in Loop: Header=BB62_8 Depth=2
	lw	a1, 8(s1)
	sw	a1, 12(a4)
	bnez	a1, .LBB62_7
# %bb.10:                               #   in Loop: Header=BB62_1 Depth=1
	addi	a1, zero, -350
	blt	a3, s6, .LBB62_12
# %bb.11:                               #   in Loop: Header=BB62_1 Depth=1
	addi	a1, zero, 10
.LBB62_12:                              #   in Loop: Header=BB62_1 Depth=1
	add	s6, a1, s6
	sw	s5, 0(sp)
	sw	zero, 4(sp)
	sw	zero, 8(sp)
	addi	a2, zero, 2
	mv	a0, s10
	mv	a1, s8
	mv	a3, s3
	mv	a4, s6
	call	_Z13applyRotationP8TriangleS0_j4Vecti
	addi	a2, zero, 2
	mv	a0, s8
	mv	a1, s4
	call	_Z13sortTrianglesP8TrianglePji
	lw	a0, 16(sp)
	addi	a1, zero, 48
	call	__mulsi3
	add	a0, a0, s8
	addi	a1, zero, 255
	mv	a2, zero
	mv	a3, zero
	call	_Z4drawRK8Trianglejjj
	lw	a0, 20(sp)
	addi	a1, zero, 48
	call	__mulsi3
	add	a0, a0, s8
	addi	a1, zero, 147
	addi	a2, zero, 112
	addi	a3, zero, 219
	call	_Z4drawRK8Trianglejjj
	lui	a1, 655360
	sw	s11, 12(a1)
	addi	a3, zero, 349
	j	.LBB62_1
.LBB62_13:
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
.Lfunc_end62:
	.size	_Z10run3dScenev, .Lfunc_end62-_Z10run3dScenev
                                        # -- End function
	.globl	_Z9menuEntryiPKDi       # -- Begin function _Z9menuEntryiPKDi
	.p2align	2
	.type	_Z9menuEntryiPKDi,@function
_Z9menuEntryiPKDi:                      # @_Z9menuEntryiPKDi
# %bb.0:
	lw	a5, 0(a1)
	beqz	a5, .LBB63_6
# %bb.1:
	mv	a4, zero
	slli	a0, a0, 4
	addi	a0, a0, 46
	addi	a1, a1, 4
	addi	a3, zero, 30
	lui	a7, 655360
	addi	a6, zero, 20
	j	.LBB63_4
.LBB63_2:                               #   in Loop: Header=BB63_4 Depth=1
	addi	a3, a3, 7
.LBB63_3:                               #   in Loop: Header=BB63_4 Depth=1
	lw	a5, 0(a1)
	addi	a1, a1, 4
	beqz	a5, .LBB63_6
.LBB63_4:                               # =>This Inner Loop Header: Depth=1
	slli	a2, a0, 8
	add	a2, a2, a3
	slli	a2, a2, 8
	ori	a2, a2, 1
	sw	a2, 12(a7)
	slli	a2, a5, 8
	ori	a2, a2, 5
	addi	a4, a4, 1
	sw	a2, 12(a7)
	bne	a4, a6, .LBB63_2
# %bb.5:                                #   in Loop: Header=BB63_4 Depth=1
	mv	a4, zero
	addi	a0, a0, 7
	addi	a3, zero, 30
	j	.LBB63_3
.LBB63_6:
	ret
.Lfunc_end63:
	.size	_Z9menuEntryiPKDi, .Lfunc_end63-_Z9menuEntryiPKDi
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
	lui	a1, 1507
	addi	a1, a1, -1024
	sw	a1, 72(sp)
	lui	a1, 1506
	addi	a1, a1, -512
	sw	a1, 68(sp)
	lui	a1, 1250
	addi	a1, a1, -512
	sw	a1, 64(sp)
	lui	a1, 995
	addi	a1, a1, -1024
	sw	a1, 60(sp)
	lui	a1, 994
	addi	a1, a1, -512
	sw	a1, 56(sp)
	lui	a1, 739
	addi	a1, a1, -1024
	sw	a1, 52(sp)
	lui	a1, 738
	addi	a1, a1, -512
	sw	a1, 48(sp)
	lui	s1, %hi(app)
	lw	a1, %lo(app)(s1)
	lui	s0, 524288
	lui	s9, 655360
	lui	a4, 4
	addi	a2, a4, 773
	sw	a2, 44(sp)
	lui	a5, 7
	addi	a2, a5, -1019
	sw	a2, 40(sp)
	addi	a2, a5, -251
	sw	a2, 36(sp)
	lui	a2, 6
	addi	a3, a2, 773
	sw	a3, 32(sp)
	lui	a3, 740
	addi	a3, a3, -1535
	sw	a3, 28(sp)
	addi	a3, a5, -1275
	sw	a3, 24(sp)
	addi	a3, a4, 1541
	sw	a3, 20(sp)
	addi	a2, a2, 261
	sw	a2, 16(sp)
	addi	a2, a5, 773
	sw	a2, 12(sp)
	addi	s4, a5, 1029
	lui	a2, 3
	addi	a2, a2, 773
	sw	a2, 8(sp)
	lui	a2, 5
	addi	a2, a2, 261
	sw	a2, 4(sp)
	lui	a2, 737
	addi	a2, a2, 1025
	sw	a2, 0(sp)
	addi	s8, zero, 2
	addi	s10, zero, 75
	addi	s11, zero, 1
	addi	s3, zero, 74
	addi	s5, zero, 59
	addi	s6, zero, 3
	addi	s7, zero, 8
	j	.LBB64_2
.LBB64_1:                               #   in Loop: Header=BB64_2 Depth=1
	andi	a2, s2, 1
	bnez	a2, .LBB64_26
.LBB64_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB64_5 Depth 2
                                        #     Child Loop BB64_9 Depth 2
	lw	a2, 0(s0)
	beqz	a2, .LBB64_7
# %bb.3:                                #   in Loop: Header=BB64_2 Depth=1
	lw	a2, 8(a1)
	j	.LBB64_5
.LBB64_4:                               #   in Loop: Header=BB64_5 Depth=2
	lw	a3, 0(s0)
	beqz	a3, .LBB64_7
.LBB64_5:                               #   Parent Loop BB64_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	a2, a2, 1
	sw	a2, 8(a1)
	sw	s11, 16(a1)
	bne	a2, s7, .LBB64_4
# %bb.6:                                #   in Loop: Header=BB64_5 Depth=2
	lw	a3, 4(a1)
	mv	a2, zero
	addi	a3, a3, 1
	sw	a3, 4(a1)
	sw	zero, 8(a1)
	j	.LBB64_4
.LBB64_7:                               #   in Loop: Header=BB64_2 Depth=1
	mv	s2, zero
	j	.LBB64_9
.LBB64_8:                               #   in Loop: Header=BB64_9 Depth=2
	addi	a0, a0, 1
	lw	a1, %lo(app)(s1)
.LBB64_9:                               #   Parent Loop BB64_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a2, 12(a1)
	bnez	a2, .LBB64_11
# %bb.10:                               #   in Loop: Header=BB64_9 Depth=2
	lw	a2, 8(s0)
	sw	a2, 12(a1)
	beqz	a2, .LBB64_24
.LBB64_11:                              #   in Loop: Header=BB64_9 Depth=2
	sw	zero, 12(a1)
	blt	s8, a0, .LBB64_13
# %bb.12:                               #   in Loop: Header=BB64_9 Depth=2
	beq	a2, s10, .LBB64_8
.LBB64_13:                              #   in Loop: Header=BB64_9 Depth=2
	blt	a0, s11, .LBB64_16
# %bb.14:                               #   in Loop: Header=BB64_9 Depth=2
	bne	a2, s3, .LBB64_16
# %bb.15:                               #   in Loop: Header=BB64_9 Depth=2
	addi	a0, a0, -1
	lw	a1, %lo(app)(s1)
	j	.LBB64_9
.LBB64_16:                              #   in Loop: Header=BB64_9 Depth=2
	bne	a2, s5, .LBB64_22
# %bb.17:                               #   in Loop: Header=BB64_9 Depth=2
	beq	a0, s6, .LBB64_21
# %bb.18:                               #   in Loop: Header=BB64_9 Depth=2
	beq	a0, s11, .LBB64_23
# %bb.19:                               #   in Loop: Header=BB64_9 Depth=2
	bnez	a0, .LBB64_22
# %bb.20:                               #   in Loop: Header=BB64_9 Depth=2
	call	_Z8runClockv
	mv	a0, zero
	lw	a1, %lo(app)(s1)
	j	.LBB64_9
.LBB64_21:                              #   in Loop: Header=BB64_9 Depth=2
	addi	s2, zero, 1
	addi	a0, zero, 3
.LBB64_22:                              #   in Loop: Header=BB64_9 Depth=2
	lw	a1, %lo(app)(s1)
	j	.LBB64_9
.LBB64_23:                              #   in Loop: Header=BB64_9 Depth=2
	call	_Z12runClockFastv
	addi	a0, zero, 1
	lw	a1, %lo(app)(s1)
	j	.LBB64_9
.LBB64_24:                              #   in Loop: Header=BB64_2 Depth=1
	lw	a2, 16(a1)
	beqz	a2, .LBB64_1
# %bb.25:                               #   in Loop: Header=BB64_2 Depth=1
	sw	zero, 16(a1)
	slli	a2, a0, 20
	lw	a3, 48(sp)
	sub	a3, a3, a2
	ori	a4, a3, 1
	sw	a4, 12(s9)
	lw	a4, 44(sp)
	sw	a4, 12(s9)
	addi	a3, a3, 1792
	ori	a3, a3, 1
	sw	a3, 12(s9)
	lw	a3, 40(sp)
	sw	a3, 12(s9)
	lw	a3, 52(sp)
	sub	a3, a3, a2
	ori	a4, a3, 1
	sw	a4, 12(s9)
	lw	a4, 36(sp)
	sw	a4, 12(s9)
	addi	a3, a3, 1792
	ori	a3, a3, 1
	sw	a3, 12(s9)
	lw	a3, 32(sp)
	sw	a3, 12(s9)
	lw	a3, 28(sp)
	sub	a3, a3, a2
	sw	a3, 12(s9)
	lw	a3, 24(sp)
	sw	a3, 12(s9)
	lw	a3, 56(sp)
	sub	a3, a3, a2
	ori	a4, a3, 1
	sw	a4, 12(s9)
	lw	a4, 20(sp)
	sw	a4, 12(s9)
	addi	a3, a3, 1792
	ori	a3, a3, 1
	sw	a3, 12(s9)
	lw	a3, 16(sp)
	sw	a3, 12(s9)
	lw	a3, 60(sp)
	sub	a3, a3, a2
	ori	a4, a3, 1
	sw	a4, 12(s9)
	lw	a4, 12(sp)
	sw	a4, 12(s9)
	addi	a3, a3, 1792
	ori	a3, a3, 1
	sw	a3, 12(s9)
	sw	s4, 12(s9)
	lw	a3, 64(sp)
	sub	a3, a3, a2
	ori	a4, a3, 1
	sw	a4, 12(s9)
	lw	a4, 8(sp)
	sw	a4, 12(s9)
	addi	a3, a3, 1792
	ori	a3, a3, 1
	sw	a3, 12(s9)
	lui	a5, 4
	addi	a3, a5, 1029
	sw	a3, 12(s9)
	lw	a3, 68(sp)
	sub	a3, a3, a2
	ori	a4, a3, 1
	sw	a4, 12(s9)
	lw	a4, 4(sp)
	sw	a4, 12(s9)
	addi	a3, a3, 1792
	ori	a3, a3, 1
	sw	a3, 12(s9)
	lui	a4, 7
	addi	a3, a4, 1285
	sw	a3, 12(s9)
	lw	a3, 72(sp)
	sub	a2, a3, a2
	ori	a3, a2, 1
	sw	a3, 12(s9)
	addi	a3, a4, -1787
	sw	a3, 12(s9)
	addi	a2, a2, 1792
	ori	a2, a2, 1
	sw	a2, 12(s9)
	sw	s4, 12(s9)
	lw	a2, 0(sp)
	sw	a2, 12(s9)
	addi	a2, a5, -507
	sw	a2, 12(s9)
	addi	a2, s9, 12
	addi	a3, zero, 42
	sw	a3, 0(a2)
	j	.LBB64_1
.LBB64_26:
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
.Lfunc_end64:
	.size	_Z7runMenuv, .Lfunc_end64-_Z7runMenuv
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
	call	_Z10run3dScenev
	mv	a0, zero
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end65:
	.size	main, .Lfunc_end65-main
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
	beqz	a7, .LBB66_9
# %bb.1:
	mv	a4, zero
	addi	a5, a2, 24
	lui	a2, %hi(.L.str.27)
	addi	a6, a2, %lo(.L.str.27)
.LBB66_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB66_5 Depth 2
	sw	a5, 8(a0)
	lw	t0, 4(a1)
	addi	a3, a5, 4
	sw	a3, 8(a0)
	lw	s0, 4(a1)
	addi	a5, a5, 8
	xori	a3, s0, 6
	seqz	s1, a3
	beqz	s0, .LBB66_7
# %bb.3:                                #   in Loop: Header=BB66_2 Depth=1
	mv	a3, a6
	j	.LBB66_5
.LBB66_4:                               #   in Loop: Header=BB66_5 Depth=2
	addi	a5, a5, 4
	addi	s0, s0, -1
	addi	a3, a3, 4
	beqz	s0, .LBB66_7
.LBB66_5:                               #   Parent Loop BB66_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	a2, s1, 1
	mv	s1, zero
	beqz	a2, .LBB66_4
# %bb.6:                                #   in Loop: Header=BB66_5 Depth=2
	sw	a5, 8(a0)
	lw	a2, 4(a1)
	lw	s1, 0(a3)
	xor	a2, a2, s1
	seqz	s1, a2
	j	.LBB66_4
.LBB66_7:                               #   in Loop: Header=BB66_2 Depth=1
	bnez	s1, .LBB66_10
# %bb.8:                                #   in Loop: Header=BB66_2 Depth=1
	addi	a4, a4, 1
	bne	a4, a7, .LBB66_2
.LBB66_9:
	mv	t0, zero
.LBB66_10:
	addi	a2, t0, 4
	sw	a2, 8(a0)
	lw	a7, 4(a1)
	addi	s2, s2, 4
	beqz	a7, .LBB66_19
# %bb.11:
	mv	a1, zero
	addi	a2, t0, 8
	lui	a3, 655360
	lui	a4, 524288
	lui	a5, %hi(.L.str.17)
	addi	a6, a5, %lo(.L.str.17)
.LBB66_12:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB66_15 Depth 2
	sw	a2, 8(a3)
	lw	a5, 4(a4)
	addi	a5, a2, 4
	sw	a5, 8(a3)
	lw	s0, 4(a4)
	addi	a2, a2, 8
	xori	a5, s0, 8
	seqz	s1, a5
	beqz	s0, .LBB66_17
# %bb.13:                               #   in Loop: Header=BB66_12 Depth=1
	mv	a5, a6
	j	.LBB66_15
.LBB66_14:                              #   in Loop: Header=BB66_15 Depth=2
	addi	a2, a2, 4
	addi	s0, s0, -1
	addi	a5, a5, 4
	beqz	s0, .LBB66_17
.LBB66_15:                              #   Parent Loop BB66_12 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	a0, s1, 1
	mv	s1, zero
	beqz	a0, .LBB66_14
# %bb.16:                               #   in Loop: Header=BB66_15 Depth=2
	sw	a2, 8(a3)
	lw	a0, 4(a4)
	lw	s1, 0(a5)
	xor	a0, a0, s1
	seqz	s1, a0
	j	.LBB66_14
.LBB66_17:                              #   in Loop: Header=BB66_12 Depth=1
	addi	a1, a1, 1
	beq	a1, a7, .LBB66_19
# %bb.18:                               #   in Loop: Header=BB66_12 Depth=1
	beqz	s1, .LBB66_12
.LBB66_19:
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
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 68
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 111
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 110
	mv	a0, s0
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s1)
	lw	a2, 0(a0)
	addi	a1, zero, 101
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
.Lfunc_end66:
	.size	_ZN3AppC2Ev, .Lfunc_end66-_ZN3AppC2Ev
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
	beqz	a6, .LBB67_6
# %bb.1:
	lui	a0, %hi(allocSize)
	lw	a2, %lo(allocSize)(a0)
	mv	a1, zero
	addi	a3, zero, 7
	mv	a4, a6
.LBB67_2:                               # =>This Inner Loop Header: Depth=1
	add	a5, a2, a1
	lw	a0, 0(a5)
	blt	a3, a0, .LBB67_8
# %bb.3:                                #   in Loop: Header=BB67_2 Depth=1
	addi	a4, a4, -1
	addi	a1, a1, 4
	bnez	a4, .LBB67_2
# %bb.4:
	addi	a0, zero, 100
	bne	a6, a0, .LBB67_7
# %bb.5:
	addi	a0, zero, 29
	call	exit
	lui	a0, %hi(nbBlocks)
	lw	a6, %lo(nbBlocks)(a0)
	j	.LBB67_7
.LBB67_6:
	mv	a6, zero
.LBB67_7:
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
	j	.LBB67_9
.LBB67_8:
	neg	a0, a0
	sw	a0, 0(a5)
	lui	a0, %hi(allocPos)
	lw	a0, %lo(allocPos)(a0)
	add	a0, a0, a1
	lw	a1, 0(a0)
.LBB67_9:
	lw	a2, 0(s0)
	sw	a1, 8(s0)
	bgeu	a2, s1, .LBB67_16
# %bb.10:
	lw	a0, 4(s0)
	bgeu	a0, s1, .LBB67_13
.LBB67_11:                              # =>This Inner Loop Header: Depth=1
	mv	a0, s0
	mv	a1, s1
	call	_ZN6vectorIDiE7reserveEj
	lw	a0, 4(s0)
	bltu	a0, s1, .LBB67_11
# %bb.12:
	lw	a2, 0(s0)
.LBB67_13:
	bgeu	a2, s1, .LBB67_17
# %bb.14:
	lw	a1, 8(s0)
	sub	a0, s1, a2
	slli	a2, a2, 2
	add	a1, a1, a2
.LBB67_15:                              # =>This Inner Loop Header: Depth=1
	sw	s2, 0(a1)
	addi	a0, a0, -1
	addi	a1, a1, 4
	bnez	a0, .LBB67_15
.LBB67_16:
	sw	s1, 0(s0)
.LBB67_17:
	addi	a1, zero, 2
	mv	a0, s0
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	tail	_ZN6vectorIDiE7reserveEj
.Lfunc_end67:
	.size	_ZN6vectorIDiEC2EjDi, .Lfunc_end67-_ZN6vectorIDiEC2EjDi
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
.Lfunc_end68:
	.size	_ZN4File8readWordEv, .Lfunc_end68-_ZN4File8readWordEv
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
.Lfunc_end69:
	.size	_ZN4File8readByteEv, .Lfunc_end69-_ZN4File8readByteEv
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
.Lfunc_end70:
	.size	_ZN17StandardOutStream9send_wordEj, .Lfunc_end70-_ZN17StandardOutStream9send_wordEj
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

	.type	app,@object             # @app
	.section	.sbss,"aw",@nobits
	.globl	app
	.p2align	2
app:
	.word	0
	.size	app, 4

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

	.type	triangleArray,@object   # @triangleArray
	.bss
	.globl	triangleArray
	.p2align	2
triangleArray:
	.zero	480
	.size	triangleArray, 480

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

	.type	.L.str.27,@object       # @.str.27
	.section	.rodata.str4.4,"aMS",@progbits,4
	.p2align	2
.L.str.27:
	.word	105                     # 0x69
	.word	109                     # 0x6d
	.word	97                      # 0x61
	.word	103                     # 0x67
	.word	101                     # 0x65
	.word	115                     # 0x73
	.word	0                       # 0x0
	.size	.L.str.27, 28

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
