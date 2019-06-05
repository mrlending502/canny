`timescale 1ns / 1ps
////////////////////////////////////////////////
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
////////////////////////////////////////////////
module sobel3_filter(
clk       ,//74.5MHz
rst_b     ,
vvalid    ,//frame synchronizer
hvalid    ,//1920x1080
din       ,
fsync     ,
hsync     ,
sout      ,
dx        ,
dy        ,
grad      );

parameter
      N=3   ,
     DW=8   ,
     OW0=8  ,
     OW1=24 ;
    
input   bit                 clk       ;
input   bit                 rst_b     ;
input   logic               vvalid    ;
input   logic               hvalid    ;
input   logic [DW-1:0]      din       ;

output  logic               fsync     ;
output  logic               hsync     ;
output  logic [DW-1:0]      sout      ;
output  logic [OW0-1:0]     dx        ;
output  logic [OW0-1:0]     dy        ;
output  logic [OW1-1:0]     grad      ;




//line-buffer instance
logic   [N*DW-1:0]    dd_temp     ;
logic   [1:0]         ini_row     ;
logic   [1:0]         ini_column  ;

logic   [15:0]        grad_reg    ;
logic                 fsync_reg   ;
logic                 hsync_reg   ;
logic   [OW0-1:0]     dx_reg      ;
logic   [OW0-1:0]     dy_reg      ;
logic   [DW-1:0]      pout        ;

sline3_buffer  #(.N(3),.DW(DW),.AW(10))  uu_sline3_buffer(
.clk          ( clk             ),//74.5MHz
.rst_b        ( rst_b           ),
.vvalid       ( vvalid          ),
.hvalid       ( hvalid          ),
.din          ( din             ),
.fsync        ( fsync_reg       ),
.hsync        ( hsync_reg       ),
.pout         ( pout            ),
.dout         ( dd_temp         ),
.ini_row      ( ini_row         ),
.ini_column   ( ini_column      ));



sobel3_conv #(.N(N),.IW(DW),.OW0(OW0),.OW1(16))  uu_sobel_conv(
.clk   (clk         ),
.rst_b (rst_b       ),
.din   (dd_temp     ),
.dx    (dx_reg      ),
.dy    (dy_reg      ),
.grad  (grad_reg    ));



wire          grad_rfd;
wire          grad_rdy;
assign    
    grad_rfd=fsync_reg && hsync_reg;


wl_srl  #(.DW(OW0),.NTAPS(23))  u0_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(dx_reg),.dout(dx));
wl_srl  #(.DW(OW0),.NTAPS(23))  u1_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(dy_reg),.dout(dy));
wl_srl  #(.DW(DW), .NTAPS(23))  u2_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(pout),.dout(sout));


wl_srl  #(.DW(1), .NTAPS(23))  u3_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(fsync_reg),.dout(fsync));
wl_srl  #(.DW(1), .NTAPS(23))  u4_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(hsync_reg),.dout(hsync));


wl_sqrt uu_wl_sqrt (
  .aclk                     (clk              ),// input wire aclk
  .s_axis_cartesian_tvalid  (grad_rfd         ),// input wire s_axis_cartesian_tvalid
  .s_axis_cartesian_tdata   ({grad_reg,8'h0}  ),// input wire [23 : 0] s_axis_cartesian_tdata
  .m_axis_dout_tvalid       (grad_rdy         ),// output wire m_axis_dout_tvalid
  .m_axis_dout_tdata        (grad             ));// output wire [23 : 0] m_axis_dout_tdata



endmodule

