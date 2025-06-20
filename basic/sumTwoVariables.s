.section .data
a: .quad 0
b: .quad 0
.section .text
.globl _start
_start:
    movq $7, a
    movq $8, b
    movq a, %rax
    movq b, %rbx
    addq %rbx, %rax
    movq %rax, %rdi
    movq $60, %rax
    syscall
