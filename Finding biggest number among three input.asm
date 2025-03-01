.MODEL SMALL
.STACK 100H 

.DATA   

 
.CODE
 main proc
    mov ah,1
    int 21h
    mov bl,al
    int 21h
    mov bh,al
    int 21h
    mov cl,al
    cmp bl,bh
    jle a
    b:
    cmp bh,cl
    jle c
    mov ah, 2
    mov dl,cl
    int 21h
    jmp exit         
    
    C:
    mov ah, 2
    mov dl,bh
    int 21h
    jmp exit
    a:
    cmp bl,cl
    jle d
    mov ah, 2
    mov dl,cl
    int 21h
    jmp exit
    d:
    mov ah, 2
    mov dl,bl
    int 21h
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
    