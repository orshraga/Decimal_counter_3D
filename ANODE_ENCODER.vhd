----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2023 04:31:33 PM
-- Design Name: 
-- Module Name: ANODE_ENCODER - Behavioral
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

entity ANODE_ENCODER is
port(input: in std_logic_vector(2 downto 0);
     output: out std_logic_vector(1 downto 0));
end ANODE_ENCODER;

architecture Behavioral of ANODE_ENCODER is

begin
with input select
output <= "00" when "110",
          "01" when "101",
          "10" when "011",
          "XX" when others;

end Behavioral;
