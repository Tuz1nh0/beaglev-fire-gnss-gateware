--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: GPIOP8_Core_U_Custom.vhd
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

entity GNSS_P8_Upper is
port (
	PCLK        : IN  std_logic; 
    PRNCLKx4    : IN std_logic;
    PRESETN     : IN  std_logic; 
    
    GPIO_IN     : IN  std_logic_vector(15 downto 0); 
    GPIO_OUT    : OUT std_logic_vector(15 downto 0);
    GPIO_OE     : OUT std_logic_vector(15 downto 0);
    GPIO_INT    : OUT std_logic_vector(15 downto 0);
    
    -- Interface APB
    PSEL        : in  std_logic;
    PENABLE     : in  std_logic;
    PWRITE      : in  std_logic;

    PADDR       : in  std_logic_vector(7 downto 0);
    PWDATA      : in  std_logic_vector(31 downto 0);

    PRDATA      : out std_logic_vector(31 downto 0);
    PREADY      : out std_logic;
    PSLVERR     : out std_logic
);
end GNSS_P8_Upper;
architecture architecture_GNSS_P8_Upper of GNSS_P8_Upper is
    -- signal, component etc. declarations
    -- APB interface signals
    signal write_en     :   std_logic;
    
    signal reg_enable   : std_logic_vector(31 downto 0);
	signal reg_doppler  : std_logic_vector(31 downto 0);
	signal reg_sat_id   : std_logic_vector(31 downto 0);
	signal reg_debug    : std_logic_vector(31 downto 0);


    signal enable_sig   : std_logic; 
	signal doppler_sig  : std_logic_vector(5 downto 0);
	signal sat_id_sig   : std_logic_vector(4 downto 0);
	signal debug_sig    : std_logic_vector(31 downto 0);
	
    -- MAX2771 signals
    signal I_OUT        : std_logic_vector(1 downto 0);
	signal Q_OUT        : std_logic_vector(1 downto 0);
	signal VALID_OUT    : std_logic;
    
    
    component MAX2771_DDS_signal is
    port (
        --<port_name> : <direction> <type>;
        CLK             : in std_logic;
        OSC_CLK_x4      : in std_logic;
        NRST            : in std_logic;
        PLL_LOCK        : in std_logic;
        
        enable          : in std_logic;
        
        Doppler_step    : in std_logic_vector(5 downto 0);    
        SAT_int         : in std_logic_vector(4 downto 0);
        
        -- Debug
        Debug_port		: out std_logic_vector(31 downto 0);

        I_OUT           : out std_logic_vector(1 downto 0);
        Q_OUT           : out std_logic_vector(1 downto 0);

        VALID_OUT       : out std_logic
    );
    end component;

begin
    GPIO_OUT(15 downto 5) <= (others => '0');
    GPIO_OE(15 downto 5) <= (others => '0');
    GPIO_INT <= (others => '0');
    
    GPIO_OUT(4 downto 0) <= VALID_OUT & I_OUT & Q_OUT;
    GPIO_OE(4 downto 0) <= (others => enable_sig);
    
    U_MAX2771: MAX2771_DDS_signal
    port map(
        CLK             => PCLK,
        OSC_CLK_x4      => PRNCLKx4,
        NRST            => PRESETN,
        PLL_LOCK        => '1',
        enable          => enable_sig,
        Doppler_step    => doppler_sig,
        SAT_int         => sat_id_sig,
        Debug_port		=> debug_sig,
        I_OUT           => I_OUT,
        Q_OUT           => Q_OUT,
        VALID_OUT       => VALID_OUT
    );
    
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
        reg_debug    when x"0C",
        x"B11A2026"                         when x"10",
        (others => '0')                     when others;
    ---------------------------------------------------
    --- OUTPUTS
    ---------------------------------------------------
    enable_sig  <= reg_enable(0);
    doppler_sig <= reg_doppler(doppler_sig'high downto doppler_sig'low);
    sat_id_sig  <= reg_sat_id(sat_id_sig'high downto sat_id_sig'low);
    debug_sig   <= reg_debug;
    
    
end architecture_GNSS_P8_Upper;
