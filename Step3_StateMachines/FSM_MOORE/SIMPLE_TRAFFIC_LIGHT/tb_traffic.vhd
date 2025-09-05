library ieee;
use ieee.std_logic_1164.all;
use std.env.all;

entity tb_traffic is
end entity tb_traffic;

architecture Behavioral of tb_traffic is
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal lights : std_logic_vector(5 downto 0) := "000000";
    constant period : time := 100 ms;
begin

    gen_clk: process
    begin
        wait for period/2;
        clk <= not clk;
    end process;


    UUT: entity work.traffic_top
    generic map(
      periods_to_1sec => 10  
    )
    port map(
        clk => clk,
        rst => rst,
        lights => lights
    );


    stimulii: process
    begin
        wait for 200000 ms;
        std.env.finish;
    end process;

end architecture Behavioral;