module bit3_upcounter (
    input t,
    input clk,
    input rst,
    output reg [2:0] q
);

always @(posedge clk or posedge rst)
begin
    if (rst)
        q <= 3'b000;
    else if (t)
        q <= q + 1'b1;
end

endmodule


module bitasync3 (
    input t,
    input clk,
    input rst,
    output reg [2:0] q
);

always @(negedge clk or posedge rst)
begin
    if (rst)
        q <= 3'b111;
    else if (t)
        q <= q - 1'b1;
end

endmodule
