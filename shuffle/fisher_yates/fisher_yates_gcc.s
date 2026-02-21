	.file	"fisher_yates.c"
	.text
	.p2align 4
	.globl	shuffle
	.type	shuffle, @function
shuffle:
.LFB10:
	.cfi_startproc
	endbr64
	cmpq	$1, %rsi
	jbe	.L6
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L3:
	call	rand@PLT
	movl	-4(%rbp,%rbx,4), %edx
	movl	%eax, %eax
	imulq	%rbx, %rax
	shrq	$31, %rax
	leaq	0(%rbp,%rax,4), %rax
	movl	(%rax), %ecx
	movl	%ecx, -4(%rbp,%rbx,4)
	subq	$1, %rbx
	movl	%edx, (%rax)
	cmpq	$1, %rbx
	jne	.L3
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE10:
	.size	shuffle, .-shuffle
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
