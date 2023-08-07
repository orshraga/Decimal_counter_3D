----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2023 03:47:46 PM
-- Design Name: 
-- Module Name: Shift_REG - Behavioral
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

entity Shift_REG is
port(clk,RST: in std_logic;
     output: out std_logic_vector(2 downto 0));
end Shift_REG;

architecture Behavioral of Shift_REG is

begin

process(clk)
variable output_v: std_logic_vector(2 downto 0);
begin
if (rising_edge(clk)) then
 if RST='1' then
 output_v:="110";
 else
 output_v := output_v(1 downto 0)& output_v(2);
 end if;
  
 output<=output_v; 
end if;
end process;

end Behavioral;
