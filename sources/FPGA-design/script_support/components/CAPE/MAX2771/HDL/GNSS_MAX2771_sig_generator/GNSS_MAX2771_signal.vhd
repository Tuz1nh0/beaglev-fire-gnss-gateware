--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: GNSS_MAX2771_signal.vhd
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

entity GNSS_MAX2771_signal is
port (
    -- Clock e reset
    OCLK        : in std_logic;
    PCLK        : in  std_logic;
    PRESETN     : in  std_logic;
    PLL_LOCK    : in std_logic;

    -- Interface APB
    PSEL    : in  std_logic;
    PENABLE : in  std_logic;
    PWRITE  : in  std_logic;

    PADDR   : in  std_logic_vector(7 downto 0);
    PWDATA  : in  std_logic_vector(31 downto 0);

    PRDATA  : out std_logic_vector(31 downto 0);
    PREADY  : out std_logic;
    PSLVERR : out std_logic;
    
    -- Output interface
    I_OUT           : out std_logic_vector(1 downto 0);
    Q_OUT           : out std_logic_vector(1 downto 0);
    VALID_OUT       : out std_logic
);
end GNSS_MAX2771_signal;
architecture architecture_GNSS_MAX2771_signal of GNSS_MAX2771_signal is
   -- signal, component etc. declarations
	signal enable_sig   : std_logic; 
	signal doppler_sig  : std_logic_vector(5 downto 0);
	signal sat_id_sig   : std_logic_vector(4 downto 0);

    component MAX2771_APB_Wrapper 
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
    end component;
    
    component MAX2771_DDS_signal 
    port (
        --<port_name> : <direction> <type>;
        CLK             : in std_logic;
        OSC_CLK_x4      : in std_logic;
        NRST            : in std_logic;
        PLL_LOCK        : in std_logic;
        
        enable          : in std_logic;
        
        Doppler_step    : in std_logic_vector(5 downto 0);    
        SAT_int         : in std_logic_vector(4 downto 0);

        I_OUT           : out std_logic_vector(1 downto 0);
        Q_OUT           : out std_logic_vector(1 downto 0);

        VALID_OUT       : out std_logic
    );
    end component;
    
begin
    -- architecture body
    
    U_APB: MAX2771_APB_Wrapper
        port map(
            PCLK            => PCLK,
            PRESETN         => PRESETN,
            PSEL            => PSEL,
            PENABLE         => PENABLE,
            PWRITE          => PWRITE,
            PADDR           => PADDR,
            PWDATA          => PWDATA,
            PRDATA          => PRDATA,
            PREADY          => PREADY,
            PSLVERR         => PSLVERR,
            enable          => enable_sig,
            Doppler_step    => doppler_sig,
            SAT_int         => sat_id_sig
        );
        
    U_MAX2771: MAX2771_DDS_signal
        port map(
            CLK             => PCLK,
            OSC_CLK_x4      => OCLK,
            NRST            => PRESETN,
            PLL_LOCK        => PLL_LOCK,
            enable          => enable_sig,
            Doppler_step    => doppler_sig,
            SAT_int         => sat_id_sig,
            I_OUT           => I_OUT,
            Q_OUT           => Q_OUT,
            VALID_OUT       => VALID_OUT
        );
    
end architecture_GNSS_MAX2771_signal;
