// this unit implement simple 19-bit register
module reg_19bit (clk, d, q);
input clk;
input [18:0] d;
output [18:0] q;

reg [18:0] q;

always @(posedge clk)
q <= d;

endmodule 