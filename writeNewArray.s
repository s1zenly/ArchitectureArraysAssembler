.include "macrolib.s"

.global writeNewArray

#  The algorithm is that we take a certain step forward to write to an even position 
# and only 4 bytes less backward for the same step, then we return the state of the step and forward, and so on
writeNewArray:

	# s2 - count element of array
	mv s2 t2
	
	# s4 - number of bytes in memory
	addi s4 s4 4
	
	# s5 - number for division on two
	addi s5 s5 2
	
	# We check on evening count element of array
	rem s1 s2 s5
	
	# We returning thestate for the flag
	addi s5 s5 -1
	bnez s1 odd
	even:
		# s1 - step
		addi s1 s1 2
		div s1 s2 s1
		mul s1 s1 s4
		jal while
	odd:
		# s1 - step
		addi s1 s1 1
		div  s1 s2 s1
		addi s1 s1 1	
		mul s1 s1 s4
	while:
		lw   s3 (t0)
		sw   s3 (t1)
		blez s5 back
		forward:
			# We moving forward step by step
			add t0 t0 s1
			addi s5 s5 -1
			jal next
		back:
			# We moving back step by step
			addi s1 s1 -4
			neg  s1 s1
			add t0 t0 s1
			neg s1 s1
			addi s1 s1 4
			addi s5 s5 1
		next:	
			addi t1 t1 4 
			addi s2 s2 -1
			bgtz s2 while
			
	# Zeroing by convention
	mv s1 zero
	mv s2 zero
	mv s3 zero
	mv s5 zero
	jal output
	
		