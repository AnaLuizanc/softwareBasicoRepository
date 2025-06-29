# Programas em Assembly

Este diretório contém exemplos de programas escritos em Assembly, cada um implementando operações aritméticas ou lógicas inspiradas em códigos equivalentes escritos em C, disponíveis na pasta `basic_c`.

## Objetivo
Demonstrar como traduzir operações comuns de C para Assembly, incluindo manipulação de variáveis globais, operações aritméticas, precedência de operadores, uso de tipos diferentes e operações de módulo.

## Organização dos Arquivos

- `arithmetics/`: Operações aritméticas básicas e expressões
    - [`arithmetics.s`](arithmetics/arithmetics.s)
    - [`expressionArithmetic.s`](arithmetics/expressionArithmetic.s)
    - [`expressionArithmetic2.s`](arithmetics/expressionArithmetic2.s)
    - [`expressionWithMod.s`](arithmetics/expressionWithMod.s)
    - [`sumTwoVariables.s`](arithmetics/sumTwoVariables.s)

- `conditionals/`: Condicionais, switch/case, paridade
    - [`isEven.s`](conditionals/isEven.s)
    - [`switchCase.s`](conditionals/switchCase.s)
    - [`firstProgram.s`](conditionals/firstProgram.s)

- `loops/`: Estruturas de repetição, fatorial, potência
    - [`calculateExpoent.s`](loops/calculateExpoent.s)
    - [`calculateFactorial.s`](loops/calculateFactorial.s)

- `vectors/`: Manipulação de vetores, busca do maior, diferença entre maior e menor
    - [`diffBetweenLargestSmallest.s`](vectors/diffBetweenLargestSmallest.s)
    - [`theLargest.s`](vectors/theLargest.s)
    - [`theLargest2.s`](vectors/theLargest2.s)
    - [`theLargest3.s`](vectors/theLargest3.s)


Consulte cada arquivo `.s` para detalhes da implementação e compare com o respectivo código em C na pasta `basic_c` para entender a tradução entre as linguagens.
