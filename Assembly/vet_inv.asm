TITLE NOME:VICTOR DE MELO ROSTON | RA:22006737

.MODEL SMALL
COR_DE_FUNDO MACRO
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
    ENDM

SAI_DOS MACRO
    MOV AH,4CH      ; encerra o programa
    INT 21H
    ENDM

.DATA
    QTDE EQU 8
    STR1 DB 'OSC 2522'
    STR2 DB QTDE DUP (?)
    
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX

    COR_DE_FUNDO

    CALL INV
    CALL IMP

    SAI_DOS
MAIN ENDP

; inverte o vetor
INV PROC
    LEA SI, STR1+7      ; aponta para a ultima posicao do vetor
    LEA DI, STR2
    STD                 ; muda a flag DF e decrementa
    MOV CX, QTDE
 INVERTE:
    MOVSB
    ADD DI, 2
    LOOP INVERTE
    RET
INV ENDP

; imprime o vetor
IMP PROC
    CLD
    MOV CX, QTDE
    LEA SI, STR2
    MOV AH, 02
 IMPRIME:
    LODSB
    MOV DL, AL
    INT 21H
    LOOP IMPRIME
    RET
IMP ENDP

END MAIN