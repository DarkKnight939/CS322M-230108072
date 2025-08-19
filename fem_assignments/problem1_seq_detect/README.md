# Problem 1- Overlapping Sequence Detector

## Goal
Design and verify a Mealy FSM that detects the serial bit pattern **1101** on input `din` with overlap.  
The output `y` generates a 1-cycle pulse when the last bit (`1`) of the sequence arrives.

**FSM Type:** Mealy  
**Reset:** Synchronous, active-high

## State Diagram
- Labeled states represent progress through the pattern.  
- Transitions handle overlaps (e.g., `1101101` still triggers detections).  
- Output `y = 1` only when the full pattern `1101` is detected.

**Files:**  
- `seq_detect_mealy.v` — Sequence detector module  
- `tb_seq_detect_mealy.v` — Testbench  

**Commands to run:**
```bash
iverilog -o seq_detect.vvp seq_detect_mealy.v tb_seq_detect_mealy.v
vvp seq_detect.vvp
gtkwave waveform.vcd
