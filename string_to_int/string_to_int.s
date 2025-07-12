.section .data
str1: .asciz "123"
str2: .asciz "-456"
str3: .asciz "+789"
str4: .asciz "0"
buffer: .space 20
newline: .ascii "\n"
.section .text
.globl _start

_converte_string_para_int:
    pushq %rbx
    pushq %rcx
    pushq %rdx
    
    xorq %rax, %rax # acumulador = 0
    xorq %rbx, %rbx # flag negativo = 0
    movq %rdi, %rcx # ponteiro da string
    
    movzbq (%rcx), %rdx
    cmpq $'-', %rdx
    jne _verifica_sinal_positivo
    movq $1, %rbx
    incq %rcx
    jmp _converte_para_inteiro
    
_verifica_sinal_positivo:
    cmpq $'+', %rdx
    jne _converte_para_inteiro
    incq %rcx
    
_converte_para_inteiro:
    movzbq (%rcx), %rdx
    testq %rdx, %rdx
    jz _finaliza_conversao_p_int
    
    subq $'0', %rdx
    imulq $10, %rax
    addq %rdx, %rax
    
    incq %rcx
    jmp _converte_para_inteiro
    
_finaliza_conversao_p_int:
    testq %rbx, %rbx
    jz _done
    negq %rax

_done:
    popq %rdx
    popq %rcx
    popq %rbx
    ret

converte_int_para_string:
    pushq %rbx
    pushq %rcx
    pushq %rdx
    pushq %r8
    pushq %r9
    
    movq %rdi, %rax
    movq %rsi, %r8
    xorq %rbx, %rbx
    
    movq $0, %rcx
limpa_buffer:
    movb $0, (%r8, %rcx)
    incq %rcx
    cmpq $20, %rcx
    jl limpa_buffer
    
    testq %rax, %rax
    jnz nao_eh_zero 
    movb $'0', (%rsi) # executa se for 0
    movq %rsi, %rax
    jmp end
    
nao_eh_zero:
    testq %rax, %rax
    jns numero_absoluto
    negq %rax
    movq $1, %rbx

numero_absoluto:
    movq %rsi, %r8
    addq $19, %r8 # aponta para o final do buffer
    movb $0, (%r8)
    decq %r8
    
    movq $10, %rcx

extrai_digitos_loop:
    xorq %rdx, %rdx
    divq %rcx # rdx = rax % 10
    addq $'0', %rdx
    movb %dl, (%r8)
    decq %r8
    testq %rax, %rax
    jnz extrai_digitos_loop
    
    cmpq $1, %rbx 
    jne finaliza_conversao
    movb $'-', (%r8) # adiciona sinal - se negativo
    decq %r8

finaliza_conversao:
    incq %r8  # aponta para o início da string
    movq %r8, %rax

end:
    popq %r9
    popq %r8
    popq %rdx
    popq %rcx
    popq %rbx
    ret

imprime:
    pushq %rax
    pushq %rdi
    pushq %rsi
    pushq %rdx
    pushq %rcx
    
    movq $buffer, %rsi
    call converte_int_para_string # converte número para string
    
    # Calcula o tamanho da string
    movq %rax, %rsi # ponteiro para início da string
    movq %rax, %rcx # copia o ponteiro
    xorq %rdx, %rdx # contador de caracteres
    
calc_tamanho:
    movzbq (%rcx), %rdi
    testq %rdi, %rdi
    jz print_string
    incq %rcx
    incq %rdx
    jmp calc_tamanho
    
print_string:
    movq $1, %rax
    movq $1, %rdi
    syscall
    
    movq $1, %rax
    movq $1, %rdi
    movq $newline, %rsi
    movq $1, %rdx
    syscall
    
    popq %rcx
    popq %rdx
    popq %rsi
    popq %rdi
    popq %rax
    ret

_start:
    movq $str1, %rdi
    call _converte_string_para_int
    movq %rax, %rdi
    call imprime
    
    movq $str2, %rdi
    call _converte_string_para_int
    movq %rax, %rdi
    call imprime

    movq $str3, %rdi
    call _converte_string_para_int
    movq %rax, %rdi
    call imprime

    movq $str4, %rdi
    call _converte_string_para_int
    movq %rax, %rdi
    call imprime
    
    movq $60, %rax
    movq $0, %rdi
    syscall
