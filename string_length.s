.data

mhnhma1: .asciiz "Please type a word:  \n"
mhnhma2: .asciiz "Its length is: \n"
buffer: .space 1024

.text

main:   
         
	 li $v0,4        
         la $a0,mhnhma1  
	 syscall         

	 
	 li $v0,8        
         la $a0,buffer   
	 syscall         

	 li $t0,0        
	 la $t1,buffer
	 
	 jal Synart1           
	    
	 li $v0,4        
         la $a0,mhnhma2
	 syscall
	 
	 sub $a0,$t0,1  
	 li $v0,1      
	 syscall

	 li $v0,10      
	 syscall

    Synart1:
	li $t0, 0 
	loop:
	lb $t1, 0($a0) 
	beqz $t1, exit 
	addi $a0, $a0, 1 
	addi $t0, $t0, 1 
	j loop 
	exit:
	jr $ra	          
         	
