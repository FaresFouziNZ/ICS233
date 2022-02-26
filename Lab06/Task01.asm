.data
prompt: .asciiz "Enter a positive integer: "
result: .asciiz "Factorial result is: "

.text
li $v0,4
la $a0,prompt
syscall

li $v0,5
syscall
move $t0,$v0

li $s0,1    # initialzing the result register

loop:
mul $s0, $s0,$t0
subi $t0,$t0,1
beq $t0,1,breakLoop
j loop
breakLoop:
li $v0,4
la $a0,result
syscall
li $v0,1
move $a0,$s0
syscall
