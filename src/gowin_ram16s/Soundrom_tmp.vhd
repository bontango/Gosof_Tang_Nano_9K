--Copyright (C)2014-2025 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--Tool Version: V1.9.11.01 (64-bit)
--Part Number: GW1NR-LV9QN88PC6/I5
--Device: GW1NR-9
--Device Version: C
--Created Time: Wed Apr  2 18:23:24 2025

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component Gowin_RAM16S
    port (
        dout: out std_logic_vector(7 downto 0);
        wre: in std_logic;
        ad: in std_logic_vector(10 downto 0);
        di: in std_logic_vector(7 downto 0);
        clk: in std_logic
    );
end component;

your_instance_name: Gowin_RAM16S
    port map (
        dout => dout,
        wre => wre,
        ad => ad,
        di => di,
        clk => clk
    );

----------Copy end-------------------
