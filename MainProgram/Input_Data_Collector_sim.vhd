LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Input_Data_Collector_sim IS
END Input_Data_Collector_sim;
 
ARCHITECTURE behavior OF Input_Data_Collector_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Input_Data_Collector
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         tick : IN  std_logic;
         input_data : IN  std_logic_vector(7 downto 0);
         output_data : OUT  std_logic_vector(39 downto 0);
			write_counter: OUT std_logic_vector(5 downto 0);
			read_counter: OUT std_logic_vector(5 downto 0);
         done_tick : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal tick : std_logic := '0';
   signal input_data : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal output_data : std_logic_vector(39 downto 0);
	signal write_counter: std_logic_vector(5 downto 0);
	signal read_counter: std_logic_vector(5 downto 0);
   signal done_tick : std_logic;

   -- Clock period definitions
   constant clk_period : time := 41 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Input_Data_Collector PORT MAP (
          clk => clk,
          reset => reset,
          tick => tick,
          input_data => input_data,
          output_data => output_data,
			 write_counter => write_counter,
			 read_counter => read_counter,
          done_tick => done_tick
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
		-- test 1
		wait until falling_edge(clk);
		input_data <= X"ef";
		wait until rising_edge(clk);
		tick <= '1';
		wait until rising_edge(clk);
		tick <= '0';
		for i in 1 to 10 loop
			wait until falling_edge(clk);
		end loop;
		-- test 2
		wait until falling_edge(clk);
		input_data <= X"ff";
		wait until rising_edge(clk);
		tick <= '1';
		wait until rising_edge(clk);
		tick <= '0';
		for i in 1 to 10 loop
			wait until falling_edge(clk);
		end loop;
		-- test 3
		wait until falling_edge(clk);
		input_data <= X"72";
		wait until rising_edge(clk);
		tick <= '1';
		wait until rising_edge(clk);
		tick <= '0';
		for i in 1 to 10 loop
			wait until falling_edge(clk);
		end loop;
		-- test 4
		wait until falling_edge(clk);
		input_data <= X"6d";
		wait until rising_edge(clk);
		tick <= '1';
		wait until rising_edge(clk);
		tick <= '0';
		for i in 1 to 10 loop
			wait until falling_edge(clk);
		end loop;
		-- test 5
		wait until falling_edge(clk);
		input_data <= X"69";
		wait until rising_edge(clk);
		tick <= '1';
		wait until rising_edge(clk);
		tick <= '0';
		for i in 1 to 10 loop
			wait until falling_edge(clk);
		end loop;
		wait for 1000 us;
   end process;

END;
