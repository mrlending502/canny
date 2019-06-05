`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: tb_wl_dsp48
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: unsigned/signed multiplier
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
/////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ns

module tb_sort3;

parameter
        DW=8,
        cycle=10;
        

reg               clk   ;
reg               rst_b ;
reg   [3*DW-1:0]  din   ;
wire  [3*DW-1:0]  dout  ;


initial begin
    clk = 1'b0;
   #(cycle/2);
   forever
      #(cycle/2) clk = ~clk;
end

initial begin
        rst_b=1'b0;
#(5*cycle)rst_b=1'b1;end

initial begin
        din={3*DW{1'b0}};
#(5*cycle)  din={8'd255,8'd255,8'd255};

#(5*cycle)  din={8'd255,8'd254,8'd253};

#(5*cycle)  din={8'd255,8'd256,8'd253};

#(5*cycle)  din={8'd254,8'd253,8'd252}; 

#(5*cycle)  din={8'd254,8'd253,8'd255};

#(5*cycle)  din={8'd250,8'd253,8'd255}; end



wl_sort3 uu_wl_sort3 (
.clk  (clk        ),  // input wire CLK
.rst_b(rst_b      ),  // input wire SCLR
.din  (din        ),  // input wire [17 : 0] A
.dout (dout       )); // input wire [17 : 0] B














endmodule

  
