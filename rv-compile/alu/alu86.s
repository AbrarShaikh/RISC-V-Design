	.file	"alu.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"select Oprtn : \n(add: 0, sub: 1, mul: 2, div:3)\n(and: 4, or: 5, xor: 6, LR-shit:7)"
.LC1:
	.string	"%d"
.LC2:
	.string	"enter 2 float numbers"
.LC3:
	.string	"%f %f"
.LC4:
	.string	"enter 2 int numbers"
.LC5:
	.string	"%d %d"
.LC6:
	.string	"%.2f + %.2f: %.2f\n"
.LC7:
	.string	"%.2f - %.2f: %.2f\n"
.LC8:
	.string	"%.2f * %.2f: %.2f\n"
.LC9:
	.string	"%.2f / %.2f: %.2f\n"
.LC10:
	.string	"%X & %X: %X\n"
.LC11:
	.string	"%X | %X: %X\n"
.LC12:
	.string	"%X ^ %X: %X\n"
.LC13:
	.string	"%X << %X: %X\n"
.LC14:
	.string	"%X >> %X: %X\n"
.LC15:
	.string	"ERROR : incorrect Oprtn"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-20(%rbp), %eax
	cmpl	$3, %eax
	jg	.L2
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	leaq	-32(%rbp), %rdx
	leaq	-36(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L3
.L2:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	leaq	-24(%rbp), %rdx
	leaq	-28(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
.L3:
	movl	-20(%rbp), %eax
	cmpl	$7, %eax
	ja	.L4
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L6(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L6(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L6:
	.long	.L5-.L6
	.long	.L7-.L6
	.long	.L8-.L6
	.long	.L9-.L6
	.long	.L10-.L6
	.long	.L11-.L6
	.long	.L12-.L6
	.long	.L13-.L6
	.text
.L5:
	movss	-36(%rbp), %xmm1
	movss	-32(%rbp), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	cvtss2sd	-12(%rbp), %xmm2
	movss	-32(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movss	-36(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC6(%rip), %rdi
	movl	$3, %eax
	call	printf@PLT
	jmp	.L14
.L7:
	movss	-36(%rbp), %xmm0
	movss	-32(%rbp), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	cvtss2sd	-12(%rbp), %xmm2
	movss	-32(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movss	-36(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC7(%rip), %rdi
	movl	$3, %eax
	call	printf@PLT
	jmp	.L14
.L8:
	movss	-36(%rbp), %xmm1
	movss	-32(%rbp), %xmm0
	mulss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	cvtss2sd	-12(%rbp), %xmm2
	movss	-32(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movss	-36(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC8(%rip), %rdi
	movl	$3, %eax
	call	printf@PLT
	jmp	.L14
.L9:
	movss	-36(%rbp), %xmm0
	movss	-32(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	cvtss2sd	-12(%rbp), %xmm2
	movss	-32(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movss	-36(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC9(%rip), %rdi
	movl	$3, %eax
	call	printf@PLT
	jmp	.L14
.L10:
	movl	-28(%rbp), %edx
	movl	-24(%rbp), %eax
	andl	%edx, %eax
	movl	%eax, -16(%rbp)
	movl	-24(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	-16(%rbp), %ecx
	movl	%eax, %esi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L14
.L11:
	movl	-28(%rbp), %edx
	movl	-24(%rbp), %eax
	orl	%edx, %eax
	movl	%eax, -16(%rbp)
	movl	-24(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	-16(%rbp), %ecx
	movl	%eax, %esi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L14
.L12:
	movl	-28(%rbp), %edx
	movl	-24(%rbp), %eax
	xorl	%edx, %eax
	movl	%eax, -16(%rbp)
	movl	-24(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	-16(%rbp), %ecx
	movl	%eax, %esi
	leaq	.LC12(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L14
.L13:
	movl	-28(%rbp), %edx
	movl	-24(%rbp), %eax
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	movl	%eax, -16(%rbp)
	movl	-24(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	-16(%rbp), %ecx
	movl	%eax, %esi
	leaq	.LC13(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-28(%rbp), %edx
	movl	-24(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, -16(%rbp)
	movl	-24(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	-16(%rbp), %ecx
	movl	%eax, %esi
	leaq	.LC14(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L14
.L4:
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
.L14:
	movl	$0, %eax
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
