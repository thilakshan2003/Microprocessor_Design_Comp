-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025
-- Design Name: Register Bank Testbench
-- Module Name: Register_Bank_Testbench - Behavioral
-- Description: Testbench for Register Bank to validate:
--  - Register writes for R1 to R7
--  - Hardcoded value for R0
--  - Decoder-based selection
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Entity Declaration
entity RegisterBank_TB is
--  No ports for testbench
end RegisterBank_TB;

-- Architecture Definition
architecture Behavioral of RegisterBank_TB is

    -- Component Declaration
    component Register_Bank is
        Port ( 
            Clk          : in  STD_LOGIC;
            Reg_Sel      : in  STD_LOGIC_VECTOR (2 downto 0);
            RegBank_IN   : in  STD_LOGIC_VECTOR (3 downto 0);
            R0           : out STD_LOGIC_VECTOR (3 downto 0);
            R1           : out STD_LOGIC_VECTOR (3 downto 0);
            R2           : out STD_LOGIC_VECTOR (3 downto 0);
            R3           : out STD_LOGIC_VECTOR (3 downto 0);
            R4           : out STD_LOGIC_VECTOR (3 downto 0);
            R5           : out STD_LOGIC_VECTOR (3 downto 0);
            R6           : out STD_LOGIC_VECTOR (3 downto 0);
            R7           : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Signals
    signal Clk          : STD_LOGIC := '0';
    signal Reg_Sel      : STD_LOGIC_VECTOR (2 downto 0);
    signal RegBank_IN   : STD_LOGIC_VECTOR (3 downto 0);
    signal R0, R1, R2, R3, R4, R5, R6, R7 : STD_LOGIC_VECTOR (3 downto 0);

    -- Clock Generation
    constant Clk_Period : time := 100 ns;

begin

    -- Clock process
    Clk_Process : process
    begin
        Clk <= not Clk;
        wait for 5ns;
    end process;

    -- UUT Instantiation
    UUT : Register_Bank
    Port Map (
        Clk => Clk,
        Reg_Sel => Reg_Sel,
        RegBank_IN => RegBank_IN,
        R0 => R0,
        R1 => R1,
        R2 => R2,
        R3 => R3,
        R4 => R4,
        R5 => R5,
        R6 => R6,
        R7 => R7
    );

    -- Test Process
    Stimulus_Process : process
    begin

        -- Write to R1
        Reg_Sel <= "001";
        RegBank_IN <= "1010";
        wait for Clk_Period;

        -- Write to R2
        Reg_Sel <= "010";
        RegBank_IN <= "1100";
        wait for Clk_Period;

        -- Write to R3
        Reg_Sel <= "111";
        RegBank_IN <= "0011";
        wait for Clk_Period;

        -- End simulation
        wait for 50 ns;
        wait;
    end process;

end Behavioral;
