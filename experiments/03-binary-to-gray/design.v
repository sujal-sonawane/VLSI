`timescale 1ns / 1ps
module binary_to_gray(input wire [2:0] b, output wire [2:0] g);
assign g[2]=b[2]; assign g[1]=b[2]^b[1]; assign g[0]=b[1]^b[0];
endmodule
