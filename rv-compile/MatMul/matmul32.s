	.file	"MatMul.c"
	.option nopic
	.attribute arch, "rv32i2p1"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata
	.align	2
.LC1:
	.string	"Multiplication of given two matrices is:"
	.globl	__mulsi3
	.align	2
.LC2:
	.string	"%d\t"
	.align	2
.LC3:
	.string	"Total time taken in microseconds %d:\n"
	.text
	.align	2
	.globl	mulMat
	.type	mulMat, @function
mulMat:
	addi	sp,sp,-80
	sw	ra,76(sp)
	sw	s0,72(sp)
	sw	s1,68(sp)
	addi	s0,sp,80
	sw	a0,-68(s0)
	sw	a1,-72(s0)
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	call	clock
	sw	a0,-32(s0)
	sw	zero,-20(s0)
	j	.L2
.L7:
	sw	zero,-24(s0)
	j	.L3
.L6:
	lw	a5,-20(s0)
	slli	a4,a5,1
	lw	a5,-24(s0)
	add	a5,a4,a5
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	sw	zero,-36(a5)
	sw	zero,-28(s0)
	j	.L4
.L5:
	lw	a5,-20(s0)
	slli	a4,a5,1
	lw	a5,-24(s0)
	add	a5,a4,a5
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	s1,-36(a5)
	lw	a5,-20(s0)
	slli	a5,a5,3
	lw	a4,-68(s0)
	add	a4,a4,a5
	lw	a5,-28(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a3,0(a5)
	lw	a5,-28(s0)
	slli	a5,a5,3
	lw	a4,-72(s0)
	add	a4,a4,a5
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	mv	a1,a5
	mv	a0,a3
	call	__mulsi3
	mv	a5,a0
	add	a4,s1,a5
	lw	a5,-20(s0)
	slli	a3,a5,1
	lw	a5,-24(s0)
	add	a5,a3,a5
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	sw	a4,-36(a5)
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L4:
	lw	a4,-28(s0)
	li	a5,1
	ble	a4,a5,.L5
	lw	a5,-20(s0)
	slli	a4,a5,1
	lw	a5,-24(s0)
	add	a5,a4,a5
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-36(a5)
	mv	a1,a5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	printf
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L3:
	lw	a4,-24(s0)
	li	a5,1
	ble	a4,a5,.L6
	li	a0,10
	call	putchar
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a4,-20(s0)
	li	a5,1
	ble	a4,a5,.L7
	call	clock
	sw	a0,-36(s0)
	lw	a4,-36(s0)
	lw	a5,-32(s0)
	sub	a5,a4,a5
	mv	a1,a5
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	nop
	lw	ra,76(sp)
	lw	s0,72(sp)
	lw	s1,68(sp)
	addi	sp,sp,80
	jr	ra
	.size	mulMat, .-mulMat
	.section	.rodata
	.align	2
.LC4:
	.string	"Start MatMulti"
	.align	2
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
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	puts
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	lw	a2,0(a5)
	lw	a3,4(a5)
	lw	a4,8(a5)
	lw	a5,12(a5)
	sw	a2,-32(s0)
	sw	a3,-28(s0)
	sw	a4,-24(s0)
	sw	a5,-20(s0)
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	lw	a2,0(a5)
	lw	a3,4(a5)
	lw	a4,8(a5)
	lw	a5,12(a5)
	sw	a2,-48(s0)
	sw	a3,-44(s0)
	sw	a4,-40(s0)
	sw	a5,-36(s0)
	addi	a4,s0,-48
	addi	a5,s0,-32
	mv	a1,a4
	mv	a0,a5
	call	mulMat
	li	a5,0
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	main, .-main
	.ident	"GCC: (gc891d8dc23e) 13.2.0"
