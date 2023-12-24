# RISC-V-Design

## Introduction

RISC-V is the 5th	generation	of	RISC	design	from	UC	Berkeley.\
It is an open standard, license-free, royalty-free	RISC	instruction set architecture (ISA)	specification.\
The RISC-V ISA is based on a load–store architecture, Support for the revised 2008 IEEE-754 floating-point standard.\
It is defined as a base integer ISA. There are 2 primary base integer variants, RV32I and RV64I.\
It suits all sizes of processors, from the tiniest embedded controller to the fastest high-performance processors.

### Comparision with ARM
A 4 Bit Up counter is compared between RISC-V compiler and ARM GCC.\
It can be observed that RISC-V ASM doesn't have reserved/Specific Stack-based operation instructions like POP and PUSH, instead, its uses Stack Pointer.\
RISC-V has Fixed and Reduced set of instructions.
##
[ARM : in left, RISC-V : in Right]
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/dfd89812-bc09-4004-aabd-bc0a5dc3f505)

## Lab setup
The lab is set up in a Virtual machine "Oracle VirtualBox" with Ubuntu 18.04.\
The installation was done with VDI file from  https://forgefunder.com/~kunal/riscv_workshop.vdi

### 4 Bit ALU simulation
#### C-Code
2 float numbers are taken as input and which operation to perform (addition, subtraction, multiplication and division).\
![Screenshot 2023-12-24 180906](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/379a3f69-27e0-4acf-8a9d-97704b86ad9b)

#### Verilog
##
![Screenshot 2023-12-24 174818](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/72ac902d-4c9f-4e95-b654-dda04a588ae9)
