	.file	"tectonic.c"
	.text
	.p2align 4
	.globl	tectonic_shuffle
	.type	tectonic_shuffle, @function
tectonic_shuffle:
.LFB11:
	.cfi_startproc
	endbr64
	cmpl	$2, %esi
	jle	.L31
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leal	-2(%rsi), %r14d
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	$3, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leal	-1(%rsi), %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movslq	%ebp, %r12
	movq	%rdi, %rbx
.L17:
	call	rand@PLT
	cltd
	idivl	%r14d
	xorl	%eax, %eax
	leal	1(%rdx), %edi
	movslq	%edx, %rcx
	testl	%edx, %edx
	jle	.L7
	.p2align 4,,10
	.p2align 3
.L6:
	movl	(%rbx,%rax,4), %edx
	movl	(%rbx,%rcx,4), %esi
	movl	%esi, (%rbx,%rax,4)
	addq	$1, %rax
	movl	%edx, (%rbx,%rcx,4)
	subq	$1, %rcx
	cmpl	%eax, %ecx
	jg	.L6
.L7:
	movslq	%edi, %rdx
	movq	%r12, %rax
	cmpl	%ebp, %edi
	jge	.L5
	.p2align 4,,10
	.p2align 3
.L10:
	movl	(%rbx,%rdx,4), %ecx
	movl	(%rbx,%rax,4), %esi
	movl	%esi, (%rbx,%rdx,4)
	addq	$1, %rdx
	movl	%ecx, (%rbx,%rax,4)
	subq	$1, %rax
	cmpl	%edx, %eax
	jg	.L10
.L5:
	call	rand@PLT
	cltd
	idivl	%ebp
	xorl	%eax, %eax
	leal	1(%rdx), %edi
	movslq	%edx, %rcx
	testl	%edx, %edx
	jle	.L9
	.p2align 4,,10
	.p2align 3
.L13:
	movl	(%rbx,%rax,4), %edx
	movl	(%rbx,%rcx,4), %esi
	movl	%esi, (%rbx,%rax,4)
	addq	$1, %rax
	movl	%edx, (%rbx,%rcx,4)
	subq	$1, %rcx
	cmpl	%eax, %ecx
	jg	.L13
.L9:
	movslq	%edi, %rdx
	movq	%r12, %rax
	cmpl	%ebp, %edi
	jge	.L12
	.p2align 4,,10
	.p2align 3
.L15:
	movl	(%rbx,%rdx,4), %ecx
	movl	(%rbx,%rax,4), %esi
	movl	%esi, (%rbx,%rdx,4)
	addq	$1, %rdx
	movl	%ecx, (%rbx,%rax,4)
	subq	$1, %rax
	cmpl	%edx, %eax
	jg	.L15
.L12:
	movq	%r12, %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L14:
	movl	(%rbx,%rax,4), %ecx
	movl	(%rbx,%rdx,4), %esi
	movl	%esi, (%rbx,%rax,4)
	addq	$1, %rax
	movl	%ecx, (%rbx,%rdx,4)
	subq	$1, %rdx
	cmpl	%eax, %edx
	jg	.L14
	subl	$1, %r13d
	jne	.L17
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L31:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	ret
	.cfi_endproc
.LFE11:
	.size	tectonic_shuffle, .-tectonic_shuffle
	.p2align 4
	.globl	shuffle
	.type	shuffle, @function
shuffle:
.LFB12:
	.cfi_startproc
	endbr64
	jmp	tectonic_shuffle
	.cfi_endproc
.LFE12:
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
