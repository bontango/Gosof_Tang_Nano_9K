-- test IO
-- clk in 895KHz -> 1,11uS
-- sequence is 4,12,8
-- same as with Mars start of game

LIBRARY ieee;
USE ieee.std_logic_1164.all;


    entity soundtest is        
        port(
            clk_in  : in std_logic;               						
			Sound : out	std_logic_vector(4 downto 0);
			sig: out std_logic
            );
    end soundtest;
    ---------------------------------------------------
    architecture Behavioral of soundtest is
	 	type STATE_T is ( Start, Sound1, Sound2, Sound3, delay1, delay2, delay3 );
		signal state : STATE_T := Start;  
		signal counter  : integer range 0 to 20000000 := 0; 		
	begin
	
	
	 soundtest: process (clk_in)
    begin
		if rising_edge(clk_in) then			
				case state is
					when Start =>
					Sound <= (others => '0');
					sig <= '0';
					counter <= counter +1;					
					if ( counter = 1000000 ) then --100ms 
						state <= Sound1;
						counter <= 0;						
					end if;	
					
					when Sound1 =>
						Sound(2) <= '1';	
                        counter <= counter +1;					
                        if ( counter = 100 ) then 
                            Sig <= '1';
                        end if;
                        if ( counter = 1000000 ) then --100ms 
                            state <= Delay1;
                            counter <= 0;				
                            Sound <= (others => '0');
                            sig <= '0';		
                        end if;	

					when  Delay1 =>
                        counter <= counter +1;					
                        if ( counter = 20000000 ) then --2000ms 
                            state <= Sound2;
                            counter <= 0;				
                        end if;	


					when Sound2 =>
						Sound(2) <= '1';	
                        Sound(3) <= '1';	
                        counter <= counter +1;					
                        if ( counter = 100 ) then 
                            Sig <= '1';
                        end if;						
                        if ( counter = 1000000 ) then --100ms 
                            state <= Delay2;
                            counter <= 0;				
                            Sound <= (others => '0');
                            sig <= '0';		
                        end if;	
			
					when  Delay2 =>
                        counter <= counter +1;					
                        if ( counter = 2000000 ) then --100ms 
                            state <= Sound3;
                            counter <= 0;				
                        end if;	

					when Sound3 =>
						Sound(3) <= '1';																		
                        counter <= counter +1;					
                        if ( counter = 100 ) then 
                            Sig <= '1';
                        end if;
                        if ( counter = 1000000 ) then --100ms 
                            state <= Delay3;
                            counter <= 0;				
                            Sound <= (others => '0');
                            sig <= '0';		
                        end if;	

				
					when  Delay3 =>
                        counter <= counter +1;					
                        if ( counter = 1000000 ) then --100ms 
                            state <= Sound1;
                            counter <= 0;						
                        end if;						
				end case;
		end if;	--rising edge		
		end process;
    end Behavioral;