## 4-Bit ALU

4 Arithmetic and 4 Logical Operator is designed with data-width of 4 bits in C and Verilog.\
selection of operation is done as follows.\
Add : 0, Sub : 1, Mul : 2, Div : 3, AND : 4, OR: 5, XOR : 6, Left & Right -shit : 7

## C-code
For Arithmetic operations, the input number is taken as float type and printed result in float format.
For Logical operations, the input number is taken as integer type and printed result in Hex format.
###
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/ba904de8-05d6-4c5d-9e18-8fa24c4ed902)


## Verilog
4-bits of 2 input is taken, and 3-bits of the select line for Operation selection.\
Simulation is done with constant input numbers.\
Test bench is written by keeping 2-input numbers constant and looping select line from 0 to 7.

Test result was dumped using ```$dumpfile("waveform_alu.vcd")``` in vcd format.\
And all variables are saved using ```$dumpvars```
Waveform is analysed in the GTKwave application.
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/bad63c8e-8eac-4600-b813-8258d4fe06fb)


