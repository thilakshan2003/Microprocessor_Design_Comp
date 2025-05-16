----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 01:18:59 PM
-- Design Name: 
-- Module Name: Add_Sub - Behavioral
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

entity Add_Sub is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sub : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end Add_Sub;

architecture Behavioral of Add_Sub is

    Component FA
    port(
        A, B, C_in : in std_logic;
        S, C_out : out std_logic);
    end component;
    
    signal B_Neg : std_logic_vector (3 downto 0);
    signal Sum_out : std_logic_vector (3 downto 0);
    signal carry_0 : std_logic;
    signal carry_1 : std_logic;
    signal carry_2 : std_logic;
    signal carry_3 : std_logic;
    
begin
    B_Neg(0) <= B(0) XOR Sub;
    B_Neg(1) <= B(1) XOR Sub;
    B_Neg(2) <= B(2) XOR Sub;
    B_Neg(3) <= B(3) XOR Sub;
    
    FA0 :FA
    port map(
        A => A(0),
        B => B_Neg(0),
        C_in => Sub,
        S => Sum_out(0),
        C_out => carry_0
    );
    
    FA1 :FA
    port map(
        A => A(1),
        B => B_Neg(1),
        C_in => carry_0,
        S => Sum_out(1),
        C_out => carry_1
    );
    
    FA2 :FA
    port map(
        A => A(2),
        B => B_Neg(2),
        C_in => carry_1,
        S => Sum_out(2),
        C_out => carry_2
    );
    
    FA3 :FA
    port map(
        A => A(3),
        B => B_Neg(3),
        C_in => carry_2,
        S => Sum_out(3),
        C_out => carry_3 
    );
    
    Sum <= Sum_out;
    Zero <= NOT( Sum_out(0) OR Sum_out(1) OR Sum_out(2) OR Sum_out(3));
    Overflow <= carry_3 XOR carry_2;
    
end Behavioral;
