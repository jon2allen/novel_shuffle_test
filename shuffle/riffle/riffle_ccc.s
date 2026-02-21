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
    subq $176, %rsp
    movq %rbx, -176(%rbp)
    movq %r12, -168(%rbp)
    movq %r13, -160(%rbp)
    movq %r14, -152(%rbp)
    movq %r15, -144(%rbp)
    movq %rdi, -8(%rbp)
    movq %rsi, %rax
    movq %rsi, -16(%rbp)
    movq %rsi, -24(%rbp)
    cmpq $1, %rsi
    ja .LBB3
.LBB1:
    movq -176(%rbp), %rbx
    movq -168(%rbp), %r12
    movq -160(%rbp), %r13
    movq -152(%rbp), %r14
    movq -144(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    ret
.LBB3:
    movq -24(%rbp), %rax
    shlq $2, %rax
    movq %rax, -32(%rbp)
    movq %rax, %rdi
    xorl %eax, %eax
    call malloc
    movq %rax, -40(%rbp)
    testq %rax, %rax
    jne .LBB7
.LBB5:
    movq -176(%rbp), %rbx
    movq -168(%rbp), %r12
    movq -160(%rbp), %r13
    movq -152(%rbp), %r14
    movq -144(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    ret
.LBB7:
    movq -24(%rbp), %rax
    shrq $1, %rax
    movq %rax, -48(%rbp)
    movq %rax, -104(%rbp)
    xorl %eax, %eax
    movq %rax, -56(%rbp)
    movq %rax, %r12
    movq %rax, %rbx
    movq %rax, -64(%rbp)
    movq -104(%rbp), %rax
    movq %rax, %r13
.LBB9:
    movq %r12, %r14
    cmpq -48(%rbp), %r12
    setb %al
    movzbq %al, %rax
    movq %rax, -72(%rbp)
    movq %r13, %r15
    cmpq -24(%rbp), %r13
    setb %al
    movzbq %al, %rax
    movq %rax, -80(%rbp)
    xorl %eax, %eax
    movq -80(%rbp), %rcx
    movq -72(%rbp), %rdx
    testq %rdx, %rdx
    cmovneq %rcx, %rax
    testq %rax, %rax
    je .LBB11
.LBB10:
    movq -64(%rbp), %rax
    cltq
    movq %rax, -104(%rbp)
    testl %eax, %eax
    jne .LBB24
.LBB14:
    xorl %eax, %eax
    call rand
    movq %rax, -104(%rbp)
    cltq
    movq %rax, -112(%rbp)
    movq %rax, -88(%rbp)
    movq $31, %rax
    movq %rax, -96(%rbp)
.LBB16:
    movq -88(%rbp), %rax
    andq $1, %rax
    testq %rax, %rax
    je .LBB18
.LBB17:
    movq %rbx, %rax
    addq $1, %rax
    movq %rax, %r9
    movq %rbx, %rax
    shlq $2, %rax
    addq -40(%rbp), %rax
    movq %rax, -104(%rbp)
    movq %r12, %rax
    addq $1, %rax
    movq %rax, -112(%rbp)
    movq %r14, %rax
    shlq $2, %rax
    movq %rax, -120(%rbp)
    addq -8(%rbp), %rax
    movq %rax, -128(%rbp)
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %rdx
    movq -104(%rbp), %rcx
    movl %edx, (%rcx)
    movq %r9, %r11
    movq -112(%rbp), %rax
    movq %rax, %r10
    movq %r13, %r8
    jmp .LBB19
.LBB18:
    movq %rbx, %rax
    addq $1, %rax
    movq %rax, %rdi
    movq %rbx, %rax
    shlq $2, %rax
    addq -40(%rbp), %rax
    movq %rax, -104(%rbp)
    movq %r13, %rax
    addq $1, %rax
    movq %rax, %rsi
    movq %r15, %rax
    shlq $2, %rax
    movq %rax, -112(%rbp)
    addq -8(%rbp), %rax
    movq %rax, -120(%rbp)
    movq %rax, %rcx
    movslq (%rcx), %rax
    movq %rax, %rdx
    movq -104(%rbp), %rcx
    movl %edx, (%rcx)
    movq %rdi, %r11
    movq %r12, %r10
    movq %rsi, %r8
.LBB19:
    movq -88(%rbp), %rdi
    sarl $1, %edi
    movslq %edi, %rdi
    movq -96(%rbp), %rsi
    subq $1, %rsi
    movslq %esi, %rax
    movq %rax, %r9
    movq %rdi, -56(%rbp)
    movq %r10, %r12
    movq %r11, %rbx
    movq %r9, %rax
    movq %r9, -64(%rbp)
    movq %r8, %r13
    jmp .LBB9
.LBB11:
    movq -72(%rbp), %rax
    testq %rax, %rax
    je .LBB21
.LBB20:
    movq %rbx, %rdi
    shlq $2, %rdi
    movq -40(%rbp), %rcx
    movq %rdi, %rax
    addq %rcx, %rax
    movq %rax, -104(%rbp)
    movq %r14, %r9
    shlq $2, %r9
    movq -8(%rbp), %rcx
    movq %r9, %rax
    addq %rcx, %rax
    movq %rax, -112(%rbp)
    movq -48(%rbp), %r11
    subq %r14, %r11
    movq %r11, %r10
    shlq $2, %r10
    movq %r10, -120(%rbp)
    movq -104(%rbp), %rax
    movq %rax, %rdi
    movq -112(%rbp), %rax
    movq %rax, %rsi
    movq -120(%rbp), %rax
    movq %rax, %rdx
    xorl %eax, %eax
    call memcpy
    jmp .LBB22
.LBB21:
    movq -80(%rbp), %rax
    testq %rax, %rax
    je .LBB22
.LBB23:
    movq %rbx, %r8
    movq %rbx, %rsi
    shlq $2, %rsi
    movq -40(%rbp), %rcx
    movq %rsi, %rax
    addq %rcx, %rax
    movq %rax, -104(%rbp)
    movq %r15, %rdi
    shlq $2, %rdi
    movq -8(%rbp), %rcx
    movq %rdi, %rax
    addq %rcx, %rax
    movq %rax, -112(%rbp)
    movq -24(%rbp), %r9
    subq %r15, %r9
    movq %r9, %r11
    shlq $2, %r11
    movq %r11, -120(%rbp)
    movq -104(%rbp), %rax
    movq %rax, %rdi
    movq -112(%rbp), %rax
    movq %rax, %rsi
    movq -120(%rbp), %rax
    movq %rax, %rdx
    xorl %eax, %eax
    call memcpy
.LBB22:
    movq -8(%rbp), %rax
    movq %rax, %rdi
    movq -40(%rbp), %rax
    movq %rax, %rsi
    movq -32(%rbp), %rax
    movq %rax, %rdx
    xorl %eax, %eax
    call memcpy
    movq -40(%rbp), %rax
    movq %rax, %rdi
    xorl %eax, %eax
    movq -176(%rbp), %rbx
    movq -168(%rbp), %r12
    movq -160(%rbp), %r13
    movq -152(%rbp), %r14
    movq -144(%rbp), %r15
    movq %rbp, %rsp
    popq %rbp
    jmp free
.LBB24:
    movq -56(%rbp), %rax
    movq %rax, -88(%rbp)
    movq -64(%rbp), %rax
    movq %rax, -96(%rbp)
    jmp .LBB16
.cfi_endproc
.size shuffle, .-shuffle


.section .note.GNU-stack,"",@progbits
