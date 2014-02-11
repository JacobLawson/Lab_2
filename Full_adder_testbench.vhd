--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:29:40 02/11/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Jacob.Lawson/Documents/Academics/Sophomore Year/Spring/4 ECE 281/Xilinx/Lab2/Full_adder_testbench.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Full_Adder
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
--USE ieee.numeric_std.ALL;
 
ENTITY Full_adder_testbench IS
END Full_adder_testbench;
 
ARCHITECTURE behavior OF Full_adder_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Full_Adder
    PORT(
         Ain : IN  std_logic;
         Bin : IN  std_logic;
         Cin : IN  std_logic;
         Sum : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ain : std_logic := '0';
   signal Bin : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal Sum : std_logic;
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Full_Adder PORT MAP (
          Ain => Ain,
          Bin => Bin,
          Cin => Cin,
          Sum => Sum,
          Cout => Cout
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
	

-- 1st line of truth table
       Ain <= '0';
       Bin <= '0';
       Cin <= '0';
       wait for 100 ns;

-- 2nd line of truth table
       Ain <= '0';
       Bin <= '0';
       Cin <= '1';
       wait for 100 ns;

-- 3rd line of truth table
       Ain <= '0';
       Bin <= '1';
       Cin <= '0';
       wait for 100 ns;

-- 4th line of truth table
       Ain <= '0';
       Bin <= '1';
       Cin <= '1';
       wait for 100 ns;

-- 5th line of truth table
       Ain <= '1';
       Bin <= '0';
       Cin <= '0';
       wait for 100 ns;

-- 6th line of truth table
       Ain <= '1';
       Bin <= '0';
       Cin <= '1';
       wait for 100 ns;

-- 7th line of truth table
       Ain <= '1';
       Bin <= '1';
       Cin <= '0';
       wait for 100 ns;

-- 8th line of truth table
       Ain <= '1';
       Bin <= '1';
       Cin <= '1';
       wait for 100 ns;
      

      -- insert stimulus here 

      wait;
   end process;

END;
