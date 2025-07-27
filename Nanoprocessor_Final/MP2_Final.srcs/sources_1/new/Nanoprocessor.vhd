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

entity Nanoprocessor is
    Port(
        Clk : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Zero_flag : out STD_LOGIC;
        Overflow_flag : out STD_LOGIC:='0';
        data : out STD_LOGIC_VECTOR (3 downto 0)
        );
         
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is

signal Clk_Sig: STD_LOGIC;
signal Address_IN, Address_OUT : STD_LOGIC_VECTOR (2 downto 0);


   --ADDER-SUBTRACTOR UNIT SIGNALS
signal Reg_A_OUT, Reg_B_OUT, Add_Sub_OUT : STD_LOGIC_VECTOR (3 downto 0);
signal Reg_A_Select, Reg_B_Select : STD_LOGIC_VECTOR (2 downto 0);
signal Overflow, Zero : STD_LOGIC;



   --INSTRUCTION DECODER SIGNALS
signal Instruction_Bus : STD_LOGIC_VECTOR (11 downto 0);
signal reg_enable, jump_address : STD_LOGIC_VECTOR (2 downto 0);
signal immediate_value : STD_LOGIC_VECTOR (3 downto 0);
signal load_select, add_sub_select, Jump_Flag: STD_LOGIC;
signal Opcode : STD_LOGIC_VECTOR (1 downto 0);

  --THREE BIT ADDER SIGNALS
signal Adder_OUT : STD_LOGIC_VECTOR (2 downto 0);
signal Adder_Carry : STD_LOGIC;

  --REGISTER SIGNALS
signal Register_Bank_IN : STD_LOGIC_VECTOR (3 downto 0);
signal Data_Bus_0, Data_Bus_1, Data_Bus_2, Data_Bus_3, Data_Bus_4, Data_Bus_5, Data_Bus_6, Data_Bus_7:  STD_LOGIC_VECTOR (3 downto 0);

 
Component Slooow_Ckk
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
  Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);
         Instruction_Out : out STD_LOGIC_VECTOR (11 downto 0));
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
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0);
           Opcode : out STD_LOGIC_VECTOR (1 downto 0)
       );
    End Component;
    
Component Register_Bank
    Port ( 
            Clk          : in  STD_LOGIC;
            Reg_Sel      : in  STD_LOGIC_VECTOR (2 downto 0);
            Reset        : in  STD_LOGIC;
            RegBank_IN   : in  STD_LOGIC_VECTOR (3 downto 0);
            R0, R1, R2, R3, R4, R5, R6, R7  : out STD_LOGIC_VECTOR (3 downto 0)
        );
End Component;
  
Component Mux_2_way_4_bit
    Port (D_0 : in STD_LOGIC_VECTOR (3 downto 0);
          D_1 : in STD_LOGIC_VECTOR (3 downto 0); 
          S : in STD_LOGIC;
          Y_4 : out STD_LOGIC_VECTOR (3 downto 0));
End Component;

Component Mux_8_Way_4_Bit
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


begin

SlowClk : Slooow_Ckk 
    Port Map(
        Clk_IN => Clk,
        Clk_OUT => Clk_Sig);

Adder_3_Bit : Three_Bit_Adder
    Port Map(
        A => Address_OUT,
        B => "001",
        Sum => Adder_OUT,
        Carry => Adder_Carry); 
        

Address_Selector : Mux_2_way_3_bit
    Port Map(
        D_0 => Adder_OUT,
        D_1 => Jump_Address,
        S => Jump_Flag,
        Y_3 => Address_IN);
        
ProgramCounter : Program_Counter 
    Port Map(
        RESET => Reset,
        CLK => Clk_Sig,
        Next_Address => Address_IN,
        Memory_Select => Address_OUT);
        
ProgramROM : Program_ROM
    Port Map(
        Address => Address_OUT, 
        Instruction_Out => Instruction_Bus);

        
InstructionDecoder : Instruction_Decoder
    Port Map(
        Instruction => Instruction_Bus,
        Reg_Jump_Check => Reg_A_OUT,
        Reg_Enabler => reg_enable,
        Reg_A_Selector => Reg_A_select,
        Reg_B_Selector => Reg_B_select,
        Load_Selector => load_select,
        Imd_Value => immediate_value,
        Add_Sub_Selector => add_sub_select,
        Jump_Flag => Jump_Flag,
        Jump_Address => jump_address,
        Opcode => Opcode);
        
Mux_Register_InputSelect : Mux_2_way_4_bit
    Port Map(
        D_0 => Add_Sub_OUT,
        D_1 => immediate_value,
        S => load_select,
        Y_4 => Register_Bank_IN
    );
    
RegisterBank : Register_Bank
        Port Map(
             Clk => Clk_Sig,
             Reg_Sel => reg_enable,
             RegBank_IN => Register_Bank_IN,
             Reset => Reset, 
             R0 => Data_Bus_0,
             R1 => Data_Bus_1,
             R2 => Data_Bus_2,
             R3 => Data_Bus_3,
             R4 => Data_Bus_4,
             R5 => Data_Bus_5,
             R6 => Data_Bus_6,
             R7 => Data_Bus_7);
             
Mux_Reg_A_AddSub : Mux_8_Way_4_Bit
         Port Map(
              D_0 => Data_Bus_0,
              D_1 => Data_Bus_1,
              D_2 => Data_Bus_2,
              D_3 => Data_Bus_3,
              D_4 => Data_Bus_4,
              D_5 => Data_Bus_5,
              D_6 => Data_Bus_6,
              D_7 => Data_Bus_7,
              S => Reg_A_Select,
              Y_4 => Reg_A_OUT);
              
Mux_Reg_B_AddSub : Mux_8_Way_4_Bit
         Port Map(
              D_0 => Data_Bus_0,
              D_1 => Data_Bus_1,
              D_2 => Data_Bus_2,
              D_3 => Data_Bus_3,
              D_4 => Data_Bus_4,
              D_5 => Data_Bus_5,
              D_6 => Data_Bus_6,
              D_7 => Data_Bus_7,
              S => Reg_B_Select,
              Y_4 => Reg_B_OUT);

Adder_Subtractor : Add_Sub
    Port Map(
        A => Reg_A_OUT,
        B => Reg_B_OUT,
        Sub => add_sub_select,
        Sum => Add_Sub_OUT,
        Overflow => Overflow,
        Zero => Zero);        
    
data <= Data_Bus_7;

process(Clk_Sig)
begin
  if rising_edge(Clk_Sig) then
    if Opcode(1) = '1' then
      Zero_flag <= '0';
      Overflow_flag <= '0';
    else
      Zero_flag <= Zero;
      Overflow_flag <= Overflow;
    end if;
  end if;
end process;



end Behavioral;