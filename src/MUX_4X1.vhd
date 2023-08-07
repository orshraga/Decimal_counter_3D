----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2023 04:22:14 PM
-- Design Name: 
-- Module Name: MUX_4X1 - Behavioral
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

entity MUX_4X1 is
port(input0,input1,input2,input3 : in integer range 0 to 9;
    sel: in std_logic_vector (1 downto 0);
    output: out integer range 0 to 9);
end MUX_4X1;

architecture Behavioral of MUX_4X1 is

begin
with sel select
output <= input0 when "00",
          input1 when "01",
          input2 when "10",
          input3 when others;

end Behavioral;
