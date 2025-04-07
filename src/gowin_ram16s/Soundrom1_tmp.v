//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.10.03 Education (64-bit)
//Part Number: GW1NR-LV9QN88PC6/I5
//Device: GW1NR-9
//Device Version: C
//Created Time: Thu Dec 12 19:54:00 2024

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    Gowin_RAM16S your_instance_name(
        .dout(dout), //output [7:0] dout
        .di(di), //input [7:0] di
        .ad(ad), //input [3:0] ad
        .wre(wre), //input wre
        .clk(clk) //input clk
    );

//--------Copy end-------------------
