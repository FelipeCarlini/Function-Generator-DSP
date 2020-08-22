LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL; 

entity phase_acu is

	port(
		clk_in  : in  std_logic;
		clk_sal : out std_logic;
		frecuencia : in std_logic_vector(21 downto 0)
	);

end phase_acu;

architecture Behavioral of phase_acu is
	--signal frecuencia   :integer range 0 to 65535:=0;
	signal cont_clk_div :integer range 0 to 25000000:=0;
	signal phase_acu	  :integer range 0 to 4194304:=0;
	signal clk_sal_sig  :std_logic;
begin

	process(clk_in)
	begin
	
		if(clk_in'event and clk_in='1')then
			if(phase_acu >= 4194303)then
				phase_acu <= phase_acu - 4194303 + to_integer(unsigned(frecuencia));
				--phase_acu <= phase_acu - 65535 + 1000;
				clk_sal_sig <= not clk_sal_sig;
			else
				phase_acu <= phase_acu + to_integer(unsigned(frecuencia));		
				--phase_acu <= phase_acu + 1000;
			end if;
		end if;
	
	end process;
	
	
	clk_sal <= clk_sal_sig;

end Behavioral;

