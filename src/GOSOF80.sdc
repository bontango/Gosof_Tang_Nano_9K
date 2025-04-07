//Copyright (C)2014-2025 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//Tool Version: V1.9.11.01 (64-bit) 
//Created Time: 2025-04-07 17:06:29
create_clock -name clk_27 -period 37.037 -waveform {0 18.518} [get_ports {clk_27}] -add
create_generated_clock -name cpu_clk -source [get_ports {clk_27}] -master_clock clk_27 -divide_by 27 [get_nets {cpu_clk}]
report_timing -hold -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
report_timing -setup -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
set_clock_groups -asynchronous -group [get_clocks {clk_27 cpu_clk}]
