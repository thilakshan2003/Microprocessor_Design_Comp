----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 08:25:01 AM
-- Design Name: 
-- Module Name: Nanoprocessor - Behavioral
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

entity Nanoprocessor2 is
    Port(
        Clk : in STD_LOGIC;
        Clk_bank: in STD_LOGIC;
        Reset : in STD_LOGIC;
        Add_Sub_SUM : in STD_LOGIC_VECTOR (3 downto 0);
        
        Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
        
        Reg_A_Selector : out STD_LOGIC_VECTOR (2 downto 0);
        Reg_B_Selector : out STD_LOGIC_VECTOR (2 downto 0);
        Add_Sub_Selector : out STD_LOGIC;
        
        Data_Bus_0 :out STD_LOGIC_VECTOR (3 downto 0);
        Data_Bus_1 :out STD_LOGIC_VECTOR (3 downto 0);
        Data_Bus_2 :out STD_LOGIC_VECTOR (3 downto 0);
        Data_Bus_3 :out STD_LOGIC_VECTOR (3 downto 0);
        Data_Bus_4 :out STD_LOGIC_VECTOR (3 downto 0);
        Data_Bus_5 :out STD_LOGIC_VECTOR (3 downto 0);
        Data_Bus_6 :out STD_LOGIC_VECTOR (3 downto 0);
        Data_Bus_7 :out STD_LOGIC_VECTOR (3 downto 0));
        
        
         
end Nanoprocessor2;

architecture Behavioral of Nanoprocessor2 is

signal Clk_Sig: STD_LOGIC;

signal Address_IN, Address_OUT : STD_LOGIC_VECTOR (2 downto 0);

   --INSTRUCTION DECODER SIGNALS
signal Instruction_Bus : STD_LOGIC_VECTOR (11 downto 0);
signal reg_enable, reg_A_select, reg_B_select, jump_address : STD_LOGIC_VECTOR (2 downto 0);
signal imd : STD_LOGIC_VECTOR (3 downto 0);
signal load_select, add_sub_select, Jump_Flag : STD_LOGIC;


  --THREE BIT ADDER
signal Adder_OUT : STD_LOGIC_VECTOR (2 downto 0);
signal Adder_Carry : STD_LOGIC;
 
signal Reg_A_OUT, Reg_B_OUT: STD_LOGIC_VECTOR (3 downto 0);
signal Zero, Overflow : STD_LOGIC;
signal Register_Bank_IN : STD_LOGIC_VECTOR (3 downto 0);



signal D_Bus_0, D_Bus_1, D_Bus_2, D_Bus_3, D_Bus_4, D_Bus_5, D_Bus_6, D_Bus_7:  STD_LOGIC_VECTOR (3 downto 0);



Component Slow_Clk
        Port (  
            Clk_IN  : in  STD_LOGIC;
            Clk_OUT : out STD_LOGIC
        );
End Component;

Component Program_Counter
     Port (   RESET : in STD_LOGIC;
              CLK : in STD_LOGIC;
              Next_Address : in STD_LOGIC_VECTOR (2 downto 0);
              Memory_Select : out STD_LOGIC_VECTOR (2 downto 0)
          );
End Component;

Component Mux_2_way_3_bit
    Port (
        D_0 : in STD_LOGIC_VECTOR (2 downto 0);
        D_1 : in STD_LOGIC_VECTOR (2 downto 0);
        S : in STD_LOGIC;
        Y_3 : out STD_LOGIC_VECTOR (2 downto 0));
   End Component;

COMPONENT Three_Bit_Adder is
Port (  A : in STD_LOGIC_VECTOR(2 downto 0);
        B : in STD_LOGIC_VECTOR(2 downto 0);
        Sum : out STD_LOGIC_VECTOR(2 downto 0);
        Carry : out STD_LOGIC);
end COMPONENT;

Component Program_ROM
  Port (     Address : in STD_LOGIC_VECTOR (2 downto 0);
             Instruction_Out : out STD_LOGIC_VECTOR (11 downto 0));
