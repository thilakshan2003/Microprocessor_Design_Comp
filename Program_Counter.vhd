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

COMPONENT Slow_Clk

    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT : out STD_LOGIC);

END COMPONENT;

signal D0, D1, D2 : std_logic;
signal Q0, Q1, Q2 : std_logic;
signal Clk_Slow : std_logic;

begin

Slow_Clk_0 : Slow_Clk
    port map (
    CLK_IN => CLK,
    CLK_OUT => Clk_Slow);
    
D0 <= NOT Q0;
D1 <= Q0 XOR Q1;
D2 <= Q2 XOR (Q1 AND Q0);

D_FF_0 : D_FF
    PORT MAP (
    D => D0,
    RES => RESET, 
    CLK => Clk_Slow,
    Q => Q0);
    
D_FF_1 : D_FF
    PORT MAP (
    D => D1,
    RES => RESET, 
    CLK => Clk_Slow,
    Q => Q1);
        
D_FF_2 : D_FF
    PORT MAP (
    D => D2,
    RES => RESET, 
    CLK => Clk_Slow,
    Q => Q2);
    

            
Memory_Select(0) <= Q0;
Memory_Select(1) <= Q1;
Memory_Select(2) <= Q2;

    

end Behavioral;
