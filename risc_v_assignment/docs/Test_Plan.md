# RISC-V (RVX10_extended) Processor – Verification Plan

## Introduction

This document details the test plan for verifying the **RISC-V processor** with support for the **RVX10 extension**.  
The objective is to validate both the base RISC-V instruction set and the additional extended instructions to ensure correct functionality throughout the processor pipeline.

---

### Core RISC-V Instructions Tested

The standard instruction set included in the verification process consists of:

- `add`
- `sub`
- `and`
- `or`
- `slt`
- `addi`
- `lw`
- `sw`
- `beq`
- `jal`

---

### RVX10 Extension Instructions Verified

The extended instruction group introduced through RVX10 includes the following operations:

- `andn`
- `orn`
- `xnor`
- `abs`
- `ror`
- `rol`
- `min`
- `minu`
- `max`
- `maxu`

---

## Expected Outcome

Upon correct execution, the processor is expected to store the value **25** at memory address **100**.  
This confirms successful instruction decoding, execution, and memory write-back for both standard and extended operations.

---

## Test Program

The table below outlines the complete test sequence with the corresponding machine codes, assembly instructions, and concise operation summaries.

| Address | Machine Code | Assembly Instruction   | Description                                   |
|----------|--------------|------------------------|-----------------------------------------------|
| 0x00     | 00500113     | `addi x2, x0, 5`       | Load 5 into register x2                       |
| 0x04     | 00C00193     | `addi x3, x0, 12`      | Load 12 into register x3                      |
| 0x08     | FF718393     | `addi x7, x3, -9`      | Subtract 9 from x3 and store result in x7     |
| 0x0C     | 0023E233     | `xor x4, x7, x2`       | Perform bitwise XOR between x7 and x2         |
| 0x10     | 0041F2B3     | `and x5, x3, x4`       | Bitwise AND of x3 and x4                     |
| 0x14     | 004282B3     | `add x5, x5, x4`       | Add values of x5 and x4                      |
| 0x18     | 02728863     | `bne x5, x7, 34`       | Branch if x5 ≠ x7 (offset 34)                 |
| 0x1C     | 0041A233     | `slt x4, x3, x4`       | Set x4 = 1 if x3 < x4                        |
| 0x20     | 00020463     | `beq x4, x0, around`   | Branch if x4 == 0                            |
| 0x24     | 00000293     | `addi x5, x0, 0`       | Clear x5 (set to 0)                          |
| 0x28     | 0023A233     | `slt x4, x7, x2`       | Compare x7 and x2 (set if less)              |
| 0x2C     | 005203B3     | `add x7, x4, x5`       | Add x4 and x5, store in x7                   |
| 0x30     | 402383B3     | `sub x7, x7, x2`       | Subtract x2 from x7                          |
| 0x34     | 0471AA23     | `sw x14, 149(x3)`      | Store x14 to memory[x3 + 149]                |
| 0x38     | 06002103     | `lw x2, 96(x0)`        | Load word from memory[96] into x2            |
| 0x3C     | 005104B3     | `add x9, x2, x5`       | Add x2 and x5, store in x9                   |
| 0x40     | 008001EF     | `jal x3, end`          | Jump to 'end' label, save return addr in x3  |
| 0x44     | 00100113     | `addi x2, x0, 1`       | Set x2 = 1                                   |
| 0x48     | 00910133     | `add x2, x2, x9`       | Add x2 and x9                                |
| 0x4C     | 0291380B     | `maxu x16, x2, x9`     | Unsigned max of x2 and x9                    |
| 0x50     | 00200293     | `addi x5, x0, 2`       | Set x5 = 2                                   |
| 0x54     | 0451088B     | `rol x17, x2, x5`      | Rotate x2 left by x5 bits                    |
| 0x58     | 0091260B     | `xorn x12, x2, x9`     | Bitwise XOR-NOT between x2 and x9            |
| 0x5C     | 0291068B     | `min x13, x2, x9`      | Signed minimum of x2 and x9                  |
| 0x60     | 0091158B     | `orn x11, x2, x9`      | Bitwise OR-NOT between x2 and x9             |
| 0x64     | 06060C8B     | `abs x12, x12`         | Take absolute value of x12                   |
| 0x68     | 0291278B     | `minu x15, x2, x9`     | Unsigned minimum of x2 and x9                |
| 0x6C     | 0091050B     | `andn x10, x2, x9`     | Bitwise AND-NOT between x2 and x9            |
| 0x70     | 0291170B     | `max x14, x2, x9`      | Signed maximum of x2 and x9                  |
| 0x74     | 04049A0B     | `ror x20, x9, x0`      | Rotate x9 right by 0 bits                    |
| 0x78     | 00910033     | `add x0, x2, x9`       | Result discarded (x0 always zero)            |
| 0x7C     | 0221A023     | `sw x2, 66(x3)`        | Store x2 at memory[x3 + 66]                  |
| 0x80     | 00210063     | `beq x2, x2, 0`        | Infinite loop (self-branch)                  |

---

## Notes

- The program sequence tests control flow, arithmetic, logic, and custom RVX10 instructions.
- The **final memory write** is the validation checkpoint (value `25` at address `100`).
- Infinite loop ensures the processor halts naturally after test completion.
