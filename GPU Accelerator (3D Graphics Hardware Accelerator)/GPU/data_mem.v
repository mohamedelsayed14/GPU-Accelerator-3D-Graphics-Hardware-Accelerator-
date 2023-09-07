//DATA_MEMORY code (data bus 128 bits) & (address bus 8 bits). 
//data memory 
/*
// this consider data mem as registers (this is design and work)
module data_mem (clk,we,addr,data_in,data_out,
                 vert_in,addr_inf,we_inf,vert_out) ;
	parameter addr_w=8,data_w=128;

	input  clk,we,we_inf;
	input  [addr_w-1:0] addr,addr_inf; 
	input  [data_w-1:0] data_in,vert_in;
	output reg [data_w-1:0] vert_out;
	output  [data_w-1:0] data_out;
	

reg [data_w-1:0] d_mem [2**addr_w-1:0] ;



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

*/


///////////////////////////////////////////////////////////////
//onlyyyyyyy  for report 
// this consider data mem as a memory (for report) 
module data_mem (clk,we,addr,data_in,data_out,
                 vert_in,addr_inf,we_inf,vert_out) ;
	parameter addr_w=8,data_w=128;

	input  clk,we,we_inf;
	input  [addr_w-1:0] addr,addr_inf; 
	input  [data_w-1:0] data_in,vert_in;
	output reg [data_w-1:0] vert_out;
	output  reg [data_w-1:0] data_out;
	

reg [data_w-1:0] d_mem [2**addr_w-1:0] ;



//port work on vertex
always@ (posedge clk)
begin
 if (we) 
	begin
	d_mem[addr] <= data_in ;
	data_out <= data_in ;
	end
	else
	begin
	data_out <= d_mem[addr] ;
	end
end 
 

//port general data  
always@ (posedge clk)
begin
 if (we_inf) 
	begin
	d_mem[addr_inf] <= vert_in;
	vert_out <=vert_in;
	end 
	else
	begin 
	vert_out <=d_mem[addr_inf];
	end
end
endmodule 