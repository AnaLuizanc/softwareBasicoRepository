.section .data
numero: .quad 5
.section .text
.globl _start
_start:
    pushq $0                 # valor sentinela para parar o loop
    movq numero, %rax        # rax = número inicial

_pushNumeros:
    pushq %rax               # empilha o valor atual de rax
    decq %rax                # decrementa rax
    jnz _pushNumeros         # repete até rax == 0

    movq $1, %rax            # rax = 1 (acumulador para o resultado)

_multiply:
    popq %rcx                # recupera valor do topo da pilha
    cmpq $0, %rcx            # verifica se é o sentinela
    je _end                  # se sim, termina
    mulq %rcx                # rax = rax * rcx
    jmp _multiply            # repete até encontrar o sentinela

_end:
    movq %rax, %rdi
    movq $60, %rax
    syscall
