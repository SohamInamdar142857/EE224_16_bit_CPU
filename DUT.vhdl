library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(1 downto 0);
			output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
   component cpu is
		port(clock, reset: in std_logic;
			  output: out std_logic);
   end component;
begin
   add_instance: cpu
			port map (clock => input_vector(1), reset => input_vector(0),
						 output => output_vector(0));
end DutWrap;