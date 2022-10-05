;Aluno: Victor de Melo Roston
;RA: 22006737
.MODEL SMALL
.CODE
main proc
    MOV AH,01           ;Ler o caractere
    INT 21H
    
    MOV BL,AL           ;Mover o conteudo de AL para BL
    
    MOV AH,02           
    MOV DL,10           ;Imprimir o (enter) para pular linha
    INT 21H
    
    MOV AH,02           ;Imprime um caracter(caracter inserido)
    MOV DL,BL
    INT 21H
    
    MOV AH,4CH          ;encerra o programa
    INT 21H
MAIN ENDP
END MAIN
    