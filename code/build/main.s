	.text
	.file	"main.cpp"
	.globl	_Z6malloci              # -- Begin function _Z6malloci
	.p2align	1
	.type	_Z6malloci,@function
_Z6malloci:                             # @_Z6malloci
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	lui	s1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(s1)
	add	s0, zero, a0
	beqz	a1, .LBB0_6
# %bb.1:
	lui	a0, %hi(allocSize)
	lw	a2, %lo(allocSize)(a0)
	mv	a0, zero
	mv	a3, zero
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	add	a4, a2, a0
	lw	a5, 0(a4)
	bge	a5, s0, .LBB0_8
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	addi	a3, a3, 1
	addi	a0, a0, 4
	bltu	a3, a1, .LBB0_2
# %bb.4:
	addi	a0, zero, 100
	bne	a1, a0, .LBB0_7
# %bb.5:
	addi	a0, zero, 29
	call	exit
	lui	a0, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(a0)
	j	.LBB0_7
.LBB0_6:
	mv	a1, zero
.LBB0_7:
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
	j	.LBB0_9
.LBB0_8:
	neg	a1, a5
	sw	a1, 0(a4)
	lui	a1, %hi(allocPos)
	lw	a1, %lo(allocPos)(a1)
	add	a0, a0, a1
	lw	a0, 0(a0)
.LBB0_9:
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	_Z6malloci, .Lfunc_end0-_Z6malloci
	.cfi_endproc
                                        # -- End function
	.globl	_Z4freePv               # -- Begin function _Z4freePv
	.p2align	1
	.type	_Z4freePv,@function
_Z4freePv:                              # @_Z4freePv
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	lui	a1, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(a1)
	beqz	a1, .LBB1_4
# %bb.1:
	lui	a2, %hi(allocPos)
	lw	a3, %lo(allocPos)(a2)
	mv	a2, zero
	mv	a4, zero
.LBB1_2:                                # =>This Inner Loop Header: Depth=1
	add	a5, a3, a2
	lw	a5, 0(a5)
	beq	a5, a0, .LBB1_5
# %bb.3:                                #   in Loop: Header=BB1_2 Depth=1
	addi	a4, a4, 1
	addi	a2, a2, 4
	bltu	a4, a1, .LBB1_2
.LBB1_4:
	addi	a0, zero, 40
	call	exit
	j	.LBB1_6
.LBB1_5:
	lui	a0, %hi(allocSize)
	lw	a0, %lo(allocSize)(a0)
	add	a0, a0, a2
	lw	a1, 0(a0)
	neg	a1, a1
	sw	a1, 0(a0)
.LBB1_6:
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end1:
	.size	_Z4freePv, .Lfunc_end1-_Z4freePv
	.cfi_endproc
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
	addi	a2, a1, 400
	lui	a3, %hi(allocSize)
	sw	a2, %lo(allocSize)(a3)
	addi	a1, a1, 800
	sw	a1, %lo(__asm__freept)(a0)
	ret
.Lfunc_end2:
	.size	_Z14initMemManagerv, .Lfunc_end2-_Z14initMemManagerv
                                        # -- End function
	.globl	_ZlsR13TextOutStreamc   # -- Begin function _ZlsR13TextOutStreamc
	.p2align	1
	.type	_ZlsR13TextOutStreamc,@function
_ZlsR13TextOutStreamc:                  # @_ZlsR13TextOutStreamc
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
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
.Lfunc_end3:
	.size	_ZlsR13TextOutStreamc, .Lfunc_end3-_ZlsR13TextOutStreamc
	.cfi_endproc
                                        # -- End function
	.globl	_ZlsR13TextOutStreamPKc # -- Begin function _ZlsR13TextOutStreamPKc
	.p2align	1
	.type	_ZlsR13TextOutStreamPKc,@function
_ZlsR13TextOutStreamPKc:                # @_ZlsR13TextOutStreamPKc
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	lbu	a2, 0(a1)
	add	s0, zero, a0
	beqz	a2, .LBB4_3
# %bb.1:
	addi	s1, a1, 1
.LBB4_2:                                # =>This Inner Loop Header: Depth=1
	lw	a0, 0(s0)
	lw	a3, 0(a0)
	andi	a1, a2, 255
	add	a0, zero, s0
	jalr	a3
	lbu	a2, 0(s1)
	addi	s1, s1, 1
	bnez	a2, .LBB4_2
.LBB4_3:
	add	a0, zero, s0
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end4:
	.size	_ZlsR13TextOutStreamPKc, .Lfunc_end4-_ZlsR13TextOutStreamPKc
	.cfi_endproc
                                        # -- End function
	.globl	_ZlsR13TextOutStreamj   # -- Begin function _ZlsR13TextOutStreamj
	.p2align	1
	.type	_ZlsR13TextOutStreamj,@function
_ZlsR13TextOutStreamj:                  # @_ZlsR13TextOutStreamj
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	sw	s4, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	.cfi_offset s2, -16
	.cfi_offset s3, -20
	.cfi_offset s4, -24
	add	s2, zero, a0
	beqz	a1, .LBB5_8
# %bb.1:
	add	s1, zero, a1
	mv	s0, zero
	mv	a0, zero
	lui	a1, %hi(_ZL8digits32)
	addi	s3, a1, %lo(_ZL8digits32)
	addi	s4, zero, 10
	j	.LBB5_4
.LBB5_2:                                #   in Loop: Header=BB5_4 Depth=1
	lw	a0, 0(s2)
	lw	a2, 0(a0)
	addi	a1, a1, 48
	add	a0, zero, s2
	jalr	a2
	addi	a0, zero, 1
.LBB5_3:                                #   in Loop: Header=BB5_4 Depth=1
	addi	s0, s0, 1
	beq	s0, s4, .LBB5_9
.LBB5_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_7 Depth 2
	slli	a1, s0, 2
	add	a1, a1, s3
	lw	a2, 0(a1)
	bgeu	s1, a2, .LBB5_6
