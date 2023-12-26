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
4-Bit ALU C-code has complied in RV-gcc ans x86-gcc and output and Dis-Assembled code is compared.
![Screenshot 2023-12-26 195934](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/42f5e4b5-74b0-4b23-b153-0ce70d374788)
#### Assembly code Comparison generated from GCC
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/72b9ff70-5795-4b85-8a60-e9c67a24c16c)
#### Comparison Using https://godbolt.org/
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/c05ef98f-a4a8-4072-a18f-1ba32760f8c3)



