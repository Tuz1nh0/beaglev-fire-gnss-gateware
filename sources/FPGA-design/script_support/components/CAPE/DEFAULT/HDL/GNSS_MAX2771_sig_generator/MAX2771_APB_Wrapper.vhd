--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: MAX2771_APB_Wrapper.vhd
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

entity MAX2771_APB_Wrapper is
port (
        -- Clock e reset
        PCLK    : in  std_logic;
        PRESETN    : in  std_logic;

        -- Interface APB
        PSEL    : in  std_logic;
        PENABLE : in  std_logic;
        PWRITE  : in  std_logic;

        PADDR   : in  std_logic_vector(7 downto 0);
        PWDATA  : in  std_logic_vector(31 downto 0);

        PRDATA  : out std_logic_vector(31 downto 0);
        PREADY  : out std_logic;
        PSLVERR : out std_logic;
        
        -- Interface MAX2771
        enable          : out std_logic;
        Doppler_step    : out std_logic_vector(5 downto 0);    
        SAT_int         : out std_logic_vector(4 downto 0)
);
end MAX2771_APB_Wrapper;
architecture architecture_MAX2771_APB_Wrapper of MAX2771_APB_Wrapper is
    -- Registradores de controle
    signal reg_enable   : std_logic_vector(31 downto 0);
    signal reg_doppler  : std_logic_vector(31 downto 0);
    signal reg_sat_id   : std_logic_vector(31 downto 0);
    
    -- Seleção de escrita APB
    signal write_en : std_logic;
    
	signal signal_name2 : std_logic_vector(1 downto 0) ; -- example

begin
    --------------------------------------------------
    -- Controle APB
    --------------------------------------------------
    write_en <= PSEL and PENABLE and PWRITE;
    PREADY  <= '1';
    PSLVERR <= '0';
    
    --------------------------------------------------
    -- Registradores
    --------------------------------------------------
    process(PCLK, PRESETN)
    begin
        if PRESETN = '0' then
            reg_enable  <= (others => '0');
            reg_doppler <= (others => '0');
            reg_sat_id  <= (others => '0');
        elsif rising_edge(PCLK) then
            if write_en = '1' then
                case PADDR is
                    when x"00" =>
                        reg_enable  <= PWDATA;
                    when x"04" =>
                        reg_doppler <= PWDATA;
                    when x"08" =>
                        reg_sat_id  <= PWDATA;
                    when others =>
                        null;
                end case;
            end if;
        end if;
    end process;
    
    --------------------------------------------------
    -- Leitura APB
    --------------------------------------------------
    
    with PADDR select
        PRDATA <=
        reg_enable   when x"00",
        reg_doppler  when x"04",
        reg_sat_id   when x"08",
        x"B11A2026"                         when x"0C",
        (others => '0')                     when others;
    ---------------------------------------------------
    --- OUTPUTS
    ---------------------------------------------------
    enable  <= reg_enable(0);
    Doppler_step <= reg_doppler(Doppler_step'high downto Doppler_step'low);
    SAT_int <= reg_sat_id(SAT_int'high downto SAT_int'low);
    
end architecture_MAX2771_APB_Wrapper;
