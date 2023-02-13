library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 
use work.all;

entity test_alu is end test_alu;

architecture behavioural of test_alu is

component ALU port(
	rst : in std_logic;
	clk: in std_logic;
    --read signals
    in1: in std_logic_vector(15 downto 0); 
    in2: in std_logic_vector(15 downto 0); 
    alu_mode: in std_logic_vector(2 downto 0);
    --write signals
    result: out std_logic_vector(15 downto 0); 
    z_flag: out std_logic;
    n_flag: out std_logic);
end component; 

signal rst, clk, z_flag, n_flag : std_logic; 
signal alu_mode, : std_logic_vector(2 downto 0); 
signal in1, in2, result : std_logic_vector(15 downto 0); 
begin
u0:ALU port map(rst, clk, in1, in2, alu_mode, result, z_flag, n_flag);

-- this is the process that generates the clock signal forever
process begin
clk <= '0'; wait for 10 us;
clk<='1'; wait for 10 us; 
end process;

process  begin

rst <= '1';

wait until (clk='0' and clk'event);
wait until (clk='1' and clk'event);
wait until (clk='1' and clk'event);
rst <= '0';
wait until (clk='1' and clk'event);

end process;

end behavioural;