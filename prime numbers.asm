
org 100h

    mov dx,offset msg_m_3 
    mov ah,09h                         
    int 21h               
    
    mov ah,0ah            
    mov dx,offset buff_m_3
    int 21h               
    
    mov si,dx
    mov cx,0
    
    a:
        mov ax,[si+2]
        sub [si+2],30h
        inc cx
        inc si
        cmp [si+2],0dh
    
    jne a
    sub bx,bx
    
    mov di,0d
    mov si,dx
    add si,1d
    add si,cx
    
    mov bx,1
    mov ax,[si]
    sub ah,ah
    mul bx
    mov di,ax
    dec si
    mov bx,10d
    mov ax,[si]
    sub ah,ah
    
    mul bx
    add di,ax
    dec si
    mov bx,100d
    mov ax,[si]
    sub ah,ah
    mul bx
    add di,ax
    
    mov ax,di
    mov bx,2d
    div bx
    mov cx,ax
    mov si,0d
    mov bx,2d
    
    m3_a:
        mov ax,di
        
        div bl
        inc bx
        inc si
        cmp ah,0d
        je n_p
        cmp si,cx
        jne m3_a
        jmp p
         
        
        n_p:
            ; not prime
            mov dx,offset msg_np 
            mov ah,09h            
            int 21h               
            ret
            
        
        p:
            ; prime
            mov dx,offset msg_p  
            mov ah,09h            
            int 21h               
            ret
    

          


ret
msg_m_3 db "Enter a number in 3 digit format to see if it is prime or not",0dh,0ah,"$"

buff_m_3 dw "?"

msg_np db 0dh,0ah,"  Number you have entered is not a prime number",0dh,0ah,"$"

msg_p  db 0dh,0ah,"Number you have entered is a prime number","$"