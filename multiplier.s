.data
erwtisi_prwth:	.asciiz	"Give the first value:"
erwtisi_deyterh:	.asciiz "Give the second value""
apotelesma:	.asciiz	"The result is: "

.text

main: 	
    li $v0, 4	
    la $a0, erwtisi_prwth
    syscall
	
    li $v0, 5
    syscall
	
    add $t0, $v0, $zero	
    li $v0, 4
    la $a0, erwtisi_deyterh
    syscall
		
    li $v0, 5	
    syscall

    add $a1, $v0, $zero
    add $a0, $t0, $zero
    add $v0, $zero, $zero
		
    jal pollaplasiasmos
	
    add $t0, $v0, $zero
    li $v0, 4
    la $a0, apotelesma
    syscall
		
    add $a0, $t0, $zero	
    li $v0, 1
    syscall
	
    li $v0, 10
    syscall 

pollaplasiasmos:	
    add $t0, $zero, $a0	
    add $t1, $zero, $a1	
    li $t2, 0		
    li $t4, -2	
    li $t5, 16
			

M:	
    beq $t2, $t5, K	
    or $t3, $t1, $t4	
    andi $t3, $t3,1
    beq $t3,$zero, L
    add $v0, $v0, $t0

L:	
    addi $t2, $t2, 1	
    sll $t0, $t0, 1
    srl $t1, $t1, 1
	
j M
	
K:
    
jr $ra
