# A program that simulates an adding machine that will repeatedly read in integers and adds them into a running sum. The program will stop when it gets an input that is 0, printing out the sum at that point.

        .data
str:    .asciiz "This is a program that will compute the sum of the numbers the user has entered\n\n"
str1:   .asciiz "Enter a number (To exit enter '0'): "
        .text
        .globl main

main:   li		$v0, 4		        # System call code to print string 
        la		$a0, str	        # Print str
        syscall

loop:   li		$v0, 4		        # System call code to print string 
        la		$a0, str1	        # Print str1
        syscall
        li		$v0, 5		        # System call code to read integer  # $v0 = 5 
        syscall
        beq		$v0, $zero, exit	# if $v0 == zero then exit 
        add		$s6, $s3, $s6		# add i to array and store in array
        move 	        $s2, $v0		# move integer to $s2
        add		$s6, $s2, $s6		# add $s2 to array
        j		loop			# jump to loop                                          

exit:   li		$v0, 1		        # System call to print integer 
        move 	        $a0, $s6		
        syscall
        li		$v0, 10		# Exits the program  # $v0 = 10
        syscall
