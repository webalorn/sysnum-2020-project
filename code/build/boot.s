	.text
	.file	"boot.cpp"
	.globl	_Z13print_messagePKDi   # -- Begin function _Z13print_messagePKDi
	.p2align	1
	.type	_Z13print_messagePKDi,@function
_Z13print_messagePKDi:                  # @_Z13print_messagePKDi
# %bb.0:
	lw	a1, 0(a0)
	beqz	a1, .LBB0_3
# %bb.1:
	addi	a0, a0, 4
	lui	a2, 655360
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	sw	a1, 4(a2)
	lw	a1, 0(a0)
	addi	a0, a0, 4
	bnez	a1, .LBB0_2
.LBB0_3:
	ret
.Lfunc_end0:
	.size	_Z13print_messagePKDi, .Lfunc_end0-_Z13print_messagePKDi
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
# %bb.0:
	lui	a0, 655360
	addi	a1, zero, 4
	sw	a1, 8(a0)
	lui	a1, 524288
	lw	a2, 4(a1)
	srli	a2, a2, 2
	beqz	a2, .LBB1_3
# %bb.1:
	addi	a3, zero, 8
.LBB1_2:                                # =>This Inner Loop Header: Depth=1
	sw	a3, 8(a0)
	lw	a4, 4(a1)
	sw	a4, -8(a3)
	addi	a2, a2, -1
	addi	a3, a3, 4
	bnez	a2, .LBB1_2
.LBB1_3:
	lui	a0, %hi(boot_message)
	lw	a1, %lo(boot_message)(a0)
	lw	a0, 0(a1)
	beqz	a0, .LBB1_6
# %bb.4:
	addi	a1, a1, 4
	lui	a2, 655360
.LBB1_5:                                # =>This Inner Loop Header: Depth=1
	sw	a0, 4(a2)
	lw	a0, 0(a1)
	addi	a1, a1, 4
	bnez	a0, .LBB1_5
.LBB1_6:
	#APP
	mv s2, a0
	
	#NO_APP
	#APP
	jalr zero
	
	#NO_APP
	#APP
	mv a0, a0
	
	#NO_APP
	beqz	a0, .LBB1_14
# %bb.7:
	lui	a1, %hi(error_msg)
	lw	a2, %lo(error_msg)(a1)
	lw	a1, 0(a2)
	beqz	a1, .LBB1_10
# %bb.8:
	addi	a2, a2, 4
	lui	a3, 655360
.LBB1_9:                                # =>This Inner Loop Header: Depth=1
	sw	a1, 4(a3)
	lw	a1, 0(a2)
	addi	a2, a2, 4
	bnez	a1, .LBB1_9
.LBB1_10:
	lui	a2, %hi(message_return)
	lw	a1, %lo(message_return)(a2)
	beqz	a1, .LBB1_13
# %bb.11:
	addi	a2, a2, %lo(message_return)
	addi	a2, a2, 4
	lui	a3, 655360
.LBB1_12:                               # =>This Inner Loop Header: Depth=1
	sw	a1, 4(a3)
	lw	a1, 0(a2)
	addi	a2, a2, 4
	bnez	a1, .LBB1_12
.LBB1_13:
	addi	a0, a0, 48
	lui	a1, 655360
	sw	a0, 4(a1)
	addi	a0, a1, 4
	addi	a1, zero, 10
	sw	a1, 0(a0)
	j	.LBB1_17
.LBB1_14:
	lui	a0, %hi(success_msg)
	lw	a1, %lo(success_msg)(a0)
	lw	a0, 0(a1)
	beqz	a0, .LBB1_17
# %bb.15:
	addi	a1, a1, 4
	lui	a2, 655360
.LBB1_16:                               # =>This Inner Loop Header: Depth=1
	sw	a0, 4(a2)
	lw	a0, 0(a1)
	addi	a1, a1, 4
	bnez	a0, .LBB1_16
.LBB1_17:
	lui	a0, 655360
	addi	a1, zero, 1
	sw	a1, 0(a0)
	mv	a0, zero
	ret
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str4.4,"aMS",@progbits,4
	.p2align	2
.L.str:
	.word	27                      # 0x1b
	.word	91                      # 0x5b
	.word	51                      # 0x33
	.word	52                      # 0x34
	.word	109                     # 0x6d
	.word	66                      # 0x42
	.word	111                     # 0x6f
	.word	111                     # 0x6f
	.word	116                     # 0x74
	.word	101                     # 0x65
	.word	100                     # 0x64
	.word	10                      # 0xa
	.word	27                      # 0x1b
	.word	91                      # 0x5b
	.word	48                      # 0x30
	.word	109                     # 0x6d
	.word	0                       # 0x0
	.size	.L.str, 68

	.type	boot_message,@object    # @boot_message
	.section	.sdata,"aw",@progbits
	.globl	boot_message
	.p2align	2
boot_message:
	.word	.L.str
	.size	boot_message, 4

	.type	.L.str.1,@object        # @.str.1
	.section	.rodata.str4.4,"aMS",@progbits,4
	.p2align	2
.L.str.1:
	.word	10                      # 0xa
	.word	27                      # 0x1b
	.word	91                      # 0x5b
	.word	51                      # 0x33
	.word	50                      # 0x32
	.word	109                     # 0x6d
	.word	79                      # 0x4f
	.word	75                      # 0x4b
	.word	27                      # 0x1b
	.word	91                      # 0x5b
	.word	48                      # 0x30
	.word	109                     # 0x6d
	.word	10                      # 0xa
	.word	0                       # 0x0
	.size	.L.str.1, 56

	.type	success_msg,@object     # @success_msg
	.section	.sdata,"aw",@progbits
	.globl	success_msg
	.p2align	2
success_msg:
	.word	.L.str.1
	.size	success_msg, 4

	.type	.L.str.2,@object        # @.str.2
	.section	.rodata.str4.4,"aMS",@progbits,4
	.p2align	2
.L.str.2:
	.word	10                      # 0xa
	.word	27                      # 0x1b
	.word	91                      # 0x5b
	.word	51                      # 0x33
	.word	49                      # 0x31
	.word	109                     # 0x6d
	.word	70                      # 0x46
	.word	97                      # 0x61
	.word	105                     # 0x69
	.word	108                     # 0x6c
	.word	101                     # 0x65
	.word	100                     # 0x64
	.word	27                      # 0x1b
	.word	91                      # 0x5b
	.word	48                      # 0x30
	.word	109                     # 0x6d
	.word	10                      # 0xa
	.word	0                       # 0x0
	.size	.L.str.2, 72

	.type	error_msg,@object       # @error_msg
	.section	.sdata,"aw",@progbits
	.globl	error_msg
	.p2align	2
error_msg:
	.word	.L.str.2
	.size	error_msg, 4

	.type	message_return,@object  # @message_return
	.data
	.globl	message_return
	.p2align	2
message_return:
	.word	45                      # 0x2d
	.word	62                      # 0x3e
	.word	32                      # 0x20
	.word	0                       # 0x0
	.word	0                       # 0x0
	.word	0                       # 0x0
	.size	message_return, 24

	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
