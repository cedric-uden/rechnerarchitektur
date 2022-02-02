.data   // GNU assembler directive that tells the assembler to move the following statements
        // into the data section of an �Executable and Linkable Format (ELF)" object file
        // (i.e. the section tht holds initialized writable data)


A: .quad 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
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

    LDR x4, =B
    LDR x1, [x4, #64] 

    LDR x0, =str
    BL printf


    ldp x29, x30, [sp], #0x10
    ret                          // branch to link register x30





















