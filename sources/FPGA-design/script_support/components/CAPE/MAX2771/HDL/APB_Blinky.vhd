library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity APB_Blinky is
    port (
        -- Clock e reset
        PCLK    : in  std_logic;
        PRESETN : in  std_logic;

        -- Interface APB
        PSEL    : in  std_logic;
        PENABLE : in  std_logic;
        PWRITE  : in  std_logic;

        PADDR   : in  std_logic_vector(7 downto 0);
        PWDATA  : in  std_logic_vector(31 downto 0);

        PRDATA  : out std_logic_vector(31 downto 0);
        PREADY  : out std_logic;
        PSLVERR : out std_logic;

        -- Saída do Blinky
        LED_OUT : out std_logic
    );
end entity;

architecture rtl of APB_Blinky is

    -- Registradores de controle
    signal reg_control : std_logic_vector(31 downto 0);
    signal reg_period  : std_logic_vector(31 downto 0);

    -- Contador
    signal counter : unsigned(31 downto 0);

    -- Estado do LED
    signal led_reg : std_logic;

    -- Seleção de escrita APB
    signal write_en : std_logic;

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
            reg_control <= (others => '0');
            reg_period <=
                std_logic_vector(to_unsigned(50000000, 32));

        elsif rising_edge(PCLK) then
            if write_en = '1' then
                case PADDR is
                    when x"00" =>
                        reg_control <= PWDATA;
                    when x"04" =>
                        reg_period <= PWDATA;
                    when others =>
                        null;
                end case;
            end if;
        end if;
    end process;

    --------------------------------------------------
    -- Contador Blinky
    --------------------------------------------------

    process(PCLK, PRESETN)
    begin
        if PRESETN = '0' then
            counter <= (others => '0');
            led_reg <= '0';
        elsif rising_edge(PCLK) then
            if reg_control(0) = '1' then
                if counter >= unsigned(reg_period) then
                    counter <= (others => '0');
                    led_reg <= not led_reg;
                else
                    counter <= counter + 1;
                end if;
            else
                counter <= (others => '0');
                led_reg <= '0';
            end if;
        end if;
    end process;

    --------------------------------------------------
    -- Leitura APB
    --------------------------------------------------

    process(all)
    begin
        PRDATA <= (others => '0');
        case PADDR is
            when x"00" =>
                PRDATA <= reg_control;
            when x"04" =>
                PRDATA <= reg_period;
            when x"08" =>
                PRDATA <= std_logic_vector(counter);
            when others =>
                null;
        end case;
    end process;

    --------------------------------------------------
    -- Saída
    --------------------------------------------------
    LED_OUT <= led_reg;

end architecture;