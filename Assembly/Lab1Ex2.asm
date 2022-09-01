;Hello world com repeticoes (Exercicio 2)
.MODEL SMALL
.data
    msg db 'bem vindo ao assembler',09,'$'
.CODE
    main proc
    mov ax,@data         ;inicializacao do ds
        mov ds,ax
        mov ah,09h
        mov dx, offset msg   ;string em msg
        mov cl, 10           ;repeticoes
RETORNA:        
        int 21h
        dec cl
        jnz RETORNA
main endp
end main
