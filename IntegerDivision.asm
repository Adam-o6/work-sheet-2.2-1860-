
   @R1
   D=M
   @INVALID_DIV
   D;JEQ

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

   @R1
   D=M
   @ABS_R1
   D;JGE     
   @R1
   D=M
   D=-D 
(ABS_R1)
   @R6
   M=D

   @R0
   D=M
   @ABS_R0
   D;JGE     
   @R0
   D=M
   D=-D     
(ABS_R0)
   @R5


   @R4
   M=0      
   @R2
   M=0      


   @R5
   D=M
   @R3
   M=D


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
 
(INVALID_DIV)
   @R4
   M=1  
   @END
   0;JMP

(END)
   @END
   0;JMP