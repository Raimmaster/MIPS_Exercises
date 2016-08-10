.data
	array: .word 60, 33, 28, 5, 11, 22
	size: .word 6
.text
	#main
	la $a0, array
	lw $a1, size
	jal selectionSort
	
	la $t0, array
	lw $a0, 0($t0) 
	li $v0, 1
	syscall
	
	lw $a0, 4($t0) 
	li $v0, 1
	syscall
	
	lw $a0, 8($t0) 
	li $v0, 1
	syscall
	
	lw $a0, 12($t0) 
	li $v0, 1
	syscall
	
	lw $a0, 16($t0) 
	li $v0, 1
	syscall
	
	lw $a0, 20($t0) 
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall  

	#function
	selectionSort:
		addi $t0, $zero, 1
		beq $a1, $t0, end_sort
		slt $t1, $a1, $t0
		beq $t0, $t1, end_sort
		add $t1, $zero, $a0 #minIndex
		add $t2, $zero, $t0 #Index
		addi $t3, $a0, 4 #arrayPos
		
		begFor:
			lw $t4, 0($t3)
			lw $t5, 0($t1)
			slt $t6, $t4, $t5
			beq $t6, $t0, end_iter
			add $t1, $t3, $zero
			j end_iter
			
			end_iter:
				add $t2, $t2, $t0
				addi $t3, $t3, 4
				slt $t7, $t2, $a1
				beq $t7, $t0, endFor
				j begFor
		
		endFor:
			lw $t4, 0($a0)
			lw $t5, 0($t1)
			sw $t5, 0($a0)
			sw $t4, 0($t1)
			addi $a0, $a0, 4
			addi $a1, $a1, -1
			jal selectionSort
			
		end_sort:
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			jr $ra