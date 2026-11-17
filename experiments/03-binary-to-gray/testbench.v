`timescale 1ns / 1ps
module tb_binary_to_gray;
reg [2:0] b; wire [2:0] g; reg [2:0] expected; integer i;
binary_to_gray uut(.b(b),.g(g));
initial begin
 b=0;
 for(i=0;i<8;i=i+1) begin
  b=i[2:0]; #10; expected=b^(b>>1);
  if(g !== expected) if(g !== expected) $display("ERROR: Binary-to-Gray mismatch: Binary=%b Gray=%b Expected=%b",b,g,expected);
 end
 $display("Binary-to-Gray test completed."); $finish;
end
initial $monitor("Time=%0t Binary=%b Gray=%b",$time,b,g);
endmodule
