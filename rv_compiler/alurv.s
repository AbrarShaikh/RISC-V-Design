	.file	"alu.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"select Oprtn : \n(add: 0, sub: 1, mul: 2, div:3)\n(and: 4, or: 5, xor: 6, LR-shit:7)"
	.align	3
.LC1:
	.string	"%d"
	.align	3
.LC2:
	.string	"enter 2 float numbers"
	.align	3
.LC3:
	.string	"%f %f"
	.align	3
.LC4:
	.string	"enter 2 int numbers"
	.align	3
.LC5:
	.string	"%d %d"
	.align	3
.LC6:
	.string	"%.2f + %.2f: %.2f\n"
	.align	3
.LC7:
	.string	"%.2f - %.2f: %.2f\n"
	.align	3
.LC8:
	.string	"%.2f * %.2f: %.2f\n"
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
	.string	"ERROR : incorrect Oprtn"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	puts
	addi	a5,s0,-44
	mv	a1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	scanf
	lw	a5,-44(s0)
	mv	a4,a5
	li	a5,3
	bgt	a4,a5,.L2
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
	addi	a4,s0,-32
	addi	a5,s0,-28
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	scanf
	j	.L3
.L2:
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	puts
	addi	a4,s0,-40
	addi	a5,s0,-36
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	scanf
.L3:
	lw	a5,-44(s0)
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
	flw	fa4,-28(s0)
	flw	fa5,-32(s0)
	fadd.s	fa5,fa4,fa5
	fsw	fa5,-20(s0)
	flw	fa5,-28(s0)
	fcvt.d.s	fa4,fa5
	flw	fa5,-32(s0)
	fcvt.d.s	fa3,fa5
	flw	fa5,-20(s0)
	fcvt.d.s	fa5,fa5
	fmv.x.d	a3,fa5
	fmv.x.d	a2,fa3
	fmv.x.d	a1,fa4
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	printf
	j	.L14
.L12:
	flw	fa4,-28(s0)
	flw	fa5,-32(s0)
	fsub.s	fa5,fa4,fa5
	fsw	fa5,-20(s0)
	flw	fa5,-28(s0)
	fcvt.d.s	fa4,fa5
	flw	fa5,-32(s0)
	fcvt.d.s	fa3,fa5
	flw	fa5,-20(s0)
	fcvt.d.s	fa5,fa5
	fmv.x.d	a3,fa5
	fmv.x.d	a2,fa3
	fmv.x.d	a1,fa4
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	printf
	j	.L14
.L11:
	flw	fa4,-28(s0)
	flw	fa5,-32(s0)
	fmul.s	fa5,fa4,fa5
	fsw	fa5,-20(s0)
	flw	fa5,-28(s0)
	fcvt.d.s	fa4,fa5
	flw	fa5,-32(s0)
	fcvt.d.s	fa3,fa5
	flw	fa5,-20(s0)
	fcvt.d.s	fa5,fa5
	fmv.x.d	a3,fa5
	fmv.x.d	a2,fa3
	fmv.x.d	a1,fa4
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	j	.L14
.L10:
	flw	fa4,-28(s0)
	flw	fa5,-32(s0)
	fdiv.s	fa5,fa4,fa5
	fsw	fa5,-20(s0)
	flw	fa5,-28(s0)
	fcvt.d.s	fa4,fa5
	flw	fa5,-32(s0)
	fcvt.d.s	fa3,fa5
	flw	fa5,-20(s0)
	fcvt.d.s	fa5,fa5
	fmv.x.d	a3,fa5
	fmv.x.d	a2,fa3
	fmv.x.d	a1,fa4
	lui	a5,%hi(.LC9)
	addi	a0,a5,%lo(.LC9)
	call	printf
	j	.L14
.L9:
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	and	a5,a4,a5
	sw	a5,-24(s0)
	lw	a5,-36(s0)
	lw	a4,-40(s0)
	lw	a3,-24(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	printf
	j	.L14
.L8:
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	or	a5,a4,a5
	sw	a5,-24(s0)
	lw	a5,-36(s0)
	lw	a4,-40(s0)
	lw	a3,-24(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC11)
	addi	a0,a5,%lo(.LC11)
	call	printf
	j	.L14
.L7:
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	xor	a5,a4,a5
	sw	a5,-24(s0)
	lw	a5,-36(s0)
	lw	a4,-40(s0)
	lw	a3,-24(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC12)
	addi	a0,a5,%lo(.LC12)
	call	printf
	j	.L14
.L5:
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	sllw	a5,a4,a5
	sw	a5,-24(s0)
	lw	a5,-36(s0)
	lw	a4,-40(s0)
	lw	a3,-24(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC13)
	addi	a0,a5,%lo(.LC13)
	call	printf
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	sraw	a5,a4,a5
	sw	a5,-24(s0)
	lw	a5,-36(s0)
	lw	a4,-40(s0)
	lw	a3,-24(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC14)
	addi	a0,a5,%lo(.LC14)
	call	printf
	j	.L14
.L4:
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	puts
.L14:
	li	a5,0
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	main, .-main
	.ident	"GCC: (SiFive GCC 8.3.0-2019.08.0) 8.3.0"
