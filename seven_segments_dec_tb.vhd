----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2023 04:45:20 PM
-- Design Name: 
-- Module Name: seven_segments_dec_tb - Behavioral
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

entity seven_segments_dec_tb is
--  Port ( );
end seven_segments_dec_tb;

architecture Behavioral of seven_segments_dec_tb is
component seven_segments_dec 
port(input: in integer range 0 to 9;
     output : out std_logic_vector (6 downto 0));
end component;
signal input : integer range 0 to 9;
signal output :  std_logic_vector (6 downto 0);
begin
U: seven_segments_dec port map(input=>input,output=>output);
process
begin
for i in 0 to 9 loop
input <= i;
wait for 10 ns;
end loop;

wait;
end process;
end Behavioral;
