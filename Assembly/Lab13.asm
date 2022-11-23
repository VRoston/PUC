TITLE NOME:VICTOR DE MELO ROSTON | RA:22006737

.MODEL SMALL
.STACK 0100h
.DATA
    MSG1 DB 10, 13, '  INPUT: ' ,'$'
    MSG2 DB 10, 13, '  OUTPUT: ','$'
    
.CODE

PULA_LINHA MACRO
    MOV AH, 02
    MOV DL, 10
    INT 21H
ENDM

IMPRIME_MSG MACRO
    MOV AH,09H
    INT 21H
ENDM


MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    CALL COR_DE_FUNDO

    LEA DX, MSG1
    IMPRIME_MSG
    CALL INPUT

    PULA_LINHA

    LEA DX, MSG2
    IMPRIME_MSG
    CALL OUTPUT

    MOV AH,4CH
    INT 21H
MAIN ENDP

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


; entrada da cadeia de caracteres
INPUT PROC
    PUSH BX
    PUSH CX
    PUSH DX
@INICIO:
; imprime prompt ?
    ;MOV AH,2
    ;MOV DL,'?'
    ;INT 21H ; imprime ?
; total = 0
    XOR BX,BX

; negativo = falso
    XOR CX,CX

; le caractere
    MOV AH,1
    INT 21H
; case caractere lido eh?
    CMP AL,'-'
    JE @NEGT
    CMP AL,'+'
    JE @POST
    JMP @REP2

@NEGT:
    MOV CX,1
@POST:
    INT 21H
;end case

@REP2:
; if caractere esta entre 0 e 9
    CMP AL, '0'
    JNGE @NODIG
    CMP AL, '9'
    JNLE @NODIG
; converte caractere em digito
    AND AX,000FH
    PUSH AX
; total = total X 10 + digito
    MOV AX,10
    MUL BX          ; AX = total X 10
    POP BX
    ADD BX,AX       ; total - total X 10 + digito
; le caractere
    MOV AH,1
    INT 21H
    CMP AL,13       ;CR ?
    JNE @REP2       ; não, continua
    ; ate CR
    MOV AX,BX       ; guarda numero em AX
; se negativo
    OR CX,CX        ; negativo ?
    JE @SAI         ; sim, sai
; entao
    NEG AX
; end if

@SAI:
    POP DX          ; restaura registradores
    POP CX
    POP BX
    RET             ; retorna

@NODIG:
; se caractere ilegal
    MOV AH,2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    JMP @INICIO

    RET
INPUT ENDP


; saida da cadeia de caracteres
OUTPUT PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
; if AX < 0
    OR AX,AX           ; AX < 0 ?
    JGE @END_IF1
;then
    PUSH AX             ;salva o numero
    MOV DL, '-'
    MOV AH,2
    INT 21H             ; imprime -
    POP AX              ; restaura numero
    NEG AX
; digitos decimais
@END_IF1:
    XOR CX,CX           ; contador de d?gitos
    MOV BX,10           ; divisor
@REP1:
    XOR DX,DX           ; prepara parte alta do dividendo
    DIV BX              ; AX = quociente DX = resto
    PUSH DX             ; salva resto na pilha
    INC CX              ; contador = contador +1
;until
    OR AX,AX            ; quociente = 0?
    JNE @REP1           ; nao, continua
; converte digito em caractere
    MOV AH,2
; for contador vezes
@IMP_LOOP:
    POP DX              ; digito em DL
    OR DL,30H
    INT 21H
    LOOP @IMP_LOOP
; fim do for
    POP DX
    POP CX
    POP BX
    POP AX

    RET
OUTPUT ENDP

END MAIN