`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/23 23:01:00
// Design Name: 
// Module Name: testbench
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


module testbench(
    );
reg clk			;
reg rst_n			;
wire waveform	; 

initial begin
    clk = 1'b0	;
    rst_n = 1'b0	;
    #50			;
    rst_n = 1'b1	;
end

always #3 clk	=	~clk;   
    
    
breathctrl breathctrl_m0(
.clk		(clk	 ),
.rst_n		(rst_n	 ),
.waveform   (waveform)
    );
endmodule
