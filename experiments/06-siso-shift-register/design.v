`timescale 1ns / 1ps
module dff(input wire d, clk, rst, output reg q);
always @(posedge clk or posedge rst) begin
 if(rst) q<=1'b0;
 else q<=d;
end
endmodule

module siso_shift_register(input wire clk, rst, serial_in, output wire serial_out);
wire q1,q2,q3,q4;
dff ff1(.d(serial_in),.clk(clk),.rst(rst),.q(q1));
dff ff2(.d(q1),.clk(clk),.rst(rst),.q(q2));
dff ff3(.d(q2),.clk(clk),.rst(rst),.q(q3));
dff ff4(.d(q3),.clk(clk),.rst(rst),.q(q4));
assign serial_out=q4;
endmodule
