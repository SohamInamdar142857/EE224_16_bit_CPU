library ieee;
use ieee.std_logic_1164.all;

entity mux81 is
	port (inp1: in std_logic_vector(15 downto 0);
			inp2: in std_logic_vector(15 downto 0);
			inp3: in std_logic_vector(15 downto 0);
			inp4: in std_logic_vector(15 downto 0);
			inp5: in std_logic_vector(15 downto 0);
			inp6: in std_logic_vector(15 downto 0);
			inp7: in std_logic_vector(15 downto 0);
			inp8: in std_logic_vector(15 downto 0);
			A: in std_logic_vector(2 downto 0);
			outp: out std_logic_vector(15 downto 0));
end entity mux81;

architecture behav of mux81 is
begin
	process(inp1, inp2, inp3, inp4, inp5, inp6, inp7, inp8, A)
	begin
		case A is
			when "000" =>
				outp <= inp1;
			when "001" =>
				outp <= inp2;
			when "010" =>
				outp <= inp3;
			when "011" =>
				outp <= inp4;
			when "100" =>
				outp <= inp5;
			when "101" =>
				outp <= inp6;
			when "110" =>
				outp <= inp7;
			when "111" =>
				outp <= inp8;
			when others=>
		end case;
	end process;
end behav;