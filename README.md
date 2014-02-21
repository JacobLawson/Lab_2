Lab_2
=====

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


## Discussion of PreLab
The results of the truth table when compared to the actual simulation results are very promising. I went through each line individually along with the truth table to compare results, and all of the outputs match up with the prescribed inputs.

![alt  text](http://i61.tinypic.com/fvfm7q.png)


## Discussion of Main Lab

THe purpose of this lab was to build a 4 bit adder, and then implement said 4 bit adder into a subtractor when a certain input was pressed. Another goal was to detect overflow and make a self checking testbench.

The design began with the prelab, or the construction of a 1 bit full adder. This was done in a behavioral sense and all the gates and outputs/signals were defined. After verifying the design of the 1 bit adder and getting a better understanding of it, the 1 bit adder was modularized in a sense to build the 4 bit adder.

The 4 bit adder was built using structural programming, with the components of the full adder being made of 4 1 bit adders. Ain and Bin were input via the switches, and the carry out values of the adders were fed into the next adder.

To implement the subtraction functionality, another input via button press was defined. When this button was pressed, it started a process of inverting Bin and then adding a binary value of 1 to the input array. This in turn converted the input into a negative 2's complement of itself, which when added to Ain served as a way to subtract B from A. The final circuit schematic can be seen below.

![alt text](http://i62.tinypic.com/20u90mf.png)
