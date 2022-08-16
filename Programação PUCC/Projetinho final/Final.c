#include <stdio.h>
#include <string.h>
#include <ctype.h>

// declara as constantes
#define tam 51
#define limite_tentativas 35
#define limite_erros 5

int palavra_valida(char p_palavra[]) {
    // 0 palavra inválida contendo numeros / 1 palavra valida
    int retorno = 1;

    for (int i = 0; i < strlen(p_palavra); i++) {
        if (isalpha(p_palavra[i]) == 0) {
            retorno = 0;
            break;
        }
    }

    return retorno;
}

int valida_tentativa(char p_banco_palavras[tam][10], char p_palavra[], char p_tentativas_realizadas[tam][10]) {
    // retorna 0 se palavra tem numeros
    // 1 se palavra existe no banco
    // 2 se repetiu a palavra
    // 99 se palavra nao existe no banco
    
    // verifica se palavra tem numeros
    if (palavra_valida(p_palavra) == 0) {
        return 0;
    }

    // verifica se já realizou a tentativa
    for (int j = 0; j < tam; j++)
    {
        if (strcmp(p_palavra, p_tentativas_realizadas[j]) == 0) {
            // retorna que encontrou a palavra no banco
            return 2;
            break;
        }
    }

    // verifica se encontra a palavra no banco de palavras
    for (int i = 0; i < tam; i++) {
        if (strcmp(p_palavra, p_banco_palavras[i]) == 0) {
            // retorna que encontrou a palavra no banco
            return 1;
            break;
        }
    }
    
    // retorna que não encontrou a palavra no banco
    return 99;
}

void enunciado() {
    // imprime o ennciado
    printf("º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º\n\n");
    printf("-------------------------JOGO DE ANAGRAMAS-------------------------");
    printf("\n");
    printf("Regras:\n* utilizar as letras apresentadas no quadro para formar "
            "palavras (minimo de 4 letras)\n* encontras as %d ",tam);
    printf("palavras\n* apos 5 tentativas erradas o jogo terminara \n \n");
    printf("º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º-º\n\n");
}

void imprime_anagrama(char p_anagrama[tam][1]) {
    // apresenta o diagrama
    printf("\n\t    --- ANAGRAMA --- \n\n");
    int letra_anagrama = 0;
    for (int linha = 0; linha < 5; linha++)
    {
        for (int coluna = 0; coluna < 6; coluna++)
        {
            printf("%c\t", *p_anagrama[letra_anagrama++]);
        }
        printf("\n\n");
    }
    printf("\n");
}

int main () {
    // declara e carrega a variável do anagrama
    char anagrama[tam][1] = {'p', 'a', 'b', 'd', 'r', 'o', 't', 'e', 'f', 'g',
                             'a', 'r', 's', 's', 't', 'v', 'w', 'c', 'z', 'o',
                             'd', 'm', 's', 'h', 'a', 'i', 'n', 'e', 'l', 'u'};

    // declara a carrega o banco de palavras
    char banco_palavras[tam][10] = {
                                    "rolha",  "frio",    "balde", "arroz",   "lampada",   "batata",
                                    "banco",  "fonte",   "clube", "lasanha", "primavera", "software",
                                    "noite",  "pobre",   "moeda", "verao",   "sucesso",   "reginaldo",
                                    "tronco", "ilha",    "blusa", "salto",   "madrugada", "tarde",
                                    "raiva",  "recruta", "pilha", "iphone",  "perfume",   "dia",
                                    "selo", "selos", "telegrama", "rosto", "geleia", "geleca",
                                    "vela", "zombar", "estudar", "facil", "vara", "dodo", "tarado",
                                    "tarada", "zero", "zerar", "zerou", "triste", "tristeza", "canoa",
                                    "brasil"
                                    };

    // apresenta o encionado e o anagrama
    enunciado();
    imprime_anagrama(anagrama);   

    // declara quantidade de tentativas, erros e a palavra digitada
    int tentativas = 1, acertos = 0, erros = 0;
    char palavra[10];
    char tentativas_realizadas[tam][10];

    // verifica se ainda tem tentativas ou atingiu a cota de erros
    do {
        // recebe a palavra a ser validada
        printf("Digite a palavra com as letras do anagrama: ");
        scanf("%s", palavra);

        // valida a palavra
        int validacao;
        validacao = valida_tentativa(banco_palavras, palavra, tentativas_realizadas);
        switch (validacao)
        {
            case 0:
                printf("A palavra contem numeros. Isso e considerado um erro\n\n");
                erros++;
                break;

            case 1:
                printf("Parabens! Voce encontrou uma palavra no anagrama!\n\n");
                acertos++;
                break;
            
            case 2:
                printf("Essa palavra já fou utizada, tente novamente\n\n");
                break;

            default:
                printf("Infelizmente essa palavra nao e formada pelo anagrama. Isso e considerao um erro\n\n");
                erros++;
                break;
        }

        if (erros > limite_erros) {
            printf("\n\nInfelizmente você excedeu o limite de erros...até a próxima!\n");
            break;
        }

        printf("Tentativas: %d\t", tentativas);
        printf("Acertos: %d\t", acertos);
        printf("Erros: %d\t\n\n", erros);

        // trata as tentativas
        strcpy(tentativas_realizadas[tentativas], palavra);
        tentativas++;
    } while (tentativas <= limite_tentativas);
        
    return 0;
}