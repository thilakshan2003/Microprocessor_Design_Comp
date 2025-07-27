library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nanoprocessor_TB is
    -- port();
end Nanoprocessor_TB;

architecture Behavioral of Nanoprocessor_TB is

    component Nanoprocessor is
    Port(
        Clk : in STD_LOGIC;
        Reset : in STD_LOGIC;
        BTN_Debug : in STD_LOGIC;
        Zero_flag : out STD_LOGIC;
        Overflow_flag : out STD_LOGIC := '0';
        data : out STD_LOGIC_VECTOR (3 downto 0);
        PC_LED : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    -- internal signals for the ports
    signal ClkIn : std_logic := '0';
    signal ResetIn, BTN_DebugIn: std_logic := '0';
    signal Overflow: std_logic;
    signal Zero: std_logic;
    signal data: std_logic_vector(3 downto 0);
    signal pc_led_out : STD_LOGIC_VECTOR ( 2 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT : Nanoprocessor port map (
        Clk=> ClkIn,
        Reset         => ResetIn,
        BTN_Debug     => BTN_DebugIn,
 
        Zero_flag   => Zero,
        Overflow_flag => Overflow,
        data=> data,
        PC_LED => pc_led_out
    );

    -- Clock process definitions
    process
    begin
        ClkIn <= '0';
        wait for 2 ns;
        ClkIn <= '1';
        wait for 2 ns;
    end process;
    
    
    stim_proc : process
    begin
        -- Initial reset
        ResetIn <= '1';
        wait for 10 ns;
        ResetIn <= '0';
    
       
        wait for 20 ns;
    
        -- Trigger debug mode
        BTN_DebugIn <= '1';
        wait for 50 ns;
        BTN_DebugIn <= '0';
    
        wait for 100 ns;
        BTN_DebugIn <= '1';
        wait for 50 ns;
        BTN_DebugIn <= '0';
        
        wait for 100 ns;
        
         -- Trigger debug mode
       BTN_DebugIn <= '1';
       wait for 50 ns;
       BTN_DebugIn <= '0';
       wait for 100 ns;
       
       BTN_DebugIn <= '1';
       wait for 50 ns;
       BTN_DebugIn <= '0';
        -- Run for some more time
        wait for 1000 ns;
    
        -- End simulation
        wait;
    end process;


end Behavioral;