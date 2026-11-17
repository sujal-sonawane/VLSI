`timescale 1ns/1ps

module tb_full_adder;

reg a, b, cin;
wire sum, cout;
integer i;

// Instantiate Full Adder
full_adder uut(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin
    $monitor("Time=%0t | A=%b B=%b Cin=%b | Sum=%b Cout=%b",
             $time, a, b, cin, sum, cout);

    for(i=0; i<8; i=i+1) begin
        {a, b, cin} = i;
        #10;
    end

    $finish;
end

endmodule
