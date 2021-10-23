library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

-- this module is a simple mod-m counter which is used to generate baud rate
--	you can change baud rate simply by changing COUNTER_LIMIT value
--	make sure you fully understand the baud rate relationship with COUNTER_LIMIT value
-- 						baudrate = clkFrequency / (coefficient * COUNTER_LIMIT)
-- the reason we have coefficient parameter is that we let the baudrate ticks for a number of times 
-- we get our sample on the half tick for more accuracy

entity BaudRate_Generator is
	GENERIC(
		COUNTER_LIMIT: integer:= 78
	);
	
	PORT(
		clk: in std_logic;
		reset: in std_logic;
		max_tick: out std_logic	-- ticks when counter reaches it's maximum value
	);
end BaudRate_Generator;

architecture Behavioral of BaudRate_Generator is
	constant COUNTER_BIT_COUNT: integer:= integer(ceil(log2(real(COUNTER_LIMIT))));
	
	signal counter_reg, counter_next: unsigned(COUNTER_BIT_COUNT-1 downto 0);
begin
	process(clk, reset) begin
		if reset = '0' then
			counter_reg <= (others => '0');
		elsif(clk'event and clk = '1') then
			counter_reg <= counter_next;
		end if;
	end process;
	
	counter_next <= (others => '0') when counter_reg = COUNTER_LIMIT - 1 else
						 counter_reg + 1;
	max_tick <= '1' when counter_reg = COUNTER_LIMIT - 1 else
					'0';
end Behavioral;

