library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

-- this module is a uart receiver that receives each data byte bit by bit and
-- then hand over the full byte in output_data

entity UART_Receiver is
	GENERIC(
		DATA_BIT_COUNT: integer:= 8;
		TICK_PER_CYCLE: integer:= 16 -- coefficient that specifies the baudrate
	);
	
	PORT(
		clk: in std_logic;
		reset: in std_logic;
		rx: in std_logic; -- input data line
		tick: in std_logic; -- input tick coming from BaudRate_Generator
		done_tick: out std_logic;
		output_data: out std_logic_vector(DATA_BIT_COUNT-1 downto 0)
	);
end UART_Receiver;

architecture Behavioral of UART_Receiver is
	constant TICK_COUNTER_BIT_COUNT: integer:= integer(ceil(log2(real(TICK_PER_CYCLE))));
	constant DATA_COUNTER_BIT_COUNT: integer:= integer(ceil(log2(real(DATA_BIT_COUNT))));
	constant HALF_TICK_PER_CYCLE: integer:= integer(ceil(real(TICK_PER_CYCLE)/real(2))); -- TICK_PER_CYCLE/2 rounded up

	type state_type is (idle, start, receive, stop);
	
	signal state_reg, state_next: state_type;
	signal tick_counter_reg, tick_counter_next: unsigned(TICK_COUNTER_BIT_COUNT-1 downto 0); -- counter for number of ticks coming from baudrate_generator
	signal data_counter_reg, data_counter_next: unsigned(DATA_COUNTER_BIT_COUNT-1 downto 0); -- counter for number of bits received by uart_receiver
	signal data_reg, data_next: std_logic_vector(DATA_BIT_COUNT-1 downto 0); -- register for holding data bits received by uart_receiver
begin

	process(clk, reset) begin
		if reset = '0' then
			state_reg <= idle;
			tick_counter_reg <= (others => '0');
			data_counter_reg <= (others => '0');
			data_reg <= (others => '0');
		elsif(clk'event and clk = '1') then
			state_reg <= state_next;
			tick_counter_reg <= tick_counter_next;
			data_counter_reg <= data_counter_next;
			data_reg <= data_next;
		end if;
	end process;
	
	process(state_reg, tick_counter_reg, data_counter_reg, data_reg, tick, rx) begin
		state_next <= state_reg;
		tick_counter_next <= tick_counter_reg;
		data_counter_next <= data_counter_reg;
		data_next <= data_reg;
		done_tick <= '0';
		case state_reg is
			when idle => -- idle state waits for rx to become '0' which then change the state to start
				if rx = '0' then
					state_next <= start;
					tick_counter_next <= (others => '0');
				end if;
			when start => -- start state wait for a specific time to pass and then change the state to receive
				if tick = '1' then
					if tick_counter_reg = HALF_TICK_PER_CYCLE - 1 then
						state_next <= receive;
						tick_counter_next <= (others => '0');
						data_counter_next <= (others => '0');
					else
						tick_counter_next <= tick_counter_reg + 1;
					end if;
				end if;
			when receive => -- receive state receive data bit by bit and shift each bit into the data_reg
				if tick = '1' then
					if tick_counter_reg = TICK_PER_CYCLE - 1 then
						tick_counter_next <= (others => '0');
						data_next <= rx & data_reg(DATA_BIT_COUNT-1 downto 1);
						if data_counter_reg = DATA_BIT_COUNT - 1 then
							state_next <= stop;
						else
							data_counter_next <= data_counter_reg + 1;
						end if;
					else
						tick_counter_next <= tick_counter_reg + 1;
					end if;
				end if;
			when stop => -- stop state wait for a specific time to pass and then change the state to idle
				if tick = '1' then
					if tick_counter_reg = TICK_PER_CYCLE - 1 then
						state_next <= idle;
						done_tick <= '1';
					else
						tick_counter_next <= tick_counter_reg + 1;
					end if;
				end if;
		end case;
	end process;
	
	output_data <= data_reg;

end Behavioral;

