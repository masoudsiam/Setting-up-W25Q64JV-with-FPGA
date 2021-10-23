library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

-- this module receives the data came from SPI_Master and
-- make 1 byte packets for sending them over uart.It also wait
-- for busy bit to become zero if needed.

entity Output_Data_Collector is
	GENERIC(
		READ_DATA_BIT_LIMIT: integer:= 64;
		OUTPUT_DATA_BIT_COUNT: integer:= 8
	);
	
	PORT(
		clk: in std_logic;
		reset: in std_logic;
		tick: in std_logic; -- input tick coming from SPI_Master to let this module start its operation
		uart_transmitter_input_tick: in std_logic; -- used for checking when uart transmitter is free to use
		input_data: in std_logic_vector(READ_DATA_BIT_LIMIT-1 downto 0);
		read_count: in std_logic_vector(integer(ceil(log2(real(READ_DATA_BIT_LIMIT))))-1 downto 0);
		output_data: out std_logic_vector(OUTPUT_DATA_BIT_COUNT-1 downto 0);
		done_tick: out std_logic;
		output_tick: out std_logic -- used for signaling uart transmitter to start sending next byte
	);
end Output_Data_Collector;

architecture Behavioral of Output_Data_Collector is
	constant COUNTER_BIT_COUNT: integer:= integer(ceil(log2(real(READ_DATA_BIT_LIMIT))));

	type state_type is (idle, start, firstByte, send, finish);
	
	signal state_reg, state_next: state_type;
	signal data_reg, data_next: std_logic_vector(READ_DATA_BIT_LIMIT-1 downto 0);
	signal output_reg, output_next: std_logic_vector(OUTPUT_DATA_BIT_COUNT-1 downto 0);
	signal output_tick_reg, output_tick_next: std_logic;
	signal counter_reg, counter_next: unsigned(COUNTER_BIT_COUNT-1 downto 0);
begin

	process(clk, reset) begin
		if reset = '0' then
			state_reg <= idle;
			data_reg <= (others => '0');
			output_reg <= (others => '0');
			output_tick_reg <= '0';
			counter_reg <= (others => '0');
		elsif(clk'event and clk = '1') then
			state_reg <= state_next;
			data_reg <= data_next;
			output_reg <= output_next;
			output_tick_reg <= output_tick_next;
			counter_reg <= counter_next;
		end if;
	end process;
		
	process(state_reg, data_reg, output_reg, output_tick_reg, counter_reg, tick, uart_transmitter_input_tick, input_data, read_count) begin
		state_next <= state_reg;
		data_next <= data_reg;
		output_next <= output_reg;
		counter_next <= counter_reg;
		output_tick_next <= '0';
		done_tick <= '0';
		case state_reg is
			when idle =>
				if tick = '1' then
					state_next <= start;
					data_next <= input_data;
					output_next <= (others => '0');
					counter_next <= unsigned(read_count);
				end if;
			when start =>
				state_next <= firstByte;
				if counter_reg = 0 then
					data_next <= X"444f4e45" & data_reg(READ_DATA_BIT_LIMIT-33 downto 0);
					counter_next <= counter_reg + 31;
				end if;
			when firstByte =>
				output_tick_next <= '1';
				output_next <= data_reg(READ_DATA_BIT_LIMIT-1 downto READ_DATA_BIT_LIMIT-8);
				data_next <= data_reg(READ_DATA_BIT_LIMIT-9 downto 0) & X"00";
				if counter_reg = 7 then
					state_next <= finish;
				else
					state_next <= send;
					counter_next <= counter_reg - 8;
				end if;
			when send =>
				if uart_transmitter_input_tick = '1' then
					output_tick_next <= '1';
					output_next <= data_reg(READ_DATA_BIT_LIMIT-1 downto READ_DATA_BIT_LIMIT-8);
					data_next <= data_reg(READ_DATA_BIT_LIMIT-9 downto 0) & X"00";
					if counter_reg = 7 then
						state_next <= finish;
					else
						counter_next <= counter_reg - 8;
					end if;
				end if;
			when finish =>
				state_next <= idle;
				done_tick <= '1';
		end case;
	end process;
	
	output_data <= output_reg;
	output_tick <= output_tick_reg;

end Behavioral;

