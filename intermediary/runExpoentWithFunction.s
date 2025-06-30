.section .data
.section .text
.globl _start
_start:
    movq $3, %rdi # base
    movq $2, %rsi # expoente
    call expoent

    movq %rax, %rdi
    movq $60, %rax
    syscall

# para executar:
# as expoentWithFunction.s -o expoentWithFunction.o
# as runExpoentWithFunction.s  -o runExpoentWithFunction.o
# ld expoentWithFunction.o runExpoentWithFunction.o -o runExpoentWithFunction.out
# ./runExpoentWithFunction.out 
