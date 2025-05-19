----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2025 01:20:12 PM
-- Design Name: 
-- Module Name: Mux_2_way_4_bit - Behavioral
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

entity Mux_2_way_4_bit is
    Port (
            D_0, D_1: in  STD_LOGIC_VECTOR(3 downto 0);
            S : in  STD_LOGIC;
            Y_4 : out STD_LOGIC_VECTOR(3 downto 0)
        );
end Mux_2_way_4_bit;

architecture Behavioral of Mux_2_way_4_bit is

begin

    process(S, D_0, D_1)
    begin
        case S is
            when '1' => Y_4 <= D_0;
            when '0' => Y_4 <= D_1;
            when others => Y_4 <= (others => '0');
        end case;
    end process;        
end Behavioral;

