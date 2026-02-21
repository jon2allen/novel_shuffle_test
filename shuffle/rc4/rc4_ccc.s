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
    subq $128, %rsp
    movq %rbx, -128(%rbp)
    movq %r12, -120(%rbp)
    movq %r13, -112(%rbp)
    movq %r14, -104(%rbp)
    movq %r15, -96(%rbp)
    movq %rdi, -8(%rbp)
    movq %rsi, %rax
    movq %rsi, -16(%rbp)
    movq %rsi, %rbx
    cmpq $1, %rsi
    ja .LBB3
.LBB1:
    movq -128(%rbp), %rbx
    movq -120(%rbp), %r12
    movq -112(%rbp), %r13
    movq -104(%rbp), %r14
    movq -96(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    ret
.LBB3:
    movq %rbx, %rax
    shlq $2, %rax
    movq %rax, -72(%rbp)
    movq %rax, %rdi
    xorl %eax, %eax
    call malloc
    movq %rax, -24(%rbp)
    testq %rax, %rax
    jne .LBB24
.LBB5:
    movq -128(%rbp), %rbx
    movq -120(%rbp), %r12
    movq -112(%rbp), %r13
    movq -104(%rbp), %r14
    movq -96(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    ret
.LBB9:
    movq %r12, %rax
    movq %r12, -72(%rbp)
    cmpq %rbx, %r12
    jae .LBB25
.LBB10:
    movslq %r12d, %rax
    movq %rax, %rdx
    movq -32(%rbp), %rcx
    movl %edx, (%rcx)
    movq %r12, %rax
    addq $1, %rax
    movq %rax, -72(%rbp)
    movq -32(%rbp), %rax
    leaq 4(%rax), %rax
    movq %rax, -80(%rbp)
    movq -72(%rbp), %rax
    movq %rax, %r12
    movq -80(%rbp), %rax
    movq %rax, -32(%rbp)
    jmp .LBB9
.LBB13:
    movq %r14, %rax
    movq %r14, %r11
    cmpq %rbx, %r14
    jae .LBB26
.LBB14:
    movq -40(%rbp), %rax
    movq %rax, %r9
    movq %r11, %rdi
    shlq $2, %rdi
    movq -48(%rbp), %rcx
    movslq (%rcx), %rax
    movq %rax, %r10
    movq %r9, %rsi
    addq %rax, %rsi
    movq -8(%rbp), %rcx
    movq %rdi, %rax
    addq %rcx, %rax
    movq %rax, -72(%rbp)
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, -72(%rbp)
    movq %rsi, %rax
    addq -72(%rbp), %rax
    movq %rbx, %rcx
    xorl %edx, %edx
    divq %rcx
    movq %rdx, %rax
    movq %rdx, %r8
    shlq $2, %rax
    movq %rax, -80(%rbp)
    addq -24(%rbp), %rax
    movq %rax, -72(%rbp)
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %rdx
    movq -48(%rbp), %rcx
    movl %edx, (%rcx)
    movq %r10, %rdx
    movq -72(%rbp), %rcx
    movl %edx, (%rcx)
    movq %r14, %rax
    addq $1, %rax
    movq %rax, %rdi
    movq -48(%rbp), %rax
    leaq 4(%rax), %rax
    movq %rax, %r9
    movq %rdi, %r14
    movq %r8, -40(%rbp)
    movq %r9, %rax
    movq %r9, -48(%rbp)
    jmp .LBB13
.LBB17:
    movq %r15, %rax
    movq %r15, %rdi
    cmpq %rbx, %r15
    jae .LBB20
.LBB18:
    movq -56(%rbp), %rcx
    movslq (%rcx), %rax
    movq %rax, %r9
    movq %rax, %r13
    movq %rax, %r11
    cmpq %rbx, %rax
    jb .LBB27
.LBB21:
    movq %r13, %rax
    movq %rbx, %rcx
    xorl %edx, %edx
    divq %rcx
    movq %rdx, %rax
    movq %rdx, %r8
    movq %rdx, -64(%rbp)
.LBB23:
    movq -64(%rbp), %rax
    movq %rax, %r11
    shlq $2, %r11
    movq -24(%rbp), %rcx
    movq %r11, %rax
    addq %rcx, %rax
    movq %rax, %r9
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %rdi
    movq %rax, %rdx
    movq -56(%rbp), %rcx
    movl %edx, (%rcx)
    movq %r15, %r8
    addq $1, %r8
    movq %r8, %rsi
    movq -56(%rbp), %rax
    leaq 4(%rax), %rax
    movq %rax, %r10
    movq %rsi, %r15
    movq %rax, -56(%rbp)
    jmp .LBB17
.LBB20:
    movq -24(%rbp), %rax
    movq %rax, %rdi
    xorl %eax, %eax
    movq -128(%rbp), %rbx
    movq -120(%rbp), %r12
    movq -112(%rbp), %r13
    movq -104(%rbp), %r14
    movq -96(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    jmp free
.LBB24:
    xorl %eax, %eax
    movq %rax, %r12
    movq -24(%rbp), %rax
    movq %rax, -32(%rbp)
    jmp .LBB9
.LBB25:
    xorl %eax, %eax
    movq %rax, %r14
    movq %rax, -40(%rbp)
    movq -24(%rbp), %rax
    movq %rax, -48(%rbp)
    jmp .LBB13
.LBB26:
    xorl %eax, %eax
    movq %rax, %r15
    movq -8(%rbp), %rax
    movq %rax, -56(%rbp)
    jmp .LBB17
.LBB27:
    movq %r13, %rax
    movq %r13, -64(%rbp)
    jmp .LBB23
.cfi_endproc
.size shuffle, .-shuffle


.section .note.GNU-stack,"",@progbits
