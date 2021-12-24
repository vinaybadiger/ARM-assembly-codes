	ttl vinayakbadiger
	AREA EX18, CODE, READWRITE
	ENTRY
START
	MOV r8,#4 	  ; intialize counter(r8) to 4the count address is going to r8
	LDR r0, Array ;  load start address
	LDR r2, [r0] ;load the value present in start adress
	LDR r7, Result ;save addition result in result variable

LOOP CMP r8, #0 ;compare until all elements are done
	 BEQ STOP ;if all value compared come out of loop
	 LDR r3, [r0,#4]! ;Load the next 32 bit number
	 ADD r8, r8, #-1 ; Count value decremented by 1
	 CMP R3,#0 ;Compare for positive numbers
	 BPL ADD1 ;if number is positive jump to ADD
	 B LOOP ; Branch in loop
ADD1 ADD r2, r2, r3 ;add positive numbers
	 STR r2, [r7] ; Store the result in resistor
	 B LOOP ;branch in loop

STOP B STOP
Array  DCD &40000000
Result DCD &40000004

	END
