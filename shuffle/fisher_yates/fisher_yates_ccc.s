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
    subq $48, %rsp
    movq %rbx, -48(%rbp)
    movq %r12, -40(%rbp)
    movq %r13, -32(%rbp)
    movq %r14, -24(%rbp)
    movq %r15, -16(%rbp)
    movq %rdi, %r14
    movq %rsi, %rax
    movq %rsi, %r15
    cmpq $1, %rsi
    ja .LBB3
.LBB1:
    movq -48(%rbp), %rbx
    movq -40(%rbp), %r12
    movq -32(%rbp), %r13
    movq -24(%rbp), %r14
    movq -16(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    ret
.LBB3:
    movq %r15, %rax
    subq $1, %rax
    movq %rax, %r12
.LBB5:
    movq %r12, %rax
    movq %r12, %rbx
    testq %r12, %r12
    je .LBB8
.LBB6:
    xorl %eax, %eax
    call rand
    movq %rax, %r13
    cltq
    movl %eax, %eax
    movq %rbx, %rdi
    addq $1, %rdi
    movq %rax, %rsi
    imulq %rdi, %rsi
    movq %rsi, %r10
    shrq $31, %r10
    movq %rbx, %r9
    shlq $2, %r9
    movq %r9, %rax
    addq %r14, %rax
    movq %rax, %r15
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %r11
    movq %r10, %r8
    shlq $2, %r8
    movq %r8, %rax
    addq %r14, %rax
    movq %rax, %r10
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %rdi
    movq %rax, %rdx
    movq %r15, %rcx
    movl %edx, (%rcx)
    movq %r11, %rdx
    movq %r10, %rcx
    movl %edx, (%rcx)
    movq %r12, %rsi
    subq $1, %rsi
    movq %rsi, %rax
    movq %rsi, %r9
    movq %rsi, %r12
    jmp .LBB5
.LBB8:
    movq -48(%rbp), %rbx
    movq -40(%rbp), %r12
    movq -32(%rbp), %r13
    movq -24(%rbp), %r14
    movq -16(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    ret
.cfi_endproc
.size shuffle, .-shuffle


.section .note.GNU-stack,"",@progbits
