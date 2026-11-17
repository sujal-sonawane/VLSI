`timescale 1ns / 1ps
module bit3_upcounter(input wire enable, clk, rst, output reg [2:0] q);
always @(posedge clk or posedge rst) begin
 if(rst) q<=3'b000;
 else if(enable) q<=q+3'b001;
end
endmodule

module bit3_downcounter(input wire enable, clk, rst, output reg [2:0] q);
always @(negedge clk or posedge rst) begin
 if(rst) q<=3'b111;
 else if(enable) q<=q-3'b001;
end
endmodule
