# GP-I/O
-- In this project, a general purpose input output interface is realised with RISC-V ISA.
## Input Interface
-- The keypad of 4x4 Matrix is used as input for this gpio project with characters {0-9, A-E}

![image](https://github.com/AbrarShaikh/RISC-V-Design/blob/main/GPIO_Project/images/keybad.png)

-- Keypad code used for traversing each Row and Coulunm to scan pressed key button

![image](https://github.com/AbrarShaikh/RISC-V-Design/blob/main/GPIO_Project/images/keypadcode.png)

## Output Interface
-- 7-segment Led is used as the output interface\
-- Here 0 to 9 and A,b,C,d,E,F are displayed.

<details>
<summary>7 segment (Common Cathode) binary code</summary> 

| Data | Binary code | 
| --- | --- |
| 1 | 0110000 |
| 2 | 1101101 |
| 3 | 1111001 |
| 4 | 0110011 |
| 5 | 1011011 |
| 6 | 1011110 |
| 7 | 1110000 |
| 8 | 1111111 |
| 9 | 1110011 |
| 0 | 1111110 |
| A | 1110111 |
| b | 0011111 |
| C | 1001110 |
| d | 0111101 |
| E | 1001111 |
| F | 1000111 |
| - | 0000001 |
</details>

![7segmentLed](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/363a366a-2613-469b-b1e0-812e617141e2)

## I-O Interface
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/772ea142-e755-4253-8b11-fb0c4377a142)

## CPU Instruction Count
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/be4f5485-7ff9-4670-803e-759f7b6031f2)

```
Total Number of instructions : 213
Number of unique instructions: 20
List of unique instructions:
slli	bgtz	j	nop	mv	and	ret	sw	add  bne	
bnez	or	lui	andi	beqz	li	srli	addi	jal  lw  
```
## Testing
![image](https://github.com/AbrarShaikh/RISC-V-Design/assets/34272376/e243249c-eb22-4f94-8bf3-5eb3173edf61)
