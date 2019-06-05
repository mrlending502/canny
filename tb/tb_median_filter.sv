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

module tb_median_filter;

parameter
      N=3,
      DW=8;
       
parameter
      cycle=10;
      

logic             clk         ;
logic             rst_b       ;
logic             hvalid      ;
logic             vvalid      ;
logic [DW-1:0]    sen_dout    ; //sensor's output

logic             hsync       ;
logic             fsync       ;

logic [DW-1:0]    mdout       ;




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

median_filter uu_median_filter(
.clk    (clk        ),
.rst_b  (rst_b      ),
.vvalid (vvalid     ),
.hvalid (hvalid     ),
.din    (sen_dout   ),
.fsync  (fsync      ),
.hsync  (hsync      ),
.dout   (mdout      ));   

sink_gen  #(.AW(21),.DW(DW))  uu_sink_gen(
.clka   ( clk       ),
.hvalid ( hsync     ),
.vvalid ( fsync     ),
.din    ( mdout     ));



endmodule

