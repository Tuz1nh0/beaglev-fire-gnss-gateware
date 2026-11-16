`timescale 1ns / 1ps

module APB_Blinky (
    // Clock e reset
    input  wire        PCLK,
    input  wire        PRESETN,

    // Interface APB
    input  wire        PSEL,
    input  wire        PENABLE,
    input  wire        PWRITE,

    input  wire [7:0]  PADDR,
    input  wire [31:0] PWDATA,

    output reg  [31:0] PRDATA,
    output wire        PREADY,
    output wire        PSLVERR,

    // Saida do Blinky
    output wire        LED_OUT
);

    // --------------------------------------------------
    // Registradores de controle
    // --------------------------------------------------

    reg [31:0] reg_control;
    reg [31:0] reg_period;

    // Contador
    reg [31:0] counter;

    // Estado do LED
    reg led_reg;

    // Selecao de escrita APB
    wire write_en;

    // --------------------------------------------------
    // Controle APB
    // --------------------------------------------------

    assign write_en = PSEL & PENABLE & PWRITE;

    assign PREADY  = 1'b1;
    assign PSLVERR = 1'b0;

    // --------------------------------------------------
    // Registradores
    // --------------------------------------------------

    always @(posedge PCLK or negedge PRESETN) begin

        if (!PRESETN) begin
            reg_control <= 32'd0;
            reg_period  <= 32'd50000000;
        end
        else begin

            if (write_en) begin

                case (PADDR)

                    8'h00: begin
                        reg_control <= PWDATA;
                    end

                    8'h04: begin
                        reg_period <= PWDATA;
                    end

                    default: begin
                        // Nenhuma operacao
                    end

                endcase
            end
        end
    end

    // --------------------------------------------------
    // Contador Blinky
    // --------------------------------------------------

    always @(posedge PCLK or negedge PRESETN) begin

        if (!PRESETN) begin
            counter <= 32'd0;
            led_reg <= 1'b0;
        end
        else begin

            if (reg_control[0]) begin

                if (counter >= reg_period) begin
                    counter <= 32'd0;
                    led_reg <= ~led_reg;
                end
                else begin
                    counter <= counter + 32'd1;
                end

            end
            else begin
                counter <= 32'd0;
                led_reg <= 1'b0;
            end
        end
    end

    // --------------------------------------------------
    // Leitura APB
    // --------------------------------------------------

    always @(*) begin

        PRDATA = 32'd0;

        case (PADDR)
            
            8'h00: PRDATA = reg_control;
            8'h04: PRDATA = reg_period;
            8'h08: PRDATA = counter;
            8'h0C: PRDATA = 32'hB11A2026;
            default: PRDATA = 32'd0;

        endcase
    end

    // --------------------------------------------------
    // Saida
    // --------------------------------------------------

    assign LED_OUT = led_reg;

endmodule

