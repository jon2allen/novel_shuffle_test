	.file	"riffle.c"
	.text
	.p2align 4
	.globl	shuffle
	.type	shuffle, @function
shuffle:
.LFB17:
	.cfi_startproc
	endbr64
	cmpq	$1, %rsi
	jbe	.L24
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	0(,%rsi,4), %rax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	movq	%rax, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rax, 8(%rsp)
	call	malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L1
	movq	%rbp, %rdx
	shrq	%rdx
	cmpq	%rbp, %rdx
	jnb	.L14
	movq	%rdx, %r15
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	xorl	%r14d, %r14d
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L29:
	movl	(%r12,%r14,4), %esi
	addq	$1, %r14
	sarl	%eax
	movl	%esi, -4(%r13,%rbx,4)
	cmpq	%rdx, %r14
	jnb	.L12
.L30:
	cmpq	%rbp, %r15
	jnb	.L28
.L10:
	testl	%ecx, %ecx
	je	.L6
	subl	$1, %ecx
.L7:
	addq	$1, %rbx
	testb	$1, %al
	jne	.L29
	movl	(%r12,%r15,4), %esi
	sarl	%eax
	addq	$1, %r15
	movl	%esi, -4(%r13,%rbx,4)
	cmpq	%rdx, %r14
	jb	.L30
.L12:
	cmpq	%rbp, %r15
	jb	.L31
.L13:
	movq	8(%rsp), %rdx
	movq	%r12, %rdi
	movq	%r13, %rsi
	call	memcpy@PLT
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r13, %rdi
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L6:
	.cfi_restore_state
	movq	%rdx, (%rsp)
	call	rand@PLT
	movq	(%rsp), %rdx
	movl	$30, %ecx
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L28:
	cmpq	%rdx, %r14
	jnb	.L12
	movq	8(%rsp), %rdi
	salq	$2, %rbx
	subq	%r14, %rdx
	leaq	(%r12,%r14,4), %rsi
	leaq	0(%r13,%rbx), %rax
	cmpq	%rbx, %rdi
	movq	%rdi, %rcx
	cmovb	%rbx, %rcx
	subq	%rbx, %rcx
.L5:
	salq	$2, %rdx
	movq	%rax, %rdi
	call	__memcpy_chk@PLT
	jmp	.L13
.L1:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L24:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.p2align 4,,10
	.p2align 3
.L31:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	8(%rsp), %rax
	salq	$2, %rbx
	movq	%rbp, %rdx
	leaq	(%r12,%r15,4), %rsi
	leaq	0(%r13,%rbx), %rdi
	cmpq	%rbx, %rax
	movq	%rax, %rcx
	cmovb	%rbx, %rcx
	subq	%r15, %rdx
	salq	$2, %rdx
	subq	%rbx, %rcx
	call	__memcpy_chk@PLT
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L14:
	movq	8(%rsp), %rcx
	movq	%r12, %rsi
	jmp	.L5
	.cfi_endproc
.LFE17:
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
