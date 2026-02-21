	.file	"rc4.c"
	.text
	.p2align 4
	.globl	shuffle
	.type	shuffle, @function
shuffle:
.LFB10:
	.cfi_startproc
	endbr64
	cmpq	$1, %rsi
	jbe	.L16
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	0(,%rsi,4), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movq	%rbp, %rdi
	call	malloc@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L1
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L5:
	movl	%ecx, (%rdi,%rcx,4)
	movq	%rcx, %r9
	addq	$1, %rcx
	cmpq	%rcx, %r12
	jne	.L5
	xorl	%esi, %esi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L6:
	movslq	(%rdi,%rsi,4), %r10
	movslq	(%rbx,%rsi,4), %rax
	addq	%r10, %rax
	movq	%r10, %r8
	addq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rcx
	leaq	(%rdi,%rdx,4), %rax
	movl	(%rax), %r10d
	movl	%r10d, (%rdi,%rsi,4)
	movl	%r8d, (%rax)
	movq	%rsi, %rax
	addq	$1, %rsi
	cmpq	%rax, %r9
	jne	.L6
	movq	%rbx, %rsi
	addq	%rbx, %rbp
	.p2align 4,,10
	.p2align 3
.L8:
	movslq	(%rsi), %rdx
	cmpq	%rcx, %rdx
	jb	.L7
	movq	%rdx, %rax
	xorl	%edx, %edx
	divq	%rcx
.L7:
	movl	(%rdi,%rdx,4), %eax
	movl	%eax, (%rsi)
	addq	$4, %rsi
	cmpq	%rsi, %rbp
	jne	.L8
	popq	%rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 8
	jmp	free@PLT
.L1:
	.cfi_restore_state
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
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
