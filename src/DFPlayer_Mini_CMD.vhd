-- simple transmitter for DFPLAYR_Mini
--
-- This is free software: you can redistribute
-- it and/or modify it under the terms of the GNU General
-- Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your
-- option) any later version.
--
-- This is distributed in the hope that it will
-- be useful, but WITHOUT ANY WARRANTY; without even the
-- implied warranty of MERCHANTABILITY or FITNESS FOR A
-- PARTICULAR PURPOSE. See the GNU General Public License
-- for more details.
--
-- Version 0.1
--
-- The general command structure consists of 10 bytes of which five are fixed, 
-- two are a checksum, and three specify the action (one is the command and two are parameters)
-- Format is
-- byte    function         value
-- (0)     start byte       0x7E
-- (1)     version info     0xFF
-- (2)     number of bytes  0x06
-- (3)     command          0x..  <- the command specifies by the user
-- (4)     command feedback 0x00  (if no feedback is required)
-- (5)     parameter 1 [DH] 0x..  <- 1st parameter (high-byte) specified by user
-- (6)     parameter 2 [DL] 0x..  <- 2nd parameter (low-byte) specified by user
-- (7)     checksum high    0x..  <- calculation is given below
-- (8)     checksum low     0x..  <- calculation is given below
-- (9)     end command      0xEF
--
-- checksum = - ( byte(1)+byte(2)+byte(3)+byte(4)+byte(5)+byte(6) )
-- and byte(7) and byte(8) are obtained as
-- checksumHigh = highByte(checksum)
-- checksumLow = lowByte(checksum) 
--
-- Statemaschine FSM
--
-- States:
-- RST_State: 
-- Wait: wait for 'do_send' & BUSY (which is LOW while a file is playing)
-- Sending: send complete command
-- goto Wait State
--
-- v1.1 with integrated 9600Baud clock
-- Set Generic g_CLKS_PER_BIT as follows:
-- g_CLKS_PER_BIT = (Frequency of i_Clk)/(Frequency of UART)
-- Example: 50 MHz Clock, 115200 baud UART
-- (5000000)/(115200) = 434
-- Example: 27 MHz Clock, 9600 baud UART
-- (2700000)/(9600) = 2812

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity DFPlayer_Mini_CMD is
  generic (
    g_CLKS_PER_BIT : integer := 2812     -- Needs to be set correctly
    );
    Port ( DFcmd_cmd : in  std_logic_vector (7 downto 0); -- the command for DFPlayer
			  DFcmd_par1 : in  std_logic_vector (7 downto 0); --Parameter 1
			  DFcmd_par2 : in  std_logic_vector (7 downto 0); --Parameter 1
           send_flag : in  STD_LOGIC; --flag: start sending			  
           clk : in  STD_LOGIC; 
           rst : in  STD_LOGIC; --reset_l
           txd : out  STD_LOGIC); --txd pin
end DFPlayer_Mini_CMD;

architecture Behavioral of DFPlayer_Mini_CMD is

function reverse_any_vector (a: in std_logic_vector)
    return std_logic_vector is
  variable result: std_logic_vector(a'RANGE);
  alias aa: std_logic_vector(a'REVERSE_RANGE) is a;
begin
  for i in aa'RANGE loop
    result(i) := aa(i);
  end loop;
  return result;
end; -- function reverse_any_vector

  signal r_Clk_Count : integer range 0 to g_CLKS_PER_BIT-1 := 0;
  --signal command : std_logic_vector (99 downto 0);  
  signal command : std_logic_vector (79 downto 0);  
  signal gesendet : boolean:= false;
  type STATE_T is ( Idle, Send, Check, Delay); 
  signal state : STATE_T;        --State
  
  -- Structure of DFPlayer command over serial
  signal DFcmd_Start_Byte: unsigned (7 downto 0):=X"7E"; -- each command starts with 0x7E  
  signal DFcmd_Version: unsigned (7 downto 0):=X"FF"; -- version is always 0xFF
  signal DFcmd_len: unsigned (7 downto 0):=X"06"; -- len: number of bytes after len, always 6
  -- DFcmd_cmd
  signal DFcmd_feedb: unsigned (7 downto 0):=X"00"; -- 0 == no feedback neededed
  -- DFcmd_par1
  -- DFcmd_par2
  -- checksum high
  -- cecksum low
  signal checksum: unsigned(15 downto 0);
  signal checksum_signed: signed(15 downto 0);
  signal DFcmd_End_Byte: unsigned (7 downto 0):=X"EF"; -- Ende Byte, always 0xEF  
 
begin

DFPLAYR_Mini : process (clk, rst) is
  variable bitcounter : integer range 0 to 100 := 99;
begin
  if rst = '0' then --Reset condidition (reset_l)
    txd <= '1';
    r_Clk_Count <= 0;
    state <= Idle;    
  elsif rising_edge(clk)then
    case state is
	   when Idle => --with the first tick we contruct the paket to send (100 bits; 99..0)
        -- gesendet <= false;
        if send_flag = '1' then -- send flag is true, start sending
			 --calculate checksum			 
			 --checksum <= resize(DFcmd_Version, checksum'length);
			 --checksum <= checksum + resize(DFcmd_len, checksum'length);
			 --checksum <= checksum + resize(unsigned(DFcmd_cmd), checksum'length);
			 --checksum <= checksum + resize(DFcmd_feedb, checksum'length);
			 --checksum <= checksum + resize(unsigned(DFcmd_par1), checksum'length);
			 --checksum <= checksum + resize(unsigned(DFcmd_par2), checksum'length);
			 --checksum_signed <= signed(checksum);			 						
			 --checksum_signed <= -checksum_signed;
			 -- construct bits to send, including Start/Stop bit
			 -- with 10 bytes we have 100bits to send (99..0)
			 --command(73 downto )
			 command <=   '0' & std_logic_vector(DFcmd_Start_Byte) & '1' -- startbyte is symmetric, no rverse needed
							& '0' & reverse_any_vector(std_logic_vector(DFcmd_Version)) & '1'
							& '0' & reverse_any_vector(std_logic_vector(DFcmd_len)) & '1'
							& '0' & reverse_any_vector(DFcmd_cmd) & '1'
							& '0' & reverse_any_vector(std_logic_vector(DFcmd_feedb)) & '1'
							& '0' & reverse_any_vector(DFcmd_par1) & '1'
							& '0' & reverse_any_vector(DFcmd_par2) & '1'
							--& '0' & std_logic_vector(checksum_signed(15 downto 8)) & '1'
							--& '0' & std_logic_vector(checksum_signed(7 downto 0)) & '1'
							--& '0' & X"00" & '1'
							--& '0' & X"00" & '1'
							& '0' & reverse_any_vector(std_logic_vector(DFcmd_End_Byte)) & '1';
			 -- reset counter
			 bitcounter := 79; --TEST without checksum
			 -- new state
          state <= send;
        end if;		      
      when Send =>   
        txd <= command(bitcounter); 
        bitcounter := bitcounter - 1;
        state   <= Delay;

      when Delay =>   
          -- Wait g_CLKS_PER_BIT-1 clock cycles
          if r_Clk_Count < g_CLKS_PER_BIT-1 then
            r_Clk_Count <= r_Clk_Count + 1;
          else
            r_Clk_Count <= 0;
            if bitcounter = 0 then          
                state <= Check;
            else
                state   <= Send;
            end if;
          end if;

      when Check =>   -- wait in this stae until flag to go down
			if send_flag = '0' then
				state <= Idle;
			end if;
      end case;
  end if;
end process;
end architecture;

