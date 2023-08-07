----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2023 01:13:22 PM
-- Design Name: 
-- Module Name: divider_tb - Behavioral
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

entity divider_tb is
--  Port ( );
end divider_tb;

architecture Behavioral of divider_tb is
component divider 
    Port (
        clk_100M,reset: in std_logic;
        clk_500: out std_logic);

end component;
signal reset,clk_500 : std_logic;   
signal clk_100M: std_logic:='1';

begin
U: divider port map (clk_100M=>clk_100M,reset=>reset,clk_500=>clk_500);
clk_100M <= not clk_100M after 5 ns;  
process
begin 
reset<='1'; wait for 55 ns;
reset<='0'; wait for 20 ms;
reset<='1';
wait;
end process;
end Behavioral;
