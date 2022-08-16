#include <stdio.h>
#include <stdlib.h>
///Jean Piton
///Victor de Melo Roston

float *ler(int *N);
void print(float *V, int N);
void medio(float *V, int N);

int main(){
    float *V;
    int N;
    V=ler(&N);
    print(V,N);
    medio(V,N);
    return 0;
}

float *ler(int *N){
    float *V;
    printf("Quantos numeros no vetor:");
    scanf("%i",N);
    if((V=(float*)calloc(*N,sizeof(float))) == NULL) exit(1);
    for(int i=0;i<*N;i++){
        printf("V[%i]:",i+1);
        scanf("%f",&V[i]);
    }
    return V;
}

void print(float *V, int N){
    for(int i=0;i<N;i++){
        printf("\nV[%i]:%.2f",i+1,V[i]);
    }
}

void medio(float *V, int N){
    float M=0;
    for(int i=0;i<N;i++){
        M+=V[i];
    }
    printf("\n\nMedia dos numeros do vetor:%.2f",M/N);
}
