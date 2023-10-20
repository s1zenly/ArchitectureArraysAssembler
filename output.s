.include "macrolib.s"

.global output

output:
	print_str("--------")
	newline
	# We returning pointer
	addi s1 s1 4
	mul t2 t2 s1
	neg t2 t2
	add t1 t1 t2
	neg t2 t2
	while:
		
		lw a0 (t1)
		print_int(a0)
		newline
		addi t1 t1 4
		addi t2 t2 -4
		bgtz t2 while
		
	# Zeroing by convention
	mv s1 zero
	exit