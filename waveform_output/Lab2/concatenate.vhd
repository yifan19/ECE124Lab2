library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity concatenate is port (
   
   hexA	   :  in  std_logic_vector(3 downto 0);   --input 1
   
	hexB		:  in std_logic_vector(3 downto 0); --input 2

	output	:	out std_logic_vector(7 downto 0) --concatenate result

	
); 
end concatenate;

architecture Behavioral of concatenate is

--
begin
   
	output <= hexA & hexB; --function for concatenation
	
	
end architecture Behavioral; 
----------------------------------------------------------------------
