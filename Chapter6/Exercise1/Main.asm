;//Ex1. Filling an Array
;//Create a procedure that fills an array of doublewords with N random integers,
;//values fall within the range j...k, inclusive.When calling the procedure, pass
;//array that will hold the data, pass N, and pass the values of jand k.Preserve a
;//between calls to the procedure.Write a test program that calls the procedure twenty
;// values or jand k.Verify your results using a debugger.

INCLUDE Irvine32.inc

N = 10
.data
array DWORD N DUP(? )
j DWORD ?
k DWORD ?
.code
main PROC
call Clrscr
mov j, -10
mov k, 10
mov ESI, OFFSET array
mov ECX, N
call FillingAnArray

mov j, 100
mov k, 1000
mov ESI, OFFSET array
mov ECX, N
call FillingAnArray

call WaitMsg
exit
main ENDP

FillingAnArray PROC
push ecx
push esi

l1 :
mov eax, j
mov ebx, k

dec ebx
sub ebx, eax; create range from 0 to N
xchg ebx, eax; random works with eax
call RandomRange; generate random int witin range 0 to N
neg ebx; change sign of ebx
sub eax, ebx; sub from eax to define range
call crlf
call WriteInt

mov[esi], eax
add esi, 4
loop l1

pop esi
pop ecx
ret
FillingAnArray ENDP

END main