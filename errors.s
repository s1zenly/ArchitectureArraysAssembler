.include "macrolib.s"

.global Incorrect_n

errors:
	Incorrect_n:
		print_str("Incorrect n!")
		exit