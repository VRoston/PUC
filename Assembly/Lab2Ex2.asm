;Aluno: Victor de Melo Roston
;RA: 22006737
.MODEL SMALL
.DATA
    AAAA DB 11,0, '???????????'
         DB '$'
.CODE
MAIN PROC
    MOV AX,@DATA            ;Inicializa o data/memoria
    MOV DS,AX
    
    MOV AH,0AH              ;faz a leitura dos caracteres e passa para a variavel
    MOV DX,OFFSET AAAA      ;atraves do endere?o que foi passado pelo DX
    INT 21H
    
    MOV AH,02               ;Imprime um caractere(enter) para pular de linha
    MOV DL,10
    INT 21H
    
    MOV AH,09               ;Imprime os caracteres da variavel atraves do endere?o
    MOV DX,OFFSET AAAA      ;que foi passsado para DX
    ADD DX,2
    INT 21H
    
    MOV AH,4CH              ;Encerra o programa
    INT 21H
MAIN ENDP
END MAIN