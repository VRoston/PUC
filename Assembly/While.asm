;Victor de Melo Roston
;22006737
.MODEL SMALL
.DATA
.CODE
MAIN PROC
VOLTA:
    MOV AH,01
    INT 21H
    CMP AL,"*"
    JZ FIM
    MOV AH,02
    MOV DL,AL
    INT 21H
    JMP VOLTA
FIM:
    ;Finalização do programa    
    MOV AH,4CH          ;Finaliza o programa
    INT 21H             ;Executa a finalização
MAIN ENDP
END MAIN