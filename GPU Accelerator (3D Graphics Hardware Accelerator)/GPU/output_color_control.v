// this unit control output color value with "dena" & "black_flag" signals
module output_color_control (indata_r, indata_g, indata_b, dena, black_flag,
                            outdata_r, outdata_g, outdata_b);

input dena, black_flag;
input   [1:0] indata_r, indata_g, indata_b;
output  [1:0] outdata_r, outdata_g, outdata_b;
reg     [1:0] outdata_r, outdata_g, outdata_b;

always @(*)
begin
	if((~dena) || black_flag)
		begin
			outdata_r = 2'b00;
			outdata_g = 2'b00;
			outdata_b = 2'b00;
		end
	else
		begin
			outdata_r = indata_r;
			outdata_g = indata_g;
			outdata_b = indata_b;
		end
end 

endmodule 