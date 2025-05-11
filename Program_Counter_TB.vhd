----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 05:34:01 PM
-- Design Name: 
-- Module Name: Program_Counter_TB - Behavioral
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

entity Program_Counter_TB is
--  Port ( );
end Program_Counter_TB;

architecture Behavioral of Program_Counter_TB is

COMPONENT Program_Counter
Port ( RESET : in STD_LOGIC;
       CLK : in STD_LOGIC;
       Next_Address : in STD_LOGIC_VECTOR (2 downto 0);
       Memory_Select : out STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;

signal res: std_logic;
signal clk : std_logic := '0';
signal q : std_logic_vector(2 downto 0);
signal next_address: std_logic_vector (2 downto 0);

           

begin
UUT : Program_Counter 
    PORT MAP (
    RESET => res,
    CLK => clk,
    Next_Address => next_address,
    Memory_Select => q);

process begin
    clk <= NOT(clk);
    
    WAIT FOR 10ns;
end process;
 
process begin

    res <= '1';
    
    WAIT FOR 100 ns;
    res <= '0';
    next_address <= "001";
    
    WAIT FOR 100 ns;
        res <= '0';
        next_address <= "001";
        
    WAIT FOR 100 ns;
      
        next_address <= "010";

    WAIT FOR 100 ns;
        res <= '1';
        next_address <= "011";
    
    WAIT FOR 100 ns;
        res <= '0';
        next_address <= "111";
    
    WAIT ;

end process;

end Behavioral;
