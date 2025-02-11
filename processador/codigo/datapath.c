#include <stdio.h>

int shiftLeft(int n, int v){
    
    while(v > 0){
        n = n << 1;
        v--;
    }

    return n;
}

int soma(int a, int b){
    return a + b;
}

int mult(int a, int b){
    int c = 0;

    while(b != 0){
        c = soma(c, a);
        b--;
    }

    return c;
}

int main(){
    int a = 7;
    int b = 6;

    if(b < 0){
        b *= -1;
    }

    if(!(a >= 0)){
        a *= -1;
    }

    int c = mult(a, b);

    int d = shiftLeft(2, 5);

    printf("%d, %d", c, d);

    return 0;
}