//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/23 21:54:27
// Design Name: 
// Module Name: breathctrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module breathctrl(
input			clk		,
input			rst_n	,
output  		waveform
    );

parameter	period	= 11'd2000;
reg			state	;
reg	[6:0]	duty	;
reg	[23:0]	cnt		;

always @(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		cnt <=	1'b0;
	else if(cnt == 12'd1000*period - 1'b1)
		cnt	<=	1'b0;
	else
		cnt	<=	cnt + 1'b1;
end

parameter	bright	=	1'b0;
parameter	dark	=	1'b1;

always @(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		begin
		state	<=	bright;
		duty	<=	7'd0;
		end
	else	if(cnt == 1'b0)
			begin
			case	(state)
						bright:						
								begin
								duty	<=	duty + 1'b1;
								end
						dark:	begin
								duty	<=	duty - 1'b1;
								end
			endcase
			end	
end


always @(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		state	<=	bright;
	else	if(duty == 7'd100)
				state	<=	dark;						
	else	if(duty == 7'd0)							
				state	<=	bright;	
end




pwm pwm_m0(
.clk		(clk	 ),
.rst_n		(rst_n	 ),
.duty		(duty	 ),
.period		(period  ),
.waveform	(waveform)
    );


endmodule
