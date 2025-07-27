----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 10:47:06 PM
-- Design Name: 
-- Module Name: Nanoprocessor_TOP - Behavioral
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

entity Nanoprocessor_TOP is
    Port (
        Clk     : in STD_LOGIC;
        Reset   : in STD_LOGIC;
        Sub     : in STD_LOGIC;
        Reg_Sel : in STD_LOGIC_VECTOR(2 downto 0);
        data    : out STD_LOGIC_VECTOR(3 downto 0);
        Overflow_flag : out STD_LOGIC;
        Zero_flag : out STD_LOGIC
    );
end Nanoprocessor_TOP;

architecture Behavioral of Nanoprocessor_TOP is

    signal RegBank_DataOut : STD_LOGIC_VECTOR(3 downto 0);
    signal RegBank_Out0, RegBank_Out1, RegBank_Out2, RegBank_Out3, RegBank_Out4, RegBank_Out5, RegBank_Out6, RegBank_Out7 : STD_LOGIC_VECTOR(3 downto 0);

    component Register_Bank
        Port(
            Clk          : in STD_LOGIC;
            Reg_Sel      : in STD_LOGIC_VECTOR(2 downto 0);
            RegBank_IN   : in STD_LOGIC_VECTOR(3 downto 0);
            R0,R1,R2,R3,R4,R5,R6,R7 : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component Mux_8_Way_4_Bit
        Port(
            D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7 : in STD_LOGIC_VECTOR(3 downto 0);
            S : in STD_LOGIC_VECTOR(2 downto 0);
            Y_4 : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component Add_Sub
        Port(
            A,B : in STD_LOGIC_VECTOR(3 downto 0);
            Sub : in STD_LOGIC;
            Sum : out STD_LOGIC_VECTOR(3 downto 0);
            Overflow : out STD_LOGIC;
            Zero : out STD_LOGIC
        );
    end component;

begin

    RegisterBank_inst: Register_Bank
    port map(
        Clk => Clk,
        Reg_Sel => Reg_Sel,
        RegBank_IN => "0101",
        R0 => RegBank_Out0, R1 => RegBank_Out1, R2 => RegBank_Out2, R3 => RegBank_Out3,
        R4 => RegBank_Out4, R5 => RegBank_Out5, R6 => RegBank_Out6, R7 => RegBank_Out7
    );

    Mux8Way_inst: Mux_8_Way_4_Bit
    port map(
        D_0 => RegBank_Out0, D_1 => RegBank_Out1, D_2 => RegBank_Out2, D_3 => RegBank_Out3,
        D_4 => RegBank_Out4, D_5 => RegBank_Out5, D_6 => RegBank_Out6, D_7 => RegBank_Out7,
        S => Reg_Sel,
        Y_4 => RegBank_DataOut
    );

    AddSub_inst: Add_Sub
    port map(
        A => RegBank_DataOut,
        B => "0011",
        Sub => Sub,
        Sum => data,
        Overflow => Overflow_flag,
        Zero => Zero_flag
    );

end Behavioral;
