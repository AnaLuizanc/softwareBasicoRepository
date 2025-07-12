# softwareBasicoRepository

Este repositório contém uma coleção de programas escritos em Assembly (x86_64, sintaxe AT&T/GNU Assembler) e exemplos equivalentes em linguagem C. O objetivo é servir como material de estudo para quem deseja aprender programação de baixo nível, comparando a lógica em C e sua implementação em Assembly.

---

## 📂 Estrutura dos Diretórios

| Pasta                    | Conteúdo                                                              |
|--------------------------|-----------------------------------------------------------------------|
| `basic/`                 | Programas introdutórios em Assembly: operações aritméticas, loops, condicionais, manipulação de vetores. |
| `basic/basic_c/`         | Exemplos em C correspondentes aos programas Assembly da pasta `basic/`. Úteis para consulta, comparação e tradução entre as linguagens. |
| `intermediary/`          | Programas intermediários com funções, manipulação de pilha e conceitos mais avançados. |
| `intermediary/intermediary_c/` | Exemplos em C correspondentes aos programas Assembly da pasta `intermediary/`. |
| `string_to_int/`         | Projeto completo de conversão entre strings e inteiros. |

---

## 📚 Exemplos Disponíveis

Cada exemplo Assembly está documentado em seu respectivo README, com explicação da lógica, referência ao código em C e comentários no código para facilitar o entendimento.

---

## 🔧 Como Compilar e Executar

### Programas Assembly simples:
```bash
as programa.s -o programa.o
ld programa.o -o programa.out
./programa.out
# O valor de retorno pode ser visto com:
echo $?
```

## 📖 Recomendações
- Consulte os READMEs das pastas para detalhes de cada exemplo.
- Compare os códigos em C e Assembly para entender a tradução entre as linguagens.
- Use os exemplos como base para criar e testar suas próprias soluções em Assembly.
