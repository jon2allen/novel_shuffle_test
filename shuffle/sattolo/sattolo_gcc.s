	.file	"sattolo.c"
	.text
	.p2align 4
	.globl	shuffle
	.type	shuffle, @function
shuffle:
.LFB10:
	.cfi_startproc
	endbr64
	cmpq	$1, %rsi
	jbe	.L8
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movl	$1, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	.p2align 4,,10
	.p2align 3
.L2:
	call	rand@PLT
	movq	%rbx, %r13
	movl	-4(%r12,%rbp,4), %edx
	subq	%rbp, %r13
	movl	%eax, %eax
	imulq	%r13, %rax
	shrq	$31, %rax
	addq	%rbp, %rax
	leaq	(%r12,%rax,4), %rax
	movl	(%rax), %ecx
	movl	%ecx, -4(%r12,%rbp,4)
	addq	$1, %rbp
	movl	%edx, (%rax)
	cmpq	%rbp, %rbx
	jne	.L2
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
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
