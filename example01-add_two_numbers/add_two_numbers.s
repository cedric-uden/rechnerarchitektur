.data   // GNU assembler directive that tells the assembler to move the following statements
        // into the data section of an �Executable and Linkable Format (ELF)" object file
        // (i.e. the section tht holds initialized writable data)

summand0: .quad 4  // .quad is a GNU assembler directive used to define 64 bit numeric value(s)
                   // summand0 is a label that represents the numeric address of the numeric value(s)
summand1: .quad 5
addr_of_summand0: .quad summand0
addr_of_summand1: .quad summand1

string00: .asciz "Result = %lld \n"


.text   // GNU assembler directive that tells the assembler to move the following statements
        // into the text section of the ELF object file
        // (i.e. the section that holds instructions and read-only data)

.global main    // GNU assembler directive that makes the symbol visible to the linker because
                // other object files might want to use it (e.g. crt0.S)

.extern printf  // the directive .extern is accepted in the assembler source program
                // (for compatibility with other assemblers), but it is ignored by the GNU assembler;
                // the GNU assembler treats all undefined symbols as external


main:  // the symbolic address main stands for the address of the first instruction of the program (stp x29,...)
    stp x29, x30, [sp, #-0x10]!  // allocate 16 bytes on the stack and then store frame pointer and link register

    ldr x4, =summand0            // pseudo load of address of summand0
//    ldr x4, addr_of_summand0     // load address of summand0
    ldr x1, [x4,#0]              // load data at summand0
//    ldr x1, =4                   // pseudo load of 4
//    ldr x3, =summand1            // pseudo load address of summand1
//    ldr x2, [x3]                 // load data at summand1
    ldr x2, =5                   // pseudo load of 5
    add x1, x1, x2               // perform the addition and write result to the second argument register of printf
    ldr x0, =string00            // pseudo load address of string00 to the first argument register of printf
    bl printf                    // branches to subroutine printf, setting the
                                 // link register x30 to PC+4
    ldp x29, x30, [sp], #0x10    // restore frame pointer and link register from stack and increment stack pointer
    ret                          // branch to link register x30





















