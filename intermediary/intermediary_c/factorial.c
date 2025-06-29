#include <stdio.h>
int numero = 5;
int res = 1, i;
int main(){
    for(i=numero; i>0; i--)
        res *= i;

    return res;
}