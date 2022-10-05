;Victor de Melo Roston
;22006737
.MODEL SMALL
.DATA
.CODE
MAIN PROC
;A)(+6)-(+4)
    MOV AL,06       ;AL recebe 06 decimal
    SUB AL,04       ;Subtrai 04 decimal de AL

;B)(+7)+(+2)
    MOV AL,07       ;AL recebe 07 decimal
    ADD AL,02       ;Soma 02 em AL

;C)(-6)+(-6)
    MOV BL,06       ;BL recebe 06 decimal
    NEG BL          ;Negativa 06
    MOV CL,06       ;
    NEG CL          ;
    ADD BL,CL       ;Faz a soma

;D)(-8)-(-3)
    MOV BH,08       ;BH recebe 08 decimal
    NEG BH          ;Negativa 08
    MOV BL,03       ;
    NEG BL          ;
    SUB BH,BL       ;Faz a subtração

;Finalização do programa    
    MOV AH,4CH          ;Finaliza o programa
    INT 21H             ;Executa a finalização
MAIN ENDP
END MAIN