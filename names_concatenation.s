.data
name: .asciiz "What is your name?\n"
nameU: .space 1024
surname: .asciiz "What is your surname?\n"
surnameU: .space 1024
merged: .space 1024
msg1: .asciiz "Nice to meet you "
msg2: .asciiz ". Have a nice day"
spb: .asciiz " "

.text

concatenate:
	sub $t5,$t5,$t5 
	sub $t1,$t1,$t1
	addi $t5,$t5,0x0A
	length:      
		lb $t0,($a0)
		beq $t0,$t5,end
		beq $t0,$zero,end
			
		addi $t1,$t1,1
		addi $a0,$a0,1
		j length
	end:
		add $s0,$s0,$t1
				
		sub $a0,$a0,$t1 
		
	store:
		beq $s0,$t2,stored 
		lb $t7,($a0)
		sb $t7,($v1)
		addi $v1,$v1,1
		addi $t2,$t2,1
		addi $a0,$a0,1
		j store
	stored:
			


jr $ra



main: addi $v0,$zero,4
      la $a0,name
      syscall

      li $v0,8
      la $a0,nameU
      li $a1,1024
      syscall

      li $v0,4
      la $a0,surname
      syscall

      li $v0,8
      la $a0,surnameU
      li $a1,1024
      syscall

      li $v0,4
      la $a0,msg1
      syscall

	
	  la $v1, merged 
      la $a0,nameU
	  jal concatenate        
	  la $a0,spb 
	  jal concatenate
	  la $a0,surnameU
	  jal concatenate
	  la $a0,msg2
	  jal concatenate

      li $v0,4
      la $a0,merged
	  syscall