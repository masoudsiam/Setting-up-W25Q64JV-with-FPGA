library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity UART_Transmitter is
	GENERIC(
		DATA_BIT_COUNT: integer:= 8;
		TICK_PER_CYCLE: integer:= 16
	);
	PORT(
		clk: in std_logic;
		reset: in std_logic;
		tick: in std_logic; -- input tick coming from BaudRate_Generator
		input_tick: in std_logic; -- input tick coming from Output_Data_Collector
		input_data: in std_logic_vector(DATA_BIT_COUNT-1 downto 0);
		tx: out std_logic;
		tx_done_tick: out std_logic
	);
end UART_Transmitter;

architecture Behavioral of UART_Transmitter is
	constant TICK_COUNTER_BIT_COUNT: integer:= integer(ceil(log2(real(TICK_PER_CYCLE))));
	constant DATA_COUNTER_BIT_COUNT: integer:= integer(ceil(log2(real(DATA_BIT_COUNT))));

	type state_type is (idle, start, send, stop);
	
	signal state_reg, state_next: state_type;
	signal tick_counter_reg, tick_counter_next: unsigned(TICK_COUNTER_BIT_COUNT-1 downto 0); -- counter for number of ticks coming from baudrate_generator
	signal data_counter_reg, data_counter_next: unsigned(DATA_COUNTER_BIT_COUNT-1 downto 0); -- counter for number of bits received by uart_receiver
	signal data_reg, data_next: std_logic_vector(DATA_BIT_COUNT-1 downto 0); -- register for holding data bits received by uart_receiver
	signal tx_reg, tx_next: std_logic;
begin

	process(clk, reset) begin
		if reset = '0' then
			state_reg <= idle;
			tick_counter_reg <= (others => '0');
			data_counter_reg <= (others => '0');
			data_reg <= (others => '0');
			tx_reg <= '0';
		elsif(clk'event and clk = '1') then
			state_reg <= state_next;
			tick_counter_reg <= tick_counter_next;
			data_counter_reg <= data_counter_next;
			data_reg <= data_next;
			tx_reg <= tx_next;
		end if;
	end process;
	
	process(state_reg, tick_counter_reg, data_counter_reg, data_reg, tx_reg, tick, input_tick, input_data) begin
		state_next <= state_reg;
		tick_counter_next <= tick_counter_reg;
		data_counter_next <= data_counter_reg;
		data_next <= data_reg;
		tx_next <= tx_reg;
		tx_done_tick <= '0';
		case state_reg is
			when idle =>
				tx_next <= '1';
				if input_tick = '1' then
					state_next <= start;
					tick_counter_next <= (others => '0');
					data_next <= input_data;
				end if;
			when start =>
				tx_next <= '0';
				if tick = '1' then
					if tick_counter_reg = TICK_PER_CYCLE - 1 then
						state_next <= send;
						tick_counter_next <= (others => '0');
						data_counter_next <= (others => '0');
					else
						tick_counter_next <= tick_counter_reg + 1;
					end if;
				end if;
			when send =>
				tx_next <= data_reg(0);
				if tick = '1' then
					if tick_counter_reg = TICK_PER_CYCLE - 1 then
						tick_counter_next <= (others => '0');
						data_next <= '0' & data_reg(DATA_BIT_COUNT-1 downto 1);
						if data_counter_reg = DATA_BIT_COUNT - 1 then
							state_next <= stop;
						else
							data_counter_next <= data_counter_reg + 1;
						end if;
					else
						tick_counter_next <= tick_counter_reg + 1;
					end if;
				end if;
			when stop =>
				tx_next <= '1';
				if tick = '1' then
					if tick_counter_reg = TICK_PER_CYCLE - 1 then
						state_next <= idle;
						tx_done_tick <= '1';
					else
						tick_counter_next <= tick_counter_reg + 1;
					end if;
				end if;
		end case;
	end process;
	
	tx <= tx_reg;
	
end Behavioral;

