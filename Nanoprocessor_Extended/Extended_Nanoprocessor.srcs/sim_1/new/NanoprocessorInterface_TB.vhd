library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NanoprocessorInterface_TB is
    -- port();
end NanoprocessorInterface_TB;

architecture Behavioral of NanoprocessorInterface_TB is

    component Nanoprocessor_Interface is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Debug_mode : in STD_LOGIC;
           
           Zero : out STD_LOGIC;
           AN_Select : out STD_LOGIC_VECTOR (3 downto 0);
           SevenSeg_Data : out STD_LOGIC_VECTOR (6 downto 0);
           LED_Data : out STD_LOGIC_VECTOR (3 downto 0);
           PC_LED : out STD_LOGic_VECTOR (2 downto 0));
    end component;

    -- internal signals for the ports
    signal ClkIn : std_logic := '0';
    signal ResetIn, BTN_DebugIN : std_logic := '0';
    signal Overflow: std_logic;
    signal Zero: std_logic;
    signal Display: std_logic_vector(3 downto 0);
    signal seg: std_logic_vector(6 downto 0);
    signal led: std_logic_vector(3 downto 0);
    signal pc_led_out : STD_LOGIC_VECTOR ( 2 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT : Nanoprocessor_Interface port map (
        Clk => ClkIn,
        Reset => ResetIn,
        Debug_mode => BTN_DebugIN,
        Overflow => Overflow,
        Zero => Zero,
        
        
        AN_Select => Display,
        SevenSeg_Data => seg,
        LED_Data => led,
        PC_LED => pc_led_out
    );

    -- Clock process definitions
    Clk_process :process
    begin
        ClkIn <= '0';
        wait for 5 ns;
        ClkIn <= '1';
        wait for 5 ns;
    end process;

    
    
    
    stim_proc : process
        begin
            -- Initial reset
            ResetIn <= '1';
            wait for 50 ns;
            ResetIn <= '0';
        
            -- Wait for a few cycles
            wait for 10 ns;
        
            -- Trigger debug mode
            BTN_DebugIn <= '1';
            wait for 100 ns;
            BTN_DebugIn <= '0';
        
            -- Wait and resume
            wait for 100 ns;
            BTN_DebugIn <= '1';
            wait for 100 ns;
            BTN_DebugIn <= '0';
            
            wait for 100 ns;
            
             -- Trigger debug mode
           BTN_DebugIn <= '1';
           wait for 100 ns;
           BTN_DebugIn <= '0';
       
           -- Wait and resume
           wait for 100 ns;
           BTN_DebugIn <= '1';
           wait for 100 ns;
           BTN_DebugIn <= '0';
            -- Run for some more time
            wait for 1000 ns;
        
            -- End simulation
            wait;
        end process;



end Behavioral;