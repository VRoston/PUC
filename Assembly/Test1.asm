.MODEL SMALL
.DATA
.CODE
MAIN PROC
    MOV BX,'k'
    MOV AX,'v'
    CMP AX,BX



;Finalização do programa    
    MOV AH,4CH          ;Finaliza o programa
    INT 21H             ;Executa a finalização
MAIN ENDP
END MAIN