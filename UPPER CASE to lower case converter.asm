.model small
.stack 100h
.DATA
A DB 10,13,"ENTER A UPPER LETTER:$"
B DB 10,13,"IN LOWER CASE:$"

.CODE
  MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,A
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    ADD BL,32  
    
    
    LEA DX,B
    MOV AH,9
    INT 21H  
    
    MOV DL,BL
    MOV AH,2
    INT 21H    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN