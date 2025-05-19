----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2025 01:15:16 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_Enabler : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_A_Selector : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_B_Selector : out STD_LOGIC_VECTOR (2 downto 0);
          
           Load_Selector : out STD_LOGIC;
           Imd_Value : out STD_LOGIC_VECTOR (3 downto 0);
           Add_Sub_Selector : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
signal internal_jump_flag : std_logic := '0';
begin

Load_Selector <= Instruction(11);
Add_Sub_Selector <= Instruction(10);


Reg_Enabler <= Instruction(9 downto 7);
Reg_A_Selector <= Instruction (9 downto 7);
Reg_B_Selector <= Instruction (6 downto 4);

Imd_Value <= Instruction(3 downto 0);

 process (Instruction, Reg_Jump_Check)
   begin
       if (Reg_Jump_Check = "0000" and Instruction(11) = '1' and Instruction(10) = '1') then
           internal_jump_flag <= '1';
       else
           internal_jump_flag <= '0';
       end if;
   end process;

Jump_Address <= Instruction(2 downto 0);
Jump_Flag <= internal_jump_flag;

end Behavioral;
 
