library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
port(
    input_a  : in  STD_LOGIC;
    input_b  : in  STD_LOGIC;
    output_c : out STD_LOGIC
);
end entity or_gate;


architecture Behavioral of or_gate is
begin
    output_c <= input_a or input_b;
end architecture Behavioral;