#include <stdio.h>
#include <stdlib.h>

int main()
{
    float *Pvet, *Pmaior, *Pmenor;
    int N, i;
    do
    {
        printf("\nQuantos valores: ");scanf("%d", &N);
    } while (N<0);

    Pvet=(float*)calloc(N,sizeof(float));

    if (Pvet==NULL)
    {
        printf("Erro Aloc");
        exit(1);
    }
    
    printf("\nDigite %d Valores\n", N);

    for (i = 0; i < N; i++)
    {
        printf("[Valor %d]=", i+1);scanf("%f", &Pvet[i]);
    }

    Pmaior=Pvet;
    for (i = 0; i < N; i++)
    {
        if (Pvet[i]>*Pmaior)
        {
            Pmaior=&Pvet[i];
        }
    }

    Pmenor=Pvet;
    for (i = 0; i < N; i++)
    {
        if (Pvet[i]<*Pmenor)
        {
            Pmenor=&Pvet[i];
        }
        
    }
    

    printf("\nMaior valor = %.2f", *Pmaior);
    printf("\nMenor valor = %.2f", *Pmenor);
    
    
    
    

    return 0;
}
