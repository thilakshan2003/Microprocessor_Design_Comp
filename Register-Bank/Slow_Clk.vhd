----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2025 12:23:45 PM
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
signal Count : Integer := 0;
constant  Max_Count : Integer := 5;
signal Clk_Status : STD_LOGIC := '0';

begin
process (Clk_IN) begin
    if (rising_edge(Clk_IN)) then
        Count <= Count + 1;
        if Count = Max_Count then 
            Count <= 0; --Reset Count
            Clk_Status <= NOT Clk_Status; --Toggle every 50000000 cycles
        end if;
    end if;
end process;

Clk_OUT <= Clk_Status; 
end Behavioral;
