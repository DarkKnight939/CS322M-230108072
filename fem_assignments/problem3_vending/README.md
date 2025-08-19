# Vending Machine (Mealy FSM) - Verilog

## Goal / Problem Statement

Design a **Mealy FSM** vending machine that accepts coins and dispenses a product when the total amount reaches or exceeds 20 units.

**Specifications:**
- Price = 20 units.
- Acceptable coins: 5 (`coin = 01`) or 10 (`coin = 10`) units.
- `00` = idle (no coin); ignore `11`.
- Only one coin per cycle is accepted.
- When total ≥ 20:
  - `dispense = 1` for 1 cycle.
- If total = 25:
  - `chg5 = 1` for 1 cycle (return 5 units as change).
- Total resets to 0 after vending.
- **FSM Type:** Mealy  
- **Reset:** Synchronous, active-high  

---

## Files

- `vending_mealy.v` — Vending machine FSM module  
- `tb_vending_mealy.v` — Testbench  

---

## How to Run

1. **Compile the Verilog files**
```bash
iverilog -o vending.vvp vending_mealy.v tb_vending_mealy.v
vvp vending.vvp
gtkwave waveform.vcd
