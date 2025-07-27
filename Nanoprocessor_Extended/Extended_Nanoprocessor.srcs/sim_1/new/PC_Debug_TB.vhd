----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2025 09:28:18 AM
-- Design Name: 
-- Module Name: PC_Debug_TB - Behavioral
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

entity PC_Debug_TB is
--  Port ( );
end PC_Debug_TB;

architecture Behavioral of PC_Debug_TB is



component Program_Counter_Debug
    Port (
        CLK            : in  std_logic;
        RESET          : in  std_logic;
        BTN_Debug      : in  std_logic;
       
        Next_Address   : in  std_logic_vector(2 downto 0);
        PC_LED         : out std_logic_vector(2 downto 0);
        Memory_Select  : out std_logic_vector(2 downto 0)
    );
end component;


    signal CLK_tb           : std_logic := '0';
    signal RESET_tb         : std_logic := '0';
    signal BTN_Debug_tb     : std_logic := '0';
   
    signal Next_Address_tb  : std_logic_vector(2 downto 0) := "000";
    signal PC_LED_tb        : std_logic_vector(2 downto 0);
    signal Memory_Select_tb : std_logic_vector(2 downto 0);


begin


    UUT: Program_Counter_Debug
        Port map (
            CLK           => CLK_tb,
            RESET         => RESET_tb,
            BTN_Debug     => BTN_Debug_tb,
        
            Next_Address  => Next_Address_tb,
            PC_LED        => PC_LED_tb,
            Memory_Select => Memory_Select_tb
        );


    clk_process: process
    begin
        CLK_tb <= '0';
        wait for 10 ns;
        CLK_tb <= '1';
        wait for 10 ns;
    end process;


    process
    begin

        RESET_tb <= '1';
        wait for 20 ns;
        RESET_tb <= '0';
        wait for 10 ns;

      
        Next_Address_tb <= "001"; -- PC should become 001
        wait for 100 ns;
        Next_Address_tb <= "010"; -- PC should become 010
        wait for 100 ns;

        -- Enter debug mode
        BTN_Debug_tb <= '1';
        wait for 100 ns;
        BTN_Debug_tb <= '0';
         wait for 100 ns;

        -- In debug mode: PC_LED should show frozen value (010)
        Next_Address_tb <= "011"; -- change Next_Address but PC should not update
         wait for 100 ns;

        -- Exit debug mode
        BTN_Debug_tb <= '1';
        wait for 100 ns;
        BTN_Debug_tb <= '0';
        wait for 100 ns;

   
         wait for 100 ns;

        wait for 500 ns;
    end process;

end Behavioral;
