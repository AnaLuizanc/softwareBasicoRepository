.section .data
a: .byte 0
b: .byte 0
.section .text
.globl _start
_start:
    movb $3, a
    movb a, %al
    cmpb $1, %al
    je _case_1
    cmpb $2, %al
    je _case_2
    cmpb $3, %al
    je _case_3
    
_case_1:
    movb $16, %bl
    jmp _end

_case_2:
    movb $202, %bl
    jmp _end

_case_3:
    movb $123, %bl
    jmp _end

_end:
    movsbq %bl, %rdi
    movq $60, %rax
    syscall
    