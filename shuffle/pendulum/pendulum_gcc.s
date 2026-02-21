	.file	"pendulum.c"
	.text
	.p2align 4
	.globl	pendulum_shuffle
	.type	pendulum_shuffle, @function
pendulum_shuffle:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leal	-1(%rsi), %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	testl	%ebp, %ebp
	jle	.L1
	movq	%rdi, %r13
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L9:
	movslq	%ebx, %rax
	movslq	%edx, %rdx
	addl	$1, %ebx
	addl	$1, %r12d
	leaq	0(%r13,%rax,4), %rcx
	leaq	0(%r13,%rdx,4), %rax
	movl	(%rcx), %esi
	movl	(%rax), %edx
	movl	%edx, (%rcx)
	movl	%esi, (%rax)
	cmpl	%ebp, %ebx
	jge	.L1
.L5:
	call	rand@PLT
	movl	%ebp, %ecx
	subl	%ebx, %ecx
	cltd
	addl	$1, %ecx
	idivl	%ecx
	addl	%ebx, %edx
	testb	$1, %r12b
	je	.L9
	movslq	%ebp, %rax
	movslq	%edx, %rdx
	subl	$1, %ebp
	addl	$1, %r12d
	leaq	0(%r13,%rax,4), %rcx
	leaq	0(%r13,%rdx,4), %rax
	movl	(%rcx), %esi
	movl	(%rax), %edx
	movl	%edx, (%rcx)
	movl	%esi, (%rax)
	cmpl	%ebp, %ebx
	jl	.L5
.L1:
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
	.cfi_endproc
.LFE10:
	.size	pendulum_shuffle, .-pendulum_shuffle
	.p2align 4
	.globl	shuffle
	.type	shuffle, @function
shuffle:
.LFB11:
	.cfi_startproc
	endbr64
	jmp	pendulum_shuffle
	.cfi_endproc
.LFE11:
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
