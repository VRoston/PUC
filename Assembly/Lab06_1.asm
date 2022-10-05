;Victor de Melo Roston
;22006737
.MODEL SMALL
.DATA
.CODE
MAIN PROC
    MOV CX,50           ;CX recebe 50 para realizar o loop 50 vezes
    
VOLTA:
        MOV AH,02       ;Imprimir na tela (Entrada DL, Retorna AL)
        MOV DL,42       ;Código ascii do asterisco
        INT 21H         ;Executa a função de impressão na tela
        LOOP VOLTA      ;Loop para imprimir os 10 asteriscos na mesma linha

    MOV AH,4CH          ;Finaliza o programa
    INT 21H             ;Executa a finalização
MAIN ENDP
END MAIN