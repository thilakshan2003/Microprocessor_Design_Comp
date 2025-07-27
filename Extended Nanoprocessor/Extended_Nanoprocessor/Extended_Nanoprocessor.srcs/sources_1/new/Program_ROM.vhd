----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2025 07:49:58 AM
-- Design Name: 
-- Module Name: LUT_16_7 - Behavioral
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
use ieee.numeric_std.all;  

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_ROM is
    Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction_Out : out STD_LOGIC_VECTOR (11 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
    
signal Assembly_program_ROM : rom_type := (


-----------------------------------
----Add from 1 to 3
"100000000000",
"101110000001", -- MOVI R7, 1  
"100100000010", -- MOVI R2, 2  
"100110000011", -- MOVI R3, 3  
"001110100000", -- ADD  R7, R2  
"100000000000",
"001110110000", -- ADD  R7, R3  
"100000000000"
); 

-----------------------------------

-----------------------------------
-- 10 to 0 countdown

--"101110001010", -- MOVI  R7,15
--"100100000001", -- MOVI  R2,1
--"010100000000", -- NEG   R2
--"001110100000", -- ADD   R7,R2
--"111110000000", -- JZR R7,0
--"110000000011",-- JZR   R0,3
--"100000000000",-- NOP
--"100000000000"-- NOP
--);

begin
    Instruction_Out <= Assembly_program_ROM(to_integer(unsigned(address))); 

end Behavioral;
