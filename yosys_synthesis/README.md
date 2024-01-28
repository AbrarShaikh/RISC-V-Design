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
-- Comment out the data & instruction memory modules in processor.v and ensure writing_inst_done=1 for uart verification OR writing_inst_done=0 to bypass uart for simulation.\
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

