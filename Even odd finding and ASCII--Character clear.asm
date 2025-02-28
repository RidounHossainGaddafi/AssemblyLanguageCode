.MODEL SMALL
.STACK 100H

.DATA 
  
    M DB 10,13,'n= $'  
    

.CODE
MAIN PROC 
     
    MOV AX,@DATA
    MOV DS,AX  
    
    LEA DX,M
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL 
    ;SUB BL,48  ;2.ekhane biyog korar por je folafolta asbe ,setaw ascii te thakbe.but print er somoy equivalent character print korbe.
               ;3.tarmane code e 48 biyog korle amra apato dristi te asol je int value ta dekhbo,setaw asole ascii te convert hoyei ase.tobe khata kolome 48 biyog korle actual int value ta pawa jabe.code ew actual value ta dekha jabe but oita ASCII te ase. 
    
    MOV BH,'1'; 1.ekhane character hisebe '1' ke nibe and setake equivalent ascii te convert korbe.
    
    MOV AH,2    ;4.code e double/single quotation chara kono numeric value thakle seti ascii value.
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    L1:
    MOV DL,BH  ;DL e rakhte hobe.
    MOV AH,2
    INT 21H
   
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    INC BH  
    INC BH  
    
    CMP BH,BL
    JG  EXIT
    JMP L1
    
    
    
   EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP 
END MAIN
