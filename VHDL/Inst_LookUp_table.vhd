LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL; 

entity LookUp_table is

	port(
		clk_in:in std_logic;
		clk_4Mhz:in std_logic;
		ce		:in std_logic;
		data_in: in std_logic_vector(15 downto 0);
		salidas_out:out std_logic_vector (10 downto 0);
		clk_ce		:in std_logic
		);

end LookUp_table;

architecture Behavioral of LookUp_table is

	signal cont :integer range 0 to 1023:=0;
	signal salidas_out_sig:std_logic_vector (7 downto 0);
	signal cont_clk :std_logic;
	signal vector_array0,vector_array1,vector_array2,vector_array3,vector_array4,vector_array5,vector_array6,vector_array7,vector_array8,vector_array9,vector_array10,vector_array11,vector_array12,vector_array13,vector_array14,vector_array15,vector_array16,vector_array17,vector_array18,vector_array19,vector_array20,vector_array21,vector_array22,vector_array23,vector_array24,vector_array25,vector_array26,vector_array27,vector_array28,vector_array29,vector_array30,vector_array31: std_logic_vector(7 downto 0);
	signal vector_array32,vector_array33,vector_array34,vector_array35,vector_array36,vector_array37,vector_array38,vector_array39,vector_array40,vector_array41,vector_array42,vector_array43,vector_array44,vector_array45,vector_array46,vector_array47,vector_array48,vector_array49,vector_array50,vector_array51,vector_array52,vector_array53,vector_array54,vector_array55,vector_array56,vector_array57,vector_array58,vector_array59,vector_array60,vector_array61,vector_array62,vector_array63: std_logic_vector(7 downto 0);
	signal vector_array64,vector_array65,vector_array66,vector_array67,vector_array68,vector_array69,vector_array70,vector_array71,vector_array72,vector_array73,vector_array74,vector_array75,vector_array76,vector_array77,vector_array78,vector_array79,vector_array80,vector_array81,vector_array82,vector_array83,vector_array84,vector_array85,vector_array86,vector_array87,vector_array88,vector_array89,vector_array90,vector_array91,vector_array92,vector_array93,vector_array94,vector_array95: std_logic_vector(7 downto 0);
	signal vector_array96,vector_array97,vector_array98,vector_array99,vector_array100,vector_array101,vector_array102,vector_array103,vector_array104,vector_array105,vector_array106,vector_array107,vector_array108,vector_array109,vector_array110,vector_array111,vector_array112,vector_array113,vector_array114,vector_array115,vector_array116,vector_array117,vector_array118,vector_array119,vector_array120,vector_array121,vector_array122,vector_array123,vector_array124,vector_array125,vector_array126,vector_array127: std_logic_vector(7 downto 0);
	--type vector_array_type is array (0 to 15) of std_logic_vector(7 downto 0);
	--signal vector_array : vector_array_type;
	signal salidas_vector:std_logic_vector(7 downto 0);
	--signal data_15_8:integer range 0 to 15:=0;
begin

