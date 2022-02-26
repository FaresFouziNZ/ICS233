.data
prompt: .asciiz "Enter Withdrawal amount: "
paper500: .asciiz "\n500 Bank note: "
paper100: .asciiz "\n100 Bank note: "
paper50: .asciiz "\n50 Bank note: "
paper10: .asciiz "\n10 Bank note: "
paper5: .asciiz "\n5 Bank note: "
paper1: .asciiz "\n1 Bank note: "

.text
li $v0,4
la $a0, prompt
syscall

li $v0,5
syscall
move $s0,$v0


#500 ryal
div $s1,$s0,500
mul $t0,$s1,500
sub $s0,$s0,$t0

#100 ryal
div $s2,$s0,100
mul $t0,$s2,100
sub $s0,$s0,$t0

#50 ryal
div $s3,$s0,50
mul $t0,$s3,50
sub $s0,$s0,$t0

#10 ryal
div $s4,$s0,10
mul $t0,$s4,10
sub $s0,$s0,$t0

#5 ryal
div $s5,$s0,5
mul $t0,$s5,5
sub $s0,$s0,$t0

#print 

beqz $s1,print100

#printing 500
li $v0,4
la $a0,paper500
syscall

li $v0,1
move $a0,$s1
syscall

print100:
beqz $s2,print50

#printing 100
li $v0,4
la $a0,paper100
syscall

li $v0,1
move $a0,$s2
syscall

print50:
beqz $s3,print10

#printing 50
li $v0,4
la $a0,paper50
syscall

li $v0,1
move $a0,$s3
syscall

print10:
beqz $s4,print5

#printing 10
li $v0,4
la $a0,paper10
syscall

li $v0,1
move $a0,$s4
syscall

print5:
beqz $s5,print1

#printing 5
li $v0,4
la $a0,paper5
syscall

li $v0,1
move $a0,$s5
syscall

print1:
beqz $s0,skip

#printing 1
li $v0,4
la $a0,paper1
syscall

li $v0,1
move $a0,$s1
syscall

skip:
li $v0,10
syscall