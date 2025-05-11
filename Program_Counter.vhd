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
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Next_Address : in STD_LOGIC_VECTOR (2 downto 0);
           Memory_Select : out STD_LOGIC_VECTOR (2 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is

COMPONENT D_FF 
    Port ( D : in STD_LOGIC;
           RES : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Q : out STD_LOGIC;
           QBar : out STD_LOGIC);
END COMPONENT;

begin

D_FF_0: D_FF
PORT MAP (
    D => Next_Address(0),
    RES => RESET,
    CLK => CLK,
    Q => Memory_Select(0));
    
D_FF_1: D_FF
    PORT MAP (
        D => Next_Address(1),
        RES => RESET,
        CLK => CLK,
        Q => Memory_Select(1));
        
D_FF_2: D_FF
    PORT MAP (
        D => Next_Address(2),
        RES => RESET,
        CLK => CLK,
        Q => Memory_Select(2));


end Behavioral;
