# Programa para converter string para inteiro
# Entrada: RDI = ponteiro para string
# Saída:   RAX = valor inteiro convertido

.section .text
.global string_to_int

# Entrada: RSI = ponteiro para dígitos
# Saída:   RAX = valor inteiro convertido
convert_ascii:
    pushq %rbp
    movq %rsp, %rbp
    xorq %rax, %rax           # rax = resultado = 0
    .loop:
        movb (%rsi), %dl
        cmpb $0, %dl
        je .end_func
        cmpb $'0', %dl
        jb .end_func
        cmpb $'9', %dl
        ja .end_func
        imulq $10, %rax, %rax      # resultado = resultado * 10
        subb $'0', %dl
        movzbq %dl, %rdx
        addq %rdx, %rax           # resultado += (dl - '0')
        incq %rsi
        jmp .loop
    .end_func:
        popq %rbp
        ret

string_to_int:
    pushq %rbp
    movq %rsp, %rbp
    pushq %rbx          
    movq %rdi, %rsi          # rsi = ptr para string
    xorl %ebx, %ebx          # ebx = sinal (0=positivo, 1=negativo)

# Pular espaços em branco
.skip_spaces:
    movb (%rsi), %al
    cmpb $' ', %al
    je .inc_ptr
    cmpb $9, %al   
    je .inc_ptr
    jmp .check_sign
.inc_ptr:
    incq %rsi
    jmp .skip_spaces

.check_sign:
    movb (%rsi), %al
    cmpb $'-', %al
    jne .check_plus
    movb $1, %bl              # sinal negativo
    incq %rsi
    jmp .call_convert_ascii
.check_plus:
    cmpb $'+', %al
    jne .call_convert_ascii
    incq %rsi

.call_convert_ascii:
    call convert_ascii         # resultado em rax
    cmpb $1, %bl
    jne .end
    negq %rax                # se negativo, resultado = -resultado
.end:
    popq %rbx
    popq %rbp
    ret
