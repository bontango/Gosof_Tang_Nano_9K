//Copyright (C)2014-2024 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//Tool Version: V1.9.10.03 Education (64-bit) 
//Created Time: 2024-12-22 19:28:46
create_clock -name clk_27 -period 37.037 -waveform {0 18.518} [get_ports {clk_27}] -add
create_generated_clock -name cpu_clk -source [get_ports {clk_27}] -master_clock clk_27 -divide_by 27 [get_nets {cpu_clk}]
