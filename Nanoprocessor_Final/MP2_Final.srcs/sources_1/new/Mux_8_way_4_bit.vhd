----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2025 01:42:19 PM
-- Design Name: 
-- Module Name: Mux_8_way_4_bit - Behavioral
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

entity Mux_8_Way_4_Bit is
    Port (
        D_0, D_1, D_2, D_3, D_4, D_5, D_6, D_7 : in  STD_LOGIC_VECTOR(3 downto 0);
        S : in  STD_LOGIC_VECTOR(2 downto 0);
        Y_4 : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Mux_8_Way_4_Bit;

architecture Behavioral of Mux_8_Way_4_Bit is
begin
    process(S, D_0, D_1, D_2, D_3, D_4, D_5, D_6, D_7)
    begin
        case S is
            when "000" => Y_4 <= D_0;
            when "001" => Y_4 <= D_1;
            when "010" => Y_4 <= D_2;
            when "011" => Y_4 <= D_3;
            when "100" => Y_4 <= D_4;
            when "101" => Y_4 <= D_5;
            when "110" => Y_4 <= D_6;
            when "111" => Y_4 <= D_7;
            when others => Y_4 <= (others => '0');
        end case;
    end process;
end Behavioral;
