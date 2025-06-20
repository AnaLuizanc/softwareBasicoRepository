.section .data
buffer: .space 21   # espaço para string (20 dígitos + null)
newline: .asciz "\n"
.section .text
.globl _start
_start:
    movq $3, %rdi   ; rdi = 3
    movq %rdi, %rax ; rax = rdi
    addq %rdi, %rax ; rax = rax + rdi
    mulq %rdi 
    movq $2, %rdi   ; rdi = 2
    addq %rdi, %rax ; rax = rax + rdi
    movq $4, %rdi   ; rdi = 4
    mulq %rdi
    movq %rax, %rsi ; rsi = resultado

    # Para mostrar o resultado no terminal
    # Converter inteiro para string
    movq %rsi, %rax        # valor para converter
    movq $buffer+20, %rdi  # ponteiro para o final do buffer
    movb $0, (%rdi)        # null terminator
    movq $10, %rcx         # divisor
itoa_loop:
    decq %rdi
    xorq %rdx, %rdx
    divq %rcx              # rax = rax/10, rdx = resto
    addb $'0', %dl         # converte dígito para ASCII
    movb %dl, (%rdi)
    testq %rax, %rax
    jnz itoa_loop

    movq %rdi, %rsi        # ponteiro para início da string
    movq $buffer+20, %rdx  # fim do buffer
    subq %rsi, %rdx        # tamanho da string

    # Escrever no terminal
    movq $1, %rax          # syscall: write
    movq $1, %rdi          # fd: stdout
    # rsi já aponta para a string, rdx tem o tamanho
    syscall

    # Escrever newline
    movq $1, %rax
    movq $1, %rdi
    movq $newline, %rsi
    movq $1, %rdx
    syscall

    # Sair
    movq $60, %rax
    xorq %rdi, %rdi
    syscall
