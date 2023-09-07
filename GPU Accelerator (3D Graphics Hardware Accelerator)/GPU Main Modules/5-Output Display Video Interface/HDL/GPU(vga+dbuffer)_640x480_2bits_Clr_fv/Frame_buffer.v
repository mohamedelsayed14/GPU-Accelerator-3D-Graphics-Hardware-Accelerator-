// the high level hierarchy for frame buffer memory
// memory implemented as rom memory

module Frame_buffer (clk, we_2, read_addr, write_addr, data_in_r, data_in_g, data_in_b, outdata_r, outdata_g, outdata_b);
input   clk, we_2;
input   [19:0] read_addr, write_addr;
input   [1:0] data_in_r, data_in_g, data_in_b;
output  [1:0] outdata_r, outdata_g, outdata_b;

FB_red_mem   D1 (data_in_r, read_addr, write_addr, we_2, clk, outdata_r );
FB_green_mem D2 (data_in_g, read_addr, write_addr, we_2, clk, outdata_g );
FB_blue_mem  D3 (data_in_b, read_addr, write_addr, we_2, clk, outdata_b );

endmodule 