#include <stdio.h>
long int vetor[7] = {5,20,33,80,52,10,1};
long int maior;
int tamanho = 7, i;
int main(){
    maior = vetor[0];
    for(i = 1; i < tamanho; i++){
        if(maior < vetor[i])
            maior = vetor[i];
    }
    return maior;
}