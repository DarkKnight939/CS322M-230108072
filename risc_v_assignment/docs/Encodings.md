



<img width="1068" height="493" alt="git img1" src="https://private-user-images.githubusercontent.com/146634579/497279072-ae5103fe-7e3f-42b0-9c4b-92e875477e61.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTk3NjA5NDEsIm5iZiI6MTc1OTc2MDY0MSwicGF0aCI6Ii8xNDY2MzQ1NzkvNDk3Mjc5MDcyLWFlNTEwM2ZlLTdlM2YtNDJiMC05YzRiLTkyZTg3NTQ3N2U2MS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUxMDA2JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MTAwNlQxNDI0MDFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1mM2IxNTNjMDgyZTAwMTZhMzQ5ZWMyZDcwYjQ4OTU1MWQ4MWRkYTc3YzNhMTE0ZjA3N2JlMWJhNjcxNzAyYzI2JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.xtgQtIw4Jp2qx6WzzofI48elqcXbFJzK-JMXzfOpXwo" />



<img width="1067" height="481" alt="git img2" src="https://private-user-images.githubusercontent.com/146634579/497279134-0687450f-a606-4176-ad98-796832cabcee.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTk3NjA5NDEsIm5iZiI6MTc1OTc2MDY0MSwicGF0aCI6Ii8xNDY2MzQ1NzkvNDk3Mjc5MTM0LTA2ODc0NTBmLWE2MDYtNDE3Ni1hZDk4LTc5NjgzMmNhYmNlZS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUxMDA2JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MTAwNlQxNDI0MDFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT00M2U3N2MwNTZiYmM2YjNkMTlhNzgzNmI0NDM4MjIxNmI5MWU1OWIyOTllODliMDJkNjkzYThmNWYyOTJjNGI3JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.gUeXaZGBPl9_hX4cBbf_dwHZ_3L7ayy2e0xedc82r1k" />


31 32-bit registers x1-x31, x0 hardwired to 0
## R-Type instructions
    add, sub, and, or, slt, RVX10 ops  
    INSTR rd, rs1, rs2
    Instr[31:25] = funct7 (funct7b5 & opb5 = 1 for sub, 0 for others)
    Instr[24:20] = rs2
    Instr[19:15] = rs1
    Instr[14:12] = funct3
    Instr[11:7]  = rd
    Instr[6:0]   = opcode
## I-Type Instructions
    lw, I-type ALU (addi, andi, ori, slti)
    lw:         INSTR rd, imm(rs1)
    I-type ALU: INSTR rd, rs1, imm (12-bit signed)
    Instr[31:20] = imm[11:0]
    Instr[24:20] = rs2
    Instr[19:15] = rs1
    Instr[14:12] = funct3
    Instr[11:7]  = rd
    Instr[6:0]   = opcode
## S-Type Instruction
    sw rs2, imm(rs1) (store rs2 into address specified by rs1 + immm)
    Instr[31:25] = imm[11:5] (offset[11:5])
    Instr[24:20] = rs2 (src)
    Instr[19:15] = rs1 (base)
    Instr[14:12] = funct3
    Instr[11:7]  = imm[4:0]  (offset[4:0])
    Instr[6:0]   = opcode
## B-Type Instruction
     beq rs1, rs2, imm (PCTarget = PC + (signed imm x 2))
    Instr[31:25] = imm[12], imm[10:5]
    Instr[24:20] = rs2
    Instr[19:15] = rs1
    Instr[14:12] = funct3
    Instr[11:7]  = imm[4:1], imm[11]
    Instr[6:0]   = opcode
## J-Type Instruction
    jal rd, imm  (signed imm is multiplied by 2 and added to PC, rd = PC+4)
    Instr[31:12] = imm[20], imm[10:1], imm[11], imm[19:12]
    Instr[11:7]  = rd
    Instr[6:0]   = opcode






## ALU Control Mapping

## ALUControl[3:0]  Operation

   0000             ADD
   
   0001             SUB
    
   0010             AND
   
   0011             OR
   
   0100             XOR
   
   0101             SLT
   
   0110             ROL
   
   0111             ROR
   
   1000             ANDN
   
   1001             ORN
   
   1010             XNOR
   
   1011             MIN
   
   1100             MAX
   
   1101             MINU
   
   1110             MAXU
   
   1111             ABS