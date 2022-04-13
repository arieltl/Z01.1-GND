-- Elementos de Sistemas
-- CounterDown.vhd

library ieee;
use ieee.std_logic_1164.all;

entity CounterDown is
	port(
		clock:  in std_logic;
		q:      out std_logic_vector(2 downto 0) :=(others => '0')
	);
end entity;

architecture arch of CounterDown is

	signal saida0,saida1,saida2 : std_logic;

	component FlipFlopT is
		port(
			clock : in std_logic;
			t : in std_logic;
			q : out std_logic;
			notq : out std_logic
		);
	end component;

begin

	t0 : FlipFlopT port map(clock, '1', saida0);
	t1 : FlipFlopT port map(saida0, '1', saida1);
	t2 : FlipFlopT port map(saida1, '1', saida2);
	q(0) <= saida0;
	q(1) <= saida1;
	q(2) <= saida2; 

end architecture;
