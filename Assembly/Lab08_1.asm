;Victor de Melo Roston
;22006737
.MODEL SMALL
.DATA
.CODE
MAIN PROC
    MOV AL,06
    SUB AL,04

    MOV BL,07
    ADD BL,02

    MOV CL,06
    NEG CL
    MOV DS,06
    NEG DS
    SUB CL,DS

    
    
    
    
    MOV AH,4CH          ;Finaliza o programa
    INT 21H             ;Executa a finalização
MAIN ENDP
END MAIN