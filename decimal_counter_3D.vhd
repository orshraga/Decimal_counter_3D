----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2023 02:54:17 PM
-- Design Name: 
-- Module Name: decimal_counter_3D - Behavioral
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

entity decimal_counter_3D is
port(clk_100M,reset: in std_logic;
TOP_COUNT: in std_logic_vector (3 downto 0);
seven_seg : out std_logic_vector (6 downto 0);
anode: out std_logic_vector (2 downto 0);
Led: out std_logic);
end decimal_counter_3D;

architecture Behavioral of decimal_counter_3D is

component divider
  Port (
        clk_100M,reset: in std_logic;
        clk_500,clk_5: out std_logic);
end component;

component ANODE_ENCODER
port(input: in std_logic_vector(2 downto 0);
     output: out std_logic_vector(1 downto 0));
end component;

component MUX_4X1
port(input0,input1,input2,input3 : in integer range 0 to 9;
    sel: in std_logic_vector (1 downto 0);
    output: out integer range 0 to 9);
end component;

component seven_segments_dec
port(input: in integer range 0 to 9;
     output : out std_logic_vector (6 downto 0));
end component;

component counter
port(EN, CLR,RST, clk: in std_logic;
     TOP_COUNT: in std_logic_vector(3 downto 0);
     Q: out integer range 0 to 9;
     TOP_CNT_REACH, REACH_9: out std_logic);
end component;

component Shift_REG
port(clk,RST: in std_logic;
     output: out std_logic_vector(2 downto 0));
end component;


signal clk_5,clk_500: std_logic; --signals out of the dividers
signal CLR_LSD,CLR_ISD,CLR_MSD: std_logic; --CLR of the counters
signal EN_LSD,EN_ISD,EN_MSD: std_logic ;--En of the counters
signal TOP_CNT_REACH_LSD,TOP_CNT_REACH_ISD,TOP_CNT_REACH_MSD : std_logic; -- TOP_CNT_REACH of the counters
signal REACH_9_LSD, REACH_9_ISD,REACH_9_MSD : std_logic; -- REACH_9 of the counters
signal Q_LSD, Q_ISD, Q_MSD: integer range 0 to 9;-- Q of the counters
signal SHIFT_out: std_logic_vector(2 downto 0);--Shift register output
signal MUX_SEL: std_logic_vector(1 downto 0);-- SEL bits of the MUX
signal MUX_OUT: integer range 0 to 9;--MUX out
signal SEVEN_SEG_OUT: std_logic_vector (6 downto 0);-- output of the seven segments dec

begin
div: divider port map(clk_100M=>clk_100M,reset=>reset,clk_5=>clk_5,clk_500=>clk_500);            
LSD: counter port map(EN=>EN_LSD,CLR=>CLR_LSD,TOP_COUNT=>TOP_COUNT,RST=>reset,clk=>clk_5,Q=>Q_LSD ,REACH_9=>REACH_9_LSD ,TOP_CNT_REACH=>TOP_CNT_REACH_LSD);
ISD: counter port map(EN=>EN_ISD,CLR=>CLR_ISD,TOP_COUNT=>TOP_COUNT,RST=>reset,clk=>clk_5,Q=>Q_ISD ,REACH_9=>REACH_9_ISD ,TOP_CNT_REACH=>TOP_CNT_REACH_ISD);
MSD: counter port map(EN=>EN_MSD,CLR=>CLR_MSD,TOP_COUNT=>TOP_COUNT,RST=>reset,clk=>clk_5,Q=>Q_MSD ,REACH_9=>REACH_9_MSD ,TOP_CNT_REACH=>TOP_CNT_REACH_MSD);
SHIFT : Shift_REG port map(clk=>clk_500,RST=>reset,output=>SHIFT_out);
ANODE_ENC: ANODE_ENCODER port map(input=>SHIFT_out, output=>MUX_SEL);
MUX: MUX_4X1 port map(input0=>Q_LSD,input1=>Q_ISD, input2=>Q_MSD,input3=>1,sel=>MUX_SEL,output=>MUX_OUT);
SEVEN: seven_segments_dec port map(input=>MUX_OUT,output=>SEVEN_SEG_OUT);

LED<=(TOP_CNT_REACH_LSD and TOP_CNT_REACH_ISD and TOP_CNT_REACH_MSD);                                                                             
EN_LSD<='1';
anode<=SHIFT_out;
seven_seg <= SEVEN_SEG_OUT;
                                                                                    
                                                                                    
process(TOP_CNT_REACH_LSD,TOP_CNT_REACH_ISD,TOP_CNT_REACH_MSD,REACH_9_LSD, REACH_9_ISD,REACH_9_MSD)
begin
    if REACH_9_LSD ='1' then 
        EN_ISD<='1';--mybe should intiate as after reset
    else
        EN_ISD<='0';
    end if;
    
    if REACH_9_ISD ='1' and REACH_9_LSD ='1'  then 
        EN_MSD<='1';--mybe should intiate as after reset
    else
        EN_MSD<='0';
    end if;
    
    if TOP_CNT_REACH_LSD='1' and TOP_CNT_REACH_ISD='1' and TOP_CNT_REACH_MSD='1' then
        CLR_LSD<='1';
        CLR_ISD<='1';
        CLR_MSD<='1';
    else 
         CLR_LSD<='0';
         CLR_ISD<='0';
         CLR_MSD<='0';
    
    end if;
end process;                                                                                          

end Behavioral;
