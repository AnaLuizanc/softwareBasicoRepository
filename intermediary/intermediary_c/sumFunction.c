#include <stdio.h>
long int a, b;
int soma (){
    return (a+b);
}

int main (long int argc, char **argv)
{
    a = 4;
    b = 5;
    soma();
    return b;
}