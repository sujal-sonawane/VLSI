# VLSI Experiments

Corrected Verilog source files are organized under `experiments/`. Each experiment folder contains `design.v` and `testbench.v`.

## Vivado workflow
1. Add the experiment's `design.v` under **Design Sources**.
2. Add its `testbench.v` under **Simulation Sources**.
3. Set the testbench module as simulation top and run **Run Behavioral Simulation**.
4. For synthesis, select the design module as the top; never select a testbench as the synthesis top.

## Top modules
| Experiment | Design top | Simulation top |
|---|---|---|
| 4:1 MUX | `mux4to1` | `tb_mux4to1` |
| Full adder using two half adders | `full_adder` | `tb_full_adder` |
| Binary to Gray converter | `binary_to_gray` | `tb_binary_to_gray` |
| T flip-flop | `t_flip_flop` | `t_flip_flop_tb` |
| JK flip-flop | `jk_ff` | `jk_ff_tb` |
| 3-bit up counter | `bit3_upcounter` | `tb_3bit_upcounter` |
| 3-bit down counter | `bit3_downcounter` | `tb_3bit_downcounter` |
| 4-bit SISO register | `siso_shift_register` | `tb_siso_shift_reg` |

Counters use active-high asynchronous reset and count on the positive clock edge. Testbench inputs are driven away from the active edge to avoid race conditions.
