----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:27:23 02/11/2014 
-- Design Name: 
-- Module Name:    Full_Adder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_Adder is            --The design takes 2 inputs, and adds them 
                                --together along with a carry in. The sum and carry are the resulting outputs
    Port ( Ain : in  STD_LOGIC;
           Bin : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end Full_Adder;

architecture Behavioral of Full_Adder is

--These are the internal signals or wires needed to be declared in order to complete the circuit.

Signal AB : std_logic;
Signal ACin : std_logic;
Signal BCin : std_logic;

begin

--These are just the logic operations used to compute the signals/wires, which are then used to compute the output.

AB <= Ain and Bin;
ACin <= Ain and Cin;
BCin <= Bin and Cin;
Sum <= Ain xor Bin xor Cin;
Cout <= AB or ACin or BCin;


end Behavioral;

