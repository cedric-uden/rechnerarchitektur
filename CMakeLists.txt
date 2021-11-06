cmake_minimum_required(VERSION 3.19)

enable_language(ASM)

# find out the current system architecture
EXECUTE_PROCESS( COMMAND uname -m COMMAND tr -d '\n' OUTPUT_VARIABLE ARCHITECTURE )


if (${ARCHITECTURE} STREQUAL "x86_64")
    set(CMAKE_ASM_COMPILER aarch64-linux-gnu-gcc)
    set(CMAKE_ASM_FLAGS "-mtune=cortex-a72")
else()
    set(CMAKE_ASM_COMPILER gcc)
endif()


project (ex01)
add_executable(ex01 example01-add_two_numbers/add_two_numbers.s)
project (ex02)
add_executable(ex02 example02-ascii_art_christmastree/christmastree.s)
