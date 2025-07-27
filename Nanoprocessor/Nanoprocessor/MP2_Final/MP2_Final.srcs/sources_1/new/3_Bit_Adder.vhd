----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2025 09:05:14 PM
-- Design Name: 
-- Module Name: 3_Bit_Adder - Behavioral
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

entity Three_Bit_Adder is
Port (  A : in STD_LOGIC_VECTOR(2 downto 0);
        B : in STD_LOGIC_VECTOR(2 downto 0);
        Sum : out STD_LOGIC_VECTOR(2 downto 0);
        Carry : out STD_LOGIC);
end Three_Bit_Adder;


architecture Behavioral of Three_Bit_Adder is
component FA
Port (  A : in STD_LOGIC;
        B : in STD_LOGIC;
        C_in : in STD_LOGIC;
        S : out STD_LOGIC;
        C_out : out STD_LOGIC);
end component;

signal Carry_1, Carry_2 : STD_LOGIC;

begin
    FA_0 : FA
    Port map(   A => A(0),
                B => B(0),
                C_in => '0',
                S => Sum(0),
                C_out => Carry_1);

    FA_1 : FA
    Port map(   A => A(1),
                B => B(1),
                C_in => Carry_1,
                S => Sum(1),
                C_out => Carry_2); 

    FA_2 : FA
    Port map(   A => A(2),
                B => B(2),
                C_in => Carry_2,
                S => Sum(2),
                C_out => Carry);     
        
end Behavioral;


