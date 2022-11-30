library ieee;
use ieee.std_logic_1164.all;

entity reg is
	port (D: in std_logic_vector(15 downto 0);
			clk, rst, we: in std_logic;
			Q: out std_logic_vector(15 downto 0));
end entity reg;

architecture behav of reg is
begin
	process (clk, rst)
		begin
			if (rst = '1') then
				Q <= "0000000000000000";
			elsif (clk'event and clk = '1') then
				if (we = '1') then
					Q <= D;
				end if;
			end if ;
		end process;
end behav;