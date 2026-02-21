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
    subq $80, %rsp
    movq %rbx, -80(%rbp)
    movq %r12, -72(%rbp)
    movq %r13, -64(%rbp)
    movq %r14, -56(%rbp)
    movq %r15, -48(%rbp)
    movq %rdi, -8(%rbp)
    movq %rsi, %rax
    movq %rsi, -16(%rbp)
    movq %rsi, -24(%rbp)
    cmpq $1, %rsi
    ja .LBB3
.LBB1:
    movq -80(%rbp), %rbx
    movq -72(%rbp), %r12
    movq -64(%rbp), %r13
    movq -56(%rbp), %r14
    movq -48(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    ret
.LBB3:
    movq -24(%rbp), %r12
    subq $1, %r12
    xorl %eax, %eax
    movq %rax, %r13
    movq -8(%rbp), %rax
    movq %rax, -32(%rbp)
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
    movq %rax, %r8
    movq %rbx, %r11
    addq $1, %r11
    movl %r8d, %eax
    movq %rax, %r15
    imulq %r14, %r15
    movq %r15, %r8
    shrq $31, %r8
    movq %r11, %r9
    addq %r8, %r9
    movq -32(%rbp), %rcx
    movslq (%rcx), %rax
    movq %rax, %r10
    movq %r9, %r11
    shlq $2, %r11
    movq -8(%rbp), %rcx
    movq %r11, %rax
    addq %rcx, %rax
    movq %rax, %r14
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %r8
    movq %rax, %rdx
    movq -32(%rbp), %rcx
    movl %edx, (%rcx)
    movq %r10, %rdx
    movq %r14, %rcx
    movl %edx, (%rcx)
    movq %r13, %r9
    addq $1, %r9
    movq %r9, %rdi
    movq -32(%rbp), %rax
    leaq 4(%rax), %rax
    movq %rax, %rsi
    movq %rdi, %r13
    movq %rax, -32(%rbp)
    jmp .LBB5
.LBB8:
    movq -80(%rbp), %rbx
    movq -72(%rbp), %r12
    movq -64(%rbp), %r13
    movq -56(%rbp), %r14
    movq -48(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    ret
.cfi_endproc
.size shuffle, .-shuffle


.section .note.GNU-stack,"",@progbits
