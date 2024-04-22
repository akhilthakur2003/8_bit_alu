`timescale 1ns / 1ps

module debounce(
    input clk_in,pb,
    output led
);

wire clk_out;
wire Q1,Q2,Q2bar;

slow_clk u1(clk_in,clk_out);
D_ff(clk_out,pb,Q1);
D_ff(clk_out,Q1,Q2);


assign Q2bar = ~Q2;
assign led = Q1 & Q2bar;
endmodule
