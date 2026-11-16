--------------------------------------------------------------------------------------
-- L1 C/A PRN Generator (1 bit outputs). Unsampled.
--
-- The PRN is generated with 2 LSFRs (G1 and G2) of 10 registers. The seeds and the
-- taps are fixed for all the satellites for both LSFR. The phases output of the first
-- LSFR are fixed for all the satellites, while for the second LSFR are different for
-- each satellite.
-- All vectors are reversed as they appear in the ICD document (IS-GPS-200D).
--
-- G1, G2: 1023 chips lenght.
-- PRN: 1023 chips lenght.
--
--	Reset MUST be asserted during 2 clocks.
-- Satellite MUST be fixed during reset.
--	Satellite will be fix until next reset.
--------------------------------------------------------------------------------------
-- **** INPUTS ****
-- sat --> Sat number: 
--			0 = PRN 1, 1 = PRN 2,...,31 = PRN 32
-- enable --> freeze
--
-- **** OUTPUTS  ****
-- prn_i  --> PRN signal
-- valid_out --> PRN valid
-- epoch --> PRN repeat
--------------------------------------------------------------------------------------
-- Diary:	05/12/2014	Start 
--				08/06/2016	Version 1.0	Dani
--------------------------------------------------------------------------------------
-- Author: Daniel Pascual (daniel.pascual at protonmail.com) 
-- Copyright 2017 Daniel Pascual
-- License: GNU GPLv3
--------------------------------------------------------------------------------------
-- Copyright 2017 Daniel Pascual
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity L1_CA_generator is
	Port (
			clk : in std_logic;
			rst	: in std_logic;		
			PRN : out std_logic;			
			ENABLE : in std_logic;
			valid_out : out std_logic;
			epoch : out std_logic;
			epoch_advce : out std_logic;
			SAT : std_logic_vector(4 downto 0) -- 32 GPS
		);				
end L1_CA_generator;

architecture Behavioral of L1_CA_generator is
	
	signal output_CA_G2 : std_logic_vector(9 downto 0); -- output phases for LSFR G2
	signal g1_out, g2_out : std_logic;
	signal LSFR_valid : std_logic;		-- just one needed because both LSFR are sync
	signal ENABLE_LSFR : std_logic;
	signal cont_epoch : integer range 0 to 1023;  		-- PRN period of 1023 clocks

	begin
    

		G1_gen : entity work.LFSR_generator(Behavioral)
			generic map(WIDTH => 10,
				WIDTH_CMP => 1)					
			port map(clk => clk,
				rst => rst,
				seed	=> "1111111111",			-- same for all PRNs
				tap => "1000000100",				-- same for all PRNs
				RESET => "0000000000",			-- no reset
				phase_out => "1000000000",			-- just last one
				SEQ => g1_out,
				count_cmp => "0", 				-- no reset
				ENABLE => ENABLE_LSFR,			-- enable		
				valid => LSFR_valid);				
				
		G2_gen : entity work.LFSR_generator(Behavioral)
			generic map(WIDTH => 10,
				WIDTH_CMP => 1)
			port map(
				clk => clk,
				rst => rst,
				seed	=> "1111111111",			-- same for all PRNs
				tap => "1110100110",				-- same for all PRNs
				RESET => "0000000000",			-- no reset
				phase_out => output_CA_G2,			-- diferent for each PRN
				SEQ => g2_out,
				count_cmp => "0", 				-- no reset
				ENABLE => ENABLE_LSFR,			-- enable			
				valid => open
				);					-- both LSFR are sync
				
		proc: process(clk, rst)
			begin
				if clk'event and clk = '1' then
					if (rst = '1') then
						-- Outputs
						PRN <= '0';
						valid_out <= '0';
						epoch <= '0';
						epoch_advce <= '0';

						-- LSFRs inputs
						ENABLE_LSFR <= '0';
						
						-- aux
						cont_epoch <= 0;						

						-- Output phases for the second LSFR
						CASE SAT IS
							WHEN "00000" => 
								output_CA_G2 <= "0000100010";
							WHEN "00001" => 
								output_CA_G2 <= "0001000100";					
							WHEN "00010" => 
								output_CA_G2 <= "0010001000";					
							WHEN "00011" => 
								output_CA_G2 <= "0100010000";					
							WHEN "00100" => 
								output_CA_G2 <= "0100000001";				
							WHEN "00101" => 
								output_CA_G2 <= "1000000010";				
							WHEN "00110" => 
								output_CA_G2 <= "0010000001";				
							WHEN "00111" => 
								output_CA_G2 <= "0100000010";				
							WHEN "01000" => 
								output_CA_G2 <= "1000000100";				
							WHEN "01001" => 
								output_CA_G2 <= "0000000110";				
							WHEN "01010" => 
								output_CA_G2 <= "0000001100";		
							WHEN "01011" => 
								output_CA_G2 <= "0000110000";				
							WHEN "01100" => 
								output_CA_G2 <= "0001100000";				
							WHEN "01101" => 
								output_CA_G2 <= "0011000000";				
							WHEN "01110" => 
								output_CA_G2 <= "0110000000";				
							WHEN "01111" => 
								output_CA_G2 <= "1100000000";									
							WHEN "10000" => 
								output_CA_G2 <= "0000001001";				
							WHEN "10001" => 
								output_CA_G2 <= "0000010010";				
							WHEN "10010" => 
								output_CA_G2 <= "0000100100";				
							WHEN "10011" => 
								output_CA_G2 <= "0001001000";				
							WHEN "10100" => 
								output_CA_G2 <= "0010010000";									
							WHEN "10101" => 
								output_CA_G2 <= "0100100000";				
							WHEN "10110" => 
								output_CA_G2 <= "0000000101";				
							WHEN "10111" => 
								output_CA_G2 <= "0000101000";				
							WHEN "11000" => 
								output_CA_G2 <= "0001010000";				
							WHEN "11001" => 
								output_CA_G2 <= "0010100000";
							WHEN "11010" => 
								output_CA_G2 <= "0101000000";				
							WHEN "11011" => 
								output_CA_G2 <= "1010000000";				
							WHEN "11100" => 
								output_CA_G2 <= "0000100001";				
							WHEN "11101" => 
								output_CA_G2 <= "0001000010";				
							WHEN "11110" => 
								output_CA_G2 <= "0010000100";
							WHEN "11111" => 
								output_CA_G2 <= "0100001000";		
							WHEN OTHERS =>  
								output_CA_G2 <= (others =>'0');
						END CASE;
						
					else -- reset
						
						ENABLE_LSFR <= ENABLE; 
						epoch <= '0';
						epoch_advce <= '0';

						-- Create PRN
						PRN <= not(g1_out xor g2_out);						
						valid_out <= LSFR_valid;
						
						-- Counter epoch
						if LSFR_valid = '1' then
							cont_epoch <= cont_epoch+1;
							if cont_epoch = 1022 then
								cont_epoch <= 0;
								epoch <= '1';
							end if;
							if cont_epoch = 1021 then
								epoch_advce <= '1';
							end if;
						end if;
					end if; --reset																	
				end if; --clock
		end process proc;		
end Behavioral;
