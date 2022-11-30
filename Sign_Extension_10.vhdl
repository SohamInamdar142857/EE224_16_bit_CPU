library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity Sign_Extension_10 is
   port(ip: in std_logic_vector(5 downto 0);
			op: out std_logic_vector(15 downto 0));
end entity;

architecture Struct of Sign_Extension_10 is

begin
	op(5 downto 0) <= ip(5 downto 0);
	
	op(15 downto 6) <= (others => ip(5));
	
end Struct;