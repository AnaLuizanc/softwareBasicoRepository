# String to Integer Conversion in x86_64 Assembly

Este projeto demonstra conversão entre strings e inteiros em Assembly x86_64, implementando algoritmos completos para ambas as direções de conversão.

## 📁 Estrutura do Projeto

```
string_to_int/
├── string_to_int.s    # Implementação completa das funções de conversão
└── README.md          # Este arquivo
```

## 🚀 Como Compilar e Executar

### Compilação:
```bash
as string_to_int.s -o string_to_int.o
ld string_to_int.o -o string_to_int
```

### Execução:
```bash
./string_to_int
```

## 📋 Funcionalidades Implementadas

### 1. `_converte_string_para_int`
Converte uma string para um valor inteiro.

**Parâmetros:**
- `RDI`: Ponteiro para a string de entrada

**Retorno:**
- `RAX`: Valor inteiro convertido

**Características:**
- ✅ Suporta números negativos (prefixo `-`)
- ✅ Suporta números positivos (prefixo `+` opcional)
- ✅ Ignora caracteres não numéricos após os dígitos válidos
- ✅ Trata strings vazias como zero

### 2. `converte_int_para_string`
Converte um valor inteiro para string.

**Parâmetros:**
- `RDI`: Valor inteiro a ser convertido
- `RSI`: Ponteiro para buffer de saída (mínimo 20 bytes)

**Retorno:**
- `RAX`: Ponteiro para o início da string no buffer

**Características:**
- ✅ Suporta números negativos
- ✅ Trata o caso especial do zero
- ✅ Usa buffer interno de 20 bytes
- ✅ String resultante é null-terminated

### 3. `imprime`
Função auxiliar para imprimir inteiros no terminal.

**Parâmetros:**
- `RDI`: Valor inteiro a ser impresso

**Funcionalidade:**
- Converte o inteiro para string
- Calcula automaticamente o tamanho
- Imprime no stdout seguido de quebra de linha

## 🔍 Exemplos de Teste

O programa testa automaticamente as seguintes conversões:

| String de Entrada | Resultado | Saída |
|-------------------|-----------|-------|
| `"123"`          | `123`     | `123` |
| `"-456"`         | `-456`    | `-456`|
| `"+789"`         | `789`     | `789` |
| `"0"`            | `0`       | `0`   |

### Saída Esperada:
```
123
-456
789
0
```

## 🛠️ Detalhes Técnicos

### Algoritmo String → Integer
1. **Análise de sinal**: Verifica prefixos `+` ou `-`
2. **Conversão por dígito**: 
   - Converte cada caractere ASCII (`'0'`-`'9'`) para valor numérico
   - Multiplica acumulador por 10 e adiciona novo dígito
3. **Aplicação de sinal**: Nega o resultado se necessário

### Algoritmo Integer → String
1. **Tratamento do zero**: Caso especial retorna `"0"`
2. **Número negativo**: Salva flag e trabalha com valor absoluto
3. **Extração de dígitos**: 
   - Usa divisão por 10 para extrair dígitos (ordem reversa)
   - Converte cada dígito para ASCII
4. **Construção final**: Adiciona sinal `-` se necessário

### Registradores Utilizados
- `RAX`: Acumulador principal e valor de retorno
- `RBX`: Flag para números negativos
- `RCX`: Ponteiro para posição atual na string
- `RDX`: Armazenamento temporário de caracteres/dígitos
- `RDI`/`RSI`: Parâmetros de entrada e ponteiros de buffer

## 📚 Conceitos Assembly Demonstrados

- **Manipulação de strings**: Traversal e processamento byte a byte
- **Operações aritméticas**: Multiplicação e divisão em Assembly
- **Gestão de pilha**: Preservação e restauração de registradores
- **Syscalls Linux**: Saída para terminal (sys_write, sys_exit)
- **Endereçamento**: Uso de ponteiros e offsets
- **Flags e condicionais**: Implementação de lógica de controle
- **Funções modulares**: Separação clara de responsabilidades