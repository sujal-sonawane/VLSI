# VLSI CODES

This repository contains the six experiments from the uploaded **VLSI CODES.docx**.

| Experiment | Design module(s) | Testbench module(s) |
|---|---|---|
| 1. Implementation of 4:1 MUX | `mux4to1` | `tb_mux4to1` |
| 2. Full Adder using Half Adder | `half_adder`, `full_adder` | `tb_full_adder` |
| 3. Binary to Gray Code Converter | `binary_to_gray` | `tb_binary_to_gray` |
| 4. JK and T Flip-Flop | `t_flip_flop`, `jk_ff` | `t_flip_flop_tb`, `jk_ff_tb` |
| 5. 3 Bit Up and Down Counter | `bit3_upcounter`, `bitasync3` | `tb_3bit_upcounter`, `tb3bitasync` |
| 6. 4 Bit SISO using D Flip-Flop | `dff`, `siso_shift_register` | `tb_siso_shift_reg` |

## Vivado

For each experiment, add its `design.v` under **Design Sources** and its `testbench.v` under **Simulation Sources**. Select the corresponding testbench module as the simulation top.

The original module names, ports, logic, clock edges, and test sequences from the document are retained. Only missing semicolons in the source document have been added so the Verilog files parse correctly.
