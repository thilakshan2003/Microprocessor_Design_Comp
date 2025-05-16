----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2025 11:27:35 AM
-- Design Name: 
-- Module Name: Mux_2_way_3_bit - Behavioral
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

entity Multi_2_way_3_bit is
    Port (
        D_0, D_1: in  STD_LOGIC_VECTOR(2 downto 0);
        S : in  STD_LOGIC;
        Y_3 : out STD_LOGIC_VECTOR(2 downto 0)
    );
end Multi_2_way_3_bit;

architecture Behavioral of Multi_2_way_3_bit is

begin

    process(S, D_0, D_1)
    begin
        case S is
            when '0' => Y_3 <= D_0;
            when '1' => Y_3 <= D_1;
            when others => Y_3 <= (others => '0');
        end case;
    end process;        
end Behavioral;
