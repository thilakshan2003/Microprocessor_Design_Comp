----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2025 03:07:15 PM
-- Design Name: 
-- Module Name: Program_Counter_Debug - Behavioral
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

entity Program_Counter_Debug is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           BTN_Debug : in STD_LOGIC;
          
           Next_Address : in STD_LOGIC_VECTOR (2 downto 0);
           PC_LED : out STD_LOGIC_VECTOR (2 downto 0);
           Memory_Select : out STD_LOGIC_VECTOR(2 downto 0));
end Program_Counter_Debug;

architecture Behavioral of Program_Counter_Debug is

    signal reg : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal debug_mode : STD_LOGIC := '0';
    signal pc_led_out : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal reg_current : STD_LOGIC_VECTOR (2 downto 0);

 
    signal btn_debug_prev : STD_LOGIC := '0';

begin

process(CLK, RESET)
begin

if RESET = '1' then
    reg <= (others => '0');
    debug_mode <= '0';
    pc_led_out <= (others => '0');
    btn_debug_prev <= '0';
    reg_current <= (others => '0');
    
elsif rising_edge(CLK) then

    -- When debug btn is pressed
    if BTN_Debug = '1' and btn_debug_prev = '0' then
        debug_mode <= NOT debug_mode;
    end if;
    
    -- LED OFF when Debug mode is off
    if debug_mode = '0' then
        reg_current <= (others => '0');
    else 
    -- LED displays PC value when Debug mode is on
        reg_current <= reg;
    end if;
    
    btn_debug_prev <= BTN_Debug;
    reg <= Next_Address;
    
end if;
end process;

Memory_Select <= reg;
PC_LED <= reg_current;

end Behavioral;
