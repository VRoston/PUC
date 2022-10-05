;Victor de Melo Roston
.MODEL SMALL
.DATA
    msg db 'Insira um caractere: ','$'
.CODE
    main proc
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,9
    MOV DX,OFFSET msg
    INT 21H
    MOV AH,01H
    INT 21H
    MOV DL,AL
    MOV AH,02
    INT 21H
    MOV AH,4CH
    INT 21H
MAIN ENDP
END main