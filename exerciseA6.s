# A program that simulates an adding machine that will repeatedly read in integers and adds them into a running sum. The program will stop when it gets an input that is 0, printing out the sum at that point.

        .data
str:    .asciiz "This is a program that will compute the sum of the numbers the user has entered\n\n"
str1:   .asciiz "Enter a number (To exit enter '0'): "
        .text
        .globl main

main:   li		$v0, 4		# System call code to print string   # $v0 = 4 
        la		$a0, str	# Print str
        syscall

loop:   li		$v0, 4		# System call code to print string   # $v0 = 4 
        la		$a0, str1	# Print str1
        syscall
        li		$v0, 5		# System call code to read integer  # $v0 = 5 
        syscall
        beq		$v0, $zero, exit	# if $v0 == $zero then exit
        move 	        $s0, $v0		# $s0 = $v0
        add		$s0, $s0, $s0		# $s0 = $s0 + $s0 
        j		loop				# jump to loop
        
               

exit:   li		$v0, 1		# $v0 = 1 
        move 	$a0, $s0		# $a0 = 
        syscall
        li		$v0, 10		# Exits the program  # $v0 = 10
        syscall
