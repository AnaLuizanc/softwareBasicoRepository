.section .data
tamanho: .quad 7
vector: .quad 5, 20, 33, 80, 52, 10, 1
.section .text
.globl _start
_start:
    movq tamanho, %rcx           # rcx = tamanho do vetor
    movq $vector, %rbx           # rbx = endereço do vetor
    movq (%rbx), %rdi            # rdi = maior (inicializa com o primeiro elemento)
    cmp $0, %rcx
    je _end

    decq %rcx                    # já considerou o primeiro elemento
    addq $8, %rbx                # aponta para o segundo elemento
    jmp _loop_check

_loop:
    movq (%rbx), %rax            # rax = elemento atual
    cmp %rdi, %rax
    jle _loop_next               # se rax <= maior, pula
    movq %rax, %rdi              # senão, atualiza maior

_loop_next:
    addq $8, %rbx                # próximo elemento
    decq %rcx

_loop_check:
    cmp $0, %rcx
    jne _loop

_end:
    movq $60, %rax
    syscall
