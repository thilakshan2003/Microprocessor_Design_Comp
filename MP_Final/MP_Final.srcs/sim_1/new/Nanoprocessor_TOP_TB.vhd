-- Test Bench

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nanoprocessor_TOP_TB is
end Nanoprocessor_TOP_TB;

architecture Behavioral of Nanoprocessor_TOP_TB is

signal Clk_TB : STD_LOGIC := '0';
signal Reset_TB : STD_LOGIC := '0';
signal Sub_TB : STD_LOGIC := '0';
signal Reg_Sel_TB : STD_LOGIC_VECTOR(2 downto 0) := "000";
signal data_TB : STD_LOGIC_VECTOR(3 downto 0);
signal Overflow_flag_TB : STD_LOGIC;
signal Zero_flag_TB : STD_LOGIC;

component Nanoprocessor_TOP
Port(
    Clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    Sub : in STD_LOGIC;
    Reg_Sel : in STD_LOGIC_VECTOR(2 downto 0);
    data : out STD_LOGIC_VECTOR(3 downto 0);
    Overflow_flag : out STD_LOGIC;
    Zero_flag : out STD_LOGIC
);
end component;

begin

UUT : Nanoprocessor_TOP
port map(
    Clk => Clk_TB,
    Reset => Reset_TB,
    Sub => Sub_TB,
    Reg_Sel => Reg_Sel_TB,
    data => data_TB,
    Overflow_flag => Overflow_flag_TB,
    Zero_flag => Zero_flag_TB
);

Clk_process : process
begin
    Clk_TB <= '0'; wait for 10 ns;
    Clk_TB <= '1'; wait for 10 ns;
end process;

stim_proc : process
begin
    Reset_TB <= '1'; wait for 20 ns;
    Reset_TB <= '0';

    Reg_Sel_TB <= "001"; Sub_TB <= '0'; wait for 20 ns;
    Reg_Sel_TB <= "010"; Sub_TB <= '1'; wait for 20 ns;
    Reg_Sel_TB <= "011"; Sub_TB <= '0'; wait for 20 ns;
    Reg_Sel_TB <= "100"; Sub_TB <= '1'; wait for 20 ns;

    wait;
end process;

end Behavioral;
