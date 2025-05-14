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

entity Mux_8_way_4_bit is
    Port ( D_1 : in STD_LOGIC_VECTOR (3 downto 0);
           D_2 : in STD_LOGIC_VECTOR (3 downto 0);
           D_3 : in STD_LOGIC_VECTOR (3 downto 0);
           D_4 : in STD_LOGIC_VECTOR (3 downto 0);
           D_5 : in STD_LOGIC_VECTOR (3 downto 0);
           D_6 : in STD_LOGIC_VECTOR (3 downto 0);
           D_7 : in STD_LOGIC_VECTOR (3 downto 0);
           D_8 : in STD_LOGIC_VECTOR (3 downto 0);           
           EN : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y_4 : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_8_way_4_bit;

architecture Behavioral of Mux_8_way_4_bit is
    component Mux_8_to_1
        Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
        end component;
        
begin

    -- each individual nth(8 to 1 mux) is responsible for handling nth bit in b bit bus
    Mux_0: Mux_8_to_1
    port map(
        D(0) => D_1(0),
        D(1) => D_2(0),
        D(2) => D_3(0),
        D(3) => D_4(0),
        D(4) => D_5(0),
        D(5) => D_6(0),
        D(6) => D_7(0),
        D(7) => D_8(0),
        EN => EN,
        S => S,
        Y => Y_4(0)
    );
    
    Mux_1: Mux_8_to_1
    port map(
        D(0) => D_1(1),
        D(1) => D_2(1),
        D(2) => D_3(1),
        D(3) => D_4(1),
        D(4) => D_5(1),
        D(5) => D_6(1),
        D(6) => D_7(1),
        D(7) => D_8(1),
        EN => EN,
        S => S,
        Y => Y_4(1)
    );
    
    Mux_2: Mux_8_to_1
    port map(
        D(0) => D_1(2),
        D(1) => D_2(2),
        D(2) => D_3(2),
        D(3) => D_4(2),
        D(4) => D_5(2),
        D(5) => D_6(2),
        D(6) => D_7(2),
        D(7) => D_8(2),
        EN => EN,
        S => S,
        Y => Y_4(2)
    );
    
    Mux_3: Mux_8_to_1
    port map(
        D(0) => D_1(3),
        D(1) => D_2(3),
        D(2) => D_3(3),
        D(3) => D_4(3),
        D(4) => D_5(3),
        D(5) => D_6(3),
        D(6) => D_7(3),
        D(7) => D_8(3),
        EN => EN,
        S => S,
        Y => Y_4(3)
    );
    

end Behavioral;
