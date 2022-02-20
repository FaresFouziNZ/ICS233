.data
prompt: .asciiz "Enter a positive integer (n) to create nxn array: "

.text
li		$v0, 4		
la		$a0, prompt
syscall	

li $v0, 5
syscall
move $s0, $v0

li $t0, 0       #initial i
li $t1, 0       #initial j
loop:
