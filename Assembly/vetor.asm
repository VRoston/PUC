.MODEL SMALL
.STACK 0100H
.DATA
    VETOR DW 0,1,2,1,1,0,1,1,1,1
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA BX, VETOR
    MOV CX, 10
    XOR DX, DX

    CALL SOMA

    MOV AH,02
    OR DL,30H
    INT 21H

    MOV AH,4CH
    INT 21H
MAIN ENDP

;description
SOMA PROC
    ;  faz a somatoria de um vetor
    ;  ENTRADA: BX endereco base do vetor
    ;           CX numero de elementos do vetor
    ;  SAIDA:   DX somatoria dos elementos do vetor
    PUSH CX
    PUSH BX
VOLTA:
    ADD BX, [BX]
    ADD BX, 2
    ;INC BX

    LOOP VOLTA
    POP BX
    POP CX

    RET
SOMA ENDP

END MAIN