.model small
.data
.code
Main proc
	mov cx,5
	mov dx,49
  test:
	mov ah,2
	int 21h

	add dx,2

	loop test 
 
   EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP 
END MAIN
