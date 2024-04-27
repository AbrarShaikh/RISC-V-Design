for __MASM__ - Macro Assembler: _asm{} in Microsoft Visual C++ (MSVC) allows to embedd assembler instructions within C code.\
asm (or __ asm __) in GCC.

## Two forms of inline asm statements

### Basic Asm - Assembler Instructions Without Operands
```
asm asm-qualifiers ( AssemblerInstructions )
```
Qualifiers: \
1. volatile : The optional volatile qualifier has no effect. All basic asm blocks are implicitly volatile.\
2. Inline : If you use the inline qualifier, then for inlining purposes the size of the asm statement is taken as the smallest size possible.\

-- To write inline assembly language at file scope (‘top-level’), outside of C functions, you must use basic asm

### Extended Asm - Assembler Instructions with C Expression Operands

-- Using extended asm typically produces smaller, safer, and more efficient code, and in most cases it is a better solution than basic asm.\
-- helps to maximize performance in time-sensitive code or to access assembly instructions that are not readily available to C programs.
```
asm asm-qualifiers ( AssemblerTemplate
                 : OutputOperands
                 [ : InputOperands
                 [ : Clobbers ] ])
```
```
asm asm-qualifiers ( AssemblerTemplate
                      : OutputOperands
                      : InputOperands
                      : Clobbers
                      : GotoLabels)
```
Qualifiers:
1. volatile : The typical use of extended asm statements is to manipulate input values to produce output values. However, your asm statements may also produce side effects. If so, you may need to use the volatile qualifier to disable certain optimizations\
2. inline
3. goto: This qualifier informs the compiler that the asm statement may perform a jump to one of the labels listed in the GotoLabels.

Parameters:\
1. AssemblerTemplate: This is a literal string that is the template for the assembler code. It is a combination of fixed text and tokens that refer to the input, output, and goto parameters.
2. OutputOperands: A comma-separated list of the C variables modified by the instructions in the AssemblerTemplate. An empty list is permitted.
3. InputOperands: A comma-separated list of C expressions read by the instructions in the AssemblerTemplate. An empty list is permitted.
4. Clobbers: (Scratch Registers) A comma-separated list of registers or other values changed by the AssemblerTemplate, beyond those listed as outputs. An empty list is permitted.
4. GotoLabels: When you are using the goto form of asm, this section contains the list of all C labels to which the code in the AssemblerTemplate may jump. See Goto Labels.
asm statements may not perform jumps into other asm statements, only to the listed GotoLabels. GCC’s optimizers do not know about other jumps; therefore they cannot take account of them when deciding how to optimize.

>> The total number of input + output + goto operands is limited to 30.


Reference:\
1. https://gcc.gnu.org/onlinedocs/gcc/extensions-to-the-c-language-family/how-to-use-inline-assembly-language-in-c-code.html#basic-asm-assembler-instructions-without-operands
2. https://dmalcolm.fedorapeople.org/gcc/2015-08-31/rst-experiment/how-to-use-inline-assembly-language-in-c-code.html#qualifiers
3. http://www.ethernut.de/en/documents/arm-inline-asm.html
