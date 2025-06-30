# Programa para converter string para inteiro para mostrar no terminal
# Entrada: RDI = inteiro
# Saída:  RSI = ponteiro para string (em buf)
#         RDX = tamanho da string

.section .data
buf: .space 12           # buffer para string 

.section .text
.global int_to_str

int_to_str:
    pushq %rbp
    movq %rsp, %rbp
    pushq %rbx
    pushq %r8
    pushq %r9
    pushq %r10
    pushq %r11

    movq $buf, %rsi      # rsi = ponteiro para buf
    movq %rsi, %rcx      # rcx = início do buf
    movq %rdi, %rax      # rax = valor
    movq $0, %rdx        # rdx = contador de dígitos
    movq $0, %rbx        # rbx = flag negativo
    
    cmpq $0, %rax
    jge .int_to_str_abs
    negq %rax
    movb $'-', (%rsi)
    incq %rsi
    movq $1, %rbx        # flag negativo

.int_to_str_abs:
    movq %rax, %r8       # r8 = valor absoluto
    movq %rsi, %r9       # r9 = ptr para escrita
    cmpq $0, %r8
    jne .int_to_str_loop
    movb $'0', (%r9)
    incq %r9
    jmp .int_to_str_done

.int_to_str_loop:
    movq %r8, %rax
    movq $10, %r10
    xorq %rdx, %rdx
    divq %r10            # rax = r8 / 10, rdx = r8 % 10
    addb $'0', %dl
    movb %dl, (%r9)
    incq %r9
    movq %rax, %r8
    cmpq $0, %r8
    jne .int_to_str_loop

.int_to_str_done:
    movb $0, (%r9)
    # inverter dígitos se necessário
    movq %rsi, %r10      # início dos dígitos
    movq %r9, %r11
    decq %r11            # fim dos dígitos
    cmpq %r10, %r11
    jbe .end

.rev_loop:
    movb (%r10), %al
    movb (%r11), %bl
    movb %bl, (%r10)
    movb %al, (%r11)
    incq %r10
    decq %r11
    cmpq %r10, %r11
    ja .rev_loop

.end:
    movq $buf, %rsi
    movq %r9, %rdx
    subq %rsi, %rdx      # rdx = tamanho da string
    popq %r11
    popq %r10
    popq %r9
    popq %r8
    popq %rbx
    popq %rbp
    ret
