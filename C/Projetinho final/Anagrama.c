// Fernando Furlanetto Cardoso 22010196
// Jean Okabe Rezende Piton 22013310
// Tiago Gontijo Merighi 22001043
// Victor de Melo Roston 22006737
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <ctype.h>
#include <time.h>
#include <stdbool.h>

// 97 a 122
void tela(); // terminar
char *vetS();
void escolherP(char p[][11], char b[][11]);
void criarM(char p[][11],char matriz[]); // terminar dps de conseguir bancoP
void print(char pv[][11], int c1);

#define tamLista 60
// quantidade de palavras na lista com todas palavras
// string com todas palavras possíveis
char todasP[tamLista][11] = {
    {"arroz"},    {"feijao"},    {"batata"},    {"azul"},    {"carpa"},
    {"lugar"},    {"raiva"},     {"tronco"},    {"salto"},   {"inverno"},
    {"outono"},   {"primavera"}, {"sucesso"},   {"fonte"},   {"verao"},
    {"programa"}, {"balde"},     {"chocolate"}, {"pobre"},   {"rico"},
    {"recruta"},  {"capitao"},   {"cassetete"}, {"truque"},  {"truco"},
    {"banco"},    {"luva"},      {"lampada"},   {"ilha"},    {"pilha"},
    {"rolha"},    {"meia"},      {"leite"},     {"blusa"},   {"lasanha"},
    {"palito"},   {"dia"},       {"tarde"},     {"noite"},   {"madrugada"},
    {"reginaldo"},{"wagner"},    {"perfume"},   {"matriz"},  {"martelo"},
    {"romance"},  {"clube"},     {"palavra"},   {"semana"},  {"ano"},
    {"frio"},     {"calor"},     {"moeda"},     {"pendrive"},{"barriga"},
    {"software"}, {"mordomo"},   {"rosa"},      {"iphone"},  {"android"}};
#define tamBanco 30 
// quantidade de palavras no banco de respostas
char bancoP[tamBanco][11];
char matriz[100]="";

// Main
int main() {
  srand(time(NULL));
  char *g;
  do {
    tela();
    g = vetS();
  } while (g[0] != '\0');
  return 0;
}

void tela() {
  printf("JOGO");
  escolherP(todasP, bancoP);
  print(bancoP, tamBanco);
  criarM(bancoP,matriz);
  printf("\n%s",matriz);
}

void escolherP(char p[][11], char b[][11]){
    //random word(not repeat)
    int rw,c=0,flag=0;
    for(int i=0;i<tamBanco;i++){
        rw=rand()%tamLista;
        //palavra já escolhida
        for(int j=0;j<c;j++){
            if(strcmp(p[rw],b[j])==0){
                flag++;
            }
        }
        if(flag){
            i--;
            flag=0;
        }else{
            strcpy(b[c],p[rw]);
            c++;
        }
    }
}

void criarM(char p[][11],char matriz[]) { 
  char ch='a';
  int count,mcount,letra=122;
  for(int l=97;l<=letra;l++){
    ch=l;
    mcount=0;
    for(int i=0;i<tamBanco;i++){
      for (int j = 0; p[i][j] != '\0';j++) {
        if (ch == p[i][j])
          count++;
      }
      if(mcount<count)
        mcount=count;
      count=0;
    }
    for(int c=0;c<mcount;c++){
      strncat(matriz,&ch,1);
    }
  }
}

char *vetS() {
  char *s = NULL;
  int j = 0;
  do {
    if ((s = (char *)realloc(s, (j + 1) * sizeof(char))) == NULL)
      exit(1);
    scanf("%c", &s[j]);
  } while (s[j++] != '\n');
  return s[j - 1] = '\0';
}

void print(char pv[][11], int c1) {
  for (int i = 0; i < c1; i++) {
    printf("\n%i %s", i, pv[i]);
  }
}