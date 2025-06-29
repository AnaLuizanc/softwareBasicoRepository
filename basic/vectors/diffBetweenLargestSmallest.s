.section .data
tamanho: .quad 10
vector: .quad 15, 65, 74, 10, 5, 8, 97, 23, 45, 96
.section .text
.globl _start
_start:
    movq tamanho, %rcx                  # rcx = tamanho do vetor
    movq $0, %rbx                       # rbx = índice do vetor
    movq vector(,%rbx,8), %rdi          # rdi = maior (primeiro elemento)
    movq vector(,%rbx,8), %r12          # r12 = menor (primeiro elemento)
    cmpq $0, %rcx
    je _end

    decq %rcx                           # já considerou o primeiro elemento
    incq %rbx                           # aponta para o segundo elemento
    jmp _loop_check

_loop:
    movq vector(,%rbx,8), %rax          # rax = elemento atual
    cmpq %rdi, %rax
    jle _check_menor                    # se rax <= maior, verifica menor
    movq %rax, %rdi                     # senão, atualiza maior

_check_menor:
    cmpq %r12, %rax
    jge _loop_next                      # se rax >= menor, pula
    movq %rax, %r12                     # senão, atualiza menor

_loop_next:
    incq %rbx                           # próximo índice
    decq %rcx

_loop_check:
    cmpq $0, %rcx
    jne _loop

_end:
    subq %r12, %rdi                     # rdi = maior - menor
    movq $60, %rax
    syscall
