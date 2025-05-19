----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 05:18:59 PM
-- Design Name: 
-- Module Name: Seven_segment_output_v1 - Behavioral
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

entity Seven_segment_output_v1 is
    Port ( Reg7_val : in STD_LOGIC_VECTOR (3 downto 0);
           SevenSeg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode_select : out STD_LOGIC_VECTOR (3 downto 0));
end Seven_segment_output_v1;

architecture Behavioral of Seven_segment_output_v1 is

begin

    process(Reg7_val)
    begin
        case Reg7_val is
            when "0000" => SevenSeg <= "1000000"; -- 0
            when "0001" => SevenSeg <= "1111001"; -- 1
            when "0010" => SevenSeg <= "0100100"; -- 2
            when "0011" => SevenSeg <= "0110000"; -- 3
            when "0100" => SevenSeg <= "0011001"; -- 4
            when "0101" => SevenSeg <= "0010010"; -- 5
            when "0110" => SevenSeg <= "0000010"; -- 6
            when "0111" => SevenSeg <= "1111000"; -- 7
            when "1000" => SevenSeg <= "0000000"; -- 8
            when "1001" => SevenSeg <= "0010000"; -- 9
            when "1010" => SevenSeg <= "0001000"; -- A
            when "1011" => SevenSeg <= "0000011"; -- b
            when "1100" => SevenSeg <= "1000110"; -- C
            when "1101" => SevenSeg <= "0100001"; -- d
            when "1110" => SevenSeg <= "0000110"; -- E
            when "1111" => SevenSeg <= "0001110"; -- F
            when others => SevenSeg <= "1111111"; -- Blank/off
        end case;
    end process;

Anode_select <= "1110";

end Behavioral;
