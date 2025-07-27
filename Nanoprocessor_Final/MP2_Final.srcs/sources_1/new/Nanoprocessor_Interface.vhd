----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 10:48:55 AM
-- Design Name: 
-- Module Name: Nanoprocessor_Interface - Behavioral
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

entity Nanoprocessor_Interface is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           AN_Select : out STD_LOGIC_VECTOR (3 downto 0);
           SevenSeg_Data : out STD_LOGIC_VECTOR (6 downto 0);
           LED_Data : out STD_LOGIC_VECTOR (3 downto 0));
end Nanoprocessor_Interface;

architecture Behavioral of Nanoprocessor_Interface is

component Nanoprocessor
    Port(
    Clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    Zero_flag : out STD_LOGIC;
    Overflow_flag : out STD_LOGIC;
    data : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

component Seven_segment_output_v1
    Port ( Reg7_val : in STD_LOGIC_VECTOR (3 downto 0);
       SevenSeg : out STD_LOGIC_VECTOR (6 downto 0);
       Anode_select : out STD_LOGIC_VECTOR (3 downto 0));
end component;

--signal sevenseg_data_IN : STD_LOGIC_VECTOR (3 downto 0);
signal data : STD_LOGIC_VECTOR (3 downto 0);

begin

NanoprocessorComponent : Nanoprocessor
    port map(
    Clk => Clk,
    Reset => Reset,
    Zero_flag => Zero,
    Overflow_flag => Overflow,
    data => data
    );
    
SevenSegDisplay : Seven_segment_output_v1
    port map(
        Reg7_val => data,
        SevenSeg => SevenSeg_Data,
        Anode_select => AN_Select
    );
    
LED_Data <= data;

end Behavioral;
