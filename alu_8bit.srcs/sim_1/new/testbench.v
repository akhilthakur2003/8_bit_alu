`timescale 1ns / 1ps

module testbench(
    
    );
    
//    reg [7:0] sw;
//    reg reset,input1, input2, oprn,done;
    reg clk;
//    wire [9:0] led;
    
//    alu_8bit uut(sw,reset,input1,input2,oprn,done,clk,led);
    always
    begin
    #10 clk = ~clk;
    end
    initial
    begin
    clk = 0;
    #100 $finish();
    end
    
   
endmodule
