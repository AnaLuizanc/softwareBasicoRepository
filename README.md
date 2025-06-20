# softwareBasicoRepository

Este repositório contém uma coleção de programas escritos em linguagem Assembly com foco na arquitetura x86_64, usando a sintaxe AT&T (GNU Assembler). Os projetos estão organizados por nível de complexidade para facilitar o estudo progressivo.

---

## 📂 Estrutura dos Diretórios

| Pasta           | Conteúdo                                                              |
|-----------------|-----------------------------------------------------------------------|
| `basic/`       | Programas introdutórios: aritmética, loops e condicionais.   |
<!-- | `intermediario/`| Projetos com entrada do usuário, funções, operações aritméticas.      |
| `avancado/`     | Projetos que envolvem manipulação de arquivos, recursão, pilha, etc.  |
| `avancado/integracao_c/` | Integração entre C e Assembly via funções externas.         | -->

---

## 🔧 Como Compilar e Executar

### Usando o `as` (sintaxe AT&T - padrão GNU):
```bash
as programa.s -o programa.o
ld programa.o -o programa.out
./programa.out
