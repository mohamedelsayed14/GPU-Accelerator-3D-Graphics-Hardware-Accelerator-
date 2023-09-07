// this is the high level hierarchy for Frame_buffer_VGA project
// input clk is 50Mhz

module Video_Interface (clk_50, vga_hs, vga_vs, vga_blank_n, vga_sync_n,
                         vga_pixel_clk, red_out, green_out, blue_out,str_line_drawing,start_clear,
						 line_drawing_addr_1,line_drawing_data,we_line);
input  clk_50;
output [1:0] red_out, green_out, blue_out;
output vga_hs, vga_vs, vga_blank_n, vga_sync_n, vga_pixel_clk;
output str_line_drawing;
input start_clear;
input [18:0] line_drawing_addr_1;
input [5:0] line_drawing_data;     
input we_line;


// unregistered outputs

wire display_EN, black_flag, Hsync_out, Vsync_out;
wire [18:0] framebuff_addr;
wire [1:0] red_out_fb, green_out_fb, blue_out_fb;

// registered output
wire R_black_flag, dena;
wire [18:0] R_framebuff_addr;

 
vga_addr_filter3 U1 (clk_50, Hsync_out, Vsync_out, vga_pixel_clk, vga_blank_n,
                     vga_sync_n, display_EN, framebuff_addr, black_flag);
							
Double_Buffering U2(clk_50,vga_vs,start_clear,R_framebuff_addr,line_drawing_addr_1,we_line,str_line_drawing,
                           line_drawing_data,red_out_fb, green_out_fb, blue_out_fb);
					
double_reg_1bit  U3 (clk_50, Hsync_out, vga_hs);

double_reg_1bit  U4 (clk_50, Vsync_out, vga_vs);

reg_19bit        U5 (clk_50, framebuff_addr, R_framebuff_addr);

double_reg_1bit  U7 (clk_50, black_flag, R_black_flag);

double_reg_1bit  U8 (clk_50, display_EN, dena);

output_color_control U9 (red_out_fb, green_out_fb, blue_out_fb, dena, R_black_flag,
                          red_out, green_out, blue_out);

endmodule 