module addr_arbiter (clk, swap, line_addr_1, vga_addr_2, mem_addr_1, mem_addr_2);
input  clk, swap ;
input  [18:0] line_addr_1, vga_addr_2 ;
output reg [19:0] mem_addr_1, mem_addr_2 ;

always @(posedge clk )
begin
	  if(swap == 0)
	    begin
		  mem_addr_1 <= line_addr_1 ;
	     mem_addr_2 <= vga_addr_2+307200 ;
		 end
	  else
	    begin
		  mem_addr_1 <= line_addr_1++307200;
	     mem_addr_2 <= vga_addr_2  ;
		 end  
end
endmodule
