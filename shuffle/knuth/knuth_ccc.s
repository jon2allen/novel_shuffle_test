.section .text
.globl shuffle
.type shuffle, @function
shuffle:
.cfi_startproc
    pushq %rbp
    .cfi_def_cfa_offset 16
    .cfi_offset %rbp, -16
    movq %rsp, %rbp
    .cfi_def_cfa_register %rbp
    subq $64, %rsp
    movq %rbx, -64(%rbp)
    movq %r12, -56(%rbp)
    movq %r13, -48(%rbp)
    movq %r14, -40(%rbp)
    movq %r15, -32(%rbp)
    movq %rdi, -8(%rbp)
    movq %rsi, %rax
    movq %rsi, -16(%rbp)
    movq %rsi, %r13
    cmpq $1, %rsi
    ja .LBB3
.LBB1:
    movq -64(%rbp), %rbx
    movq -56(%rbp), %r12
    movq -48(%rbp), %r13
    movq -40(%rbp), %r14
    movq -32(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    ret
.LBB3:
    movq %r13, %r14
    subq $1, %r14
    xorl %eax, %eax
    movq %rax, %r12
    movq -8(%rbp), %rax
    movq %rax, -24(%rbp)
.LBB5:
    movq %r12, %rax
    movq %r12, %rbx
    cmpq %r14, %r12
    jae .LBB8
.LBB6:
    movq %r13, %r15
    subq %rbx, %r15
    xorl %eax, %eax
    call rand
    cltq
    movl %eax, %eax
    movq %rax, %rsi
    imulq %r15, %rsi
    movq %rsi, %r10
    shrq $31, %r10
    movq -24(%rbp), %rcx
    movslq (%rcx), %rax
    movq %rax, %r11
    movq %rbx, %rdi
    addq %r10, %rdi
    movq %rdi, %rsi
    shlq $2, %rsi
    movq -8(%rbp), %rcx
    movq %rsi, %rax
    addq %rcx, %rax
    movq %rax, %r15
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %r10
    movq %rax, %rdx
    movq -24(%rbp), %rcx
    movl %edx, (%rcx)
    movq %r11, %rdx
    movq %r15, %rcx
    movl %edx, (%rcx)
    movq %r12, %rdi
    addq $1, %rdi
    movq %rdi, %r8
    movq -24(%rbp), %rax
    leaq 4(%rax), %rax
    movq %rax, %r9
    movq %r8, %r12
    movq %rax, -24(%rbp)
    jmp .LBB5
.LBB8:
    movq -64(%rbp), %rbx
    movq -56(%rbp), %r12
    movq -48(%rbp), %r13
    movq -40(%rbp), %r14
    movq -32(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    ret
.cfi_endproc
.size shuffle, .-shuffle


.section .note.GNU-stack,"",@progbits
