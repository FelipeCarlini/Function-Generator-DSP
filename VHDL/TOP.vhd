library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TOP is

Port(
	clk			: in  std_logic;
	uart_en  	: in  std_logic;
	uart_rx  	: in  std_logic;
	uart_ctrl	: in  std_logic_vector(1 downto 0);
	salidas_dac : out std_logic_vector(10 downto 0);
	led			: out std_logic_vector(2 downto 0);
	s_paridad  	: out  std_logic
);

end TOP;

architecture STRUCTURAL of TOP is
	
	signal data_uart: std_logic_vector(23 downto 0);
	signal clk_4Mhz, clk_50Mhz: std_logic;
	signal clk_ce: std_logic;
	
	COMPONENT TOP_UART
	PORT(
		enable : IN std_logic;
		RXD : IN std_logic;
		clk : IN std_logic;
		control : IN std_logic_vector(1 downto 0);          
		data_o : OUT std_logic_vector(23 downto 0);
		S_paridad : OUT std_logic;
		led : OUT std_logic_vector(2 downto 0);
		clk_ce : OUT std_logic
		);
	END COMPONENT;

	
	COMPONENT TOP_dac
	PORT(
		clk : IN std_logic;
		data_uart : IN std_logic_vector(23 downto 0);
		clk_ce : IN std_logic;          
		salidas : OUT std_logic_vector(10 downto 0)
		);
	END COMPONENT;
	
	component Clk_wiz
	port
	 (
	  CLK_IN1           : in     std_logic;
	  CLK_OUT1          : out    std_logic;
	  CLK_OUT2          : out    std_logic
	 );
	end component;
	
	
begin

	Inst_TOP_UART: TOP_UART PORT MAP(
		enable =>uart_en,
		RXD =>uart_rx,
		clk =>clk_50Mhz,
		control =>uart_ctrl,
		data_o =>data_uart ,
		S_paridad => S_paridad,
		led =>led,
		clk_ce => clk_ce
	);
		
	Inst_TOP_dac: TOP_dac PORT MAP(
		clk 	    => clk_4Mhz,
		data_uart => data_uart,
		salidas   => salidas_dac,
		clk_ce	 => clk_ce
	);
	
  Inst_Clz_wiz : Clk_wiz
  port map
   (-- Clock in ports
    CLK_IN1 => clk,
    -- Clock out ports
    CLK_OUT1 => clk_4Mhz,
    CLK_OUT2 => clk_50Mhz);

end STRUCTURAL;

