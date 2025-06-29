.section .data
a: .word 7
b: .word 10
c: .word 15
r: .long 0
.section .text
.globl _start
_start:
    movw c, %ax
    movw b, %bx
    idivw %bx           # %ax = c / b, %dx = c % b
    movw %dx, %ax       # %ax = resto
    movw a, %bx
    imulw %bx           # %ax = (c % b) * a
    movsx %ax, %ecx     # estende %ax para %ecx (32 bits, com sinal)
    movl %ecx, r        # r = resultado
    movw %ax, %di       # prepara código de saída
    movq $60, %rax
    syscall
