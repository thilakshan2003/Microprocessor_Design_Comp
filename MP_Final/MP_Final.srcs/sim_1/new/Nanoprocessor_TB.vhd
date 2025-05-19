library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nanoprocessor_TB is
    -- port();
end Nanoprocessor_TB;

architecture Behavioral of Nanoprocessor_TB is

    component Nanoprocessor is
    Port(
        Clk : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Zero_flag : out STD_LOGIC;
        Overflow_flag : out STD_LOGIC;
        data : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- internal signals for the ports
    signal ClkIn : std_logic := '0';
    signal ResetIn : std_logic := '0';
    signal Overflow: std_logic;
    signal Zero: std_logic;
    signal data: std_logic_vector(3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT : Nanoprocessor port map (
        Clk => ClkIn,
        Reset => ResetIn,
        Overflow_flag => Overflow,
        Zero_flag => Zero,
        data => data
    );

    -- Clock process definitions
    process
    begin
        ClkIn <= '0';
        wait for 10 ns;
        ClkIn <= '1';
        wait for 10 ns;
    end process;

end Behavioral;