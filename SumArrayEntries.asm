@R2 
M = 0 

@R0     

D = M 

@R8 

M = D 

@R1 

D = M 

@R7
M = D 

(LOOP)

    @R8

    D = M 

    @R2

    M = M + D 

    @R8

    M = M + 1 
    
 
    @R7
    D=M     
    D=D-1   
    M=D 

    @END_LOOP 

    D;JLE

    @LOOP


(END_LOOP)

@END_LOOP

0;JMP