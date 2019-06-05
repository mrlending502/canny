`timescale 1ns / 1ps
///////////////////////////////////////
// Company: misrobot
// Engineer: 
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: reset_box
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
/////////////////////////////////////////

module wl_reset_box(
clk       ,
rst_b_in  ,
rst_b_out );


input   wire        clk       ;
input   wire        rst_b_in  ;
output  wire        rst_b_out ;

parameter
        OREG=1;

generate
if(OREG==1)begin

(* ASYNC_REG="TRUE" *)reg   [2:0]   rst_in_reg;
always  @(posedge clk)
begin
  rst_in_reg[2:0]<={rst_in_reg[1:0],rst_b_in};end
assign
  rst_b_out=rst_in_reg[2];
end

else  begin
(* ASYNC_REG="TRUE" *)reg   [1:0]   rst_in_reg;
always  @(posedge clk)
begin
  rst_in_reg[1:0]<={rst_in_reg[0],rst_b_in};end
assign
  rst_b_out=rst_in_reg[1];
end


endgenerate

endmodule

