module mem_clear ( clk, start, addr, data_z_r, data_z_g, data_z_b, finish, we_2 );
input start, clk ;
output  [18:0] addr ;
output reg [1:0] data_z_r, data_z_g, data_z_b ;
output  finish, we_2 ;

reg [18:0] addr=0;
reg finish=1;
reg we_2 =0;

always@( posedge clk)
begin
		if (start) 
			begin
				if (addr <= 307199)
					begin
					we_2 = 1 ;
					data_z_r =2'b00; data_z_g =2'b00;  data_z_b =2'b00;
					addr = addr + 1 ;
					finish = 0 ;
					end
				else 
					begin
					finish = 1 ;
					we_2 = 0 ;
					addr =0; 
					end	
			end
		else
			begin
			addr = 0 ;
			data_z_r =2'b00; data_z_g =2'b00;  data_z_b =2'b00;
			we_2 = 0 ;
			finish = 1 ;
			end	
end
endmodule 