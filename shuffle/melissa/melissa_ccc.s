.section .text
.globl melissa_shuffle_inplace
.type melissa_shuffle_inplace, @function
melissa_shuffle_inplace:
.cfi_startproc
    pushq %rbp
    .cfi_def_cfa_offset 16
    .cfi_offset %rbp, -16
    movq %rsp, %rbp
    .cfi_def_cfa_register %rbp
    subq $144, %rsp
    movq %rbx, -144(%rbp)
    movq %r12, -136(%rbp)
    movq %r13, -128(%rbp)
    movq %r14, -120(%rbp)
    movq %r15, -112(%rbp)
    movq %rdi, -8(%rbp)
    movq %rsi, %rax
    movq %rsi, -16(%rbp)
    movq %rsi, -24(%rbp)
    cmpq $1, %rsi
    ja .LBB3
.LBB1:
    movq -144(%rbp), %rbx
    movq -136(%rbp), %r12
    movq -128(%rbp), %r13
    movq -120(%rbp), %r14
    movq -112(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    ret
.LBB3:
    xorl %eax, %eax
    call rand
    cltq
    movl %eax, %eax
    movq -24(%rbp), %rcx
    imulq %rcx, %rax
    shrq $31, %rax
    shlq $2, %rax
    movq %rax, -96(%rbp)
    addq -8(%rbp), %rax
    movq %rax, -88(%rbp)
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, -96(%rbp)
    movq -24(%rbp), %rax
    subq $1, %rax
    movq %rax, -32(%rbp)
    movq %rax, -88(%rbp)
    movq -96(%rbp), %rax
    cltq
    movq %rax, -40(%rbp)
    xorl %eax, %eax
    movq %rax, %rbx
    movq %rax, -48(%rbp)
    movq -88(%rbp), %rax
    movq %rax, %r12
    xorl %eax, %eax
    movq %rax, -56(%rbp)
    movq %rax, %r13
.LBB5:
    movq %rbx, %r15
    movq %r12, %rax
    movq %r12, %r14
    cmpq %r12, %r15
    ja .LBB7
.LBB6:
    movq %r15, %rax
    shlq $2, %rax
    movq %rax, -88(%rbp)
    addq -8(%rbp), %rax
    movq %rax, -64(%rbp)
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %r11
    movq %rax, %r10
    cmpl -40(%rbp), %eax
    jge .LBB9
.LBB8:
    movq %r13, %rax
    shlq $2, %rax
    movq %rax, -96(%rbp)
    addq -8(%rbp), %rax
    movq %rax, -88(%rbp)
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %rdx
    movq -64(%rbp), %rcx
    movl %edx, (%rcx)
    movq %r11, %rdx
    movq -88(%rbp), %rcx
    movl %edx, (%rcx)
    movq %rbx, %rax
    addq $1, %rax
    movq %rax, -88(%rbp)
    movq %r13, %rax
    addq $1, %rax
    movq %rax, -96(%rbp)
    movq -88(%rbp), %rax
    movq %rax, %r8
    movq -48(%rbp), %rax
    movq %rax, %r9
    movq %r12, %rdi
    movq %r11, %rsi
    movq -96(%rbp), %rax
    movq %rax, -72(%rbp)
    jmp .LBB10
.LBB9:
    cmpl -40(%rbp), %r10d
    jle .LBB12
.LBB11:
    movq %r14, %rax
    shlq $2, %rax
    movq %rax, -88(%rbp)
    addq -8(%rbp), %rax
    movq %rax, -96(%rbp)
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %rdx
    movq -64(%rbp), %rcx
    movl %edx, (%rcx)
    movq %r11, %rax
    movq %r11, %rdx
    movq -96(%rbp), %rcx
    movl %edx, (%rcx)
    testq %r14, %r14
    je .LBB7
.LBB16:
    movq %r12, %rax
    subq $1, %rax
    movq %rax, -88(%rbp)
    movq %rax, %r10
    movq %rbx, -64(%rbp)
    movq %r11, %rax
    movq %r11, -80(%rbp)
    jmp .LBB13
.LBB12:
    movq %rbx, %rax
    addq $1, %rax
    movq %rax, %r11
    movq %r12, %r10
    movq %rax, -64(%rbp)
    movq -48(%rbp), %rax
    movq %rax, -80(%rbp)
.LBB13:
    movq -64(%rbp), %rax
    movq %rax, %r8
    movq -80(%rbp), %rax
    movq %rax, %r9
    movq %r10, %rdi
    movq -56(%rbp), %rax
    movq %rax, %rsi
    movq %r13, %rax
    movq %r13, -72(%rbp)
.LBB10:
    movq %r8, %rbx
    movq %r9, -48(%rbp)
    movq %rdi, %r12
    movq %rsi, -56(%rbp)
    movq -72(%rbp), %rax
    movq %rax, %r13
    jmp .LBB5
.LBB7:
    movq %r13, %rax
    movq %r13, %r11
    testq %r13, %r13
    je .LBB20
.LBB18:
    movq -8(%rbp), %rax
    movq %rax, %rdi
    movq %r13, %rax
    movq %r13, %rsi
    xorl %r13d, %eax
    call melissa_shuffle_inplace
.LBB20:
    cmpq -32(%rbp), %r14
    jae .LBB23
.LBB21:
    movq %r15, %r9
    shlq $2, %r9
    movq -8(%rbp), %rbx
    addq %r9, %rbx
    movq -24(%rbp), %rdi
    subq %r15, %rdi
    movq %rdi, %r12
    movq %rbx, %rdi
    movq %r12, %rax
    movq %r12, %rsi
    xorl %r12d, %eax
    call melissa_shuffle_inplace
.LBB23:
    movq -144(%rbp), %rbx
    movq -136(%rbp), %r12
    movq -128(%rbp), %r13
    movq -120(%rbp), %r14
    movq -112(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    ret
.cfi_endproc
.size melissa_shuffle_inplace, .-melissa_shuffle_inplace

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
    movq %rsi, %r12
    movq %rsi, %rax
    xorl %esi, %eax
    movq -16(%rbp), %rbx
    movq -8(%rbp), %r12
    movq %rbp, %rsp
    popq %rbp
    jmp melissa_shuffle_inplace
.cfi_endproc
.size shuffle, .-shuffle


.section .note.GNU-stack,"",@progbits
