.section .text
.type reverse_subarray, @function
reverse_subarray:
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
    movq %rdi, %r14
    movq %rsi, %r13
    movq %rdx, -8(%rbp)
    movslq -8(%rbp), %rax
    movq %rax, -8(%rbp)
    movslq %esi, %rax
    shlq $2, %rax
    movq %rax, -24(%rbp)
    movq %rdi, %rcx
    addq %rdi, %rax
    movq %rax, -16(%rbp)
    movq %rsi, %r11
    movq -8(%rbp), %rax
    movq %rax, %r10
    movq -16(%rbp), %rax
    movq %rax, %r15
.LBB1:
    movslq %r11d, %rax
    movq %rax, %rbx
    movslq %r10d, %rax
    movq %rax, %r8
    cmpl %eax, %ebx
    jge .LBB3
.LBB2:
    movq %r15, %rcx
    movslq (%rcx), %rax
    movq %rax, %r9
    movq %r8, %rbx
    shlq $2, %rbx
    movq %rbx, %rax
    addq %r14, %rax
    movq %rax, %r13
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %rdx
    movq %r15, %rcx
    movl %edx, (%rcx)
    movq %r9, %rdx
    movq %r13, %rcx
    movl %edx, (%rcx)
    movq %r11, %rbx
    addq $1, %rbx
    movslq %ebx, %rax
    movq %rax, %rdi
    movq %r10, %r12
    subq $1, %r12
    movslq %r12d, %rax
    movq %rax, %rsi
    movq %r15, %rax
    leaq 4(%rax), %rax
    movq %rax, %r9
    movq %rdi, %r11
    movq %rsi, %r10
    movq %rax, %r15
    jmp .LBB1
