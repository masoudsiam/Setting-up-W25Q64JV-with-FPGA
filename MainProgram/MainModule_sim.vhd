LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MainModule_sim IS
END MainModule_sim;
 
ARCHITECTURE behavior OF MainModule_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MainModule
    PORT(
         output : OUT  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
         rx : IN  std_logic;
			miso: IN std_logic;
			mosi: OUT std_logic;
			cs: OUT std_logic;
			sclk: OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal rx : std_logic := '0';
	signal miso : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(7 downto 0);
	signal mosi : std_logic;
	signal cs : std_logic;
	signal sclk : std_logic;

   -- Clock period definitions
   constant clk_period : time := 41 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MainModule PORT MAP (
          output => output,
          clk => clk,
          reset => reset,
          rx => rx,
			 miso => miso,
			 mosi => mosi,
			 cs => cs,
			 sclk => sclk
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
		miso <= '1';
		-- sending data byte "11111111"
		-- start
		wait until falling_edge(clk);
		rx <= '0'; -- start bit
		wait until falling_edge(clk);
		rx <= '1'; -- bit 0
		for i in 1 to 1870 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- bit 1
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- bit 2
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- bit 3
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- bit 4
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;	
		rx <= '1'; -- bit 5
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- bit 6
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- bit 7
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- end bit
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		-- end
		-- sending data byte "01010010"
		-- start
		wait until falling_edge(clk);
		rx <= '0'; -- start bit
		wait until falling_edge(clk);
		rx <= '0'; -- bit 0
		for i in 1 to 1870 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- bit 1
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '0'; -- bit 2
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '0'; -- bit 3
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- bit 4
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;	
		rx <= '0'; -- bit 5
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- bit 6
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '0'; -- bit 7
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- end bit
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		-- end
		-- sending data byte "01001101"
		-- start
		wait until falling_edge(clk);
		rx <= '0'; -- start bit
		wait until falling_edge(clk);
		rx <= '1'; -- bit 0
		for i in 1 to 1870 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '0'; -- bit 1
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- bit 2
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- bit 3
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '0'; -- bit 4
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;	
		rx <= '0'; -- bit 5
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- bit 6
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '0'; -- bit 7
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- end bit
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		-- end
		-- sending data byte "01001001"
		-- start
		wait until falling_edge(clk);
		rx <= '0'; -- start bit
		wait until falling_edge(clk);
		rx <= '1'; -- bit 0
		for i in 1 to 1870 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '0'; -- bit 1
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '0'; -- bit 2
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- bit 3
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '0'; -- bit 4
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;	
		rx <= '0'; -- bit 5
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- bit 6
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '0'; -- bit 7
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		rx <= '1'; -- end bit
		for i in 1 to 1248 loop
			wait until falling_edge(clk);
		end loop;
		-- end
		wait for 1000 us;
   end process;

END;
