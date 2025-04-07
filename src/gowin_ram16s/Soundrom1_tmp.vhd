--Copyright (C)2014-2024 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--Tool Version: V1.9.10.03 Education (64-bit)
--Part Number: GW1NR-LV9QN88PC6/I5
--Device: GW1NR-9
--Device Version: C
--Created Time: Thu Dec 12 19:55:36 2024

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component Gowin_RAM16S
    port (
        dout: out std_logic_vector(7 downto 0);
        di: in std_logic_vector(7 downto 0);
        ad: in std_logic_vector(3 downto 0);
        wre: in std_logic;
        clk: in std_logic
    );
end component;

your_instance_name: Gowin_RAM16S
    port map (
        dout => dout,
        di => di,
        ad => ad,
        wre => wre,
        clk => clk
    );

----------Copy end-------------------
