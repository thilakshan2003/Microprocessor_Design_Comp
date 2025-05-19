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
  Port (
    CLK           : in  STD_LOGIC;
    RESET         : in  STD_LOGIC;
    Next_Address  : in  STD_LOGIC_VECTOR(2 downto 0);
    Memory_Select : out STD_LOGIC_VECTOR(2 downto 0)
  );
end Program_Counter;

architecture Behavioral of Program_Counter is
signal PC_Reg : std_logic_vector (2 downto 0):= "000";

begin 
 
process(CLK)
begin
 
    if RESET = '1' then
        PC_Reg <= "000";
    else if rising_edge(CLK) then
        PC_Reg <= Next_Address;
 
end if;
end if;
end process;

Memory_Select <= PC_Reg;

end Behavioral;
