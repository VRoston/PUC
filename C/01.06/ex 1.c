#include <stdio.h>
#include <stdlib.h>

int repetir(int X[], int n, int a);

int main()
{
    int n, a, i;
    printf("Quantidade de numeros:\n >"); scanf("%d", &n);
    printf("Qual valor vai repetir:\n >"); scanf("%d", &a);
    int X[n];
    for(i = 0; i < n; i++){
        printf("[%d]=", i+1);
        scanf("%d", &X[i]);
    }
    int repete = repetir(X, n, a);
    printf("Quantidade de vezes que repetiu:\n >%d", repete);

    return 0;
}

int repetir(int X[], int n, int a){
    if(n==0) return 0;
    if(X[n-1]==a) return repetir(X,n-1,a)+1;
    return repetir(X, n-1, a);
}