--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: Acquisition_Core.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::PolarFireSoC> <Die::MPFS025T> <Package::FCVG484>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ACQ_MOD_GPIO_IN is
port (
	GPIO_IN			: IN 	std_logic_vector(27 downto 0);
	MOD_GPIO_IN		: OUT 	std_logic_vector(27 downto 0);
	MOD_GPIO_ACQ_CLK	: OUT 	std_logic;
	MOD_GPIO_ACQ_I		: OUT 	std_logic_vector(1 downto 0);
	MOD_GPIO_ACQ_Q		: OUT 	std_logic_vector(1 downto 0)
);
end ACQ_MOD_GPIO_IN;
architecture architecture_ACQ_MOD_GPIO_IN of ACQ_MOD_GPIO_IN is
begin
	MOD_GPIO_IN 		<= 	GPIO_IN;
	MOD_GPIO_ACQ_CLK	<=   	GPIO_IN(18);
	MOD_GPIO_ACQ_I	    <=   	GPIO_IN(17 downto 16);
	MOD_GPIO_ACQ_Q	    <=   	GPIO_IN(15 downto 14);
end architecture_ACQ_MOD_GPIO_IN;

