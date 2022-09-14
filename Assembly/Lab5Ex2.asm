.MODEL SMALL
.DATA
.CODE
MAIN PROC
    MOV CX,5            ;BL recebe 5 para realizar o loop 5 vezes
VOLTA1:
    MOV DL,42           ;DL recebe '*' da tabela ascii
    MOV BX,CX           ;Move CX em BX para não haver conflito com os dois loops
    MOV CX,10           ;CX recebe o valor 10 para controlar a quantidade de asterisco na linha
VOLTA:
        MOV AH,02       ;Imprimir na tela (Entrada DL, Retorna AL)
        INT 21H         ;Executa a função de impressão na tela
        LOOP VOLTA      ;Loop para imprimir os 10 asteriscos na mesma linha
    MOV CX,BX           ;Retorna o valor antigo de CX que estava salvo em BX
    MOV AH,01           ;Entrade de um caractere para não imprimir todos os asteriscos de uma vez
    INT 21H             ;Executa a entrada de um caractere
    LOOP VOLTA1         ;Loop para imprimir os asteriscos na linha de baixo

    MOV AH,4CH          ;Finaliza o programa
    INT 21H             ;Executa a finalização
MAIN ENDP
END MAIN