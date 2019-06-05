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
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_nline3_buffer;

parameter
      AW=10,
      IW0=8,
      IW1=8;
 
parameter
      cycle=10;
      

logic             clk     ;
logic             rst_b   ;
logic             hvalid  ;
logic             vvalid  ;
logic [IW1-1:0]   sen_dout; //sensor's output    



initial begin
    clk = 1'b0;
   #(cycle/2);
   forever
      #(cycle/2) clk = ~clk;
end

initial begin
        rst_b=1'b0;
#(25*cycle)rst_b=1'b1;end

stimulus_gen  uu_stimulus_gen(
.clk   (clk       ),
.rst_b (rst_b     ),
.hvalid(hvalid    ),
.vvalid(vvalid    ),
.dout  (sen_dout  ));


nline3_buffer #(.N(3),.AW(10),.IW0(IW0),.IW1(IW1),.DW(IW1))uu_nline3_buffer(
.clk        (clk            ),//74.5MHz
.rst_b      (rst_b          ),
.din        (8'h0           ),
.vvalid     (vvalid         ),//frame synchronizer
.hvalid     (hvalid         ),//1920x1080
.dx         (sen_dout       ),
.dy         (sen_dout       ),
.grad       (sen_dout       ),
                          
.fsync      (              ), //outputing port...
.hsync      (              ),
.dout       (              ),
.dx_out     (              ),
.dy_out     (              ),
.grad_sout  (              ),
.grad_out   (              ),
.ini_row    (              ),
.ini_column (              ));  






















endmodule

