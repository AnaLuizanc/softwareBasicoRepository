#include <stdio.h>
int base = 2;
int expoente = 5;
int res = 1;
int main(){
    while(expoente > 0){
        res = res * base;
        expoente--; 
    }
    return res;
}