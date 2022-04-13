-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: PC.vhd
-- date: 4/4/2017

-- Contador de 16bits
-- if (reset[t] == 1) out[t+1] = 0
-- else if (load[t] == 1)  out[t+1] = in[t]
-- else if (inc[t] == 1) out[t+1] = out[t] + 1
-- else out[t+1] = out[t]

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity PC is
    port(
        clock     : in  STD_LOGIC;
        increment : in  STD_LOGIC;
        load      : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);
        output    : out STD_LOGIC_VECTOR(15 downto 0)
    );
end entity;

architecture arch of PC is

 signal muxOut : std_logic_vector(15 downto 0);

  component Inc16 is
      port(
          a   :  in STD_LOGIC_VECTOR(15 downto 0);
          q   : out STD_LOGIC_VECTOR(15 downto 0)
          );
  end component;

  component Register16 is
      port(
          clock:   in STD_LOGIC;
          input:   in STD_LOGIC_VECTOR(15 downto 0);
          load:    in STD_LOGIC;
          output: out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;
    signal regIn, regOut,IncOut: STD_LOGIC_VECTOR(15 downto 0);
    signal regLoad: STD_LOGIC;

begin
    reg: Register16
    port map(clock,regIn,load,regOut);
    inc: Inc16
    port map(regOut,IncOut);
    output <= regOut;

    process (clock) begin
        if (rising_edge(clock)) then

            if (reset) then
                regIn <= "0000000000000000";
                regLoad <= '1';
            elsif (load) then
                regIn <= input;
                regLoad <= '1';
            elsif (increment) then
                regIn <= IncOut;
                regLoad <='1';
            elsif ('1') then
                regLoad <= '0';
            end if;
        end if;
    end process;


    

end architecture;
