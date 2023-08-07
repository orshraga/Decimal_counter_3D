----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2023 02:44:57 PM
-- Design Name: 
-- Module Name: counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
port(EN, CLR,RST, clk: in std_logic;
     TOP_COUNT: in std_logic_vector(3 downto 0);
     Q: out integer range 0 to 9;
     TOP_CNT_REACH, REACH_9: out std_logic);
end counter;

architecture Behavioral of counter is
begin
process(clk)
variable Q_V: integer range 0 to 10;
begin 
if (rising_edge(clk)) then
  TOP_CNT_REACH <= '0';
  REACH_9 <= '0';
  if RST='1' or CLR = '1'  then
    Q_V := 0;
  elsif EN='0' then
    Q_V := Q_V;
  else
    Q_V :=Q_V +1;    
  end if;  
  
  if Q_V=9 then
    REACH_9<='1';
      
  end if;
  
  if Q_V=10 then
    Q_V:=0;
  end if;
  if Q_V=to_integer(unsigned(TOP_COUNT)) then
  TOP_CNT_REACH <='1';
  end if;
  Q<=Q_V;
 
end if;
end process;


end Behavioral;
