`timescale 1ns / 1ps
////////////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 01/19/2018 05:45:15 PM
// Design Name: 
// Module Name: wl_rom
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: single port rom,non-line operation (as arctan ,sqrt,and so on) with look-up table
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////
module wl_rom(
clk   ,
en    ,
addr  ,
dout  );

parameter
      DW=8,
      AW=8;
      
localparam
      ROM_DEPTH=2**AW;

input   wire                clk   ;
input   wire                en    ;
input   wire  [AW-1:0]      addr  ;
output  reg   [DW-1:0]      dout  ;

(* rom_style="{distributed | block}" *)

reg [DW-1:0] rom[ROM_DEPTH-1:0];

initial
    $readmemh("<data_file_name>",rom,0,ROM_DEPTH-1);

always @(posedge clk)
if (en)
     dout <= rom[addr];

endmodule
