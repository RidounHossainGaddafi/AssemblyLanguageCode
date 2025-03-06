.model small
.stack 100h
.data
    first db 10,13,"Enter first number: $"  
    second db 10,13,"Enter second number: $"
    third db 10,13,"Enter third number: $"
    fourth db 10,13,"Enter fourth number: $"
     
    m1 db 10,13,"First number: $"  
    m2 db 10,13,"Second number: $"
    m3 db 10,13,"Third number: $"
    m4 db 10,13,"Fourth number: $"
   
    ml db 10,13,"Largest number: $"
    ms db 10,13,"Smallest number: $"
    pm1 db 10,13,"Middle number1: $"
    pm2 db 10,13,"Middle number2: $"
   
    sum db 10,13,"Summation of middle two numbers are: $"
    newline db 10,13,"$"
   
    num1 db ?
    num2 db ?
    num3 db ?
    num4 db ?  
    largest db ?
    smallest db ?
    middle1 db ?
    middle2 db ?
   
.code
main proc;
    mov ax,@data
    mov ds,ax
   

    ;first
    lea dx,first
    mov ah,9
    int 21h
   
    mov ah,1
    int 21h
    mov num1,al
   
   
    ;second
    lea dx,second
    mov ah,9
    int 21h
   
    mov ah,1
    int 21h
    mov num2,al
   
   
    ;third
    lea dx,third
    mov ah,9
    int 21h
   
    mov ah,1
    int 21h
    mov num3,al
   
   
    ;fourth
    lea dx,fourth
    mov ah,9
    int 21h
   
    mov ah,1
    int 21h
    mov num4,al
   
   
    ;display first number
    lea dx,m1
    mov ah,9
    int 21h
   
    mov ah,2  
    mov dl,num1
    int 21h
 
   
    ;display second number
    lea dx,m2
    mov ah,9
    int 21h
   
    mov ah,2  
    mov dl,num2
    int 21h
   
   
    ;display third number
    lea dx,m3
    mov ah,9
    int 21h
   
    mov ah,2  
    mov dl,num3
    int 21h
   
   
    ;display fourth number
    lea dx,m4
    mov ah,9
    int 21h
   
    mov ah,2  
    mov dl,num4
    int 21h
   
   
   
    ;largest check
   
   
    lcheck1:
    mov bl,num1
    mov largest,bl
     
   
   
    mov cl,num2
    cmp bl,cl
    jl lcheck2
   
    mov cl,num3
    cmp bl,cl
    jl lcheck3
   
    mov cl,num4
    cmp bl,cl
    jl lcheck4
   
    jmp scheck1
   
   
   
    lcheck2:
    mov bl,num2
    mov largest,bl
   
    mov cl,num3
    cmp bl,cl
    jl lcheck3
   
   
    mov cl,num4
    cmp bl,cl
    jl lcheck4
   
    jmp scheck1
   
   
   
    lcheck3:
    mov bl,num3
    mov largest,bl
   
    mov cl,num4
    cmp bl,cl
    jl lcheck4
   
    jmp scheck1
   
   
    lcheck4:
    mov bl,num4
    mov largest,bl
   
   
   
    ;smallest check
   
    scheck1:
    mov bl,num1
    mov smallest,bl
   
   
    mov cl,num2
    cmp bl,cl
    jg scheck2
   
    mov cl,num3
    cmp bl,cl
    jg scheck3
   
    mov cl,num4
    cmp bl,cl
    jg scheck4
   
    jmp print
   
   
   
    scheck2:
    mov bl,num2
    mov smallest,bl
   
    mov cl,num3
    cmp bl,cl
    jg scheck3
   
   
    mov cl,num4
    cmp bl,cl
    jg scheck4  
   
    jmp print
   
   
   
    scheck3:
    mov bl,num3
    mov smallest,bl
   
    mov cl,num4
    cmp bl,cl
    jg scheck4
   
    jmp print
   
   
    scheck4:
    mov bl,num4
    mov smallest,bl
   
   
   
   
    ;print the largest and the smallest number
   
    print:
   
    lea dx,ml
    mov ah,9
    int 21h
   
    mov ah,2
    mov dl,largest
    int 21h  
   
    lea dx,ms
    mov ah,9
    int 21h
   
   
    mov ah,2
    mov dl,smallest
    int 21h
   
   
   
    ;check middle1
   
    mov al,smallest
    mov middle1,al
   
    mov bl,largest
    mov middle2,bl
   
   
    middle1_num1:
    mov cl,num1
    cmp al,cl
    je middle1_num2
    cmp bl,cl
    je middle1_num2
    mov middle1,cl
    jmp middle2_num1
   
    middle1_num2:
    mov cl,num2
    cmp al,cl
    je middle1_num3
    cmp bl,cl
    je middle1_num3
    mov middle1,cl
    jmp middle2_num1
   
   
    middle1_num3:
    mov cl,num3
    cmp al,cl
    je middle1_num4
    cmp bl,cl
    je middle1_num4
    mov middle1,cl
    jmp middle2_num1
   
    middle1_num4:
    mov cl,num4
    mov middle1,cl
   
   
     ;check middle2
   
    middle2_num1:
    mov al,smallest
    mov bl,largest
    mov cl,middle1
    mov dl,num1
    cmp dl,al
    je middle2_num2
    cmp dl,bl
    je middle2_num2
    cmp dl,cl
    je middle2_num2
    mov middle2,dl
    jmp print_middle_numbers
   
    middle2_num2:
    mov dl,num2
    cmp dl,al
    je middle2_num3
    cmp dl,bl
    je middle2_num3
    cmp dl,cl
    je middle2_num3
    mov middle2,dl
    jmp print_middle_numbers
   
   
    middle2_num3:
    mov dl,num3
    cmp dl,al
    je middle2_num4
    cmp dl,bl
    je middle2_num4
    cmp dl,cl
    je middle2_num4
    mov middle2,dl
    jmp print_middle_numbers
   
    middle2_num4:
    mov dl,num4
    mov middle2,dl
   
    print_middle_numbers:
   
    lea dx,pm1
    mov ah,9
    int 21h
   
    mov ah,2
    mov dl,middle1
    int 21h  
   
    lea dx,pm2
    mov ah,9
    int 21h
   
   
    mov ah,2
    mov dl,middle2
    int 21h
   
   
    ;summation of middle1 and middle2
    lea dx,sum
    mov ah,9
    int 21h
   
   
    mov al,middle1
    mov bl,middle2
    add al,bl
    sub al,48
   

   
    mov ah,2
    mov dl,al
    int 21h
     
   
   
    mov ah,4ch
    int 21h
    main endp
end main