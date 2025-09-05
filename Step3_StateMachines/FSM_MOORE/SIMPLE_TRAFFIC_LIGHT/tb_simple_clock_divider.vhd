library ieee;
use ieee.std_logic_1164.all;
--use work.all;
use std.env.all;

entity tb_clock_divider is
end entity;

architecture Behavioral of tb_clock_divider is
    signal  clock_in  : std_logic := '0';
    signal  clock_out : std_logic := '0';
    constant clk_time : time    := 100 ns;
    constant n_periods: integer := 5;
begin

    clk: process
    begin
        wait for clk_time/2;
        clock_in <= not clock_in;
    end process;

    UUT: entity work.clock_divider
    port map(
        n_periods => n_periods,
        clock_in  => clock_in,
        clock_out  => clock_out
    );

    stimulii: process
    begin
        wait for clk_time*100;
        std.env.finish;
    end process;


end architecture Behavioral;