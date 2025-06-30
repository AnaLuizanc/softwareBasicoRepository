# Programa principal que converte numeros em string para inteiro
.section .data
str1: .asciz "123"
str2: .asciz "-456"
str3: .asciz "+789"
str4: .asciz "0"
newline: .asciz "\n"

.section .text
.globl _start
.extern string_to_int
.extern int_to_str

# Entrada: RDI = ponteiro para string
# Saída: imprime o resultado da conversão + nova linha
test_and_print:
    pushq %rbp
    movq %rsp, %rbp
    pushq %rbx
    
    # Converte string para int
    call string_to_int       # resultado em rax
    movq %rax, %rdi          # prepara para int_to_str
    
    # Converte int para string para mostrar no terminal
    call int_to_str          # rsi=buf, rdx=len
    
    # Imprime o resultado
    movq $1, %rax            # syscall: write
    movq $1, %rdi            # fd = stdout
    # rsi e rdx já estão configurados pelo int_to_str
    syscall
    
    # imprime nova linha
    movq $1, %rax            # syscall: write
    movq $1, %rdi            # fd = stdout
    lea newline(%rip), %rsi # ponteiro para newline
    movq $1, %rdx            # tamanho = 1
    syscall
    popq %rbx
    popq %rbp
    ret

_start:
    # Teste 1: "123"
    lea str1(%rip), %rdi
    call test_and_print
    # Teste 2: "-456"
    lea str2(%rip), %rdi
    call test_and_print
    # Teste 3: "+789"
    lea str3(%rip), %rdi
    call test_and_print
    # Teste 4: "0"
    lea str4(%rip), %rdi
    call test_and_print
    movq $60, %rax        
    xorq  %rdi, %rdi    
    syscall
