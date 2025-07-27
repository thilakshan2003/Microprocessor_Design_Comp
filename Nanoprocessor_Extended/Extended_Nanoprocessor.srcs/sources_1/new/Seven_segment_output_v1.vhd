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
    Port ( Clk : in STD_LOGIC;
       Value : in STD_LOGIC_VECTOR (3 downto 0);
       SevenSeg : out STD_LOGIC_VECTOR (6 downto 0);
       Anode_select : out STD_LOGIC_VECTOR (3 downto 0));
end Seven_segment_output_v1;

architecture Behavioral of Seven_segment_output_v1 is

    signal toggle : STD_LOGIC := '0';
    signal is_negative : boolean := false;
    signal digit : STD_LOGIC_VECTOR(3 downto 0);
    signal Clk_sig : STD_LOGIC;

Component Clk_SevenSeg
        Port (  
            Clk_IN  : in  STD_LOGIC;
            Clk_OUT : out STD_LOGIC
        );
End Component;

begin

SlowClk : Clk_SevenSeg 
    Port Map(
        Clk_IN => Clk,
        Clk_OUT => Clk_sig);

    process(Clk_sig)
    begin
        if rising_edge(Clk_sig) then
            toggle <= not toggle;

            -- Handle 2's complement to magnitude conversion
            if Value(3) = '1' then  -- Negative number
                is_negative <= true;
            else
                is_negative <= false;
            end if;
        end if;
    end process;

    -- Digit output logic
    process(toggle, is_negative)
    begin
        if toggle = '0' then
            Anode_select <= "1101";  -- 2nd digit from right
            if is_negative then
                SevenSeg <= "0111111"; -- minus sign (only middle segment on)
            else
                SevenSeg <= "1111111"; -- blank
            end if;
        else
            Anode_select <= "1110";  -- rightmost digit
            case std_logic_vector(value) is
                when "0000" => SevenSeg <= "1000000"; -- 0
                when "0001" => SevenSeg <= "1111001"; -- 1
                when "0010" => SevenSeg <= "0100100"; -- 2
                when "0011" => SevenSeg <= "0110000"; -- 3
                when "0100" => SevenSeg <= "0011001"; -- 4
                when "0101" => SevenSeg <= "0010010"; -- 5
                when "0110" => SevenSeg <= "0000010"; -- 6
                when "0111" => SevenSeg <= "1111000"; -- 7
                when "1000" => SevenSeg <= "0000000"; -- 8
                when "1001" => SevenSeg <= "1111000"; -- 7
                when "1010" => SevenSeg <= "0000010"; -- 6
                when "1011" => SevenSeg <= "0010010"; -- 5
                when "1100" => SevenSeg <= "0011001"; -- 4
                when "1101" => SevenSeg <= "0110000"; -- 3
                when "1110" => SevenSeg <= "0100100"; -- 2
                when "1111" => SevenSeg <= "1111001"; -- 1
                when others => SevenSeg <= "1111111"; -- blank
            end case;
        end if;
    end process;

end Behavioral;