library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity tb_and_gate is
end entity tb_and_gate;

architecture Behavioral of tb_and_gate is
    signal input_a  : STD_LOGIC := '0';
    signal input_b  : STD_LOGIC := '0';
    signal output_c : STD_LOGIC := '0';
begin

    UUT: entity work.and_gate
    port map(
        input_a  => input_a,
        input_b  => input_b,
        output_c => output_c
    );


    stimulus : process
    begin
        input_a <= '1';
        input_b <= '1';
        wait for 100 ns;

        input_a <= '1';
        input_b <= '0';
        wait for 100 ns;

        input_a <= '0';
        input_b <= '1';
        wait for 100 ns;

        input_a <= '0';
        input_b <= '0';
        wait for 100 ns;
    end process;
end architecture Behavioral; 