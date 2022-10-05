;Aluno: Victor de Melo Roston
;RA: 22006737
.MODEL SMALL
.DATA
.CODE
MAIN PROC
;Imprime (A-M)
    MOV AH,02               ;Comando para imprimir na tela
    MOV DL,65               ;Move para o registrador o codigo ascii do caractere
    VOLTA:
    INT 21H                 ;Executa a impressao do caracter da tabela ascii
    INC DL                  ;DL++, ele vai adicionar +1 ao DL a cada volta
    MOV BL,DL               ;Libera o DL e guarda as informacoes em BL
    MOV AH,02               ;Comando para imprimir na tela
    MOV DL,10               ;Adiciona um pular linha (10 da tabela ascii) em DL
    INT 21H                 ;Executa AH,02 que vai pular uma linha
    MOV DL,BL               ;Move o conteudo de BL para DL
    CMP DL,78               ;Compara o registrador DL com numero, caso DL<numero volta e repete o codigo,...
                            ;caso contrario ele prossegue o programa
    JNZ VOLTA               ;Volta para o inicio do loop (VOLTA)
    
;Pede para apertar uma tecla qualquer
    MOV AH,01               ;Comando para ler
    INT 21H                 ;Executa AH,01
    
;Imprime (N-Z)    
    MOV AH,02               ;Comando para imprimir na tela
    MOV DL,78               ;Move para o registrador o codigo ascii do caractere
    VOLTA2:
    INT 21H                 ;Executa a impressao do caracter da tabela ascii
    INC DL                  ;DL++, ele vai adicionar +1 ao DL a cada volta
    MOV BL,DL               ;Libera o DL e guarda as informacoes em BL
    MOV AH,02               ;Comando para imprimir na tela
    MOV DL,10               ;Adiciona um pular linha (10 da tabela ascii) em DL
    INT 21H                 ;Executa AH,02 que vai pular uma linha
    MOV DL,BL               ;Move o conteudo de BL para DL
    CMP DL,91               ;Compara o registrador DL com numero, caso DL<numero volta e repete o codigo,...
                            ;caso contrario ele prossegue o programa
    JNZ VOLTA2              ;Volta para o inicio do loop (VOLTA2)
    
;Pede para apertar uma tecla qualquer    
    MOV AH,01               ;Comando para ler
    INT 21H                 ;Executa AH,01
    
;Imprime (a-m)    
    MOV AH,02               ;Comando para imprimir na tela
    MOV DL,97               ;Move para o registrador o codigo ascii do caractere
    VOLTA3:
    INT 21H                 ;Executa a impressao do caracter da tabela ascii
    INC DL                  ;DL++, ele vai adicionar +1 ao DL a cada volta
    MOV BL,DL               ;Libera o DL e guarda as informacoes em BL
    MOV AH,02               ;Comando para imprimir na tela
    MOV DL,10               ;Adiciona um pular linha (10 da tabela ascii) em DL
    INT 21H                 ;Executa AH,02 que vai pular uma linha
    MOV DL,BL               ;Move o conteudo de BL para DL
    CMP DL,110              ;Compara o registrador DL com numero, caso DL<numero volta e repete o codigo,...
                            ;caso contrario ele prossegue o programa
    JNZ VOLTA3              ;Volta para o inicio do loop (VOLTA3)
    
;Pede para apertar uma tecla qualquer    
    MOV AH,01               ;Comando para ler
    INT 21H                 ;Executa AH,01
    
;imprime (n-z)    
    MOV AH,02               ;Comando para imprimir na tela
    MOV DL,110              ;Move para o registrador o codigo ascii do caractere
    VOLTA4:
    INT 21H                 ;Executa a impressao do caracter da tabela ascii
    INC DL                  ;DL++, ele vai adicionar +1 ao DL a cada volta
    MOV BL,DL               ;Libera o DL e guarda as informacoes em BL
    MOV AH,02               ;Comando para imprimir na tela
    MOV DL,10               ;Adiciona um pular linha (10 da tabela ascii) em DL
    INT 21H                 ;Executa AH,02 que vai pular uma linha
    MOV DL,BL               ;Move o conteudo de BL para DL
    CMP DL,123              ;Compara o registrador DL com numero, caso DL<numero volta e repete o codigo,...
                            ;caso contrario ele prossegue o programa
    JNZ VOLTA4              ;Volta para o inicio do loop (VOLTA4)
    
;Pede para apertar uma tecla qualquer    
    MOV AH,01               ;Comando para ler
    INT 21H                 ;Executa AH,01
    
;Imprime (0-9)
    MOV AH,02               ;Comando para imprimir na tela
    MOV DL,48               ;Move para o registrador o codigo ascii do caractere
    VOLTA5:
    INT 21H                 ;Executa a impressao do caracter da tabela ascii
    INC DL                  ;DL++, ele vai adicionar +1 ao DL a cada volta
    MOV BL,DL               ;Libera o DL e guarda as informacoes em BL
    MOV AH,02               ;Comando para imprimir na tela
    MOV DL,10               ;Adiciona um pular linha (10 da tabela ascii) em DL
    INT 21H                 ;Executa AH,02 que vai pular uma linha
    MOV DL,BL               ;Move o conteudo de BL para DL
    CMP DL,58               ;Compara o registrador DL com numero, caso DL<numero volta e repete o codigo,...
                            ;caso contrario ele prossegue o programa
    JNZ VOLTA5              ;Volta para o inicio do loop (VOLTA5)

    MOV AH,4CH              ;Encerra o programa
    INT 21H                 ;Lista de funcoes para executar o AH,4CH
MAIN ENDP
END MAIN