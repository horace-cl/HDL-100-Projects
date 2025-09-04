library ieee;
use ieee.std_logic_1164.all;

entity multiplexer is
port (
    input_0    : in  STD_LOGIC_VECTOR(1 downto 0);
    input_1    : in  STD_LOGIC_VECTOR(1 downto 0);
    input_2    : in  STD_LOGIC_VECTOR(1 downto 0);
    input_3    : in  STD_LOGIC_VECTOR(1 downto 0);
    output_0   : out STD_LOGIC_VECTOR(1 downto 0);
    select_in  : in  STD_LOGIC_VECTOR(1 downto 0)
);
end entity multiplexer;

architecture Behavioral of multiplexer is
begin
    output_0 <= input_0 when select_in = "00" else
                input_1 when select_in = "01" else
                input_2 when select_in = "10" else
                input_3 when select_in = "11";

end architecture Behavioral;