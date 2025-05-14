----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 01:44:36 PM
-- Design Name: 
-- Module Name: Add_Sub_TB - Behavioral
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

entity Add_Sub_TB is
--  Port ( );
end Add_Sub_TB;

architecture Behavioral of Add_Sub_TB is

component Add_sub
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sub : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

signal a, b, sum : std_logic_vector (3 downto 0);
signal sub, overflow, zero : std_logic;

begin

UUT : Add_Sub
port map(
    A => a,
    B => b,
    Sub => sub,
    Sum => sum,
    Zero => zero,
    Overflow => overflow);
    
process
begin

--index number : 230359 (111000001111010111)

A <= "0111";
B <= "1101";
Sub <= '0';

wait for 100ns;

A <= "0011";
B <= "1000";
Sub <= '1';

wait for 100ns;

--index number : 230647 (111000010011110111)

A <= "0111";
B <= "1111";
Sub <= '0';

wait for 100ns;

A <= "0100";
B <= "1000";
Sub <= '1';

wait for 100ns;

--index number : 230722 (111000010101000010)

A <= "0010";
B <= "0100";
Sub <= '0';

wait for 100ns;

A <= "0101";
B <= "1000";
Sub <= '1';

wait for 100ns;
--index number : 230311 (111000001110100111)

A <= "0111";
B <= "1110";
Sub <= '0';

wait for 100ns;

A <= "0011";
B <= "1110";
Sub <= '1';

wait for 100ns;

wait;
end process;




end Behavioral;
