`timescale 1ns / 1ps


module slow_clk(
    input clk_in,
    output reg clk_out
    );
    
    reg [25:0] count = 0;
    
    always@(posedge clk_in)
    begin 
    count <= count+1;
    if(count == 12_000_000)
    begin
    clk_out = ~clk_out;
    count <= 0;
    end
    end
    
endmodule

