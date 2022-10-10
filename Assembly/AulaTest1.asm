.MODEL SMALL
.DATA
.CODE
MAIN PROC
    MOV AX,05
    MOV BX,09
    

;Finalização do programa    
    MOV AH,4CH          ;Finaliza o programa
    INT 21H             ;Executa a finalização
MAIN ENDP
END MAIN