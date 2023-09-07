// this unit implement simple 1-bit register
module reg_1bit (clk, d, q);
input clk, d;
output q;

reg q;

always @(posedge clk)
q <= d;

endmodule 