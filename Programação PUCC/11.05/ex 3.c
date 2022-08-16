#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int main()
{
    int *x, *y, N, i, k;

    x=(int*)calloc(N,sizeof(int));
    y=(int*)calloc(N,sizeof(int));

    printf("Quantas contas?\n >"); scanf("%d", &N);
    printf("Multiplicado por "); scanf("%d", &k);

    for (i = 0; i < N; i++)
    {
        printf("[Valor %d]=", i+1); scanf("%d", &x[i]);
    }

    for (i = 0; i < N; i++)
    {
        y[i]=x[i]*k;
    }
    
    for (i = 0; i < N; i++)
    {
        printf("\nRes %d = %d", i+1, y[i]);
    }
    
    return 0;
}
