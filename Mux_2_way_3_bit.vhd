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

entity Mux_2_way_3_bit is
    Port ( D_1 : in STD_LOGIC_VECTOR (2 downto 0);
           D_2 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           EN : in STD_LOGIC;
           Y_3 : out STD_LOGIC_VECTOR (2 downto 0));
end Mux_2_way_3_bit;

architecture Behavioral of Mux_2_way_3_bit is
    component Mux_2_to_1
        Port (D : in STD_LOGIC_VECTOR (1 downto 0);
           S : in STD_LOGIC;
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
    end component;

begin
    
    -- each individual nth(8 to 1 mux) is responsible for handling nth bit in b bit bus
    
    Mux_0: Mux_2_to_1
    port map(
        D(0) => D_1(0),
        D(1) => D_2(0),
        EN => EN,
        S => S,
        Y => Y_3(0)
    );
    
    Mux_1: Mux_2_to_1
    port map(
        D(0) => D_1(1),
        D(1) => D_2(1),
        EN => EN,
        S => S,
        Y => Y_3(1)
    );

    Mux_2: Mux_2_to_1
    port map(
        D(0) => D_1(2),
        D(1) => D_2(2),
        EN => EN,
        S => S,
        Y => Y_3(2)
    );
            
end Behavioral;
