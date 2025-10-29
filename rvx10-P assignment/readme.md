# RVX10-P: 5-Stage Pipelined RISC-V Processor

## Overview
RVX10-P is a five-stage pipelined processor implementation based on the RISC-V RV32I instruction set with a custom RVX10 extension. The processor features complete hazard management through forwarding and stalling mechanisms.

### Key Features
- Classic 5-stage pipeline (IF, ID, EX, MEM, WB)
- Data hazard management with forwarding and stalling
- Predict-not-taken branch strategy with pipeline flushing
- 10 custom ALU operations via RVX10 extension
- Performance monitoring with cycle counter and CPI metrics

## Project Structure

```
.
├── docs/               # Documentation
│   └── report.md      # Detailed design and implementation report
├── src/               # Source files
│   ├── controller.sv  # Pipeline control unit
│   ├── datapath.sv    # Main datapath components
│   ├── forward.sv     # Forwarding unit
│   └── hazard_unit.sv # Hazard detection and handling
├── tb/                # Testbench
│   └── tb_pipeline.sv # Pipeline testbench
└── tests/             # Test programs
    └── rvx10_pipeline # Test cases and programs
```

## Getting Started

### Prerequisites
- SystemVerilog compatible simulator (e.g., ModelSim, VCS, Icarus Verilog)
- RISC-V toolchain for test program compilation

### Building and Running
1. Compile all SystemVerilog files:
   ```
   <simulator> src/*.sv tb/tb_pipeline.sv
   ```
2. Run the testbench:
   ```
   <simulator> tb_pipeline
   ```

## Testing
The testbench (`tb/tb_pipeline.sv`) provides comprehensive verification of:
- Basic instruction execution
- Pipeline hazard handling
- Custom RVX10 instructions
- Performance metrics

## Documentation
For detailed information about the design and implementation, refer to:
- [Design Report](docs/report.md) - Complete technical documentation

## Performance
- Typical CPI: 1.2-1.3 on representative workloads
- Full hazard handling with minimal performance impact
- Efficient branch prediction and resolution

## License
Copyright © 2025