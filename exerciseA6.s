# A program that simulates an adding machine that will repeatedly read in integers and adds them into a running sum. The program will stop when it gets an input that is 0, printing out the sum at that point.

        .data
str:    .asciiz "This is a program that will compute the sum of the numbers the user has entered (To stop the program enter '0')"
str1:   .asciiz "Enter a number (To exit enter '0'): "
        .text
        .globl main

main:   li		$v0, 4		# System call code to print string   # $v0 = 4 
        la		$a0, str	# 
        syscall

        li		$v0, 10		# Exits the program  # $v0 = 10
        syscall
