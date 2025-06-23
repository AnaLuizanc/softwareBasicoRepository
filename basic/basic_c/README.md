# Exemplos em C para Programação em Assembly

Esta pasta contém exemplos de códigos em linguagem C que servem como referência para a implementação de programas em Assembly. 

## Objetivo
Os exemplos aqui presentes auxiliam na compreensão da lógica e estrutura dos programas, facilitando a tradução para Assembly.

## Exemplos

### [`sumTwoVariables.c`](sumTwoVariables.c)
Este código declara duas variáveis globais do tipo `long int`, atribui valores a elas, realiza a soma e retorna o resultado. Ele serve como um exemplo simples de manipulação de variáveis globais e operações aritméticas básicas, facilitando a compreensão de como implementar lógica semelhante em Assembly.

### [`expressionArithmetic.c`](expressionArithmetic.c)
Este exemplo declara três variáveis globais do tipo `int`, realiza uma operação aritmética envolvendo soma e multiplicação (`r = a + b * 2`) e retorna o resultado. O código ilustra como expressões aritméticas com múltiplos operadores e precedência podem ser implementadas em Assembly, servindo como referência para tradução de expressões matemáticas mais complexas.

### [`expressionArithmetic2.c`](expressionArithmetic2.c)
Neste exemplo, duas variáveis globais do tipo `char` são declaradas e inicializadas, e uma variável global do tipo `int` é usada para armazenar o resultado. O programa realiza a operação aritmética `r = a - b * 5` e retorna o resultado. Este código é útil para entender como trabalhar com tipos de dados diferentes (char e int) e como implementar expressões envolvendo multiplicação e subtração em Assembly, incluindo o tratamento de valores negativos.

### [`expressionWithMod.c`](expressionWithMod.c)
Este exemplo utiliza variáveis globais do tipo `short int` e realiza a operação aritmética `r = c % b * a`, ou seja, calcula o resto da divisão de `c` por `b` e multiplica esse resultado por `a`. O código é útil para compreender como implementar operações de módulo e multiplicação em Assembly, além de mostrar o uso de diferentes tipos de dados.

### [`calculateExpoent.c`](calculateExpoent.c)
Este exemplo declara três variáveis globais do tipo `int` e utiliza um laço `while` para calcular a potência de uma base elevada a um expoente (`res = base^expoente`). A cada iteração, multiplica o resultado atual pela base e decrementa o expoente até que ele seja zero. O código é útil para entender como implementar laços e operações de exponenciação em Assembly.

