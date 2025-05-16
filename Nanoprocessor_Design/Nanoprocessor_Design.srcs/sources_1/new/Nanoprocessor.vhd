----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 12:28:53 PM
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

entity Nanoprocessor is
    Port ( Clk : in STD_LOGIC;
           Res: in STD_LOGIC;
           Data : out STD_LOGIC_VECTOR (3 downto 0);
           Zero_Flag : out STD_LOGIC;
           Overflow_Flag : out STD_LOGIC);
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is
    --Slow Clock
    Component Slow_Clk
        Port (  
            Clk_IN  : in  STD_LOGIC;
            Clk_OUT : out STD_LOGIC
        );
    End Component;
    
    --Register Bank
    Component Register_Bank
        Port ( 
                Clk          : in  STD_LOGIC;
                Reg_Sel      : in  STD_LOGIC_VECTOR (2 downto 0);
                RegBank_IN   : in  STD_LOGIC_VECTOR (3 downto 0);
                R0, R1, R2, R3, R4, R5, R6, R7  : out STD_LOGIC_VECTOR (3 downto 0)
            );
    End Component;
    
    --Adder subtractor
    Component Add_Sub
        Port ( 
                   A : in STD_LOGIC_VECTOR (3 downto 0);
                   B : in STD_LOGIC_VECTOR (3 downto 0);
                   Sub : in STD_LOGIC;
                   Sum : out STD_LOGIC_VECTOR (3 downto 0);
                   Overflow : out STD_LOGIC;
                   Zero : out STD_LOGIC
            );
    End Component;
    
    --Instruction Decoder
    Component Instruction_Decoder
        Port (
                   Instruction : in STD_LOGIC_VECTOR (11 downto 0);
                   Reg_Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
                   Reg_Enabler : out STD_LOGIC_VECTOR (2 downto 0);
                   Reg_A_Selector : out STD_LOGIC_VECTOR (2 downto 0);
                   Reg_B_Selector : out STD_LOGIC_VECTOR (2 downto 0);
                   Reg_Bank_Enabler : out STD_LOGIC;
                   Load_Selector : out STD_LOGIC;
                   Imd_Value : out STD_LOGIC_VECTOR (3 downto 0);
                   Add_Sub_Selector : out STD_LOGIC;
                   Jump_Flag : out STD_LOGIC;
                   Jump_Address : out STD_LOGIC_VECTOR (2 downto 0)
               );
    End Component;
    
    --Program Counter
    Component Program_Counter
         Port (   Reset : in STD_LOGIC;
                  Clk : in STD_LOGIC;
                  Next_Address : in STD_LOGIC_VECTOR (2 downto 0);
                  Memory_Select : out STD_LOGIC_VECTOR (2 downto 0)
              );
    End Component;
   
   --3-Bit Adder
   Component Three_Bit_Adder
        Port (  A : in STD_LOGIC_VECTOR(2 downto 0);
                B : in STD_LOGIC_VECTOR(2 downto 0);
                Sum : out STD_LOGIC_VECTOR(2 downto 0);
                Carry : out STD_LOGIC
            );
   End Component;
   
   Component Multi_8_way_4_bit
       Port (     D_0 : in STD_LOGIC_VECTOR (3 downto 0);           
                  D_1 : in STD_LOGIC_VECTOR (3 downto 0);
                  D_2 : in STD_LOGIC_VECTOR (3 downto 0);
                  D_3 : in STD_LOGIC_VECTOR (3 downto 0);
                  D_4 : in STD_LOGIC_VECTOR (3 downto 0);
                  D_5 : in STD_LOGIC_VECTOR (3 downto 0);
                  D_6 : in STD_LOGIC_VECTOR (3 downto 0);
                  D_7 : in STD_LOGIC_VECTOR (3 downto 0);
                  S : in STD_LOGIC_VECTOR (2 downto 0);
                  Y_4 : out STD_LOGIC_VECTOR (3 downto 0)
              );
   End Component;

   Component Multi_2_way_3_bit
       Port (     D_0 : in STD_LOGIC_VECTOR (2 downto 0);
                  D_1 : in STD_LOGIC_VECTOR (2 downto 0);
                  S : in STD_LOGIC;
                  Y_3 : out STD_LOGIC_VECTOR (2 downto 0));
   End Component;

   Component Multi_2_way_4_bit
       Port (     D_0 : in STD_LOGIC_VECTOR (3 downto 0);
                  D_1 : in STD_LOGIC_VECTOR (3 downto 0); 
                  S : in STD_LOGIC;
                  Y_4 : out STD_LOGIC_VECTOR (3 downto 0));
   End Component;
   
   Component Program_ROM
       Port (     Address : in STD_LOGIC_VECTOR (2 downto 0);
                  Instruction_Out : out STD_LOGIC_VECTOR (11 downto 0));
   End Component;
   
   signal Clk_Sig : STD_LOGIC;
   --PROGRAM COUNTER SIGNALS
   signal Address_IN, Address_OUT : STD_LOGIC_VECTOR (2 downto 0);
   --INSTRUCTION DECODER SIGNALS
   signal Instruction_Bus : STD_LOGIC_VECTOR (11 downto 0);
   signal Reg_Enabler, Reg_A_Selector, Reg_B_Selector, Jump_Address : STD_LOGIC_VECTOR (2 downto 0);
   signal Imd_Value : STD_LOGIC_VECTOR (3 downto 0);
   signal Reg_Bank_Enabler, Load_Selector, Add_Sub_Selector, Jump_Flag : STD_LOGIC;
   --DATA BUSES
   signal Data_Bus_1, Data_Bus_2, Data_Bus_3, Data_Bus_4, Data_Bus_5, Data_Bus_6, Data_Bus_7, Data_Bus_8:  STD_LOGIC_VECTOR (3 downto 0);
   --ADD SUBTRACT UNIT
   signal Reg_A_OUT, Reg_B_OUT, Add_Sub_OUT : STD_LOGIC_VECTOR (3 downto 0);
   signal Zero, Overflow : STD_LOGIC;
   signal Register_Bank_IN : STD_LOGIC_VECTOR (3 downto 0);
   --THREE BIT ADDER
   signal Adder_OUT : STD_LOGIC_VECTOR (2 downto 0);
   signal Adder_Carry : STD_LOGIC;
   
