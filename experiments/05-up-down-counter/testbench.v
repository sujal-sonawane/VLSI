`timescale 1ns / 1ps
module tb_3bit_upcounter;
reg enable,clk,rst; wire [2:0] q;
bit3_upcounter uut(.enable(enable),.clk(clk),.rst(rst),.q(q));
always #5 clk=~clk;
initial begin
 clk=0; rst=1; enable=1; #12; @(negedge clk); rst=0;
 repeat(10) @(negedge clk); enable=0; repeat(2) @(negedge clk);
 $display("3-bit up-counter test completed."); $finish;
end
initial $monitor("Time=%0t rst=%b enable=%b clk=%b q=%b",$time,rst,enable,clk,q);
endmodule

module tb_3bit_downcounter;
reg enable,clk,rst; wire [2:0] q;
bit3_downcounter uut(.enable(enable),.clk(clk),.rst(rst),.q(q));
always #5 clk=~clk;
initial begin
 clk=0; rst=1; enable=1; #12; @(negedge clk); rst=0;
 repeat(10) @(negedge clk); enable=0; repeat(2) @(negedge clk);
 $display("3-bit down-counter test completed."); $finish;
end
initial $monitor("Time=%0t rst=%b enable=%b clk=%b q=%b",$time,rst,enable,clk,q);
endmodule
