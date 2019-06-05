`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: canny_tb
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

module reg_wr(
clk       ,
rst_b     ,
reg_wea   ,
reg_addr  ,
reg_wdata ,
reg_coeff );


parameter
      DW=8,
      AW=32,
      OREG=1,
      LADDR=32'h1000_1234;

input   wire              clk       ;
input   wire              rst_b     ;
input   wire              reg_wea   ;
input   wire  [AW-1:0]    reg_addr  ;
input   wire  [DW-1:0]    reg_wdata ;
output  wire  [DW-1:0]    reg_coeff ;


reg   [DW-1:0]    coeff;

always  @(posedge clk)
if(~rst_b)
    coeff<={{DW{1'b0}}};
else if(reg_wea && (reg_addr==LADDR))
    coeff<=reg_wdata;
else
    coeff<=coeff;

wl_regd #(.DW(DW),.OREG(OREG))  uu_wl_regd(.clk(clk),.rst_b(rst_b),.din(coeff),.dout(reg_coeff));


endmodule
