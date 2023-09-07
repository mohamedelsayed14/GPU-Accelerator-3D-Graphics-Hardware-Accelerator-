// this unit implement two registers connected togethers

module double_reg_1bit (clk, d, q);
input clk, d;
output q;

wire q0;

reg_1bit D1 (clk, d, q0);
reg_1bit D2 (clk, q0, q);

endmodule 