# This method makes a new line
.macro newline
   	li a7 11
	li a0 '\n'
	ecall
.end_macro

# This method makes outputs a number(%x) to the console
.macro print_int(%x)
	li a7 1
	mv a0 %x
	ecall
.end_macro

# This method writes a string to the console
.macro print_str(%x)
	.data
		str: .asciz %x
	.text
		li a7 4
		la a0 str
		ecall
.end_macro

# This method reads a number from the console
.macro read_int
	li a7 5
	ecall
.end_macro

# This method writes a number(%x) on the stack
.macro push(%x)
	add sp sp -4
	sw  %x (sp)
.end_macro

# This method removes a number(%x) from the stack
.macro pop(%x)
	lw %x (sp)
	add sp sp 4
.end_macro

# This method finishes the program
.macro exit
	li a7 10
	ecall
.end_macro
