module Input_Interface(in_we_inst_mem,in_data_inst_mem,in_address_inst_mem,
                       out_we_inst_mem,out_data_inst_mem,out_address_inst_mem,
							  in_we_data_mem,in_data_data_mem,in_address_data_mem,
                       out_we_data_mem,out_data_data_mem,out_address_data_mem,
							  in_start_serial_parallel_conv,out_start_serial_parallel_conv,
							  in_finsh_serial_parallel_conv,
							  out_start_trin_line,
							  in_triangle_finsh,out_triangle_finsh,
							  in_line_drawin_finsh,out_line_drawin_finsh,
							  in_start_writting,
							  in_start_clear,out_start_clear,enable_in,enable_out);


input in_we_inst_mem;
input [14:0]in_data_inst_mem;
input [7:0]in_address_inst_mem;
output out_we_inst_mem;
output [14:0]out_data_inst_mem;
output [7:0]out_address_inst_mem;
					
input in_we_data_mem;
input [127:0]in_data_data_mem;
input [7:0]in_address_data_mem;
output out_we_data_mem;
output [127:0]out_data_data_mem;
output [7:0]out_address_data_mem;
input enable_in;
output enable_out;
							  
input in_start_serial_parallel_conv;
output out_start_serial_parallel_conv;
input in_finsh_serial_parallel_conv;
input in_start_writting;
output out_start_trin_line;
input in_triangle_finsh;
output out_triangle_finsh;
input in_line_drawin_finsh;
output out_line_drawin_finsh;
input in_start_clear;
output out_start_clear;
							  
							  
assign out_we_inst_mem=in_we_inst_mem;
assign out_data_inst_mem=in_data_inst_mem;
assign out_address_inst_mem=in_address_inst_mem;
		
assign out_we_data_mem=in_we_data_mem;
assign out_data_data_mem=in_data_data_mem;
assign out_address_data_mem=in_address_data_mem;
assign enable_out = enable_in;							  
assign out_start_serial_parallel_conv=in_start_serial_parallel_conv;	 
assign out_start_trin_line=in_finsh_serial_parallel_conv	& in_start_writting;							 	 
assign out_triangle_finsh =in_triangle_finsh;
assign out_line_drawin_finsh =in_line_drawin_finsh;	
assign out_start_clear = in_start_clear;								
							 
endmodule 