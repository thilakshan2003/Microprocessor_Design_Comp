----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2025 
-- Design Name: Register Bank
-- Module Name: Register_Bank - Behavioral
-- Description: 
--  - Contains 8 registers (R0 to R7), each 4 bits.
--  - R0 is hardcoded to "0000".
--  - Uses a 3-to-8 decoder for selection.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Entity Declaration
entity Register_Bank is
    Port ( 
        Clk          : in  STD_LOGIC;
        Reg_Sel      : in  STD_LOGIC_VECTOR (2 downto 0);
        RegBank_IN   : in  STD_LOGIC_VECTOR (3 downto 0);
        Reset        : in  STD_LOGIC;
        R0           : out STD_LOGIC_VECTOR (3 downto 0);
        R1           : out STD_LOGIC_VECTOR (3 downto 0);
        R2           : out STD_LOGIC_VECTOR (3 downto 0);
        R3           : out STD_LOGIC_VECTOR (3 downto 0);
        R4           : out STD_LOGIC_VECTOR (3 downto 0);
        R5           : out STD_LOGIC_VECTOR (3 downto 0);
        R6           : out STD_LOGIC_VECTOR (3 downto 0);
        R7           : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Register_Bank;

-- Architecture Definition
architecture Behavioral of Register_Bank is

--     Component Declarations

    Component Decoder_3_8
        Port (  
            I  : in  STD_LOGIC_VECTOR (2 downto 0);
            EN : in  STD_LOGIC;
            Y  : out STD_LOGIC_VECTOR (7 downto 0)
        );
    End Component;

    Component Register_4bit
        Port (  
            D   : in  STD_LOGIC_VECTOR (3 downto 0);
            En  : in  STD_LOGIC;
            Res : in  STD_LOGIC;
            Clk : in  STD_LOGIC;
            Q   : out STD_LOGIC_VECTOR (3 downto 0)
        );
    End Component;

    -- Internal Signals
    signal Reg_0_0000 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal Decoder_Out : STD_LOGIC_VECTOR (7 downto 0);
    signal Decoder_enabler_ON : STD_LOGIC := '1';    

begin 

    -- 3-to-8 Decoder
    Decoder_3_to_8_ZERO : Decoder_3_8
    Port Map (  
        I => Reg_Sel,
        EN => Decoder_enabler_ON,
        Y => Decoder_Out
    );
  
    -- Register Instantiations
    Reg_0 : Register_4bit
    Port Map(   
        D => Reg_0_0000,       -- Hardcoded to 0000
        En => Decoder_Out(0),
        Res => Reset,
        Clk => Clk,
        Q => R0
    );          
    
    Reg_1 : Register_4bit
    Port Map(   
        D => RegBank_IN,
        En => Decoder_Out(1),
        Res => Reset,
        Clk => Clk,
        Q => R1
    );  

    Reg_2 : Register_4bit
    Port Map(   
        D => RegBank_IN,
        En => Decoder_Out(2),
        Res => Reset,
        Clk => Clk,
        Q => R2
    );          

    Reg_3 : Register_4bit
    Port Map(   
        D => RegBank_IN,
        En => Decoder_Out(3),
        Res => Reset,
        Clk => Clk,
        Q => R3
    );       

    Reg_4 : Register_4bit
    Port Map(   
        D => RegBank_IN,
        En => Decoder_Out(4),
        Res => Reset,
        Clk => Clk,
        Q => R4
    );          

    Reg_5 : Register_4bit
    Port Map(   
        D => RegBank_IN,
        En => Decoder_Out(5),
        Res => Reset,
        Clk => Clk,
        Q => R5
    );  

    Reg_6 : Register_4bit
    Port Map(   
        D => RegBank_IN,
        En => Decoder_Out(6),
        Res => Reset,
        Clk => Clk,
        Q => R6
    );          

    Reg_7 : Register_4bit
    Port Map(   
        D => RegBank_IN,
        En => Decoder_Out(7),
        Res => Reset,
        Clk => Clk,
        Q => R7
    );    

end Behavioral;
