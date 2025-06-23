.section .data
numero: .long 1
.section .text
.globl _start
_start:
    movl numero, %eax
    movl $2, %ebx
    divl %ebx
    cmpl $0, %edx
    je _is_equal
    movl $0, %edi
    movq $60, %rax
    syscall

_is_equal:
    movl $1, %edi
    movq $60, %rax
    syscall 
