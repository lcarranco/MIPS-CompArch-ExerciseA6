# A program that simulates an adding machine that will repeatedly read in integers and adds them into a running sum. The program will stop when it gets an input that is 0, printing out the sum at that point.
# Equivalent C++ pseudocode
# WARNING - The pseudocode has not been tested

# int main ()
# {
#         string str = "This is a program that will compute the sum of the numbers the user has entered\n\n";
#         string str1 = "Enter a number (To exit enter '0'): ";
#         cout << str <<< endl;
#         computeSum();
#         void computeSum()
#         {
#                 int num;
#                 int sum = 0;
#                 int i;
#                 int array[10];          
#                 cout << str1 << endl;
#                 cin >> num;
#                 while (num != 0)
#                 {
#                         sum += num;
#                         cin >> num;
#                 }
#                 cout << sum << endl;
#         }
#         return 0;
# }


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
        li		$v0, 5		        # System call code to read integer
        syscall
        beq		$v0, $zero, exit	# If $v0 == zero then exit 
        add		$s6, $s3, $s6		# Add i to array and store in array
        move 	        $s2, $v0		# Move integer to $s2
        add		$s6, $s2, $s6		# Add $s2 to array
        j		loop			# Jump to loop                                          

exit:   li		$v0, 1		        # System call to print integer 
        move 	        $a0, $s6		# Moved sum to $a0 for system call
        syscall
        li		$v0, 10		        # Exits the program
        syscall
