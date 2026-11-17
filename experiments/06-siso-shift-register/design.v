module dff (
    input d,
    input clk,
    input rst,
    output reg q
);

always @(posedge clk or posedge rst)
begin
    if (rst)
        q <= 1'b0;
    else
        q <= d;
end

endmodule


module siso_shift_register (
    input clk,
    input rst,
    input serial_in,
    output serial_out
);

wire q1, q2, q3, q4;

dff ff1 (
    .clk(clk),
    .rst(rst),
    .d(serial_in),
    .q(q1)
);

dff ff2 (
    .clk(clk),
    .rst(rst),
    .d(q1),
    .q(q2)
);

dff ff3 (
    .clk(clk),
    .rst(rst),
    .d(q2),
    .q(q3)
);

dff ff4 (
    .clk(clk),
    .rst(rst),
    .d(q3),
    .q(q4)
);

assign serial_out = q4;

endmodule
