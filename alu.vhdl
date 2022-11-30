library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
	generic(operand_width : integer:=16);
	port(ALU_op: in std_logic_vector(1 downto 0);
	  ALU_A: in std_logic_vector(15 downto 0);
	  ALU_B: in std_logic_vector(15 downto 0);
	  ALU_C: out std_logic_vector(15 downto 0);
	  ALU_zero: out std_logic;
	  ALU_carry: out std_logic);
end ALU;

architecture a1 of ALU is


function sub(ALU_A: in std_logic_vector(operand_width-1 downto 0);
ALU_B: in std_logic_vector(operand_width-1 downto 0))
return std_logic_vector is
-- declaring and initializing variables using aggregates
variable diff : std_logic_vector(operand_width+1 downto 0):= (others=>'0');

begin
	diff(0)	:= '1';
     L3: for i in 0 to (operand_width)-1 loop
					diff(i+2):= ALU_B(i) xor (not ALU_A(i)) xor diff(0);
					diff(0):= ((not ALU_A(i)) and ALU_B(i)) or ((not ALU_A(i)) and diff(0)) or (ALU_B(i) and diff(0));
				end loop L3;
		if diff(0)='1' then
			L4: for i in 0 to (operand_width)-1 loop
					diff(i+2):= ALU_B(i) xor (not ALU_A(i)) xor diff(0);
					diff(0):= ((not ALU_A(i)) and ALU_B(i)) or ((not ALU_A(i)) and diff(0)) or (ALU_B(i) and diff(0));
				end loop L4;
		-- ALU_carry<='0';
		end if;
		if diff(17 downto 2)="000000000000000" then
			diff(1):='1';
		else
			diff(1):='0';
		end if;
return diff;
end sub;

function add(ALU_A: in std_logic_vector(operand_width-1 downto 0);
ALU_B: in std_logic_vector(operand_width-1 downto 0))
return std_logic_vector is
-- declaring and initializing variables using aggregates
variable addition : std_logic_vector(operand_width+1 downto 0):= (others=>'0');
variable carry : std_logic:= '0';

begin
	addition(0):='0';
     L3: for i in 0 to (operand_width)-1 loop
					addition(i+2):= ALU_B(i) xor ALU_A(i) xor addition(0);
					addition(0):= (ALU_A(i) and ALU_B(i)) or ( ALU_A(i) and addition(0)) or (ALU_B(i) and addition(0));
				end loop L3;
		
		if addition="0000000000000000" then
			addition(1):='1';
		else
			addition(1):='0';
		end if;
return addition;
end add;

function mul(ALU_A: in std_logic_vector(operand_width-1 downto 0);
ALU_B: in std_logic_vector(operand_width-1 downto 0))
return std_logic_vector is
-- declaring and initializing variables using aggregates
variable prod : std_logic_vector(operand_width+1 downto 0):= (others=>'0');

begin
		prod(17 downto 2):= ALU_A nand ALU_B;
		if prod(17 downto 2)="0000000000000000" then
			prod(1):='1';
		else
			prod(1):='0';
		end if;
return prod;
end mul;

function shift(ALU_A: in std_logic_vector(operand_width-1 downto 0);
ALU_B: in std_logic_vector(operand_width-1 downto 0))
return std_logic_vector is

variable shifted : std_logic_vector(operand_width+1 downto 0):= (others=>'0');

begin
		
		shifted(17 downto 9) := ALU_A(8 downto 0);
		shifted(8 downto 2):= "0000000";
		if shifted(17 downto 2)="0000000000000000" then
			shifted(1):='1';
		else
			shifted(1):='0';
		end if;
return shifted;
end shift;

begin
alu : process( ALU_A, ALU_B, ALU_op)
variable ans: std_logic_vector(17 downto 0);
begin
	-- addition operation
	if ALU_op(1)='0' and ALU_op(0)='0' then
		ans := add(ALU_A,ALU_B);
		ALU_C <= ans(17 downto 2);
		ALU_carry <= ans(0);
		ALU_zero <= ans(1);
		
	-- subtraction operation
	elsif ALU_op(1)='0' and ALU_op(0)='1' then
		ans := sub(ALU_A,ALU_B);
		ALU_C <= ans(17 downto 2);
		ALU_carry <= ans(0);
		ALU_zero <= ans(1);
		
	-- left shift by 7 bits operation
	elsif ALU_op(1)='1' and ALU_op(0)='1' then
		ans := shift(ALU_A,ALU_B);
		ALU_C <= ans(17 downto 2);
		ALU_carry <= ans(0);
		ALU_zero <= ans(1);
		
	-- nand operation
	elsif ALU_op(1)='1' and ALU_op(0)='0' then
		ans := mul(ALU_A,ALU_B);
		ALU_C <= ans(17 downto 2);
		ALU_carry <= ans(0);
		ALU_zero <= ans(1);
		
	end if;
	
end process ; --alu
end a1 ; -- a1