# String to Integer Conversion

Esta pasta contém um programa completo em Assembly x86_64 que demonstra como converter strings para inteiros e vice-versa, incluindo tratamento de sinais positivos e negativos.

## 📁 Arquivos

| Arquivo | Descrição |
|---------|-----------|
| [`main.s`](main.s) | Programa principal que testa as funções de conversão |
| [`string_to_int.s`](string_to_int.s) | Implementação da conversão de string para inteiro |
| [`int_to_string.s`](int_to_string.s) | Implementação da conversão de inteiro para string |
| [`Makefile`](Makefile) | Script de compilação automatizada |

## 🚀 Como Compilar e Executar

### Usando o Makefile (recomendado):
```bash
make          # Compila todos os arquivos
make run      # Compila e executa
make clean    # Remove arquivos compilados
```

### Compilação manual:
```bash
as string_to_int.s -o string_to_int.o
as int_to_string.s -o int_to_string.o
as main.s -o main.o
ld string_to_int.o int_to_string.o main.o -o main.out
./main.out
```

## 📋 Funcionalidades

### [`string_to_int`](string_to_int.s)
- **Entrada**: RDI = ponteiro para string
- **Saída**: RAX = valor inteiro convertido
- **Recursos**:
  - Ignora espaços em branco no início
  - Suporta sinais '+' e '-'
  - Converte apenas dígitos válidos (0-9)
  - Para na primeira ocorrência de caractere inválido

### [`int_to_str`](int_to_string.s)
- **Entrada**: RDI = valor inteiro
- **Saída**: RSI = ponteiro para string, RDX = tamanho da string
- **Recursos**:
  - Suporta números negativos
  - Trata o caso especial do zero
  - Usa buffer interno para armazenar o resultado

## 🔍 Exemplos de Teste

O programa principal [`main.s`](main.s) testa as seguintes conversões:

| String de Entrada | Resultado Esperado |
|-------------------|-------------------|
| `"123"`          | `123`             |
| `"-456"`         | `-456`            |
| `"+789"`         | `789`             |
| `"0"`            | `0`               |

## 🛠️ Detalhes Técnicos

### Algoritmo de Conversão String → Int
1. Pula espaços em branco iniciais
2. Verifica e processa sinais ('+' ou '-')
3. Converte cada dígito ASCII para valor numérico
4. Multiplica resultado por 10 e adiciona novo dígito
5. Aplica sinal negativo se necessário

### Algoritmo de Conversão Int → String
1. Trata números negativos separadamente
2. Extrai dígitos usando divisão por 10
3. Converte cada dígito para ASCII
4. Inverte a string resultante (dígitos são gerados em ordem reversa)

## 📚 Conceitos Demonstrados

- **Manipulação de strings**: Percorrer e processar caracteres
- **Conversão de tipos**: ASCII ↔ valores numéricos
- **Funções modulares**: Separação de responsabilidades
- **Tratamento de sinais**: Números positivos e negativos
- **Uso de pilha**: Preservação de registradores
- **Syscalls**: Saída para terminal
- **Linking**: Combinação de múltiplos arquivos objeto