# softwareBasicoRepository

Este repositório contém uma coleção de programas escritos em Assembly (x86_64, sintaxe AT&T/GNU Assembler) e exemplos equivalentes em linguagem C. O objetivo é servir como material de estudo para quem deseja aprender programação de baixo nível, comparando a lógica em C e sua implementação em Assembly.

---

## 📂 Estrutura dos Diretórios

| Pasta           | Conteúdo                                                              |
|-----------------|-----------------------------------------------------------------------|
| `basic/`        | Programas introdutórios em Assembly: operações aritméticas, loops, condicionais, manipulação de vetores. Cada exemplo Assembly possui referência ao respectivo código em C na pasta `basic_c/`. |
| `basic/basic_c/`| Exemplos em C correspondentes aos programas Assembly da pasta `basic/`. Úteis para consulta, comparação e tradução entre as linguagens. |
<!-- | `intermediario/`| Projetos com entrada do usuário, funções, operações aritméticas.      |
| `avancado/`     | Projetos que envolvem manipulação de arquivos, recursão, pilha, etc.  |
| `avancado/integracao_c/` | Integração entre C e Assembly via funções externas.         | -->

---

## 📚 Exemplos Disponíveis

Cada exemplo Assembly está documentado em seu respectivo README, com explicação da lógica, referência ao código em C e comentários no código para facilitar o entendimento.

---

## 🔧 Como Compilar e Executar

### Usando o `as` (sintaxe AT&T - padrão GNU):
```bash
as programa.s -o programa.o
ld programa.o -o programa.out
./programa.out
# O valor de retorno pode ser visto com:
echo $?
```

---

## 📖 Recomendações
- Consulte os READMEs das pastas para detalhes de cada exemplo.
- Compare os códigos em C e Assembly para entender a tradução entre as linguagens.
- Use os exemplos como base para criar e testar suas próprias soluções em Assembly.
