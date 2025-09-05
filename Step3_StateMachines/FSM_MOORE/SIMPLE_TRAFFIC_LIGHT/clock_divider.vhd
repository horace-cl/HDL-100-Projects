library ieee;
use ieee.std_logic_1164.all;

entity clock_divider is
port(
    n_periods : in integer;
    clock_in  : in std_logic;
    clock_out : out std_logic
);
end entity clock_divider;

architecture Behavioral of clock_divider is
    signal r_clock_out : std_logic := '0';
    signal counter     : integer := 0;
begin

    clock_out <= r_clock_out;

    clk_div: process(clock_in)
    begin
        if rising_edge(clock_in) then
            if counter = n_periods-1 then
                counter <= 0;
                r_clock_out <= not r_clock_out;
            else
                counter <= counter +1;
            end if;
        end if;
    end process;

end architecture Behavioral;