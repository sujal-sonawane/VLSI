`timescale 1ns / 1ps
module tb_siso_shift_reg;
reg clk,rst,serial_in; wire serial_out;
siso_shift_register uut(.clk(clk),.rst(rst),.serial_in(serial_in),.serial_out(serial_out));
always #5 clk=~clk;
task drive_bit;
 input value;
 begin @(negedge clk); serial_in=value; end
endtask
initial begin
 clk=0; rst=1; serial_in=0; #12; @(negedge clk); rst=0;
 // Send 1, 0, 1, 1 and then zeros to flush the four stages.
 drive_bit(1'b1); drive_bit(1'b0); drive_bit(1'b1); drive_bit(1'b1);
 drive_bit(1'b0); drive_bit(1'b0); drive_bit(1'b0); drive_bit(1'b0);
 repeat(2) @(negedge clk);
 $display("4-bit SISO shift-register test completed."); $finish;
end
initial $monitor("Time=%0t clk=%b rst=%b serial_in=%b serial_out=%b",$time,clk,rst,serial_in,serial_out);
endmodule
