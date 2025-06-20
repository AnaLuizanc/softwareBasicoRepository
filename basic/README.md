# Programas em Assembly

Este diretório contém exemplos de programas escritos em Assembly, cada um implementando operações aritméticas ou lógicas inspiradas em códigos equivalentes escritos em C, disponíveis na pasta `basic_c`.

## Objetivo
Demonstrar como traduzir operações comuns de C para Assembly, incluindo manipulação de variáveis globais, operações aritméticas, precedência de operadores, uso de tipos diferentes e operações de módulo.

## Arquivos e Descrições

- [`firstProgram.s`](firstProgram.s):
  Exemplo introdutório de programa em Assembly, geralmente usado para ilustrar a estrutura básica de um programa (inicialização, finalização, etc).

- [`arithmetics.s`](arithmetics.s):
  Implementa operações aritméticas básicas, realizando uma sequência de somas e multiplicações.

- [`expressionArithmetic2.s`](expressionArithmetic2.s):
  Calcula a expressão `a - b * 5` utilizando variáveis globais do tipo `char` e armazena o resultado. Referência: [`basic_c/expressionArithmetic2.c`](basic_c/expressionArithmetic2.c).

- [`expressionWithMod.s`](expressionWithMod.s):
  Realiza a operação `r = c % b * a` com variáveis globais do tipo `short int`, demonstrando o uso de módulo e multiplicação em Assembly. Referência: [`basic_c/expressionWithMod.c`](basic_c/expressionWithMod.c).

Consulte cada arquivo `.s` para detalhes da implementação e compare com o respectivo código em C na pasta `basic_c` para entender a tradução entre as linguagens.
