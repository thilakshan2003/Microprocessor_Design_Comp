----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2025 06:17:00 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
    component Decoder_3_to_8
    port(
        I: in STD_LOGIC_VECTOR(2 downto 0);
        EN: in STD_LOGIC;
        Y: out STD_LOGIC_VECTOR(7 downto 0)
    );
    end component;
    
    signal I_d: STD_LOGIC_VECTOR(2 downto 0);
    signal Y_d: STD_LOGIC_VECTOR(7 downto 0);
    signal y0, y1, y2, y3, y4, y5, y6, y7: STD_LOGIC;

begin

    Decoder_3_to_8_0: Decoder_3_to_8
    port map(
        I => S,
        Y => Y_d,
        EN => EN
    );
    
    y0 <= D(0) AND Y_d(0) AND EN;
    y1 <= D(1) AND Y_d(1) AND EN;
    y2 <= D(2) AND Y_d(2) AND EN;
    y3 <= D(3) AND Y_d(3) AND EN;
    y4 <= D(4) AND Y_d(4) AND EN;
    y5 <= D(5) AND Y_d(5) AND EN;
    y6 <= D(6) AND Y_d(6) AND EN;
    y7 <= D(7) AND Y_d(7) AND EN;
    
    Y <= y0 OR y1 OR y2 OR y3 OR y4 OR y5 OR y6 OR y7;
    
end Behavioral;