# %bb.5:                                #   in Loop: Header=BB5_4 Depth=1
	andi	a2, a0, 1
	mv	a1, zero
	mv	a0, zero
	bnez	a2, .LBB5_2
	j	.LBB5_3
.LBB5_6:                                #   in Loop: Header=BB5_4 Depth=1
	mv	a1, zero
.LBB5_7:                                #   Parent Loop BB5_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sub	s1, s1, a2
	addi	a1, a1, 1
	bgeu	s1, a2, .LBB5_7
	j	.LBB5_2
.LBB5_8:
	lw	a0, 0(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 48
	add	a0, zero, s2
	jalr	a2
.LBB5_9:
	add	a0, zero, s2
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end5:
	.size	_ZlsR13TextOutStreamj, .Lfunc_end5-_ZlsR13TextOutStreamj
	.cfi_endproc
                                        # -- End function
	.globl	_ZlsR13TextOutStreami   # -- Begin function _ZlsR13TextOutStreami
	.p2align	1
	.type	_ZlsR13TextOutStreami,@function
_ZlsR13TextOutStreami:                  # @_ZlsR13TextOutStreami
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	sw	s4, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	.cfi_offset s2, -16
	.cfi_offset s3, -20
	.cfi_offset s4, -24
	addi	a2, zero, -1
	add	s1, zero, a1
	add	s2, zero, a0
	bge	a2, a1, .LBB6_4
# %bb.1:
	bnez	s1, .LBB6_5
# %bb.2:
	lw	a0, 0(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 48
	add	a0, zero, s2
	jalr	a2
.LBB6_3:
	add	a0, zero, s2
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.LBB6_4:
	lw	a0, 0(s2)
	lw	a2, 0(a0)
	neg	s1, s1
	addi	a1, zero, 45
	add	a0, zero, s2
	jalr	a2
.LBB6_5:
	mv	s0, zero
	mv	a0, zero
	lui	a1, %hi(_ZL8digits32)
	addi	s3, a1, %lo(_ZL8digits32)
	addi	s4, zero, 10
	j	.LBB6_8
.LBB6_6:                                #   in Loop: Header=BB6_8 Depth=1
	lw	a0, 0(s2)
	lw	a2, 0(a0)
	addi	a1, a1, 48
	add	a0, zero, s2
	jalr	a2
	addi	a0, zero, 1
.LBB6_7:                                #   in Loop: Header=BB6_8 Depth=1
	addi	s0, s0, 1
	beq	s0, s4, .LBB6_3
.LBB6_8:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_11 Depth 2
	slli	a1, s0, 2
	add	a1, a1, s3
	lw	a2, 0(a1)
	bgeu	s1, a2, .LBB6_10
# %bb.9:                                #   in Loop: Header=BB6_8 Depth=1
	andi	a2, a0, 1
	mv	a1, zero
	mv	a0, zero
	bnez	a2, .LBB6_6
	j	.LBB6_7
.LBB6_10:                               #   in Loop: Header=BB6_8 Depth=1
	mv	a1, zero
.LBB6_11:                               #   Parent Loop BB6_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sub	s1, s1, a2
	addi	a1, a1, 1
	bgeu	s1, a2, .LBB6_11
	j	.LBB6_6
.Lfunc_end6:
	.size	_ZlsR13TextOutStreami, .Lfunc_end6-_ZlsR13TextOutStreami
	.cfi_endproc
                                        # -- End function
	.globl	_ZlsR13TextOutStreamRK6string # -- Begin function _ZlsR13TextOutStreamRK6string
	.p2align	1
	.type	_ZlsR13TextOutStreamRK6string,@function
_ZlsR13TextOutStreamRK6string:          # @_ZlsR13TextOutStreamRK6string
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	sw	s2, 0(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	.cfi_offset s2, -16
	lw	a2, 0(a1)
	add	s2, zero, a0
	beqz	a2, .LBB7_3
# %bb.1:
	lw	s1, 8(a1)
	slli	s0, a2, 2
.LBB7_2:                                # =>This Inner Loop Header: Depth=1
	lw	a0, 0(s2)
	lw	a1, 0(s1)
	lw	a2, 0(a0)
	add	a0, zero, s2
	jalr	a2
	addi	s0, s0, -4
	addi	s1, s1, 4
	bnez	s0, .LBB7_2
.LBB7_3:
	add	a0, zero, s2
	lw	s2, 0(sp)
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end7:
	.size	_ZlsR13TextOutStreamRK6string, .Lfunc_end7-_ZlsR13TextOutStreamRK6string
	.cfi_endproc
                                        # -- End function
	.globl	_ZplRK6stringS1_        # -- Begin function _ZplRK6stringS1_
	.p2align	1
	.type	_ZplRK6stringS1_,@function
_ZplRK6stringS1_:                       # @_ZplRK6stringS1_
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	sw	s4, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	.cfi_offset s2, -16
	.cfi_offset s3, -20
	.cfi_offset s4, -24
	add	s2, zero, a2
	add	s0, zero, a1
	lw	s4, 0(a1)
	lw	s1, 0(a2)
	add	s3, zero, a0
	add	a1, s1, s4
	mv	a2, zero
	call	_ZN6vectorIjEC2Ejj
	beqz	s4, .LBB8_3
# %bb.1:
	lw	a0, 8(s0)
	lw	a1, 8(s3)
	add	a2, zero, s4
.LBB8_2:                                # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a0)
	sw	a3, 0(a1)
	addi	a2, a2, -1
	addi	a1, a1, 4
	addi	a0, a0, 4
	bnez	a2, .LBB8_2
.LBB8_3:
	beqz	s1, .LBB8_6
# %bb.4:
	lw	a1, 8(s3)
	lw	a0, 8(s2)
	slli	a2, s4, 2
	add	a1, a1, a2
.LBB8_5:                                # =>This Inner Loop Header: Depth=1
	lw	a2, 0(a0)
	sw	a2, 0(a1)
	addi	s1, s1, -1
	addi	a0, a0, 4
	addi	a1, a1, 4
	bnez	s1, .LBB8_5
.LBB8_6:
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end8:
	.size	_ZplRK6stringS1_, .Lfunc_end8-_ZplRK6stringS1_
	.cfi_endproc
                                        # -- End function
	.globl	_Z6hdd_cdjPKc           # -- Begin function _Z6hdd_cdjPKc
	.p2align	1
	.type	_Z6hdd_cdjPKc,@function
_Z6hdd_cdjPKc:                          # @_Z6hdd_cdjPKc
# %bb.0:
	lbu	a2, 0(a1)
	beqz	a2, .LBB9_3
# %bb.1:
	mv	t2, zero
	addi	a2, a1, 1
.LBB9_2:                                # =>This Inner Loop Header: Depth=1
	add	a3, a2, t2
	lbu	a3, 0(a3)
	addi	t2, t2, 1
	bnez	a3, .LBB9_2
	j	.LBB9_4
.LBB9_3:
	mv	t2, zero
.LBB9_4:
	addi	a2, a0, 4
	lui	a7, 655360
	sw	a2, 8(a7)
	lui	t0, 524288
	lw	a6, 4(t0)
	beqz	a6, .LBB9_12
# %bb.5:
	mv	t1, zero
	addi	a3, a0, 8
.LBB9_6:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_10 Depth 2
	sw	a3, 8(a7)
	lw	a0, 4(t0)
	addi	a2, a3, 4
	sw	a2, 8(a7)
	lw	a4, 4(t0)
	addi	a3, a3, 8
	xor	a2, t2, a4
	seqz	t3, a2
	add	a2, zero, a1
	bnez	a4, .LBB9_10
.LBB9_7:                                #   in Loop: Header=BB9_6 Depth=1
	bnez	t3, .LBB9_13
# %bb.8:                                #   in Loop: Header=BB9_6 Depth=1
	addi	t1, t1, 1
	bne	t1, a6, .LBB9_6
	j	.LBB9_12
.LBB9_9:                                #   in Loop: Header=BB9_10 Depth=2
	addi	a3, a3, 4
	addi	a4, a4, -1
	addi	a2, a2, 1
	beqz	a4, .LBB9_7
.LBB9_10:                               #   Parent Loop BB9_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	a5, t3, 1
	mv	t3, zero
	beqz	a5, .LBB9_9
# %bb.11:                               #   in Loop: Header=BB9_10 Depth=2
	sw	a3, 8(a7)
	lw	t3, 4(t0)
	lbu	a5, 0(a2)
	xor	a5, t3, a5
	seqz	t3, a5
	j	.LBB9_9
.LBB9_12:
	mv	a0, zero
.LBB9_13:
	ret
.Lfunc_end9:
	.size	_Z6hdd_cdjPKc, .Lfunc_end9-_Z6hdd_cdjPKc
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
.Lfunc_end10:
	.size	_Z8hdd_rootv, .Lfunc_end10-_Z8hdd_rootv
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
	bge	a3, a2, .LBB11_2
.LBB11_1:
	add	a0, zero, a1
	ret
.LBB11_2:
	addi	a2, zero, 224
	addi	a1, zero, 2
	bltu	a0, a2, .LBB11_1
# %bb.3:
	addi	a2, zero, 240
	addi	a1, zero, 3
	bltu	a0, a2, .LBB11_1
# %bb.4:
	addi	a1, zero, 4
	add	a0, zero, a1
	ret
.Lfunc_end11:
	.size	_Z19numberOfBytesInCharh, .Lfunc_end11-_Z19numberOfBytesInCharh
                                        # -- End function
	.globl	_Z9read_utf8R4File      # -- Begin function _Z9read_utf8R4File
	.p2align	1
	.type	_Z9read_utf8R4File,@function
_Z9read_utf8R4File:                     # @_Z9read_utf8R4File
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	sw	s4, 8(sp)
	sw	s5, 4(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	.cfi_offset s2, -16
	.cfi_offset s3, -20
	.cfi_offset s4, -24
	.cfi_offset s5, -28
	add	s0, zero, a1
	add	s2, zero, a0
	mv	a1, zero
	mv	a2, zero
	call	_ZN6vectorIjEC2Ejj
	lw	a0, 4(s0)
	lw	a1, 8(s0)
	sub	a0, a1, a0
	sltu	a2, a1, a0
	mv	a1, zero
	bnez	a2, .LBB12_2
# %bb.1:
	add	a1, zero, a0
.LBB12_2:
	add	a0, zero, s2
	call	_ZN6vectorIjE7reserveEj
	lw	a0, 4(s0)
	lw	a1, 8(s0)
	bgeu	a0, a1, .LBB12_16
# %bb.3:
	addi	s3, zero, 240
	addi	s4, zero, 224
	addi	s5, zero, -1
	j	.LBB12_6
.LBB12_4:                               #   in Loop: Header=BB12_6 Depth=1
	lw	a1, 8(s2)
	slli	a0, a0, 2
	add	a0, a0, a1
	sw	s1, 0(a0)
	lw	a0, 0(s2)
	addi	a0, a0, 1
	sw	a0, 0(s2)
.LBB12_5:                               #   in Loop: Header=BB12_6 Depth=1
	lw	a0, 4(s0)
	lw	a1, 8(s0)
	bgeu	a0, a1, .LBB12_16
.LBB12_6:                               # =>This Inner Loop Header: Depth=1
	lw	a0, 0(s0)
	lw	a1, 4(a0)
	add	a0, zero, s0
	jalr	a1
	add	s1, zero, a0
	bltu	a0, s3, .LBB12_8
# %bb.7:                                #   in Loop: Header=BB12_6 Depth=1
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
	j	.LBB12_12
.LBB12_8:                               #   in Loop: Header=BB12_6 Depth=1
	bltu	s1, s4, .LBB12_10
# %bb.9:                                #   in Loop: Header=BB12_6 Depth=1
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
	j	.LBB12_12
.LBB12_10:                              #   in Loop: Header=BB12_6 Depth=1
	slli	a0, s1, 24
	srai	a0, a0, 24
	blt	s5, a0, .LBB12_13
# %bb.11:                               #   in Loop: Header=BB12_6 Depth=1
	lw	a0, 0(s0)
	lw	a1, 4(a0)
	slli	a0, s1, 6
	andi	s1, a0, 448
.LBB12_12:                              #   in Loop: Header=BB12_6 Depth=1
	add	a0, zero, s0
	jalr	a1
	andi	a0, a0, 63
	or	s1, s1, a0
.LBB12_13:                              #   in Loop: Header=BB12_6 Depth=1
	beqz	s1, .LBB12_5
# %bb.14:                               #   in Loop: Header=BB12_6 Depth=1
	lw	a0, 0(s2)
	lw	a1, 4(s2)
	bltu	a0, a1, .LBB12_4
# %bb.15:                               #   in Loop: Header=BB12_6 Depth=1
	slli	a1, a1, 1
	add	a0, zero, s2
	call	_ZN6vectorIjE7reserveEj
	lw	a0, 0(s2)
	j	.LBB12_4
.LBB12_16:
	lw	s5, 4(sp)
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end12:
	.size	_Z9read_utf8R4File, .Lfunc_end12-_Z9read_utf8R4File
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN6vectorIjE7reserveEj,"axG",@progbits,_ZN6vectorIjE7reserveEj,comdat
	.weak	_ZN6vectorIjE7reserveEj # -- Begin function _ZN6vectorIjE7reserveEj
	.p2align	1
	.type	_ZN6vectorIjE7reserveEj,@function
_ZN6vectorIjE7reserveEj:                # @_ZN6vectorIjE7reserveEj
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	sw	s2, 0(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	.cfi_offset s2, -16
	add	s0, zero, a0
	lw	a0, 4(a0)
	bgeu	a0, a1, .LBB13_14
.LBB13_1:                               # =>This Inner Loop Header: Depth=1
	add	a2, zero, a0
	slli	a0, a0, 1
	bltu	a0, a1, .LBB13_1
# %bb.2:
	sw	a0, 4(s0)
	lui	s2, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(s2)
	slli	s1, a2, 3
	beqz	a1, .LBB13_8
# %bb.3:
	lui	a0, %hi(allocSize)
	lw	a2, %lo(allocSize)(a0)
	mv	a0, zero
	add	a3, zero, a1
.LBB13_4:                               # =>This Inner Loop Header: Depth=1
	add	a4, a2, a0
	lw	a5, 0(a4)
	bge	a5, s1, .LBB13_10
# %bb.5:                                #   in Loop: Header=BB13_4 Depth=1
	addi	a3, a3, -1
	addi	a0, a0, 4
	bnez	a3, .LBB13_4
# %bb.6:
	addi	a0, zero, 100
	bne	a1, a0, .LBB13_9
# %bb.7:
	addi	a0, zero, 29
	call	exit
	lui	a0, %hi(nbBlocks)
	lw	a1, %lo(nbBlocks)(a0)
	j	.LBB13_9
.LBB13_8:
	mv	a1, zero
.LBB13_9:
	lui	a2, %hi(__asm__freept)
	lui	a0, %hi(allocPos)
	lw	a3, %lo(allocPos)(a0)
	lw	a0, %lo(__asm__freept)(a2)
	slli	a1, a1, 2
	add	a3, a3, a1
	sw	a0, 0(a3)
	lui	a3, %hi(allocSize)
	lw	a3, %lo(allocSize)(a3)
	neg	a4, s1
	add	a1, a1, a3
	sw	a4, 0(a1)
	lw	a1, %lo(nbBlocks)(s2)
	lw	a3, %lo(__asm__freept)(a2)
	addi	a1, a1, 1
	sw	a1, %lo(nbBlocks)(s2)
	add	a1, a3, s1
	sw	a1, %lo(__asm__freept)(a2)
	lw	a1, 0(s0)
	bnez	a1, .LBB13_11
	j	.LBB13_13
.LBB13_10:
	neg	a1, a5
	sw	a1, 0(a4)
	lui	a1, %hi(allocPos)
	lw	a1, %lo(allocPos)(a1)
	add	a0, a0, a1
	lw	a0, 0(a0)
	lw	a1, 0(s0)
	beqz	a1, .LBB13_13
.LBB13_11:
	lw	a1, 8(s0)
	mv	a2, zero
	add	a3, zero, a0
.LBB13_12:                              # =>This Inner Loop Header: Depth=1
	lw	a4, 0(a1)
	sw	a4, 0(a3)
	lw	a4, 0(s0)
	addi	a2, a2, 1
	addi	a3, a3, 4
	addi	a1, a1, 4
	bltu	a2, a4, .LBB13_12
.LBB13_13:
	sw	a0, 8(s0)
.LBB13_14:
	lw	s2, 0(sp)
	lw	s1, 4(sp)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end13:
	.size	_ZN6vectorIjE7reserveEj, .Lfunc_end13-_ZN6vectorIjE7reserveEj
	.cfi_endproc
                                        # -- End function
	.text
	.globl	main                    # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -64
	.cfi_def_cfa_offset 64
	sw	ra, 60(sp)
	sw	s0, 56(sp)
	sw	s1, 52(sp)
	sw	s2, 48(sp)
	sw	s3, 44(sp)
	sw	s4, 40(sp)
	sw	s5, 36(sp)
	sw	s6, 32(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	.cfi_offset s2, -16
	.cfi_offset s3, -20
	.cfi_offset s4, -24
	.cfi_offset s5, -28
	.cfi_offset s6, -32
	lui	a0, %hi(__asm__freept)
	lw	a1, %lo(__asm__freept)(a0)
	lui	a2, %hi(allocPos)
	sw	a1, %lo(allocPos)(a2)
	addi	a2, a1, 400
	lui	a3, %hi(allocSize)
	sw	a2, %lo(allocSize)(a3)
	addi	a1, a1, 800
	sw	a1, %lo(__asm__freept)(a0)
	addi	s2, sp, 16
	add	a0, zero, s2
	mv	a1, zero
	mv	a2, zero
	call	_ZN6vectorIjEC2Ejj
	lw	a0, 16(sp)
	addi	s3, zero, 72
	lui	a1, %hi(.L.str+4)
	addi	s0, a1, %lo(.L.str+4)
	j	.LBB14_2
.LBB14_1:                               #   in Loop: Header=BB14_2 Depth=1
	lw	s1, 24(sp)
	slli	a0, a0, 2
	add	a0, a0, s1
	sw	s3, 0(a0)
	lw	a1, 16(sp)
	lw	s3, 0(s0)
	addi	a0, a1, 1
	sw	a0, 16(sp)
	addi	s0, s0, 4
	beqz	s3, .LBB14_4
.LBB14_2:                               # =>This Inner Loop Header: Depth=1
	lw	a1, 20(sp)
	bltu	a0, a1, .LBB14_1
# %bb.3:                                #   in Loop: Header=BB14_2 Depth=1
	slli	a1, a1, 1
	add	a0, zero, s2
	call	_ZN6vectorIjE7reserveEj
	lw	a0, 16(sp)
	j	.LBB14_1
.LBB14_4:
	beqz	a0, .LBB14_7
# %bb.5:
	slli	a0, a1, 2
	addi	s0, a0, 4
	lui	s3, %hi(_ZL4cout)
	addi	s2, s3, %lo(_ZL4cout)
.LBB14_6:                               # =>This Inner Loop Header: Depth=1
	lw	a0, %lo(_ZL4cout)(s3)
	lw	a1, 0(s1)
	lw	a2, 0(a0)
	add	a0, zero, s2
	jalr	a2
	addi	s0, s0, -4
	addi	s1, s1, 4
	bnez	s0, .LBB14_6
.LBB14_7:
	lui	a0, 655360
	addi	a1, zero, 4
	sw	a1, 8(a0)
	lui	a0, 524288
	lw	s2, 4(a0)
	addi	s1, s2, 16
	beqz	s1, .LBB14_15
# %bb.8:
	mv	s0, zero
	mv	a0, zero
	lui	a1, %hi(_ZL8digits32)
	addi	s4, a1, %lo(_ZL8digits32)
	lui	s5, %hi(_ZL4cout)
	addi	s3, s5, %lo(_ZL4cout)
	addi	s6, zero, 10
	j	.LBB14_11
.LBB14_9:                               #   in Loop: Header=BB14_11 Depth=1
	lw	a0, %lo(_ZL4cout)(s5)
	lw	a2, 0(a0)
	addi	a1, a1, 48
	add	a0, zero, s3
	jalr	a2
	addi	a0, zero, 1
.LBB14_10:                              #   in Loop: Header=BB14_11 Depth=1
	addi	s0, s0, 1
	beq	s0, s6, .LBB14_16
.LBB14_11:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB14_14 Depth 2
	slli	a1, s0, 2
	add	a1, a1, s4
	lw	a2, 0(a1)
	bgeu	s1, a2, .LBB14_13
# %bb.12:                               #   in Loop: Header=BB14_11 Depth=1
	andi	a2, a0, 1
	mv	a1, zero
	mv	a0, zero
	bnez	a2, .LBB14_9
	j	.LBB14_10
.LBB14_13:                              #   in Loop: Header=BB14_11 Depth=1
	mv	a1, zero
.LBB14_14:                              #   Parent Loop BB14_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sub	s1, s1, a2
	addi	a1, a1, 1
	bgeu	s1, a2, .LBB14_14
	j	.LBB14_9
.LBB14_15:
	lui	a0, %hi(_ZL4cout)
	lw	a1, %lo(_ZL4cout)(a0)
	lw	a2, 0(a1)
	addi	a0, a0, %lo(_ZL4cout)
	addi	a1, zero, 48
	jalr	a2
.LBB14_16:
	lui	a0, %hi(_ZL4cout)
	lw	a1, %lo(_ZL4cout)(a0)
	lw	a2, 0(a1)
	addi	a0, a0, %lo(_ZL4cout)
	addi	a1, zero, 10
	jalr	a2
	addi	a6, s2, 20
	lui	t1, 655360
	sw	a6, 8(t1)
	lui	a2, 524288
	lw	t0, 4(a2)
	beqz	t0, .LBB14_25
# %bb.17:
	mv	a4, zero
	addi	a5, s2, 24
	lui	a0, %hi(.L.str.2)
	addi	a7, a0, %lo(.L.str.2)
.LBB14_18:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB14_21 Depth 2
	sw	a5, 8(t1)
	lw	s0, 4(a2)
	addi	a0, a5, 4
	sw	a0, 8(t1)
	lw	a0, 4(a2)
	addi	a5, a5, 8
	xori	a3, a0, 9
	seqz	s1, a3
	beqz	a0, .LBB14_23
# %bb.19:                               #   in Loop: Header=BB14_18 Depth=1
	add	a3, zero, a7
	j	.LBB14_21
.LBB14_20:                              #   in Loop: Header=BB14_21 Depth=2
	addi	a5, a5, 4
	addi	a0, a0, -1
	addi	a3, a3, 1
	beqz	a0, .LBB14_23
.LBB14_21:                              #   Parent Loop BB14_18 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	a1, s1, 1
	mv	s1, zero
	beqz	a1, .LBB14_20
# %bb.22:                               #   in Loop: Header=BB14_21 Depth=2
	sw	a5, 8(t1)
	lw	a1, 4(a2)
	lbu	s1, 0(a3)
	xor	a1, a1, s1
	seqz	s1, a1
	j	.LBB14_20
.LBB14_23:                              #   in Loop: Header=BB14_18 Depth=1
	bnez	s1, .LBB14_26
# %bb.24:                               #   in Loop: Header=BB14_18 Depth=1
	addi	a4, a4, 1
	bne	a4, t0, .LBB14_18
.LBB14_25:
	mv	s0, zero
.LBB14_26:
	sw	a6, 8(t1)
	lw	a7, 4(a2)
	beqz	a7, .LBB14_35
# %bb.27:
	mv	a1, zero
	addi	a2, s2, 24
	lui	t0, 655360
	lui	t1, 524288
	lui	a0, %hi(.L.str.3)
	addi	a6, a0, %lo(.L.str.3)
.LBB14_28:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB14_31 Depth 2
	sw	a2, 8(t0)
	lw	s1, 4(t1)
	addi	a0, a2, 4
	sw	a0, 8(t0)
	lw	a5, 4(t1)
	addi	a2, a2, 8
	xori	a0, a5, 3
	seqz	a0, a0
	beqz	a5, .LBB14_33
# %bb.29:                               #   in Loop: Header=BB14_28 Depth=1
	add	a3, zero, a6
	j	.LBB14_31
.LBB14_30:                              #   in Loop: Header=BB14_31 Depth=2
	addi	a2, a2, 4
	addi	a5, a5, -1
	addi	a3, a3, 1
	beqz	a5, .LBB14_33
.LBB14_31:                              #   Parent Loop BB14_28 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	a4, a0, 1
	mv	a0, zero
	beqz	a4, .LBB14_30
# %bb.32:                               #   in Loop: Header=BB14_31 Depth=2
	sw	a2, 8(t0)
	lw	a0, 4(t1)
	lbu	a4, 0(a3)
	xor	a0, a0, a4
	seqz	a0, a0
	j	.LBB14_30
.LBB14_33:                              #   in Loop: Header=BB14_28 Depth=1
	bnez	a0, .LBB14_36
# %bb.34:                               #   in Loop: Header=BB14_28 Depth=1
	addi	a1, a1, 1
	bne	a1, a7, .LBB14_28
.LBB14_35:
	mv	s1, zero
.LBB14_36:
	addi	a0, s1, 4
	lui	t0, 655360
	sw	a0, 8(t0)
	lui	t1, 524288
	lw	a7, 4(t1)
	beqz	a7, .LBB14_45
# %bb.37:
	mv	t2, zero
	addi	a5, s1, 8
	lui	a0, %hi(.L.str.4)
	addi	a6, a0, %lo(.L.str.4)
.LBB14_38:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB14_41 Depth 2
	sw	a5, 8(t0)
	lw	a1, 4(t1)
	addi	a0, a5, 4
	sw	a0, 8(t0)
	lw	a3, 4(t1)
	addi	a5, a5, 8
	xori	a0, a3, 11
	seqz	a0, a0
	beqz	a3, .LBB14_43
# %bb.39:                               #   in Loop: Header=BB14_38 Depth=1
	add	a2, zero, a6
	j	.LBB14_41
.LBB14_40:                              #   in Loop: Header=BB14_41 Depth=2
	addi	a5, a5, 4
	addi	a3, a3, -1
	addi	a2, a2, 1
	beqz	a3, .LBB14_43
.LBB14_41:                              #   Parent Loop BB14_38 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	a4, a0, 1
	mv	a0, zero
	beqz	a4, .LBB14_40
# %bb.42:                               #   in Loop: Header=BB14_41 Depth=2
	sw	a5, 8(t0)
	lw	a0, 4(t1)
	lbu	a4, 0(a2)
	xor	a0, a0, a4
	seqz	a0, a0
	j	.LBB14_40
.LBB14_43:                              #   in Loop: Header=BB14_38 Depth=1
	bnez	a0, .LBB14_46
# %bb.44:                               #   in Loop: Header=BB14_38 Depth=1
	addi	t2, t2, 1
	bne	t2, a7, .LBB14_38
.LBB14_45:
	mv	a1, zero
.LBB14_46:
	addi	s2, sp, 16
	add	a0, zero, s2
	call	_ZN4FileC2Ej
	lui	s4, %hi(_ZL4cout)
	lw	a0, %lo(_ZL4cout)(s4)
	lw	a2, 0(a0)
	addi	s3, s4, %lo(_ZL4cout)
	addi	a1, zero, 34
	add	a0, zero, s3
	jalr	a2
	add	a0, zero, sp
	add	a1, zero, s2
	call	_Z9read_utf8R4File
	lw	a0, 0(sp)
	beqz	a0, .LBB14_49
# %bb.47:
	lw	s2, 8(sp)
	slli	s5, a0, 2
.LBB14_48:                              # =>This Inner Loop Header: Depth=1
	lw	a0, %lo(_ZL4cout)(s4)
	lw	a1, 0(s2)
	lw	a2, 0(a0)
	add	a0, zero, s3
	jalr	a2
	addi	s5, s5, -4
	addi	s2, s2, 4
	bnez	s5, .LBB14_48
.LBB14_49:
	lw	a0, %lo(_ZL4cout)(s4)
	lw	a2, 0(a0)
	addi	a1, zero, 34
	add	a0, zero, s3
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s4)
	lw	a2, 0(a0)
	addi	a1, zero, 10
	addi	s4, zero, 10
	add	a0, zero, s3
	jalr	a2
	beqz	s0, .LBB14_57
# %bb.50:
	mv	s3, zero
	mv	a0, zero
	lui	a1, %hi(_ZL8digits32)
	addi	s5, a1, %lo(_ZL8digits32)
	lui	s6, %hi(_ZL4cout)
	addi	s2, s6, %lo(_ZL4cout)
	j	.LBB14_53
.LBB14_51:                              #   in Loop: Header=BB14_53 Depth=1
	lw	a0, %lo(_ZL4cout)(s6)
	lw	a2, 0(a0)
	addi	a1, a1, 48
	add	a0, zero, s2
	jalr	a2
	addi	a0, zero, 1
.LBB14_52:                              #   in Loop: Header=BB14_53 Depth=1
	addi	s3, s3, 1
	beq	s3, s4, .LBB14_58
.LBB14_53:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB14_56 Depth 2
	slli	a1, s3, 2
	add	a1, a1, s5
	lw	a2, 0(a1)
	bgeu	s0, a2, .LBB14_55
# %bb.54:                               #   in Loop: Header=BB14_53 Depth=1
	andi	a2, a0, 1
	mv	a1, zero
	mv	a0, zero
	bnez	a2, .LBB14_51
	j	.LBB14_52
.LBB14_55:                              #   in Loop: Header=BB14_53 Depth=1
	mv	a1, zero
.LBB14_56:                              #   Parent Loop BB14_53 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sub	s0, s0, a2
	addi	a1, a1, 1
	bgeu	s0, a2, .LBB14_56
	j	.LBB14_51
.LBB14_57:
	lui	a0, %hi(_ZL4cout)
	lw	a1, %lo(_ZL4cout)(a0)
	lw	a2, 0(a1)
	addi	a0, a0, %lo(_ZL4cout)
	addi	a1, zero, 48
	jalr	a2
.LBB14_58:
	lui	s2, %hi(_ZL4cout)
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	s4, s2, %lo(_ZL4cout)
	addi	a1, zero, 10
	addi	s3, zero, 10
	add	a0, zero, s4
	jalr	a2
	beqz	s1, .LBB14_66
# %bb.59:
	mv	s0, zero
	mv	a0, zero
	lui	a1, %hi(_ZL8digits32)
	addi	s5, a1, %lo(_ZL8digits32)
	j	.LBB14_62
.LBB14_60:                              #   in Loop: Header=BB14_62 Depth=1
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, a1, 48
	add	a0, zero, s4
	jalr	a2
	addi	a0, zero, 1
.LBB14_61:                              #   in Loop: Header=BB14_62 Depth=1
	addi	s0, s0, 1
	beq	s0, s3, .LBB14_67
.LBB14_62:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB14_65 Depth 2
	slli	a1, s0, 2
	add	a1, a1, s5
	lw	a2, 0(a1)
	bgeu	s1, a2, .LBB14_64
# %bb.63:                               #   in Loop: Header=BB14_62 Depth=1
	andi	a2, a0, 1
	mv	a1, zero
	mv	a0, zero
	bnez	a2, .LBB14_60
	j	.LBB14_61
.LBB14_64:                              #   in Loop: Header=BB14_62 Depth=1
	mv	a1, zero
.LBB14_65:                              #   Parent Loop BB14_62 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sub	s1, s1, a2
	addi	a1, a1, 1
	bgeu	s1, a2, .LBB14_65
	j	.LBB14_60
.LBB14_66:
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 48
	add	a0, zero, s4
	jalr	a2
.LBB14_67:
	lui	a0, %hi(_ZL4cout)
	lw	a1, %lo(_ZL4cout)(a0)
	lw	a2, 0(a1)
	addi	a0, a0, %lo(_ZL4cout)
	addi	a1, zero, 10
	jalr	a2
	mv	a0, zero
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
.Lfunc_end14:
	.size	main, .Lfunc_end14-main
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN4FileC2Ej,"axG",@progbits,_ZN4FileC2Ej,comdat
	.weak	_ZN4FileC2Ej            # -- Begin function _ZN4FileC2Ej
	.p2align	1
	.type	_ZN4FileC2Ej,@function
_ZN4FileC2Ej:                           # @_ZN4FileC2Ej
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	sw	s4, 8(sp)
	sw	s5, 4(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	.cfi_offset s2, -16
	.cfi_offset s3, -20
	.cfi_offset s4, -24
	.cfi_offset s5, -28
	lui	a2, %hi(_ZTV4File+8)
	addi	a2, a2, %lo(_ZTV4File+8)
	sw	a2, 0(a0)
	addi	a2, a1, 8
	sw	a2, 4(a0)
	addi	s0, a1, 4
	lui	s4, 655360
	sw	s0, 8(s4)
	lui	s1, 524288
	lw	a1, 4(s1)
	add	a1, a1, a2
	sw	a1, 8(a0)
	lui	s2, %hi(_ZL4cout)
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	s3, s2, %lo(_ZL4cout)
	addi	a1, zero, 83
	add	a0, zero, s3
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 105
	add	a0, zero, s3
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 122
	add	a0, zero, s3
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 101
	add	a0, zero, s3
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 32
	add	a0, zero, s3
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 61
	add	a0, zero, s3
	jalr	a2
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 32
	add	a0, zero, s3
	jalr	a2
	sw	s0, 8(s4)
	lw	s1, 4(s1)
	beqz	s1, .LBB15_8
# %bb.1:
	mv	s0, zero
	mv	a0, zero
	lui	a1, %hi(_ZL8digits32)
	addi	s4, a1, %lo(_ZL8digits32)
	addi	s5, zero, 10
	j	.LBB15_4
.LBB15_2:                               #   in Loop: Header=BB15_4 Depth=1
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, a1, 48
	add	a0, zero, s3
	jalr	a2
	addi	a0, zero, 1
.LBB15_3:                               #   in Loop: Header=BB15_4 Depth=1
	addi	s0, s0, 1
	beq	s0, s5, .LBB15_9
.LBB15_4:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB15_7 Depth 2
	slli	a1, s0, 2
	add	a1, a1, s4
	lw	a2, 0(a1)
	bgeu	s1, a2, .LBB15_6
# %bb.5:                                #   in Loop: Header=BB15_4 Depth=1
	andi	a2, a0, 1
	mv	a1, zero
	mv	a0, zero
	bnez	a2, .LBB15_2
	j	.LBB15_3
.LBB15_6:                               #   in Loop: Header=BB15_4 Depth=1
	mv	a1, zero
.LBB15_7:                               #   Parent Loop BB15_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sub	s1, s1, a2
	addi	a1, a1, 1
	bgeu	s1, a2, .LBB15_7
	j	.LBB15_2
.LBB15_8:
	lw	a0, %lo(_ZL4cout)(s2)
	lw	a2, 0(a0)
	addi	a1, zero, 48
	add	a0, zero, s3
	jalr	a2
.LBB15_9:
	lui	a0, %hi(_ZL4cout)
	lw	a1, %lo(_ZL4cout)(a0)
	lw	a5, 0(a1)
	addi	a0, a0, %lo(_ZL4cout)
	addi	a1, zero, 10
	lw	s5, 4(sp)
	lw	s4, 8(sp)
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	jr	a5
.Lfunc_end15:
	.size	_ZN4FileC2Ej, .Lfunc_end15-_ZN4FileC2Ej
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN6vectorIjEC2Ejj,"axG",@progbits,_ZN6vectorIjEC2Ejj,comdat
	.weak	_ZN6vectorIjEC2Ejj      # -- Begin function _ZN6vectorIjEC2Ejj
	.p2align	1
	.type	_ZN6vectorIjEC2Ejj,@function
_ZN6vectorIjEC2Ejj:                     # @_ZN6vectorIjEC2Ejj
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	sw	s1, 20(sp)
	sw	s2, 16(sp)
	sw	s3, 12(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	.cfi_offset s2, -16
	.cfi_offset s3, -20
	add	s0, zero, a0
	sw	zero, 0(a0)
	addi	a0, zero, 2
	sw	a0, 4(s0)
	lui	s3, %hi(nbBlocks)
	lw	a6, %lo(nbBlocks)(s3)
	add	s2, zero, a2
	add	s1, zero, a1
	beqz	a6, .LBB16_6
# %bb.1:
	lui	a0, %hi(allocSize)
	lw	a2, %lo(allocSize)(a0)
	mv	a1, zero
	addi	a3, zero, 7
	add	a4, zero, a6
.LBB16_2:                               # =>This Inner Loop Header: Depth=1
	add	a5, a2, a1
	lw	a0, 0(a5)
	blt	a3, a0, .LBB16_8
# %bb.3:                                #   in Loop: Header=BB16_2 Depth=1
	addi	a4, a4, -1
	addi	a1, a1, 4
	bnez	a4, .LBB16_2
# %bb.4:
	addi	a0, zero, 100
	bne	a6, a0, .LBB16_7
# %bb.5:
	addi	a0, zero, 29
	call	exit
	lui	a0, %hi(nbBlocks)
	lw	a6, %lo(nbBlocks)(a0)
	j	.LBB16_7
.LBB16_6:
	mv	a6, zero
.LBB16_7:
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
	j	.LBB16_9
.LBB16_8:
	neg	a0, a0
	sw	a0, 0(a5)
	lui	a0, %hi(allocPos)
	lw	a0, %lo(allocPos)(a0)
	add	a0, a0, a1
	lw	a1, 0(a0)
.LBB16_9:
	lw	a0, 0(s0)
	sw	a1, 8(s0)
	bgeu	a0, s1, .LBB16_16
# %bb.10:
	lw	a1, 4(s0)
	bgeu	a1, s1, .LBB16_13
.LBB16_11:                              # =>This Inner Loop Header: Depth=1
	add	a0, zero, s0
	add	a1, zero, s1
	call	_ZN6vectorIjE7reserveEj
	lw	a0, 4(s0)
	bltu	a0, s1, .LBB16_11
# %bb.12:
	lw	a0, 0(s0)
.LBB16_13:
	bgeu	a0, s1, .LBB16_17
# %bb.14:
	lw	a1, 8(s0)
.LBB16_15:                              # =>This Inner Loop Header: Depth=1
	slli	a0, a0, 2
	add	a0, a0, a1
	sw	s2, 0(a0)
	lw	a0, 0(s0)
	addi	a0, a0, 1
	sw	a0, 0(s0)
	bltu	a0, s1, .LBB16_15
	j	.LBB16_17
.LBB16_16:
	sw	s1, 0(s0)
.LBB16_17:
	addi	a1, zero, 2
	add	a0, zero, s0
	lw	s3, 12(sp)
	lw	s2, 16(sp)
	lw	s1, 20(sp)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	tail	_ZN6vectorIjE7reserveEj
.Lfunc_end16:
	.size	_ZN6vectorIjEC2Ejj, .Lfunc_end16-_ZN6vectorIjEC2Ejj
	.cfi_endproc
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
.Lfunc_end17:
	.size	_ZN17StandardOutStream9send_wordEj, .Lfunc_end17-_ZN17StandardOutStream9send_wordEj
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
.Lfunc_end18:
	.size	_ZN4File8readWordEv, .Lfunc_end18-_ZN4File8readWordEv
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
.Lfunc_end19:
	.size	_ZN4File8readByteEv, .Lfunc_end19-_ZN4File8readByteEv
                                        # -- End function
	.type	nbBlocks,@object        # @nbBlocks
	.section	.sbss,"aw",@nobits
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

	.type	__asm__freept,@object   # @__asm__freept
	.globl	__asm__freept
	.p2align	2
__asm__freept:
	.word	0                       # 0x0
	.size	__asm__freept, 4

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
	.word	32                      # 0x20
	.word	33                      # 0x21
	.word	32                      # 0x20
	.word	128025                  # 0x1f419
	.word	10                      # 0xa
	.word	0                       # 0x0
	.size	.L.str, 68

	.type	.L.str.2,@object        # @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"test1.txt"
	.size	.L.str.2, 10

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"sub"
	.size	.L.str.3, 4

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"general.txt"
	.size	.L.str.4, 12

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

	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _ZL4cout
	.addrsig_sym _ZTVN10__cxxabiv120__si_class_type_infoE
	.addrsig_sym _ZTS17StandardOutStream
	.addrsig_sym _ZTS13TextOutStream
	.addrsig_sym _ZTVN10__cxxabiv117__class_type_infoE
	.addrsig_sym _ZTS7OStream
	.addrsig_sym _ZTI7OStream
	.addrsig_sym _ZTI13TextOutStream
	.addrsig_sym _ZTI17StandardOutStream
	.addrsig_sym _ZTS4File
	.addrsig_sym _ZTS7IStream
	.addrsig_sym _ZTI7IStream
	.addrsig_sym _ZTI4File
