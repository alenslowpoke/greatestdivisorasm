.data
	msg: .asciiz "The greatest common divisor is "

.text
.globl main
main:
	li $v0, 5		# read (input) first integer
	syscall
	or $t0, $0, $v0		# store it in register $t0
	li $v0, 5		# read (input) second integer
	syscall
	or $t1, $0, $v0		# store in register $t1
	beq $t0, $t1, equal	# in case if both numbers are equal go to equal
start:
	blt $t0, $t1, if	# if value in $t0 is less than $t1 go to if
	sub $t0, $t0, $t1	# otherwise (if false) subtract $t1 from $t0 ($t0 - $t1)
	j equal			# and store it in $t0, then go to equal
if:
	sub $t1, $t1, $t0	# this is for the case when $t1 is greater than $t0
	j equal			# subtract $t0 from $t1 ($t1 - $t0) and store it in $t1
				# then go to equal

equal:
	bne $t0, $t1, start	# if $t0 is not equal to $t1 (if true) go to loop start
	li $v0,4		# if they are equal (if false) print msg stored in data
	la $a0, msg
	syscall		
	li $v0, 1
	or $a0, $0, $t0		# print register $t0 on the screen
	syscall
	or $v0, $0, 10		# exit the program
	syscall
