--Copyright (C)2014-2025 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: IP file
--Tool Version: V1.9.11.01 (64-bit)
--Part Number: GW1NR-LV9QN88PC6/I5
--Device: GW1NR-9
--Device Version: C
--Created Time: Wed Apr  2 19:31:50 2025

library IEEE;
use IEEE.std_logic_1164.all;

entity RIOT_RAM is
    port (
        dout: out std_logic_vector(7 downto 0);
        wre: in std_logic;
        ad: in std_logic_vector(6 downto 0);
        di: in std_logic_vector(7 downto 0);
        clk: in std_logic
    );
end RIOT_RAM;

architecture Behavioral of RIOT_RAM is

    signal ad4_inv: std_logic;
    signal ad5_inv: std_logic;
    signal ad6_inv: std_logic;
    signal lut_f_0: std_logic;
    signal lut_f_1: std_logic;
    signal lut_f_2: std_logic;
    signal lut_f_3: std_logic;
    signal lut_f_4: std_logic;
    signal lut_f_5: std_logic;
    signal lut_f_6: std_logic;
    signal lut_f_7: std_logic;
    signal ram16s_inst_0_dout: std_logic_vector(3 downto 0);
    signal ram16s_inst_1_dout: std_logic_vector(7 downto 4);
    signal ram16s_inst_2_dout: std_logic_vector(3 downto 0);
    signal ram16s_inst_3_dout: std_logic_vector(7 downto 4);
    signal ram16s_inst_4_dout: std_logic_vector(3 downto 0);
    signal ram16s_inst_5_dout: std_logic_vector(7 downto 4);
    signal ram16s_inst_6_dout: std_logic_vector(3 downto 0);
    signal ram16s_inst_7_dout: std_logic_vector(7 downto 4);
    signal ram16s_inst_8_dout: std_logic_vector(3 downto 0);
    signal ram16s_inst_9_dout: std_logic_vector(7 downto 4);
    signal ram16s_inst_10_dout: std_logic_vector(3 downto 0);
    signal ram16s_inst_11_dout: std_logic_vector(7 downto 4);
    signal ram16s_inst_12_dout: std_logic_vector(3 downto 0);
    signal ram16s_inst_13_dout: std_logic_vector(7 downto 4);
    signal ram16s_inst_14_dout: std_logic_vector(3 downto 0);
    signal ram16s_inst_15_dout: std_logic_vector(7 downto 4);
    signal mux_o_0: std_logic;
    signal mux_o_1: std_logic;
    signal mux_o_2: std_logic;
    signal mux_o_3: std_logic;
    signal mux_o_4: std_logic;
    signal mux_o_5: std_logic;
    signal mux_o_7: std_logic;
    signal mux_o_8: std_logic;
    signal mux_o_9: std_logic;
    signal mux_o_10: std_logic;
    signal mux_o_11: std_logic;
    signal mux_o_12: std_logic;
    signal mux_o_14: std_logic;
    signal mux_o_15: std_logic;
    signal mux_o_16: std_logic;
    signal mux_o_17: std_logic;
    signal mux_o_18: std_logic;
    signal mux_o_19: std_logic;
    signal mux_o_21: std_logic;
    signal mux_o_22: std_logic;
    signal mux_o_23: std_logic;
    signal mux_o_24: std_logic;
    signal mux_o_25: std_logic;
    signal mux_o_26: std_logic;
    signal mux_o_28: std_logic;
    signal mux_o_29: std_logic;
    signal mux_o_30: std_logic;
    signal mux_o_31: std_logic;
    signal mux_o_32: std_logic;
    signal mux_o_33: std_logic;
    signal mux_o_35: std_logic;
    signal mux_o_36: std_logic;
    signal mux_o_37: std_logic;
    signal mux_o_38: std_logic;
    signal mux_o_39: std_logic;
    signal mux_o_40: std_logic;
    signal mux_o_42: std_logic;
    signal mux_o_43: std_logic;
    signal mux_o_44: std_logic;
    signal mux_o_45: std_logic;
    signal mux_o_46: std_logic;
    signal mux_o_47: std_logic;
    signal mux_o_49: std_logic;
    signal mux_o_50: std_logic;
    signal mux_o_51: std_logic;
    signal mux_o_52: std_logic;
    signal mux_o_53: std_logic;
    signal mux_o_54: std_logic;

    -- component declaration
    component INV
        port (I: in std_logic; O: out std_logic);
    end component;

    -- component declaration
    component LUT4
        generic (
            INIT: in bit_vector := X"0000"
        );
        port (
            F: out std_logic;
            I0: in std_logic;
            I1: in std_logic;
            I2: in std_logic;
            I3: in std_logic
        );
    end component;

    --component declaration
    component RAM16S4
        GENERIC ( INIT_0 : bit_vector(15 downto 0) := X"0000";
                  INIT_1 : bit_vector(15 downto 0) := X"0000";
                  INIT_2 : bit_vector(15 downto 0) := X"0000";
                  INIT_3 : bit_vector(15 downto 0) := X"0000"
        );
        port (
            DO: out std_logic_vector(3 downto 0);
            DI: in std_logic_vector(3 downto 0);
            AD: in std_logic_vector(3 downto 0);
            WRE: in std_logic;
            CLK: in std_logic
        );
    end component;

    -- component declaration
    component MUX2
        port (
            O: out std_logic;
            I0: in std_logic;
            I1: in std_logic;
            S0: in std_logic
        );
    end component;

