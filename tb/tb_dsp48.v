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

module tb_dsp48;

parameter
        cycle=10;
        

reg             clk   ;
reg             rst_b ;
reg   [17:0]    a     ;
reg   [17:0]    d     ;
reg   [17:0]    b     ;
wire            rst_n ;

wire  [35:0]    p    ;

initial begin
    clk = 1'b0;
   #(cycle/2);
   forever
      #(cycle/2) clk = ~clk;
end

initial begin
        rst_b=1'b0;
#(5*cycle)rst_b=1'b1;end


wl_reset_box  #(.OREG(1)) uu_wl_reset_box(.clk(clk),.rst_b_in(rst_b),.rst_b_out(rst_n));


initial begin
           a=18'd0 ; d=18'd0;  b=18'd0;
#(9*cycle) a=18'd14; d=18'd90; b=18'd5;
#(1*cycle) a=18'd10; d=18'd34; b=18'd6;
#(1*cycle) a=18'd5 ; d=18'd4;  b=18'd7;
#(1*cycle) a=18'd127;d=18'd127;b=18'd10;
#(1*cycle) a=18'd24; d=18'd21; b=18'd8;

#(1*cycle) a=18'd23; d=18'd20; b=18'd7;
#(1*cycle) a=18'd22; d=18'd21; b=18'd6;
#(1*cycle) a=18'd21; d=18'd22; b=18'd5;
#(1*cycle) a=18'd20; d=18'd23; b=18'd4;
#(1*cycle) a=18'd18; d=18'd24; b=18'd3;end





dsp48_ip uu_dsp48_ip (
  .CLK(clk),    // input wire CLK
  .SCLR(~rst_n),  // input wire SCLR
  .A(a),        // input wire [17 : 0] A
  .B(b),        // input wire [17 : 0] B
  .D(d),        // input wire [17 : 0] D
  .P(p)        // output wire [35 : 0] P
);














endmodule

  
