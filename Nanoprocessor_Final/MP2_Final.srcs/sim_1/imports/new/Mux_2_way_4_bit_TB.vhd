----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 12:10:13 PM
-- Design Name: 
-- Module Name: Mux_2_way_4_bit_TB - Behavioral
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

entity Mux_2_way_4_bit_TB is
--  Port ( );
end Mux_2_way_4_bit_TB;

architecture Behavioral of Mux_2_way_4_bit_TB is

COMPONENT Mux_2_way_4_bit
    Port ( D_0 : in STD_LOGIC_VECTOR (3 downto 0);
       D_1 : in STD_LOGIC_VECTOR (3 downto 0);
       S : in STD_LOGIC;
       Y_4 : out STD_LOGIC_VECTOR (3 downto 0));
       
END COMPONENT;

SIGNAL D_0_TB, D_1_TB, Y_4_TB: STD_LOGIC_VECTOR (3 downto 0);
SIGNAL S_TB: STD_LOGIC;

begin

    UUT: Mux_2_way_4_bit port map(
        D_0 => D_0_TB,
        D_1 => D_1_TB,
        S => S_TB,
        Y_4 => Y_4_TB
    );
    
        process
    begin
        S_TB <= '0';
        D_0_TB <= "1001";
        D_1_TB <= "1110";
        WAIT FOR 100 ns; -- 101

        S_TB <= '1';
        D_0_TB <= "1000";
        D_1_TB <= "1100";
        WAIT FOR 100 ns; -- 100

        S_TB <= '1';
        D_0_TB <= "1110";
        D_1_TB <= "0010";
        WAIT FOR 100 ns; -- 000

        S_TB <= '0';
        D_0_TB <= "1010";
        D_1_TB <= "0010";
        WAIT FOR 100 ns; -- 101
        
        S_TB <= '1';
        D_0_TB <= "0101";
        D_1_TB <= "1011";
        WAIT FOR 100 ns; -- 101

        S_TB <= '0';
        D_0_TB <= "1111";
        D_1_TB <= "0000";
        WAIT FOR 100 ns; -- 111

        WAIT;
    end process;

end Behavioral;
