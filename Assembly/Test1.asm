.MODEL SMALL
.DATA
DB 3,1,"AX","$"
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX
    MOV BX,0FF8FH
    MOV AX,0FFA1H
    CMP AX,BX
    JG PULA
    MOV CX,BX
    LEA DX,MSG1
    JMP IMP
PULA:
    MOV CX,AX
    LEA DX,MSG2
IMP:
    MOV AH,,09
    INT 21H

     


;Finalização do programa    
    MOV AH,4CH          ;Finaliza o programa
    INT 21H             ;Executa a finalização
MAIN ENDP
END MAIN