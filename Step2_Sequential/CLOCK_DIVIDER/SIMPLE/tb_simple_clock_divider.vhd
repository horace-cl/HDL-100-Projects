library ieee;
use ieee.std_logic_1164.all;
library work;
use work.all;

entity tb_simple_clock_divider is
end entity tb_simple_clock_divider;

architecture Behavioral of tb_simple_clock_divider is
    constant clk_100MHz  : time      := 10 ns;
    signal i_input_clock : STD_LOGIC := '0';
    signal MHz10_output_clock : STD_LOGIC := '0';
    signal kHz1_output_clock  : STD_LOGIC := '0';
begin

    UUT: entity work.simple_clock_divider 
    generic map ( num_clocks => 10 )
    port map(
        input_clock => i_input_clock,
        ouput_clock => MHz10_output_clock
    );

    UUT2: entity work.simple_clock_divider 
    generic map ( num_clocks => 10 )
    port map(
        input_clock => MHz10_output_clock,
        ouput_clock => kHz1_output_clock
    );

    genClock : process 
    begin
        wait for clk_100MHz/2;
        i_input_clock <= not i_input_clock;
    end process;




end architecture Behavioral;