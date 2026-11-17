`timescale 1ns / 1ps
module t_flip_flop_tb;
reg clk,rst,t; wire q,qbar;
t_flip_flop uut(.t(t),.clk(clk),.rst(rst),.q(q),.qbar(qbar));
always #5 clk=~clk;
initial begin
 clk=0; rst=1; t=0; #12; @(negedge clk); rst=0;
 repeat(2) @(negedge clk); t=1;
 repeat(3) @(negedge clk); t=0;
 repeat(2) @(negedge clk);
 $display("T flip-flop test completed."); $finish;
end
initial $monitor("Time=%0t rst=%b t=%b clk=%b q=%b qbar=%b",$time,rst,t,clk,q,qbar);
endmodule

module jk_ff_tb;
reg j,k,clk,rst; wire q,q_bar;
jk_ff uut(.j(j),.k(k),.clk(clk),.rst(rst),.q(q),.q_bar(q_bar));
always #5 clk=~clk;
initial begin
 clk=0; rst=1; j=0; k=0; #12; @(negedge clk); rst=0;
 @(negedge clk); j=0; k=0;
 @(negedge clk); j=0; k=1;
 @(negedge clk); j=1; k=0;
 @(negedge clk); j=1; k=1;
 @(negedge clk); j=1; k=1;
 @(negedge clk); j=0; k=0;
 @(negedge clk); $display("JK flip-flop test completed."); $finish;
end
initial $monitor("Time=%0t rst=%b j=%b k=%b clk=%b q=%b q_bar=%b",$time,rst,j,k,clk,q,q_bar);
endmodule
