#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int main()
{
    char frase[100], *pc;
    int c=0;
    
    fflush(stdin);
    printf("Escreva a frase: ");scanf("%[^\n]", frase);

    pc=frase;

    while (*pc!='\0')
    {
        if (isalpha(*pc))
        {
            c++;
        }
        pc++;
    }

    printf("Total de letras: %d", c);
    
    return 0;
}
