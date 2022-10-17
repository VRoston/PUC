;Victor de Melo Roston
;RA:22006737

.model small 
    .data
    msimpar db 10,"Paridade: impar",'$'
    mspar db 10,"Paridade: par",'$'
    ms5 db 10,"Menor numro: ",'$'
    ms4 db 10,"Digite o segundo numero: ",'$'
    ms3 db "Digite o primeiro numero: ",'$'
    ms2 db 10,"Maior numero: ",'$'
    ms db "Digite dois numero entre 0 a 9",10,'$'

.code 
    main proc
        mov ax,@data                ;Recebe .data
        mov ds,ax 

        mov ah,9                    ;Imprimir frase em ms
        mov dx,offset ms
        int 21h 

         
        mov ah,9                    ;perguntando pelo primeiro numero 
        mov dx,offset ms3
        int 21h

        mov ah,01h                  ;Lendo e armazenando o primeiro numero em BL
        int 21h
        mov bl,al

        
        mov ah,9                    ;Imprime ms 4
        mov dx,offset ms4
        int 21h
        
        mov ah,01h                  ;lendo e armazenando o segundo numero em BH
        int 21h
        mov bh,al

        cmp bh,bl                   ;Comaprando os numeros lidos
        ja maior                    ;Função para o programa executar quando o bl for maior 
            xchg bh,bl
            
            add bh,0
            jp epar
             mov ah,9               ;Imprimindo ms2
             mov dx,offset ms2
             int 21h

             mov dl,bh              ;Imprimindo o maior numero que esta armasendo no bh
             mov ah,02 
             int 21h

             mov ah,9               ;Imprimindo msimpar
             mov dx,offset msimpar
             int 21h

                    jmp proximonu   ;Pulo para a parte de imprimir o menor numero e sua paridade
            epar:
         mov ah,9                   ;Imprimindo ms2
         mov dx,offset ms2
         int 21h

         mov dl,bh                  ;Imprimindo o maior numero que esta armasendo no bh
         mov ah,02 
         int 21h

         mov ah,9                   ;Imprimindo mspar
         mov dx,offset mspar
         int 21h
                     proximonu:
             add bl,0
             jp epar2
             mov ah,9               ;Imprimindo ms2
             mov dx,offset ms2
             int 21h

             mov dl,bl              ;Imprimindo o maior numero que esta armasendo no bl
             mov ah,02 
             int 21h

             mov ah,9               ;Imprimindo msimpar
             mov dx,offset msimpar
             int 21h 
                         jmp final 
             epar2: 
            
             mov ah,9               ;Imprimindo ms2 
             mov dx,offset ms2
             int 21h

             mov dl,bl              ;Imprimindo o maior numero que esta armasendo no bl
             mov ah,02 
             int 21h

             mov ah,9               ;Imprimindo a  mensagen de paridade par do bl
             mov dx,offset mspar
             int 21h    
            jmp final               ;Pulando incondicionalmente para a finalização do programa
        maior:

        add bh,0
            jp epar3
             mov ah,9               ;Imprimindo ms2 
             mov dx,offset ms2
             int 21h

             mov dl,bh              ;Imprimindo o maior numero que esta armasendo no bh
             mov ah,02 
             int 21h

             mov ah,9               ;Imprimindo msimpar
             mov dx,offset msimpar
             int 21h

                    jmp proximonu2  ;Pulo para a parte de imprimir o menor numero e sua paridade
            epar3:
         mov ah,9                   ;Imprimindo ms2
         mov dx,offset ms2
         int 21h

         mov dl,bh                  ;Imprimindo o maior numero que esta armasendo no bh
         mov ah,02 
         int 21h

         mov ah,9                   ;Imprimindo mspar
         mov dx,offset mspar
         int 21h
                     proximonu2:
            add bl,0
             jp epar4
             mov ah,9               ;Imprimindo ms2 
             mov dx,offset ms2
             int 21h

             mov dl,bl              ;Imprimindo o maior numero que esta armasendo no bl
             mov ah,02 
             int 21h

             mov ah,9               ;Imprimindo msimpar
             mov dx,offset msimpar
             int 21h 
                         jmp final 
             epar4: 
            
             mov ah,9               ;Imprimindo ms2 
             mov dx,offset ms2
             int 21h

             mov dl,bl              ;Imprimindo o maior numero que esta armasendo no bl
             mov ah,02 
             int 21h

             mov ah,9               ;Imprimindo mspar
             mov dx,offset mspar
             int 21h    
            jmp final               ;Pulando incondicionalmente para a finalização do programa


            final:                  ;Pulo incondicinal para finalizar o programa 
            mov ah,4ch 
            int 21h
main endp
end main