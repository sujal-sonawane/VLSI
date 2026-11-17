module tb_3bit_upcounter;

reg t, clk, rst;
wire [2:0] q;

bit3_upcounter uut (
    .t(t),
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    t = 1;
    #10 rst = 0;
    #100 $finish;
end

initial
begin
    $monitor("Time=%0t rst=%b clk=%b t=%b q=%b",
             $time, rst, clk, t, q);
end

endmodule


module tb3bitasync;

reg t, clk, rst;
wire [2:0] q;

bitasync3 uut (
    .t(t),
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    $display("t rst clk | q");
    $monitor("%b %b %b | %b", t, rst, clk, q);
    clk = 0;
    rst = 1;
    t = 1;
    #10 rst = 0;
    #100;
    $finish;
end

endmodule
