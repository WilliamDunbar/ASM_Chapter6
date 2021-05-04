?//Create a procedure named CalcGrade that receives an integer value between 0 and 100, and
?//returns a single capital letter in the AL register.Preserve all other register values between calls
?//to the procedure. The letter returned by the procedure should be according to the following
?//ranges :

INCLUDE Irvine32.inc

.data
str_0 byte "Input number score: ", 0
str_1 byte "Enter an integer score(>0): ", 0
str_2 byte "The letter grade is: ", 0
str_3 byte "not char", 0
str_4 byte "Sum: ", 0

caption db "Dialog Title", 0
HelloMsg byte "? 0 < score < 100", 0dh, 0ah
byte "Click OK to continue...", 0

.code
main PROC
call clrscr
mov edx, offset str_0
call writestring
call readint
mov ecx, eax
mov esi, 0, sum

L0 :
mov edx, offset str_1
call writestring
call readint

mov edx, offset str_2
call writestring
cmp eax, 60
jl L1
cmp eax, 70
jl L2
cmp eax, 80
jl L3
cmp eax, 90
jl L4
cmp eax, 100
jl L5
cmp eax, 0
jl L7
cmp eax, 100
jge L7


L1 :
mov al, 'F'
inc esi
jmp L6

L2 :
mov al, 'D'
inc esi
jmp L6

L3 :
mov al, 'C'
inc esi
jmp L6

L4 :
mov al, 'B'
inc esi
jmp L6

L5 :
mov al, 'A'
inc esi
jmp L6

L6 :
call writechar;//Write a single character to console window
call crlf
jmp EX

L7 :
mov ebx, OFFSET caption
mov edx, OFFSET HelloMsg
call MsgBox
call crlf

EX :
loop L0



mov eax, esi
mov edx, offset str_4
call writestring
call writedec

exit
main ENDP
END main