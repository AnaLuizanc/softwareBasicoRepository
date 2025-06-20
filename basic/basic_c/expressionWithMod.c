#include <stdio.h>
short int a = 7;
short int b = 10;
short int c = 15;
int r;
int main(){
    r = c % b * a;
    return r;
}