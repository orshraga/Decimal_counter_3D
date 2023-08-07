----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2023 04:34:00 PM
-- Design Name: 
-- Module Name: ANODE_ENCODER_tb - Behavioral
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

entity ANODE_ENCODER_tb is
--  Port ( );
end ANODE_ENCODER_tb;

architecture Behavioral of ANODE_ENCODER_tb is
component ANODE_ENCODER
port(input: in std_logic_vector(2 downto 0);
     output: out std_logic_vector(1 downto 0));
end component;
signal input:  std_logic_vector(2 downto 0);
signal  output: std_logic_vector(1 downto 0);
begin
U: ANODE_ENCODER port map(input=>input,output=>output);
process
begin
input <= "110"; wait for 10 ns;
input <= "101"; wait for 10 ns;
input <= "011"; wait for 10 ns;
input <= "111"; wait for 10 ns;


wait;
end process;
end Behavioral;
