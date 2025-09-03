library ieee;
use ieee.std_logic_1164.all;

entity simple_clock_divider is
    generic ( num_clocks : integer  := 100000000 );
    port(
        input_clock : in  STD_LOGIC;
        ouput_clock : out STD_LOGIC
    );
end entity simple_clock_divider;

architecture Behavioral of simple_clock_divider is
    signal counter       : integer   :=  0;
    signal r_output_clock: STD_LOGIC := '0';
begin

    ouput_clock <= r_output_clock;

    process(input_clock)
    begin
        if rising_edge(input_clock) then
            if counter = num_clocks-1 then
                counter <= 0;
                r_output_clock <= not(r_output_clock);
            else 
                counter <= counter + 1;
            end if;            
        end if;
    end process;


end architecture Behavioral;
