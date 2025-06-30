# Exemplos em C

Esta pasta contém exemplos de códigos em linguagem C que servem como referência para a implementação de programas em Assembly de nível intermediário.

## Objetivo
Os exemplos aqui presentes auxiliam na compreensão de conceitos intermediários, como manipulação de funções, uso de pilha, entrada do usuário, operações aritméticas mais complexas, entre outros.

## Exemplos

### [`factorial.c`](factorial.c)
Calcula fatorial usando variáveis globais e laço `for`. Demonstra: variáveis globais, laços de repetição, operações aritméticas.

### [`sumFunction.c`](sumFunction.c)
Implementa função de soma usando variáveis globais. Demonstra: separação de funções, variáveis globais compartilhadas, chamada de função.

### [`runExpoent.c`](runExpoent.c)
Interface C para chamar função Assembly de exponenciação (4²=16). Demonstra: interoperabilidade C/Assembly, protótipos de função, compilação híbrida.

### [`functionCaller.c`](functionCaller.c)
Manipula ponteiros para trocar valores e fazer cálculos (resultado: 832093). Demonstra: ponteiros, passagem por referência, múltiplas operações aritméticas.

## Organização
- Cada arquivo `.c` aborda um conceito ou problema intermediário, servindo de base para a tradução e comparação com Assembly.
- Consulte o README da pasta Assembly correspondente para ver como cada exemplo foi implementado em baixo nível.

## Sugestão de uso
- Analise o código C para entender a lógica e estrutura.
- Utilize como referência para implementar a versão em Assembly.
- Compare os resultados e funcionamento para garantir a equivalência.
