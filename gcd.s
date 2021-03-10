.data 
	msg1: .asciiz "Dwse duo ari9mous:\n" 

.text 

main:
 add $a0, $zero, $zero                
 add $a1, $zero, $zero              
 li  $v0, 4                   
 la  $a0, msg1                
 syscall                         
 
 li $v0, 5                    
 syscall                      
 add $a0, $v0, $zero          
 
 li $v0, 5                            
 syscall                             
 add $a1, $v0, $zero                 

 jal MKD                      
 li  $v0, 1                         
 syscall                          
 
 li  $v0, 10                       
 syscall                       

 MKD:
	addi $t0,$a0,0 
    addi $t1,$a1,0 
    While:beq $t1,$zero,End_while 
        slt $t2,$t1,$t0 
        beq $t2,$zero,Else 
        sub $t0,$t0,$t1
        j While 
        Else: sub $t1,$t1,$t0
            j While 
  	End_while: addi $v0,$t0,0 
    jr $ra 