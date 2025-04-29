// R2 == 0
@R2
M=0

// Check if R1 <= 0
@R1
D=M        // D = R1
@END
D;JLE      // If R1 <= 0, jump to END

// R3 to store array pointer
@R0
D=M
@R3
M=D        // R3 = R0

// R4 to store loop counter
@R1
D=M
@R4
M=D        // R4 = R1

// Loop start
(LOOP)
@R4
D=M
@END
D;JEQ      // If counter == 0, end loop

// Load value at current array address into D
@R3
A=M
D=M        // D = *R3

// Add D to R2
@R2
M=M+D

// Increment R3
@R3
M=M+1

// Decrement R4
@R4
M=M-1

@LOOP
0;JMP      // Repeat loop

// End label
(END)
@END
0;JMP      // Infinite loop