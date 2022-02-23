.data
prompt: .asciiz "Enter input-file name including .txt: "
prompt2: .asciiz "Enter output-file name including .txt with length 15: "
filename: .space 15
filename2: .space 15
filecontent: .space 1000

.text
li $v0,4
la $a0, prompt
syscall

beq $s0,-1,notfound

li $v0,8
la $a0,filename
li $a1,15
syscall


li	$v0, 13	
la 	$a0, File
la	$a1, 0
syscall
move $s0,$v0

beq $s0,-1,notfound

li $v0,14
move $a0,$s0
la $a1,filecontent 
li $a2,1000
syscall

li $v0,16
move $a0,$s0
syscall

li $v0,4
la $a0,prompt2
syscall

li $v0,8
la $a0,filename2
li $a1,15
syscall

li	$v0, 13	
la 	$a0, File
la	$a1, 1
syscall
move $s0,$v0
