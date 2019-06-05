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

module tb_gaussian_filter;

parameter
      N=5,
      DW=8,
      AW=10,
      RW=32,
      RD=8 ;
 
parameter
      cycle=10;
      

logic             clk         ;
logic             rst_b       ;
logic             hvalid      ;
logic             vvalid      ;
logic [DW-1:0]    sen_dout    ; //sensor's output

logic             hsync       ;
logic             fsync       ;
logic [N*DW-1:0]  line5_dout  ;
logic [3:0]       ini_row     ;
logic [3:0]       ini_column  ;   

logic [DW-1:0]    gau_out     ;
//Bus interface
logic             reg_wea     ;
logic [RW-1:0]    reg_addra   ;
logic [RD-1:0]    reg_wdata   ;

logic             reg_rd      ;
logic [RW-1:0]    reg_addrb   ;
logic [RD-1:0]    reg_rdata   ;



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


gaussian_filter uu_gaussian_filter(
.clk        ( clk         ) ,//74.5MHz
.rst_b      ( rst_b       ) ,
.vvalid     ( vvalid      ) ,//frame synchronizer
.hvalid     ( hvalid      ) ,//1920x1080
.din        ( sen_dout    ) ,
.fsync      ( fsync       ) ,
.hsync      ( hsync       ) ,
.dout       ( gau_out     ) ,
//coefficient interface
.reg_coeff  ({8'd6,8'd59,8'd128,8'd59,8'd6})); 


sink_gen  #(.AW(21),.DW(DW))  uu_sink_gen(
.clka   ( clk       ),
.hvalid ( hsync     ),
.vvalid ( fsync     ),
.din    ( gau_out   ));


endmodule

