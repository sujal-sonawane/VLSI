`timescale 1ns / 1ps
module tb_mux4to1;
reg [3:0] I; reg [1:0] S; wire Y; integer data_value; integer select_value;
mux4to1 uut(.I(I), .S(S), .Y(Y));
initial begin
 I=0; S=0;
 for(data_value=0; data_value<16; data_value=data_value+1) begin
  I=data_value;
  for(select_value=0; select_value<4; select_value=select_value+1) begin
   S=select_value; #10;
   if(Y !== I[S]) if(Y !== I[S]) $display("ERROR: MUX mismatch: I=%b S=%b Y=%b expected=%b", I,S,Y,I[S]);
  end
 end
 $display("4:1 MUX test completed."); $finish;
end
initial $monitor("Time=%0t I=%b S=%b Y=%b",$time,I,S,Y);
endmodule
