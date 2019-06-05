`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: wl_mult
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: unsigned/signed multiplier
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
/////////////////////////////////////////////////////////////////////////
module wl_mult(
clk   ,
rst_b ,
din   ,
dout  );

parameter
  IW=8,
  OW=8,
  NT=3,
  OREG=1;

input   wire              clk   ;
input   wire              rst_b ;
input   wire  [2*IW-1:0]  din   ;
output  wire  [OW-1:0]    dout  ;

wire  [2*IW+1:0]  pout;
MULT_MACRO #(
   .DEVICE  ("7SERIES"), // Target Device: "7SERIES" 
   .LATENCY (NT       ), // Desired clock cycle latency, 0-4
   .WIDTH_A (IW+1     ), // Multiplier A-input bus width, 1-25
   .WIDTH_B (IW+1     ) // Multiplier B-input bus width, 1-18
) UU_MULT_MACRO (
   .P   (pout                   ),// Multiplier output bus, width determined by WIDTH_P parameter 
   .A   ({1'b0,din[IW-1:0]}     ),// Multiplier input A bus, width determined by WIDTH_A parameter 
   .B   ({1'b0,din[2*IW-1:IW]}  ),// Multiplier input B bus, width determined by WIDTH_B parameter 
   .CE  (1'b1                   ),// 1-bit active high input clock enable
   .CLK (clk                    ),// 1-bit positive edge clock input
   .RST (~rst_b                 ));// 1-bit input active high reset


generate
if(OREG==1)begin
reg   [OW-1:0]  dout_reg;
always  @(posedge clk)
if(~rst_b)
    dout_reg<={{OW{1'b0}}};
else
    dout_reg<=pout[2*IW+1:2*IW-OW+2];
assign    dout=dout_reg;
end
else  begin
  assign
    dout=pout[2*IW-1:2*IW-OW]; end
endgenerate


endmodule

  
