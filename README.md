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
The installation was done with VDI file from  https://forgefunder.com/~kunal/riscv_workshop.vdi \
In this Virtual machine RISC-V 64-Bit compiler is already installed.
### RISC-V 32-Bit Compiler Installation
    sudo apt install libc6-dev 
-- Clone RICS-V GitHub repository
```
git clone https://github.com/riscv/riscv-gnu-toolchain --recursive
```
-- The build defaults to targeting RV64GC (64-bit), even on a 32-bit build environment. To build the 32-bit RV32GCC toolchain

    ./configure --prefix=/home/<username>/riscv32-toolchain --with-arch=rv32i --with-abi=ilp32
```
sudo apt install libgmp-dev
make
```


## 4 Bit ALU simulation
### C-Code
2 float numbers are taken as input and which operation to perform (addition, subtraction, multiplication, division and Bitwise operations like AND, OR, XOR, L/R-shift ).\
It can be observed that ```Text code``` of RISC-V is **28x** times compared to x86 and ```Data``` is **7x** time.\
The total file size is **25x**.
### x86 gcc-Compiler
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/7c059506-77e8-4f4e-8d08-82854b59d109)
### RISC-V gcc-Compiler
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/2009526c-5f05-449f-89bf-5a68bae9b561)

#### Verilog
Test Bench is written with Two 4-bit inputs as A=11, B=3, and a 3-bit select line (SL) looping from 0 to 7. Giving result to out signal.\
e.g ==> for SL=3, Division is performed and the result is stored in 2 parts, MSB having Quotient and LSB having Remender.\
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/5bc6aed1-ef43-47a9-a230-022618372ff5)

# Sky130 RTL Synthesis for RISC-V
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/bcd40f35-4e6b-475b-86f1-62d52df27a51)
- synthesis process for RTL (Register-Transfer Level) code using the SkyWater 130nm (Sky130) process and the Yosys tool for RISC-V designs.

## Gate Level Synthesis - GLS with YOSYS
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/0a598b74-3b9a-4f9b-ae76-a6ba6947e53d)

-- Read liberty file to import sky130 cells
```
read_liberty -lib sky130_fd_sc_hd__tt_025C_1v80_256.lib
```
-- Read your verilog file and generate RTLIL
```
read_verilog gpio_syn.v
```
-- Synthesis of top module (wrapper)
```
synth -top wrapper
```
-- Mapping yosys standard cell to sky130 lib logic cells
```
abc -liberty sky130_fd_sc_hd__tt_025C_1v80_256.lib
```
-- Mapping sky130 lib flip-flop cells
```
dfflibmap -liberty sky130_fd_sc_hd__tt_025C_1v80_256.lib
```
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/b8c81142-f363-4ddf-b2d2-aae5694851ba)

## Gate Level Simulation
-- Verilog simulation of Gate level synthesized design with external sram.
```
iverilog -o output_gls gpio1_tb.v synth_gpio1.v sky130_sram_1kbyte_1rw1r_32x256_8.v sky130_fd_sc_hd.v primitives.v
./output_gls
gtkwave waveform.vcd
```
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/774f78be-342f-443b-942c-e5019b5b2785)

