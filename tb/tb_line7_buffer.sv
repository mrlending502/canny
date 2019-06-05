`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: misrobot
// Engineer:tunringrc_2017@aliyun.com 
// 
// Create Date: 01/18/2018 05:45:15 PM
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

module tb_line7_buffer;

parameter
      DW=8,
      AW=10,
      RW=32,
      RD=8 ;
 
parameter
      CYCLE=10;
      

logic           clk     ;
logic           rst_b   ;
logic           hvalid  ;
logic           vvalid  ;
logic [DW-1:0]  sen_dout; //sensor's output    


//Bus interface
logic           reg_wea;
logic [RW-1:0]  reg_addra;
logic [RD-1:0]  reg_wdata;     



initial begin
    clk = 1'b0;
   #(CYCLE/2);
   forever
      #(CYCLE/2) clk = ~clk;
end

initial begin
        rst_b=1'b0;
#(25*CYCLE)rst_b=1'b1;end

stimulus_gen  uu_stimulus_gen(
.clk   (clk       ),
.rst_b (rst_b     ),
.hvalid(hvalid    ),
.vvalid(vvalid    ),
.dout  (sen_dout  ));

line7_buffer #(.AW(AW),.DW(DW),.RW(RW),.RD(RD))  uu_line7_buffer(
.clk       (clk       ),//74.5MHz
.rst_b     (rst_b     ),
.vvalid    (vvalid    ),//frame synchronizer
.hvalid    (hvalid    ),//1920 pix valid
.din       (sen_dout  ),
.fsync     (          ),
.hsync     (          ),
.dout      (          ),
.ini_row   (          ),
.ini_column(          ));



//6   59  128   59    6
//initial begin
//           reg_wea=1'b0;reg_addra=32'h0000_0000;reg_wdata=0;
//#(20*CYCLE)reg_wea=1'b0;reg_addra=32'h0000_0000;reg_wdata=0;
//
//#(   CYCLE)reg_wea=1'b1;reg_addra=32'h43C1_0000;reg_wdata=6;
//#(   CYCLE)reg_wea=1'b0;reg_addra=32'h43C1_0000;reg_wdata=6;
//
//#(   CYCLE)reg_wea=1'b1;reg_addra=32'h43C1_0001;reg_wdata=59;
//#(   CYCLE)reg_wea=1'b0;reg_addra=32'h43C1_0001;reg_wdata=59;
//
//#(   CYCLE)reg_wea=1'b1;reg_addra=32'h43C1_0002;reg_wdata=128;
//#(   CYCLE)reg_wea=1'b0;reg_addra=32'h43C1_0002;reg_wdata=128;
//
//#(   CYCLE)reg_wea=1'b1;reg_addra=32'h43C1_0003;reg_wdata=59;
//#(   CYCLE)reg_wea=1'b0;reg_addra=32'h43C1_0003;reg_wdata=59;
//
//#(   CYCLE)reg_wea=1'b1;reg_addra=32'h43C1_0004;reg_wdata=6;
//#(   CYCLE)reg_wea=1'b0;reg_addra=32'h43C1_0004;reg_wdata=6;end


//the image's data is putting to the matlab/opencv platform for analyzing......
//fid=$fopen('','w+');
//$fprintf()
//$fclose('all');

endmodule

