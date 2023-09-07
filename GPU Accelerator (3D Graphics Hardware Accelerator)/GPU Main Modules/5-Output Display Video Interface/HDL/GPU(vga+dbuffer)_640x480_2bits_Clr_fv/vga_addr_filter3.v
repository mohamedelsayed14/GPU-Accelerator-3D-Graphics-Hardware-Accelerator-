//this unit is made for Sockit board
//( vga controller ) and ( address generation filter ) connected together

module vga_addr_filter3 (clk, Hsync_out, Vsync_out, pixel_clk_out,
                         nblanck, nsync, display_EN,framebuff_addr, black_flag);
input  clk;
output Hsync_out, Vsync_out, display_EN, pixel_clk_out, nblanck, nsync, black_flag;
output [18:0] framebuff_addr;

wire [9:0] hcnt_addr;
wire [9:0] vcnt_addr;
wire dena;

vga_mod7 D1 (clk, pixel_clk_out, Hsync_out, Vsync_out, hcnt_addr,
              vcnt_addr, dena, nblanck, nsync);

addr_gen_filter3 D2 ( hcnt_addr, vcnt_addr, dena, framebuff_addr, black_flag);

assign display_EN = dena;

endmodule 