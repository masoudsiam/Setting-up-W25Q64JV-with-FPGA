LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY BaudRate_Generator_Sim IS
END BaudRate_Generator_Sim;
 
ARCHITECTURE behavior OF BaudRate_Generator_Sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BaudRate_Generator
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         max_tick : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal max_tick : std_logic;

   -- Clock period definitions
   constant clk_period : time := 41.67 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BaudRate_Generator PORT MAP (
          clk => clk,
          reset => reset,
          max_tick => max_tick
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		for i in 1 to 10 loop
			wait until falling_edge(clk);
		end loop;
		reset <= '1';
		wait for 1000 us;
   end process;

END;
