LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY SPI_Master_sim IS
END SPI_Master_sim;
 
ARCHITECTURE behavior OF SPI_Master_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SPI_Master
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         tick : IN  std_logic;
         miso : IN  std_logic;
         input_data : IN  std_logic_vector(31 downto 0);
         write_count : IN  std_logic_vector(4 downto 0);
         read_count : IN  std_logic_vector(3 downto 0);
         mosi : OUT  std_logic;
         cs : OUT  std_logic;
         sclk : OUT  std_logic;
         done_tick : OUT  std_logic;
         output_data : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal tick : std_logic := '0';
   signal miso : std_logic := '0';
   signal input_data : std_logic_vector(31 downto 0) := (others => '0');
   signal write_count : std_logic_vector(4 downto 0) := (others => '0');
   signal read_count : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal mosi : std_logic;
   signal cs : std_logic;
   signal sclk : std_logic;
   signal done_tick : std_logic;
   signal output_data : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 41 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SPI_Master PORT MAP (
          clk => clk,
          reset => reset,
          tick => tick,
          miso => miso,
          input_data => input_data,
          write_count => write_count,
          read_count => read_count,
          mosi => mosi,
          cs => cs,
          sclk => sclk,
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

   -- Stimulus process
   stim_proc: process
   begin		
		input_data <= X"90000000";
		write_count <= "11111";
		read_count <= "1111";
		for i in 1 to 10 loop
			wait until rising_edge(clk);
		end loop;
		reset <= '1';
		tick <= '1';
		miso <= '1';
		wait until rising_edge(clk);
		tick <= '0';
		for i in 1 to 100 loop
			wait until rising_edge(clk);
		end loop;
   end process;

END;
