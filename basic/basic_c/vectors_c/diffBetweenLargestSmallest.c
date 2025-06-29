#include <stdio.h>
long int vector[10] = {15,65,74,10,5,8,97,23,45,96};
int tamanho = 10, i;
int main(){
    long int maior = vector[0];
    long int menor = vector[0];
    for(i = 1; i < tamanho; i++){
        if(maior < vector[i])
            maior = vector[i];
        if(menor > vector[i])
            menor = vector[i];
    }
    return maior - menor;
}