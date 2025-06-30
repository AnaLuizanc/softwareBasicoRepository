# Exemplos em Assembly

Esta pasta contém exemplos de programas em Assembly de nível intermediário, servindo como referência para a tradução de conceitos mais avançados a partir de códigos em C.

## Objetivo
Os exemplos aqui presentes auxiliam na compreensão de técnicas intermediárias, como uso de pilha, manipulação de laços, funções e operações aritméticas mais complexas.

## Exemplos

### [`factorial.s`](factorial.s)
Calcula fatorial usando pilha. Empilha valores de 5 até 1, depois desempilha multiplicando cada valor. Demonstra: manipulação de pilha, laços, operações aritméticas.

### [`expoentWithFunction.s`](expoentWithFunction.s)
Função de exponenciação para ser chamada por código C. Calcula base^expoente usando loop e multiplicação. Demonstra: funções, interoperabilidade C/Assembly, convenções de chamada.
```bash
# Exemplo: chamando função Assembly de código C
gcc intermediary_c/runExpoent.c expoentWithFunction.s -o runExpoentWithFunction.out
```

### [`sumFunction.s`](sumFunction.s)
Implementa função de soma usando variáveis globais. Define função `soma()` que adiciona duas variáveis globais A e B. Demonstra: funções em Assembly, variáveis globais, stack frame.

### [`runExpoentWithFunction.s`](runExpoentWithFunction.s)
Programa principal que chama a função `expoent()` para calcular 3². Demonstra: chamada de função Assembly, passagem de parâmetros via registradores, syscalls.
Para compilar: 
```bash
as expoentWithFunction.s -o expoentWithFunction.o
as runExpoentWithFunction.s -o runExpoentWithFunction.o
ld expoentWithFunction.o runExpoentWithFunction.o -o runExpoentWithFunction.out
```

## Sugestão de uso
- Analise o código Assembly para entender a lógica e estrutura.
- Compare com o exemplo em C na pasta `intermediary_c` para compreender a tradução entre as linguagens.
- Use como base para criar e testar suas próprias soluções intermediárias em Assembly.
