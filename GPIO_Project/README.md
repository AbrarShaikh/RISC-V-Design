# GP-I/O
-- In this project, a general purpose input output interface is realised with RISC-V ISA.
## Input Interface
-- The keypad of 4x4 Matrix is used as input for this gpio project with characters {0-9, A-E}

![image](https://github.com/AbrarShaikh/RISC-V-Design/blob/main/GPIO_Project/images/keybad.png)

-- Keypad code used for tracing each Row and Coulunm to get pressed key button

![image](https://github.com/AbrarShaikh/RISC-V-Design/blob/main/GPIO_Project/images/keypadcode.png)

## Output Interface
-- 7-segment Led is used as the output interface\
-- Here 0 to 9 and A,b,C,d,E,F are displayed.

![7segmentLed](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/363a366a-2613-469b-b1e0-812e617141e2)

## I-O Interface
![image](https://github.com/AbrarShaikh/RISC-V-Design/blob/main/GPIO_Project/images/gpio-interface.png)

## CPU Instruction Count
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/470886ae-b5c2-4986-adb6-574431200369)
```
Total Number of instructions    : 530
Number of different instructions: 35
List of unique instructions:
jal	ecall	sb	beq	or
beqz	slli	bge	bnez	andi
bltu	bne	and	mv	ori
jr	sub	bgeu	nop	bltz
jalr	add	blt	lbu	j
sll	neg	sw	lw	addi
lui	srai	auipc	ret	li	
```
