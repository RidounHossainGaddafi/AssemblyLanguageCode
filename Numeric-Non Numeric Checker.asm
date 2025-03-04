.model small
.stack 100h
.DATA
A DB 10,13,"Numeric$"
B DB 10,13,"Not Numeric$"

.CODE
  MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
   
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    cmp BL,48
    JGE NUMERIC 
    JMP M2
    
    
   NUMERIC:
    CMP BL,57
    JLE M1 
    JMP M2
    
    
   M1:
    LEA DX,A
    MOV AH,9
    INT 21H 
    JMP EXIT
    
   M2: 
    LEA DX,B
    MOV AH,9
    INT 21H
    JMP EXIT  
    
  
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN




