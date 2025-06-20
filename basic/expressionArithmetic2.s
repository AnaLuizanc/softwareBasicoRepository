.section .data
a: .byte -7
b: .byte 10
r: .long 0
.section .text
.globl _start
_start:
    movb $5, %bl
    movb b, %al
    imulb %bl
    subb a, %al
    movb %al, r
    movzxb %al, %edi
    movq $60, %rax
    syscall
