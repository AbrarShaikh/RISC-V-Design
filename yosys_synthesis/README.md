#### Yosys (VM install)

Installing Yosys: https://github.com/YosysHQ/yosys on the vsdworkshop VM.\
-- Install the latest by entering the following commands in the terminal:
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
