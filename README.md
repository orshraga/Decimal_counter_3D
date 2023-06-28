<h1>Decimal Counter 3 digits</h1>

<h2>Description</h2>
In this lab we will design a decimal counter system called "D3_counter_decimal" that has three decimal digits containing
Input/output as follows:
Input:
reset: synchronous, when '1' resets the system, when '0' is passive.
M100_clk: clock input.
count_Top: A four-bit vector that determines the maximum value per share (NNN).

output:
seg_seven: A seven-bit vector, representing the decimal digit in the display segment.
anode: A vector of three bits, the value '0' activates the anode of the corresponding digit in 7 segment.
Led: '1' activates an LED, '0' does not activate.
<br />


<h2>Languages and Utilities Used</h2>

- <b>VHDL</b> 
- <b>Basys 3 Xilinx FPGA development board</b>

<h2>Environments Used </h2>

- <b>Vivado</b>

<h2>Program walk-through:</h2>

<p align="center">
Block Diagram: <br/>
<img src="https://i.imgur.com/cAQB8pI.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
<br />
Simulation: <br/>
<img src="https://i.imgur.com/ShdzyWf.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>

</p>

<!--
 ```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```
--!>
