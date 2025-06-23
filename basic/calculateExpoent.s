.section .data
base: .long 2
expoente: .long 5
res: .long 1
.section .text
.globl _start
_start:
    movl base, %ebx        # Carrega base em ebx
    movl expoente, %ecx    # Carrega expoente em ecx
    movl res, %eax         # Inicializa eax com res (acumulador)

_start_while:
    addl $0, %ecx          # Atualiza flags para ecx (necessário para jz)
    jz _end                # Se ecx == 0, termina o laço
    mull %ebx              # eax = eax * ebx (res = res * base)
    decl %ecx          
    jmp _start_while     

_end:
    movl %eax, %edi
    movq $60, %rax
    syscall 
