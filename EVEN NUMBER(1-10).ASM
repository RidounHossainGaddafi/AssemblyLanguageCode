.model small
.stack 100h
.data
.code
Main proc  
    MOV BL,50
    
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    MOV CX,3 
    
  TOP:
   ADD BL,2
   MOV AH,2
   MOV DL,BL
   INT 21H  
   LOOP TOP
    
 EXIT:
   MOV AH,4CH
   INT 21H
   MAIN ENDP
END MAIN