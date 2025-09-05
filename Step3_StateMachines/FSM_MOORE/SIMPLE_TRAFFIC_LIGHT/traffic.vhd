library ieee;
use ieee.std_logic_1164.all;

entity traffic_lights is
    generic (
        delay_short : integer := 5;
        delay_long  : integer := 15
    );
    port (
        clk    : in STD_LOGIC;
        rst    : in STD_LOGIC;
        lights : out STD_LOGIC_VECTOR(5 downto  0)
    );
end entity traffic_lights;

architecture Behavioral of traffic_lights is
    type state_type is (s0, s1, s2, s3, s4, s5);
    signal state  : state_type := s1;
    signal counter: integer    := 0 ; 
begin




    traffic_fsm : process(clk, rst)
    begin
        if rst = '1' then
            state   <= s0;
            counter <= 0;
        --elsif rising_edge(clk) then
        else
            case state is
                when s0 =>
                    if counter < delay_long then
                        counter <= counter + 1 ;
                        state <= s0;
                    else
                        counter <= 0 ;
                        state <= s1;
                    end if;
                when s1 =>
                    if counter < delay_short then
                        counter <= counter + 1 ;
                        state <= s1;
                    else
                        counter <= 0 ;
                        state <= s2;
                    end if;
                when s2 =>
                    if counter < delay_short then
                        counter <= counter + 1 ;
                        state <= s2;
                    else
                        counter <= 0 ;
                        state <= s3;
                    end if;                
                when s3 =>
                    if counter < delay_long then
                        counter <= counter + 1 ;
                        state <= s3;
                    else
                        counter <= 0 ;
                        state <= s4;
                    end if;        
                when s4 =>
                    if counter < delay_short then
                        counter <= counter + 1 ;
                        state <= s4;
                    else
                        counter <= 0 ;
                        state <= s5;
                    end if;        
                when s5 =>
                    if counter < delay_short then
                        counter <= counter + 1 ;
                        state <= s5;
                    else
                        counter <= 0 ;
                        state <= s0;
                    end if;

                when others =>
                    state <= s0;  -- Added others case for completeness
                    counter <= 0;
            end case;
        end if;
    end process traffic_fsm;

    lights_process: process(state)
    begin
        case state is
            when s0 => lights <= "100001";
            when s1 => lights <= "010001";
            when s2 => lights <= "001001";
            when s3 => lights <= "001100";
            when s4 => lights <= "001010";
            when s5 => lights <= "001001";
            when others => lights <= "000000"; -- Default case
        end case;
    end process;

    -- _1sclk: entity work.clock_divider
    -- map port(
    --     n_periods => 5; -- For testing purposes we will generate a 200 ms clock
    --     clock_in  => clk;
    --     clock_out => clk_1s
    -- );

end architecture Behavioral;