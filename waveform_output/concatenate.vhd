library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity concatenate is port (
   
   hexA	   :  in  std_logic_vector(3 downto 0);   
   
	hexB		:  in std_logic_vector(3 downto 0);

	output	:	out std_logic_vector(7 downto 0)

	
); 
end concatenate;

architecture Behavioral of concatenate is

--
begin
   
	output <= hexA & hexB;
	
	
end architecture Behavioral; 
----------------------------------------------------------------------
