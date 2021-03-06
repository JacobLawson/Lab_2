--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:51:20 02/18/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Jacob.Lawson/Documents/Academics/Sophomore Year/Spring/4 ECE 281/Xilinx/Lab2/four_testbench.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: add_sub
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
 
ENTITY four_testbench IS
END four_testbench;
 
ARCHITECTURE behavior OF four_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT add_sub
    PORT(
         Ain : IN  std_logic_vector(3 downto 0);
         Bin : IN  std_logic_vector(3 downto 0);
         Sum : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic_vector(3 downto 0);
         Sub : IN  std_logic;
         Overflow : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ain : std_logic_vector(3 downto 0) := (others => '0');
   signal Bin : std_logic_vector(3 downto 0) := (others => '0');
   signal Sub : std_logic := '0';

 	--Outputs
   signal Sum : std_logic_vector(3 downto 0);
   signal Cout : std_logic_vector(3 downto 0);
   signal Overflow : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: add_sub PORT MAP (
          Ain => Ain,
          Bin => Bin,
          Sum => Sum,
          Cout => Cout,
          Sub => Sub,
          Overflow => Overflow
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

   for i in 0 to 15 loop			--The for loops just goes through every combination of numbers
                                
        for j in 0 to 15 loop
                                
             wait for 10 ns;
                                                
                   Bin <= std_logic_vector(to_signed(j,4));	
                         end loop;
                                
                   Ain <= std_logic_vector(to_signed(i,4));
                   
                   --This is the self check part. It checks to see if the value is correct first,
                   --and will produce the correct output when needed.
						 
						 assert Sum=Ain+Bin report "incorrect! A is " 
	
	& std_logic'image(Ain(3)) & std_logic'image(Ain(2)) & std_logic'image(Ain(1)) & std_logic'image(Ain(0)) & "B is " 
	& std_logic'image(Bin(3)) & std_logic'image(Bin(2)) & std_logic'image(Bin(1)) & std_logic'image(Bin(0));
								 end loop;

sub <= '1';

wait for 10 ns;

   for i in 0 to 15 loop
                                
        for j in 0 to 15 loop
                                
             wait for 10 ns;
                                                
                   Bin <= std_logic_vector(to_signed(j,4));
                         end loop;
                                
                   Ain <= std_logic_vector(to_signed(i,4));
						 assert Sum=Ain-Bin report "incorrect! A is " 
	
	& std_logic'image(Ain(3)) & std_logic'image(Ain(2)) & std_logic'image(Ain(1)) & std_logic'image(Ain(0)) & "B is " 
	& std_logic'image(Bin(3)) & std_logic'image(Bin(2)) & std_logic'image(Bin(1)) & std_logic'image(Bin(0));
								 end loop;
      -- insert stimulus here 

      wait;
   end process;

END;
