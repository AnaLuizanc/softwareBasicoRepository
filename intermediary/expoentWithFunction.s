.globl expoent
.type expoente, @function
.section .text
expoent:
    enter $16, $0
    movq $1, %rax
    movq %rsi, -8(%rbp)

main_loop:
    mulq %rdi
    decq -8(%rbp)
    jnz main_loop

complete:
    leave
    ret
    