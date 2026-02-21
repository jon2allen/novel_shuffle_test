.section .text
.globl pendulum_shuffle
.type pendulum_shuffle, @function
pendulum_shuffle:
.cfi_startproc
    pushq %rbp
    .cfi_def_cfa_offset 16
    .cfi_offset %rbp, -16
    movq %rsp, %rbp
    .cfi_def_cfa_register %rbp
    subq $112, %rsp
    movq %rbx, -112(%rbp)
    movq %r12, -104(%rbp)
    movq %r13, -96(%rbp)
    movq %r14, -88(%rbp)
    movq %r15, -80(%rbp)
    movq %rsi, -16(%rbp)
    movq %rdi, -8(%rbp)
    movslq -16(%rbp), %rax
    movq %rax, -16(%rbp)
    subl $1, %eax
    cltq
    movq %rax, -48(%rbp)
    xorl %eax, %eax
    movq %rax, %rbx
    movq %rax, -24(%rbp)
    movq %rax, %r13
    movq -48(%rbp), %rax
    movq %rax, %r12
    xorl %eax, %eax
    movq %rax, -32(%rbp)
.LBB1:
    movslq %ebx, %rax
    movq %rax, -40(%rbp)
    movslq %r12d, %rax
    movq %rax, %r14
    movq -40(%rbp), %rax
    cmpl %r14d, %eax
    jge .LBB3
.LBB2:
    movq %r12, %rax
    movq %rbx, %rcx
    subl %ebx, %eax
    cltq
    addl $1, %eax
    cltq
    movq %rax, -48(%rbp)
    xorl %eax, %eax
    call rand
    cltq
    movq %rax, -56(%rbp)
    movq -48(%rbp), %rax
    cltq
    movq %rax, -64(%rbp)
    movq -56(%rbp), %rax
    movq -64(%rbp), %rcx
    cqto
    idivq %rcx
    movslq %edx, %rax
    movq %rbx, %r15
    addl %eax, %r15d
    movslq %r15d, %r15
    movslq %r13d, %rax
    movq %rax, %r11
    sarq $63, %rax
    shrq $63, %rax
    movq %rax, -64(%rbp)
    movq %r11, %rax
    addq -64(%rbp), %rax
    movq %rax, %r9
    sarq $1, %r9
    movq %r9, %rax
    addq %r9, %rax
    movq %rax, -56(%rbp)
    movq %r11, %rax
    subq -56(%rbp), %rax
    cltq
    movq %rax, -56(%rbp)
    testl %eax, %eax
    jne .LBB5
.LBB4:
    movq -40(%rbp), %rax
    shlq $2, %rax
    movq %rax, -48(%rbp)
    addq -8(%rbp), %rax
    movq %rax, -56(%rbp)
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %r8
    movslq %r15d, %rax
    shlq $2, %rax
    movq %rax, -64(%rbp)
    addq -8(%rbp), %rax
    movq %rax, -48(%rbp)
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %rdx
    movq -56(%rbp), %rcx
    movl %edx, (%rcx)
    movq %r8, %rdx
    movq -48(%rbp), %rcx
    movl %edx, (%rcx)
    movq %rbx, %rax
    addq $1, %rax
    cltq
    movq %rax, -64(%rbp)
    movq %rax, %rdi
    movq %r8, %rsi
    movq %r12, %r9
    movq -32(%rbp), %rax
    movq %rax, %r11
    jmp .LBB6
.LBB5:
    movq %r14, %rax
    shlq $2, %rax
    movq %rax, -48(%rbp)
    addq -8(%rbp), %rax
    movq %rax, -56(%rbp)
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %r10
    movslq %r15d, %rax
    shlq $2, %rax
    movq %rax, -64(%rbp)
    addq -8(%rbp), %rax
    movq %rax, -48(%rbp)
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %rdx
    movq -56(%rbp), %rcx
    movl %edx, (%rcx)
    movq %r10, %rdx
    movq -48(%rbp), %rcx
    movl %edx, (%rcx)
    movq %r12, %rax
    subq $1, %rax
    cltq
    movq %rax, %r8
    movq %rbx, %rdi
    movq -24(%rbp), %rax
    movq %rax, %rsi
    movq %r8, %r9
    movq %r10, %r11
.LBB6:
    movq %r13, %r10
    addq $1, %r10
    movslq %r10d, %rax
    movq %rax, %r8
    movq %rdi, %rbx
    movq %rsi, -24(%rbp)
    movq %r8, %r13
    movq %r9, %r12
    movq %r11, %rax
    movq %r11, -32(%rbp)
    jmp .LBB1
.LBB3:
    movq -112(%rbp), %rbx
    movq -104(%rbp), %r12
    movq -96(%rbp), %r13
    movq -88(%rbp), %r14
    movq -80(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    ret
.cfi_endproc
.size pendulum_shuffle, .-pendulum_shuffle

.globl shuffle
.type shuffle, @function
shuffle:
.cfi_startproc
    pushq %rbp
    .cfi_def_cfa_offset 16
    .cfi_offset %rbp, -16
    movq %rsp, %rbp
    .cfi_def_cfa_register %rbp
    subq $16, %rsp
    movq %rbx, -16(%rbp)
    movq %r12, -8(%rbp)
    movq %rdi, %rbx
    movq %rsi, %rax
    movq %rsi, %r11
    cltq
    movq %rax, %r12
    movq %rbx, %rdi
    movq %r12, %rax
    movq %r12, %rsi
    xorl %r12d, %eax
    movq -16(%rbp), %rbx
    movq -8(%rbp), %r12
    movq %rbp, %rsp
    popq %rbp
    jmp pendulum_shuffle
.cfi_endproc
.size shuffle, .-shuffle


.section .note.GNU-stack,"",@progbits
