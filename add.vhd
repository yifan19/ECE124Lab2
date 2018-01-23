library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity add is port (
   
   hexA	   :  in  std_logic_vector(3 downto 0);   
   
	hexB		:  in std_logic_vector(3 downto 0);

	output	:	out std_logic_vector(7 downto 0)

	
); 
end add;

architecture Behavioral of add is


--
begin
   
	--trying to add hexA to hexB
	
	output <= ("0000" & hexA) + ("0000" & hexB);
	

	
	
end architecture Behavioral; 
----------------------------------------------------------------------
