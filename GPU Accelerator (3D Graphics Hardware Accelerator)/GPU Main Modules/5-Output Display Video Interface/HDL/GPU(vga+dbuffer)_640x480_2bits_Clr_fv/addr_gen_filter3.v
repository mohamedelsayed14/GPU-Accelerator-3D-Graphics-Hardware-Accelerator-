// this unit is made for Sockit board
// address generation filter
// the idea here is that we allow input address to pass if Display_EN = 1
// >> also the frame buffer will be viewed in its original resolution 640x480 
// >> all pixels outside this resolution will be zeros

// It's recommended that the color value of the first address of the frame buffer to be zeros

// black_flag signal is used to indicate that o/p color = zeros

module addr_gen_filter3 (hcnt_addr, vcnt_addr, dena, framebuff_addr, black_flag);
input [9:0] hcnt_addr;
input [9:0] vcnt_addr;
input dena;
output [18:0] framebuff_addr;
output black_flag;

reg [9:0]  vcnt_var;
reg [9:0]  hcnt_var; 
reg [18:0] framebuff_addr;
reg [9:0] y;
reg [9:0] x;
reg black_flag;

always @(*)
begin
	if(dena)
		begin 
			hcnt_var = hcnt_addr - 144;
			vcnt_var = vcnt_addr - 35;
		end
	else
		begin
			hcnt_var = 0;
			vcnt_var = 0;
		end
end 

always @(*)
begin
			// making sure that hcnt_var will not exceed 640
			// and vcnt_var will not exceed 480
		if((hcnt_var < 640) && (vcnt_var < 480))
			begin
				x = (hcnt_var[9:0]);  //x = hcnt_var;
				y = (vcnt_var[8:0]);  //y = vcnt_var;
				black_flag = 1'b0;
			end
		else
			begin
				x = 0;
				y = 0;
				black_flag = 1'b1;
			end
		
	framebuff_addr = x + 640 *(y);
end
endmodule 