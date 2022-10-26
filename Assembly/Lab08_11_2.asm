TITLE NOME:VICTOR DE MELO ROSTON | RA:22006737

.MODEL SMALL
.DATA
.CODE
MAIN PROC

    XOR BX,BX           ;inicializa BX com zero
    MOV CL,4            ;inicializa contador com 4
    MOV AH,1h           ;prepara entrada pelo teclado
    INT 21h             ;entra o primeiro caractere
;while
TOPO: 
    CMP AL,0Dh          ;é o CR ?
    JE FIM
    CMP AL, 39h         ;caractere número ou letra?
    JG LETRA            ;caractere já está na faixa ASCII
    AND AL,0Fh          ;número: retira 30h do ASCII
    JMP DESL
LETRA: 
    SUB AL,37h          ;converte letra para binário
DESL: 
    SHL BX,CL           ;desloca BX 4 casas à esquerda
    OR BL,AL            ;insere valor nos bits 0 a 3 de BX
    INT 21h             ;entra novo caractere
    JMP TOPO            ;faz o laço até que haja CR
;end_

                        ;BX já contem número binário
    MOV CH,4            ;CH contador de caracteres hexa
    MOV CL,4            ;CL contador de deslocamentos
    MOV AH,2h           ;prepara exibição no monitor
;for 4 vezes do
TOPO2: 
    MOV DL,BH           ;captura em DL os oito bits mais significativos de BX
    SHR DL,CL           ;resta em DL os 4 bits mais significativos de BX
;if DL , 10
    CMP DL, 0Ah         ;testa se é letra ou número
    JAE LETRA2
;then
    ADD DL,30h          ;é número: soma-se 30h
    JMP PT1
;else
LETRA2: 
    ADD DL,37h          ;ao valor soma-se 37h -> ASCII
;end_if
PT1: 
    INT 21h             ;exibe
    ROL BX,CL           ;roda BX 4 casas para a direita
    DEC CH
    JNZ TOPO2           ;faz o FOR 4 vezes
;end_for

FIM:
    MOV AH,4CH          ;ENCERRA PROGRAMA
    INT 21H
MAIN ENDP
END MAIN