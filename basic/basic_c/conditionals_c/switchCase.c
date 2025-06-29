#include <stdio.h>
unsigned char a;
unsigned char b;
int main(){
    a = 3;
    switch(a){
        case 1:
            b = 16;
            break;
        case 2:
            b = 202;
            break;
        case 3:
            b = 123;
            break;
    }
    return b;
}