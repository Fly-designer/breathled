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
    

module pwm(
input               clk		,
input               rst_n		,
input       [6:0]   duty	,
input       [10:0]  period	,
output	reg         waveform
    );


reg		[11:0]		cnt;
reg		[11:0]		cnt_d1;
wire	[11:0]		threshold;
//周期定为100个时钟周期，此处直接赋值duty，否则需要进行乘法、除法运算
assign threshold = 5'd20*duty;//period*duty/7'd100;
	
always @(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		cnt		<=	1'b0;
	else if(cnt == period	-	1'b1)
        cnt		<=	1'b0;
	else
		cnt		<=	cnt + 1'b1;
end


always @(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		cnt_d1		<=	1'b0;
	else
		cnt_d1		<=	cnt;
end		

always @(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		waveform	<=	1'b0;
	else if(cnt_d1 < threshold)
		waveform	<=	1'b1;
	else
		waveform	<=	1'b0;
end
	
endmodule
