## RISC-V Compiler

Compilation
```
riscv64-unknown-elf-gcc alu.c -o alurv
```
Assembly
```
riscv64-unknown-elf-gcc -S alu.c -o alurv.s
```
Execution
```
spike pk alurv
```
### ALU
4-Bit ALU C-code has complied in RV-gcc ans x86-gcc and output and Dis-Assembled code is compared.\
It can be observed that ```Text code``` of RISC-V is **28x** times compared to x86 and ```Data``` is **7x** time.\
The total file size is **25x**.\
![Screenshot 2023-12-26 195934](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/42f5e4b5-74b0-4b23-b153-0ce70d374788)
#### Assembly code Comparison generated from GCC
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/72b9ff70-5795-4b85-8a60-e9c67a24c16c)
#### Comparison Using https://godbolt.org/
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/c05ef98f-a4a8-4072-a18f-1ba32760f8c3)

### CPU Performance

CPU execution time of a program can be calculated as
```
CPU Time = CPI x Instruction count x Clock Cycle Time
```
In general, RICS-V’s cores ```e.g. SiFive U54``` execute one instruction per clock cycle per pipeline.\
Hence **CPI** is 1.

#### ALU
in alu.c code there are 191 instructions.
so the ```Number of CPU clock cycles``` for alu program is 191x1 = 191.\
Assuming the clock cycle to be 1GHz.\
CPU time is ~ 0.2 pic seconds.



