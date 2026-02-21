	.file	"hindu.c"
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
	movq	%rsi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	movq	%rax, %rdi
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rax, 8(%rsp)
	call	malloc@PLT
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L1
	movq	%r15, %rbp
	shrq	%rbp
	cmpq	%r15, %rbp
	jnb	.L14
	movq	%rbp, %r12
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L29:
	movl	0(%r13,%rsi,4), %edi
	addq	$1, %rsi
	sarl	%eax
	movl	%edi, -4(%r14,%rbx,4)
	cmpq	%rbp, %rsi
	jnb	.L12
.L30:
	cmpq	%r15, %r12
	jnb	.L28
.L10:
	testl	%ecx, %ecx
	je	.L6
	subl	$1, %ecx
.L7:
	addq	$1, %rbx
	testb	$1, %al
	jne	.L29
	movl	0(%r13,%r12,4), %edi
	sarl	%eax
	addq	$1, %r12
	movl	%edi, -4(%r14,%rbx,4)
	cmpq	%rbp, %rsi
	jb	.L30
.L12:
	cmpq	%r15, %r12
	jb	.L31
.L13:
	movq	8(%rsp), %rdx
	movq	%r13, %rdi
	movq	%r14, %rsi
	call	memcpy@PLT
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r14, %rdi
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
	movq	%rsi, (%rsp)
	call	rand@PLT
	movq	(%rsp), %rsi
	movl	$30, %ecx
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L28:
	cmpq	%rbp, %rsi
	jnb	.L12
	movq	8(%rsp), %rdx
	leaq	0(,%rbx,4), %rax
	subq	%rsi, %rbp
	leaq	0(%r13,%rsi,4), %rsi
	leaq	(%r14,%rax), %rdi
	cmpq	%rax, %rdx
	movq	%rdx, %rcx
	cmovb	%rax, %rcx
	addq	%rbp, %rbx
	subq	%rax, %rcx
.L5:
	leaq	0(,%rbp,4), %rdx
	call	__memcpy_chk@PLT
	cmpq	%r15, %r12
	jnb	.L13
	jmp	.L31
.L1:
	addq	$24, %rsp
	.cfi_remember_state
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
.L31:
	.cfi_restore_state
	movq	8(%rsp), %rax
	salq	$2, %rbx
	leaq	0(%r13,%r12,4), %rsi
	leaq	(%r14,%rbx), %rdi
	cmpq	%rbx, %rax
	movq	%rax, %rcx
	cmovb	%rbx, %rcx
	subq	%r12, %r15
	leaq	0(,%r15,4), %rdx
	subq	%rbx, %rcx
	call	__memcpy_chk@PLT
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L24:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	8(%rsp), %rcx
	movq	%rbp, %rbx
	movq	%rax, %rdi
	movq	%r13, %rsi
	movq	%rbp, %r12
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
