.include "macrolib.s"

.global inputArray

inputArray:

	# s2 - count element of array
	mv s2 t2
	repeatInput:
		read_int
		
		# s1 - number we entered
		mv s1 a0
		sw s1 (t0)
		addi t0 t0 4
		addi s2 s2 -1
		bnez s2 repeatInput
		
	# Zeroing by convention
	mv s1 zero
	mv s2 zero
	ret
	
	