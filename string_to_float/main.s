.section .data
str1: .asciz "12.3"
str2: .asciz "-45.6"
str3: .asciz "+78.9"
str4: .asciz "0.0"
buffer: .space 32
newline: .ascii "\n"
ten_f: .float 10.0
zero_f: .float 0.0
one_f: .float 1.0
minus_sign: .ascii "-"
dot_sign: .ascii "."
.section .text
.globl _start

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

_start:
    movq $str1, %rdi
    call converte_string_para_float
    call imprime_float
    
    movq $str2, %rdi
    call converte_string_para_float
    call imprime_float

    movq $str3, %rdi
    call converte_string_para_float
    call imprime_float

    movq $str4, %rdi
    call converte_string_para_float
    call imprime_float
    
    movq $60, %rax
    movq $0, %rdi
    syscall

converte_string_para_float:
    pushq %rbx
    pushq %rcx
    pushq %rdx
    
    movss zero_f(%rip), %xmm0 # resultado = 0.0
    movss zero_f(%rip), %xmm1 # parte fracionária = 0.0
    movss one_f(%rip), %xmm2 # divisor = 1.0
    movss ten_f(%rip), %xmm3 # constante 10.0
    
    xorq %rbx, %rbx # flag negativo = 0
    movq %rdi, %rcx # ponteiro da string
    
    call _processa_sinal
    call _processa_conversao_unificada
    
    addss %xmm1, %xmm0 # resultado += parte_fracionária
    call _aplica_sinal_float
    
    popq %rdx
    popq %rcx
    popq %rbx
    ret

imprime_float:
    pushq %rax
    pushq %rdi
    pushq %rsi
    pushq %rdx
    pushq %rcx
    pushq %r8
    
    movd %xmm0, %eax
    testl $0x80000000, %eax # verifica se é negativo
    jz _positive_float
    
    movq $1, %rax
    movq $1, %rdi
    movq $minus_sign, %rsi # imprime sinal negativo
    movq $1, %rdx
    syscall
    
    movss zero_f(%rip), %xmm1
    subss %xmm0, %xmm1
    movss %xmm1, %xmm0
    
_positive_float:
    cvttss2si %xmm0, %r8 # parte inteira
    cvtsi2ss %r8, %xmm1 # converte de volta para float
    subss %xmm1, %xmm0 # xmm0 = parte decimal
    
    # imprime parte inteira
    movq %r8, %rdi
    movq $buffer, %rsi
    call converte_int_para_string
    
    movq %rax, %rsi
    movq %rax, %rcx
    xorq %rdx, %rdx
    
_calc_int_size:
    movzbq (%rcx), %rdi
    testq %rdi, %rdi
    jz _print_int_part
    incq %rcx
    incq %rdx
    jmp _calc_int_size
    
_print_int_part:
    movq $1, %rax
    movq $1, %rdi
    syscall
    
    # imprime ponto decimal
    movq $1, %rax
    movq $1, %rdi
    movq $dot_sign, %rsi
    movq $1, %rdx
    syscall
    
    # imprime parte decimal
    movss .Lfloat_10(%rip), %xmm1
    mulss %xmm1, %xmm0
    cvttss2si %xmm0, %r8
    
    movq %r8, %rdi
    movq $buffer, %rsi
    call converte_int_para_string
    
    movq %rax, %rsi
    movq %rax, %rcx
    xorq %rdx, %rdx
    
_calcula_tamanho_decimal:
    movzbq (%rcx), %rdi
    testq %rdi, %rdi
    jz _print_parte_decimal
    incq %rcx
    incq %rdx
    jmp _calcula_tamanho_decimal
    
_print_parte_decimal:
    movq $1, %rax
    movq $1, %rdi
    syscall
    
    movq $1, %rax
    movq $1, %rdi
    movq $newline, %rsi
    movq $1, %rdx
    syscall
    
    popq %r8
    popq %rcx
    popq %rdx
    popq %rsi
    popq %rdi
    popq %rax
    ret

.section .rodata
.align 4
.Lfloat_10: .float 10.0

.section .text

# Função para processamento de conversão (float)
_processa_conversao_unificada:
    call _processa_parte_inteira_unificada
    
    movzbq (%rcx), %rdx
    cmpq $'.', %rdx
    jne _fim_conversao_unificada
    
    incq %rcx # pula o ponto decimal
    call _processa_parte_decimal_unificada
    
_fim_conversao_unificada:
    ret

# Função para conversão de parte inteira (float)
_processa_parte_inteira_unificada:
    pushq %rax
    pushq %rdx
    
_loop_parte_inteira_unificada:
    movzbq (%rcx), %rdx
    testq %rdx, %rdx
    jz _fim_parte_inteira_unificada # fim da string
    
    cmpq $'.', %rdx
    je _fim_parte_inteira_unificada # encontrou ponto decimal
    
    call _valida_e_converte_digito
    testq %rax, %rax
    jl _fim_parte_inteira_unificada # dígito inválido
    
    # Processa dígito (apenas float)
    mulss %xmm3, %xmm0
    cvtsi2ss %rax, %xmm4
    addss %xmm4, %xmm0
    
    incq %rcx # próximo caractere
    jmp _loop_parte_inteira_unificada
    
_fim_parte_inteira_unificada:
    popq %rdx
    popq %rax
    ret

# Função para conversão de parte decimal (apenas float)
_processa_parte_decimal_unificada:
    pushq %rax
    pushq %rdx
    
_loop_parte_decimal_unificada:
    movzbq (%rcx), %rdx
    testq %rdx, %rdx
    jz _fim_parte_decimal_unificada
    
    call _valida_e_converte_digito
    testq %rax, %rax
    jl _fim_parte_decimal_unificada 
    
    # Processa dígito (apenas float)
    mulss %xmm3, %xmm2
    cvtsi2ss %rax, %xmm4
    divss %xmm2, %xmm4
    addss %xmm4, %xmm1
    
    incq %rcx
    jmp _loop_parte_decimal_unificada
    
_fim_parte_decimal_unificada:
    popq %rdx
    popq %rax
    ret

# Função modular para validar e converter dígito
_valida_e_converte_digito:
    subq $'0', %rdx
    
    cmpq $0, %rdx
    jl _digito_invalido
    cmpq $9, %rdx
    jg _digito_invalido
    
    movq %rdx, %rax
    ret
    
_digito_invalido:
    movq $-1, %rax
    ret

# Função unificada para processamento de sinal
_processa_sinal:
    movzbq (%rcx), %rdx
    cmpq $'-', %rdx
    jne _verifica_sinal_positivo
    movq $1, %rbx
    incq %rcx
    ret
    
_verifica_sinal_positivo:
    cmpq $'+', %rdx
    jne _sem_sinal
    incq %rcx
    
_sem_sinal:
    ret

# Função para aplicar sinal negativo em float
_aplica_sinal_float:
    testq %rbx, %rbx
    jz _sem_negacao_float
    movss zero_f(%rip), %xmm4
    subss %xmm0, %xmm4
    movss %xmm4, %xmm0
_sem_negacao_float:
    ret
