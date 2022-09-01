#include <stdio.h>
#include <stdlib.h>

int maior(int x[], int n);

int main()
{
    int n, i;
    printf("Quantidade de numeros:\n >"); scanf("%d", &n);
    int x[n];
    for(i = 0; i < n; i++){
        printf("[%d]=", i+1);
        scanf("%d", &x[i]);
    }
    int ma = maior (x, n);
    printf("Maior valor:\n >%d", ma);
    return 0;
}

int maior(int x[], int n){
    if(n==0) return 0;
    if(x[n]>maior(x,n-1)) return x[n];
    return maior(x,n-1);
}