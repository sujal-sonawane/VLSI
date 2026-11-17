`timescale 1ns / 1ps

module t_flip_flop_tb;

reg clk;
reg rst;
reg t;
wire q;
wire qbar;

t_flip_flop uut (
    .clk(clk),
    .rst(rst),
    .t(t),
    .q(q),
    .qbar(qbar)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    t = 0;
    #10;
    rst = 0;
    #10;
    t = 0;
    #10;
    t = 1;
    #30;
    t = 0;
    #20;
    t = 1;
    #5;
    $finish;
end

initial
begin
    $monitor("Time = %0t | Reset = %b | T = %b | Q = %b | Qbar = %b",
             $time, rst, t, q, qbar);
end

endmodule


`timescale 1ns / 1ps

module jk_ff_tb;

reg j, k, clk, rst;
wire q, q_bar;

jk_ff uut (
    .j(j),
    .k(k),
    .clk(clk),
    .rst(rst),
    .q(q),
    .q_bar(q_bar)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    j = 0;
    k = 0;

    #10 rst = 0;

    j = 0; k = 0; #10;
    j = 0; k = 1; #10;
    j = 1; k = 0; #10;
    j = 1; k = 1; #10;
    j = 1; k = 1; #10;
    j = 0; k = 0; #10;
    $finish;
end

initial
begin
    $monitor("Time=%0t rst=%b j=%b k=%b clk=%b q=%b q_bar=%b",
             $time, rst, j, k, clk, q, q_bar);
end

endmodule
