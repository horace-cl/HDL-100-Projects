library ieee;
use ieee.std_logic_1164.all;

entity traffic_top is
generic(
    periods_to_1sec : integer := 100000000
);
port(
    clk : in std_logic;
    rst : in std_logic;
    lights: out std_logic_vector(5 downto 0)
);
end entity traffic_top;



architecture Behavioral of traffic_top is
    signal clk_1s : std_logic := '0';
begin
    
    traffic : entity work.traffic_lights
    port map(
        clk => clk,
        rst => rst,
        lights => lights

    );

    clock1_s : entity work.clock_divider
    port map(
        n_periods => periods_to_1sec,
        clock_in  => clk,
        clock_out => clk_1s
    );

end architecture Behavioral;