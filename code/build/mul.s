	.text
	.file	"mul.cpp"
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
	j	.LBB1_1
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -20(s0)
	lui	a1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(a1)
	bgeu	a0, a1, .LBB1_6
	j	.LBB1_2
.LBB1_2:                                #   in Loop: Header=BB1_1 Depth=1
	lui	a0, %hi(allocSize)
	lw	a0, %lo(allocSize)(a0)
	lw	a1, -20(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	lw	a1, -16(s0)
	blt	a0, a1, .LBB1_4
	j	.LBB1_3
.LBB1_3:
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
	j	.LBB1_9
.LBB1_4:                                #   in Loop: Header=BB1_1 Depth=1
	j	.LBB1_5
.LBB1_5:                                #   in Loop: Header=BB1_1 Depth=1
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB1_1
.LBB1_6:
	lui	a0, %hi(nbBlocks)
	lw	a0, %lo(nbBlocks)(a0)
	addi	a1, zero, 100
	bne	a0, a1, .LBB1_8
	j	.LBB1_7
.LBB1_7:
	addi	a0, zero, 29
	call	exit
	j	.LBB1_8
.LBB1_8:
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
	j	.LBB1_9
.LBB1_9:
	lw	a0, -12(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end1:
	.size	_Z6malloci, .Lfunc_end1-_Z6malloci
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
	j	.LBB2_1
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	lui	a1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(a1)
	bgeu	a0, a1, .LBB2_6
	j	.LBB2_2
.LBB2_2:                                #   in Loop: Header=BB2_1 Depth=1
	lui	a0, %hi(allocPos)
	lw	a0, %lo(allocPos)(a0)
	lw	a1, -16(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	lw	a1, -12(s0)
	bne	a0, a1, .LBB2_4
	j	.LBB2_3
.LBB2_3:
	lui	a0, %hi(allocSize)
	lw	a0, %lo(allocSize)(a0)
	lw	a1, -16(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a1, 0(a0)
	mv	a2, zero
	sub	a1, a2, a1
	sw	a1, 0(a0)
	j	.LBB2_7
.LBB2_4:                                #   in Loop: Header=BB2_1 Depth=1
	j	.LBB2_5
.LBB2_5:                                #   in Loop: Header=BB2_1 Depth=1
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB2_1
.LBB2_6:
	addi	a0, zero, 40
	call	exit
	j	.LBB2_7
.LBB2_7:
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end2:
	.size	_Z4freePv, .Lfunc_end2-_Z4freePv
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
.Lfunc_end3:
	.size	_Znwj, .Lfunc_end3-_Znwj
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
.Lfunc_end4:
	.size	_Znaj, .Lfunc_end4-_Znaj
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
.Lfunc_end5:
	.size	_ZdaPv, .Lfunc_end5-_ZdaPv
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
.Lfunc_end6:
	.size	_ZdlPv, .Lfunc_end6-_ZdlPv
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
.Lfunc_end7:
	.size	_Z14initMemManagerv, .Lfunc_end7-_Z14initMemManagerv
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
.Lfunc_end8:
	.size	_ZlsR13TextOutStreamc, .Lfunc_end8-_ZlsR13TextOutStreamc
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
	j	.LBB9_1
.LBB9_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	lw	a0, 0(a0)
	mv	a1, zero
	beq	a0, a1, .LBB9_3
	j	.LBB9_2
.LBB9_2:                                #   in Loop: Header=BB9_1 Depth=1
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lw	a1, 0(a1)
	lw	a2, 0(a0)
	lw	a2, 0(a2)
	jalr	a2
	lw	a0, -16(s0)
	addi	a0, a0, 4
	sw	a0, -16(s0)
	j	.LBB9_1
.LBB9_3:
	lw	a0, -12(s0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end9:
	.size	_ZlsR13TextOutStreamPKDi, .Lfunc_end9-_ZlsR13TextOutStreamPKDi
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
	j	.LBB10_1
.LBB10_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -16(s0)
	lbu	a0, 0(a0)
	mv	a1, zero
	beq	a0, a1, .LBB10_3
	j	.LBB10_2
.LBB10_2:                               #   in Loop: Header=BB10_1 Depth=1
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	lbu	a1, 0(a1)
	lw	a2, 0(a0)
	lw	a2, 0(a2)
	jalr	a2
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB10_1
.LBB10_3:
	lw	a0, -12(s0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end10:
	.size	_ZlsR13TextOutStreamPKc, .Lfunc_end10-_ZlsR13TextOutStreamPKc
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
.Lfunc_end11:
	.size	_ZlsR13TextOutStreamj, .Lfunc_end11-_ZlsR13TextOutStreamj
                                        # -- End function
	.section	.text._ZN13TextOutStream11send_digitsEjj,"axG",@progbits,_ZN13TextOutStream11send_digitsEjj,comdat
	.weak	_ZN13TextOutStream11send_digitsEjj # -- Begin function _ZN13TextOutStream11send_digitsEjj
	.p2align	2
	.type	_ZN13TextOutStream11send_digitsEjj,@function
_ZN13TextOutStream11send_digitsEjj:     # @_ZN13TextOutStream11send_digitsEjj
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
	mv	a2, zero
	sw	a0, -24(s0)
	bne	a1, a2, .LBB12_2
	j	.LBB12_1
.LBB12_1:
	lw	a0, -24(s0)
	lw	a1, 0(a0)
	lw	a1, 0(a1)
	addi	a2, zero, 48
	sw	a1, -28(s0)
	mv	a1, a2
	lw	a2, -28(s0)
	jalr	a2
	j	.LBB12_3
.LBB12_2:
	lw	a1, -16(s0)
	lw	a0, -24(s0)
	call	_ZN13TextOutStream12print_digitsEj
	j	.LBB12_3
.LBB12_3:
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end12:
	.size	_ZN13TextOutStream11send_digitsEjj, .Lfunc_end12-_ZN13TextOutStream11send_digitsEjj
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
.Lfunc_end13:
	.size	_ZlsR13TextOutStreami, .Lfunc_end13-_ZlsR13TextOutStreami
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
	blt	a2, a1, .LBB14_2
	j	.LBB14_1
.LBB14_1:
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
	j	.LBB14_2
.LBB14_2:
	lw	a1, -16(s0)
	addi	a2, zero, 10
	lw	a0, -24(s0)
	call	_ZN13TextOutStream11send_digitsEjj
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end14:
	.size	_ZN13TextOutStream11send_digitsEij, .Lfunc_end14-_ZN13TextOutStream11send_digitsEij
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
.Lfunc_end15:
	.size	_ZlsR13TextOutStreamDi, .Lfunc_end15-_ZlsR13TextOutStreamDi
                                        # -- End function
	.globl	_Z11show_resultii       # -- Begin function _Z11show_resultii
	.p2align	2
	.type	_Z11show_resultii,@function
_Z11show_resultii:                      # @_Z11show_resultii
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a1, -12(s0)
	lui	a0, %hi(_ZL4cout)
	addi	a0, a0, %lo(_ZL4cout)
	call	_ZlsR13TextOutStreami
	addi	a1, zero, 42
	call	_ZlsR13TextOutStreamc
	lw	a1, -16(s0)
	call	_ZlsR13TextOutStreami
	lui	a1, %hi(.L.str)
	addi	a1, a1, %lo(.L.str)
	call	_ZlsR13TextOutStreamPKc
	lw	a1, -12(s0)
	lw	a2, -16(s0)
	mul	a1, a1, a2
	call	_ZlsR13TextOutStreami
	lui	a1, %hi(.L.str.1)
	addi	a1, a1, %lo(.L.str.1)
	call	_ZlsR13TextOutStreamPKc
	lw	a1, -16(s0)
	mv	a2, zero
	beq	a1, a2, .LBB16_2
	j	.LBB16_1
.LBB16_1:
	lw	a1, -12(s0)
	lui	a0, %hi(_ZL4cout)
	addi	a0, a0, %lo(_ZL4cout)
	sw	a0, -20(s0)
	call	_ZlsR13TextOutStreami
	addi	a1, zero, 47
	call	_ZlsR13TextOutStreamc
	lw	a1, -16(s0)
	call	_ZlsR13TextOutStreami
	lui	a1, %hi(.L.str)
	addi	a1, a1, %lo(.L.str)
	sw	a1, -24(s0)
	call	_ZlsR13TextOutStreamPKc
	lw	a1, -12(s0)
	lw	a2, -16(s0)
	div	a1, a1, a2
	call	_ZlsR13TextOutStreami
	lui	a1, %hi(.L.str.1)
	addi	a1, a1, %lo(.L.str.1)
	sw	a1, -28(s0)
	call	_ZlsR13TextOutStreamPKc
	lw	a1, -12(s0)
	lw	a2, -20(s0)
	sw	a0, -32(s0)
	mv	a0, a2
	call	_ZlsR13TextOutStreami
	addi	a1, zero, 37
	call	_ZlsR13TextOutStreamc
	lw	a1, -16(s0)
	call	_ZlsR13TextOutStreami
	lw	a1, -24(s0)
	call	_ZlsR13TextOutStreamPKc
	lw	a1, -12(s0)
	lw	a2, -16(s0)
	rem	a1, a1, a2
	call	_ZlsR13TextOutStreami
	lw	a1, -28(s0)
	call	_ZlsR13TextOutStreamPKc
	j	.LBB16_2
.LBB16_2:
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end16:
	.size	_Z11show_resultii, .Lfunc_end16-_Z11show_resultii
                                        # -- End function
	.globl	_Z13show_result_ujj     # -- Begin function _Z13show_result_ujj
	.p2align	2
	.type	_Z13show_result_ujj,@function
_Z13show_result_ujj:                    # @_Z13show_result_ujj
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a1, -12(s0)
	lui	a0, %hi(_ZL4cout)
	addi	a0, a0, %lo(_ZL4cout)
	call	_ZlsR13TextOutStreamj
	addi	a1, zero, 42
	call	_ZlsR13TextOutStreamc
	lw	a1, -16(s0)
	call	_ZlsR13TextOutStreamj
	lui	a1, %hi(.L.str)
	addi	a1, a1, %lo(.L.str)
	call	_ZlsR13TextOutStreamPKc
	lw	a1, -12(s0)
	lw	a2, -16(s0)
	mul	a1, a1, a2
	call	_ZlsR13TextOutStreamj
	lui	a1, %hi(.L.str.1)
	addi	a1, a1, %lo(.L.str.1)
	call	_ZlsR13TextOutStreamPKc
	lw	a1, -16(s0)
	mv	a2, zero
	beq	a1, a2, .LBB17_2
	j	.LBB17_1
.LBB17_1:
	lw	a1, -12(s0)
	lui	a0, %hi(_ZL4cout)
	addi	a0, a0, %lo(_ZL4cout)
	sw	a0, -20(s0)
	call	_ZlsR13TextOutStreamj
	addi	a1, zero, 47
	call	_ZlsR13TextOutStreamc
	lw	a1, -16(s0)
	call	_ZlsR13TextOutStreamj
	lui	a1, %hi(.L.str)
	addi	a1, a1, %lo(.L.str)
	sw	a1, -24(s0)
	call	_ZlsR13TextOutStreamPKc
	lw	a1, -12(s0)
	lw	a2, -16(s0)
	divu	a1, a1, a2
	call	_ZlsR13TextOutStreamj
	lui	a1, %hi(.L.str.1)
	addi	a1, a1, %lo(.L.str.1)
	sw	a1, -28(s0)
	call	_ZlsR13TextOutStreamPKc
	lw	a1, -12(s0)
	lw	a2, -20(s0)
	sw	a0, -32(s0)
	mv	a0, a2
	call	_ZlsR13TextOutStreamj
	addi	a1, zero, 37
	call	_ZlsR13TextOutStreamc
	lw	a1, -16(s0)
	call	_ZlsR13TextOutStreamj
	lw	a1, -24(s0)
	call	_ZlsR13TextOutStreamPKc
	lw	a1, -12(s0)
	lw	a2, -16(s0)
	remu	a1, a1, a2
	call	_ZlsR13TextOutStreamj
	lw	a1, -28(s0)
	call	_ZlsR13TextOutStreamPKc
	j	.LBB17_2
.LBB17_2:
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end17:
	.size	_Z13show_result_ujj, .Lfunc_end17-_Z13show_result_ujj
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
	addi	a0, zero, 20
	addi	a1, zero, 5
	sw	a0, -12(s0)
	call	_Z13show_result_ujj
	addi	a0, zero, 6
	lw	a1, -12(s0)
	sw	a0, -16(s0)
	mv	a0, a1
	lw	a1, -16(s0)
	call	_Z11show_resultii
	addi	a0, zero, -20
	sw	a0, -20(s0)
	lw	a1, -16(s0)
	call	_Z11show_resultii
	addi	a0, zero, -6
	lw	a1, -12(s0)
	sw	a0, -24(s0)
	mv	a0, a1
	lw	a1, -24(s0)
	call	_Z11show_resultii
	lw	a0, -20(s0)
	lw	a1, -24(s0)
	call	_Z11show_resultii
	lw	a0, -20(s0)
	lw	a1, -24(s0)
	call	_Z13show_result_ujj
	mv	a0, zero
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end18:
	.size	main, .Lfunc_end18-main
                                        # -- End function
	.section	.text._ZN13TextOutStream12print_digitsEj,"axG",@progbits,_ZN13TextOutStream12print_digitsEj,comdat
	.weak	_ZN13TextOutStream12print_digitsEj # -- Begin function _ZN13TextOutStream12print_digitsEj
	.p2align	2
	.type	_ZN13TextOutStream12print_digitsEj,@function
_ZN13TextOutStream12print_digitsEj:     # @_ZN13TextOutStream12print_digitsEj
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	mv	a2, zero
	sw	a0, -20(s0)
	beq	a1, a2, .LBB19_2
	j	.LBB19_1
.LBB19_1:
	lw	a0, -16(s0)
	lui	a1, 838861
	addi	a1, a1, -819
	mulhu	a0, a0, a1
	srli	a0, a0, 3
	lw	a2, -20(s0)
	sw	a0, -24(s0)
	mv	a0, a2
	lw	a3, -24(s0)
	sw	a1, -28(s0)
	mv	a1, a3
	call	_ZN13TextOutStream12print_digitsEj
	lw	a0, -16(s0)
	lw	a1, -28(s0)
	mulhu	a2, a0, a1
	srli	a2, a2, 3
	addi	a3, zero, 10
	mul	a2, a2, a3
	sub	a0, a0, a2
	ori	a1, a0, 48
	lw	a0, -20(s0)
	lw	a2, 0(a0)
	lw	a2, 0(a2)
	jalr	a2
	j	.LBB19_2
.LBB19_2:
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end19:
	.size	_ZN13TextOutStream12print_digitsEj, .Lfunc_end19-_ZN13TextOutStream12print_digitsEj
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
.Lfunc_end20:
	.size	_ZN17StandardOutStream9send_wordEj, .Lfunc_end20-_ZN17StandardOutStream9send_wordEj
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
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	" = "
	.size	.L.str, 4

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"\n"
	.size	.L.str.1, 2

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
	.addrsig_sym _ZlsR13TextOutStreamc
	.addrsig_sym _ZlsR13TextOutStreamPKc
	.addrsig_sym _ZlsR13TextOutStreamj
	.addrsig_sym _ZN13TextOutStream11send_digitsEjj
	.addrsig_sym _ZlsR13TextOutStreami
	.addrsig_sym _ZN13TextOutStream11send_digitsEij
	.addrsig_sym _Z11show_resultii
	.addrsig_sym _Z13show_result_ujj
	.addrsig_sym _ZN13TextOutStream12print_digitsEj
	.addrsig_sym __asm__freept
	.addrsig_sym nbBlocks
	.addrsig_sym allocPos
	.addrsig_sym allocSize
	.addrsig_sym _ZL4cout
	.addrsig_sym _ZTVN10__cxxabiv120__si_class_type_infoE
	.addrsig_sym _ZTS17StandardOutStream
	.addrsig_sym _ZTS13TextOutStream
	.addrsig_sym _ZTVN10__cxxabiv117__class_type_infoE
	.addrsig_sym _ZTS7OStream
	.addrsig_sym _ZTI7OStream
	.addrsig_sym _ZTI13TextOutStream
	.addrsig_sym _ZTI17StandardOutStream
