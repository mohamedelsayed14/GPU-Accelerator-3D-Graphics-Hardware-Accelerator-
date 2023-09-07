module Triangle_assembely (clk,reset,start,finish,ix_p1,ix_p2,ix_p3,iy_p1,iy_p2,iy_p3,x_out1,x_out2,y_out1,y_out2);
parameter WIDTH=10;

input clk,reset,start;
output reg finish;
output reg [WIDTH-1:0]x_out1,x_out2,y_out1,y_out2;
input [WIDTH-1:0]ix_p1,ix_p2,ix_p3,iy_p1,iy_p2,iy_p3;
reg [WIDTH-1:0]x_p1,x_p2,x_p3,y_p1,y_p2,y_p3;
reg temp;
parameter idel=2'b00,line1=2'b01,line2=2'b10,line3=2'b11;
reg [1:0] state,nextstate;

always@(*)
begin
	if(temp | ~start)
		begin
		x_p1=ix_p1; x_p2=ix_p2; x_p3=ix_p3; y_p1=iy_p1; y_p2=iy_p2; y_p3=iy_p3;
		end
	else 
		begin
		x_p1=x_p1; x_p2=x_p2; x_p3=x_p3; y_p1=y_p1; y_p2=y_p2; y_p3=y_p3;
		end
end
 
always @(posedge clk or posedge reset)
begin
if (reset)
state <= idel;
else
state <= nextstate;
end

always @(state or start )
begin
 nextstate = state;

 finish = 0;
 temp = 1;
case (state)
	idel : 	if (start)
				 begin
				 nextstate = line1;
				 finish = 0;
				 temp = 1 ;
				 end
				else
				 begin
				 nextstate = idel;
				 finish = 0;
				 temp = finish ;
				 end
				 
line1 :     begin
            nextstate = line2;
			   x_out1 = x_p1;y_out1 = y_p1;x_out2 = x_p2;y_out2 = y_p2;
				finish = 0;
				temp = finish ;
		      end
				
line2 :     begin
            nextstate = line3;
			   x_out1 = x_p1;y_out1 = y_p1;x_out2 = x_p3;y_out2 = y_p3;
				finish = 0;
				temp = finish ;
		      end

line3 :     begin
            nextstate = idel;
			   x_out1 = x_p2;y_out1 = y_p2;x_out2 = x_p3;y_out2 = y_p3;
				finish =1;
				temp = finish ;
		      end				
endcase
end
endmodule 