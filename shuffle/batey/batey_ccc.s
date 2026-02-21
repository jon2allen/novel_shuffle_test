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
    movq %rsi, %r12
    cmpq $1, %rsi
    ja .LBB9
.LBB1:
    movq -64(%rbp), %rbx
    movq -56(%rbp), %r12
    movq -48(%rbp), %r13
    movq -40(%rbp), %r14
    movq -32(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    ret
.LBB5:
    movq %r13, %rax
    movq %r13, %rbx
    cmpq %r12, %r13
    jae .LBB8
.LBB6:
    movq %r12, %r14
    subq %rbx, %r14
    xorl %eax, %eax
    call rand
    movq %rax, %r15
    cltq
    movl %eax, %eax
    movq %rax, %rsi
    imulq %r14, %rsi
    movq %rsi, %rdi
    shrq $31, %rdi
    movq %rbx, %r10
    addq %rdi, %r10
    movq -24(%rbp), %rcx
    movslq (%rcx), %rax
    movq %rax, %r11
    movq %r10, %rsi
    shlq $2, %rsi
    movq -8(%rbp), %rcx
    movq %rsi, %rax
    addq %rcx, %rax
    movq %rax, %r15
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %rdi
    movq %rax, %rdx
    movq -24(%rbp), %rcx
    movl %edx, (%rcx)
    movq %r11, %rdx
    movq %r15, %rcx
    movl %edx, (%rcx)
    movq %r13, %r10
    addq $1, %r10
    movq %r10, %r8
    movq -24(%rbp), %rax
    leaq 4(%rax), %rax
    movq %rax, %r9
    movq %r8, %r13
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
.LBB9:
    xorl %eax, %eax
    movq %rax, %r13
    movq -8(%rbp), %rax
    movq %rax, -24(%rbp)
    jmp .LBB5
.cfi_endproc
.size shuffle, .-shuffle


.section .note.GNU-stack,"",@progbits
