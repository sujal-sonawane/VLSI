`timescale 1ns/1ps
module tb_binary_to_gray;

reg [2:0] b;
wire [2:0] g;
integer i;

binary_to_gray uut (
    .b(b),
    .g(g)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_binary_to_gray);
    $monitor("Time=%0t | Binary=%b | Gray=%b", $time, b, g);

    for (i = 0; i < 8; i = i + 1)
    begin
        b = i; #10;
    end

    $finish;
end

endmodule
