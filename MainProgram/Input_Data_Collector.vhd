library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

-- this module collects the data received by UART_Receiver and then
-- translate them into output_data and after that send them
-- along with write and read counter to the SPI_Master for sending process

entity Input_Data_Collector is
	GENERIC(
		INPUT_DATA_BIT_COUNT: integer:= 8;
		TOTAL_INPUT_BIT_LIMIT: integer:= 40;
		WRITE_DATA_BIT_LIMIT: integer:= 40;
		READ_DATA_BIT_LIMIT: integer:= 64;
		MAX_OPERATION_PER_STATE: integer:= 5
	);
	
	PORT(
		clk: in std_logic;
		reset: in std_logic;
		tick: in std_logic; -- input tick coming from UART_Receiver to indicate that one data byte is ready to be collected
		input_data: in std_logic_vector(INPUT_DATA_BIT_COUNT-1 downto 0);
		output_data: out std_logic_vector(WRITE_DATA_BIT_LIMIT-1 downto 0);
		write_counter: out std_logic_vector(integer(ceil(log2(real(WRITE_DATA_BIT_LIMIT))))-1 downto 0); -- number of bits that should be sent
		read_counter: out std_logic_vector(integer(ceil(log2(real(READ_DATA_BIT_LIMIT))))-1 downto 0); -- number of bits that should be read
		done_tick: out std_logic
	);
end Input_Data_Collector;

architecture Behavioral of Input_Data_Collector is
	constant WRITE_COUNTER_BIT_COUNT: integer:= integer(ceil(log2(real(WRITE_DATA_BIT_LIMIT))));
	constant READ_COUNTER_BIT_COUNT: integer:= integer(ceil(log2(real(READ_DATA_BIT_LIMIT))));
	constant COUNTER_BIT_COUNT: integer:= integer(ceil(log2(real(MAX_OPERATION_PER_STATE))));

	type state_type is (idle, instruction, instruction_identifier, status, status_identifier, address, address_identifier, shift, finish);
	
	signal state_reg, state_next: state_type;
	signal data_reg, data_next: std_logic_vector(TOTAL_INPUT_BIT_LIMIT-1 downto 0); -- raw data received from uart
	signal instruction_reg, instruction_next: std_logic_vector(WRITE_DATA_BIT_LIMIT-1+1 downto 0); -- processed data ready to be sent
	signal write_counter_reg, write_counter_next: unsigned(WRITE_COUNTER_BIT_COUNT-1 downto 0);
	signal read_counter_reg, read_counter_next: unsigned(READ_COUNTER_BIT_COUNT-1 downto 0);
	signal counter_reg, counter_next: unsigned(COUNTER_BIT_COUNT-1 downto 0);
begin

	process(clk, reset) begin
		if reset = '0' then
			state_reg <= idle;
			data_reg <= (others => '0');
			instruction_reg <= (others => '0');
			write_counter_reg <= (others => '0');
			read_counter_reg <= (others => '0');
			counter_reg <= (others => '0');
		elsif(clk'event and clk = '1') then
			state_reg <= state_next;
			data_reg <= data_next;
			instruction_reg <= instruction_next;
			write_counter_reg <= write_counter_next;
			read_counter_reg <= read_counter_next;
			counter_reg <= counter_next;
		end if;
	end process;
	
	process(state_reg, data_reg, instruction_reg, write_counter_reg, read_counter_reg, counter_reg, tick, input_data) begin
		state_next <= state_reg;
		data_next <= data_reg;
		instruction_next <= instruction_reg;
		write_counter_next <= write_counter_reg;
		read_counter_next <= read_counter_reg;
		counter_next <= counter_reg;
		done_tick <= '0';
		case state_reg is
			when idle => -- idle state waits for uart to send a X"ff" data which means a new instruction is going to be received
				if(tick = '1' and input_data = X"ff") then
					state_next <= instruction;
					data_next <= (others => '0');
					instruction_next <= (others => '0');
					write_counter_next <= (others => '0');
					read_counter_next <= (others => '0');
					counter_next <= counter_reg + 2;
				end if;
			when instruction => -- instruction state receives first 3 byte of data which contains information about what instruction is going to be received
				if tick = '1' then
					data_next <= data_reg(TOTAL_INPUT_BIT_LIMIT-9 downto 0) & input_data;
					if counter_reg = 0 then
						state_next <= instruction_identifier;
						instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-1 downto 0) & '1';
					else
						counter_next <= counter_reg - 1;
					end if;
				end if;
			when instruction_identifier => -- instruction_identifier state decode that 3 byte and check what instruction is going to be received
				if data_reg(23 downto 0) = X"57454c" then -- WEL --> Write Enable
					state_next <= shift;
					instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-8 downto 0) & X"06";
					write_counter_next <= write_counter_reg + 7;
				elsif data_reg(23 downto 0) = X"525352" then -- RSRX --> Read Status Register X
					state_next <= status;
					write_counter_next <= write_counter_reg + 7;
					read_counter_next <= read_counter_reg + 7;
				elsif data_reg(23 downto 0) = X"534345" then -- SCEXXXXXX --> Sector Erase XXXXXX
					state_next <= address;
					instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-8 downto 0) & X"20";
					write_counter_next <= write_counter_reg + 31;
					counter_next <= counter_reg + 2;
				elsif data_reg(23 downto 0) = X"524453" then -- RDSXXXXXX --> Read Data Small XXXXXX (1 byte)
					state_next <= address;
					instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-8 downto 0) & X"03";
					write_counter_next <= write_counter_reg + 31;
					read_counter_next <= read_counter_reg + 7;
					counter_next <= counter_reg + 2;
				elsif data_reg(23 downto 0) = X"574453" then -- WDSXXXXXXYY --> Write Data Small YY on XXXXXX
					state_next <= address;
					instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-8 downto 0) & X"02";
					write_counter_next <= write_counter_reg + 39;
					counter_next <= counter_reg + 3;
