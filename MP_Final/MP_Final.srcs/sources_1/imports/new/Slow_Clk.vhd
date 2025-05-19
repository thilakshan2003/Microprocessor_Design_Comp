----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2025 02:55:05 PM
-- Design Name: 
-- Module Name: Slow_Clk - Behavioral
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

entity Slooow_Ckk is
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT : out STD_LOGIC);
end Slooow_Ckk;

architecture Behavioral of Slooow_Ckk is

signal count : integer := 1;
signal clk_status : std_logic := '0';

begin

process (Clk_in) begin
    if (rising_edge(Clk_in)) then
        count <= count +1;
        
        if (count = 50000000) then
            clk_status <= not clk_status;
            Clk_out <= clk_status;
            count <= 1;
        end if;
    end if;
end process;

  
end Behavioral;
