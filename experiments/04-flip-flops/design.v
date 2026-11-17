module t_flip_flop (
    input t,
    input clk,
    input rst,
    output reg q,
    output qbar
);

assign qbar = ~q;

always @(posedge clk or posedge rst)
begin
    if (rst)
        q <= 1'b0;
    else if (t)
        q <= ~q;
    else
        q <= q;
end

endmodule


module jk_ff (
    input j,
    input k,
    input clk,
    input rst,
    output reg q,
    output q_bar
);

assign q_bar = ~q;

always @(posedge clk or posedge rst)
begin
    if (rst)
        q <= 1'b0;
    else
    begin
        case ({j, k})
            2'b00: q <= q;       // No change
            2'b01: q <= 1'b0;    // Reset
            2'b10: q <= 1'b1;    // Set
            2'b11: q <= ~q;      // Toggle
        endcase
    end
end

endmodule
