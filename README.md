Lab 2
=====

The truth table of the full adder along with waveform can be seen below

| Inputs  |  | | Outputs| |
| ------------- |:-------------:| :-----:| :-----:| -----:|
| Ain          |Bin       |Cin       |Sum       |Cout       |
| 0          |0       |0       |0       |0       |
| 0          |0       |1       |1       |0       |
| 0          |1       |0       |1       |0       |
| 0          |1       |1       |0       |1       |
| 1          |0       |0       |1       |0       |
| 1          |0       |1       |0       |1       |
| 1          |1       |0       |0       |1       |
| 1          |1       |1       |1       |1       |

![alt text](http://i59.tinypic.com/2n9dun5.png)

## Discussion of PreLab
The results of the truth table when compared to the actual simulation results are very promising. I went through each line individually along with the truth table to compare results, and all of the outputs match up with the prescribed inputs. The schematic of the full adder an be seen below

![alt text](http://i62.tinypic.com/bi72m9.jpg)

-----------------------------------------------------------------------------------------
##  
-----------------------------------------------------------------------------------------

## Discussion of Main Lab

The purpose of this lab was to build a 4 bit adder, and then implement said 4 bit adder into a subtractor when a certain input was pressed. Another goal was to detect overflow and make a self checking testbench. The results of the simulation can be seen below

![alt text](http://i61.tinypic.com/fvfm7q.png)

Because of the high amount of combinations that could be found in the truth table, I just checked a few of the combinations at random and checked to see if the outputs were correct. After about 10 successful checks, I was able to reasonably assume the simulation was correct and moved on.

The design began with the prelab, or the construction of a 1 bit full adder. This was done in a behavioral sense and all the gates and outputs/signals were defined. After verifying the design of the 1 bit adder and getting a better understanding of it, the 1 bit adder was modularized in a sense to build the 4 bit adder.

The 4 bit adder was built using structural programming, with the components of the full adder being made of 4 1 bit adders. Ain and Bin were input via the switches, and the carry out values of the adders were fed into the next adder.

To implement the subtraction functionality, another input via button press was defined. When this button was pressed, it started a process of inverting Bin and then adding a binary value of 1 to the input array. This in turn converted the input into a negative 2's complement of itself, which when added to Ain served as a way to subtract B from A. Afterwards, overflow detection was added by XORing the last 2 carry out bits. The logic behind this was that if there was final carry out value of 1, and the carry preceding it had a value of 1, it would still be a valid negative number. Conversely, a number with a carry out value of 0, and a carry preceding it had a value of 0, the number would still be a valid positive number. The other two cases with carrys of 10 and 01 would reflect an overflow in either the positive or negative domain of 2's complement numbers. The final circuit schematic can be seen below.

![alt text](http://i62.tinypic.com/20u90mf.png)
