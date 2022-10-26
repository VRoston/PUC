TITLE NOME:VICTOR DE MELO ROSTON | RA:22006737

.MODEL SMALL
.DATA
.CODE
MAIN PROC
    MOV CX,16       ;inicializa contador de dígitos
    MOV AH,1h       ;função DOS para entrada pelo teclado
    XOR BX,BX       ;zera BX -> terá o resultado
    INT 21h         ;entra, caractere está no AL
;while
TOPO: 
    CMP AL,0Dh      ;é CR?
    JE FIM          ;se sim, termina o WHILE
    AND AL,0Fh      ;se não, elimina 30h do caractere
                    ;(poderia ser SUB AL,30h)
    SHL BX,1        ;abre espaço para o novo dígito
    OR BL,AL        ;insere o dígito no LSB de BL
    INT 21h         ;entra novo caractere
    LOOP TOPO       ;controla o máximo de 16 dígitos
FIM:

    MOV CX,16       ;inicializa contador de bits
    MOV AH,02h      ;prepara para exibir no monitor
                    ;for 16 vezes do
PT1: 
    ROL BX,1       ;desloca BX 1 casa à esquerda
                    ;if CF = 1
    JNC PT2         ;salta se CF = 0
                    ;then
    MOV DL, 31h     ;como CF = 1
    INT 21h         ;exibe na tela "1" = 31h
    JMP PT3
;else
PT2: 
    MOV DL, 30h ;como CF = 0
    INT 21h ;exibe na tela "0" = 30h
;end_if
PT3: 
    LOOP PT1 ;repete 16 vezes
;end_for

    MOV AH,4CH          ;ENCERRA PROGRAMA
    INT 21H
MAIN ENDP
END MAIN