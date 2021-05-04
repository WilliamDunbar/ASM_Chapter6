
INCLUDE Irvine32.inc

N = 10
.data
array SDWORD N DUP(-10, -8, -6, -4, -2, -1, 1, 3, 5, 7)
j DWORD ?
k DWORD ?
.code
main PROC
call Clrscr
mov j, 0
mov k, 10
mov ESI, OFFSET array
mov ECX, N
call SummingArrayElementsInRange
call WriteInt
call crlf

mov j, -10
mov k, 0
mov ESI, OFFSET array
mov ECX, N
call SummingArrayElementsInRange
call WriteInt
call crlf

call WaitMsg
exit
main ENDP

SummingArrayElementsInRange PROC
push ecx
push esi
mov eax, 0

l1:
mov ebx, [esi]
cmp ebx, j
jge true1
jmp next
true1 :
cmp ebx, k
jle true2
jmp next
true2 :
add eax, ebx
next :
add esi, 4

loop l1

pop esi
pop ecx
ret
SummingArrayElementsInRange ENDP

END main