process(clk_in,cont)
begin
	if(clk_in'event and clk_in='1')then
		if(cont=127)then
			cont<=0;
			cont_clk<=not cont_clk;
		else
			cont<=cont+1;
			cont_clk<=not cont_clk;
		end if;
	end if;
end process;
salidas_out<=  not(salidas_out_sig)& "00"& clk_in;
--salidas_out<=std_logic_vector(to_unsigned(cont*8,10))& clk_in ;


salidas_out_sig<=vector_array0  when cont=0   else
				 vector_array1  when cont=1   else
			 	 vector_array2  when cont=2   else
		 		 vector_array3  when cont=3   else
				 vector_array4  when cont=4   else
				 vector_array5  when cont=5   else
				 vector_array6  when cont=6   else
				 vector_array7  when cont=7   else
				 vector_array8  when cont=8   else
				 vector_array9  when cont=9   else
				 vector_array10 when cont=10  else
				 vector_array11 when cont=11  else
				 vector_array12 when cont=12  else
				 vector_array13 when cont=13  else
				 vector_array14 when cont=14  else
				 vector_array15 when cont=15  else
				 vector_array16 when cont=16   else
				 vector_array17 when cont=17   else
			 	 vector_array18 when cont=18   else
		 		 vector_array19 when cont=19   else
				 vector_array20 when cont=20   else
				 vector_array21 when cont=21   else
				 vector_array22 when cont=22   else
				 vector_array23 when cont=23   else
				 vector_array24 when cont=24   else
				 vector_array25 when cont=25   else
				 vector_array26 when cont=26  else
				 vector_array27 when cont=27  else
				 vector_array28 when cont=29  else
				 vector_array29 when cont=29  else
				 vector_array30 when cont=30  else
				 vector_array31 when cont=31  else
				 vector_array32 when cont=32  else
				 vector_array33 when cont=33  else
			 	 vector_array34 when cont=34  else
		 		 vector_array35 when cont=35  else
				 vector_array36 when cont=36  else
				 vector_array37 when cont=37  else
				 vector_array38 when cont=38  else
				 vector_array39 when cont=39  else
				 vector_array40 when cont=40  else
				 vector_array41 when cont=41  else
				 vector_array42 when cont=42  else
				 vector_array43 when cont=43  else
				 vector_array44 when cont=44  else
				 vector_array45 when cont=45  else
				 vector_array46 when cont=46  else
				 vector_array47 when cont=47  else
				 vector_array48 when cont=48  else
				 vector_array49 when cont=49  else
			 	 vector_array50 when cont=50  else
		 		 vector_array51 when cont=51  else
				 vector_array52 when cont=52  else
				 vector_array53 when cont=53  else
				 vector_array54 when cont=54  else
				 vector_array55 when cont=55  else
				 vector_array56 when cont=56  else
				 vector_array57 when cont=57  else
				 vector_array58 when cont=58  else
				 vector_array59 when cont=59  else
				 vector_array60 when cont=60  else
				 vector_array61 when cont=61  else
				 vector_array62 when cont=62  else
				 vector_array63 when cont=63  else
				 vector_array64 when cont=64  else
				 vector_array65 when cont=65  else
			 	 vector_array66 when cont=66  else
		 		 vector_array67 when cont=67  else
				 vector_array68 when cont=68  else
				 vector_array69 when cont=69  else
				 vector_array70 when cont=70  else
				 vector_array71 when cont=71  else
				 vector_array72 when cont=72  else
				 vector_array73 when cont=73  else
				 vector_array74 when cont=74  else
				 vector_array75 when cont=75  else
				 vector_array76 when cont=76  else
				 vector_array77 when cont=77  else
				 vector_array78 when cont=78  else
				 vector_array79 when cont=79  else
				 vector_array80 when cont=80  else
				 vector_array81 when cont=81  else
			 	 vector_array82 when cont=82  else
		 		 vector_array83 when cont=83  else
				 vector_array84 when cont=84  else
				 vector_array85 when cont=85  else
				 vector_array86 when cont=86  else
				 vector_array87 when cont=87  else
				 vector_array88 when cont=88  else
				 vector_array89 when cont=89  else
				 vector_array90 when cont=90  else
				 vector_array91 when cont=91  else
				 vector_array92 when cont=92  else
				 vector_array93 when cont=93  else
				 vector_array94 when cont=94  else
				 vector_array95 when cont=95  else
				 vector_array96 when cont=96  else
				 vector_array97 when cont=97  else
			 	 vector_array98 when cont=98  else
		 		 vector_array99 when cont=99  else
				 vector_array100 when cont=100  else
				 vector_array101 when cont=101  else
				 vector_array102 when cont=102  else
				 vector_array103 when cont=103  else
				 vector_array104 when cont=104  else
				 vector_array105 when cont=105  else
				 vector_array106 when cont=106  else
				 vector_array107 when cont=107  else
				 vector_array108 when cont=108  else
				 vector_array109 when cont=109  else
				 vector_array110 when cont=110  else
				 vector_array111 when cont=111  else
				 vector_array112 when cont=112  else
				 vector_array113 when cont=113  else
			 	 vector_array114 when cont=114  else
		 		 vector_array115 when cont=115  else
				 vector_array116 when cont=116  else
				 vector_array117 when cont=117  else
				 vector_array118 when cont=118  else
				 vector_array119 when cont=119  else
				 vector_array120 when cont=120  else
				 vector_array121 when cont=121  else
				 vector_array122 when cont=122  else
				 vector_array123 when cont=123  else
				 vector_array124 when cont=124  else
				 vector_array125 when cont=125  else
				 vector_array126 when cont=126  else
				 vector_array127 when cont=127  ;
		
				 
				 --salidas_out<= vector_array(cont);

vector_array0 <=data_in(7 downto 0)when data_in(15 downto 8)="00000000" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array1 <=data_in(7 downto 0)when data_in(15 downto 8)="00000001" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array2 <=data_in(7 downto 0)when data_in(15 downto 8)="00000010" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array3 <=data_in(7 downto 0)when data_in(15 downto 8)="00000011" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array4 <=data_in(7 downto 0)when data_in(15 downto 8)="00000100" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array5 <=data_in(7 downto 0)when data_in(15 downto 8)="00000101" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array6 <=data_in(7 downto 0)when data_in(15 downto 8)="00000110" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array7 <=data_in(7 downto 0)when data_in(15 downto 8)="00000111" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array8 <=data_in(7 downto 0)when data_in(15 downto 8)="00001000" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array9 <=data_in(7 downto 0)when data_in(15 downto 8)="00001001" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array10<=data_in(7 downto 0)when data_in(15 downto 8)="00001010" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array11<=data_in(7 downto 0)when data_in(15 downto 8)="00001011" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array12<=data_in(7 downto 0)when data_in(15 downto 8)="00001100" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array13<=data_in(7 downto 0)when data_in(15 downto 8)="00001101" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array14<=data_in(7 downto 0)when data_in(15 downto 8)="00001110" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array15<=data_in(7 downto 0)when data_in(15 downto 8)="00001111" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';

vector_array16 <=data_in(7 downto 0)when data_in(15 downto 8)="00010000" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array17 <=data_in(7 downto 0)when data_in(15 downto 8)="00010001" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array18 <=data_in(7 downto 0)when data_in(15 downto 8)="00010010" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array19 <=data_in(7 downto 0)when data_in(15 downto 8)="00010011" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array20 <=data_in(7 downto 0)when data_in(15 downto 8)="00010100" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array21 <=data_in(7 downto 0)when data_in(15 downto 8)="00010101" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array22 <=data_in(7 downto 0)when data_in(15 downto 8)="00010110" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array23 <=data_in(7 downto 0)when data_in(15 downto 8)="00010111" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array24 <=data_in(7 downto 0)when data_in(15 downto 8)="00011000" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array25 <=data_in(7 downto 0)when data_in(15 downto 8)="00011001" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array26 <=data_in(7 downto 0)when data_in(15 downto 8)="00011010" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array27 <=data_in(7 downto 0)when data_in(15 downto 8)="00011011" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array28 <=data_in(7 downto 0)when data_in(15 downto 8)="00011100" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array29 <=data_in(7 downto 0)when data_in(15 downto 8)="00011101" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array30 <=data_in(7 downto 0)when data_in(15 downto 8)="00011110" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array31 <=data_in(7 downto 0)when data_in(15 downto 8)="00011111" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';

vector_array32 <=data_in(7 downto 0)when data_in(15 downto 8)="00100000" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array33 <=data_in(7 downto 0)when data_in(15 downto 8)="00100001" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array34 <=data_in(7 downto 0)when data_in(15 downto 8)="00100010" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array35 <=data_in(7 downto 0)when data_in(15 downto 8)="00100011" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array36 <=data_in(7 downto 0)when data_in(15 downto 8)="00100100" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array37 <=data_in(7 downto 0)when data_in(15 downto 8)="00100101" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array38 <=data_in(7 downto 0)when data_in(15 downto 8)="00100110" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array39 <=data_in(7 downto 0)when data_in(15 downto 8)="00100111" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array40 <=data_in(7 downto 0)when data_in(15 downto 8)="00101000" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array41 <=data_in(7 downto 0)when data_in(15 downto 8)="00101001" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array42 <=data_in(7 downto 0)when data_in(15 downto 8)="00101010" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array43 <=data_in(7 downto 0)when data_in(15 downto 8)="00101011" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array44 <=data_in(7 downto 0)when data_in(15 downto 8)="00101100" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array45 <=data_in(7 downto 0)when data_in(15 downto 8)="00101101" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array46 <=data_in(7 downto 0)when data_in(15 downto 8)="00101110" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array47 <=data_in(7 downto 0)when data_in(15 downto 8)="00101111" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';

vector_array48 <=data_in(7 downto 0)when data_in(15 downto 8)="00110000" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array49 <=data_in(7 downto 0)when data_in(15 downto 8)="00110001" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array50 <=data_in(7 downto 0)when data_in(15 downto 8)="00110010" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array51 <=data_in(7 downto 0)when data_in(15 downto 8)="00110011" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array52 <=data_in(7 downto 0)when data_in(15 downto 8)="00110100" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array53 <=data_in(7 downto 0)when data_in(15 downto 8)="00110101" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array54 <=data_in(7 downto 0)when data_in(15 downto 8)="00110110" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array55 <=data_in(7 downto 0)when data_in(15 downto 8)="00110111" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array56 <=data_in(7 downto 0)when data_in(15 downto 8)="00111000" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array57 <=data_in(7 downto 0)when data_in(15 downto 8)="00111001" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array58 <=data_in(7 downto 0)when data_in(15 downto 8)="00111010" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array59 <=data_in(7 downto 0)when data_in(15 downto 8)="00111011" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array60 <=data_in(7 downto 0)when data_in(15 downto 8)="00111100" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array61 <=data_in(7 downto 0)when data_in(15 downto 8)="00111101" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array62 <=data_in(7 downto 0)when data_in(15 downto 8)="00111110" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array63 <=data_in(7 downto 0)when data_in(15 downto 8)="00111111" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';


vector_array64 <=data_in(7 downto 0)when data_in(15 downto 8)="01000000" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array65 <=data_in(7 downto 0)when data_in(15 downto 8)="01000001" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array66 <=data_in(7 downto 0)when data_in(15 downto 8)="01000010" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array67 <=data_in(7 downto 0)when data_in(15 downto 8)="01000011" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array68 <=data_in(7 downto 0)when data_in(15 downto 8)="01000100" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array69 <=data_in(7 downto 0)when data_in(15 downto 8)="01000101" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array70 <=data_in(7 downto 0)when data_in(15 downto 8)="01000110" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array71 <=data_in(7 downto 0)when data_in(15 downto 8)="01000111" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array72 <=data_in(7 downto 0)when data_in(15 downto 8)="01001000" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array73 <=data_in(7 downto 0)when data_in(15 downto 8)="01001001" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array74 <=data_in(7 downto 0)when data_in(15 downto 8)="01001010" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array75 <=data_in(7 downto 0)when data_in(15 downto 8)="01001011" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array76 <=data_in(7 downto 0)when data_in(15 downto 8)="01001100" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array77 <=data_in(7 downto 0)when data_in(15 downto 8)="01001101" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array78 <=data_in(7 downto 0)when data_in(15 downto 8)="01001110" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array79 <=data_in(7 downto 0)when data_in(15 downto 8)="01001111" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';

vector_array80 <=data_in(7 downto 0)when data_in(15 downto 8)="01010000" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array81 <=data_in(7 downto 0)when data_in(15 downto 8)="01010001" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array82 <=data_in(7 downto 0)when data_in(15 downto 8)="01010010" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array83 <=data_in(7 downto 0)when data_in(15 downto 8)="01010011" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array84 <=data_in(7 downto 0)when data_in(15 downto 8)="01010100" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array85 <=data_in(7 downto 0)when data_in(15 downto 8)="01010101" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array86 <=data_in(7 downto 0)when data_in(15 downto 8)="01010110" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array87 <=data_in(7 downto 0)when data_in(15 downto 8)="01010111" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array88 <=data_in(7 downto 0)when data_in(15 downto 8)="01011000" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array89 <=data_in(7 downto 0)when data_in(15 downto 8)="01011001" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array90 <=data_in(7 downto 0)when data_in(15 downto 8)="01011010" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array91 <=data_in(7 downto 0)when data_in(15 downto 8)="01011011" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array92 <=data_in(7 downto 0)when data_in(15 downto 8)="01011100" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array93 <=data_in(7 downto 0)when data_in(15 downto 8)="01011101" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array94 <=data_in(7 downto 0)when data_in(15 downto 8)="01011110" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array95 <=data_in(7 downto 0)when data_in(15 downto 8)="01011111" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';

vector_array96  <=data_in(7 downto 0)when data_in(15 downto 8)="01100000" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array97  <=data_in(7 downto 0)when data_in(15 downto 8)="01100001" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array98  <=data_in(7 downto 0)when data_in(15 downto 8)="01100010" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array99  <=data_in(7 downto 0)when data_in(15 downto 8)="01100011" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array100 <=data_in(7 downto 0)when data_in(15 downto 8)="01100100" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array101 <=data_in(7 downto 0)when data_in(15 downto 8)="01100101" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array102 <=data_in(7 downto 0)when data_in(15 downto 8)="01100110" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array103 <=data_in(7 downto 0)when data_in(15 downto 8)="01100111" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array104 <=data_in(7 downto 0)when data_in(15 downto 8)="01101000" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array105 <=data_in(7 downto 0)when data_in(15 downto 8)="01101001" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array106 <=data_in(7 downto 0)when data_in(15 downto 8)="01101010" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array107 <=data_in(7 downto 0)when data_in(15 downto 8)="01101011" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array108 <=data_in(7 downto 0)when data_in(15 downto 8)="01101100" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array109 <=data_in(7 downto 0)when data_in(15 downto 8)="01101101" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array110 <=data_in(7 downto 0)when data_in(15 downto 8)="01101110" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array111 <=data_in(7 downto 0)when data_in(15 downto 8)="01101111" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';

vector_array112 <=data_in(7 downto 0)when data_in(15 downto 8)="01110000" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array113 <=data_in(7 downto 0)when data_in(15 downto 8)="01110001" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array114 <=data_in(7 downto 0)when data_in(15 downto 8)="01110010" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array115 <=data_in(7 downto 0)when data_in(15 downto 8)="01110011" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array116 <=data_in(7 downto 0)when data_in(15 downto 8)="01110100" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array117 <=data_in(7 downto 0)when data_in(15 downto 8)="01110101" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array118 <=data_in(7 downto 0)when data_in(15 downto 8)="01110110" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array119 <=data_in(7 downto 0)when data_in(15 downto 8)="01110111" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array120 <=data_in(7 downto 0)when data_in(15 downto 8)="01111000" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array121 <=data_in(7 downto 0)when data_in(15 downto 8)="01111001" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array122 <=data_in(7 downto 0)when data_in(15 downto 8)="01111010" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array123 <=data_in(7 downto 0)when data_in(15 downto 8)="01111011" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array124 <=data_in(7 downto 0)when data_in(15 downto 8)="01111100" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array125 <=data_in(7 downto 0)when data_in(15 downto 8)="01111101" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array126 <=data_in(7 downto 0)when data_in(15 downto 8)="01111110" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';
vector_array127 <=data_in(7 downto 0)when data_in(15 downto 8)="01111111" and ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';

--data_15_8<=to_integer(unsigned(data_in(15 downto 8)));
--vector_array(data_15_8)<= data_in(7 downto 0) when ce='1' and clk_ce'event and clk_ce='1' ;--and clk_4MHz'event and clk_4MHz='1';


end Behavioral;


