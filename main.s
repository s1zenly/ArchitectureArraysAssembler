.include "macrolib.s"

.global main

main:
	.data
		.align 2
		n:       .word 0
		arrayA:  .space 64
		arrayB:  .space 64
	.text
		# Input data
		print_str("Input n: ")
		read_int
		
		# t2 - count of array elements
		mv t2 a0
		# We checks on correct count of array elements
		ble t2 zero Incorrect_n
		li t3 10
		bgt t2 t3 Incorrect_n
		
		# We select a place for count of array elements
		la t3 n
		
		# We writes count of array elements in the memory
		sw t2 (t3)

		# We made pointers to the beginning arrays
		la t0 arrayA
		la t1 arrayB
	 	
	 	# We starts to input array
	        jal inputArray
	        
	        # We returned pointer to the beginning 
	        la  t0 arrayA
		
		# we switch to the array filling algorithm
		jal writeNewArray
		
		
		