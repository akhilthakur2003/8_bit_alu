`timescale 1ns / 1ps
module alu_8bit (
    input[7:0] sw, //input switches
    input reset, //resetbutton
    input input1,input2,oprn,done, //push buttons
    input clk, //default clock
    output [15:0] LED //output leds
    
);
reg [1:0] state;
wire btn_input1;
wire btn_input2;
wire btn_oprn;
wire btn_done;
wire btn_reset;

debounce one(clk,input1,btn_input1);
debounce two(clk,input2,btn_input2);
debounce three(clk,oprn,btn_oprn);
debounce four(clk,done,btn_done);
debounce rst(clk,reset,btn_reset);

reg [7:0] input_a;
reg [7:0] input_b;
reg [7:0] operation;
reg [15:0] ans;

always
begin
case(operation)
//addition
 8'b00_000_000:begin
 ans <= input_a + input_b;
 end
 //subtraction
 8'b00_000_001:begin
 ans <= input_a - input_b;
 end
 //multiplication
 8'b00_000_010:begin
 ans <= input_a * input_b;
 end
 //bitand
 8'b00_000_011:begin
 ans <= input_a & input_b;
 end
 //bitor
 8'b00_000_100:begin
 ans <= input_a | input_b;
 end
 //xor
 8'b00_000_101:begin
 ans <= input_a ^ input_b;
 end
 //complement
 8'b00_000_110:begin
 ans <= ~input_a;
 end
 //increment by 1
 8'b00_000_111:begin
 ans <= input_a + 1;
 end
 //decrement by 1
 8'b00_001_000:begin
 ans <= input_a - 1;
 end
 //left shift by inputb
 8'b00_001_001:begin
 ans <= input_a << input_b;
 end
 //right shift by inputb
 8'b00_001_010:begin
 ans <= input_a >> input_b;
 end
 default: begin
 ans = 0;
 end
endcase
end

always@(posedge clk)
begin
    if(btn_reset)
    begin
        state <= 2'b00; //ideal state
        input_a <= 8'b00000000;
        input_b <= 8'b00000000;
        operation <= 3'b000;
    end
   
    else
    begin
      if(btn_input1)
      begin
        input_a <= sw;
      end
      
      else if(btn_input2)
      begin
       input_b <= sw;
      end
      
      else if(btn_oprn)
      begin
       operation <= sw;
      end
      
    end
    end
    
    assign LED = ans;    
endmodule



