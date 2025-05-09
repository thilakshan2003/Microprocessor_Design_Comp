----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2025 01:36:54 PM
-- Design Name: 
-- Module Name: Instruction_Decoder_TB - Behavioral
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

entity Instruction_Decoder_TB is
--  Port ( );
end Instruction_Decoder_TB;

architecture Behavioral of Instruction_Decoder_TB is

COMPONENT Instruction_Decoder
Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_Enabler : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_A_Selector : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_B_Selector : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Bank_Enabler : out STD_LOGIC;
           Load_Selector : out STD_LOGIC;
           Imd_Value : out STD_LOGIC_VECTOR (3 downto 0);
           Add_Sub_Selector : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;



signal Instruction : STD_LOGIC_VECTOR(11 downto 0);
signal Reg_Jump_Check, Imd_Value : STD_LOGIC_VECTOR(3 downto 0);
signal Reg_Enabler, Reg_A_Selector, Reg_B_Selector, Jump_Address : STD_LOGIC_VECTOR(2 downto 0);
signal Reg_Bank_Enabler, Load_Selector, Add_Sub_Selector, Jump_Flag : STD_LOGIC;

begin

UUT : Instruction_Decoder
Port Map(
    Instruction=> Instruction,
    Reg_Jump_Check =>Reg_Jump_Check,
    Imd_Value => Imd_Value,
    Reg_Enabler => Reg_Enabler,
    Reg_A_Selector => Reg_A_Selector,
    Reg_B_Selector => Reg_B_Selector,
    Jump_Address => Jump_Address,
    Reg_Bank_Enabler => Reg_Bank_Enabler,
    Load_Selector => Load_Selector,
    Add_Sub_Selector => Add_Sub_Selector,
    Jump_Flag => Jump_Flag
);

process

begin
    Reg_Jump_Check <= "0000";
    Instruction <= "101110000110";  ---MOVI R7,6
    wait for 100ns;
    
    Reg_Jump_Check <= "0111";
    Instruction <= "010110000000";  ---NEG R3
    wait for 100ns;
    
    Reg_Jump_Check <= "0111";
    Instruction <= "001010010000";  ---ADD R5,R1
    wait for 100ns;
    
    Reg_Jump_Check <= "0000";
    Instruction <= "110100000011";  ---JZR R0, 3
    wait for 100ns;
    
    wait;
    
        
end process;   

end Behavioral;
