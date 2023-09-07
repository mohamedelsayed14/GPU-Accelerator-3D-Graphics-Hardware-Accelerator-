//line_drwaing_on_memory
module line_drawing_on_memory (clk,reset,start,x0,x1,y0,y1,sys_finish);

	parameter WIDTH=13,ADDR_WIDTH=19;
	
	input  clk, reset, start;
	input  [WIDTH-1:0] x0, x1, y0, y1;
	output sys_finish;
	
	wire   [ADDR_WIDTH-1:0] FB_addr;
	wire   color_out,FB_WE;
	
line_drawing line_drawing_insta(clk,reset,start,x0,x1,y0,y1,
                               FB_WE,FB_addr,color_out,sys_finish);
										  
simple_dual_port_framebuffer memory_insta(color_out, ,FB_addr,FB_WE, ,clk, );

endmodule 										 