-- sound input
-- avoids metastability
-- cpu clk, 1 clock is 2uS
-- typical sound signal is 35mS

LIBRARY ieee;
USE ieee.std_logic_1164.all;

    entity sound_input is        
        port(
				clk_in  : in std_logic;          
                rst  : in std_logic;
                input  : in std_logic_vector(4 downto 0);     
                output : out std_logic_vector(4 downto 0);     
				trigger : out std_logic				
            );
    end sound_input;
	 
architecture Behavioral of sound_input is
  type STATE_T is ( Idle, Delay, Wait4SoundEnd); 
  signal state : STATE_T;        --State
  signal Clk_Count : integer range 0 to 1000;

begin
 process (clk_in, rst, input) is  
 begin
  if rst = '0' then --Reset condidition (reset_l)
    trigger <= '0';
    Clk_Count <= 0;
    output <= "00000";
    state <= Idle;    
  elsif rising_edge(clk_in)then
    case state is
		when Idle =>
			if ( input(3 downto 0) /= "0000") then --only check sound 0..3
				state <= Delay;
			end if;
		
		when Delay =>		
			Clk_Count <= Clk_Count +1;
			if ( Clk_Count > 800 ) then --2mS
				Clk_Count <= 0;
				output <= input;
				state <= Wait4SoundEnd;
			end if;
			
		when Wait4SoundEnd =>
			if ( input(3 downto 0) = "0000") then
				trigger <= '0';			
				state <= Idle;
				output <= "00000";			
			else
				trigger <= '1';
			end if;
			
      end case;
  end if;
end process;

end Behavioral;