Begin

SlowClk : Slow_Clk 
    Port Map(
        Clk_IN => Clk,
        Clk_OUT => Clk_Sig );

ProgramCounter : Program_Counter
    Port Map(
        Reset => Res,
        Clk => Clk_Sig,
        Next_Address => Address_IN,
        Memory_Select => Address_OUT);
        
ProgramROM : Program_ROM
    Port Map(
        Address => Address_OUT,
        Instruction_OUT => Instruction_Bus);
        
InstructionDecoder : Instruction_Decoder
    Port Map(
        Instruction => Instruction_Bus,
        Reg_Jump_Check => Reg_A_OUT,
        Reg_Enabler => Reg_Enabler,
        Reg_A_Selector => Reg_A_Selector,
        Reg_B_Selector => Reg_B_Selector,
        Reg_Bank_Enabler => Reg_Bank_Enabler,
        Load_Selector => Load_Selector,
        Imd_Value => Imd_Value,
        Add_Sub_Selector => Add_Sub_Selector,
        Jump_Flag => Jump_Flag,
        Jump_Address => Jump_Address);

Mux_8_way_4_bit_A : Multi_8_way_4_bit
    Port Map(
         D_0 => Data_Bus_1,
         D_1 => Data_Bus_2,
         D_2 => Data_Bus_3,
         D_3 => Data_Bus_4,
         D_4 => Data_Bus_5,
         D_5 => Data_Bus_6,
         D_6 => Data_Bus_7,
         D_7 => Data_Bus_8,
         S => Reg_A_Selector,
         Y_4 => Reg_A_OUT);
         
Mux_8_way_4_bit_B : Multi_8_way_4_bit
     Port Map(
          D_0 => Data_Bus_1,
          D_1 => Data_Bus_2,
          D_2 => Data_Bus_3,
          D_3 => Data_Bus_4,
          D_4 => Data_Bus_5,
          D_5 => Data_Bus_6,
          D_6 => Data_Bus_7,
          D_7 => Data_Bus_8,
          S => Reg_B_Selector,
          Y_4 => Reg_B_OUT);

Adder_Subtractor : Add_Sub
    Port Map(
        A => Reg_A_OUT,
        B => Reg_B_OUT,
        Sub => Add_Sub_Selector,
        Sum => Add_Sub_OUT,
        Overflow => Overflow,
        Zero => Zero);
        
Register_IN_Selector : Multi_2_way_4_bit
    Port Map(
         D_0 => Add_Sub_OUT,
         D_1 => Imd_Value,
         S => Load_Selector,
         Y_4 => Register_Bank_IN);

RegisterBank : Register_Bank
    Port Map(
         Clk => Clk_Sig,
         Reg_Sel => Reg_Enabler,
         RegBank_IN => Register_Bank_IN,
         R0 => Data_Bus_1,
         R1 => Data_Bus_2,
         R2 => Data_Bus_3,
         R3 => Data_Bus_4,
         R4 => Data_Bus_5,
         R5 => Data_Bus_6,
         R6 => Data_Bus_7,
         R7 => Data_Bus_8);
         
Adder_3_Bit : Three_Bit_Adder
    Port Map(
        A => Address_OUT,
        B => "001",
        Sum => Adder_OUT,
        Carry => Adder_Carry);
 
Address_Selector : Multi_2_way_3_bit
    Port Map(
        D_0 => Adder_OUT,
        D_1 => Jump_Address,
        S => Jump_Flag,
        Y_3 => Address_IN);

Zero_Flag <= Zero;
Overflow_Flag <= Overflow;
end Behavioral;
