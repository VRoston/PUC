#include <stdio.h>
#include <stdlib.h>

float *ler_vetor(int *N);
void maior_menor(float *X,int N,float **Pmaior,float **Pmenor);

///FUNÇÃO MAIN - Roteiro
int main()
{
    float *vetor, *Pmaior, *Pmenor;
    int N;
    vetor= ler_vetor(&N);
    maior_menor(vetor, N, &Pmaior, &Pmenor);
    printf("Maior: %.1f\nMenor: %.1f", *Pmaior, *Pmenor);
    return 0;
}

///FUNÇÃO 1 - Leitura de quantidade e valores
float *ler_vetor(int *N){
    float *X;
    printf("Quantos numeros no vetor:");scanf("%i", N);
    if((X=(float*)calloc(*N,sizeof(float))) == NULL) exit(1);
    for(int i=0;i<*N;i++){
        printf("[Valor %d]=", i+1);scanf("%f", &X[i]);
    }
    return X;
}

///FUNÇÃO 2 - Achar o maior e o menor valor do vetor
void maior_menor(float *X,int n,float **Pmaior,float **Pmenor){
    *Pmaior=*Pmenor=X;
    for(int i=0;i<n;i++){
        if((**Pmaior)<X[i]) *Pmaior=&X[i];
        if((**Pmenor)>X[i]) *Pmenor=&X[i];
    }
}
