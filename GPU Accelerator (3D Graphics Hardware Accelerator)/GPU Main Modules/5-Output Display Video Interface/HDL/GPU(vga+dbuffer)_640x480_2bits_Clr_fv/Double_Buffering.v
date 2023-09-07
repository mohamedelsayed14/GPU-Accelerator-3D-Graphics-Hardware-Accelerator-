module Double_Buffering (clk,v_sync,start_clear,vga_addr_2,line_drawing_addr_1,we_line,str_line_drawing,
                           line_drawing_data,outdata_r, outdata_g, outdata_b);
input  clk,v_sync,start_clear,we_line;
input  [18:0]  vga_addr_2,line_drawing_addr_1;
input  [5:0]   line_drawing_data;
output [1:0]   outdata_r, outdata_g, outdata_b; 
output str_line_drawing;
wire [5:0]mem_clr_data;
wire [5:0]data_in;
wire mem_clr_finish,swap,select,we_clr,we;
wire [18:0]mem_clr_addr,line_addr_1;
wire [19:0]mem_addr_1,mem_addr_2;
wire [1:0]data_z_r, data_z_g, data_z_b,data_in_r, data_in_g, data_in_b;
assign mem_clr_data= {data_z_r, data_z_g, data_z_b};

assign data_in_r= data_in[5:4];
assign data_in_g= data_in[3:2];
assign data_in_b= data_in[1:0];

sys_controler b1 (clk,v_sync, mem_clr_finish, start_clear, swap, str_line_drawing, select);
mem_clear     b2 (clk, start_clear, mem_clr_addr, data_z_r, data_z_g, data_z_b, mem_clr_finish, we_clr );
addr_arbiter  b3 (clk, swap, line_addr_1, vga_addr_2, mem_addr_1, mem_addr_2);
multiplixer m1(line_drawing_addr_1, mem_clr_addr, line_addr_1, select);
multiplixer #(1) m2 (we_line, we_clr, we, select);  
multiplixer #(6) m3 (line_drawing_data, mem_clr_data, data_in, select);
Frame_buffer b4(clk, we , mem_addr_2, mem_addr_1, data_in_r, data_in_g, data_in_b, outdata_r, outdata_g, outdata_b);
endmodule 