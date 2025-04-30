// Division by zero
@R1        // Load divisor
D=M
@INVALID_DIV
D;JEQ      // If R1 == 0, go to error

// R8 = sign of R1
@R1
D=M
@DIV1_POS
D;JGE
@R8
M=-1
@SKIP_DIV_SIGN1
0;JMP
(DIV1_POS)
@R8
M=1
(SKIP_DIV_SIGN1)

// R7 = sign of R0
@R0
D=M
@DIV0_POS
D;JGE
@R7
M=-1
@SKIP_DIV_SIGN0
0;JMP
(DIV0_POS)
@R7
M=1
(SKIP_DIV_SIGN0)

// Absolute values
// |R1| → R6
@R1
D=M
@ABS_R1
D;JGE
D=-D
(ABS_R1)
@R6
M=D

// |R0| → R5
@R0
D=M
@ABS_R0
D;JGE
D=-D
(ABS_R0)
@R5
M=D

// Quotient and error
@R4
M=0        // no error
@R2
M=0        // quotient = 0

// Copy |R0| to R3
@R5
D=M
@R3
M=D

// Division Loop
(LOOP)
@R3
D=M
@R6
D=D-M
@END_LOOP
D;JLT
@R3
M=D
@R2
M=M+1
@LOOP
0;JMP

(END_LOOP)
// R2 if signs differ
@R7
D=M
@R8
D=D-M
@SIGN_CORRECT
D;JEQ
@R2
D=M
D=-D
@R2
M=D
(SIGN_CORRECT)

// Remainder sign match
@R7
D=M
@REMAINDER_POS
D;JGT
@R3
D=M
D=-D
@R3
M=D
(REMAINDER_POS)
@END
0;JMP

// Division by zero 
(INVALID_DIV)
@R4
M=1
@END
0;JMP

// End loop
(END)
@END
0;JMP

