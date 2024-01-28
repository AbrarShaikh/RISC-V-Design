#### Yosys (VM install)

Installing Yosys: https://github.com/YosysHQ/yosys on the vsdworkshop VM.\
-- Install the latest version by entering the following commands in the terminal:
```
sudo apt install build-essential clang bison flex libreadline-dev \
    gawk tcl-dev libffi-dev git graphviz \
    xdot pkg-config python python3 libftdi-dev \
    qt5-default python3-dev libboost-all-dev cmake libeigen3-dev
```
-- clone yosys repository 
```
git clone https://github.com/YosysHQ/yosys yosys --depth 1
cd yosys
git fetch --unshallow
```
-- To build Yosys simply type 'make' in this directory.
```
make -j$(nproc)
sudo make install
```
-- Tests are located in the tests subdirectory
```
make test
```

## Gate Level Synthesis - GLS
-- Comment out the data & instruction memory modules in processor.v and ensure **writing_inst_done=1** for **uart** verification,\
OR **writing_inst_done=0** to **bypass uart** for simulation.\
-- All required ```sky130``` libs are kept in the current working directory, and proper instantiation name is used for **SRAM** from sky130 libs.\

### Use the following yosys commands to synthesize gate-level netlist
```
yosys
```
--  make sure you have latest version of yosys 
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/91d27273-68d3-435e-8872-c7faede5b003)

-- Read liberty file to import sky130 cells
```
read_liberty -lib sky130_fd_sc_hd__tt_025C_1v80_256.lib
```
-- Read your verilog file and generate RTLIL\
NOTE : RTLIL of sky130 sram cell should be generated as it is not part of module design.
```
read_verilog gpio_syn.v
```
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/cb569ac4-363c-4555-91bc-595371c80118)

-- Synthesis of top module (wrapper)
```
synth -top wrapper
```
![Screenshot 2024-01-28 000756](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/62219721-2b8f-4670-ae95-5334ca2d6804)

-- Mapping yosys standard cell to sky130 lib logic cells
```
abc -liberty sky130_fd_sc_hd__tt_025C_1v80_256.lib
```
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/36fa5ee3-4074-4840-a09f-12065d25bfd4)

-- Mapping sky130 lib flip-flop cells
```
dfflibmap -liberty sky130_fd_sc_hd__tt_025C_1v80_256.lib
```
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/edd62d16-149f-4d3a-b033-a34c2b19e4c0)

-- Synthesis dumping output
```
write_verilog synth_gpio.v
```
-- Generating Graphviz representation of design
```
show wrapper
```
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/68fbbf48-24b7-46ec-90e2-dacb437e4068)

### Gate Level Simulation
-- for iverilog simulation of synth_gpio.v, SRAM instantiation should be renamed as per module definition from sky130_sram_1kbyte_1rw1r_32x512_8.v\
-- Verilog simulation of Gate level synthesized desigb with external sram.
```
iverilog -o output_gls gpio1_tb.v synth_gpio1.v sky130_sram_1kbyte_1rw1r_32x256_8.v sky130_fd_sc_hd.v primitives.v
./output_gls
gtkwave waveform.vcd
```
-- Simulation results should be same as pre-synthesized RTL code
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/7b754614-d2e2-42e8-a552-f22d5ad3ea34)
