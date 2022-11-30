library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is
	port (Mem_Addr, Mem_Data: in std_logic_vector(15 downto 0);
			clk, rst, r_enable, w_enable: in std_logic;
			Mem_Out: out std_logic_vector(15 downto 0));
end entity memory;

architecture behav of memory is

type locations is array(0 to 31) of std_logic_vector(15 downto 0);
-- Add instructions below

signal Mem : locations := ("0100001000000000","0100000000000000", "0000000001000000", "0101000100000010", others => (others => '1'));

begin
	process (clk, rst, r_enable, Mem_Addr, Mem_Data)
		begin
			if (rst = '1') then
				Mem(to_integer(unsigned(Mem_Addr(4 downto 0)))) <= "0000000000000000";
			elsif (clk'event and clk = '1') then
				if (w_enable = '1') then
					Mem(to_integer(unsigned(Mem_Addr(4 downto 0)))) <= Mem_Data;
				end if;
			end if ;
			
			if (r_enable = '1') then
					Mem_Out <= Mem(to_integer(unsigned(Mem_Addr(4 downto 0))));
			end if;
		end process;
end behav;