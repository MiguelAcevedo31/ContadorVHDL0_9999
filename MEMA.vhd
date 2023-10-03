----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:25:41 10/02/2023 
-- Design Name: 
-- Module Name:    YOEX - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity YEX is
    Port ( clock : in STD_LOGIC;     
		    reset : in STD_LOGIC; 
		    digit :  out STD_LOGIC_VECTOR (3 downto 0);
		    seg : out STD_LOGIC_VECTOR (7 downto 0)); 
	 end YEX;

architecture Behavioral of YEX is
        signal contador : STD_LOGIC_VECTOR(3 downto 0) := "0000";
		  signal contador2 : STD_LOGIC_VECTOR(3 downto 0) := "0000";
		  signal contador3 : STD_LOGIC_VECTOR(3 downto 0) := "0000";
		  signal contador4 : STD_LOGIC_VECTOR(3 downto 0) := "0000";
		  signal contador0 : STD_LOGIC_VECTOR(3 downto 0) := "0000";
		  signal secuencia : STD_LOGIC_VECTOR(1 downto 0) := "00";
	     signal contadorcl : STD_LOGIC_VECTOR(25 downto 0) := (others =>'0');
		  signal contadorcl2 : STD_LOGIC_VECTOR(19 downto 0) := (others =>'0');
        signal signals: STD_LOGIC_VECTOR(7 downto 0) := "00000000";
begin
  process(clock,reset)
    begin
	  if reset = '1' then
        contador <= "0000";
		  contador2 <= "0000";
		  contador3 <= "0000";
		  contador4 <= "0000";
		  contadorcl <= (others =>'0');
		  elsif rising_edge (clock) then
		      contadorcl <= contadorcl + 1;
            if contadorcl = "00100110001001011010000000" then
               contadorcl <= (others =>'0');
                
					 contador <= contador + 1;
				    if contador = "1001" then
                   contador <= "0000";
						 contador2 <= contador2 + 1;
						   
						 if contador2 = "1001" then
                    contador2 <= "0000";
						  contador3 <= contador3 + 1;
						  
				          if contador3 = "1001" then
                         contador3 <= "0000";
						       contador <= contador4 + 1;
					end if;
            end if;
        end if;
		end if;
    end if;
	end process;

   process(clock)
    begin
	     if rising_edge(clock) then
		  contadorcl2 <= contadorcl2 + 1;
		    if contadorcl2 = "00110010110111001101" then
		       secuencia <= secuencia + 1;
				 contadorcl2 <= (others => '0');
			 end if;
		 end if;
	end process;
	
	process (secuencia, contador, contador2, contador3, contador4)
	    begin
	
        case secuencia is
            when "00" =>
                contador0 <= contador;
                digit <= "1110";	
             when "01" =>
                contador0 <= contador2;
                digit <= "1101";
				 when "10" =>
                contador0 <= contador3;
                digit <= "1011";
				 when "11" => 
                contador0 <= contador4;
                digit <= "0111";
				 when others =>
                contador0 <= "1111";
                digit <= "1111";
					 end case;
end process;
process (contador0)
           
begin
    case contador0 is
        when "0000" =>
        signals <= not "00111111";
        when "0001" =>
		  signals <= not "00000110";
		  when "0010" =>
        signals <= not "01011011";
        when "0011" =>
		  signals <= not "01001111";
		  when "0100" =>
		  signals <= not "01100110";
		  when "0101" =>
        signals <= not "01101101";
        when "0110" =>
		  signals <= not "01111101";
		  when "0111" =>
        signals <= not "00000111";
        when "1000" =>
		  signals <= not "01111111";
		  when "1001" =>
		  signals <= not "01101111";
        when others =>
		  signals <= not "00000000";
    	  end case;
end process;
seg <= signals;
end Behavioral;