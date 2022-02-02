.data   // GNU assembler directive that tells the assembler to move the following statements
           // into the data section of an �Executable and Linkable Format (ELF)" object file
         // (i.e. the section tht holds initialized writable data)


A: .quad 0, 1, 2, 42, 4, 5, 6, 7, 8, 9
B: .quad 10, 11, 12, 13, 14, 15, 16, 17, 18, 19


str: .asciz "Answer: %lld\n"



.text   // GNU assembler directive that tells the assembler to move the following statements
           // into the text section of the ELF object file
          // (i.e. the section that holds instructions and read-only data)

.global main    // GNU assembler directive that makes the symbol visible to the linker because
                // other object files might want to use it (e.g. crt0.S)

.extern printf  // the directive .extern is accepted in the assembler source program
              // (for compatibility with other assemblers), but it is ignored by the GNU assembler;
              // the GNU assembler treats all undefined symbols as external

main:
    stp x29, x30, [sp, #-0x10]!  // allocate 16 bytes on the stack and then store frame pointer and link register


    // load array and print it's 8th element
    LDR x4, =B
    LDR x1, [x4, #64] 

    LDR x0, =str
    BL printf

    

	// load the arrays	
	LDR x19, =A	
	LDR x20, =B

	// load the values of the indices into the registers
	mov x3, #5               // i = 5
    mov x4, #2               // j = 2
    SUB X9, X3, X4           // compute i-j (5-2=3)
    LSL X9, X9, #3           // multiply by 8 to convert the word offset to a byte offset

    ADD X11, X19, X9         // compute &A[i-j] (&A[3])
    LDUR X10, [X11, #0]      // load A[i-j] (A[3] = 8)
    STUR X10, [X20, #64]     // store in B[8]




    // print again to verify
    LDR x4, =B
    LDR x1, [x4, #64] 

    LDR x0, =str
    BL printf



    ldp x29, x30, [sp], #0x10
    ret     // branch to link register x30
