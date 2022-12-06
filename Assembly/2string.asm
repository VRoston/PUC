TITLE NOME:VICTOR DE MELO ROSTON | RA:22006737
.MODEL SMALL
SAI_DOS MACRO
    MOV AH,4CH      ; encerra o programa
    INT 21H
    ENDM

LIMPA_TELA MACRO
 ; limpa a tela
    MOV AH, 00       ; tipo de video
    MOV AL, 03h      ; tipo de texto 80x25
    INT 10H          ; executa a entrada de video

 ; formata o modo de video
    MOV AH, 09       ; escrever um caractere e atributo para a posicao do cursos
    MOV AL, 20H      ; o caractere a mostrar
    MOV BH, 00       ; numero da pagina
    MOV BL, 0F0H     ; atribuicao de cor
    MOV CX, 800H     ; numeNNNNro de vezes a escrever o caractere
    INT 10H          ; executa a entrada de video
ENDM

IMPRIME MACRO
    MOV AH,09
    INT 21H
ENDM

PULA_LINHA MACRO
    MOV AH, 02H         ; pula uma linha na impressao
    MOV DL, 10
    INT 21H
ENDM

.STACK 0100h
.DATA
    VETOR DB 'VAI BRASIL$'
    VETRO DB 'VAI ESPANHA$'
    IGU DB 10,13,'IGUAL$'
    DIF DB 10,13,'DIFERENTES$'
    
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX

    LIMPA_TELA
    
    LEA DX, VETOR
    IMPRIME
    PULA_LINHA
    LEA DX, VETRO
    IMPRIME
    
    LEA DI, VETOR
    LEA SI, VETRO
    CLD
    MOV CX, 10
    REPE CMPSB
    JZ TEM
    LEA DX, DIF
    JMP IMP
TEM:
    LEA DX, IGU
IMP:
    IMPRIME

    SAI_DOS
MAIN ENDP
END MAIN