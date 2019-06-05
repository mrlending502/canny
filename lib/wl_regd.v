`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: wl_regd
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



module wl_regd(
clk   ,
rst_b ,
din   ,
dout  );

parameter
        DW=8,
        OREG=1;

  
input   wire            clk   ;
input   wire            rst_b ;
input   wire  [DW-1:0]  din   ;
output  wire  [DW-1:0]  dout  ;


generate
if(OREG==1)begin
reg [DW-1:0]  dout_reg;
always  @(posedge clk)
if(~rst_b)
  dout_reg<={{DW{1'b0}}};
else
  dout_reg<=din;
assign
  dout=dout_reg;
end
else begin

assign  dout=din;
end
endgenerate

endmodule


  
  
  
  
  
  
