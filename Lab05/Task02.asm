.data
prompt: .asciiz "Enter input-file name including .txt: "
prompt2: .asciiz "Enter output-file name including .txt with length 15: "
filenotfound: .asciiz "File is not found"
filename: .space 15
filename2: .space 15
filecontent: .space 1000

.text
#prompt1
li $v0,4
la $a0, prompt
syscall


#read input file path
li $v0,8
la $a0,filename
li $a1,15
syscall

li $v0,4
la $a0,filename
syscall

#open input file
li	$v0, 13	
la 	$a0, filename
la	$a1, 0
syscall
move $s0,$v0

#file not found error
beq $s0,-1,notfound

#read from file to filecontent
li $v0,14
move $a0,$s0
la $a1,filecontent 
li $a2,1000
syscall

#close input file
li $v0,16
move $a0,$s0
syscall

#prompt2
li $v0,4
la $a0,prompt2
syscall

#read output file path
li $v0,8
la $a0,filename2
li $a1,15
syscall

#open output file
li	$v0, 13	
la 	$a0, filename2
la	$a1, 1
syscall

move $s0,$v0

li $v0, 15
move $a0,$s0
la $a1,filecontent
la $a2,1000
syscall

li $v0, 16
move $a0,$s0
syscall

li $v0,10
syscall

notfound:
li $v0, 4
la $a0, filenotfound
syscall
