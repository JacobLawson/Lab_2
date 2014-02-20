----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:20:47 02/11/2014 
-- Design Name: 
-- Module Name:    add_sub - Structural 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add_sub is
    Port ( Ain : in  STD_LOGIC_VECTOR (3 downto 0);
           Bin : in  STD_LOGIC_VECTOR (3 downto 0);
           Sum : out  STD_LOGIC_VECTOR (3 downto 0);
			  Cout : out STD_LOGIC_VECTOR (3 downto 0);
			  Sub : in STD_LOGIC;
			  Overflow : out STD_LOGIC);
end add_sub;

architecture Structural of add_sub is

component Full_Adder is
		port (Ain : in STD_LOGIC;
				Bin : in STD_LOGIC;
				Cin : in STD_LOGIC;
				Sum : out STD_LOGIC;
				Cout : out STD_LOGIC);
				
end component Full_Adder;

Signal Carry : STD_LOGIC_VECTOR (3 downto 0);
Signal Store : STD_LOGIC_VECTOR (3 downto 0);
Signal Bcomp : STD_LOGIC_VECTOR (3 downto 0);

begin

Store <= Bin;

Bcomp <= Store when Sub= '0'
					else STD_LOGIC_VECTOR (SIGNED(not Store)+1) when Sub ='1';
					
Bit0: component Full_Adder
	PORT MAP(Ain => Ain(0),
				Bin => Bcomp(0),
				Cin => '0',
				Sum => Sum(0),
				Cout => Carry(0)
				);

Bit1: component Full_Adder
	PORT MAP(Ain => Ain(1),
				Bin => Bcomp(1),
				Cin => Carry(0),
				Sum => Sum(1),
				Cout => Carry(1)
				);
				
Bit2: component Full_Adder
	PORT MAP(Ain => Ain(2),
				Bin => Bcomp(2),
				Cin => Carry(1),
				Sum => Sum(2),
				Cout => Carry(2)
				);
				
Bit3: component Full_Adder
	PORT MAP(Ain => Ain(3),
				Bin => Bcomp(3),
				Cin => Carry(2),
				Sum => Sum(3),
				Cout => Carry(3)
				);
				
Overflow <= Carry(3) xor Carry(2);
			
end Structural;

