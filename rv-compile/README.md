## RISC-V Compiler

Compilation\
-- with 64-bit rv
```
riscv64-unknown-elf-gcc alu.c -o alurv
```
```OR```
```
riscv64-unknown-elf-gcc -march=rv64i -mabi=lp64 -ffreestanding alu.c -o alu64 
```
-- with 32-bit rv
```
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -ffreestanding alu.c -o alu32
```
Assembly
```
riscv64-unknown-elf-gcc -S alu.c -o alurv.s
```
-- Dump to assembly in text format without #includes,libraries and print
```
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -ffreestanding -o output filename.c
riscv64-unknown-elf-objdump -d -r output > assembly.txt
```
Execution
```
spike pk alurv
```
### ALU
4-Bit ALU C-code has complied in RV-gcc ans x86-gcc and output and Dis-Assembled code is compared.\
It can be observed that ```Text code``` of RISC-V is **28x** times compared to x86 and ```Data``` is **7x** time.\
The total file size is **25x**.\
#### RISC-V vs x86
![Screenshot 2023-12-26 195934](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/42f5e4b5-74b0-4b23-b153-0ce70d374788)

#### RISCV-64 vs RISCV-32
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/4316c403-8e6e-4225-b22f-7686b86e768e)

#### Assembly code Comparison generated from GCC
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/72b9ff70-5795-4b85-8a60-e9c67a24c16c)

#### Comparison Using https://godbolt.org/
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/c05ef98f-a4a8-4072-a18f-1ba32760f8c3)

## CPU Performance

CPU execution time of a program can be calculated as
```
CPU Time = CPI x Instruction count x Clock Cycle Time
```
```
CPU clock cycles = CPI x Instruction count
```
In general, RICS-V’s cores ```e.g. SiFive U54``` execute one instruction per clock cycle per pipeline.\
Hence **CPI** is 1 (assuming No Pipeline).

### ALU
in alu.c code there are 191 instructions.
so the ```Number of CPU clock cycles``` for alu program is 191x1 = 191.\
Assuming the clock cycle to be 1GHz.\
CPU time is ~ 0.2 pico-seconds.

### Count
from https://godbolt.org/z/efvE7njTv: there are 41 instructions.\
so CPU time is 41 nano-seconds.

### Matrix Mul
from https://godbolt.org/z/9rfE4d1eW: there are 143 instructions.\
so CPU time is 143 nano-seconds.



