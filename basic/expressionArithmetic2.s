.section .data
a: .byte -7
b: .byte 10
r: .long 0
.section .text
.globl _start
_start:
    movsbl b, %eax      # eax = (int)b
    imull $5, %eax      # eax = b * 5
    movsbl a, %ecx      # ecx = (int)a
    subl %eax, %ecx     # ecx = a - (b * 5)
    movl %ecx, r
    movl %ecx, %edi 
    movq $60, %rax
    syscall
