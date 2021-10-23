library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity MainModule is
	PORT(
		clk: in std_logic;
		reset: in std_logic;
		rx: in std_logic;
		miso: in std_logic;
		mosi: out std_logic;
		cs: out std_logic;
		sclk: out std_logic;
		tx: out std_logic
	);
end MainModule;

architecture Behavioral of MainModule is
	constant BAUDRATE_GENERATOR_COUNTER_LIMIT: integer:= 78; -- 24M/(16*78) = 19200
	constant UART_DATA_BIT_COUNT: integer:= 8;
	constant UART_TICK_PER_CYCLE: integer:=16;
	constant UNMODIFIED_INSTRUCTOIN_BIT_LIMIT: integer:= 40;
	constant MODIFIED_INSTRUCTION_BIT_LIMIT: integer:= 40;
	constant READ_DATA_BIT_LIMIT: integer:= 64;
	constant MAX_OPERATION_PER_STATE: integer:= 5;
	-- baudrate_generator signals
	signal baudrate_generator_tick: std_logic;
	-- UART_Receiver signals
	signal UART_Receiver_done_tick: std_logic;
	signal UART_Receiver_output_data: std_logic_vector(UART_DATA_BIT_COUNT-1 downto 0);
	-- Input_Data_Collector signals
	signal Collector_output_data: std_logic_vector(MODIFIED_INSTRUCTION_BIT_LIMIT-1 downto 0);
	signal Collector_write_counter: std_logic_vector(integer(ceil(log2(real(MODIFIED_INSTRUCTION_BIT_LIMIT))))-1 downto 0);
	signal Collector_read_counter: std_logic_vector(integer(ceil(log2(real(READ_DATA_BIT_LIMIT))))-1 downto 0);
	signal Collector_done_tick: std_logic;
	-- SPI_Master signals
	signal SPI_Master_done_tick: std_logic;
	signal SPI_Master_output_data: std_logic_vector(READ_DATA_BIT_LIMIT-1 downto 0);
	-- Output_Data_Collector signals
	signal Output_Data_Collector_output: std_logic_vector(UART_DATA_BIT_COUNT-1 downto 0);
	signal Output_Data_Collector_output_tick: std_logic;
	-- UART_Transmitter signals
	signal uart_transmitter_done_tick: std_logic;
begin

	BaudRate_Generator_unit: entity work.BaudRate_Generator(Behavioral)
		GENERIC MAP(COUNTER_LIMIT=>BAUDRATE_GENERATOR_COUNTER_LIMIT)
		PORT MAP(clk=>clk, reset=>reset, max_tick=>baudrate_generator_tick);
		
	UART_Receiver_unit: entity work.UART_Receiver(Behavioral)
		GENERIC MAP(DATA_BIT_COUNT=>UART_DATA_BIT_COUNT, TICK_PER_CYCLE=>UART_TICK_PER_CYCLE)
		PORT MAP(clk=>clk, reset=>reset, rx=>rx, tick=>baudrate_generator_tick, done_tick=>UART_Receiver_done_tick, output_data=>UART_Receiver_output_data);
		
	Input_Data_Collector_unit: entity work.Input_Data_Collector(Behavioral)
		GENERIC MAP(INPUT_DATA_BIT_COUNT=>UART_DATA_BIT_COUNT, TOTAL_INPUT_BIT_LIMIT=>UNMODIFIED_INSTRUCTOIN_BIT_LIMIT, WRITE_DATA_BIT_LIMIT=>MODIFIED_INSTRUCTION_BIT_LIMIT, 
						READ_DATA_BIT_LIMIT=>READ_DATA_BIT_LIMIT, MAX_OPERATION_PER_STATE=>MAX_OPERATION_PER_STATE)
		PORT MAP(clk=>clk, reset=>reset, tick=>UART_Receiver_done_tick, input_data=>UART_Receiver_output_data, output_data=>Collector_output_data, 
					write_counter=>Collector_write_counter, read_counter=>Collector_read_counter, done_tick=>Collector_done_tick);
	
	SPI_Master_unit: entity work.SPI_Master(Behavioral)
		GENERIC MAP(WRITE_DATA_BIT_LIMIT=>MODIFIED_INSTRUCTION_BIT_LIMIT, READ_DATA_BIT_LIMIT=>READ_DATA_BIT_LIMIT)
		PORT MAP(clk=>clk, reset=>reset, tick=>Collector_done_tick, miso=>miso, input_data=>Collector_output_data, write_count=>Collector_write_counter, 
					read_count=>Collector_read_counter, mosi=>mosi, cs=>cs, sclk=>sclk,done_tick=>SPI_Master_done_tick, output_data=>SPI_Master_output_data);
					
	Output_Data_Collector_unit: entity work.Output_Data_Collector(Behavioral)
		GENERIC MAP(READ_DATA_BIT_LIMIT=>READ_DATA_BIT_LIMIT, OUTPUT_DATA_BIT_COUNT=>UART_DATA_BIT_COUNT)
		PORT MAP(clk=>clk, reset=>reset, tick=>SPI_Master_done_tick, uart_transmitter_input_tick=>uart_transmitter_done_tick, input_data=>SPI_Master_output_data, 
					read_count=>Collector_read_counter, output_data=>Output_Data_Collector_output, done_tick=>open, output_tick=>Output_Data_Collector_output_tick);
	
	UART_Transmitter_unit: entity work.UART_Transmitter(Behavioral)
		GENERIC MAP(DATA_BIT_COUNT=>UART_DATA_BIT_COUNT, TICK_PER_CYCLE=>UART_TICK_PER_CYCLE)
		PORT MAP(clk=>clk, reset=>reset, tick=>baudrate_generator_tick, input_tick=>Output_Data_Collector_output_tick, input_data=>Output_Data_Collector_output, 
					tx=>tx, tx_done_tick=>uart_transmitter_done_tick);

end Behavioral;

