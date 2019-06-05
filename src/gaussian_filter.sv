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
module gaussian_filter(
clk       ,//74.5MHz
rst_b     ,
vvalid    ,//frame synchronizer
hvalid    ,//1920x1080
din       ,
fsync     ,
hsync     ,
dout      ,
//arm interface for coefficient
reg_coeff );

parameter
    N=5   ,
    CW=8  ,
    DW=8  ,
    AW=10 ;        

enum  logic [1:0] { S0=2'h0,
                    S1=2'h1,
                    S2=2'h2,
                    S3=2'h3}state;

                  
input   bit                 clk               ;
input   bit                 rst_b             ;
input   logic               hvalid            ;
input   logic               vvalid            ;
input   logic [DW-1:0]      din               ;
output  logic               fsync             ;
output  logic               hsync             ;
output  logic [DW-1:0]      dout              ;

//coefficient interface
input   logic  [N*CW-1:0]   reg_coeff         ;


logic                       fsync_reg         ;
logic                       hsync_reg         ;

//----------------------------------------------------------------------Parameter Interface---------------------------------------------------------------------------------

//line-buffer instance
logic   [N*DW-1:0]    dd                ;
logic   [DW-1:0]      gout              ;
logic   [3:0]         ini_row           ;
logic   [3:0]         ini_column        ;
logic   [DW-1:0]      ini_row_dout      ;
logic   [DW-1:0]      ini_col_dout      ;
logic   [DW-1:0]      ini_row_dout_reg  ;
logic   [DW-1:0]      ini_col_dout_reg  ;


line5_buffer  uu_line5_buffer(
.clk          ( clk                 ),//74.5MHz
.rst_b        ( rst_b               ),
.vvalid       ( vvalid              ),
.hvalid       ( hvalid              ),
.din          ( din                 ),
.fsync        ( fsync_reg           ),
.hsync        ( hsync_reg           ),
.dout         ( dd                  ),
.ini_row_dout ( ini_row_dout_reg    ),
.ini_col_dout ( ini_col_dout_reg    ),
.ini_row      ( ini_row             ),
.ini_column   ( ini_column          ));


gaussian_conv #(.N(5),.DW(DW),.CW(CW))  uu_gaussian_conv(.clk(clk),.rst_b(rst_b),.dd(dd),.coe(reg_coeff),.dout(gout));


wl_srl  #(.DW(1),.NTAPS(10)) u0_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(fsync_reg),.dout(fsync));
wl_srl  #(.DW(1),.NTAPS(6 )) u1_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(hsync_reg),.dout(hsync));

wl_srl  #(.DW(DW),.NTAPS(5)) u2_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(ini_row_dout_reg),.dout(ini_row_dout));
wl_srl  #(.DW(DW),.NTAPS(5)) u3_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(ini_col_dout_reg),.dout(ini_col_dout));


//arbiter for gaussian filter outputting with state-machine
always  @(posedge clk)
if(~rst_b)
    dout<={DW{1'b0}};
else if(|ini_row[3:0])       
    dout<=ini_row_dout;
else if(|ini_column[3:0])    
    dout<=ini_col_dout[DW-1:0];
else
    dout<=gout;



//TEST Point
logic [DW-1:0]  d0_reg;
logic [DW-1:0]  d1_reg;
logic [DW-1:0]  d2_reg;
logic [DW-1:0]  d3_reg;
logic [DW-1:0]  d4_reg;

assign
    d0_reg=dd[DW-1:0],
    d1_reg=dd[2*DW-1:DW],
    d2_reg=dd[3*DW-1:2*DW],
    d3_reg=dd[4*DW-1:3*DW],
    d4_reg=dd[5*DW-1:4*DW];




endmodule

