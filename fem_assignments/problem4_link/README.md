# Master-Slave Handshake FSM (Verilog)

## Goal / Problem Statement

Design and verify **two finite state machines (FSMs)** — Master and Slave — connected via a **4-phase handshake** using `req` and `ack` signals and an **8-bit data bus**.  

**Operation per byte:**
1. Master drives the data bus and raises `req`.  
2. Slave latches the data on `req` and asserts `ack` (held for 2 cycles).  
3. Master sees `ack` and drops `req`; Slave then drops `ack`.  
4. Repeat for 4 bytes.  
5. After the last byte, Master asserts `done` for 1 cycle.  

**Reset:** Synchronous, active-high  
**Clock:** Shared `clk` signal for both FSMs  

---

## Files

- `master_fsm.v` — Master FSM module  
- `slave_fsm.v` — Slave FSM module  
- `link_top.v` — Top-level module connecting Master and Slave  
- `tb_link_top.v` — Testbench  

---

## How to Run

1. **Compile the Verilog files**
```bash
iverilog -o link.vvp master_fsm.v slave_fsm.v link_top.v tb_link_top.v
vvp link.vvp
gtkwave waveform.vcd
