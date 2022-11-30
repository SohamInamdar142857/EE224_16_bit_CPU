library ieee;
use ieee.std_logic_1164.all;

entity demux18 is
	port (inp: in std_logic_vector(15 downto 0);
			A: in std_logic_vector(2 downto 0);
			outp1: out std_logic_vector(15 downto 0);
			outp2: out std_logic_vector(15 downto 0);
			outp3: out std_logic_vector(15 downto 0);
			outp4: out std_logic_vector(15 downto 0);
			outp5: out std_logic_vector(15 downto 0);
			outp6: out std_logic_vector(15 downto 0);
			outp7: out std_logic_vector(15 downto 0);
			outp8: out std_logic_vector(15 downto 0));
end entity demux18;

architecture behav of demux18 is
begin
	process(inp, A)
	begin
		case A is
			when "000" =>
				outp1 <= inp;
			when "001" =>
				outp2 <= inp;
			when "010" =>
				outp3 <= inp;
			when "011" =>
				outp4 <= inp;
			when "100" =>
				outp5 <= inp;
			when "101" =>
				outp6 <= inp;
			when "110" =>
				outp7 <= inp;
			when "111" =>
				outp8 <= inp;
			when others=>
		end case;
	end process;
end behav;