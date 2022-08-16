#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <windows.h>
#include <time.h>

int main()
{
    int i,j,k,ac=0,aux1=0;
    char Entrada[10]={0};
    char Letras[7]={'p','o','a','a','r','d','e'};
    int PalavrasCertas[15]={0};
    char Palavras[15][10]={"paredao","rodape","parado","podre","padre","podera","arpao","padrao","doera","depor","opera","pera","pardo","pedra","perdao"};

    printf("\n\n\n\n\n\n\n\n\n\n\t\t\t_________________________________________________________________________\n\n\t\t\t\t\t\t    Jogo do Anagrama\n\t\t\t\t\t\t       Divirta-se!\n\t\t\t_________________________________________________________________________");
    Sleep(3000);
    system("cls");
    for(i=0;ac<15;i++)
    {
        printf("\n\t\t\tJOGO DO ANAGRAMA\n\t\t      LETRAS:");
        for(k=0;k<7;k++)
        {
            printf(" %c",Letras[k]);
        }
        printf("\n\t\t\t   Acertos:%d\n_____________________________________________________________________________\n",ac);
        printf("\n\t\t\t  Tentativa. %d\nDigite a palavra:",i+1);
        fflush(stdin);
        scanf("%[^\n]",Entrada);
        for(k=0;k<10;k++)
        {
            Entrada[k]=tolower(Entrada[k]);
        }
        for(j=0,aux1=0;j<15;j++)
        {
            aux1=stricmp(Palavras[j],Entrada);
            if(aux1==0 && PalavrasCertas[j]!=1)
            {
                PalavrasCertas[j]++;
                ac++;
                break;
            }
        }
        system("cls");
    }
    if(ac==15)
        printf("\n Parabens!! Voce Acertou todos os anagramas!\n");
    return 0;
}