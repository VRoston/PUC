#include <stdio.h>
#include <stdlib.h>
///Jean Piton
///Victor de Melo Roston

char *ler();
int contar(char *frase);

int main()
{
    char *frase = NULL;
    frase = ler();
    contar(frase);
    return 0;
}

char *ler(){
    int i=0;
    char *frase=NULL;
    printf("Digite uma frase:");
    do{
        if((frase = (char*) realloc(frase,(i+1)*sizeof(char))) == NULL) exit(1);
        scanf("%c",&frase[i]);
    }while(frase[i++]!= '\n');
    frase[i-1]='\0';
    return frase;
}

int contar(char *frase){
    int c=0;
    for(int i=0;i<strlen(frase);i++){
        switch (frase[i])
        {
        case 'A':
            c++;
            break;
        case 'a':
            c++;
            break;
        case 'E':
            c++;
            break;
        case 'e':
            c++;
            break;
        case 'I':
            c++;
            break;
        case 'i':
            c++;
            break;
        case 'O':
            c++;
            break;
        case 'o':
            c++;
            break;
        case 'U':
            c++;
            break;
        case 'u':
            c++;
            break;
        }
    }
    printf("\nNumero de vogais na frase:%i\n\n\n",c);
}