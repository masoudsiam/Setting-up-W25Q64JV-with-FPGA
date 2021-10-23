library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity SPI_Master is
	GENERIC(
		WRITE_DATA_BIT_LIMIT: integer:= 40;
		READ_DATA_BIT_LIMIT: integer:= 64
	);
	
	PORT(
		clk: in std_logic;
		reset: in std_logic;
		tick: in std_logic; -- input tick coming from Input_Data_Collector to indicate that data is ready to be collected
		miso: in std_logic;
		input_data: in std_logic_vector(WRITE_DATA_BIT_LIMIT-1 downto 0);
		write_count: in std_logic_vector(integer(ceil(log2(real(WRITE_DATA_BIT_LIMIT))))-1 downto 0); -- how many bits should be sent
		read_count: in std_logic_vector(integer(ceil(log2(real(READ_DATA_BIT_LIMIT))))-1 downto 0); -- how many bits should be received
		mosi: out std_logic;
		cs:out std_logic;
		sclk: out std_logic;
		done_tick: out std_logic;
		output_data: out std_logic_vector(READ_DATA_BIT_LIMIT-1 downto 0)
	);
end SPI_Master;

architecture Behavioral of SPI_Master is
	constant COUNTER_WRITE_BIT_COUNT: integer:= integer(ceil(log2(real(WRITE_DATA_BIT_LIMIT))));
	constant COUNTER_READ_BIT_COUNT: integer:= integer(ceil(log2(real(READ_DATA_BIT_LIMIT))));
	
	type state_type is (idle, start, sending, receiving, lastBit, shift, finish);
	
	signal state_reg, state_next: state_type;
	signal tx_reg, tx_next: std_logic;
	signal instruction_reg, instruction_next: std_logic_vector(WRITE_DATA_BIT_LIMIT-1 downto 0);
	signal data_reg, data_next: std_logic_vector(READ_DATA_BIT_LIMIT-1+1 downto 0);
	signal counter_write_reg, counter_write_next: unsigned(COUNTER_WRITE_BIT_COUNT-1 downto 0);
	signal counter_read_reg, counter_read_next: unsigned(COUNTER_READ_BIT_COUNT-1 downto 0);
begin

	process(clk, reset) begin
		if reset = '0' then
			state_reg <= idle;
			tx_reg <= '0';
			instruction_reg <= (others => '0');
			data_reg <= (others => '0');
			counter_write_reg <= (others => '0');
			counter_read_reg <= (others => '0');
		elsif(clk'event and clk = '0') then
			state_reg <= state_next;
			tx_reg <= tx_next;
			instruction_reg <= instruction_next;
			data_reg <= data_next;
			counter_write_reg <= counter_write_next;
			counter_read_reg <= counter_read_next;
		end if;
	end process;
	
	process(state_reg, tx_reg, instruction_reg, data_reg, counter_write_reg, counter_read_reg, tick, miso, input_data, write_count, read_count) begin
		state_next <= state_reg;
		tx_next <= tx_reg;
		instruction_next <= instruction_reg;
		data_next <= data_reg;
		counter_write_next <= counter_write_reg;
		counter_read_next <= counter_read_reg;
		done_tick <= '0';
		case state_reg is
			when idle => -- idle state waits for tick coming from Input_Data_Collector which changes the state to start
				if tick = '1' then
					state_next <= start;
					tx_next <= '0';
					instruction_next <= input_data;
					data_next <= (others => '0');
					counter_write_next <= unsigned(write_count);
					counter_read_next <= unsigned(read_count);
				end if;
			when start => -- start state put first bit on the line to be sent
				state_next <= sending;
				tx_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-1);
				instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-2 downto 0) & '0';
			when sending => -- sending state sends all the bits via spi
				tx_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-1);
				instruction_next <= instruction_reg(WRITE_DATA_BIT_LIMIT-2 downto 0) & '0';
				if counter_write_reg = 0 then
					if counter_read_reg > 1 then
						state_next <= receiving;
						data_next <= data_reg(READ_DATA_BIT_LIMIT-1 downto 0) & '1';
					elsif counter_read_reg = 1 then
						state_next <= lastBit;
					else
						state_next <= finish;
					end if;
				else
					counter_write_next <= counter_write_reg - 1;
				end if;
			when receiving => -- receiving state receives all the bits via spi
				data_next <= data_reg(READ_DATA_BIT_LIMIT-1 downto 0) & miso;
				if counter_read_reg = 1 then
					state_next <= lastBit;
				else
					counter_read_next <= counter_read_reg - 1;				
				end if;
			when lastBit => -- lastBit state receives the last bit also makes sure that sclk is disconnected
				state_next <= shift;
				data_next <= data_reg(READ_DATA_BIT_LIMIT-1 downto 0) & miso;
			when shift =>
				data_next <= data_reg(READ_DATA_BIT_LIMIT-1 downto 0) & '0';
				if data_reg(READ_DATA_BIT_LIMIT) = '1' then
					state_next <= finish;
				end if;
			when finish => -- finish state send a done tick meaning operation is completed
				state_next <= idle;
				done_tick <= '1';
		end case;
	end process;
	
	with state_reg select
		cs <= '0' when start | sending | receiving | lastBit,
				'1' when others;
	with state_reg select
		sclk <= clk when sending | receiving,
				  '0' when others;
	mosi <= tx_reg;
	output_data <= data_reg(READ_DATA_BIT_LIMIT downto 1);

end Behavioral;

