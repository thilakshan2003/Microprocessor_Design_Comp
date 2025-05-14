----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2025 02:18:21 PM
-- Design Name: 
-- Module Name: full_adder - Behavioral
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

entity full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_IN : in STD_LOGIC;
           SUM : out STD_LOGIC;
           C_OUT : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is
component half_adder
Port (  A : in STD_LOGIC;
        B : in STD_LOGIC;
        SUM : out STD_LOGIC;
        CARRY : out STD_LOGIC);
end component;
signal HA0_S, HA0_C, HA1_S, HA1_C : std_logic;

begin
            
HA_0 : half_adder
port map(
    A => A,
    B => B,
    SUM => HA0_S,
    CARRY => HA0_C);
 
HA_1 : half_adder
    port map(
    A => HA0_S,
    B => C_IN,
    SUM => HA1_S,
    CARRY => HA1_C); 

    SUM <= HA1_S;
    C_OUT <= HA0_C OR HA1_C;
        
end Behavioral;