begin
    inv_inst_0 : INV
        port map (I => ad(4), O => ad4_inv);

    inv_inst_1 : INV
        port map (I => ad(5), O => ad5_inv);

    inv_inst_2 : INV
        port map (I => ad(6), O => ad6_inv);

    lut_inst_0 : LUT4
        generic map (
            INIT => X"8000"
        )
        port map (
            F => lut_f_0,
            I0 => wre,
            I1 => ad4_inv,
            I2 => ad5_inv,
            I3 => ad6_inv
        );

    lut_inst_1 : LUT4
        generic map (
            INIT => X"8000"
        )
        port map (
            F => lut_f_1,
            I0 => wre,
            I1 => ad(4),
            I2 => ad5_inv,
            I3 => ad6_inv
        );

    lut_inst_2 : LUT4
        generic map (
            INIT => X"8000"
        )
        port map (
            F => lut_f_2,
            I0 => wre,
            I1 => ad4_inv,
            I2 => ad(5),
            I3 => ad6_inv
        );

    lut_inst_3 : LUT4
        generic map (
            INIT => X"8000"
        )
        port map (
            F => lut_f_3,
            I0 => wre,
            I1 => ad(4),
            I2 => ad(5),
            I3 => ad6_inv
        );

    lut_inst_4 : LUT4
        generic map (
            INIT => X"8000"
        )
        port map (
            F => lut_f_4,
            I0 => wre,
            I1 => ad4_inv,
            I2 => ad5_inv,
            I3 => ad(6)
        );

    lut_inst_5 : LUT4
        generic map (
            INIT => X"8000"
        )
        port map (
            F => lut_f_5,
            I0 => wre,
            I1 => ad(4),
            I2 => ad5_inv,
            I3 => ad(6)
        );

    lut_inst_6 : LUT4
        generic map (
            INIT => X"8000"
        )
        port map (
            F => lut_f_6,
            I0 => wre,
            I1 => ad4_inv,
            I2 => ad(5),
            I3 => ad(6)
        );

    lut_inst_7 : LUT4
        generic map (
            INIT => X"8000"
        )
        port map (
            F => lut_f_7,
            I0 => wre,
            I1 => ad(4),
            I2 => ad(5),
            I3 => ad(6)
        );

    ram16s_inst_0: RAM16S4
        generic map (
            INIT_0 => X"0000",
            INIT_1 => X"0000",
            INIT_2 => X"0000",
            INIT_3 => X"0000"
        )
        port map (
            DO => ram16s_inst_0_dout(3 downto 0),
            DI => di(3 downto 0),
            AD => ad(3 downto 0),
            WRE => lut_f_0,
            CLK => clk
        );

    ram16s_inst_1: RAM16S4
        generic map (
            INIT_0 => X"0000",
            INIT_1 => X"0000",
            INIT_2 => X"0000",
            INIT_3 => X"0000"
        )
        port map (
            DO => ram16s_inst_1_dout(7 downto 4),
            DI => di(7 downto 4),
            AD => ad(3 downto 0),
            WRE => lut_f_0,
            CLK => clk
        );

    ram16s_inst_2: RAM16S4
        generic map (
            INIT_0 => X"0000",
            INIT_1 => X"0000",
            INIT_2 => X"0000",
            INIT_3 => X"0000"
        )
        port map (
            DO => ram16s_inst_2_dout(3 downto 0),
            DI => di(3 downto 0),
            AD => ad(3 downto 0),
            WRE => lut_f_1,
            CLK => clk
        );

    ram16s_inst_3: RAM16S4
        generic map (
            INIT_0 => X"0000",
            INIT_1 => X"0000",
            INIT_2 => X"0000",
            INIT_3 => X"0000"
        )
        port map (
            DO => ram16s_inst_3_dout(7 downto 4),
            DI => di(7 downto 4),
            AD => ad(3 downto 0),
            WRE => lut_f_1,
            CLK => clk
        );

    ram16s_inst_4: RAM16S4
        generic map (
            INIT_0 => X"0000",
            INIT_1 => X"0000",
            INIT_2 => X"0000",
            INIT_3 => X"0000"
        )
        port map (
            DO => ram16s_inst_4_dout(3 downto 0),
            DI => di(3 downto 0),
            AD => ad(3 downto 0),
            WRE => lut_f_2,
            CLK => clk
        );

    ram16s_inst_5: RAM16S4
        generic map (
            INIT_0 => X"0000",
            INIT_1 => X"0000",
            INIT_2 => X"0000",
            INIT_3 => X"0000"
        )
        port map (
            DO => ram16s_inst_5_dout(7 downto 4),
            DI => di(7 downto 4),
            AD => ad(3 downto 0),
            WRE => lut_f_2,
            CLK => clk
        );

    ram16s_inst_6: RAM16S4
        generic map (
            INIT_0 => X"0000",
            INIT_1 => X"0000",
            INIT_2 => X"0000",
            INIT_3 => X"0000"
        )
        port map (
            DO => ram16s_inst_6_dout(3 downto 0),
            DI => di(3 downto 0),
            AD => ad(3 downto 0),
            WRE => lut_f_3,
            CLK => clk
        );

    ram16s_inst_7: RAM16S4
        generic map (
            INIT_0 => X"0000",
            INIT_1 => X"0000",
            INIT_2 => X"0000",
            INIT_3 => X"0000"
        )
        port map (
            DO => ram16s_inst_7_dout(7 downto 4),
            DI => di(7 downto 4),
            AD => ad(3 downto 0),
            WRE => lut_f_3,
            CLK => clk
        );

    ram16s_inst_8: RAM16S4
        generic map (
            INIT_0 => X"0000",
            INIT_1 => X"0000",
            INIT_2 => X"0000",
            INIT_3 => X"0000"
        )
        port map (
            DO => ram16s_inst_8_dout(3 downto 0),
            DI => di(3 downto 0),
            AD => ad(3 downto 0),
            WRE => lut_f_4,
            CLK => clk
        );

    ram16s_inst_9: RAM16S4
        generic map (
            INIT_0 => X"0000",
            INIT_1 => X"0000",
            INIT_2 => X"0000",
            INIT_3 => X"0000"
        )
        port map (
            DO => ram16s_inst_9_dout(7 downto 4),
            DI => di(7 downto 4),
            AD => ad(3 downto 0),
            WRE => lut_f_4,
            CLK => clk
        );

    ram16s_inst_10: RAM16S4
        generic map (
            INIT_0 => X"0000",
            INIT_1 => X"0000",
            INIT_2 => X"0000",
            INIT_3 => X"0000"
        )
        port map (
            DO => ram16s_inst_10_dout(3 downto 0),
            DI => di(3 downto 0),
            AD => ad(3 downto 0),
            WRE => lut_f_5,
            CLK => clk
        );

    ram16s_inst_11: RAM16S4
        generic map (
            INIT_0 => X"0000",
            INIT_1 => X"0000",
            INIT_2 => X"0000",
            INIT_3 => X"0000"
        )
        port map (
            DO => ram16s_inst_11_dout(7 downto 4),
            DI => di(7 downto 4),
            AD => ad(3 downto 0),
            WRE => lut_f_5,
            CLK => clk
        );

    ram16s_inst_12: RAM16S4
        generic map (
            INIT_0 => X"0000",
            INIT_1 => X"0000",
            INIT_2 => X"0000",
            INIT_3 => X"0000"
        )
        port map (
            DO => ram16s_inst_12_dout(3 downto 0),
            DI => di(3 downto 0),
            AD => ad(3 downto 0),
            WRE => lut_f_6,
            CLK => clk
        );

    ram16s_inst_13: RAM16S4
        generic map (
            INIT_0 => X"0000",
            INIT_1 => X"0000",
            INIT_2 => X"0000",
            INIT_3 => X"0000"
        )
        port map (
            DO => ram16s_inst_13_dout(7 downto 4),
            DI => di(7 downto 4),
            AD => ad(3 downto 0),
            WRE => lut_f_6,
            CLK => clk
        );

    ram16s_inst_14: RAM16S4
        generic map (
            INIT_0 => X"0000",
            INIT_1 => X"0000",
            INIT_2 => X"0000",
            INIT_3 => X"0000"
        )
        port map (
            DO => ram16s_inst_14_dout(3 downto 0),
            DI => di(3 downto 0),
            AD => ad(3 downto 0),
            WRE => lut_f_7,
            CLK => clk
        );

    ram16s_inst_15: RAM16S4
        generic map (
            INIT_0 => X"0000",
            INIT_1 => X"0000",
            INIT_2 => X"0000",
            INIT_3 => X"0000"
        )
        port map (
            DO => ram16s_inst_15_dout(7 downto 4),
            DI => di(7 downto 4),
            AD => ad(3 downto 0),
            WRE => lut_f_7,
            CLK => clk
        );

    mux_inst_0: MUX2
        port map (
            O => mux_o_0,
            I0 => ram16s_inst_0_dout(0),
            I1 => ram16s_inst_2_dout(0),
            S0 => ad(4)
        );

    mux_inst_1: MUX2
        port map (
            O => mux_o_1,
            I0 => ram16s_inst_4_dout(0),
            I1 => ram16s_inst_6_dout(0),
            S0 => ad(4)
        );

    mux_inst_2: MUX2
        port map (
            O => mux_o_2,
            I0 => ram16s_inst_8_dout(0),
            I1 => ram16s_inst_10_dout(0),
            S0 => ad(4)
        );

    mux_inst_3: MUX2
        port map (
            O => mux_o_3,
            I0 => ram16s_inst_12_dout(0),
            I1 => ram16s_inst_14_dout(0),
            S0 => ad(4)
        );

    mux_inst_4: MUX2
        port map (
            O => mux_o_4,
            I0 => mux_o_0,
            I1 => mux_o_1,
            S0 => ad(5)
        );

    mux_inst_5: MUX2
        port map (
            O => mux_o_5,
            I0 => mux_o_2,
            I1 => mux_o_3,
            S0 => ad(5)
        );

    mux_inst_6: MUX2
        port map (
            O => dout(0),
            I0 => mux_o_4,
            I1 => mux_o_5,
            S0 => ad(6)
        );

    mux_inst_7: MUX2
        port map (
            O => mux_o_7,
            I0 => ram16s_inst_0_dout(1),
            I1 => ram16s_inst_2_dout(1),
            S0 => ad(4)
        );

    mux_inst_8: MUX2
        port map (
            O => mux_o_8,
            I0 => ram16s_inst_4_dout(1),
            I1 => ram16s_inst_6_dout(1),
            S0 => ad(4)
        );

    mux_inst_9: MUX2
        port map (
            O => mux_o_9,
            I0 => ram16s_inst_8_dout(1),
            I1 => ram16s_inst_10_dout(1),
            S0 => ad(4)
        );

    mux_inst_10: MUX2
        port map (
            O => mux_o_10,
            I0 => ram16s_inst_12_dout(1),
            I1 => ram16s_inst_14_dout(1),
            S0 => ad(4)
        );

    mux_inst_11: MUX2
        port map (
            O => mux_o_11,
            I0 => mux_o_7,
            I1 => mux_o_8,
            S0 => ad(5)
        );

    mux_inst_12: MUX2
        port map (
            O => mux_o_12,
            I0 => mux_o_9,
            I1 => mux_o_10,
            S0 => ad(5)
        );

    mux_inst_13: MUX2
        port map (
            O => dout(1),
            I0 => mux_o_11,
            I1 => mux_o_12,
            S0 => ad(6)
        );

    mux_inst_14: MUX2
        port map (
            O => mux_o_14,
            I0 => ram16s_inst_0_dout(2),
            I1 => ram16s_inst_2_dout(2),
            S0 => ad(4)
        );

    mux_inst_15: MUX2
        port map (
            O => mux_o_15,
            I0 => ram16s_inst_4_dout(2),
            I1 => ram16s_inst_6_dout(2),
            S0 => ad(4)
        );

    mux_inst_16: MUX2
        port map (
            O => mux_o_16,
            I0 => ram16s_inst_8_dout(2),
            I1 => ram16s_inst_10_dout(2),
            S0 => ad(4)
        );

    mux_inst_17: MUX2
        port map (
            O => mux_o_17,
            I0 => ram16s_inst_12_dout(2),
            I1 => ram16s_inst_14_dout(2),
            S0 => ad(4)
        );

    mux_inst_18: MUX2
        port map (
            O => mux_o_18,
            I0 => mux_o_14,
            I1 => mux_o_15,
            S0 => ad(5)
        );

    mux_inst_19: MUX2
        port map (
            O => mux_o_19,
            I0 => mux_o_16,
            I1 => mux_o_17,
            S0 => ad(5)
        );

    mux_inst_20: MUX2
        port map (
            O => dout(2),
            I0 => mux_o_18,
            I1 => mux_o_19,
            S0 => ad(6)
        );

    mux_inst_21: MUX2
        port map (
            O => mux_o_21,
            I0 => ram16s_inst_0_dout(3),
            I1 => ram16s_inst_2_dout(3),
            S0 => ad(4)
        );

    mux_inst_22: MUX2
        port map (
            O => mux_o_22,
            I0 => ram16s_inst_4_dout(3),
            I1 => ram16s_inst_6_dout(3),
            S0 => ad(4)
        );

    mux_inst_23: MUX2
        port map (
            O => mux_o_23,
            I0 => ram16s_inst_8_dout(3),
            I1 => ram16s_inst_10_dout(3),
            S0 => ad(4)
        );

    mux_inst_24: MUX2
        port map (
            O => mux_o_24,
            I0 => ram16s_inst_12_dout(3),
            I1 => ram16s_inst_14_dout(3),
            S0 => ad(4)
        );

    mux_inst_25: MUX2
        port map (
            O => mux_o_25,
            I0 => mux_o_21,
            I1 => mux_o_22,
            S0 => ad(5)
        );

    mux_inst_26: MUX2
        port map (
            O => mux_o_26,
            I0 => mux_o_23,
            I1 => mux_o_24,
            S0 => ad(5)
        );

    mux_inst_27: MUX2
        port map (
            O => dout(3),
            I0 => mux_o_25,
            I1 => mux_o_26,
            S0 => ad(6)
        );

    mux_inst_28: MUX2
        port map (
            O => mux_o_28,
            I0 => ram16s_inst_1_dout(4),
            I1 => ram16s_inst_3_dout(4),
            S0 => ad(4)
        );

    mux_inst_29: MUX2
        port map (
            O => mux_o_29,
            I0 => ram16s_inst_5_dout(4),
            I1 => ram16s_inst_7_dout(4),
            S0 => ad(4)
        );

    mux_inst_30: MUX2
        port map (
            O => mux_o_30,
            I0 => ram16s_inst_9_dout(4),
            I1 => ram16s_inst_11_dout(4),
            S0 => ad(4)
        );

    mux_inst_31: MUX2
        port map (
            O => mux_o_31,
            I0 => ram16s_inst_13_dout(4),
            I1 => ram16s_inst_15_dout(4),
            S0 => ad(4)
        );

    mux_inst_32: MUX2
        port map (
            O => mux_o_32,
            I0 => mux_o_28,
            I1 => mux_o_29,
            S0 => ad(5)
        );

    mux_inst_33: MUX2
        port map (
            O => mux_o_33,
            I0 => mux_o_30,
            I1 => mux_o_31,
            S0 => ad(5)
        );

    mux_inst_34: MUX2
        port map (
            O => dout(4),
            I0 => mux_o_32,
            I1 => mux_o_33,
            S0 => ad(6)
        );

    mux_inst_35: MUX2
        port map (
            O => mux_o_35,
            I0 => ram16s_inst_1_dout(5),
            I1 => ram16s_inst_3_dout(5),
            S0 => ad(4)
        );

    mux_inst_36: MUX2
        port map (
            O => mux_o_36,
            I0 => ram16s_inst_5_dout(5),
            I1 => ram16s_inst_7_dout(5),
            S0 => ad(4)
        );

    mux_inst_37: MUX2
        port map (
            O => mux_o_37,
            I0 => ram16s_inst_9_dout(5),
            I1 => ram16s_inst_11_dout(5),
            S0 => ad(4)
        );

    mux_inst_38: MUX2
        port map (
            O => mux_o_38,
            I0 => ram16s_inst_13_dout(5),
            I1 => ram16s_inst_15_dout(5),
            S0 => ad(4)
        );

    mux_inst_39: MUX2
        port map (
            O => mux_o_39,
            I0 => mux_o_35,
            I1 => mux_o_36,
            S0 => ad(5)
        );

    mux_inst_40: MUX2
        port map (
            O => mux_o_40,
            I0 => mux_o_37,
            I1 => mux_o_38,
            S0 => ad(5)
        );

    mux_inst_41: MUX2
        port map (
            O => dout(5),
            I0 => mux_o_39,
            I1 => mux_o_40,
            S0 => ad(6)
        );

    mux_inst_42: MUX2
        port map (
            O => mux_o_42,
            I0 => ram16s_inst_1_dout(6),
            I1 => ram16s_inst_3_dout(6),
            S0 => ad(4)
        );

    mux_inst_43: MUX2
        port map (
            O => mux_o_43,
            I0 => ram16s_inst_5_dout(6),
            I1 => ram16s_inst_7_dout(6),
            S0 => ad(4)
        );

    mux_inst_44: MUX2
        port map (
            O => mux_o_44,
            I0 => ram16s_inst_9_dout(6),
            I1 => ram16s_inst_11_dout(6),
            S0 => ad(4)
        );

    mux_inst_45: MUX2
        port map (
            O => mux_o_45,
            I0 => ram16s_inst_13_dout(6),
            I1 => ram16s_inst_15_dout(6),
            S0 => ad(4)
        );

    mux_inst_46: MUX2
        port map (
            O => mux_o_46,
            I0 => mux_o_42,
            I1 => mux_o_43,
            S0 => ad(5)
        );

    mux_inst_47: MUX2
        port map (
            O => mux_o_47,
            I0 => mux_o_44,
            I1 => mux_o_45,
            S0 => ad(5)
        );

    mux_inst_48: MUX2
        port map (
            O => dout(6),
            I0 => mux_o_46,
            I1 => mux_o_47,
            S0 => ad(6)
        );

    mux_inst_49: MUX2
        port map (
            O => mux_o_49,
            I0 => ram16s_inst_1_dout(7),
            I1 => ram16s_inst_3_dout(7),
            S0 => ad(4)
        );

    mux_inst_50: MUX2
        port map (
            O => mux_o_50,
            I0 => ram16s_inst_5_dout(7),
            I1 => ram16s_inst_7_dout(7),
            S0 => ad(4)
        );

    mux_inst_51: MUX2
        port map (
            O => mux_o_51,
            I0 => ram16s_inst_9_dout(7),
            I1 => ram16s_inst_11_dout(7),
            S0 => ad(4)
        );

    mux_inst_52: MUX2
        port map (
            O => mux_o_52,
            I0 => ram16s_inst_13_dout(7),
            I1 => ram16s_inst_15_dout(7),
            S0 => ad(4)
        );

    mux_inst_53: MUX2
        port map (
            O => mux_o_53,
            I0 => mux_o_49,
            I1 => mux_o_50,
            S0 => ad(5)
        );

    mux_inst_54: MUX2
        port map (
            O => mux_o_54,
            I0 => mux_o_51,
            I1 => mux_o_52,
            S0 => ad(5)
        );

    mux_inst_55: MUX2
        port map (
            O => dout(7),
            I0 => mux_o_53,
            I1 => mux_o_54,
            S0 => ad(6)
        );

end Behavioral; --RIOT_RAM
