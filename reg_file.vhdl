library ieee;
use ieee.std_logic_1164.all;

entity reg_file is
	port (RF_A1, RF_A2, RF_A3: in std_logic_vector(2 downto 0);
			RF_D3: in std_logic_vector(15 downto 0);
			clk, rst, we: in std_logic;
			RF_D1, RF_D2: out std_logic_vector(15 downto 0));
end entity reg_file;

architecture arch of reg_file is

component reg is
	port (D: in std_logic_vector(15 downto 0);
			clk, rst, we: in std_logic;
			Q: out std_logic_vector(15 downto 0));
end component reg;

component demux18 is
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
end component demux18;

component mux81 is
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
end component mux81;

type registers is array(0 to 7) of std_logic_vector(15 downto 0);
signal ri, ro : registers;

begin
	DMX: demux18 port map (inp => RF_D3, A => RF_A3, outp1 => ri(0), outp2 => ri(1),
								 outp3 => ri(2), outp4 => ri(3), outp5 => ri(4),
								 outp6 => ri(5), outp7 => ri(6), outp8 => ri(7));
	
	L1: for i in 0 to 7 generate
		R: reg port map (D => ri(i), clk => clk, rst => rst, we => we, Q => ro(i));
	end generate;
	
	MX1: mux81 port map (inp1 => ro(0), inp2 => ro(1), inp3 => ro(2), inp4 => ro(3),
								inp5 => ro(4), inp6 => ro(5), inp7 => ro(6), inp8 => ro(7),
								A => RF_A1, outp => RF_D1);
	
	MX2: mux81 port map (inp1 => ro(0), inp2 => ro(1), inp3 => ro(2), inp4 => ro(3),
								inp5 => ro(4), inp6 => ro(5), inp7 => ro(6), inp8 => ro(7),
								A => RF_A2, outp => RF_D2);
end arch;