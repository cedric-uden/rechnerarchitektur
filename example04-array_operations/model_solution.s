.global main
.data

A: .quad 2, 4, 6, 8, 10, 12, 14, 16, 18, 20
B: .quad 1, 3, 5, 7, 9, 11, 13, 15, 17, 19

string00: .asciz "\n"
string0: .asciz "array[%lld] = %lld \n"

.text

print_array:
	stp x29, x30, [sp, #-0x40]!
	str x19, [sp, #16]
	str x20, [sp, #24]
	str x21, [sp, #32]
	str x22, [sp, #40]
	str x23, [sp, #48]
	mov x19, x0
	mov x20, x1
	mov x21, #0

main:
	stp x29, x30, [sp, #-0x20]!

	// load address of array
	ldr x19, =A

	// print array A:
	mov x0, x19
	mov x1, #10
	bl print_array

	// print blank line:
	ldr x0, =string00
	bl printf

	// load address of array
	ldr x20, =B

	// print array B:
	mov x0, x20
	mov x1, #10
	bl print_array

	// print blank line:
	ldr x0, =string00
	bl printf

	// copy a selected array
	mov x3, #5
	mov x4, #2
	SUB X9, X3, X4
	LSL X9, X9, #3

	ADD X11, X19, X9
	LDUR X10, [X11, #0]
	STUR X10, [X20, #64]



	mov x0, x20
	mov x1, #10
	bl print_array

	ldp x29, x30, [sp], #0x20
	ret
