LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Output_Data_Collector_sim IS
END Output_Data_Collector_sim;
 
ARCHITECTURE behavior OF Output_Data_Collector_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Output_Data_Collector
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         tick : IN  std_logic;
         uart_transmitter_input_tick : IN  std_logic;
         input_data : IN  std_logic_vector(63 downto 0);
         read_count : IN  std_logic_vector(5 downto 0);
         output_data : OUT  std_logic_vector(7 downto 0);
         done_tick : OUT  std_logic;
         uart_transmitter_output_tick : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal tick : std_logic := '0';
   signal uart_transmitter_input_tick : std_logic := '0';
   signal input_data : std_logic_vector(63 downto 0) := (others => '0');
   signal read_count : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal output_data : std_logic_vector(7 downto 0);
   signal done_tick : std_logic;
   signal uart_transmitter_output_tick : std_logic;

   -- Clock period definitions
   constant clk_period : time := 41 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Output_Data_Collector PORT MAP (
          clk => clk,
          reset => reset,
          tick => tick,
          uart_transmitter_input_tick => uart_transmitter_input_tick,
          input_data => input_data,
          read_count => read_count,
          output_data => output_data,
          done_tick => done_tick,
          uart_transmitter_output_tick => uart_transmitter_output_tick
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
		input_data <= X"EF16000000000000";
		read_count <= "001111";
		wait until falling_edge(clk);
		tick <= '1';
		wait until falling_edge(clk);
		tick <= '0';
		for i in 1 to 100 loop
			wait until falling_edge(clk);
		end loop;
		uart_transmitter_input_tick <= '1';
		wait until falling_edge(clk);
		uart_transmitter_input_tick <= '0';
		for i in 1 to 100 loop
			wait until falling_edge(clk);
		end loop;
		uart_transmitter_input_tick <= '1';
		wait until falling_edge(clk);
		uart_transmitter_input_tick <= '0';
		for i in 1 to 10 loop
			wait until falling_edge(clk);
		end loop;
		-- test 2
		input_data <= X"EF00000000000000";
		read_count <= "000111";
		wait until falling_edge(clk);
		tick <= '1';
		wait until falling_edge(clk);
		tick <= '0';
		for i in 1 to 100 loop
			wait until falling_edge(clk);
		end loop;
		uart_transmitter_input_tick <= '1';
		wait until falling_edge(clk);
		uart_transmitter_input_tick <= '0';
		for i in 1 to 100 loop
			wait until falling_edge(clk);
		end loop;
   end process;

END;
