.section .data
a: .long 7
b: .long 10
r: .long 0
.section .text
.globl _start
_start:
    movl $2, %ebx
    movl b, %eax
    imull %ebx
    addl a, %eax
    movl %eax, r
    movl %eax, %edi
    movq $60, %rax
    syscall
