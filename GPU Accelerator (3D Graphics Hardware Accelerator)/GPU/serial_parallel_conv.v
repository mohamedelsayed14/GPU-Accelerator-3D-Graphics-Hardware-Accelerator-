module serial_parallel_conv (start,clk,reset,finish,inp,x1,y1,x2,y2,x3,y3);
parameter WIDTH=9;
input clk,reset,start;
output reg finish;
input [WIDTH:0]inp;
output reg [WIDTH:0]x1,y1,x2,y2,x3,y3;
reg [WIDTH:0]xr1,yr1,xr2,yr2,xr3,yr3;

parameter state_idel=3'd0,state_x1=3'd1,state_y1=3'd2,state_x2=3'd3,state_y2=3'd4,
                     state_x3=3'd5,state_y3=3'd6,state_finish=3'd7;
reg [2:0] state,nextstate;


always @(posedge clk or posedge reset)
begin
if (reset)
state <= state_idel;
else
state <= nextstate;
end

always @(state)
begin
 nextstate = state;
 finish = 0;
case (state)
		state_idel :begin
								if(start)
									begin
									nextstate = state_x1;
									finish = 0;					
									end
							else
									begin
									nextstate = state_idel;
									finish = 0;
									end
							end
		state_x1 :begin
						xr1=inp;
						nextstate = state_y1;
						finish = 0;
						end		
		state_y1 :begin
						yr1=inp;
						nextstate = state_x2;
						finish = 0;
						end	
		state_x2 :begin
						 xr2=inp;
						 nextstate = state_y2;
						 finish = 0;
						end	
		state_y2 :begin
						yr2=inp;
						nextstate = state_x3;
						finish = 0;
						end	
		state_x3 :begin
						xr3=inp; 
						nextstate = state_y3;
						finish = 0;
						end	
		state_y3 :begin
						yr3=inp;
						nextstate = state_finish;
						finish = 0;
						end
	state_finish :begin
						x1=xr1; y1=yr1;
						x2=xr2; y2=yr2;
						x3=xr3; y3=yr3;
						nextstate = state_idel;
						finish = 1;
						end					 
endcase
end
endmodule 