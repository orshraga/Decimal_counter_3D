----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2023 04:39:36 PM
-- Design Name: 
-- Module Name: seven_segments_dec - Behavioral
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

entity seven_segments_dec is
port(input: in integer range 0 to 9;
     output : out std_logic_vector (6 downto 0));
end seven_segments_dec;

architecture Behavioral of seven_segments_dec is

begin
with input select
output <= "0000001" when 0,
          "1001111" when 1,
          "0010010" when 2,
          "0000110" when 3,
          "1001100" when 4,
          "0100100" when 5,
          "0100000" when 6,
          "0001111" when 7,
          "0000000" when 8,
          "0000100" when 9,
          "XXXXXXX" when others;

end Behavioral;
