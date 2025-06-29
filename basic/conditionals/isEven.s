.section .data
numero: .long 1
.section .text
.globl _start
_start:
    movl numero, %eax     # carrega o valor de 'numero' em eax
    movl $2, %ebx         # carrega 2 em ebx (divisor)
    divl %ebx             # divide eax por ebx; quociente em eax, resto em edx
    cmpl $0, %edx         # compara o resto (edx) com 0
    je _is_equal          # se resto == 0, número é par
    movl $0, %edi         # se ímpar, retorna 0
    movq $60, %rax  
    syscall

_is_equal:
    movl $1, %edi         # se par, retorna 1
    movq $60, %rax 
    syscall
