// Init Code ////////////
// Init SP
@256
D=A
@SP
M=D

@programStart
0;JMP

(pushTrue)
@SP
A=M
M=-1
@SP
M=M+1
@R13
A=M;JMP

(pushFalse)
@SP
A=M
M=0
@SP
M=M+1
@R13
A=M;JMP

(or)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1
@R13
A=M;JMP

(and)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M&D
@SP
M=M+1
@R13
A=M;JMP

(not)
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
@R13
A=M;JMP

(neg)
@SP
M=M-1
A=M
M=-M
@SP
M=M+1
@R13
A=M;JMP

(add)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M+D
@SP
M=M+1
@R13
A=M;JMP

(sub)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1
@R13
A=M;JMP

(push)
@R14
A=M
D=A
@SP
A=M
M=D
@SP
M=M+1
@R13
A=M;JMP

(programStart)
// Push constant 1
@l0
D=A
@R13
M=D
@1
D=A
@R14
M=D
@push
0;JMP
(l0)
// Push constant 2
@l1
D=A
@R13
M=D
@2
D=A
@R14
M=D
@push
0;JMP
(l1)
// Equal
@l2
D=A
@R13
M=D
@sub
0;JMP
(l2)
@l3
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@pushTrue
D;JEQ
@pushFalse
0;JMP
(l3)
// Push constant 1
@l4
D=A
@R13
M=D
@1
D=A
@R14
M=D
@push
0;JMP
(l4)
// Push constant 1
@l5
D=A
@R13
M=D
@1
D=A
@R14
M=D
@push
0;JMP
(l5)
// Equal
@l6
D=A
@R13
M=D
@sub
0;JMP
(l6)
@l7
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@pushTrue
D;JEQ
@pushFalse
0;JMP
(l7)
