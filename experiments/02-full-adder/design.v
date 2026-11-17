module half_adder(
    input a, b,
    output sum, carry);

assign sum = a ^ b;
assign carry = a & b;

endmodule

module full_adder(
    input a, b, cin,
    output sum, cout
);

wire s1, c1, c2;

// First Half Adder
half_adder HA1(
    .a(a),
    .b(b),
    .sum(s1),
    .carry(c1));

// Second Half Adder
half_adder HA2(
    .a(s1),
    .b(cin),
    .sum(sum),
    .carry(c2)
);

// OR gate for final carry
assign cout = c1 | c2;

endmodule
