#include <stdio.h>
#include <stdlib.h>

float *ler_matriz(int *N);
int alocacao(int N, int M);


int main()
{
    float *X, *Y;
    int N, M;

    X=ler_matriz(&N);
    Y=ler_matriz(&M);
    alocacao(N, M);

    return 0;
}

//FUNCAO 1
float *ler_matriz(int *N){
    float *X;
    printf("Quantos numeros no vetor:");scanf("%i", N);
    if((X=(float*)calloc(*N,sizeof(float))) == NULL) exit(1);
    for(int i=0;i<*N;i++){
        printf("[Valor %d]=", i+1);scanf("%f", &X[i]);
    }
    return X;
}

//FUNCAO 2
int alocacao(int N, int M){
    float X;
    if((X=(float)calloc(N*M,sizeof(float)))==NULL) exit(1);
}

//FUNCAO 3

//FUNCAO 4
