`timescale 1ns / 1ps
////////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 01/19/2018 05:45:15 PM
// Design Name: 
// Module Name: non maximum value supress module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: non maximum supress top layer...
// 
////////////////////////////////////////////////
module non_max_filter(
clk     ,
rst_b   ,
hvalid  ,
vvalid  ,

dx      ,
dy      ,
grad_in ,
hsync   ,
fsync   ,
dout    ,

nThrLow ,
nThrHigh);

parameter
        N=3,
        DW=8,
        IW0=8,
        IW1=24;

input   bit                   clk       ;
input   logic                 rst_b     ;
input   logic                 hvalid    ;
input   logic                 vvalid    ;
input   logic   [IW0-1:0]     dx        ;//partial derivative fuction...xcale
input   logic   [IW0-1:0]     dy        ;//partial derivative fuction...ycale
input   logic   [IW1-1:0]     grad_in   ;//serial inputting


output  logic                 hsync     ; //output port declaration
output  logic                 fsync     ;
output  logic  [DW-1:0]       dout      ; //non-maximum supress outputting value......


input   logic   [IW1-1:0]     nThrLow   ; //阈值输入，�?�根�?��?�?�的应用场景通过上层软件�?置
input   logic   [IW1-1:0]     nThrHigh  ;


logic   [1:0]                 ini_row   ;
logic   [1:0]                 ini_column;

logic   [IW0-1:0]             dx_out    ;
logic   [IW0-1:0]             dy_out    ;
logic   [N*IW1-1:0]           grad_out  ;

logic                         hsync_reg ;
logic                         fsync_reg ;


//data from sobel3_filter module...
nline3_buffer #(.N(3),.AW(10),.IW0(IW0),.IW1(IW1),.DW(DW))uu_nline3_buffer(
.clk        (clk            ),//74.5MHz
.rst_b      (rst_b          ),
.vvalid     (vvalid         ),//frame synchronizer
.hvalid     (hvalid         ),//1920x1080
.dx         (dx             ),
.dy         (dy             ),
.grad       (grad_in        ),

.fsync      (fsync_reg      ), //outputing port...
.hsync      (hsync_reg      ),
.dx_out     (dx_out         ),
.dy_out     (dy_out         ),
.grad_out   (grad_out       ),


.ini_row    (ini_row        ),
.ini_column (ini_column     ));    

non_max #(.N(3),.IW0(IW0),.IW1(IW1),.DW(DW)) uu_non_max(
.clk        (clk           ) ,
.rst_b      (rst_b         ) ,
.hvalid     (hsync_reg     ) ,
.vvalid     (fsync_reg     ) ,
.grad       (grad_out      ) ,
.dx         (dx_out        ) ,
.dy         (dy_out        ) ,

.dout       (dout          ),

.nThrLow    (nThrLow       ),
.nThrHigh   (nThrHigh      )); 


wl_srl  #(.DW(1), .NTAPS(24))  u0_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(hsync_reg),.dout(hsync));
wl_srl  #(.DW(1), .NTAPS(24))  u1_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(fsync_reg),.dout(fsync));


endmodule


