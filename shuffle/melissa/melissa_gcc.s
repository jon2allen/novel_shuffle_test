	.file	"melissa.c"
	.text
	.p2align 4
	.globl	melissa_shuffle_inplace
	.type	melissa_shuffle_inplace, @function
melissa_shuffle_inplace:
.LFB17:
	.cfi_startproc
	endbr64
	cmpq	$1, %rsi
	jbe	.L19
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
.L9:
	call	rand@PLT
	leaq	-1(%r14), %r15
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	movl	%eax, %eax
	movq	%r15, %r12
	imulq	%r14, %rax
	shrq	$31, %rax
	movl	0(%r13,%rax,4), %edi
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L24:
	leaq	0(%r13,%rsi,4), %rcx
	addq	$1, %rbx
	addq	$1, %rsi
	movl	(%rcx), %r8d
	movl	%r8d, (%rdx)
	movl	%eax, (%rcx)
.L4:
	cmpq	%rbx, %r12
	jb	.L23
.L7:
	leaq	0(,%rbx,4), %rbp
	leaq	0(%r13,%rbp), %rdx
	movl	(%rdx), %eax
	cmpl	%edi, %eax
	jl	.L24
	jle	.L5
	leaq	0(%r13,%r12,4), %rcx
	movl	(%rcx), %r8d
	movl	%r8d, (%rdx)
	movl	%eax, (%rcx)
	testq	%r12, %r12
	je	.L6
	subq	$1, %r12
	cmpq	%rbx, %r12
	jnb	.L7
.L23:
	testq	%rsi, %rsi
	jne	.L25
.L8:
	cmpq	%r15, %r12
	jnb	.L1
	leaq	0(,%rbx,4), %rbp
.L11:
	subq	%rbx, %r14
	addq	%rbp, %r13
	cmpq	$1, %r14
	ja	.L9
.L1:
	addq	$8, %rsp
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
.L5:
	.cfi_restore_state
	addq	$1, %rbx
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L6:
	testq	%rsi, %rsi
	je	.L11
	movq	%r13, %rdi
	call	melissa_shuffle_inplace
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L25:
	movq	%r13, %rdi
	call	melissa_shuffle_inplace
	jmp	.L8
.L19:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE17:
	.size	melissa_shuffle_inplace, .-melissa_shuffle_inplace
	.p2align 4
	.globl	shuffle
	.type	shuffle, @function
shuffle:
.LFB18:
	.cfi_startproc
	endbr64
	jmp	melissa_shuffle_inplace
	.cfi_endproc
.LFE18:
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
