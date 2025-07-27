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
    Port (
        Instruction     : in STD_LOGIC_VECTOR(11 downto 0);
        Reg_Jump_Check  : in STD_LOGIC_VECTOR(3 downto 0);
        Reg_Enabler     : out STD_LOGIC_VECTOR(2 downto 0);
        Reg_A_Selector  : out STD_LOGIC_VECTOR(2 downto 0);
        Reg_B_Selector  : out STD_LOGIC_VECTOR(2 downto 0);
        Load_Selector   : out STD_LOGIC;
        Imd_Value       : out STD_LOGIC_VECTOR(3 downto 0);
        Add_Sub_Selector: out STD_LOGIC;
        Jump_Flag       : out STD_LOGIC;
        Jump_Address    : out STD_LOGIC_VECTOR(2 downto 0);
        Opcode          : out STD_LOGIC_VECTOR(1 downto 0)   -- new output
    );
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
begin
    process(Instruction, Reg_Jump_Check)
    begin
        Opcode <= Instruction(11 downto 10);

        Reg_A_Selector <= (others => '0');
        Reg_B_Selector <= (others => '0');
        Reg_Enabler <= (others => '0');
        Load_Selector <= '0';
        Imd_Value <=  (others => '0');
        Add_Sub_Selector <= '0';
        Jump_Flag <= '0';
        Jump_Address <= (others => '0');

        if (Instruction(11 downto 10) = "00") then
        -- ADD instruction
            Reg_A_Selector <= Instruction(9 downto 7);
            Reg_B_Selector <= Instruction(6 downto 4);
            Load_Selector <= '0';
            Reg_Enabler <= Instruction(9 downto 7);
            
        elsif (Instruction(11 downto 10) = "01") then
        -- NEG Instruction
            Reg_A_Selector <= "000";
            Reg_B_Selector <= Instruction(9 downto 7);
            Load_Selector <= '0';
            Add_Sub_Selector <= '1';
            Reg_Enabler <= Instruction(9 downto 7);

        elsif (Instruction(11 downto 10) = "10") then
        -- MOVI instruction
            Reg_Enabler <= Instruction(9 downto 7);
            Load_Selector <= '1';
            Imd_Value <= Instruction(3 downto 0);
            
        elsif (Instruction(11 downto 10) = "11") then
        
        -- JZR Instruction
        
            Reg_A_Selector <= Instruction(9 downto 7);
            Load_Selector <= '1';
        
        
            if Reg_Jump_Check = "0000" then
                Jump_Flag <= '1';
                Jump_Address <= Instruction(2 downto 0);
            else
                Jump_Flag <= '0';
            end if;
        end if;
    end process;
end Behavioral;

 
