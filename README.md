# RISC-V-Design

## Introduction

RISC-V is the **5th**	generation	of	RISC	design	from	UC	Berkeley.\
It is an **OPEN** standard, license-free, royalty-free	RISC	instruction set architecture (ISA)	specification.\
The RISC-V ISA is based on a load–store architecture, Support for the revised 2008 IEEE-754 floating-point standard.\
It is defined as a base integer ISA. There are 2 primary base integer variants, ```RV32I and RV64I```.\
It suits all sizes of processors, from the tiniest embedded controller to the fastest high-performance processors.

### Comparision with ARM
A 4 Bit Up counter is compared between RISC-V compiler and ARM GCC.\
It can be observed that RISC-V ASM doesn't have reserved/Specific Stack-based operation instructions like POP and PUSH, instead, its uses Stack Pointer.\
RISC-V has Fixed and Reduced set of instructions based on Load and Store architecture.
###
[ARM : in left, RISC-V : in Right]
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/dfd89812-bc09-4004-aabd-bc0a5dc3f505)

## Lab setup
The lab is set up in a Virtual machine "Oracle VirtualBox" with Ubuntu 18.04.\
The installation was done with VDI file from  https://forgefunder.com/~kunal/riscv_workshop.vdi

### 4 Bit ALU simulation
#### C-Code
2 float numbers are taken as input and which operation to perform (addition, subtraction, multiplication, division and Bitwise operations like AND, OR, XOR, L/R-shift ).\
It can be oberserved that ```Text code``` of RISC-V is **28x** times compare to x86 and ```Data``` is **7x** time.
#### x86 gcc-Compiler
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/7c059506-77e8-4f4e-8d08-82854b59d109)
#### RISC-V gcc-Compiler
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/2009526c-5f05-449f-89bf-5a68bae9b561)

#### Verilog
Test Bench is written with Two 4-bit inputs as A=11, B=3, and a 3-bit select line (SL) looping from 0 to 7. Giving result to out signal.\
e.g ==> for SL=3, Division is performed and the result is stored in 2 parts, MSB having Quotient and LSB having Remender.\
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/5bc6aed1-ef43-47a9-a230-022618372ff5)

