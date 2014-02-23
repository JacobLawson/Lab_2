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

entity add_sub is -- This is the 4 bit adder design. It has 2 4 bit inputs which it adds together to produce 1 4 bit output
    Port ( Ain : in  STD_LOGIC_VECTOR (3 downto 0);
           Bin : in  STD_LOGIC_VECTOR (3 downto 0);
           Sum : out  STD_LOGIC_VECTOR (3 downto 0);
			  Cout : out STD_LOGIC_VECTOR (3 downto 0);
			  Sub : in STD_LOGIC;
			  Overflow : out STD_LOGIC);
end add_sub;

architecture Structural of add_sub is

component Full_Adder is 		-- The design is structural, so it uses 4 blocks of full adders, 1 for each bit. Each adder adds up the bit it is assigned
					--and then produces it's outputs to the next block
		port (Ain : in STD_LOGIC;
				Bin : in STD_LOGIC;
				Cin : in STD_LOGIC;
				Sum : out STD_LOGIC;
				Cout : out STD_LOGIC);
				
end component Full_Adder;

Signal Carry : STD_LOGIC_VECTOR (3 downto 0); --Cin could not be used as an output, so another carry array was needed 
Signal Store : STD_LOGIC_VECTOR (3 downto 0); --Stored the input of B so that 2's complement conversion could be performed on it
Signal Bcomp : STD_LOGIC_VECTOR (3 downto 0); --This was the vector that was actually added. Its value changed depending on if sub=1. Sub was determined by a button press

begin

Store <= Bin;

Bcomp <= Store when Sub= '0'
					else STD_LOGIC_VECTOR (SIGNED(not Store)+1) when Sub ='1';
	
--Each individual bit was then calculated by declaring the port map of each adder below.

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

--Overflow was then calculated by the statement below. More discussion about why this was done can be found in the readme.

				
Overflow <= Carry(3) xor Carry(2);
			
end Structural;

