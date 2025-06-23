#include <stdio.h>
int base = 3;
int expoente = 3;
int res;
int i;
int main(){
    i = expoente;
    res = 1;
    while(i > 0){
        res = res * base;
        i--; 
    }
    return res;
}