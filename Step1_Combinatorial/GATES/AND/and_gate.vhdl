library ieee;
use ieee.std_logic_1164.all;


entity and_gate is
Port (
    input_a  : in  STD_LOGIC;
    input_b  : in  STD_LOGIC;
    output_c : out STD_LOGIC
);
end entity and_gate;

architecture Behavioral of and_gate is
begin
    output_c <= input_a and input_b;
end architecture Behavioral;