.LBB3:
    movq -64(%rbp), %rbx
    movq -56(%rbp), %r12
    movq -48(%rbp), %r13
    movq -40(%rbp), %r14
    movq -32(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    ret
.cfi_endproc
.size reverse_subarray, .-reverse_subarray

.globl tectonic_shuffle
.type tectonic_shuffle, @function
tectonic_shuffle:
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
    movq %rdi, %r13
    movq %rsi, -8(%rbp)
    movslq -8(%rbp), %rax
    movq %rax, -8(%rbp)
    subl $1, %eax
    cltq
    movq %rax, -16(%rbp)
    movq %rax, %r14
    movq -8(%rbp), %rax
    subl $2, %eax
    cltq
    movq %rax, -24(%rbp)
    movq -8(%rbp), %rax
    cltq
    movq %rax, -56(%rbp)
    cmpl $3, %eax
    setl %al
    movzbq %al, %rax
    movq %rax, -32(%rbp)
    xorl %eax, %eax
    movq %rax, -40(%rbp)
.LBB5:
    movq -40(%rbp), %rax
    cltq
    movq %rax, -56(%rbp)
    cmpl $3, %eax
    jge .LBB8
.LBB6:
    movq -32(%rbp), %rax
    testq %rax, %rax
    je .LBB11
.LBB9:
    movq -112(%rbp), %rbx
    movq -104(%rbp), %r12
    movq -96(%rbp), %r13
    movq -88(%rbp), %r14
    movq -80(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    ret
.LBB11:
    xorl %eax, %eax
    call rand
    cltq
    movq -24(%rbp), %rcx
    cqto
    idivq %rcx
    movslq %edx, %rax
    addq $1, %rax
    cltq
    movq %rax, %r15
    subl $1, %eax
    cltq
    movq %rax, -56(%rbp)
    movq %rax, %r12
    xorl %eax, %eax
    movq %rax, %rbx
    movq %r13, %rax
    movq %r13, -48(%rbp)
.LBB15:
    movslq %ebx, %rax
    movq %rax, -56(%rbp)
    movslq %r12d, %rax
    movq %rax, %r8
    movq -56(%rbp), %rax
    cmpl %r8d, %eax
    jge .LBB18
.LBB16:
    movq -48(%rbp), %rcx
    movslq (%rcx), %rax
    movq %rax, %rsi
    movq %r8, %rax
    shlq $2, %rax
    movq %rax, -56(%rbp)
    addq %r13, %rax
    movq %rax, -64(%rbp)
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %rdx
    movq -48(%rbp), %rcx
    movl %edx, (%rcx)
    movq %rsi, %rdx
    movq -64(%rbp), %rcx
    movl %edx, (%rcx)
    movq %rbx, %rax
    addq $1, %rax
    cltq
    movq %rax, %rsi
    movq %r12, %rax
    subq $1, %rax
    cltq
    movq %rax, -64(%rbp)
    movq -48(%rbp), %rax
    leaq 4(%rax), %rax
    movq %rax, -56(%rbp)
    movq -64(%rbp), %rax
    movq %rax, %r12
    movq %rsi, %rbx
    movq -56(%rbp), %rax
    movq %rax, -48(%rbp)
    jmp .LBB15
.LBB18:
    movslq %r15d, %rax
    shlq $2, %rax
    movq %rax, -64(%rbp)
    movq %r13, %rcx
    addq %r13, %rax
    movq %rax, -56(%rbp)
    movq %r15, %r11
    movq %r14, %r10
    movq %rax, -48(%rbp)
.LBB20:
    movslq %r11d, %rax
    movq %rax, -56(%rbp)
    movslq %r10d, %rax
    movq %rax, %r9
    movq -56(%rbp), %rax
    cmpl %r9d, %eax
    jge .LBB23
.LBB21:
    movq -48(%rbp), %rcx
    movslq (%rcx), %rax
    movq %rax, %rsi
    movq %r9, %rax
    shlq $2, %rax
    movq %rax, -56(%rbp)
    addq %r13, %rax
    movq %rax, -64(%rbp)
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %rdx
    movq -48(%rbp), %rcx
    movl %edx, (%rcx)
    movq %rsi, %rdx
    movq -64(%rbp), %rcx
    movl %edx, (%rcx)
    movq %r11, %rax
    addq $1, %rax
    cltq
    movq %rax, %rsi
    movq %r10, %rax
    subq $1, %rax
    cltq
    movq %rax, -64(%rbp)
    movq -48(%rbp), %rax
    leaq 4(%rax), %rax
    movq %rax, -56(%rbp)
    movq %rsi, %r11
    movq -64(%rbp), %rax
    movq %rax, %r10
    movq -56(%rbp), %rax
    movq %rax, -48(%rbp)
    jmp .LBB20
.LBB23:
    xorl %eax, %eax
    call rand
    cltq
    movq -16(%rbp), %rcx
    cqto
    idivq %rcx
    movslq %edx, %rax
    addq $1, %rax
    cltq
    movq %rax, %r15
    subl $1, %eax
    cltq
    movq %rax, -56(%rbp)
    xorl %eax, %eax
    movq %rax, %rbx
    movq -56(%rbp), %rax
    movq %rax, %r12
    movq %r13, %rax
    movq %r13, -48(%rbp)
.LBB25:
    movslq %ebx, %rax
    movq %rax, %r9
    movslq %r12d, %rax
    movq %rax, %rdi
    cmpl %eax, %r9d
    jge .LBB28
.LBB26:
    movq -48(%rbp), %rcx
    movslq (%rcx), %rax
    movq %rax, %r8
    movq %rdi, %r9
    shlq $2, %r9
    movq %r9, %rax
    addq %r13, %rax
    movq %rax, -56(%rbp)
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %rdx
    movq -48(%rbp), %rcx
    movl %edx, (%rcx)
    movq %r8, %rdx
    movq -56(%rbp), %rcx
    movl %edx, (%rcx)
    movq %rbx, %r9
    addq $1, %r9
    movslq %r9d, %rax
    movq %rax, %rsi
    movq %r12, %r8
    subq $1, %r8
    movslq %r8d, %rax
    movq %rax, %r11
    movq -48(%rbp), %rax
    leaq 4(%rax), %rax
    movq %rax, %r10
    movq %rsi, %rbx
    movq %r11, %r12
    movq %rax, -48(%rbp)
    jmp .LBB25
.LBB28:
    movq %r13, %rdi
    movq %r15, %rsi
    movq %r14, %rax
    movq %r14, %rdx
    xorl %r14d, %eax
    call reverse_subarray
    movq %r13, %rax
    movq %r13, %rdi
    xorl %r13d, %eax
    movq %rax, %rsi
    movq %r14, %rax
    movq %r14, %rdx
    xorl %r14d, %eax
    call reverse_subarray
    movq -40(%rbp), %r9
    addq $1, %r9
    movslq %r9d, %rax
    movq %rax, %r8
    movq %rax, -40(%rbp)
    jmp .LBB5
.LBB8:
    movq -112(%rbp), %rbx
    movq -104(%rbp), %r12
    movq -96(%rbp), %r13
    movq -88(%rbp), %r14
    movq -80(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    ret
.cfi_endproc
.size tectonic_shuffle, .-tectonic_shuffle

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
    jmp tectonic_shuffle
.cfi_endproc
.size shuffle, .-shuffle


.section .note.GNU-stack,"",@progbits
