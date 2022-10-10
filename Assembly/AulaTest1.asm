.MODEL SMALL
.DATA
.CODE
MAIN PROC
    MOV AX,FF0A1H
    MOV BX,FF0B1h
    CMP AX,BX
     


;Finalização do programa    
    MOV AH,4CH          ;Finaliza o programa
    INT 21H             ;Executa a finalização
MAIN ENDP
END MAIN