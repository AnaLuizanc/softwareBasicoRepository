.section .data
fatorial: .long 5
res: .long 1
.section .text
.globl _start
_start:
    movl res, %eax         # eax = res (acumulador)
    movl fatorial, %ecx    # ecx = contador

_start_while:
    cmpl $1, %ecx          # compara ecx com 1
    jl _end                # se ecx < 1, termina
    mull %ecx              # eax = eax * ecx
    decl %ecx              # ecx--
    jmp _start_while       # repete o laço
    
_end:
    movl %eax, %edi
    movq $60, %rax
    syscall
