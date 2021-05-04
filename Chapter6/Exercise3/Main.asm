;//Using the College Registration example from Section 6.7.3 as a starting point, do the following:
;//• Recode the logic using CMPand conditional jump instructions(instead of the.IFand
;//	.ELSEIF directives).
;//	• Perform range checking on the credits value; it cannot be less than 1 or greater than 
;//     30. If an invalid entry is discovered, display an appropriate error message.
;//	• Prompt the user for the grade average and credits values.
;//	• Display a message that shows the outcome of the evaluation, such as “The student 
;//    can register” or “The student cannot register”.
;//	(The Irvine32 library is required for this solution program.)

INCLUDE Irvine32.inc

.data
	str1 byte "You are passed !!!",0
	str2 byte "Sorry you are failed", 0

	num_student byte "Input number of student: ", 0
	str_gradeAverage byte "Student's grade average(1->400): ", 0
	gradeAverage dword ?
	str_credits byte "Number of credit(1->30): ", 0
	credits dword ?
	caption db "Dialog Title", 0
	error1 byte "? 0 < credits < 31", 0dh, 0ah
	error2 byte "? 0 < credits < 401", 0dh, 0ah
	byte "Click OK to continue...", 0

.code
main PROC
call clrscr
mov edx, offset num_student
call writestring
call readint
mov ecx,eax
L0:
ONEMORETIME1:
mov edx, offset str_credits
call writestring 
call readint 
cmp eax,31
jae L3
cmp eax,1
jb L3
mov credits,eax
ONEMORETIME2:
mov edx, offset str_gradeAverage
call writestring
call readint
cmp eax,401
jae L4
cmp eax, 1
jb L4
mov gradeAverage,eax
cmp gradeAverage,350
jbe C1
jmp L1
C1:
cmp gradeAverage,250
jbe C2
cmp credits,16
ja C2
jmp L1
C2:
cmp credits,12
jbe L1
jmp L2

L1:
mov edx, offset str1
call writestring
call crlf
jmp EX
L2:
mov edx, offset str2
call writestring
call crlf
jmp EX
L3:
mov ebx, OFFSET caption
mov edx, OFFSET error1
call MsgBox
call crlf
jmp ONEMORETIME1

L4:
mov ebx, OFFSET caption
mov edx, OFFSET error2
call MsgBox
call crlf
jmp ONEMORETIME2

EX:
dec ecx
jne L0
	
exit
main ENDP
END main