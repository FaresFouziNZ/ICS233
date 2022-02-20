.data
prompt: .asciiz "Enter input-file name including .txt: "
prompt2: .asciiz "Enter output-file name including .txt with length 15: "
filename: .space 15

.text
li $v0,4
la $a0, prompt
syscall

li $v0,8
la $a0,filename
li $a1,15
syscall

li	$v0, 13	
la 	$a0, File
la	$a1,  0
syscall
move $s0,$v0

beq $s0,-1,notfound