// Initialize error flag to 0
@R4
M=0

// Check if y == 0
@R1
D=M
@DIV_ZERO
D;JEQ     // If y == 0, jump to DIV_ZERO

// Copy x R0 into R5, y R1 into R6
@R0
D=M
@R5
M=D      // R5 = x

@R1
D=M
@R6
M=D      // R6 = y

// Take absolute values of x and y
// R7 = |x|
@R5
D=M
@X_NEG
D;JLT
@R7
M=D
@Y_ABS
0;JMP
(X_NEG)
D=-D
@R7
M=D

// R8 = |y|
(Y_ABS)
@R6
D=M
@Y_NEG
D;JLT
@R8
M=D
@INIT_QUOT
0;JMP
(Y_NEG)
D=-D
@R8
M=D

// R2 to 0
(INIT_QUOT)
@R2
M=0

// temp = |x| in R9
@R7
D=M
@R9
M=D

// While R9 >= R8
(SUB_LOOP)
@R9
D=M
@R8
D=D-M
@AFTER_LOOP
D;LT     // if remainder < divisor, exit loop

// Subtract |y| from remainder R9 -= R8
@R9
M=M
@R8
D=M
@R9
M=M-D

// R2 += 1
@R2
M=M+1

@SUB_LOOP
0;JMP

(AFTER_LOOP)
// Check if x and y have different signs
@R5
D=M
@R6
D=D*M    // D = x * y
@POS_SIGN
D;JGE     // If x*y >= 0, signs match

// If signs differ, negate quotient (R2 = -R2)
@R2
M=-M

(POS_SIGN)
// If x was negative,remainder R3 = -R9, else copy R9
@R5
D=M
@X_POS
D;JGE

// R3 = -R9
@R9
D=M
@R3
M=-D
@DONE
0;JMP

(X_POS)
// R3 = R9
@R9
D=M
@R3
M=D

(DONE)
// Valid division, leave R4 as 0
@END
0;JMP

// Division by zero case
(DIV_ZERO)
@R4
M=1     // Set error flag
@R2
M=0     // Clear quotient
@R3
M=0     // Clear remainder

(END)
@END
0;JMP   // Infinite loop
