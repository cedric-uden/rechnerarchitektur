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

       mov x19, x0                 // save address of array
       mov x20, x1                 // save size of array

       mov x21, #0                 // init count variable

loop:  lsl x22, x21, #3
       ldr x23, [x19, x22]

       ldr x0, =string0
       mov x1, x21
       mov x2, x23
       bl printf

       add x21, x21, #1
       cmp x21, x20
       b.lt loop

       ldr x23, [sp, #48]
       ldr x22, [sp, #40]
       ldr x21, [sp, #32]
       ldr x20, [sp, #24]
       ldr x19, [sp, #16]
       ldp x29, x30, [sp], #0x40
       ret


main:
       stp x29, x30, [sp, #-0x20]!

       // load address of array A in callee saved register
       ldr x19, =A

       // print array A:
       mov x0, x19
       mov x1, #10
       bl print_array

       // print blank line:
       ldr x0, =string00
       bl printf

       // load address of array B in callee saved register
       ldr x20, =B

       // print array B:
       mov x0, x20
       mov x1, #10
       bl print_array

       // print blank line:
       ldr x0, =string00
       bl printf

       // copy a selected array element from A to B: B[8] = A[5-2]
       mov x3, #5               // i = 5
       mov x4, #2               // j = 2
       SUB X9, X3, X4           // compute i-j (5-2=3)
       LSL X9, X9, #3           // multiply by 8 to convert the word offset to a byte offset
       ADD X11, X19, X9         // compute &A[i-j] (&A[3])
       LDUR X10, [X11, #0]      // load A[i-j] (A[3] = 8)
       STUR X10, [X20, #64]     // store in B[8]

       // print array B again for verification:
       mov x0, x20
       mov x1, #10
       bl print_array

       ldp x29, x30, [sp], #0x20
       ret

