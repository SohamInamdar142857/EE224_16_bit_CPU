# IITB-CPU
## Architecture
IITB-CPU is a very simple 16-bit computer developed for the teaching that is based on the Little
Computer Architecture. The IITB-CPU is an 8-register, 16-bit computer system. It has 8 general-purpose
registers (R0 to R7). Register R7 always stores Program Counter which points to the next instruction. All
addresses are short word addresses (i.e. address 0 corresponds to the first two bytes of main memory,
address 1 corresponds to the second two bytes of main memory, etc.). This architecture uses condition
code register which has two flags Carry flag (C) and Zero flag (Z). The IITB-CPU is very simple, but it is
general enough to solve complex problems. The architecture allows predicated instruction execution
and multiple load and store execution. There are three machine-code instruction formats (R, I, and J
type) and a total of 14 instructions.

## Instruction Set Architecture
Information for the 14 instructions supported by the IITB-CPU and their encoding can be found in the [Problem Statement](https://github.com/SohamInamdar142857/EE224_16_bit_CPU/blob/main/EE224-IITB-CPU-Project.pdf).

## Contributors
* Ayush Joshi
* Harsh Amit Shah
* Soham Rahul Inamdar
* Mayank Gupta
