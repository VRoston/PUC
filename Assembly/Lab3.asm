;Aluno: Victor de Melo Roston
;RA: 22006737
.MODEL SMALL
.DATA
.CODE
MAIN PROC
    MOV AH,01               ;Comando de leitura
    INT 21H                 ;Lista de funcoes para executar o AH,01
    MOV BL,AL               ;Movimentar conteudo para BL
    SUB BL,30h              ;O valor lido esta em hexadecimal na posicao BL, entao subtraimos...
                            ;30h do valor em BL para resultar apenas o valor decimal
                            
    
    MOV AH,02               ;Comando para imprimir
    MOV DL,43               ;Imprime o caractere (mais)
    INT 21H                 ;Lista de funcoes para executar o AH,02
    
    MOV AH,01               ;Comando de leitura
    INT 21H                 ;Lista de funcoes para executar o AH,01
    MOV CL,AL               ;Movimentar conteudo para CL
    SUB CL,30h              ;O valor lido esta em hexadecimal na posicao CL, entao subtraimos...
                            ;30h do valor em CL para resultar apenas o valor decimal

    MOV AH,02               ;Comando para imprimir
    MOV DL,61               ;Imprime o caractere (igual)
    INT 21H                 ;Lista de funcoes para executar o AH,02
    
    MOV AH,02               ;Comando para imprimir
    ADD BL,CL               ;Soma dos numeros da posicao CL em BL, e o resultado fica salvo em BL
    MOV DL,BL               ;Mover o conteudo da soma em BL para DL
    ADD DL,30h              ;O resultado gravado em DL esta em hexadecimal, entao subtraimos o...
                            ;30h para o resultado sair em hexadecimal
    INT 21H                 ;Lista de funcoes para executar o AH,02
    
    MOV AH,4CH              ;Encerra o programa
    INT 21H                 ;Lista de funcoes para executar o AH,4CH
MAIN ENDP
END MAIN