;Victor de Melo Roston
;22006737
.MODEL SMALL
.DATA
.CODE
MAIN PROC

    
    ;Finalização do programa    
    MOV AH,4CH          ;Finaliza o programa
    INT 21H             ;Executa a finalização
MAIN ENDP
END MAIN