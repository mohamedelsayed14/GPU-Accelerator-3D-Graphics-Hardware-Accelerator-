// GCompare unit ** > ** Greater than
// Algorithm :: bool c = a > b;
// unit type :: combinational
// Note      :: all arithmetic operations will use signed (2'complement) 10-bit width

module GCompare
#(parameter WIDTH=10)
(a, b, c);
input signed [WIDTH-1:0] a, b;
output c;

assign c = (a > b)? 1'b1 : 1'b0 ;
endmodule 