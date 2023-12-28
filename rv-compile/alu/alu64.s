	.file	"alu.c"
	.option nopic
	.attribute arch, "rv64i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"select Oprtn : \n(add: 0, sub: 1, mul: 2, div:3)\n(and: 4, or: 5, xor: 6, LR-shit:7)\n"
	.align	3
.LC1:
	.string	"%d"
	.align	3
.LC2:
	.string	"enter 2 float numbers\n"
	.align	3
.LC3:
	.string	"%f %f"
	.align	3
.LC4:
	.string	"enter 2 int numbers\n"
	.align	3
.LC5:
	.string	"%d %d"
	.globl	__addsf3
	.globl	__extendsfdf2
	.align	3
.LC6:
	.string	"%.2f + %.2f: %.2f\n"
	.globl	__subsf3
	.align	3
.LC7:
	.string	"%.2f - %.2f: %.2f\n"
	.globl	__mulsf3
	.align	3
.LC8:
	.string	"%.2f * %.2f: %.2f\n"
	.globl	__divsf3
	.align	3
.LC9:
	.string	"%.2f / %.2f: %.2f\n"
	.align	3
.LC10:
	.string	"%X & %X: %X\n"
	.align	3
.LC11:
	.string	"%X | %X: %X\n"
	.align	3
.LC12:
	.string	"%X ^ %X: %X\n"
	.align	3
.LC13:
	.string	"%X << %X: %X\n"
	.align	3
.LC14:
	.string	"%X >> %X: %X\n"
	.align	3
.LC15:
	.string	"ERROR : incorrect Oprtn\n"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	addi	s0,sp,64
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	addi	a5,s0,-60
	mv	a1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	scanf
	lw	a5,-60(s0)
	mv	a4,a5
	li	a5,3
	bgt	a4,a5,.L2
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	printf
	addi	a4,s0,-48
	addi	a5,s0,-44
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	scanf
	j	.L3
.L2:
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	printf
	addi	a4,s0,-56
	addi	a5,s0,-52
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	scanf
.L3:
	lw	a5,-60(s0)
	mv	a3,a5
	li	a4,7
	bgtu	a3,a4,.L4
	slli	a4,a5,2
	lui	a5,%hi(.L6)
	addi	a5,a5,%lo(.L6)
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L6:
	.word	.L13
	.word	.L12
	.word	.L11
	.word	.L10
	.word	.L9
	.word	.L8
	.word	.L7
	.word	.L5
	.text
.L13:
	lw	a5,-44(s0)
	lw	a4,-48(s0)
	mv	a1,a4
	mv	a0,a5
	call	__addsf3
	mv	a5,a0
	sw	a5,-36(s0)
	lw	a5,-44(s0)
	mv	a0,a5
	call	__extendsfdf2
	mv	s1,a0
	lw	a5,-48(s0)
	mv	a0,a5
	call	__extendsfdf2
	mv	s2,a0
	lw	a0,-36(s0)
	call	__extendsfdf2
	mv	a5,a0
	mv	a3,a5
	mv	a2,s2
	mv	a1,s1
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	printf
	j	.L14
.L12:
	lw	a5,-44(s0)
	lw	a4,-48(s0)
	mv	a1,a4
	mv	a0,a5
	call	__subsf3
	mv	a5,a0
	sw	a5,-36(s0)
	lw	a5,-44(s0)
	mv	a0,a5
	call	__extendsfdf2
	mv	s1,a0
	lw	a5,-48(s0)
	mv	a0,a5
	call	__extendsfdf2
	mv	s2,a0
	lw	a0,-36(s0)
	call	__extendsfdf2
	mv	a5,a0
	mv	a3,a5
	mv	a2,s2
	mv	a1,s1
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	printf
	j	.L14
.L11:
	lw	a5,-44(s0)
	lw	a4,-48(s0)
	mv	a1,a4
	mv	a0,a5
	call	__mulsf3
	mv	a5,a0
	sw	a5,-36(s0)
	lw	a5,-44(s0)
	mv	a0,a5
	call	__extendsfdf2
	mv	s1,a0
	lw	a5,-48(s0)
	mv	a0,a5
	call	__extendsfdf2
	mv	s2,a0
	lw	a0,-36(s0)
	call	__extendsfdf2
	mv	a5,a0
	mv	a3,a5
	mv	a2,s2
	mv	a1,s1
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	j	.L14
.L10:
	lw	a5,-44(s0)
	lw	a4,-48(s0)
	mv	a1,a4
	mv	a0,a5
	call	__divsf3
	mv	a5,a0
	sw	a5,-36(s0)
	lw	a5,-44(s0)
	mv	a0,a5
	call	__extendsfdf2
	mv	s1,a0
	lw	a5,-48(s0)
	mv	a0,a5
	call	__extendsfdf2
	mv	s2,a0
	lw	a0,-36(s0)
	call	__extendsfdf2
	mv	a5,a0
	mv	a3,a5
	mv	a2,s2
	mv	a1,s1
	lui	a5,%hi(.LC9)
	addi	a0,a5,%lo(.LC9)
	call	printf
	j	.L14
.L9:
	lw	a4,-52(s0)
	lw	a5,-56(s0)
	and	a5,a4,a5
	sw	a5,-40(s0)
	lw	a5,-52(s0)
	lw	a4,-56(s0)
	lw	a3,-40(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	printf
	j	.L14
.L8:
	lw	a4,-52(s0)
	lw	a5,-56(s0)
	or	a5,a4,a5
	sw	a5,-40(s0)
	lw	a5,-52(s0)
	lw	a4,-56(s0)
	lw	a3,-40(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC11)
	addi	a0,a5,%lo(.LC11)
	call	printf
	j	.L14
.L7:
	lw	a4,-52(s0)
	lw	a5,-56(s0)
	xor	a5,a4,a5
	sw	a5,-40(s0)
	lw	a5,-52(s0)
	lw	a4,-56(s0)
	lw	a3,-40(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC12)
	addi	a0,a5,%lo(.LC12)
	call	printf
	j	.L14
.L5:
	lw	a4,-52(s0)
	lw	a5,-56(s0)
	sllw	a5,a4,a5
	sw	a5,-40(s0)
	lw	a5,-52(s0)
	lw	a4,-56(s0)
	lw	a3,-40(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC13)
	addi	a0,a5,%lo(.LC13)
	call	printf
	lw	a4,-52(s0)
	lw	a5,-56(s0)
	sraw	a5,a4,a5
	sw	a5,-40(s0)
	lw	a5,-52(s0)
	lw	a4,-56(s0)
	lw	a3,-40(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC14)
	addi	a0,a5,%lo(.LC14)
	call	printf
	j	.L14
.L4:
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	printf
.L14:
	li	a5,0
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	addi	sp,sp,64
	jr	ra
	.size	main, .-main
	.ident	"GCC: (SiFive GCC 8.3.0-2019.08.0) 8.3.0"
