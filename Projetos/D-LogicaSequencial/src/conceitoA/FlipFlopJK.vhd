-- Elementos de Sistemas
-- FlipFlopJK.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopJK is
	port(
		clock:  in std_logic;
		J:      in std_logic;
		K:      in std_logic;
		q:      out std_logic;
		notq:   buffer std_logic
	);
end entity;

architecture arch of FlipFlopJK is

	signal aux : std_logic:= '0';

begin

	q <= aux;
	notq <= not aux;

	process(clock,J,K) begin
		if (rising_edge(clock)) then
			if (J = '1' and K='0') then
				aux <= '1';
			elsif (J = '0' and K = '1') then
				aux <= '0';
			elsif (J = '1' and K = '1') then
				aux <= not aux;
			end if;
		end if;
	end process;
	
end architecture;
