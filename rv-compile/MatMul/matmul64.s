	.file	"MatMul.c"
	.option nopic
	.attribute arch, "rv64i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata
	.align	3
.LC1:
	.string	"Multiplication of given two matrices is:\n"
	.globl	__muldi3
	.align	3
.LC2:
	.string	"%d\t"
	.align	3
.LC3:
	.string	"\n"
	.align	3
.LC4:
	.string	"Total time taken in microseconds %d:\n"
	.text
	.align	2
	.globl	mulMat
	.type	mulMat, @function
mulMat:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	sd	s1,72(sp)
	addi	s0,sp,96
	sd	a0,-88(s0)
	sd	a1,-96(s0)
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	printf
	call	clock
	sd	a0,-56(s0)
	sw	zero,-36(s0)
	j	.L2
.L7:
	sw	zero,-40(s0)
	j	.L3
.L6:
	lw	a5,-40(s0)
	lw	a4,-36(s0)
	slli	a4,a4,1
	add	a5,a4,a5
	slli	a5,a5,2
	addi	a4,s0,-32
	add	a5,a4,a5
	sw	zero,-48(a5)
	sw	zero,-44(s0)
	j	.L4
.L5:
	lw	a5,-40(s0)
	lw	a4,-36(s0)
	slli	a4,a4,1
	add	a5,a4,a5
	slli	a5,a5,2
	addi	a4,s0,-32
	add	a5,a4,a5
	lw	s1,-48(a5)
	lw	a5,-36(s0)
	slli	a5,a5,3
	ld	a4,-88(s0)
	add	a4,a4,a5
	lw	a5,-44(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a3,0(a5)
	lw	a5,-44(s0)
	slli	a5,a5,3
	ld	a4,-96(s0)
	add	a4,a4,a5
	lw	a5,-40(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	mv	a1,a5
	mv	a0,a3
	call	__muldi3
	mv	a5,a0
	sext.w	a5,a5
	addw	a5,s1,a5
	sext.w	a4,a5
	lw	a5,-40(s0)
	lw	a3,-36(s0)
	slli	a3,a3,1
	add	a5,a3,a5
	slli	a5,a5,2
	addi	a3,s0,-32
	add	a5,a3,a5
	sw	a4,-48(a5)
	lw	a5,-44(s0)
	addiw	a5,a5,1
	sw	a5,-44(s0)
.L4:
	lw	a5,-44(s0)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L5
	lw	a5,-40(s0)
	lw	a4,-36(s0)
	slli	a4,a4,1
	add	a5,a4,a5
	slli	a5,a5,2
	addi	a4,s0,-32
	add	a5,a4,a5
	lw	a5,-48(a5)
	mv	a1,a5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	printf
	lw	a5,-40(s0)
	addiw	a5,a5,1
	sw	a5,-40(s0)
.L3:
	lw	a5,-40(s0)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L6
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	lw	a5,-36(s0)
	addiw	a5,a5,1
	sw	a5,-36(s0)
.L2:
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L7
	call	clock
	sd	a0,-64(s0)
	ld	a4,-64(s0)
	ld	a5,-56(s0)
	sub	a5,a4,a5
	mv	a1,a5
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	printf
	nop
	ld	ra,88(sp)
	ld	s0,80(sp)
	ld	s1,72(sp)
	addi	sp,sp,96
	jr	ra
	.size	mulMat, .-mulMat
	.section	.rodata
	.align	3
.LC5:
	.string	"Start MatMulti\n"
	.align	3
.LC0:
	.word	1
	.word	1
	.word	2
	.word	2
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	printf
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	ld	a4,0(a5)
	sd	a4,-32(s0)
	ld	a5,8(a5)
	sd	a5,-24(s0)
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	ld	a4,0(a5)
	sd	a4,-48(s0)
	ld	a5,8(a5)
	sd	a5,-40(s0)
	addi	a4,s0,-48
	addi	a5,s0,-32
	mv	a1,a4
	mv	a0,a5
	call	mulMat
	li	a5,0
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	main, .-main
	.ident	"GCC: (SiFive GCC 8.3.0-2019.08.0) 8.3.0"
