----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2025 10:31:16 PM
-- Design Name: 
-- Module Name: sevenseg_decoder - Behavioral
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

entity sevenseg_decoder is
    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
end sevenseg_decoder;

architecture Behavioral of sevenseg_decoder is
    signal w_seg_n : std_logic_vector (6 downto 0);
begin
-- Behavioral model for one-hot decoder
with i_Hex select
w_seg_n <=  "0000001" when "0000",
        "1001111" when "0001",
        "0010010" when "0010",
        "0000110" when "0011",
        "1001100" when "0100",
        "0100100" when "0101",
        "0100000" when "0110",
        "0001111" when "0111",
        "0000000" when "1000",
        "0001100" when "1001",
        "0001000" when "1010",
        "1100000" when "1011",
        "1110010" when "1100",
        "1000010" when "1101",
        "0110000" when "1110",
        "0111000" when "1111",
        "0000000" when others;

o_seg_n(0) <= w_seg_n(6);
o_seg_n(1) <= w_seg_n(5);
o_seg_n(2) <= w_seg_n(4);
o_seg_n(3) <= w_seg_n(3);
o_seg_n(4) <= w_seg_n(2);
o_seg_n(5) <= w_seg_n(1);
o_seg_n(6) <= w_seg_n(0);

end Behavioral;
