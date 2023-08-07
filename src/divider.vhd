library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity divider is
    Port (
        clk_100M,reset: in std_logic;
        clk_500,clk_5: out std_logic);

end divider;

architecture Behavioral of divider is
--constant top_count_500 : integer := 100000;
--constant top_count_5 : integer :=10000000;
constant top_count_500 : integer := 10; -- for simulation
constant top_count_5 : integer :=50;
signal count_500_s :integer range 0 to top_count_500 ;
signal rdy_rst : std_logic;

 
begin

process(clk_100M)
variable count_500: integer range 0 to top_count_500 ;
variable count_5: integer range 0 to top_count_5 ;
variable clk_500_v : std_logic:='0';
variable clk_5_v : std_logic:='0';
begin

if rising_edge(clk_100M) then
  if reset='1' and rdy_rst='1'  then
     rdy_rst<='0'; 
     clk_500_v:='0';
     count_500:=0;
     clk_5_v:='0';
     count_5:=0;
  elsif reset='1' and rdy_rst='0' then
     count_500:=count_500+1;
     count_5:=count_5+1;

  elsif reset='0' and rdy_rst='0' then
     rdy_rst<='1';  
     count_500:=count_500+1;
     count_5:=count_5+1;
  else
     rdy_rst<='1';  
     count_500:=count_500+1;
     count_5:=count_5+1;
  end if;
  
  if count_500 = (top_count_500) then
     clk_500_v := not clk_500_v;
     count_500 := 0;
  end if;
  
  if count_5 = (top_count_5) then
     clk_5_v := not clk_5_v;
     count_5 := 0;
  end if;
  clk_500<=clk_500_v;
  clk_5<=clk_5_v;

  count_500_s<= count_500;
end if;



end process;

end Behavioral;