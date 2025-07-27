----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2025 02:55:05 PM
-- Design Name: 
-- Module Name: Slow_Clk - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Clk_SevenSeg is
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT : out STD_LOGIC);
end Clk_SevenSeg;

architecture Behavioral of Clk_SevenSeg is

signal Count : STD_LOGIC_VECTOR (26 downto 0) := (others => '0');

begin
    process (Clk_IN) begin
        if rising_edge(Clk_IN) then
            Count <= std_logic_vector(unsigned(Count) + 1); 
        end if;
    end process;

    Clk_OUT <= Count(17);  -- Output the 23th bit as the slow clock

end Behavioral;