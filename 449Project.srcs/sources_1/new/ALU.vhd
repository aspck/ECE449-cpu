----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2023 05:11:33 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use ieee.numeric_std.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
port(
    rst : in std_logic; clk: in std_logic;
    --read signals
    in1: in std_logic_vector(15 downto 0); 
    in2: in std_logic_vector(15 downto 0); 
    alu_mode: in std_logic_vector(2 downto 0);
    --write signals
    result: out std_logic_vector(15 downto 0); 
    z_flag: out std_logic;
    n_flag: out std_logic;
);
end ALU;

architecture Behavioral of ALU is

process(clk)
begin
   -- on falling edge, if reset pin is high, set outputs to zero
   if(clk='0' and clk'event) then 
     if(rst='1') then
      
     result <= (others => '0'); 
     z_flag <= (others => '0'); 
     n_flag <= (others => '0'); 
     
   -- otherwise, on falling edge, do the operation
   elsif(clk='0' and clk'event) then
   
      case alu_mode(2 downto 0) is
    
      -- Add
      when "001" => result <= in1 + in2;
      
      -- Subtract
      when "010" => result <= in1 - in2;
      
      -- Multiply
      when "011" => result <= in1 * in2;
      
      -- NAND
      when "100" => result <= (in1 nand in2);
      
      -- Shift left
      when "101" => 
      -- get the number of places to shift (lower 4 bits of second operand)
      n := in2(3 downto 0);
      -- translation of Table I opcode 5:
      if (n != '0') then
        -- set RA equal to (the first 15-n bits of operand 1) concatenated with n zeroes
        result <= in1(15-n downto 0) 
      
      
      -- Shift right
      when "110" => result <= shift_left(in1, in2);
      
      -- TEST
      when "111" => if ( 
      end if; 
      
      when others => NULL; end case;
      
    end if; 
    end if;
end process;

begin


end Behavioral;
