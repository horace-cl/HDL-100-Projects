library ieee;
use ieee.std_logic_1164.all;
use work.all;

library std;
use std.env.all;

entity tb_or_gate is
end entity tb_or_gate;

architecture Behavioral of tb_or_gate is
    signal i_input_a  : STD_LOGIC := '0';
    signal i_input_b  : STD_LOGIC := '0';
    signal i_output_c : STD_LOGIC := '0';
begin

    UTT: entity work.or_gate
    port map (
        input_a  => i_input_a,
        input_b  => i_input_b,
        output_c => i_output_c
    );

    stimulus: process
    begin
        
        i_input_a <= '0';
        i_input_b <= '0';
        wait for 100 ns;
        
        i_input_a <= '1';
        i_input_b <= '0';
        wait for 100 ns;
        
        i_input_a <= '0';
        i_input_b <= '1';
        wait for 100 ns;
        
        i_input_a <= '1';
        i_input_b <= '1';
        wait for 200 ns;

        std.env.finish;
    end process stimulus;

end architecture Behavioral;