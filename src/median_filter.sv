`timescale 1ns / 1ps
/////////////////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date:12/21/2017 05:45:15 PM
// Design Name: 
// Module Name:gussian filter for average processing
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: filter5x5
//
//
//
///////////////////////////////////////////////////////////
module median_filter(
clk       ,//74.5MHz
rst_b     ,
vvalid    ,//frame synchronizer
hvalid    ,//1920x1080
din       ,
fsync     ,
hsync     ,
dout      );

parameter
    N=3   ,
    DW=8  ,
    AW=10 ;
    
               
input   bit                 clk     ;
input   bit                 rst_b   ;
input   logic               hvalid  ;
input   logic               vvalid  ;
input   logic [DW-1:0]      din     ;
output  logic               fsync   ;
output  logic               hsync   ;
output  logic [DW-1:0]      dout    ;



logic                       fsync_reg         ;
logic                       hsync_reg         ;

//----------------------------------------------------------------------Parameter Interface---------------------------------------------------------------------------------

//line-buffer instance
logic   [N*DW-1:0]    dd_temp       ;
logic   [1:0]         ini_row       ;
logic   [1:0]         ini_column    ;
logic   [DW-1:0]      d0_out[2:0]   ;
logic   [DW-1:0]      d1_out[2:0]   ;
logic   [DW-1:0]      d2_out[2:0]   ;

logic   [DW-1:0]      d0_reg[2:0]   ;
logic   [DW-1:0]      d1_reg[2:0]   ;
logic   [DW-1:0]      d2_reg[2:0]   ;

logic   [DW-1:0]      dd_reg[2:0]   ;




line3_buffer  #(.N(N),.DW(DW),.AW(AW))  uu_line3_buffer(
.clk          ( clk             ),//74.5MHz
.rst_b        ( rst_b           ),
.vvalid       ( vvalid          ),
.hvalid       ( hvalid          ),
.din          ( din             ),
.fsync        ( fsync_reg       ),
.hsync        ( hsync_reg       ),
.dout         ( dd_temp         ),
.ini_row      ( ini_row         ),
.ini_column   ( ini_column      ));


ucdregr #(.width(DW)) u00_ucdregr(.clk(clk),.r(rst_b),.d(dd_temp[DW-1:0]),.q(d0_out[2]));
ucdregr #(.width(DW)) u01_ucdregr(.clk(clk),.r(rst_b),.d(d0_out[2] ),.q(d0_out[1]));
ucdregr #(.width(DW)) u02_ucdregr(.clk(clk),.r(rst_b),.d(d0_out[1] ),.q(d0_out[0]));

ucdregr #(.width(DW)) u10_ucdregr(.clk(clk),.r(rst_b),.d(dd_temp[2*DW-1:DW]),.q(d1_out[2]));
ucdregr #(.width(DW)) u11_ucdregr(.clk(clk),.r(rst_b),.d(d1_out[2] ),.q(d1_out[1]));
ucdregr #(.width(DW)) u12_ucdregr(.clk(clk),.r(rst_b),.d(d1_out[1] ),.q(d1_out[0]));

ucdregr #(.width(DW)) u20_ucdregr(.clk(clk),.r(rst_b),.d(dd_temp[3*DW-1:2*DW]),.q(d2_out[2]));
ucdregr #(.width(DW)) u21_ucdregr(.clk(clk),.r(rst_b),.d(d2_out[2]),.q(d2_out[1]));
ucdregr #(.width(DW)) u22_ucdregr(.clk(clk),.r(rst_b),.d(d2_out[1]),.q(d2_out[0]));

wl_sort3  #(.DW(DW),.OREG(1)) u0_wl_sort3 (.clk (clk),.rst_b(rst_b),.din({d0_out[2],d0_out[1],d0_out[0]}),.dout({d0_reg[2],d0_reg[1],d0_reg[0]}));
wl_sort3  #(.DW(DW),.OREG(1)) u1_wl_sort3 (.clk (clk),.rst_b(rst_b),.din({d1_out[2],d1_out[1],d1_out[0]}),.dout({d1_reg[2],d1_reg[1],d1_reg[0]}));
wl_sort3  #(.DW(DW),.OREG(1)) u2_wl_sort3 (.clk (clk),.rst_b(rst_b),.din({d2_out[2],d2_out[1],d2_out[0]}),.dout({d2_reg[2],d2_reg[1],d2_reg[0]}));
wl_sort3  #(.DW(DW),.OREG(1)) uu_wl_sort3 (.clk (clk),.rst_b(rst_b),.din({d0_reg[1],d1_reg[1],d2_reg[1]}),.dout({dd_reg[2],dd_reg[1],dd_reg[0]}));

ucdregr #(.width(DW))uu_ucdregr(.clk(clk),.r(rst_b),.d(dd_reg[1]),.q(dout));



SRL16E #(
      .INIT(16'h0000) // Initial Value of Shift Register
   ) uu_srl16 (
      .Q  (fsync  ),// SRL data output
      .A0 (1'b0   ),// Select[0] input
      .A1 (1'b0   ),// Select[1] input
      .A2 (1'b0   ),// Select[2] input
      .A3 (1'b1   ),// Select[3] input
      .CE (1'b1   ),// Clock enable input
      .CLK(clk    ),// Clock input
      .D  (vvalid ));// SRL data input


SRL16E #(
      .INIT(16'h0000) // Initial Value of Shift Register
   ) uv_srl16 (
      .Q  (hsync  ),// SRL data output
      .A0 (1'b0   ),// Select[0] input
      .A1 (1'b0   ),// Select[1] input
      .A2 (1'b0   ),// Select[2] input
      .A3 (1'b1   ),// Select[3] input
      .CE (1'b1   ),// Clock enable input
      .CLK(clk    ),// Clock input
      .D  (hvalid ));// SRL data input




endmodule

