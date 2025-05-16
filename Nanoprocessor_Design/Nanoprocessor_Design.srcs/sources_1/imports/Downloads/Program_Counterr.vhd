----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 04:46:11 PM
-- Design Name: 
-- Module Name: pc_draft - Behavioral
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

entity Program_Counter is
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Next_Address : in STD_LOGIC_VECTOR (2 downto 0);
           Memory_Select : out STD_LOGIC_VECTOR (2 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is


begin

process(Clk)
begin
  if rising_edge(CLK) then
    if Reset = '1' then
      Memory_Select <= "000";
    else
      Memory_Select <= Next_Address;
    end if;
  end if;
end process;

end Behavioral;
