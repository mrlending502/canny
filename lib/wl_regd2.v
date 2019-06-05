`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: wl_regd2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: processing the megastability circuit...
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module wl_regd2(
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


wire [DW-1:0]  din_reg;

wl_regd #(.DW(DW),.OREG(1)) uu_wl_regd(.clk(clk),.rst_b(rst_b),.din(din),.dout(din_reg));
wl_regd #(.DW(DW),.OREG(1)) uv_wl_regd(.clk(clk),.rst_b(rst_b),.din(din_reg),.dout(dout));



endmodule