--				elsif data_reg(23 downto 0) = X"57444c" then -- WDL --> Write Disable
--					state_next <= shift;
--					instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-8 downto 0) & X"04";
--					write_counter_next <= write_counter_reg + 7;
--				elsif data_reg(23 downto 0) = X"574556" then -- WEV --> Write Enable for Volatile Status Register
--					state_next <= shift;
--					instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-8 downto 0) & X"50";
--					write_counter_next <= write_counter_reg + 7;
--				elsif data_reg(23 downto 0) = X"524d49" then -- RMI --> Read Manufacturer/Device ID
--					state_next <= shift;
--					instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-32 downto 0) & X"90000000";
--					write_counter_next <= write_counter_reg + 31;
--					read_counter_next <= read_counter_reg + 15;
--				elsif data_reg(23 downto 0) = X"524a49" then -- RJI --> Read JEDEC ID
--					state_next <= shift;
--					instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-8 downto 0) & X"9f";
--					write_counter_next <= write_counter_reg + 7;
--					read_counter_next <= read_counter_reg + 23;
--				elsif data_reg(23 downto 0) = X"525549" then -- RUI --> Read Unique ID
--					state_next <= shift;
--					instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-40 downto 0) & X"4b00000000";
--					write_counter_next <= write_counter_reg + 39;
--					read_counter_next <= read_counter_reg + 63;
				else
					state_next <= idle;
				end if;
			when status =>
				if tick = '1' then
					data_next <= data_reg(TOTAL_INPUT_BIT_LIMIT-9 downto 0) & input_data;
					state_next <= status_identifier;
				end if;
			when status_identifier =>
				state_next <= shift;
				if data_reg(7 downto 0) = X"31" then
					instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-8 downto 0) & X"05";
				elsif data_reg(7 downto 0) = X"32" then
					instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-8 downto 0) & X"35";
				elsif data_reg(7 downto 0) = X"33" then
					instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-8 downto 0) & X"15";
				else
					state_next <= idle;
				end if;
			when address =>
				if tick = '1' then
					data_next <= data_reg(TOTAL_INPUT_BIT_LIMIT-9 downto 0) & input_data;
					if counter_reg = 0 then
						state_next <= address_identifier;
					else
						counter_next <= counter_reg - 1;
					end if;
				end if;
			when address_identifier =>
				state_next <= shift;
				if instruction_reg(7 downto 0) = X"02" then
					instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-32 downto 0) & data_reg(31 downto 0);
				else
					instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-24 downto 0) & data_reg(23 downto 0);
				end if;
			when shift => -- shift state shift the modified data to the left as much as possible
				instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-1 downto 0) & '0';
				if instruction_reg(WRITE_DATA_BIT_LIMIT) = '1' then
					state_next <= finish;
				end if;
			when finish => -- finish state sends a tick which means that spi can receive and send the modified data
				state_next <= idle;
				done_tick <= '1';
		end case;
	end process;
	
	output_data <= instruction_reg(WRITE_DATA_BIT_LIMIT downto 1);
	write_counter <= std_logic_vector(write_counter_reg); 	
	read_counter <= std_logic_vector(read_counter_reg);
end Behavioral;

