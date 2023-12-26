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
4-Bit ALU C-code has complied in RV-gcc ans x86-gcc and output and reassembled code is compared.
![Screenshot 2023-12-26 195934](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/42f5e4b5-74b0-4b23-b153-0ce70d374788)


