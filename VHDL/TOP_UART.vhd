library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TOP_UART is

port(
	enable 	: IN  std_logic;
	RXD 		: IN  std_logic;
	clk 		: IN  std_logic;
	control 	: IN  std_logic_vector(1 downto 0);
	data_o	: OUT std_logic_vector(23 downto 0);
	S_paridad	: OUT std_logic;
	led	: OUT std_logic_vector(2 downto 0);
	clk_ce 	 :out std_logic
);

end TOP_UART;

architecture STRUCTURAL of TOP_UART is
	
	
	signal data 	 :std_logic_vector (7 downto 0);
	signal data_sig :std_logic_vector(23 downto 0);
	signal data_sig2:std_logic_vector(23 downto 0);
	

	COMPONENT UART
	PORT(
		RXD   : IN std_logic;
		CLK50 : IN std_logic;          
		DATA  : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	
begin

	Inst_UART: UART PORT MAP(
		RXD => RXD,
		DATA => data,
		CLK50 =>CLK
	);

	process(data,control,enable)
	begin
			
		if(enable'event and enable='1')then	
			case control is
			 
			  when "00" =>   data_sig(7 downto 0)   <= data;
			  when "01" =>   data_sig(15 downto 8)  <= data;
			  when "10" =>   data_sig(23 downto 16) <= data;
			  when "11" =>   data_sig2              <= data_sig;
			  
			  when others => data_sig <= "000000000000000000000000";
			end case;
			
		end if;
			
	end process;
	clk_ce <= '0' when control="00" or control="01" or control="10" else
				 '1' when control="11";
	S_paridad <= ((data_sig(7) xor data_sig(6))xor(data_sig(5) xor data_sig(4))xor(data_sig(3) xor data_sig(2))xor(data_sig(1) xor data_sig(0)))		     when control ="00" else
					 ((data_sig(15) xor data_sig(14))xor(data_sig(13) xor data_sig(12))xor(data_sig(11) xor data_sig(10))xor(data_sig(9) xor data_sig(8)))   when control ="01" else		
					 ((data_sig(23) xor data_sig(22))xor(data_sig(21) xor data_sig(20))xor(data_sig(19) xor data_sig(18))xor(data_sig(17) xor data_sig(16))) when control ="10" ;
	
	--1 impar
	--led(2)<= (data_sig(7) xor data_sig(6))xor(data_sig(5) xor data_sig(4))xor(data_sig(3) xor data_sig(2))xor(data_sig(1) xor data_sig(0));
	--led(1)<= (data_sig(15) xor data_sig(14))xor(data_sig(13) xor data_sig(12))xor(data_sig(11) xor data_sig(10))xor(data_sig(9) xor data_sig(8));
	--led(0)<= (data_sig(23) xor data_sig(22))xor(data_sig(21) xor data_sig(20))xor(data_sig(19) xor data_sig(18))xor(data_sig(17) xor data_sig(16));
	led(2)<='0';
	led(1)<='0';
	led(0)<='1' when data_sig2(23 downto 16) = "11000000"else
	'0';
	data_o <= data_sig2;
	
end STRUCTURAL;

