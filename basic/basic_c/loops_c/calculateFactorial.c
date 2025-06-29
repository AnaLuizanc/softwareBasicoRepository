#include <stdio.h>
int fatorial = 5;
int res = 1;
int main(){
    while(fatorial > 0){
        res = res * fatorial;
        fatorial--;
    }
    return res;
}