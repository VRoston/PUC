.MODEL SMALL
.DATA
.CODE
MAIN PROC
    MOV CX,5            ;BL recebe 5 para realizar o loop 5 vezes
VOLTA1:
    MOV DL,42           ;DL recebe '*' da tabela ascii
    MOV BH,10           ;BH recebe o valor 10 para controlar a quantidade de asterisco na linha 
VOLTA:
        MOV AH,02       ;Imprimir na tela (Entrada DL, Retorna AL)
        INT 21H         ;Executa a função de impressão na tela
        dec BH          ;Decrementa BH (BH--) para quando chegar a 0 terminar o loop
        JNZ VOLTA       ;Loop para imprimir os 10 asteriscos na mesma linha
    MOV AH,01           ;Apertar qualquer tecla
    INT 21H             ;Executa apertar qualquer tecla
    LOOP VOLTA1         ;Loop para imprimir os asteriscos na linha de baixo

    MOV AH,4CH          ;Finaliza o programa
    INT 21H             ;Executa a finalização
MAIN ENDP
END MAIN