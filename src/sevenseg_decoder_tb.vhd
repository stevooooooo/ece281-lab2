----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2025 10:59:02 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is

    component sevenseg_decoder is 
        port ( 
           i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0)
        );	
    end component;
    
    
    signal w_sw : std_logic_vector (3 downto 0);
    signal w_Y : std_logic_vector (6 downto 0);

begin
-- Behavioral model for one-hot decoder
    sevenseg_decoder_inst : sevenseg_decoder port map (
        i_Hex => w_sw,
        o_seg_n => w_Y
    );  
    test_process : process 
	begin
	-- Place test cases here. The first two have been written for you
		w_sw <= x"0"; wait for 10 ns;
            assert w_Y = "1000000" report "error on 0" severity failure;
        w_sw <= x"1"; wait for 10 ns;
            assert w_Y = "1111001" report "error on 1" severity failure;
		w_sw <= x"2"; wait for 10 ns;
            assert w_Y = "0100100" report "error on 2" severity failure;
        w_sw <= x"E"; wait for 10 ns;
            assert w_Y = "0000110" report "error on E" severity failure;
		w_sw <= x"F"; wait for 10 ns;
            assert w_Y = "0001110" report "error on F" severity failure;

		wait; -- wait forever
	end process;
end Behavioral;
