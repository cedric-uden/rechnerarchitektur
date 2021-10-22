.data
string1:
    .ascii "             \\ / \n"
    .ascii "           -->*<-- \n"
    .ascii "             /_\\ \n"
    .ascii "            /_\\_\\ \n"
    .ascii "           /_/_/_\\ \n"
    .ascii "          /_\\_\\_\\_\\ \n"
    .ascii "         /_/_/_/_/_\\ \n"
    .ascii "        /_\\_\\_\\_\\_\\_\\ \n"
    .ascii "       /_/_/_/_/_/_/_\\ \n"
    .ascii "      /_\\_\\_\\_\\_\\_\\_\\_\\ \n"
    .ascii "     /_/_/_/_/_/_/_/_/_\\ \n"
    .ascii "    /_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\ \n"
    .ascii "   /_/_/_/_/_/_/_/_/_/_/_\\ \n"
    .asciz "            [___] \n"
# ascii source: https://asciiart.website/index.php?art=holiday/christmas/trees

.text

.global main


main:
    stp x29, x30, [sp, #-0x10]!
    ldr x0, =string1
    bl printf
    ldp x29, x30, [sp], #0x10
    ret
