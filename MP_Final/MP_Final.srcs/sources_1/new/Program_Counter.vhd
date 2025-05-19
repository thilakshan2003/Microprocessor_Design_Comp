library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Program_Counter is
    Port (
        CLK        : in  std_logic;
        RESET      : in  std_logic;
        Next_Address    : in  std_logic_vector(2 downto 0);
        Memory_Select : out std_logic_vector(2 downto 0)
    );
end Program_Counter;

architecture Behavioral of Program_Counter is
    signal reg : std_logic_vector(2 downto 0) := "000";
begin
    process(CLK, RESET)
    begin
        if RESET = '1' then
            reg <= "000";
        elsif rising_edge(CLK) then
            reg <= Next_Address;
        end if;
    end process;

    Memory_Select <= reg;

end Behavioral;
