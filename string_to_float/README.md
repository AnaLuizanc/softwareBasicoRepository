# Conversão String para Float em Assembly AMD64

Este projeto implementa um conversor de string para números de ponto flutuante (float) em Assembly x86_64, seguindo o padrão IEEE 754. O código demonstra técnicas avançadas de programação em baixo nível, incluindo manipulação de registradores SSE e conversões de tipos.

## 🚀 Como Compilar e Executar

### Compilação Manual:
```bash
# Assemblar o código
as --64 main.s -o main.o

# Linkar
ld main.o -o main

# Executar
./main
```

## 📋 Funcionalidades Implementadas

### 🔢 Conversão String → Float
- **Função**: `converte_string_para_float`
- **Entrada**: `%rdi` = ponteiro para string
- **Saída**: `%xmm0` = valor float (IEEE 754 32-bit)
- **Recursos**:
  - ✅ Suporta sinais '+' e '-'
  - ✅ Converte parte inteira e decimal
  - ✅ Validação de dígitos
  - ✅ Parada em caracteres inválidos

### 🖨️ Impressão de Float
- **Função**: `imprime_float`
- **Entrada**: `%xmm0` = valor float
- **Saída**: Impressão formatada no terminal
- **Formato**: `[-]inteiro.decimal\n`

### 🔄 Conversão Inteiro → String
- **Função**: `converte_int_para_string`
- **Entrada**: `%rdi` = inteiro, `%rsi` = buffer
- **Saída**: `%rax` = ponteiro para string
- **Recursos**:
  - ✅ Suporta números negativos
  - ✅ Tratamento especial para zero

## 🎯 Strings de Teste

O programa testa automaticamente as seguintes conversões:

| String    | Valor Float | Descrição                    |
|-----------|-------------|------------------------------|
| `"12.3"`  | 12.3        | Número positivo com decimal  |
| `"-45.6"` | -45.6       | Número negativo com decimal  |
| `"+78.9"` | 78.9        | Sinal positivo explícito     |
| `"0.0"`   | 0.0         | Zero com decimal             |

## 🔧 Arquitetura e Convenções

### Registradores Utilizados
- **Dados**: `%rax`, `%rbx`, `%rcx`, `%rdx`, `%r8`, `%r9`
- **Ponteiros**: `%rdi` (entrada), `%rsi` (buffer)
- **SSE**: `%xmm0`-`%xmm4` (operações float)
- **Pilha**: Preservação automática de registradores

### Convenções de Chamada
- **Entrada**: `%rdi` = primeiro parâmetro
- **Retorno**: `%rax` (inteiros) ou `%xmm0` (floats)
- **Preservação**: Registradores callee-saved preservados

### Seções de Memória
```assembly
.section .data     # Dados inicializados (strings de teste, constantes)
.section .rodata   # Dados somente leitura (constantes float)
.section .text     # Código executável
```

## 🛠️ Algoritmos Implementados

### Conversão String → Float

1. **Processamento de Sinal**:
   ```
   - Verifica primeiro caractere ('+', '-', ou dígito)
   - Define flag de negativo
   - Avança ponteiro se necessário
   ```

2. **Parte Inteira**:
   ```
   - Loop através dos dígitos
   - Multiplica resultado por 10
   - Adiciona novo dígito
   - Para no ponto decimal ou fim
   ```

3. **Parte Decimal**:
   ```
   - Loop após ponto decimal
   - Divide cada dígito por potência crescente de 10
   - Acumula na parte fracionária
   ```

4. **Finalização**:
   ```
   - Soma parte inteira + decimal
   - Aplica sinal negativo se necessário
   ```

### Conversão Inteiro → String

1. **Casos Especiais**:
   - Zero: retorna "0" diretamente
   - Negativos: processa valor absoluto e adiciona sinal

2. **Extração de Dígitos**:
   - Constrói string de trás para frente
   - Usa divisão por 10 para extrair dígitos
   - Converte para ASCII (+ '0')

## 🧪 Exemplo de Execução

```bash
$ ./main
12.3
-45.6
78.9
0.0
```

## 📚 Conceitos Demonstrados

### Assembly x86_64
- Instruções SSE para ponto flutuante
- Manipulação de pilha e registradores
- Endereçamento RIP-relative
- Syscalls Linux

### Programação Estruturada
- Funções modulares e reutilizáveis
- Separação clara de responsabilidades
- Tratamento de casos especiais

### IEEE 754
- Representação de números float (32-bit)
- Operações aritméticas em ponto flutuante
- Detecção e tratamento de sinais


**Nota**: Este é um projeto educacional focado em demonstrar conceitos de programação em Assembly AMD64 e manipulação de tipos de dados em baixo nível.