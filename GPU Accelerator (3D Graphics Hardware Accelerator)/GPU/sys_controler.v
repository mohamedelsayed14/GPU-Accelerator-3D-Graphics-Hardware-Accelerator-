module sys_controler (clk,vsync, mem_clr_finish, mem_str_clr, swap, str_line_drawing, select);
input 	clk, vsync, mem_clr_finish,mem_str_clr ;
output  swap, str_line_drawing, select ;

reg  swap = 0;
reg  str_line_drawing = 1;
reg  select = 0;
  
always @ (posedge clk)
begin 
 
if (vsync==0)
	begin
	swap <= ~ swap;
	end
else 
	begin
	swap <= (swap);
	end
	
if(mem_str_clr)
	begin
		 if(mem_clr_finish)
			begin
			select<=0;
			str_line_drawing<=1;
			end
		else 
			begin
			select<=1;
			str_line_drawing<=0;
			end	
	end
else 
	begin
		 if(mem_clr_finish)		
			begin
			select<=0;
			str_line_drawing<=1;
			end
		else 
			begin
		    select<=1;
			str_line_drawing<=0;
			end	
	end	
			   
end
endmodule 