----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 09:57:53 AM
-- Design Name: 
-- Module Name: Mux_8_way_4_bit_TB - Behavioral
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

entity Mux_8_way_4_bit_TB is
--  Port ( );
end Mux_8_way_4_bit_TB;

architecture Behavioral of Mux_8_way_4_bit_TB is
COMPONENT Mux_8_way_4_bit
    Port ( D_0 : in STD_LOGIC_VECTOR (3 downto 0);
           D_1 : in STD_LOGIC_VECTOR (3 downto 0);
           D_2 : in STD_LOGIC_VECTOR (3 downto 0);
           D_3 : in STD_LOGIC_VECTOR (3 downto 0);
           D_4 : in STD_LOGIC_VECTOR (3 downto 0);
           D_5 : in STD_LOGIC_VECTOR (3 downto 0);
           D_6 : in STD_LOGIC_VECTOR (3 downto 0);
           D_7 : in STD_LOGIC_VECTOR (3 downto 0);           
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y_4 : out STD_LOGIC_VECTOR (3 downto 0));
       
END COMPONENT;

SIGNAL D_0_TB, D_1_TB, D_2_TB, D_3_TB, D_4_TB, D_5_TB, D_6_TB, D_7_TB, Y_TB: STD_LOGIC_VECTOR (3 downto 0);
SIGNAL S_TB: STD_LOGIC_VECTOR (2 downto 0);

begin

    UUT: Mux_8_way_4_bit
        PORT MAP (
            D_0 => D_0_TB,
            D_1 => D_1_TB,
            D_2 => D_2_TB,
            D_3 => D_3_TB,
            D_4 => D_4_TB,
            D_5 => D_5_TB,
            D_6 => D_6_TB,
            D_7 => D_7_TB,
            S   => S_TB,
            Y_4 => Y_TB
        );
        

process
begin

S_TB    <= "001";
D_0_TB  <= "0000";
D_1_TB  <= "0001";
D_2_TB  <= "1001";
D_3_TB  <= "0000";
D_4_TB  <= "0000";
D_5_TB  <= "0000";
D_6_TB  <= "0000";
D_7_TB  <= "0000";
WAIT FOR 100 ns;

S_TB    <= "100";
D_5_TB  <= "1111";
WAIT FOR 100 ns;

S_TB    <= "111";
D_0_TB  <= "1010";
WAIT FOR 100 ns;

S_TB    <= "010";
D_3_TB  <= "0011";
WAIT FOR 100 ns;

S_TB    <= "101";
D_6_TB  <= "0110";
WAIT FOR 100 ns;

S_TB    <= "000";
D_1_TB  <= "0001";
WAIT FOR 100 ns;


WAIT;

end process;


end Behavioral;
