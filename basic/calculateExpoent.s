.section .data
base: .long 2
expoente: .long 5
res: .long 1
.section .text
.globl _start
_start:
    movl base, %ebx
    movl expoente, %ecx
    movl res, %eax

_start_while:
    addl $0, %ecx
    jz _end
    mull %ebx
    decl %ecx
    jmp _start_while

_end:
    movl %eax, %edi
    movq $60, %rax
    syscall 
