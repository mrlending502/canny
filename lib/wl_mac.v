`timescale 1ns / 1ps
//////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: wl_dsp48
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:-x
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////

module wl_mac(clk,rst_b,a,b,d,p);

parameter
    LAT=4,
    IW0=25,
    IW1=18,
    OW =48;

input   wire            clk   ;
input   wire            rst_b ;
input   wire  [IW0-1:0] a     ;
input   wire  [IW0-1:0] d     ;

input   wire  [IW1-1:0] b     ;

output  wire  [OW-1:0]  p     ;

reg   [IW1-1:0]    breg;
wire  [IW0-1:0]    dreg;

//wl_regd  #(.DW(IW1),.OREG(1)) uu_wl_regd(.clk(clk),.rst_b(rst_b),.din(b),.dout(breg));

always  @(posedge clk)
if(~rst_b)
    breg<={IW1{1'b0}};
else
    breg <=#1 b;



wl_regd2 #(.DW(IW0),.OREG(1)) u_wl_regd2(.clk(clk),.rst_b(rst_b),.din(d),.dout(dreg));

ADDMACC_MACRO #(
      .DEVICE("7SERIES"),    // Target Device: "7SERIES" 
      .LATENCY(LAT),           // Desired clock cycle latency, 0-4
      .WIDTH_PREADD(IW0),     // Pre-adder input width, 1-25
      .WIDTH_MULTIPLIER(IW1), // Multiplier input width, 1-18
      .WIDTH_PRODUCT(OW)     // MACC output width, 1-48
   ) UU_ADDMACC_MACRO (
      .PRODUCT    ( p           ),   // MACC result output, width defined by WIDTH_PRODUCT parameter
      .CARRYIN    ( 1'b0        ),   // 1-bit carry-in input
      .CLK        ( clk         ),   // 1-bit clock input
      .CE         ( 1'b1        ),   // 1-bit clock enable input
      .LOAD       ( 1'b0        ),   // 1-bit accumulator load input
      .LOAD_DATA  ( 48'd0       ),   // Accumulator load data input, width defined by WIDTH_PRODUCT parameter
      .MULTIPLIER ( b           ),   // Multiplier data input, width defined by WIDTH_MULTIPLIER parameter
      .PREADD2    ( a           ),   // Preadder data input, width defined by WIDTH_PREADD parameter
      .PREADD1    ( d           ),   // Preadder data input, width defined by WIDTH_PREADD parameter
      .RST        ( ~rst_b      ));  // 1-bit active high synchronous reset



endmodule



module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
  GSR_int = 1'b1;
  PRLD_int = 1'b1;
  #(ROC_WIDTH)
  GSR_int = 1'b0;
  PRLD_int = 1'b0;
    end

    initial begin
  GTS_int = 1'b1;
  #(TOC_WIDTH)
  GTS_int = 1'b0;
    end

endmodule

