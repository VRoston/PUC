TITLE NOME:VICTOR DE MELO ROSTON | RA:22006737

.MODEL SMALL
COR_DE_FUNDO MACRO
 ; limpa a tela
    MOV AH, 00       ; tipo de video
    MOV AL, 03h      ; tipo de texto 80x25
    INT 10H         ; executa a entrada de video

 ; formata o modo de video
    MOV AH, 09       ; escrever um caractere e atributo para a posicao do cursos
    MOV AL, 20H      ; o caractere a mostrar
    MOV BH, 00       ; numero da pagina
    MOV BL, 0FH      ; atribuicao de cor
    MOV CX, 800H     ; numero de vezes a escrever o caractere
    INT 10H         ; executa a entrada de video
ENDM

IMPRIME_MSG MACRO
    MOV AH, 09H      ; mostra na tela o que estivel em DL
    INT 21H
ENDM

PULA_LINHA MACRO
    MOV AH, 02      ; pula uma linha na impressao
    MOV DL, 10
    INT 21H
ENDM

EXIT_DOS MACRO
    MOV AH, 4CH      ; encerra o programa
    INT 21H
ENDM

.STACK 100H
.DATA
    MSG1 DB 10, 13, '  INPUT: ' ,'$'
    MSG2 DB 10, 13, '  OUTPUT: ','$'
    
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    COR_DE_FUNDO

    LEA DX, MSG1
    IMPRIME_MSG
    CALL INPUT

    CALL OUTPUT

    EXIT_DOS
MAIN ENDP

; entrada da cadeia de caracteres
INPUT PROC
 INICIO:
    PUSH BX             ; manda para a pilha conteudo dos registradores
    PUSH CX
    PUSH DX
    XOR BX, BX          ; inicia registradores com 0
    XOR CX, CX           

    MOV AH, 01          ; caso tenha sinal (+ ou -), sera lido
    INT 21H

    CMP AL,'-'          ; caso sinal de negativo, pula
    JE NEGATIVO
    CMP AL,'+'
    JE POSITIVO         ; caso positivo, pula
    JMP VOLTA

 NEGATIVO:
    MOV CX, 1           ; se for negativo, cx recebe 1

 POSITIVO:
    INT 21H

 VOLTA:
    CMP AL,'0'          ; verificacao de numero real, ou caractere invelido
    JNGE INVALIDO
    CMP AL,'9'
    JNLE INVALIDO

    AND AX, 0FH          ; transforma em numero
    PUSH AX             ; AX e empilhado

    MOV AX, 10           ; AX recebe 10
    MUL BX              ; multiplica BX
    POP BX              ; Desempilha em BX
    ADD BX, AX           ; soma BX com AX

    MOV AH, 01
    INT 21H             ; lê o numero 
    CMP AL, 13           ; compara com o enter, caso seja igual ele para de ler 

    JNE VOLTA

    MOV AX, BX           ; AX<-BX
    OR CX, CX            ; sinal
    JE SAI              

    NEG AX
 SAI:
    POP DX              ; volta o valor dos registradores original antes do procedimento
    POP CX
    POP BX
    RET                 ; retorna a cadeia de caracteres lida

 INVALIDO:              ; caso caractere invalido, repete todo o processo
    PULA_LINHA
    JMP INICIO
INPUT ENDP


; saida da cadeia de caracteres
OUTPUT PROC
    PUSH AX             ; empilha AX para fazer um print
    PULA_LINHA
    LEA DX, MSG2
    IMPRIME_MSG
    POP AX              ; desempilha em AX

    OR AX,AX            ; sinal
    JGE FIM
    PUSH AX             ; se for negativo printa o sinal de menos
    MOV AH, 02
    MOV DL, '-'
    INT 21H
    POP AX
    NEG AX
 FIM:
    XOR CX, CX           ; zera cx
    MOV BX, 10

 VOLTA2:            
    XOR DX, DX           ; zera DX
    DIV BX
    PUSH DX             ; empilha o que esta em DX
    INC CX              ; incrementa CX

    OR AX, AX
    JNE VOLTA2

 IMPRIME:
    POP DX              ; desempilha em DX
    OR DL, 30H           ; transforma em caracterpara printar
    MOV AH, 02
    INT 21H
    LOOP IMPRIME

    RET                 ; retorna a impressao da cadeia de caracteres
OUTPUT ENDP

END MAIN