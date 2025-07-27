----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2025 07:16:59 PM
-- Design Name: 
-- Module Name: TB_Three_Bit_Adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Three_Bit_Adder is
--  Port ( );
end TB_Three_Bit_Adder;

architecture Behavioral of TB_Three_Bit_Adder is

-- Component Declaration
    component Three_Bit_Adder
        Port (
            A : in STD_LOGIC_VECTOR(2 downto 0);
            B : in STD_LOGIC_VECTOR(2 downto 0);
            Sum : out STD_LOGIC_VECTOR(2 downto 0);
            Carry : out STD_LOGIC
        );
    end component;

    -- Signals for inputs and outputs
    signal A, B : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal Sum : STD_LOGIC_VECTOR(2 downto 0);
    signal Carry : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: Three_Bit_Adder
        port map (
            A => A,
            B => B,
            Sum => Sum,
            Carry => Carry
        );

    -- Stimulus process
    process
    begin
        -- Test case 1: 000 + 000
        A <= "000"; B <= "000";
        wait for 100 ns;

        -- Test case 2: 001 + 001
        A <= "001"; B <= "001";
        wait for 100 ns;

        -- Test case 3: 011 + 001
        A <= "011"; B <= "001";
        wait for 100 ns;

        -- Test case 4: 111 + 001 (expect carry)
        A <= "111"; B <= "001";
        wait for 100 ns;

        -- Test case 5: 101 + 010
        A <= "101"; B <= "010";
        wait for 100 ns;

        wait;
    end process;




end Behavioral;
