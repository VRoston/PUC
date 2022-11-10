.MODEL SMALL
.DATA
 ; definindo a matriz 4x4 que recebera entrada de numeros no programa
    MATRIZ DB 4 DUP (?)
           DB 4 DUP (?)
           DB 4 DUP (?)

 ; definindo as mensagens que vao ser exibidas
    MSG1 DB 10, 13,    'ENTRADA MATRIZ 4x4:', '$'
    MSG2 DB 10, 13,    'IMPRESSAO DA MATRIZ 4X4 ORIGINAL:', '$'
    MSG3 DB 10, 13,    'IMPRESSAO DA MATRIZ 4X4 INVERTIDA:', '$'
    PULA_LINHA 10, 13, '$'

.CODE
MAIN PROC
    MOV AX, @DATA                       ; inicializa o DATA
    MOV DS, AX

    CALL LEITURA_DE_MATRIZ              ; chama o procedimento para leitura dos numeros da matriz 4x4

    CALL IMPRIMIR_MATRIZ_ORIGINAL       ; imprime a matriz original, linha x coluna

    CALL IMPRIMIR_MATRIZ_INVERTIDA      ; inverte a ordem da impressao, coluna x linha

    MOV AH,4CH
    INT 21H
MAIN ENDP

; entrada dos numeros que vao compor a matriz 4x4
LEITURA_DE_MATRIZ PROC
    
LEITURA_DE_MATRIZ ENDP


; impressao da matriz original
IMPRIMIR_MATRIZ_ORIGINAL PROC
    
IMPRIMIR_MATRIZ_ORIGINAL ENDP


; impressao da matriz invertida
IMPRIMIR_MATRIZ_INVERTIDA PROC
    
IMPRIMIR_MATRIZ_INVERTIDA ENDP

END MAIN