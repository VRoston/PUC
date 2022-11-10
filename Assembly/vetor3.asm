.MODEL SMALL
.STACK 0100h
.DATA
    MATRIZ DB 4 DUP (?)
           DB 4 DUP (?)
           DB 4 DUP (?)
           DB 4 DUP (?)

.CODE
MAIN PROC
    MOV AX, @DATA       ; inicializa o data
    MOV DS, AX

    XOR BX,BX
    XOR SI,SI

    CALL LE_MAT

    CALL IMP_MAT

    MOV AH,4CH          ; encerra o programa
    INT 21H
MAIN ENDP

LE_MAT PROC near
    ;  faz a somatoria de um vetor
    ;  ENTRADA: BX offset da linha
    ;           SI OFFSET DA COLUNA
    ;           CX numero de elementos
    ;  SAIDA:   matriz lida
    PUSH CX
    PUSH BX
    PUSH SI
    MOV AH,1
    MOV CL,4
VOLTA:
    MOV CH,4
VOLTA1:
    INT 21H
    AND AL,0FH
    MOV MATRIZ[BX][SI], AL
    
    INC SI
    DEC CH
    JNZ VOLTA1
    ADD BX,3
    DEC CL
    JNZ VOLTA

    MOV DL,10
    MOV AH,02
    INT 21H
    
    POP SI
    POP BX
    POP CX

    RET
LE_MAT ENDP


IMP_MAT PROC near
    ;  faz a somatoria de um vetor
    ;  ENTRADA: BX offset da linha
    ;           SI OFFSET DA COLUNA
    ;           CX numero de elementos
    ;  SAIDA:   matris lida
    PUSH CX
    PUSH BX
    PUSH SI
    MOV AH,2
    MOV CL,4
VOLTA2:
    MOV CH,4
VOLTA3:

    MOV DL, 10
    MOV DL, MATRIZ[BX][SI]
    OR DL,30H
    INT 21H
    MOV DL, ' '
    INT 21H
    
    INC SI
    DEC CH
    JNZ VOLTA3
    MOV DL,10
    MOV AH,02
    INT 21H
    AND BX,3
    ADD BX,3
    DEC CL
    JNZ VOLTA2
    
    POP BX
    POP CX

    RET
IMP_MAT ENDP

END MAIN