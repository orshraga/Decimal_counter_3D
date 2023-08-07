----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2023 03:06:52 PM
-- Design Name: 
-- Module Name: counter_tb - Behavioral
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

entity counter_tb is
--  Port ( );
end counter_tb;

architecture Behavioral of counter_tb is
component counter
port(EN, CLR,RST, clk: in std_logic;
     TOP_COUNT: in std_logic_vector(3 downto 0);
     Q: out integer range 0 to 9;
     TOP_CNT_REACH, REACH_9: out std_logic);
end component;
signal EN, CLR,RST,TOP_CNT_REACH, REACH_9: std_logic;
signal TOP_COUNT: std_logic_vector(3 downto 0);
signal Q: integer range 0 to 9;
signal clk: std_logic:='1';
begin
U: counter port map(EN=>EN,CLR=>CLR,RST=>RST,clk=>clk, TOP_COUNT=>TOP_COUNT, Q=>Q,TOP_CNT_REACH=>TOP_CNT_REACH,REACH_9=>REACH_9); 
clk<= not clk after 10 ns;
process
begin 
EN<='1'; CLR<='0'; TOP_COUNT<="0111";RST <='0'; wait for 336.3 ns;
EN<='1'; CLR<='0'; RST <='1'; wait for 336.3 ns;
EN<='1'; CLR<='0'; RST <='0'; wait for 336.3 ns;
EN<='1'; CLR<='1'; RST <='0'; wait for 336.3 ns;
EN<='1'; CLR<='0'; RST <='0'; wait for 336.3 ns;
EN<='1'; CLR<='1'; RST <='1'; wait for 336.3 ns;
EN<='1'; CLR<='0'; RST <='0'; wait for 336.3 ns;
EN<='0'; CLR<='0'; RST <='0'; wait for 336.3 ns;
wait;





end process;

end Behavioral;
