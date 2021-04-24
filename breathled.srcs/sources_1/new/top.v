//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 10:28:34
// Design Name: 
// Module Name: top
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


module top(
input               sys_clk_p,
input               sys_clk_n,
input               rst_n,
output  wire [3:0]   led
    );



assign led[3:1] = 3'b111;  
wire    clk;

IBUFDS sys_clk_ibufgds 
(
 .I (sys_clk_p  ),
 .IB(sys_clk_n  ),
 .O (clk        )
   );
    

 
    
breathctrl breathctrl_m0(
.clk	 (clk	 )	,
.rst_n	 (rst_n	 )	,
.waveform(led[0])
    );
    
    
    
    
    
    
    
    
endmodule
