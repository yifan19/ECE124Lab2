library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity add is port (
   
   hexA	   :  in  std_logic_vector(3 downto 0);   --input 1
   
	hexB		:  in std_logic_vector(3 downto 0); --input 2

	output	:	out std_logic_vector(7 downto 0) --output for added result

	
); 
end add;

architecture Behavioral of add is


--
begin
   
	--trying to add hexA to hexB
	
	output(7 downto 0) <=std_logic_vector(unsigned("0000" & hexA) + unsigned("0000" & hexB)); --function to add both inputs(concatenated)
	

	
	
end architecture Behavioral; 
----------------------------------------------------------------------
