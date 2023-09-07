module GPU (clock,reset,in_we_inst_mem,in_data_inst_mem,in_address_inst_mem,
			in_we_data_mem,in_data_data_mem,in_address_data_mem,enable_in,
			in_start_serial_parallel_conv,in_start_clear,
			out_triangle_finsh,out_line_drawin_finsh,
			vga_hs, vga_vs, vga_blank_n, vga_sync_n,
			vga_pixel_clk, red_out, green_out, blue_out);

input clock,reset;
input in_we_inst_mem;
input [14:0]in_data_inst_mem;
input [7:0]in_address_inst_mem;
input in_we_data_mem;
input [127:0]in_data_data_mem;
input [7:0]in_address_data_mem;
input enable_in;

input in_start_serial_parallel_conv;
input in_start_clear;
output out_triangle_finsh;
output out_line_drawin_finsh;

output  vga_hs, vga_vs, vga_blank_n, vga_sync_n, vga_pixel_clk ;
output [1:0] red_out, green_out, blue_out ;

wire out_we_inst_mem;
wire [14:0]out_data_inst_mem;
wire [7:0]out_address_inst_mem;
wire out_we_data_mem;
wire [127:0]out_data_data_mem;
wire [7:0]out_address_data_mem;
wire out_start_serial_parallel_conv;
wire in_finsh_serial_parallel_conv;
wire out_start_trin_line;
wire in_triangle_finsh;
wire in_line_drawin_finsh;
wire in_start_writting;
wire out_start_clear;
wire enable_out;
wire [127:0]vert_out;
wire [9:0] x1,y1,x2,y2,x3,y3;
wire [9:0] x_out1,x_out2,y_out1,y_out2;
wire we_line;
wire [18:0]line_drawing_addr_1;
wire [5:0]line_drawing_data;
 
Input_Interface  		M1		(in_we_inst_mem,in_data_inst_mem,in_address_inst_mem,
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
							  
vertex_processor 		M2		(clock,enable_out,reset,out_we_inst_mem,out_address_inst_mem,out_data_inst_mem
								,out_data_data_mem,out_address_data_mem,out_we_data_mem,vert_out);
						  
serial_parallel_conv 	M3 		(out_start_serial_parallel_conv,clock,reset,in_finsh_serial_parallel_conv,
								vert_out[9:0],x1,y1,x2,y2,x3,y3);
						  
Triangle_assembely 		M4		(clock,reset,out_start_trin_line,in_triangle_finsh,x1,x2,x3,y1,y2,y3,
								x_out1,x_out2,y_out1,y_out2);

line_drawing 			M5		(clock, reset, out_start_trin_line, x_out1, x_out2, y_out1, y_out2,
								we_line, line_drawing_addr_1, line_drawing_data, in_line_drawin_finsh);

Video_Interface 		M6 		(clock, vga_hs, vga_vs, vga_blank_n, vga_sync_n, vga_pixel_clk,
								red_out, green_out, blue_out,in_start_writting,out_start_clear,
								line_drawing_addr_1,line_drawing_data,we_line);
								
endmodule 								