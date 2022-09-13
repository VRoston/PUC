;Hello world com repeticoes (Exercicio 2)
.MODEL SMALL
.data
    msg db 'hello world',9,'$'
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
    mov ah,4ch
    int 21h
main endp
end main
