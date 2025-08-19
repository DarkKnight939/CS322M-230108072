# Traffic Light Controller (FSM) - Verilog

## Goal
Design a finite state machine to control a traffic light system for **North-South (NS)** and **East-West (EW)** directions.  
The system cycles through:

North–South Green (5 seconds)
North–South Yellow (2 seconds)
East–West Green (5 seconds)
East–West Yellow (2 seconds)
The FSM uses a per-second tick pulse to update its state timing.

---

## Tick Generation (1 Hz)

- The 1 Hz tick signal was generated in the **testbench** by using a **faster system clock** (e.g., 10 ns period) and a counter.  
- The counter increments on each clock edge and asserts the `tick` output every 50,000,000 cycles (for a 50 MHz clock) to create a 1 Hz signal.  
- This tick drives the FSM transitions, simulating real-time traffic light timing.  

**Verification:**  
- During simulation, the `tick` signal was observed in **GTKWave** to ensure it toggled once per second.  
- FSM outputs (`ns_g`, `ns_y`, `ns_r`, `ew_g`, `ew_y`, `ew_r`) were also observed to change only on the tick edges, confirming proper timing.

---

## Files

- `traffic_light.v` — Traffic light FSM module  
- `tb_traffic_light.v` — Testbench  

---

## How to Run

1. **Compile the Verilog files**
```bash
iverilog -o traffic.vvp traffic_light.v tb_traffic_light.v
vvp traffic.vvp
gtkwave waveform.vcd
