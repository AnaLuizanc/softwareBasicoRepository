# Exemplos em Assembly

Esta pasta contém exemplos de programas em Assembly de nível intermediário, servindo como referência para a tradução de conceitos mais avançados a partir de códigos em C.

## Objetivo
Os exemplos aqui presentes auxiliam na compreensão de técnicas intermediárias, como uso de pilha, manipulação de laços, funções e operações aritméticas mais complexas.

## Exemplos

### [`factorial.s`](factorial.s)
Este exemplo calcula o fatorial de um número utilizando a pilha para armazenar os valores a serem multiplicados. O programa empilha todos os valores de `numero` até 1, depois desempilha e multiplica cada valor, acumulando o resultado em `rax`. O resultado final é retornado como código de saída. O código é útil para entender como implementar laços, manipulação de pilha e cálculo de fatorial em Assembly.

## Sugestão de uso
- Analise o código Assembly para entender a lógica e estrutura.
- Compare com o exemplo em C na pasta `intermediary_c` para compreender a tradução entre as linguagens.
- Use como base para criar e testar suas próprias soluções intermediárias em Assembly.
