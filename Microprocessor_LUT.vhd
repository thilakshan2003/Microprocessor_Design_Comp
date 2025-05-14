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

entity Microprocessor_LUT is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end Microprocessor_LUT;

architecture Behavioral of Microprocessor_LUT is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
    
signal Assembly_program_ROM : rom_type := (

"100010000001", -- MOVI  R1,1
"100100000010", -- MOVI  R2,2
"100110000011", -- MOVI  R3,3
"000010100000", -- ADD   R1,R2
"000010110000", -- ADD   R1,R3
"101110000110", -- MOVI  R7,6
"000000000000",
"000000000000"
); 

begin
data <= Assembly_program_ROM(to_integer(unsigned(address))); 


end Behavioral;
