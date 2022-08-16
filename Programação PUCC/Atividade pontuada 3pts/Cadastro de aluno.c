#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

struct aluno{
    char ra[9];
    char nome[21];
    int idd;
    float nota;
};

void ler_alunos(struct aluno T[], int *n)
{
    printf("Numero de alunos:"); scanf("%d", n);
    for(int i=0; i<*n;i++){
        printf("[%d]", i+1);
        printf("RA: "); getchar(); scanf("%[^\n]", T[i].ra);
        printf("Nota:");scanf("%f", &T[i].nota);
}}

void imprime_aluno(struct aluno a){
    printf("RA: %s", a.ra);
    printf("Nota: %.1f", a.nota);
}

int busca(struct aluno T[], int n, char ra[]){
    for(int i=0;i<n;i++)
        if(strcmp(T[i].ra, ra)==0)
            return i;
    return -1;
}

int altera_nota(struct aluno T[], int n){
    char rab[9];
    int p;
    printf("RA: ");getchar();
    do{
        scanf("&[^\n]", rab);
            p=busca(T,n,rab);
    }while (p==-1);
    printf("Nota:");scanf("%f", &T[p].nota);
    return p;
    }

    int menu(){
        int esc;
            printf("\n[1] Cadastrar aluno");
            printf("\n[2] Alterar nota");
            printf("\n[3] Sair");
        do{
            printf("\nEscolha: _");scanf("%d", &esc);
        }while(esc<1||esc>3);
    return esc;        
    }

int main()
{
    struct aluno T[50];
    int N, esc, pos;
    while (1)
    {
        esc=menu();
        switch (esc)
        {
        case 1: ler_alunos(T,&N);break;
        case 2: pos = altera_nota(T,N);
        imprime_aluno(T[pos]); break;
        case 3: printf("Fim de Programa");
        return 0;
        }   
    }
    
    return 0;
}