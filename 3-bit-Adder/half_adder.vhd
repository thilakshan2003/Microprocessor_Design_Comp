----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2025 01:24:23 PM
-- Design Name: 
-- Module Name: half_adder - Behavioral
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

entity half_adder is
    Port (  A : in STD_LOGIC;
            B : in STD_LOGIC;
            SUM : out STD_LOGIC;
            CARRY : out STD_LOGIC);
end half_adder;

architecture Behavioral of half_adder is
signal Not_A, Not_B : std_logic;

begin
    Not_A <= NOT A;
    Not_B <= NOT B;
    SUM <= A XOR B;
    CARRY <= A AND B;


end Behavioral;
