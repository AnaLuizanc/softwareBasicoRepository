.section .data
tamanho: .quad 7
vector: .quad 5, 20, 33, 80, 52, 10, 1
.section .text
.globl _start
_start:
    movq tamanho, %rcx           # rcx = tamanho do vetor
    movq $0, %rbx                # rbx = índice do vetor
    movq vector(,%rbx,8), %rdi   # rdi = maior (inicializa com o primeiro elemento)
    cmp $0, %rcx
    je _end

    decq %rcx                    # já considerou o primeiro elemento
    incq %rbx                    # aponta para o segundo elemento
    jmp _loop_check

_loop:
    movq vector(,%rbx,8), %rax   # rax = elemento atual
    cmp %rdi, %rax
    jle _loop_next               # se rax <= maior, pula
    movq %rax, %rdi              # senão, atualiza maior

_loop_next:
    incq %rbx                    # próximo índice
    decq %rcx

_loop_check:
    cmp $0, %rcx
    jne _loop

_end:
    movq $60, %rax
    syscall
