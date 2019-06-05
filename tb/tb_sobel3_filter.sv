`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: misrobot
// Engineer:tunringrc_2017@aliyun.com 
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: tb_top 
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: test fixture for top simulating...1920x1080==200W pixel
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 1920X1080 STYLE
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ns

module tb_sobel3_filter;

parameter
      N=5,
      DW=8,
      OW=8;
 
parameter
      cycle=10;
      

logic             clk         ;
logic             rst_b       ;
logic             hvalid      ;
logic             vvalid      ;
logic [DW-1:0]    sen_dout    ; //sensor's output

logic             hsync       ;
logic             fsync       ;

logic [OW-1:0]    dx          ;
logic [OW-1:0]    dy          ;
logic [23:0]      grad        ;

initial begin
    clk = 1'b0;
   #(cycle/2);
   forever
      #(cycle/2) clk = ~clk;
end

initial begin
        rst_b=1'b0;
#(16*cycle)rst_b=1'b1;end

stimulus_gen  uu_stimulus_gen(
.clk    (clk       ),
.rst_b  (rst_b     ),
.hvalid (hvalid    ),
.vvalid (vvalid    ),
.dout   (sen_dout  ));


sobel3_filter #(.N(3),.DW(DW),.OW(OW))  uu_sobel3_filter(
.clk    (clk            ),//74.5MHz
.rst_b  (rst_b          ),
.vvalid (vvalid         ),//frame synchronizer
.hvalid (hvalid         ),//1920x1080
.din    (sen_dout       ),
.fsync  (fsync          ),
.hsync  (hsync          ),
.dx     (dx             ),
.dy     (dy             ),
.grad   (grad           ));   


nsink_gen #(.IW0(24),.IW1(DW),.AW(21))  uu_nsink_gen(
.clka   ( clk       ),
.hvalid ( hsync     ),
.vvalid ( fsync     ),
.dx_in  ( dx        ),
.dy_in  ( dy        ),
.grad_in( grad      )); 


endmodule