End Component;

Component Mux_2_way_4_bit
   Port (     D_0 : in STD_LOGIC_VECTOR (3 downto 0);
              D_1 : in STD_LOGIC_VECTOR (3 downto 0); 
              S : in STD_LOGIC;
              Y_4 : out STD_LOGIC_VECTOR (3 downto 0));
End Component;

Component Instruction_Decoder
        Port (
           Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_Enabler : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_A_Selector : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_B_Selector : out STD_LOGIC_VECTOR (2 downto 0);
          
           Load_Selector : out STD_LOGIC;
           Imd_Value : out STD_LOGIC_VECTOR (3 downto 0);
           Add_Sub_Selector : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0)
       );
    End Component;
    
Component Register_Bank
        Port ( 
                Clk          : in  STD_LOGIC;
                Reg_Sel      : in  STD_LOGIC_VECTOR (2 downto 0);
                RegBank_IN   : in  STD_LOGIC_VECTOR (3 downto 0);
                R0, R1, R2, R3, R4, R5, R6, R7  : out STD_LOGIC_VECTOR (3 downto 0)
            );
    End Component;
  

begin

SlowClk : Slow_Clk 
    Port Map(
        Clk_IN => Clk,
        Clk_OUT => Clk_Sig );

Adder_3_Bit : Three_Bit_Adder
    Port Map(
        A => Address_OUT,
        B => "001",
        Sum => Adder_OUT,
        Carry => Adder_Carry); --DEOS THIS GO ANYWHEREW
        

Address_Selector : Mux_2_way_3_bit
    Port Map(
        D_0 => Adder_OUT,
        D_1 => Jump_Address,
        S => Jump_Flag,
        Y_3 => Address_IN);
        
ProgramCounter : Program_Counter --DEFAULT VALUE "0000" OR RESET?
    Port Map(
        RESET => Reset,
        CLK => Clk_Sig,
        Next_Address => Address_IN,
        Memory_Select => Address_OUT);
        
ProgramROM : Program_ROM
    Port Map(
        Address => Address_OUT, -- ADD 2 NEGS OR CHECK IF 6 INSTRUCTIONS WILL BE FINE
        Instruction_Out => Instruction_Bus);

Register_IN_Selector : Mux_2_way_4_bit
    Port Map(
         D_0 => Add_Sub_SUM,
         D_1 => imd,
         S => load_select,
         Y_4 => Register_Bank_IN);
        
InstructionDecoder : Instruction_Decoder
    Port Map(
        Instruction => Instruction_Bus,
        Reg_Jump_Check => Jump_Check,
        Reg_Enabler => reg_enable,
        Reg_A_Selector => reg_A_select,
        Reg_B_Selector => reg_B_select,
       
        Load_Selector => load_select,
        Imd_Value => imd,
        Add_Sub_Selector => add_sub_select,
        Jump_Flag => Jump_Flag,
        Jump_Address => jump_address);
        
RegisterBank : Register_Bank
        Port Map(
             Clk => Clk_bank,
             Reg_Sel => reg_enable,
             RegBank_IN => Register_Bank_IN,
             R0 => Data_Bus_0,
            R1 => Data_Bus_1,
            R2 => Data_Bus_2,
            R3 => Data_Bus_3,
            R4 => Data_Bus_4,
            R5 => Data_Bus_5,
            R6 => Data_Bus_6,
            R7 => Data_Bus_7);

 
        

Reg_A_Selector <=reg_A_select;
Reg_B_Selector <=reg_B_select;

Add_Sub_Selector<=add_sub_select;
Data_Bus_0 <= D_Bus_0;
Data_Bus_1 <= D_Bus_1;
Data_Bus_2 <= D_Bus_2;
Data_Bus_3 <= D_Bus_3;
Data_Bus_4 <= D_Bus_4;
Data_Bus_5 <= D_Bus_5;
Data_Bus_6 <= D_Bus_6;
Data_Bus_7 <= D_Bus_7;



       
end Behavioral;