----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2025 04:20:58 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C_IN : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_OUT : out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is
    COMPONENT full_adder
        port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        C_in : in STD_LOGIC;
        SUM : out STD_LOGIC;
        C_out : out STD_LOGIC);
    END COMPONENT;
signal FA0_C, FA1_C, FA2_C, FA3_C : STD_LOGIC;

begin
    FA_0 : full_adder
        port map(
        A => A0,
        B => B0,
        C_in => '0',
        SUM => S0,
        C_out => FA0_C);
        
    FA_1 : full_adder
            port map(
            A => A1,
            B => B1,
            C_in => FA0_C,
            SUM => S1,
            C_out => FA1_C);
    
    FA_2 : full_adder
            port map(
            A => A2,
            B => B2,
            C_in => FA1_C,
            SUM => S2,
            C_out => FA2_C);
            
    FA_3 : full_adder
            port map(
            A => A3,
            B => B3,
            C_in => FA2_C,
            SUM => S3,
            C_out => C_out);
    
end Behavioral;
