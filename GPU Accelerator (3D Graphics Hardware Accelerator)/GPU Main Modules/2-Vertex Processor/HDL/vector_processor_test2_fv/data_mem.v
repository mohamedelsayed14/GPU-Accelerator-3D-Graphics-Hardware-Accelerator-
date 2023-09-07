//DATA_MEMORY code (data bus 128 bits) & (address bus 8 bits). addr= vertex read & writ address
//data memory  
module data_mem (clk,we,addr,data_in,data_out,
                 vert_in,addr_inf,we_inf,vert_out) ;
	parameter addr_w=8,data_w=128;

	input  clk,we,we_inf;
	input  [addr_w-1:0] addr,addr_inf; 
	input  [data_w-1:0] data_in,vert_in;
	output reg [data_w-1:0] vert_out;
	output  [data_w-1:0] data_out;
	

reg [data_w-1:0] d_mem [2**addr_w-1:0] ;

initial
	begin
		$readmemb("data_mem_init.txt", d_mem);
	end

//port work on vertex
always@ (posedge clk)
begin
 if (we) 
	begin
	d_mem[addr] <= data_in ;
	vert_out <= data_in ;
	end
end
assign  data_out = d_mem[addr] ;
 

//port general data  
always@ (posedge clk)
begin
 if (we_inf) 
	begin
	d_mem[addr_inf] <= vert_in ;
	end
end
endmodule 