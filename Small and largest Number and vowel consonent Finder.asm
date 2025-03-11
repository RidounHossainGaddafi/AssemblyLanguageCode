;Ridoun Hossain Gaddafi (213-15-4627) 60_F
.MODEL SMALL
.STACK 100H 
.DATA
NUM1 DB ?
NUM2 DB ?
NUM3 DB ?
MSG1 DB 10,13,"ENTER FIRST NUMBER : $"
MSG2 DB 10,13,"ENTER SECOND NUMBER : $"
MSG3 DB 10,13,"ENTER THIRD NUMBER :  $"
MSG4 DB 10,13,"LARGEST NUMBER :  $"
MSG5 DB 10,13,"SMAILEST NUMBER :  $"
MSG6 DB 10,13,"ENTER A CHARACTER :  $" 
M1 DB 10,13,'ENTERED CHARACTER IS A VOWEL $'
M2 DB 10,13,'ENTERED CHARACTER IS A CONSONANT$'

.CODE

MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    
    LEA DX,MSG1  
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    LEA DX,MSG2    
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    LEA DX,MSG3    
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    
    cmp bl,bh
    jge a
    
    b:
    cmp bh,cl
    jge c
    
    LEA DX,MSG4
    MOV AH,9
    INT 21H
    
    mov ah, 2
    mov dl,cl
    int 21h
    jmp SMALL         
    
    C:
    LEA DX,MSG4
    MOV AH,9
    INT 21H
    
    mov ah, 2
    mov dl,bh
    int 21h
    jmp SMALL
    
    a:
    cmp bl,cl
    jge d  
    
    LEA DX,MSG4
    MOV AH,9
    INT 21H
    
    mov ah, 2
    mov dl,cl
    int 21h
    jmp SMALL
    
    d:
    LEA DX,MSG4
    MOV AH,9
    INT 21H
    
    mov ah, 2
    mov dl,bl
    int 21h 




    SMALL:

    cmp bl,bh
    jle u
    v:
    cmp bh,cl
    jle w
    
    LEA DX,MSG5
    MOV AH,9
    INT 21H
    
    mov ah, 2
    mov dl,cl
    int 21h
    jmp CHARACTER         
    
    w:
    LEA DX,MSG5
    MOV AH,9
    INT 21H
    
    mov ah, 2
    mov dl,bh
    int 21h
    jmp CHARACTER
    u:
    cmp bl,cl
    jle x  
    
    LEA DX,MSG5
    MOV AH,9
    INT 21H
    
    mov ah, 2
    mov dl,cl
    int 21h
    jmp CHARACTER
    x:
    
    LEA DX,MSG5
    MOV AH,9
    INT 21H
    
    mov ah, 2
    mov dl,bl
    int 21h 
    
    
    CHARACTER: 
    

     MOV AX,@DATA
     MOV DS,AX
     
     LEA DX,MSG6   
     MOV AH,9
     INT 21H
    
     MOV AH,1
     INT 21H
     MOV BL,AL
     
     
     
     CMP BL,'A'
     JE VOWEL
     
     CMP BL,'E'
     JE VOWEL
     
     CMP BL,'I'
     JE VOWEL
     
     CMP BL,'O'
     JE VOWEL
     
     CMP BL,'U'
     JE VOWEL
     
     CMP BL,'a'
     JE VOWEL
     
     CMP BL,'e'
     JE VOWEL
     
     CMP BL,'i'
     JE VOWEL
     
     CMP BL,'o'
     JE VOWEL
     
     CMP BL,'u'
     JE VOWEL 
     
     
     CMP BL,'A'
     JNE CONSONANT
     
     CMP BL,'E'
     JNE CONSONANT
     
     CMP BL,'I'
     JNE CONSONANT
     
     CMP BL,'O'
     JNE CONSONANT
     
     CMP BL,'U'
     JNE CONSONANT
     
     
   CONSONANT:
     LEA DX,M2
     MOV AH,9
     INT 21H
     JMP EXIT
   
   VOWEL:
     LEA DX,M1
     MOV AH,9
     INT 21H
    
   
    
 
        
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
             




