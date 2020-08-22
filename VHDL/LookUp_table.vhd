LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE IEEE.STD_LOGIC_signed.all;
use IEEE.MATH_REAL.ALL;

entity LookUp_table is

	port(
		clk_in:in std_logic;
		salidas_out:out std_logic_vector (7 downto 0));

end LookUp_table;

architecture Behavioral of LookUp_table is

	signal cont :integer range 0 to 255:=0;
	
begin

process(clk_in,cont)
begin
	if(clk_in'event and clk_in='1')then
		if(cont=63)then
			cont<=0;
		else
			cont<=cont+1;
		end if;
	end if;
end process;
salidas_out<=conv_std_logic_vector(conv_integer(cont)*4,8);

end Behavioral;
