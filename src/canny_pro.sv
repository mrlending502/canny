`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: canny_pro
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

module canny_pro(
clk       ,//74.5MHz
rst_b     ,
vvalid    ,//frame synchronizer
hvalid    ,//1920x1080
din       ,
fsyn      ,
hsyn      ,
dout      ,
//coefficient interface
reg_coeff );

parameter
        DW=8,
        CW=8;

input   bit                 clk    ;
input   bit                 rst_b  ;
input   logic               hvalid ;
input   logic               vvalid ;
input   logic [DW-1:0]      din    ;
output  logic               fsyn   ;
output  logic               hsyn   ;
output  logic [DW-1:0]      dout   ;

input   logic [5*CW-1:0]    reg_coeff ;


//internal variables
logic     [1:0]         hsync_reg   ;
logic     [1:0]         fsync_reg   ;
logic     [DW-1:0]      gau_dout    ;
logic     [DW-1:0]      sobel_dout  ;

logic     [7:0]         dx          ;
logic     [7:0]         dy          ;
logic     [23:0]        grad_in     ;

/*

gaussian_filter uu_gaussian_filter(
.clk        ( clk           ),//74.5MHz
.rst_b      ( rst_b         ),
.vvalid     ( vvalid        ),//frame synchronizer
.hvalid     ( hvalid        ),//1920x1080
.din        ( din           ),
.fsync      ( fsync_reg[0]  ),
.hsync      ( hsync_reg[0]  ),
.dout       ( gau_dout      ),
//coefficient interface
.reg_coeff  ( reg_coeff     )); 

*/
median_filter uu_median_filter(
.clk        ( clk           ),//74.5MHz
.rst_b      ( rst_b         ),
.vvalid     ( vvalid        ),//frame synchronizer
.hvalid     ( hvalid        ),//1920x1080
.din        ( din           ),
.fsync      ( fsync_reg[0]  ),
.hsync      ( hsync_reg[0]  ),
.dout       ( gau_dout      ));


sobel3_filter  uu_sobel3_filter(
.clk    (clk            ),//74.5MHz
.rst_b  (rst_b          ),
.vvalid (fsync_reg[0]   ),//frame synchronizer
.hvalid (hsync_reg[0]   ),//1920x1080
.din    (gau_dout       ),
.fsync  (fsync_reg[1]   ),
.hsync  (hsync_reg[1]   ),
.sout   (sobel_dout     ),
.dx     (dx             ),
.dy     (dy             ),
.grad   (grad_in        ));



non_max_filter  uu_non_max_filter(
.clk    (clk          ),
.rst_b  (rst_b        ),//input ports
.hvalid (hsync_reg[1] ),
.vvalid (fsync_reg[1] ),
.din    (sobel_dout   ),
.dx     (dx           ),
.dy     (dy           ),
.grad_in(grad_in      ),

.hsync  (hsync        ), //output ports
.fsync  (fsync        ),
.dout   (dout         )); 


endmodule
