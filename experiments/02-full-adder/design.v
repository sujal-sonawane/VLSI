`timescale 1ns / 1ps
module half_adder(input wire a, b, output wire sum, carry);
assign sum=a^b; assign carry=a&b;
endmodule

module full_adder(input wire a, b, cin, output wire sum, cout);
wire s1, c1, c2;
half_adder HA1(.a(a), .b(b), .sum(s1), .carry(c1));
half_adder HA2(.a(s1), .b(cin), .sum(sum), .carry(c2));
assign cout=c1|c2;
endmodule
