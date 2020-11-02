	.text
	.file	"main.cpp"
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
	j	.LBB0_1
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	mv	a1, zero
	beq	a0, a1, .LBB0_5
	j	.LBB0_2
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	and	a0, a0, a1
	mv	a1, zero
	beq	a0, a1, .LBB0_4
	j	.LBB0_3
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	lw	a0, -12(s0)
	lw	a1, -20(s0)
	add	a0, a1, a0
	sw	a0, -20(s0)
	j	.LBB0_4
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	lw	a0, -16(s0)
	srli	a0, a0, 1
	sw	a0, -16(s0)
	lw	a0, -12(s0)
	slli	a0, a0, 1
	sw	a0, -12(s0)
	j	.LBB0_1
.LBB0_5:
	lw	a0, -20(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	__mulsi3, .Lfunc_end0-__mulsi3
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
	j	.LBB1_1
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	lw	a1, -12(s0)
	srli	a1, a1, 1
	bltu	a1, a0, .LBB1_3
	j	.LBB1_2
.LBB1_2:                                #   in Loop: Header=BB1_1 Depth=1
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	lw	a0, -16(s0)
	slli	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB1_1
.LBB1_3:
	j	.LBB1_4
.LBB1_4:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -20(s0)
	mv	a1, zero
	beq	a0, a1, .LBB1_8
	j	.LBB1_5
.LBB1_5:                                #   in Loop: Header=BB1_4 Depth=1
	lw	a0, -20(s0)
	addi	a0, a0, -1
	sw	a0, -20(s0)
	lw	a0, -24(s0)
	slli	a0, a0, 1
	sw	a0, -24(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	bltu	a0, a1, .LBB1_7
	j	.LBB1_6
.LBB1_6:                                #   in Loop: Header=BB1_4 Depth=1
	lw	a0, -16(s0)
	lw	a1, -12(s0)
	sub	a0, a1, a0
	sw	a0, -12(s0)
	lw	a0, -24(s0)
	addi	a0, a0, 1
	sw	a0, -24(s0)
	j	.LBB1_7
.LBB1_7:                                #   in Loop: Header=BB1_4 Depth=1
	lw	a0, -16(s0)
	srli	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB1_4
.LBB1_8:
	lw	a0, -24(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end1:
	.size	__udivsi3, .Lfunc_end1-__udivsi3
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
	lw	a0, -12(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end2:
	.size	__umodsi3, .Lfunc_end2-__umodsi3
                                        # -- End function
	.globl	_Z6malloci              # -- Begin function _Z6malloci
	.p2align	2
	.type	_Z6malloci,@function
_Z6malloci:                             # @_Z6malloci
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	mv	a0, zero
	sw	a0, -20(s0)
	j	.LBB3_1
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -20(s0)
	lui	a1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(a1)
	bgeu	a0, a1, .LBB3_6
	j	.LBB3_2
.LBB3_2:                                #   in Loop: Header=BB3_1 Depth=1
	lui	a0, %hi(allocSize)
	lw	a0, %lo(allocSize)(a0)
	lw	a1, -20(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	lw	a1, -16(s0)
	blt	a0, a1, .LBB3_4
	j	.LBB3_3
.LBB3_3:
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
	j	.LBB3_9
.LBB3_4:                                #   in Loop: Header=BB3_1 Depth=1
	j	.LBB3_5
.LBB3_5:                                #   in Loop: Header=BB3_1 Depth=1
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB3_1
.LBB3_6:
	lui	a0, %hi(nbBlocks)
	lw	a0, %lo(nbBlocks)(a0)
	addi	a1, zero, 100
	bne	a0, a1, .LBB3_8
	j	.LBB3_7
.LBB3_7:
	addi	a0, zero, 29
	call	exit
	j	.LBB3_8
.LBB3_8:
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
	j	.LBB3_9
.LBB3_9:
	lw	a0, -12(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end3:
	.size	_Z6malloci, .Lfunc_end3-_Z6malloci
	.cfi_endproc
                                        # -- End function
	.globl	_Z4freePv               # -- Begin function _Z4freePv
	.p2align	2
	.type	_Z4freePv,@function
_Z4freePv:                              # @_Z4freePv
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	mv	a0, zero
	sw	a0, -16(s0)
	j	.LBB4_1
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	lui	a1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(a1)
	bgeu	a0, a1, .LBB4_6
	j	.LBB4_2
.LBB4_2:                                #   in Loop: Header=BB4_1 Depth=1
	lui	a0, %hi(allocPos)
	lw	a0, %lo(allocPos)(a0)
	lw	a1, -16(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	lw	a1, -12(s0)
	bne	a0, a1, .LBB4_4
	j	.LBB4_3
.LBB4_3:
	lui	a0, %hi(allocSize)
	lw	a0, %lo(allocSize)(a0)
	lw	a1, -16(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a1, 0(a0)
	mv	a2, zero
	sub	a1, a2, a1
	sw	a1, 0(a0)
	j	.LBB4_7
.LBB4_4:                                #   in Loop: Header=BB4_1 Depth=1
	j	.LBB4_5
.LBB4_5:                                #   in Loop: Header=BB4_1 Depth=1
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB4_1
.LBB4_6:
	addi	a0, zero, 40
	call	exit
	j	.LBB4_7
.LBB4_7:
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end4:
	.size	_Z4freePv, .Lfunc_end4-_Z4freePv
	.cfi_endproc
                                        # -- End function
	.globl	_Znwj                   # -- Begin function _Znwj
	.p2align	2
	.type	_Znwj,@function
_Znwj:                                  # @_Znwj
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	call	_Z6malloci
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end5:
	.size	_Znwj, .Lfunc_end5-_Znwj
	.cfi_endproc
                                        # -- End function
	.globl	_Znaj                   # -- Begin function _Znaj
	.p2align	2
	.type	_Znaj,@function
_Znaj:                                  # @_Znaj
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	call	_Z6malloci
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end6:
	.size	_Znaj, .Lfunc_end6-_Znaj
	.cfi_endproc
                                        # -- End function
	.globl	_ZdaPv                  # -- Begin function _ZdaPv
	.p2align	2
	.type	_ZdaPv,@function
_ZdaPv:                                 # @_ZdaPv
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	call	_Z4freePv
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end7:
	.size	_ZdaPv, .Lfunc_end7-_ZdaPv
	.cfi_endproc
                                        # -- End function
	.globl	_ZdlPv                  # -- Begin function _ZdlPv
	.p2align	2
	.type	_ZdlPv,@function
_ZdlPv:                                 # @_ZdlPv
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	call	_Z4freePv
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end8:
	.size	_ZdlPv, .Lfunc_end8-_ZdlPv
	.cfi_endproc
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
.Lfunc_end9:
	.size	_Z14initMemManagerv, .Lfunc_end9-_Z14initMemManagerv
                                        # -- End function
	.globl	_ZlsR13TextOutStreamc   # -- Begin function _ZlsR13TextOutStreamc
	.p2align	2
	.type	_ZlsR13TextOutStreamc,@function
_ZlsR13TextOutStreamc:                  # @_ZlsR13TextOutStreamc
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
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
.Lfunc_end10:
	.size	_ZlsR13TextOutStreamc, .Lfunc_end10-_ZlsR13TextOutStreamc
	.cfi_endproc
                                        # -- End function
	.globl	_ZlsR13TextOutStreamPKc # -- Begin function _ZlsR13TextOutStreamPKc
	.p2align	2
	.type	_ZlsR13TextOutStreamPKc,@function
_ZlsR13TextOutStreamPKc:                # @_ZlsR13TextOutStreamPKc
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	j	.LBB11_1
.LBB11_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	lbu	a0, 0(a0)
	mv	a1, zero
	beq	a0, a1, .LBB11_3
	j	.LBB11_2
.LBB11_2:                               #   in Loop: Header=BB11_1 Depth=1
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lbu	a1, 0(a1)
	lw	a2, 0(a0)
	lw	a2, 0(a2)
	jalr	a2
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB11_1
.LBB11_3:
	lw	a0, -12(s0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end11:
	.size	_ZlsR13TextOutStreamPKc, .Lfunc_end11-_ZlsR13TextOutStreamPKc
	.cfi_endproc
                                        # -- End function
	.globl	_ZlsR13TextOutStreamj   # -- Begin function _ZlsR13TextOutStreamj
	.p2align	2
	.type	_ZlsR13TextOutStreamj,@function
_ZlsR13TextOutStreamj:                  # @_ZlsR13TextOutStreamj
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
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
.Lfunc_end12:
	.size	_ZlsR13TextOutStreamj, .Lfunc_end12-_ZlsR13TextOutStreamj
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN13TextOutStream11send_digitsEjj,"axG",@progbits,_ZN13TextOutStream11send_digitsEjj,comdat
	.weak	_ZN13TextOutStream11send_digitsEjj # -- Begin function _ZN13TextOutStream11send_digitsEjj
	.p2align	2
	.type	_ZN13TextOutStream11send_digitsEjj,@function
_ZN13TextOutStream11send_digitsEjj:     # @_ZN13TextOutStream11send_digitsEjj
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	mv	a2, zero
	sw	a0, -36(s0)
	bne	a1, a2, .LBB13_2
	j	.LBB13_1
.LBB13_1:
	lw	a0, -36(s0)
	lw	a1, 0(a0)
	lw	a1, 0(a1)
	addi	a2, zero, 48
	sw	a1, -40(s0)
	mv	a1, a2
	lw	a2, -40(s0)
	jalr	a2
	j	.LBB13_13
.LBB13_2:
	mv	a0, zero
	sb	a0, -21(s0)
	lw	a0, -20(s0)
	addi	a1, zero, 10
	sub	a0, a1, a0
	sw	a0, -28(s0)
	j	.LBB13_3
.LBB13_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB13_5 Depth 2
	lw	a0, -28(s0)
	addi	a1, zero, 9
	bltu	a1, a0, .LBB13_12
	j	.LBB13_4
.LBB13_4:                               #   in Loop: Header=BB13_3 Depth=1
	mv	a0, zero
	sw	a0, -32(s0)
	j	.LBB13_5
.LBB13_5:                               #   Parent Loop BB13_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -16(s0)
	lw	a1, -28(s0)
	lui	a2, %hi(_ZL8digits32)
	addi	a2, a2, %lo(_ZL8digits32)
	slli	a1, a1, 2
	add	a1, a1, a2
	lw	a1, 0(a1)
	bltu	a0, a1, .LBB13_7
	j	.LBB13_6
.LBB13_6:                               #   in Loop: Header=BB13_5 Depth=2
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
	j	.LBB13_5
.LBB13_7:                               #   in Loop: Header=BB13_3 Depth=1
	lw	a0, -32(s0)
	mv	a1, zero
	bne	a0, a1, .LBB13_9
	j	.LBB13_8
.LBB13_8:                               #   in Loop: Header=BB13_3 Depth=1
	lbu	a0, -21(s0)
	andi	a0, a0, 1
	mv	a1, zero
	beq	a0, a1, .LBB13_10
	j	.LBB13_9
.LBB13_9:                               #   in Loop: Header=BB13_3 Depth=1
	addi	a0, zero, 1
	sb	a0, -21(s0)
	lw	a0, -32(s0)
	addi	a1, a0, 48
	lw	a0, -36(s0)
	lw	a2, 0(a0)
	lw	a2, 0(a2)
	jalr	a2
	j	.LBB13_10
.LBB13_10:                              #   in Loop: Header=BB13_3 Depth=1
	j	.LBB13_11
.LBB13_11:                              #   in Loop: Header=BB13_3 Depth=1
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB13_3
.LBB13_12:
	j	.LBB13_13
.LBB13_13:
	lw	s0, 40(sp)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end13:
	.size	_ZN13TextOutStream11send_digitsEjj, .Lfunc_end13-_ZN13TextOutStream11send_digitsEjj
	.cfi_endproc
                                        # -- End function
	.text
	.globl	_ZlsR13TextOutStreami   # -- Begin function _ZlsR13TextOutStreami
	.p2align	2
	.type	_ZlsR13TextOutStreami,@function
_ZlsR13TextOutStreami:                  # @_ZlsR13TextOutStreami
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
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
.Lfunc_end14:
	.size	_ZlsR13TextOutStreami, .Lfunc_end14-_ZlsR13TextOutStreami
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN13TextOutStream11send_digitsEij,"axG",@progbits,_ZN13TextOutStream11send_digitsEij,comdat
	.weak	_ZN13TextOutStream11send_digitsEij # -- Begin function _ZN13TextOutStream11send_digitsEij
	.p2align	2
	.type	_ZN13TextOutStream11send_digitsEij,@function
_ZN13TextOutStream11send_digitsEij:     # @_ZN13TextOutStream11send_digitsEij
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	addi	a2, zero, -1
	sw	a0, -24(s0)
	blt	a2, a1, .LBB15_2
	j	.LBB15_1
.LBB15_1:
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
	j	.LBB15_2
.LBB15_2:
	lw	a1, -16(s0)
	addi	a2, zero, 10
	lw	a0, -24(s0)
	call	_ZN13TextOutStream11send_digitsEjj
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end15:
	.size	_ZN13TextOutStream11send_digitsEij, .Lfunc_end15-_ZN13TextOutStream11send_digitsEij
	.cfi_endproc
                                        # -- End function
	.text
	.globl	_ZlsR13TextOutStreamRK6string # -- Begin function _ZlsR13TextOutStreamRK6string
	.p2align	2
	.type	_ZlsR13TextOutStreamRK6string,@function
_ZlsR13TextOutStreamRK6string:          # @_ZlsR13TextOutStreamRK6string
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
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
	j	.LBB16_1
.LBB16_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -24(s0)
	lw	a1, -28(s0)
	beq	a0, a1, .LBB16_4
	j	.LBB16_2
.LBB16_2:                               #   in Loop: Header=BB16_1 Depth=1
	lw	a0, -24(s0)
	lw	a0, 0(a0)
	sw	a0, -32(s0)
	lw	a0, -12(s0)
	lw	a1, -32(s0)
	lw	a2, 0(a0)
	lw	a2, 0(a2)
	jalr	a2
	j	.LBB16_3
.LBB16_3:                               #   in Loop: Header=BB16_1 Depth=1
	lw	a0, -24(s0)
	addi	a0, a0, 4
	sw	a0, -24(s0)
	j	.LBB16_1
.LBB16_4:
	lw	a0, -12(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end16:
	.size	_ZlsR13TextOutStreamRK6string, .Lfunc_end16-_ZlsR13TextOutStreamRK6string
	.cfi_endproc
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
.Lfunc_end17:
	.size	_ZNK6vectorIjE5beginEv, .Lfunc_end17-_ZNK6vectorIjE5beginEv
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
.Lfunc_end18:
	.size	_ZNK6vectorIjE3endEv, .Lfunc_end18-_ZNK6vectorIjE3endEv
                                        # -- End function
	.text
	.globl	_ZplRK6stringS1_        # -- Begin function _ZplRK6stringS1_
	.p2align	2
	.type	_ZplRK6stringS1_,@function
_ZplRK6stringS1_:                       # @_ZplRK6stringS1_
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -64
	.cfi_def_cfa_offset 64
	sw	ra, 60(sp)
	sw	s0, 56(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 64
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	lw	a1, -16(s0)
	sw	a0, -40(s0)
	mv	a0, a1
	call	_ZNK6vectorIjE4sizeEv
	sw	a0, -24(s0)
	lw	a0, -20(s0)
	call	_ZNK6vectorIjE4sizeEv
	sw	a0, -28(s0)
	lw	a0, -24(s0)
	lw	a1, -28(s0)
	add	a1, a0, a1
	mv	a0, zero
	lw	a2, -40(s0)
	sw	a0, -44(s0)
	mv	a0, a2
	lw	a2, -44(s0)
	call	_ZN6stringC2Eij
	lw	a0, -44(s0)
	sw	a0, -32(s0)
	j	.LBB19_1
.LBB19_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -32(s0)
	lw	a1, -24(s0)
	bgeu	a0, a1, .LBB19_4
	j	.LBB19_2
.LBB19_2:                               #   in Loop: Header=BB19_1 Depth=1
	lw	a0, -16(s0)
	lw	a1, -32(s0)
	call	_ZNK6vectorIjE3getEj
	lw	a0, 0(a0)
	lw	a1, -32(s0)
	lw	a2, -40(s0)
	sw	a0, -48(s0)
	mv	a0, a2
	call	_ZN6vectorIjEixEi
	lw	a1, -48(s0)
	sw	a1, 0(a0)
	j	.LBB19_3
.LBB19_3:                               #   in Loop: Header=BB19_1 Depth=1
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB19_1
.LBB19_4:
	mv	a0, zero
	sw	a0, -36(s0)
	j	.LBB19_5
.LBB19_5:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -36(s0)
	lw	a1, -28(s0)
	bgeu	a0, a1, .LBB19_8
	j	.LBB19_6
.LBB19_6:                               #   in Loop: Header=BB19_5 Depth=1
	lw	a0, -20(s0)
	lw	a1, -36(s0)
	call	_ZNK6vectorIjE3getEj
	lw	a0, 0(a0)
	lw	a1, -24(s0)
	lw	a2, -36(s0)
	add	a1, a1, a2
	lw	a2, -40(s0)
	sw	a0, -52(s0)
	mv	a0, a2
	call	_ZN6vectorIjEixEi
	lw	a1, -52(s0)
	sw	a1, 0(a0)
	j	.LBB19_7
.LBB19_7:                               #   in Loop: Header=BB19_5 Depth=1
	lw	a0, -36(s0)
	addi	a0, a0, 1
	sw	a0, -36(s0)
	j	.LBB19_5
.LBB19_8:
	lw	s0, 56(sp)
	lw	ra, 60(sp)
	addi	sp, sp, 64
	ret
.Lfunc_end19:
	.size	_ZplRK6stringS1_, .Lfunc_end19-_ZplRK6stringS1_
	.cfi_endproc
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
.Lfunc_end20:
	.size	_ZNK6vectorIjE4sizeEv, .Lfunc_end20-_ZNK6vectorIjE4sizeEv
                                        # -- End function
	.section	.text._ZN6stringC2Eij,"axG",@progbits,_ZN6stringC2Eij,comdat
	.weak	_ZN6stringC2Eij         # -- Begin function _ZN6stringC2Eij
	.p2align	2
	.type	_ZN6stringC2Eij,@function
_ZN6stringC2Eij:                        # @_ZN6stringC2Eij
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
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
.Lfunc_end21:
	.size	_ZN6stringC2Eij, .Lfunc_end21-_ZN6stringC2Eij
	.cfi_endproc
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
.Lfunc_end22:
	.size	_ZNK6vectorIjE3getEj, .Lfunc_end22-_ZNK6vectorIjE3getEj
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
.Lfunc_end23:
	.size	_ZN6vectorIjEixEi, .Lfunc_end23-_ZN6vectorIjEixEi
                                        # -- End function
	.text
	.globl	_Z6hdd_cdjPKc           # -- Begin function _Z6hdd_cdjPKc
	.p2align	2
	.type	_Z6hdd_cdjPKc,@function
_Z6hdd_cdjPKc:                          # @_Z6hdd_cdjPKc
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -64
	.cfi_def_cfa_offset 64
	sw	ra, 60(sp)
	sw	s0, 56(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 64
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -20(s0)
	lw	a0, -20(s0)
	call	_Z6strlenPKc
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
	j	.LBB24_1
.LBB24_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB24_3 Depth 2
	lw	a0, -32(s0)
	lw	a1, -28(s0)
	bgeu	a0, a1, .LBB24_12
	j	.LBB24_2
.LBB24_2:                               #   in Loop: Header=BB24_1 Depth=1
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
	j	.LBB24_3
.LBB24_3:                               #   Parent Loop BB24_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -48(s0)
	lw	a1, -40(s0)
	bgeu	a0, a1, .LBB24_8
	j	.LBB24_4
.LBB24_4:                               #   in Loop: Header=BB24_3 Depth=2
	lbu	a0, -41(s0)
	andi	a0, a0, 1
	mv	a1, zero
	mv	a2, a1
	sw	a2, -52(s0)
	beq	a0, a1, .LBB24_6
	j	.LBB24_5
.LBB24_5:                               #   in Loop: Header=BB24_3 Depth=2
	lw	a0, -16(s0)
	call	_Z10read_drivej
	lw	a1, -20(s0)
	lw	a2, -48(s0)
	add	a1, a1, a2
	lbu	a1, 0(a1)
	xor	a0, a0, a1
	seqz	a0, a0
	sw	a0, -52(s0)
	j	.LBB24_6
.LBB24_6:                               #   in Loop: Header=BB24_3 Depth=2
	lw	a0, -52(s0)
	andi	a0, a0, 1
	sb	a0, -41(s0)
	lw	a0, -16(s0)
	addi	a0, a0, 4
	sw	a0, -16(s0)
	j	.LBB24_7
.LBB24_7:                               #   in Loop: Header=BB24_3 Depth=2
	lw	a0, -48(s0)
	addi	a0, a0, 1
	sw	a0, -48(s0)
	j	.LBB24_3
.LBB24_8:                               #   in Loop: Header=BB24_1 Depth=1
	lbu	a0, -41(s0)
	andi	a0, a0, 1
	mv	a1, zero
	beq	a0, a1, .LBB24_10
	j	.LBB24_9
.LBB24_9:
	lw	a0, -36(s0)
	sw	a0, -12(s0)
	j	.LBB24_13
.LBB24_10:                              #   in Loop: Header=BB24_1 Depth=1
	j	.LBB24_11
.LBB24_11:                              #   in Loop: Header=BB24_1 Depth=1
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB24_1
.LBB24_12:
	mv	a0, zero
	sw	a0, -12(s0)
	j	.LBB24_13
.LBB24_13:
	lw	a0, -12(s0)
	lw	s0, 56(sp)
	lw	ra, 60(sp)
	addi	sp, sp, 64
	ret
.Lfunc_end24:
	.size	_Z6hdd_cdjPKc, .Lfunc_end24-_Z6hdd_cdjPKc
	.cfi_endproc
                                        # -- End function
	.section	.text._Z6strlenPKc,"axG",@progbits,_Z6strlenPKc,comdat
	.weak	_Z6strlenPKc            # -- Begin function _Z6strlenPKc
	.p2align	2
	.type	_Z6strlenPKc,@function
_Z6strlenPKc:                           # @_Z6strlenPKc
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	mv	a0, zero
	sw	a0, -16(s0)
	j	.LBB25_1
.LBB25_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -12(s0)
	lbu	a0, 0(a0)
	mv	a1, zero
	beq	a0, a1, .LBB25_3
	j	.LBB25_2
.LBB25_2:                               #   in Loop: Header=BB25_1 Depth=1
	lw	a0, -12(s0)
	addi	a0, a0, 1
	sw	a0, -12(s0)
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB25_1
.LBB25_3:
	lw	a0, -16(s0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end25:
	.size	_Z6strlenPKc, .Lfunc_end25-_Z6strlenPKc
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
.Lfunc_end26:
	.size	_Z10read_drivej, .Lfunc_end26-_Z10read_drivej
                                        # -- End function
	.text
	.globl	_Z8hdd_rootv            # -- Begin function _Z8hdd_rootv
	.p2align	2
	.type	_Z8hdd_rootv,@function
_Z8hdd_rootv:                           # @_Z8hdd_rootv
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	addi	a0, zero, 4
	call	_Z10read_drivej
	addi	a0, a0, 16
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end27:
	.size	_Z8hdd_rootv, .Lfunc_end27-_Z8hdd_rootv
	.cfi_endproc
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
	blt	a2, a0, .LBB28_2
	j	.LBB28_1
.LBB28_1:
	addi	a0, zero, 1
	sw	a0, -12(s0)
	j	.LBB28_7
.LBB28_2:
	lbu	a0, -13(s0)
	addi	a1, zero, 223
	blt	a1, a0, .LBB28_4
	j	.LBB28_3
.LBB28_3:
	addi	a0, zero, 2
	sw	a0, -12(s0)
	j	.LBB28_7
.LBB28_4:
	lbu	a0, -13(s0)
	addi	a1, zero, 239
	blt	a1, a0, .LBB28_6
	j	.LBB28_5
.LBB28_5:
	addi	a0, zero, 3
	sw	a0, -12(s0)
	j	.LBB28_7
.LBB28_6:
	addi	a0, zero, 4
	sw	a0, -12(s0)
	j	.LBB28_7
.LBB28_7:
	lw	a0, -12(s0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end28:
	.size	_Z19numberOfBytesInCharh, .Lfunc_end28-_Z19numberOfBytesInCharh
                                        # -- End function
	.globl	_Z9read_utf8R4File      # -- Begin function _Z9read_utf8R4File
	.p2align	2
	.type	_Z9read_utf8R4File,@function
_Z9read_utf8R4File:                     # @_Z9read_utf8R4File
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -64
	.cfi_def_cfa_offset 64
	sw	ra, 60(sp)
	sw	s0, 56(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 64
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	mv	a1, zero
	sw	a0, -24(s0)
	sw	a1, -28(s0)
	lw	a2, -28(s0)
	call	_ZN6stringC2Eij
	lw	a0, -16(s0)
	call	_ZN4File4sizeEv
	lw	a1, -24(s0)
	sw	a0, -32(s0)
	mv	a0, a1
	lw	a1, -32(s0)
	call	_ZN6vectorIjE7reserveEj
	j	.LBB29_1
.LBB29_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	call	_ZN4File3eofEv
	bnez	a0, .LBB29_13
	j	.LBB29_2
.LBB29_2:                               #   in Loop: Header=BB29_1 Depth=1
	lw	a0, -16(s0)
	lw	a1, 0(a0)
	lw	a1, 4(a1)
	jalr	a1
	sw	a0, -20(s0)
	lw	a0, -20(s0)
	addi	a1, zero, 240
	bltu	a0, a1, .LBB29_4
	j	.LBB29_3
.LBB29_3:                               #   in Loop: Header=BB29_1 Depth=1
	lw	a0, -20(s0)
	andi	a0, a0, 31
	sw	a0, -20(s0)
	lw	a0, -20(s0)
	slli	a0, a0, 6
	lw	a1, -16(s0)
	lw	a2, 0(a1)
	lw	a2, 4(a2)
	sw	a0, -36(s0)
	mv	a0, a1
	jalr	a2
	andi	a0, a0, 63
	lw	a1, -36(s0)
	or	a0, a1, a0
	sw	a0, -20(s0)
	lw	a0, -20(s0)
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
	sw	a0, -20(s0)
	lw	a0, -20(s0)
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
	sw	a0, -20(s0)
	j	.LBB29_10
.LBB29_4:                               #   in Loop: Header=BB29_1 Depth=1
	lw	a0, -20(s0)
	addi	a1, zero, 224
	bltu	a0, a1, .LBB29_6
	j	.LBB29_5
.LBB29_5:                               #   in Loop: Header=BB29_1 Depth=1
	lw	a0, -20(s0)
	andi	a0, a0, 15
	sw	a0, -20(s0)
	lw	a0, -20(s0)
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
	sw	a0, -20(s0)
	lw	a0, -20(s0)
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
	sw	a0, -20(s0)
	j	.LBB29_9
.LBB29_6:                               #   in Loop: Header=BB29_1 Depth=1
	lw	a0, -20(s0)
	addi	a1, zero, 128
	bltu	a0, a1, .LBB29_8
	j	.LBB29_7
.LBB29_7:                               #   in Loop: Header=BB29_1 Depth=1
	lw	a0, -20(s0)
	andi	a0, a0, 7
	sw	a0, -20(s0)
	lw	a0, -20(s0)
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
	sw	a0, -20(s0)
	j	.LBB29_8
.LBB29_8:                               #   in Loop: Header=BB29_1 Depth=1
	j	.LBB29_9
.LBB29_9:                               #   in Loop: Header=BB29_1 Depth=1
	j	.LBB29_10
.LBB29_10:                              #   in Loop: Header=BB29_1 Depth=1
	lw	a0, -20(s0)
	mv	a1, zero
	beq	a0, a1, .LBB29_12
	j	.LBB29_11
.LBB29_11:                              #   in Loop: Header=BB29_1 Depth=1
	addi	a1, s0, -20
	lw	a0, -24(s0)
	call	_ZN6vectorIjE9push_backERKj
	j	.LBB29_12
.LBB29_12:                              #   in Loop: Header=BB29_1 Depth=1
	j	.LBB29_1
.LBB29_13:
	lw	s0, 56(sp)
	lw	ra, 60(sp)
	addi	sp, sp, 64
	ret
.Lfunc_end29:
	.size	_Z9read_utf8R4File, .Lfunc_end29-_Z9read_utf8R4File
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN6vectorIjE7reserveEj,"axG",@progbits,_ZN6vectorIjE7reserveEj,comdat
	.weak	_ZN6vectorIjE7reserveEj # -- Begin function _ZN6vectorIjE7reserveEj
	.p2align	2
	.type	_ZN6vectorIjE7reserveEj,@function
_ZN6vectorIjE7reserveEj:                # @_ZN6vectorIjE7reserveEj
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lw	a2, 4(a0)
	sw	a0, -28(s0)
	bgeu	a2, a1, .LBB30_11
	j	.LBB30_1
.LBB30_1:
	j	.LBB30_2
.LBB30_2:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -28(s0)
	lw	a1, 4(a0)
	lw	a2, -16(s0)
	bgeu	a1, a2, .LBB30_4
	j	.LBB30_3
.LBB30_3:                               #   in Loop: Header=BB30_2 Depth=1
	lw	a0, -28(s0)
	lw	a1, 4(a0)
	add	a1, a1, a1
	sw	a1, 4(a0)
	j	.LBB30_2
.LBB30_4:
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
	bne	a2, a4, .LBB30_6
# %bb.5:
	lw	a0, -32(s0)
	sw	a0, -40(s0)
.LBB30_6:
	lw	a0, -40(s0)
	call	_Znaj
	sw	a0, -20(s0)
	lw	a0, -36(s0)
	sw	a0, -24(s0)
	j	.LBB30_7
.LBB30_7:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -24(s0)
	lw	a1, -28(s0)
	lw	a2, 0(a1)
	bgeu	a0, a2, .LBB30_10
	j	.LBB30_8
.LBB30_8:                               #   in Loop: Header=BB30_7 Depth=1
	lw	a0, -28(s0)
	lw	a1, 8(a0)
	lw	a2, -24(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	lw	a1, 0(a1)
	lw	a3, -20(s0)
	add	a2, a3, a2
	sw	a1, 0(a2)
	j	.LBB30_9
.LBB30_9:                               #   in Loop: Header=BB30_7 Depth=1
	lw	a0, -24(s0)
	addi	a0, a0, 1
	sw	a0, -24(s0)
	j	.LBB30_7
.LBB30_10:
	lw	a0, -20(s0)
	lw	a1, -28(s0)
	sw	a0, 8(a1)
	j	.LBB30_11
.LBB30_11:
	lw	s0, 40(sp)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end30:
	.size	_ZN6vectorIjE7reserveEj, .Lfunc_end30-_ZN6vectorIjE7reserveEj
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN4File4sizeEv,"axG",@progbits,_ZN4File4sizeEv,comdat
	.weak	_ZN4File4sizeEv         # -- Begin function _ZN4File4sizeEv
	.p2align	2
	.type	_ZN4File4sizeEv,@function
_ZN4File4sizeEv:                        # @_ZN4File4sizeEv
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	sw	a0, -16(s0)
	call	_ZN4File3eofEv
	mv	a1, zero
	beq	a0, a1, .LBB31_2
	j	.LBB31_1
.LBB31_1:
	mv	a0, zero
	sw	a0, -20(s0)
	j	.LBB31_3
.LBB31_2:
	lw	a0, -16(s0)
	lw	a1, 8(a0)
	lw	a2, 4(a0)
	sub	a1, a1, a2
	sw	a1, -20(s0)
	j	.LBB31_3
.LBB31_3:
	lw	a0, -20(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end31:
	.size	_ZN4File4sizeEv, .Lfunc_end31-_ZN4File4sizeEv
	.cfi_endproc
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
.Lfunc_end32:
	.size	_ZN4File3eofEv, .Lfunc_end32-_ZN4File3eofEv
                                        # -- End function
	.section	.text._ZN6vectorIjE9push_backERKj,"axG",@progbits,_ZN6vectorIjE9push_backERKj,comdat
	.weak	_ZN6vectorIjE9push_backERKj # -- Begin function _ZN6vectorIjE9push_backERKj
	.p2align	2
	.type	_ZN6vectorIjE9push_backERKj,@function
_ZN6vectorIjE9push_backERKj:            # @_ZN6vectorIjE9push_backERKj
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	lw	a1, 0(a0)
	lw	a2, 4(a0)
	sw	a0, -20(s0)
	bltu	a1, a2, .LBB33_2
	j	.LBB33_1
.LBB33_1:
	lw	a0, -20(s0)
	lw	a1, 4(a0)
	add	a1, a1, a1
	call	_ZN6vectorIjE7reserveEj
	j	.LBB33_2
.LBB33_2:
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
.Lfunc_end33:
	.size	_ZN6vectorIjE9push_backERKj, .Lfunc_end33-_ZN6vectorIjE9push_backERKj
	.cfi_endproc
                                        # -- End function
	.text
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -144
	.cfi_def_cfa_offset 144
	sw	ra, 140(sp)
	sw	s0, 136(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 144
	.cfi_def_cfa s0, 0
	mv	a0, zero
	sw	a0, -12(s0)
	sw	a0, -100(s0)
	call	_Z14initMemManagerv
	lui	a0, %hi(.L.str)
	addi	a1, a0, %lo(.L.str)
	addi	a0, s0, -24
	sw	a0, -104(s0)
	call	_ZN6stringC2IDiEEPKT_
	lui	a0, %hi(_ZL4cout)
	addi	a0, a0, %lo(_ZL4cout)
	sw	a0, -108(s0)
	lw	a1, -104(s0)
	call	_ZlsR13TextOutStreamRK6string
	lui	a1, %hi(.L.str.1)
	addi	a1, a1, %lo(.L.str.1)
	addi	a2, s0, -40
	sw	a0, -112(s0)
	mv	a0, a2
	sw	a2, -116(s0)
	call	_ZN6stringC2IcEEPKT_
	lui	a0, %hi(.L.str.2)
	addi	a1, a0, %lo(.L.str.2)
	addi	a0, s0, -56
	sw	a0, -120(s0)
	call	_ZN6stringC2IDiEEPKT_
	addi	a0, zero, 120
	sw	a0, -60(s0)
	addi	a0, zero, 9
	sw	a0, -64(s0)
	lw	a0, -108(s0)
	lw	a1, -116(s0)
	call	_ZlsR13TextOutStreamRK6string
	addi	a1, zero, 32
	call	_ZlsR13TextOutStreamc
	lw	a1, -120(s0)
	call	_ZlsR13TextOutStreamRK6string
	lui	a1, %hi(.L.str.3)
	addi	a1, a1, %lo(.L.str.3)
	call	_ZlsR13TextOutStreamPKc
	lw	a1, -60(s0)
	lw	a2, -64(s0)
	sw	a0, -124(s0)
	mv	a0, a1
	mv	a1, a2
	call	__umodsi3
	lw	a1, -108(s0)
	sw	a0, -128(s0)
	mv	a0, a1
	lw	a1, -128(s0)
	call	_ZlsR13TextOutStreamj
	addi	a1, zero, 10
	call	_ZlsR13TextOutStreamc
	lw	a1, -100(s0)
	sw	a0, -132(s0)
	mv	a0, a1
	lw	s0, 136(sp)
	lw	ra, 140(sp)
	addi	sp, sp, 144
	ret
.Lfunc_end34:
	.size	main, .Lfunc_end34-main
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN6stringC2IDiEEPKT_,"axG",@progbits,_ZN6stringC2IDiEEPKT_,comdat
	.weak	_ZN6stringC2IDiEEPKT_   # -- Begin function _ZN6stringC2IDiEEPKT_
	.p2align	2
	.type	_ZN6stringC2IDiEEPKT_,@function
_ZN6stringC2IDiEEPKT_:                  # @_ZN6stringC2IDiEEPKT_
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	mv	a1, zero
	sw	a0, -24(s0)
	sw	a1, -28(s0)
	lw	a2, -28(s0)
	call	_ZN6vectorIjEC2Ejj
	j	.LBB35_1
.LBB35_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	lw	a0, 0(a0)
	mv	a1, zero
	beq	a0, a1, .LBB35_3
	j	.LBB35_2
.LBB35_2:                               #   in Loop: Header=BB35_1 Depth=1
	lw	a0, -16(s0)
	lw	a0, 0(a0)
	sw	a0, -20(s0)
	addi	a1, s0, -20
	lw	a0, -24(s0)
	call	_ZN6vectorIjE9push_backERKj
	lw	a0, -16(s0)
	addi	a0, a0, 4
	sw	a0, -16(s0)
	j	.LBB35_1
.LBB35_3:
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end35:
	.size	_ZN6stringC2IDiEEPKT_, .Lfunc_end35-_ZN6stringC2IDiEEPKT_
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN6stringC2IcEEPKT_,"axG",@progbits,_ZN6stringC2IcEEPKT_,comdat
	.weak	_ZN6stringC2IcEEPKT_    # -- Begin function _ZN6stringC2IcEEPKT_
	.p2align	2
	.type	_ZN6stringC2IcEEPKT_,@function
_ZN6stringC2IcEEPKT_:                   # @_ZN6stringC2IcEEPKT_
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	mv	a1, zero
	sw	a0, -24(s0)
	sw	a1, -28(s0)
	lw	a2, -28(s0)
	call	_ZN6vectorIjEC2Ejj
	j	.LBB36_1
.LBB36_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	lbu	a0, 0(a0)
	mv	a1, zero
	beq	a0, a1, .LBB36_3
	j	.LBB36_2
.LBB36_2:                               #   in Loop: Header=BB36_1 Depth=1
	lw	a0, -16(s0)
	lbu	a0, 0(a0)
	sw	a0, -20(s0)
	addi	a1, s0, -20
	lw	a0, -24(s0)
	call	_ZN6vectorIjE9push_backERKj
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB36_1
.LBB36_3:
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end36:
	.size	_ZN6stringC2IcEEPKT_, .Lfunc_end36-_ZN6stringC2IcEEPKT_
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN6vectorIjEC2Ejj,"axG",@progbits,_ZN6vectorIjEC2Ejj,comdat
	.weak	_ZN6vectorIjEC2Ejj      # -- Begin function _ZN6vectorIjEC2Ejj
	.p2align	2
	.type	_ZN6vectorIjEC2Ejj,@function
_ZN6vectorIjEC2Ejj:                     # @_ZN6vectorIjEC2Ejj
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
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
.Lfunc_end37:
	.size	_ZN6vectorIjEC2Ejj, .Lfunc_end37-_ZN6vectorIjEC2Ejj
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN6vectorIjE6resizeEjj,"axG",@progbits,_ZN6vectorIjE6resizeEjj,comdat
	.weak	_ZN6vectorIjE6resizeEjj # -- Begin function _ZN6vectorIjE6resizeEjj
	.p2align	2
	.type	_ZN6vectorIjE6resizeEjj,@function
_ZN6vectorIjE6resizeEjj:                # @_ZN6vectorIjE6resizeEjj
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lw	a2, 0(a0)
	sw	a0, -24(s0)
	bgeu	a2, a1, .LBB38_8
	j	.LBB38_1
.LBB38_1:
	j	.LBB38_2
.LBB38_2:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	lw	a2, 4(a1)
	bgeu	a2, a0, .LBB38_4
	j	.LBB38_3
.LBB38_3:                               #   in Loop: Header=BB38_2 Depth=1
	lw	a1, -16(s0)
	lw	a0, -24(s0)
	call	_ZN6vectorIjE7reserveEj
	j	.LBB38_2
.LBB38_4:
	j	.LBB38_5
.LBB38_5:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -24(s0)
	lw	a1, 0(a0)
	lw	a2, -16(s0)
	bgeu	a1, a2, .LBB38_7
	j	.LBB38_6
.LBB38_6:                               #   in Loop: Header=BB38_5 Depth=1
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
	j	.LBB38_5
.LBB38_7:
	j	.LBB38_9
.LBB38_8:
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	sw	a0, 0(a1)
	j	.LBB38_9
.LBB38_9:
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end38:
	.size	_ZN6vectorIjE6resizeEjj, .Lfunc_end38-_ZN6vectorIjE6resizeEjj
	.cfi_endproc
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
.Lfunc_end39:
	.size	_ZN17StandardOutStream9send_wordEj, .Lfunc_end39-_ZN17StandardOutStream9send_wordEj
                                        # -- End function
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

	.type	.L.str,@object          # @.str
	.section	.rodata.str4.4,"aMS",@progbits,4
	.p2align	2
.L.str:
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
	.word	33                      # 0x21
	.word	32                      # 0x20
	.word	128025                  # 0x1f419
	.word	10                      # 0xa
	.word	0                       # 0x0
	.size	.L.str, 64

	.type	.L.str.1,@object        # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"This is"
	.size	.L.str.1, 8

	.type	.L.str.2,@object        # @.str.2
	.section	.rodata.str4.4,"aMS",@progbits,4
	.p2align	2
.L.str.2:
	.word	110                     # 0x6e
	.word	111                     # 0x6f
	.word	116                     # 0x74
	.word	32                      # 0x20
	.word	116                     # 0x74
	.word	104                     # 0x68
	.word	101                     # 0x65
	.word	32                      # 0x20
	.word	100                     # 0x64
	.word	114                     # 0x72
	.word	111                     # 0x6f
	.word	105                     # 0x69
	.word	100                     # 0x64
	.word	115                     # 0x73
	.word	32                      # 0x20
	.word	121                     # 0x79
	.word	111                     # 0x6f
	.word	117                     # 0x75
	.word	32                      # 0x20
	.word	97                      # 0x61
	.word	114                     # 0x72
	.word	101                     # 0x65
	.word	32                      # 0x20
	.word	108                     # 0x6c
	.word	111                     # 0x6f
	.word	111                     # 0x6f
	.word	107                     # 0x6b
	.word	105                     # 0x69
	.word	110                     # 0x6e
	.word	103                     # 0x67
	.word	32                      # 0x20
	.word	102                     # 0x66
	.word	111                     # 0x6f
	.word	114                     # 0x72
	.word	32                      # 0x20
	.word	129302                  # 0x1f916
	.word	0                       # 0x0
	.size	.L.str.2, 148

	.type	.L.str.3,@object        # @.str.3
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.3:
	.asciz	"\n"
	.size	.L.str.3, 2

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
	.addrsig_sym _Z6malloci
	.addrsig_sym exit
	.addrsig_sym _Z4freePv
	.addrsig_sym _Znaj
	.addrsig_sym _Z14initMemManagerv
	.addrsig_sym _ZlsR13TextOutStreamc
	.addrsig_sym _ZlsR13TextOutStreamPKc
	.addrsig_sym _ZlsR13TextOutStreamj
	.addrsig_sym _ZN13TextOutStream11send_digitsEjj
	.addrsig_sym _ZN13TextOutStream11send_digitsEij
	.addrsig_sym _ZlsR13TextOutStreamRK6string
	.addrsig_sym _ZNK6vectorIjE5beginEv
	.addrsig_sym _ZNK6vectorIjE3endEv
	.addrsig_sym _ZNK6vectorIjE4sizeEv
	.addrsig_sym _ZNK6vectorIjE3getEj
	.addrsig_sym _ZN6vectorIjEixEi
	.addrsig_sym _Z6strlenPKc
	.addrsig_sym _Z10read_drivej
	.addrsig_sym _ZN6vectorIjE7reserveEj
	.addrsig_sym _ZN4File4sizeEv
	.addrsig_sym _ZN4File3eofEv
	.addrsig_sym _ZN6vectorIjE9push_backERKj
	.addrsig_sym _ZN6vectorIjE6resizeEjj
	.addrsig_sym __asm__freept
	.addrsig_sym nbBlocks
	.addrsig_sym allocPos
	.addrsig_sym allocSize
	.addrsig_sym _ZL8digits32
	.addrsig_sym _ZL4cout
	.addrsig_sym _ZTVN10__cxxabiv120__si_class_type_infoE
	.addrsig_sym _ZTS17StandardOutStream
	.addrsig_sym _ZTS13TextOutStream
	.addrsig_sym _ZTVN10__cxxabiv117__class_type_infoE
	.addrsig_sym _ZTS7OStream
	.addrsig_sym _ZTI7OStream
	.addrsig_sym _ZTI13TextOutStream
	.addrsig_sym _ZTI17StandardOutStream
