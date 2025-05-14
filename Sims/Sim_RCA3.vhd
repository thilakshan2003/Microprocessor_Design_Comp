library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench for the 3-bit Ripple Carry Adder
entity Sim_RCA3 is
end Sim_RCA3;

architecture Behavioral of Sim_RCA3 is

-- Component Declaration for the 3-bit Adder
component Three_Bit_Adder
    Port (
        A     : in  STD_LOGIC_VECTOR(2 downto 0);
        B     : in  STD_LOGIC_VECTOR(2 downto 0);
        Sum   : out STD_LOGIC_VECTOR(2 downto 0);
        Carry : out STD_LOGIC
    );
end component;

-- Test signals
signal A, B     : STD_LOGIC_VECTOR(2 downto 0);
signal Sum      : STD_LOGIC_VECTOR(2 downto 0);
signal Carry    : STD_LOGIC;

begin
-- UUT (Unit Under Test) Instantiation
UUT: Three_Bit_Adder
    Port Map (
        A     => A,
        B     => B,
        Sum   => Sum,
        Carry => Carry
    );

    -- Test process
process
begin
    -- Test Case 1: A = 011, B = 101, expected Sum = 000, Carry = 1
    A <= "011"; 
    B <= "101"; 
    wait for 100 ns;

    -- Test Case 2: A = 010, B = 010, expected Sum = 000, Carry = 0
    A <= "010"; 
    B <= "010"; 
    wait for 100 ns;

    -- Test Case 5: A = 101, B = 010, expected Sum = 111, Carry = 0
    A <= "101"; 
    B <= "010"; 
    wait for 100 ns;

    -- Test Case 6: A = 110, B = 011, expected Sum = 001, Carry = 1
    A <= "110"; 
    B <= "011"; 
    wait for 100 ns;

    -- Stop the simulation after all tests
    wait;
end process;

end Behavioral;
