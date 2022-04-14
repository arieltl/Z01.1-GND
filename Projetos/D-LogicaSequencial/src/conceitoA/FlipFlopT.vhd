-- Elementos de Sistemas
-- FlipFlopT.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopT is
	port(
		clock:  in std_logic;
		t:      in std_logic;
		q:      out std_logic;
		notq:   out std_logic
	);
end entity;

architecture arch of FlipFlopT is

signal aux : std_logic:= '0';

begin
	q <= aux;
	notq <= not aux;
	process(clock,t) begin
		if (rising_edge(clock) and t = '1') then
			aux <= not aux;
		end if;
	end process;

end architecture;
