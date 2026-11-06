`timescale 1ns/100ps
module blinky(
input    clk,
input    resetn,
input	LED_APB,
input	LED_APB2_VHD,
input [27:0] gpio_out,
input [27:0] gpio_enable,
output [27:0] modified_gpio,
output [27:0] modified_gpio_enable
);

reg [22:0] counter;
assign modified_gpio = {gpio_out[27:8], LED_APB2_VHD, LED_APB, counter[22], gpio_out[4:0]};
assign modified_gpio_enable = {gpio_enable[27:8], 1'b1, 1'b1, 1'b1, gpio_enable[4:0]};

always@(posedge clk or negedge resetn)
begin
    if(~resetn)
        begin
            counter <= 23'h0;
        end
    else
        begin
            counter <= counter + 23'b1;
        end
end
endmodule
