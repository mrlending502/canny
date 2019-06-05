`timescale 1ns / 1ps
//////////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 01/19/2018 05:45:15 PM
// Design Name: 
// Module Name: sobel_conv
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: edge detection  
/*
 *  Sobel Filter X-Gradient used is 5x5
 *
 *       --- ---- ---- ---- ---
 *      | -1 |  -2 | 0 |  2 | 1 |
 *       --- ---- ---- ---- ---
 *      | -4 |  -8 | 0 |  8 | 4 |
 *       --- ---- ---- ---- ---
 *      | -6 | -12 | 0 | 12 | 6 |
 *       --- ---- ---- ---- ---
 *      | -4 |  -8 | 0 |  8 | 4 |
 *       --- ---- ---- ---- ---
 *      | -1 |  -2 | 0 |  2 | 1 |
 *       --- ---- ---- ---- ---
 */
 /*
 * Sobel Filter Y-Gradient used is 5x5
 *
 *       --- ---- ---- ---- ---
 *      | -1 |  -4 |  -6 |  -4 | -1 |
 *       --- ---- ---- ---- ---
 *      | -2 |  -8 | -12 |  -8 | -2 |
 *       --- ---- ---- ---- ---
 *      |  0 |   0 |   0 |   0 |  0 |
 *       --- ---- ---- ---- --- ---
 *      |  2 |   8 |  12 |   8 |  2 |
 *       --- ---- ---- ---- --- ---
 *      |  1 |   4 |   6 |   4 |  1 |
 *       --- ---- ---- ---- --- ---
 */
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////
module sobel3_conv(
clk   ,
rst_b ,
din   ,
dout  );


parameter 
        N=5,
        DW=9,
        OW=16;

input   bit                 clk   ;
input   logic               rst_b ;

input   logic  [N*DW-1:0]   din   ;
output  logic  [OW-1:0]     dout  ;

logic  [N*DW-1:0]   d0_reg   ;
logic  [N*DW-1:0]   d1_reg   ;
logic  [N*DW-1:0]   d2_reg   ;
logic  [N*DW-1:0]   d3_reg   ;
logic  [N*DW-1:0]   d4_reg   ;

generate
genvar  i;
for(i=0;i<=N-1;i=i+1)begin
  
  wl_regd #(.DW(DW),.OREG(1)) u0_wl_regd(.clk(clk),.rst_b(rst_b),.din(   din[(i+1)*DW-1:i*DW]),.dout(d0_reg[(i+1)*DW-1:i*DW]));
  wl_regd #(.DW(DW),.OREG(1)) u1_wl_regd(.clk(clk),.rst_b(rst_b),.din(d0_reg[(i+1)*DW-1:i*DW]),.dout(d1_reg[(i+1)*DW-1:i*DW]));
  wl_regd #(.DW(DW),.OREG(1)) u2_wl_regd(.clk(clk),.rst_b(rst_b),.din(d1_reg[(i+1)*DW-1:i*DW]),.dout(d2_reg[(i+1)*DW-1:i*DW]));
  wl_regd #(.DW(DW),.OREG(1)) u3_wl_regd(.clk(clk),.rst_b(rst_b),.din(d2_reg[(i+1)*DW-1:i*DW]),.dout(d3_reg[(i+1)*DW-1:i*DW]));
  wl_regd #(.DW(DW),.OREG(1)) u4_wl_regd(.clk(clk),.rst_b(rst_b),.din(d3_reg[(i+1)*DW-1:i*DW]),.dout(d4_reg[(i+1)*DW-1:i*DW]));
  
end
endgenerate








































endmodule
