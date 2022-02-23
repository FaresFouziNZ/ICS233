.data
prompt: .asciiz "Enter a positive integer (n) to create nxn array: "

.text
li		$v0, 4		
la		$a0, prompt
syscall	

li $v0, 5
syscall
move $s0, $v0

li $s1,0
li $s2,0
loopN:
addi $s1,1
add $s2,$s2,$s0
beq $s1,$s0,breakN
j loopN
breakN:
sll,$s2,$s2,2
li $v0,9
move $a0,$s2
syscall
move $s3,$v0

li $t0, 0       #initial i

loopA:

li $t1, 0       #initial j
loopB:
add $t2,$t1,$t0
sw $t2,0($s3)
beqz $t0,la
beqz $t1,la
subi $t3,$t2,1
add $t3,$t3,$t2
sw $t3,0($s3)
la:
li $v0,1
lw $a0,0($s3)
syscall
li $v0,11
li $a0,' '
syscall
addi $t1,$t1,1
beq $t1,$s0,endJ
j loopB
endJ:
addi $t0,$t0,1
li $v0,11
li $a0,'\n'
syscall
beq $t0,$s0,endI
j loopA
add $t3,$t2
