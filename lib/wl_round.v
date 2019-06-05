`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: wl_round
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: round processing....vs. floor operation...
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
/////////////////////////////////////////////////////////////////////////

module wl_round(
clk   ,
rst_b ,
din   ,
dout  );

parameter
  IW=16,
  OW=14,
  OREG=1;

input   wire              clk   ;
input   wire              rst_b ;
input   wire  [IW-1:0]    din   ;
output  wire  [OW-1:0]    dout  ;


generate
if(OREG==1) begin
reg [OW-1:0]  dout_reg;

always  @(posedge clk)
if(~rst_b)
    dout_reg<={{OW{1'b0}}};
else
    dout_reg<=din[IW-1:IW-OW] + {{(OW-1){1'b0}},din[IW-OW-1]};

assign    dout=dout_reg;
end
else  begin
assign  dout=din[IW-1:IW-OW] + {{(OW-1){1'b0}},din[IW-OW-1]}; end


endgenerate


endmodule

