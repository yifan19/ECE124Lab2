library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity LogicalStep_Lab2_top is port (
   clkin_50			: in	std_logic;
	pb					: in	std_logic_vector(3 downto 0);
 	sw   				: in  std_logic_vector(7 downto 0); -- The switch inputs
   leds				: out std_logic_vector(7 downto 0); -- for displaying the switch content
   seg7_data 		: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  	: out	std_logic;				    		-- seg7 digit1 selector
	seg7_char2  	: out	std_logic				    		-- seg7 digit2 selector
	
); 
end LogicalStep_Lab2_top;

architecture SimpleCircuit of LogicalStep_Lab2_top is
--
-- Components Used ---
------------------------------------------------------------------- 
  component SevenSegment port (
   hex   		:  in  std_logic_vector(3 downto 0);   -- The 4 bit data to be displayed
   sevenseg 	:  out std_logic_vector(6 downto 0)    -- 7-bit outputs to a 7-segment
   ); 
   end component;
	
	component concatenate port (
		hexA	   :  in  std_logic_vector(3 downto 0);   
		hexB		:  in std_logic_vector(3 downto 0);
		output	:	out std_logic_vector(7 downto 0)
	);
	end component;
	
	component mux port (
		hex_in1, hex_in2	: in std_logic_vector(7 downto 0);
		mux_select : in std_logic;
		hex_out	:	out std_logic_vector(7 downto 0)
		);
	end component;

	component segment7_mux port (
		clk	: in  std_logic :='0';
		DIN2	: in std_logic_vector(6 downto 0);
		DIN1	: in std_logic_vector(6 downto 0);
		DOUT	: out std_logic_vector(6 downto 0);
		DIG2	: out std_logic;
		DIG1	: out std_logic
		);
	end component;
	
	component add port(
	   hexA	   :  in  std_logic_vector(3 downto 0);   
   	hexB		:  in std_logic_vector(3 downto 0);
		output	:	out std_logic_vector(7 downto 0)
		);
	end component;
	
	component  Logic_Processor is port (
   
   hexA	   :  in  std_logic_vector(3 downto 0);   
	hexB		:  in std_logic_vector(3 downto 0);
	pressButton : in std_logic_vector ( 2 downto 0);
	output	:	out std_logic_vector(7 downto 0)
	
	);
	end component;

		
-- Create any signals, or temporary variables to be used
--
--  std_logic_vector is a signal which can be used for logic operations such as OR, AND, NOT, XOR
--
	signal seg7_A		: std_logic_vector(6 downto 0); -- final output to seg7
	signal hex_A		: std_logic_vector(3 downto 0);
	
	signal seg7_B		: std_logic_vector(6 downto 0);
	signal hex_B		: std_logic_vector(3 downto 0);
	
	signal concatenationResult : std_logic_vector(7 downto 0);
	signal sumResult: std_logic_vector(7 downto 0);
	
	--signal operator	: std_logic_vector(3 downto 0);
	signal logical_result	:	std_logic_vector(3 downto 0);
	signal arithmetic_result	:	std_logic_vector(7 downto 0);
	
	
	signal revertPushButton : std_logic_vector(3 downto 0);
	
	signal logicOutput: std_logic_vector (7 downto 0);
	
-- Here the circuit begins

begin

	hex_A <= sw(3 downto 0);
	hex_B <= sw(7 downto 4);
	--operator <= pb(3 downto 0);
	 
	
	--logical_result <= 

	--seg7_data <= seg7_A;
	


	INST1: SevenSegment port map(arithmetic_Result(7 downto 4), seg7_A);
	INST2: SevenSegment port map(arithmetic_Result(3 downto 0), seg7_B);
	INST3: segment7_mux port map(clkin_50, seg7_B, seg7_A,  seg7_data, seg7_char2, seg7_char1);
	INST4: concatenate port map( hex_B, hex_A, concatenationResult); -- swapped because of flipped display
	INST5: add port map( hex_B, hex_A, sumResult);
	INST6: mux port map(concatenationResult, sumResult, not pb(3), arithmetic_Result);
	
	
	
	
	INST7: Logic_Processor port map(hex_A, hex_B, pb (2 downto 0), logicOutput); -- reverted at the lower level
	INST8: mux port map(sumResult, logicOutput, pb(3), leds);  
	
end SimpleCircuit;

