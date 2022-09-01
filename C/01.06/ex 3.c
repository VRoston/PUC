#include <stdio.h>
#include <stdlib.h>
#define TAM 100

int comprimento(char S, int pos){
    if(S[pos]=='\0') return 0;
    return comprimento(S,pos+1)+1;
}

int main()
{
    int num, pos;
    char S[TAM];
    scanf("[^\n]", &S);
    num = comprimento(S,pos);

    return 0;
}
