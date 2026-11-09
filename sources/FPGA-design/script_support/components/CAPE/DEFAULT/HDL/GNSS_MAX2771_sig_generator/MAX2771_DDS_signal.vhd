--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: MAX2771_DDS_signal.vhd
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

entity MAX2771_DDS_signal is
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
end MAX2771_DDS_signal;
architecture architecture_MAX2771_DDS_signal of MAX2771_DDS_signal is
    signal PRN_CLKx4    : std_logic;
    signal PRN_CLK      : std_logic;
    signal CA_CODE      : std_logic;
    
    type DDS_signal  is array (0 to 1) of std_logic_vector(4 downto 0);
    signal DDS_out : DDS_signal;

    signal valid_reg : std_logic;
        
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
    
    component L1_CA_generator
	Port (
			clk : in std_logic;
			rst	: in std_logic;		
			PRN : out std_logic;			
			ENABLE : in std_logic;
			valid_out : out std_logic;
			epoch : out std_logic;
			epoch_advce : out std_logic;
			SAT : in std_logic_vector(4 downto 0)-- 32 GPS
		);
    end component;
    
    component DDS_PNFreq 
    generic
    (
        Freq_OFF_WIDTH  : positive := 5;
        SINCOS_WIDTH    : positive := 5
    );
    port(
        CLK             : in  std_logic;
        FREQ_OFFSET     : in  std_logic_vector(Freq_OFF_WIDTH-1 downto 0);
        NGRST           : in  std_logic;
        RSTN            : in  std_logic;
        PN_SIN          : in  std_logic;

        COSINE          : out std_logic_vector(SINCOS_WIDTH-1 downto 0);
        SINE            : out std_logic_vector(SINCOS_WIDTH-1 downto 0)
        );
    end component;

begin
    -- architecture body
    --U_GNSS_OSC: GNSS_OSC_C0 port map (OSC_CLK);
    --OSC_CLK <= CLK;
    --
    --U_GNSS_CCC: GNSS_CCC_C0 
        --port map(
            --PLL_POWERDOWN_N_0   => NRST,
            --REF_CLK_0           => OSC_CLK,
            --PLL_LOCK_0          => PLL_LOCK,
            --OUT0_FABCLK_0       => PRN_CLKx4
        --);
    
    PRN_CLKx4 <= OSC_CLK_x4;
    
    U_PRN_CLK: 
        --GNSS_CLK_DIV_C0
--port map(CLK_IN => PRN_CLKx4, CLK_OUT => PRN_CLK);
        Freq_divider
            generic map (DIV => 4)
            port map (
                clk_in  => PRN_CLKx4,
                rstn    => NRST,
                clk_out => PRN_CLK
            );
    -- C/A Code Generation
	U_CA_CODE: L1_CA_generator 
	   port map(
	     clk            => PRN_CLK,
	     rst            => not NRST,
	     PRN            => CA_CODE,
	     ENABLE         => enable,
	     valid_out      => open,
	     epoch          => open,
	     epoch_advce    => open,
	     SAT            => SAT_int
	   );
    
    U_CARRIER_DDS : DDS_PNFreq  
        generic map (
            Freq_OFF_WIDTH  => 5,
            SINCOS_WIDTH    => 5
        )
        port map (
            CLK         => CLK, 
            FREQ_OFFSET => Doppler_step(4 downto 0),
            NGRST       => NRST, 
            RSTN        => NRST, 
            PN_SIN      => Doppler_step(5),
            COSINE      => DDS_out(0), 
            SINE        => DDS_out(1)
    );
    
    process (PRN_CLKx4, NRST)
    begin
        if NRST = '0' then
            I_OUT <= "00";
            Q_OUT <= "00";
            VALID_OUT <= '0';
            
        elsif PRN_CLKx4 = '1' and PRN_CLKx4'event then
            if enable = '1' and PLL_LOCK = '1' then
                I_OUT(1) <= DDS_out(0)(4) xor CA_CODE;
                I_OUT(0) <= (DDS_out(0)(4) xor DDS_out(0)(3)) or (DDS_out(0)(4) xor DDS_out(0)(2));
                
                Q_OUT(1) <= DDS_out(1)(4) xor CA_CODE;
                Q_OUT(0) <= (DDS_out(1)(4) xor DDS_out(1)(3)) or (DDS_out(1)(4) xor DDS_out(1)(2)); 
     
                VALID_OUT <= PRN_CLKx4;
            end if;
        end if;
    end process;
end architecture_MAX2771_DDS_signal;

