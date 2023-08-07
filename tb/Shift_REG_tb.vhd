----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2023 03:53:02 PM
-- Design Name: 
-- Module Name: Shift_REG_tb - Behavioral
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

entity Shift_REG_tb is
--  Port ( );
end Shift_REG_tb;

architecture Behavioral of Shift_REG_tb is
component Shift_REG
port(clk,RST: in std_logic;
     output: out std_logic_vector(2 downto 0));
end component;
signal RST: std_logic;
signal clk: std_logic:='1';
signal output:std_logic_vector(2 downto 0);
begin
U: Shift_REG port map(RST=>RST, clk=>clk,output=>output);
clk<= not clk after 10 ns;
process
begin 
RST<='1'; wait for 33 ns;
RST <='0'; wait for 100 ns;

end process;
end Behavioral;
