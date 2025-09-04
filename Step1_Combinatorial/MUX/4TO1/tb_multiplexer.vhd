library ieee;
use ieee.std_logic_1164.all;
use work.all;
use std.env.all;


entity tb_multiplexer is
end entity tb_multiplexer;

architecture Behavioral of tb_multiplexer is
    signal input_0   : STD_LOGIC_VECTOR(1 downto 0) := "11";
    signal input_1   : STD_LOGIC_VECTOR(1 downto 0) := "10";
    signal input_2   : STD_LOGIC_VECTOR(1 downto 0) := "01";
    signal input_3   : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal select_in : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal output_0  : STD_LOGIC_VECTOR(1 downto 0) := "00";
begin

    UUT: entity work.multiplexer
    port map(
        input_0 => input_0,
        input_1 => input_1,
        input_2 => input_2,
        input_3 => input_3,
        output_0 => output_0,
        select_in => select_in
    );

    stimulii: process
    begin
        wait for 100 ns;
        select_in <= "00";

        wait for 100 ns;
        select_in <= "01";

        wait for 100 ns;
        select_in <= "10";

        wait for 100 ns;
        select_in <= "11";

        wait for 100 ns;
        select_in <= "00";

        wait for 100 ns;
        wait;
        --std.env.finish;

    end process;

    

end architecture Behavioral;