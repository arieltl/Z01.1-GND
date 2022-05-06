library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity impressora is
	port (
    SW1,SW2,SW3,SW4 : in  STD_LOGIC;
    x : out STD_LOGIC );
end entity;

architecture arch of impressora is

begin

    x <= (not(SW1 or SW2) or not(SW1 or SW3) or not(SW3 or SW4) or not(SW2 or SW3) or not(SW2 or SW4));

end architecture;
