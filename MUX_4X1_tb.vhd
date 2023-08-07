----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2023 04:26:58 PM
-- Design Name: 
-- Module Name: MUX_4X1_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_4X1_tb is
--  Port ( );
end MUX_4X1_tb;

architecture Behavioral of MUX_4X1_tb is
component MUX_4X1
port(input0,input1,input2,input3 : in integer range 0 to 9;
    sel: in std_logic_vector (1 downto 0);
    output: out integer range 0 to 9);
end component;
signal input0,input1,input2,input3,output : integer range 0 to 9; 
signal sel : std_logic_vector (1 downto 0);
begin
U: MUX_4X1 port map(input0=>input0,input1=>input1,input2=>input2,input3=>input3,sel=>sel,output=>output);
input0<=5;
input1<=6;
input2<=7;
input3<=8;
process
begin 
sel<="00"; wait for 10 ns;
sel<="01"; wait for 10 ns;
sel<="10"; wait for 10 ns;
sel<="11"; wait for 10 ns;



wait;
end process;
end Behavioral;
