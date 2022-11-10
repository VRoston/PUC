TITLE  LAB12  |  Aluno: Victor de Melo Roston  |  RA: 22006737

.MODEL SMALL
.DATA
 ; definindo a matriz 4x4 que recebera entrada de numeros no programa
    MATRIZ_ORIGINAL DW 4 DUP (?)
                    DW 4 DUP (?)
                    DW 4 DUP (?)
                    DW 4 DUP (?)

    MATRIZ_INVERTIDA DW 4 DUP (?)
                     DW 4 DUP (?)
                     DW 4 DUP (?)
                     DW 4 DUP (?)

 ; definindo as mensagens que vao ser exibidas1234567812345678
    MSG1 DB           ' ENTRADA MATRIZ 4x4:', '$'
    MSG2 DB 10, 13,   ' IMPRESSAO DA MATRIZ 4X4 ORIGINAL:', '$'
    MSG3 DB 10, 13,   ' IMPRESSAO DA MATRIZ 4X4 INVERTIDA:', '$'
    PULA_LINHA DB 10, 13, '$'

.CODE
MAIN PROC
    MOV AX, @DATA                       ; inicializa o DATA
    MOV DS, AX


    CALL COR_DE_FUNDO                   ; chama o procedimento para limpar a tela


    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    LEA DX, PULA_LINHA
    MOV AH, 09H
    INT 21H

    CALL LEITURA_DE_MATRIZ              ; chama o procedimento para leitura dos numeros da matriz 4x4


    LEA DX, PULA_LINHA
    MOV AH, 09H
    INT 21H
    
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    LEA DX, PULA_LINHA
    MOV AH, 09H
    INT 21H

    CALL IMPRIMIR_MATRIZ                ; imprime a matriz original, linha x coluna


    LEA DX, MSG3
    MOV AH, 09H
    INT 21H

    LEA DX, PULA_LINHA
    MOV AH, 09H
    INT 21H

    CALL IMPRIMIR_MATRIZ_INVERTIDA      ; inverte a ordem da impressao, coluna x linha

    MOV AH, 4CH
    INT 21H
MAIN ENDP

; entrada dos numeros que vao compor a matriz 4x4
LEITURA_DE_MATRIZ PROC

    XOR SI, SI
    MOV CL, 4
    MOV CH, 4

 LOOP_LINHA:
 LOOP_COLUNA:
    MOV AH, 1H                           ;input
    INT 21h

    AND AX, 00FFh                        ;mascara para pegar o apenas o input em AL
    SUB AX, 30h                          ;char para numero
    MOV MATRIZ_ORIGINAL[SI],AX           ;preenchimento da matriz

    ADD SI, 2                            ;index anda de 2 em 2
    DEC CH
    JNZ LOOP_COLUNA
    
    MOV CH,4
    DEC CL
    JNZ LOOP_LINHA

    RET                                 ; retorna a matriz lida na variavel matriz
LEITURA_DE_MATRIZ ENDP


; impressao da matriz original
IMPRIMIR_MATRIZ PROC

    MOV CH, 4                           ; LOOP1
    MOV CL, 4                           ; LOOP2

    XOR BX, BX                          ; index linha
    XOR SI, SI                          ; index coluna

    MOV AH, 2h
    LOOP2:
    LOOP1:
    MOV DX,MATRIZ_ORIGINAL[BX][SI]      ; elemento a ser impresso
    ADD DX, 30H                         ; numero para char
    INT 21H

    MOV DL, ' '
    INT 21H

    ADD SI, 2                           ; index coluna anda de 2 em 2
    DEC CH
    JNZ LOOP1

    XOR SI, SI                          ; index coluna reset
    ADD BX, 8                           ; index linha vai para proxima linha
    MOV CH, 4                           ; loop de coluna reset
    MOV DL, 10                          ; quebra de linha
    INT 21H

    DEC CL
    JNZ LOOP2

    RET                                 ; retorna o procedimento com a matriz impressa ne tela
IMPRIMIR_MATRIZ ENDP


; impressao da matriz invertida
IMPRIMIR_MATRIZ_INVERTIDA PROC

    ;inversão de matriz para matriz2
    MOV CH, 4                           ; loop coluna
    MOV CL, 4                           ; loop linha
    MOV BX, -2                          ; inicialização do index da matriz
    MOV DI, -8                          ; inicialização do index da matriz2

 LOOP4:
 LOOP3:
    ADD BX, 2                           ; index da matriz anda de 2 em 2
    ADD DI, 8                           ; index da matriz invertida anda de 8 em 8
    MOV DX, MATRIZ_ORIGINAL[BX]         ; passagem da matriz para matriz2
    MOV MATRIZ_INVERTIDA[DI],DX
    
    DEC CH
    JNZ LOOP3

    SUB DI, 30                          ; o index da próxima linha de uma matriz invertida se faz subtraindo 22, mas devido ao ADD 8 no inicio subtraimos 30
    MOV CH, 4
    DEC CL
    JNZ LOOP4

    ;mover matriz2 para a matriz

    MOV CH, 4                           ; loop coluna
    MOV CL, 4                           ; loop linha
    XOR BX, BX                          ; index linha
    XOR SI, SI                          ; index coluna
 LOOP6:
 LOOP5:
    MOV DX,MATRIZ_INVERTIDA[BX][SI]     ; passagem da matriz2 para matriz
    MOV MATRIZ_ORIGINAL[BX][SI],DX
    ADD SI, 2                           ; index de coluna anda de 2 em 2
    DEC CH
    JNZ LOOP5
    
    XOR SI, SI                          ; reset do index da coluna
    ADD BX, 8                           ; index da linha pula para próxima linha
    MOV CH, 4                           ; reset do loop de coluna
    DEC CL
    JNZ LOOP6

    CALL IMPRIMIR_MATRIZ

    RET
IMPRIMIR_MATRIZ_INVERTIDA ENDP


; apaga o conteudo impresso na tela e muda a cor de fundo
COR_DE_FUNDO PROC
 ; limpa a tela
    MOV AH,00       ; tipo de video
    MOV AL,03h      ; tipo de texto 80x25
    INT 10H         ; executa a entrada de video

 ; formata o modo de video
    MOV AH,09       ; escrever um caractere e atributo para a posicao do cursos
    MOV AL,20H      ; o caractere a mostrar
    MOV BH,00       ; numero da pagina
    MOV BL,0FH      ; atribuicao de cor
    MOV CX,800H     ; numero de vezes a escrever o caractere
    INT 10H         ; executa a entrada de video

    RET             ; retorna a funcao com a exibicao de video limpa e com a cor de fundo laranja
COR_DE_FUNDO ENDP

END MAIN