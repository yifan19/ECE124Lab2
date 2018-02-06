library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Logic_Processor is port (
   
   hexA	   :  in  std_logic_vector(3 downto 0);   --input 1
   
	hexB		:  in std_logic_vector(3 downto 0); --input 2
	
	pressButton : in std_logic_vector ( 2 downto 0); --buttons for operator selection

	output	:	out std_logic_vector(7 downto 0) --output of the operation

	
); 
end Logic_Processor;

architecture Behavioral of Logic_Processor is

signal operator : std_logic_vector(2 downto 0);
	

begin

operator <= not pressButton(2) & not pressButton(1) & not pressButton(0);
	
	
	with operator select
	output<= "0000" & (hexA and hexB) when "001", --define the operator depending on button inputs
				"0000" & (hexA or hexB) when "010",
				"0000" & (hexA xor hexB) when "100",
				"00000000" when others;

	
	
end architecture Behavioral; 
----------------------------------------------------------------------
