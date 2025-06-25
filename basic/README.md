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

- [`calculateExpoent.s`](calculateExpoent.s):
  Calcula a potência de uma base elevada a um expoente usando um laço, equivalente à expressão `res = base^expoente`. O programa multiplica o resultado acumulado pela base e decrementa o expoente até chegar a zero. Referência: [`basic_c/calculateExpoent.c`](basic_c/calculateExpoent.c).

- [`calculateFactorial.s`](calculateFactorial.s):
  Calcula o fatorial de um número usando um laço, multiplicando o resultado acumulado pelo valor do contador e decrementando até chegar a 1. O resultado é retornado como código de saída. Referência: [`basic_c/calculateFactorial.c`](basic_c/calculateFactorial.c).

- [`isEven.s`](isEven.s):
  Verifica se o valor armazenado em `numero` é par ou ímpar utilizando o resto da divisão por 2. Se for par, retorna 1 como código de saída; se for ímpar, retorna 0. Referência: [`basic_c/isEven.c`](basic_c/isEven.c).

- [`theLargest.s`](theLargest.s):
  Percorre um vetor de inteiros e encontra o maior valor presente. O resultado é retornado como código de saída. Útil para entender laços, comparações e manipulação de vetores em Assembly. Referência: [`basic_c/theLargest.c`](basic_c/theLargest.c).

- [`theLargest2.s`](theLargest2.s):
  Variante do algoritmo de busca do maior valor em um vetor, utilizando indexação explícita para acessar os elementos. O maior valor é atualizado conforme o vetor é percorrido. Útil para comparar diferentes formas de percorrer e acessar vetores em Assembly.

- [`theLargest3.s`](theLargest3.s):
  Outra variação do algoritmo de busca do maior valor, demonstrando diferentes estratégias de indexação e inicialização do maior valor. Permite comparar abordagens e reforçar o entendimento sobre manipulação de índices e acesso a memória em Assembly.

- [`diffBetweenLargestSmallest.s`](diffBetweenLargestSmallest.s):
  Percorre um vetor de inteiros, encontra o maior e o menor valor e retorna a diferença entre eles como código de saída. Útil para estudar buscas múltiplas em vetores e operações de comparação em Assembly. Referência: [`basic_c/diffBetweenLargestSmallest.c`](basic_c/diffBetweenLargestSmallest.c).

Consulte cada arquivo `.s` para detalhes da implementação e compare com o respectivo código em C na pasta `basic_c` para entender a tradução entre as linguagens.
