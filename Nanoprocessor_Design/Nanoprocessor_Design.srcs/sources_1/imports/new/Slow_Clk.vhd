library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- This is required for arithmetic on STD_LOGIC_VECTOR

entity Slow_Clk is
    Port ( Clk_IN : in STD_LOGIC;
           Clk_OUT : out STD_LOGIC);
end Slow_Clk;

architecture Behavioral of Slow_Clk is
    signal Count : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
begin
    process (Clk_IN) begin
        if rising_edge(Clk_IN) then
            Count <= std_logic_vector(unsigned(Count) + 1); 
        end if;
    end process;

    Clk_OUT <= Count(23);  -- Output the 24th bit as the slow clock

end Behavioral;
