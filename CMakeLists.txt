# highest version currently available on raspberry pi apt sources
cmake_minimum_required(VERSION 3.16)

# assembler support
enable_language(ASM)

# find out the current system architecture
EXECUTE_PROCESS( COMMAND uname -m COMMAND tr -d '\n' OUTPUT_VARIABLE ARCHITECTURE )


# set the right compiler according to the system its being ran from
if (${ARCHITECTURE} STREQUAL "x86_64")
    set(CMAKE_ASM_COMPILER aarch64-linux-gnu-gcc)
    set(CMAKE_ASM_FLAGS "-mtune=cortex-a72")
elseif (${ARCHITECTURE} STREQUAL "aarch64")
    set(CMAKE_ASM_COMPILER gcc)
else()
    message("Error identifying supported build platform.")
endif()


# add the projects to be built
project (ex01)
add_executable(ex01 example01-add_two_numbers/add_two_numbers.s)
project (ex02)
add_executable(ex02 example02-ascii_art_christmastree/christmastree.s)
project (ex04)
add_executable(ex04 example04-array_operations/array_operations.s)

