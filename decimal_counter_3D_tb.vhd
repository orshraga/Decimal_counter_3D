----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2023 04:20:57 PM
-- Design Name: 
-- Module Name: decimal_counter_3D_tb - Behavioral
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

entity decimal_counter_3D_tb is
--  Port ( );
end decimal_counter_3D_tb;

architecture Behavioral of decimal_counter_3D_tb is

component decimal_counter_3D
port(clk_100M,reset: in std_logic;
TOP_COUNT: in std_logic_vector (3 downto 0);
seven_seg : out std_logic_vector (6 downto 0);
anode: out std_logic_vector (2 downto 0);
Led: out std_logic);
end component;
signal  Led:std_logic;
signal TOP_COUNT : std_logic_vector (3 downto 0);
signal anode :std_logic_vector (2 downto 0);
signal seven_seg: std_logic_vector (6 downto 0);
signal clk_100M: std_logic:='1';
signal reset: std_logic:='1';




begin
U: decimal_counter_3D port map(clk_100M=>clk_100M, reset=>reset,TOP_COUNT=>TOP_COUNT,seven_seg=>seven_seg,anode=>anode,Led=>Led);
clk_100M <= not clk_100M after 5 ns;
TOP_COUNT<="0011";
process
begin
wait for 2 ms;
reset<='0';
wait;
end process;

end Behavioral;
