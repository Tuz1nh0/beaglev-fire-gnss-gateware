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

entity Acquisition_Core is
port (
	CLK             : IN  std_logic; -- example
    CA_CLKx4        : IN  std_logic;
    NRST            : IN  std_logic;
	MAX_INPUT_I     : IN  std_logic_vector(1 downto 0); -- MAX INPUT IN PHASE SIGNAL
    MAX_INPUT_Q     : IN  std_logic_vector(1 downto 0); -- MAX INPUT QUADRATURE SIGNAL
    MAX_INPUT_CLK   : IN  std_logic; -- MAX INPUT CLOCK      
    -- APB3 slave interface
    PSEL    : in std_logic;
    PENABLE : in std_logic;
    PWRITE  : in std_logic;
    PADDR   : in std_logic_vector(31 downto 0);
    PWDATA  : in std_logic_vector(31 downto 0);
    PRDATA  : out std_logic_vector(31 downto 0);
    PREADY  : out std_logic;
    PSLVERR : out std_logic;

    -- Optional interrupt
    IRQ : out std_logic
);
end Acquisition_Core;
architecture architecture_Acquisition_Core of Acquisition_Core is
   -- signal, component etc. declarations
    signal OUT_DATA_READY   : std_logic;
    signal CA_CLK           : std_logic;
    signal ABS_OUT_DATA     : std_logic_vector(31 downto 0);
    signal F_Doppler_DATA   : std_logic_vector(5 downto 0);
    signal SAT_ID_DATA_O    : std_logic_vector(4 downto 0);
    signal CODE_DELAY_DATA  : std_logic_vector(15 downto 0);

    component Acquisition_V3
    port (
        CLK             : IN  std_logic; 
        CA_CLK          : IN  std_logic;
        NRST            : IN  std_logic;
        MAX_INPUT_I     : IN  std_logic_vector(1 downto 0); 
        MAX_INPUT_Q     : IN  std_logic_vector(1 downto 0); 
        MAX_INPUT_CLK   : IN  std_logic;   
        OUT_DATA_READY  : OUT std_logic;
        ABS_OUT_DATA    : OUT std_logic_vector(31 downto 0);
        F_Doppler_DATA  : OUT std_logic_vector(5 downto 0);
        SAT_ID_DATA_O   : OUT std_logic_vector(4 downto 0);
        CODE_DELAY_DATA : OUT std_logic_vector(15 downto 0)
    );
    end component;
    
    component Acquisition_APB_Wrapper
    port (
        -- APB clock and reset
        PCLK    : in std_logic;
        PRESETN : in std_logic;

        -- Acquisition_V3 outputs
        OUT_DATA_READY  : in std_logic;
        ABS_OUT_DATA    : in std_logic_vector(31 downto 0);
        F_Doppler_DATA  : in std_logic_vector(5 downto 0);
        SAT_ID_DATA_O   : in std_logic_vector(4 downto 0);
        CODE_DELAY_DATA : in std_logic_vector(15 downto 0);

        -- APB3 slave interface
        PSEL    : in std_logic;
        PENABLE : in std_logic;
        PWRITE  : in std_logic;
        PADDR   : in std_logic_vector(31 downto 0);
        PWDATA  : in std_logic_vector(31 downto 0);
        PRDATA  : out std_logic_vector(31 downto 0);
        PREADY  : out std_logic;
        PSLVERR : out std_logic;

        -- Optional interrupt
        IRQ : out std_logic
    );
    end component;
    
    component Freq_divider 
    generic (
        DIV : positive :=  1
    );
    port (
        --<port_name> : <direction> <type>;
        clk_in      : IN  std_logic; 
        rstn        : IN  std_logic; 
        clk_out     : out std_logic
        --<other_ports>;
    );
    end component;

begin
    -- architecture body
    U_Acquisition_DSP: Acquisition_V3
        port map(
            CLK             => CLK,
            CA_CLK          => CA_CLK,
            NRST            => NRST,
            MAX_INPUT_I     => MAX_INPUT_I,
            MAX_INPUT_Q     => MAX_INPUT_Q,
            MAX_INPUT_CLK   => MAX_INPUT_CLK,
            OUT_DATA_READY  => OUT_DATA_READY,
            ABS_OUT_DATA    => ABS_OUT_DATA,
            F_Doppler_DATA  => F_Doppler_DATA,
            SAT_ID_DATA_O   => SAT_ID_DATA_O,
            CODE_DELAY_DATA => CODE_DELAY_DATA 
        );
        
    U_Acquisition_APB: Acquisition_APB_Wrapper
        port map(
            PCLK            => CLK,
            PRESETN         => NRST,
            OUT_DATA_READY  => OUT_DATA_READY,
            ABS_OUT_DATA    => ABS_OUT_DATA,
            F_Doppler_DATA  => F_Doppler_DATA,
            SAT_ID_DATA_O   => SAT_ID_DATA_O,
            CODE_DELAY_DATA => CODE_DELAY_DATA,
            PSEL            => PSEL,
            PENABLE         => PENABLE,
            PWRITE          => PWRITE,
            PADDR           => PADDR,
            PWDATA          => PWDATA,
            PRDATA          => PRDATA,
            PREADY          => PREADY,
            PSLVERR         => PSLVERR,
            IRQ             => IRQ
        );
        
    U_PRN_CLK: 
        Freq_divider
            generic map (DIV => 4)
            port map (
                clk_in  => CA_CLKx4,
                rstn    => NRST,
                clk_out => CA_CLK
            );
        
end architecture_Acquisition_Core;
