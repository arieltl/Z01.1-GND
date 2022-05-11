--
-- Elementos de Sistemas - Aula 5 - Logica Combinacional
-- Rafael . Corsi @ insper . edu . br 
--
-- Arquivo exemplo para acionar os LEDs e ler os bottoes
-- da placa DE0-CV utilizada no curso de elementos de 
-- sistemas do 3s da eng. da computacao

----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
	port(
		clock     : in  STD_LOGIC;
		SW      : in  std_logic_vector(9 downto 0);
		KEY     : in  std_logic_vector(3 downto 0);
		LEDR    : out std_logic_vector(9 downto 0);
		HEX0 :  out std_logic_vector(6 downto 0);
		HEX2 :  out std_logic_vector(6 downto 0)

	);
end entity;

----------------------------
-- Implementacao do bloco -- 
----------------------------
architecture rtl of TopLevel is


component PC is
    port(
        clock     : in  STD_LOGIC;
        increment : in  STD_LOGIC;
        load      : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);
        output    : out STD_LOGIC_VECTOR(15 downto 0)
    );
end component;

component Ram8 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 2 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end component;

component sevenSeg is
	port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds: out STD_LOGIC_VECTOR(6 downto 0));
end component;

--------------
-- signals
--------------

signal num,pcOut,ramOut: STD_LOGIC_VECTOR(15 downto 0);
signal incrementPc,loadPc,resetPc, loadRam: STD_LOGIC := '0';
signal num1 : std_logic_vector(15 downto 0);
signal num2 : std_logic_vector(3 downto 0);

--------------
-- implementacao
---------------
begin
	num1 <= "000000000000"&SW(3 downto 0);
	num2 <= '0'&pcOut(2 downto 0);
	PC0: PC port map (KEY(3),incrementPc,loadPc,resetPc,num1,pcOut);
	RAM0: Ram8 port map(KEY(3),num1,loadRam,pcOut(2 downto 0),ramOut);
	SV0: sevenSeg port map (ramOut(3 downto 0),HEX0);
	SV1: sevenSeg port map (num2,HEX2);
	
	loadPc <= SW(8) when sw(9) = '0' else '0';
	incrementPc <= SW(7) when sw(9) = '0' else '0';
	resetPc <= SW(6) when sw(9) = '0' else '0';

	loadRam <= SW(8) when sw(9) = '1' else '0';



end rtl;
