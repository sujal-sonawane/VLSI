`timescale 1ns / 1ps
module tb_full_adder;
reg a,b,cin; wire sum,cout; reg [1:0] expected; integer i;
full_adder uut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
initial begin
 a=0; b=0; cin=0;
 for(i=0;i<8;i=i+1) begin
  {a,b,cin}=i[2:0]; #10;
  expected={1'b0,a}+{1'b0,b}+cin;
  if({cout,sum} !== expected) if({cout,sum} !== expected) $display("ERROR: Full adder mismatch: A=%b B=%b Cin=%b Sum=%b Cout=%b expected=%b",a,b,cin,sum,cout,expected);
 end
 $display("Full adder test completed."); $finish;
end
initial $monitor("Time=%0t A=%b B=%b Cin=%b Sum=%b Cout=%b",$time,a,b,cin,sum,cout);
endmodule
