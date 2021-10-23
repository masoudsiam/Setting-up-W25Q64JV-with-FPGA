LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY UART_Receiver_Sim IS
END UART_Receiver_Sim;
 
ARCHITECTURE behavior OF UART_Receiver_Sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UART_Receiver
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         rx : IN  std_logic;
         tick : IN  std_logic;
         done_tick : OUT  std_logic;
         output_data : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal rx : std_logic := '0';
   signal tick : std_logic := '0';

 	--Outputs
   signal done_tick : std_logic;
   signal output_data : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 41.67 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UART_Receiver PORT MAP (
          clk => clk,
          reset => reset,
          rx => rx,
          tick => tick,
          done_tick => done_tick,
          output_data => output_data
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	-- Tick process definitions
	baudrate_process:process
	begin
		tick <= '0';
		wait for 3.187755 us;
		tick <= '1';
		wait for 0.04167 us;
		tick <= '0';
		wait for 0.020835 us;
	end process;

   -- Stimulus process
   stim_proc: process
   begin
		for i in 1 to 10 loop
			wait until falling_edge(clk);
		end loop;
		reset <= '1';
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
		-- sending data byte "01000100"
		-- start
		wait until falling_edge(clk);
		rx <= '0'; -- start bit
		wait until falling_edge(clk);
		rx <= '0'; -- bit 0
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
		rx <= '0'; -- bit 3
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
