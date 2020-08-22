library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TOP_dac is
Port ( 
		clk  :in  std_logic;
		salidas   :out std_logic_vector (10  downto 0);
		data_uart :in  std_logic_vector (23 downto 0);
		clk_ce  :in  std_logic
		);
end TOP_dac;

architecture Structural of TOP_dac is
	
	signal frecuencia_in: std_logic_vector(21 downto 0);
	signal phase_in: std_logic_vector(15 downto 0);
	signal ce: std_logic;
	signal clk_ce_sig: std_logic;
	COMPONENT phase_acu
	PORT(
		clk_in  	  : IN  std_logic;     		
		clk_sal 	  : OUT std_logic;  
		frecuencia : IN  std_logic_vector(21 downto 0)
		);
	END COMPONENT;

	COMPONENT LookUp_table
	PORT(
		clk_in : IN std_logic;
		clk_4Mhz : IN std_logic;
		ce : IN std_logic;
		clk_ce	  : IN  std_logic; 
		data_in : IN std_logic_vector(15 downto 0);          
		salidas_out : OUT std_logic_vector(10 downto 0)
		);
	END COMPONENT;
	
signal clk_acu: std_logic;	

begin
	
	Inst_LookUp_table: LookUp_table PORT MAP(
		clk_in 		=> clk_acu,
		clk_4Mhz		=> clk,
		ce		 		=> ce,
		data_in 		=> phase_in,
		salidas_out => salidas,
		clk_ce => clk_ce
	);


		frecuencia_in <= data_uart(21 downto 0) when data_uart(23 downto 22) = "01";
		phase_in		  <= data_uart(15 downto 0) when data_uart(23 downto 16) = "11000000";
		ce				  <= '1' 						 when data_uart(23 downto 16) = "11000000" else 
							  '0';



	Inst_phase_acu: phase_acu PORT MAP(
		clk_in 		=> clk,
		clk_sal 		=> clk_acu,
		frecuencia  => frecuencia_in
		);
		

end Structural;