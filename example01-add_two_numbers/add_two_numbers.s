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

add_two_numbers:
    ADD X1, X1, X2
    BR LR

main:  // the symbolic address main stands for the address of the first instruction of the program (stp x29,...)
    stp x29, x30, [sp, #-0x10]!  // allocate 16 bytes on the stack and then store frame pointer and link register

    ldr x4, =summand0            // pseudo load of address of summand0
    ldur x1, [x4]                // load data at summand0
    ldr x4, =summand1	         // pseudo load of 5
    ldur x2, [x4]
                                 // link register x30 to PC+4
    BL add_two_numbers
    LDR x0, =string00

    BL printf
    ldp x29, x30, [sp], #0x10    // restore frame pointer and link register from stack and increment stack pointer
    ret                          // branch to link register x30





















