----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 12:28:53 PM
-- Design Name: 
-- Module Name: Nanoprocessor - Behavioral
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
use IEEE.NUMERIC_STD.ALL;  


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity Slow_Clk is
    Port ( Clk_IN : in STD_LOGIC;
           Clk_OUT : out STD_LOGIC);
end Slow_Clk;

architecture Behavioral of Slow_Clk is
    signal Count : STD_LOGIC_VECTOR (23 downto 0) := (others => '0');
begin
    process (Clk_IN) begin
        if rising_edge(Clk_IN) then
            Count <= std_logic_vector(unsigned(Count) + 1); 
        end if;
    end process;

    Clk_OUT <= Count(2);  -- Output the 24th bit as the slow clock

end Behavioral;
