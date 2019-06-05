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

module wl_dsp48(clk,rst_b,a,b,c,d,pcin,pcout,p);

parameter
    IW0=25,
    IW1=18,
    IW2=47,
    OW =48,
    PREG=1,
    OPMODE=7'h35;

input   wire            clk   ;
input   wire            rst_b ;
input   wire  [47:0]    pcin  ;
input   wire  [29:0]    a     ;
input   wire  [17:0]    b     ;
input   wire  [47:0]    c     ;
input   wire  [24:0]    d     ;

output  wire  [47:0]    pcout ;
output  wire  [47:0]    p     ;

wire    [24:0]  dreg;

wire            rst_p;

wl_regd #(.DW(25),.OREG(1)) uu_wl_regd(.clk(clk),.rst_b(~rst_p),.din(d),.dout(dreg));

wl_reset_box  #(.OREG(1)) uu_wl_reset_box(.clk(clk),.rst_b_in(~rst_b),.rst_b_out(rst_p));


 DSP48E1 #(
      .A_INPUT            ("DIRECT"         ),// Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
      .B_INPUT            ("DIRECT"         ),// Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
      .USE_DPORT          ("TRUE"           ),// Select D port usage (TRUE or FALSE)
      .USE_MULT           ("MULTIPLY"       ),// Select multiplier usage ("MULTIPLY", "DYNAMIC", or "NONE")
      .USE_SIMD           ("ONE48"          ),// SIMD selection ("ONE48", "TWO24", "FOUR12")
      // Pattern Detector Attributes: Pattern Detection Configuration
      .AUTORESET_PATDET   ("NO_RESET"       ),// "NO_RESET", "RESET_MATCH", "RESET_NOT_MATCH" 
      .MASK               (48'h3fffffffffff ),// 48-bit mask value for pattern detect (1=ignore)
      .PATTERN            (48'h000000000000 ),// 48-bit pattern match for pattern detect
      .SEL_MASK           ("MASK"           ),// "C", "MASK", "ROUNDING_MODE1", "ROUNDING_MODE2" 
      .SEL_PATTERN        ("PATTERN"        ),// Select pattern value ("PATTERN" or "C")
      .USE_PATTERN_DETECT ("NO_PATDET"      ),// Enable pattern detect ("PATDET" or "NO_PATDET")
      // Register Control Attributes: Pipeline Register Configuration
      .ACASCREG           (1                ),// Number of pipeline stages between A/ACIN and ACOUT (0, 1 or 2)
      .ADREG              (0                ),// Number of pipeline stages for pre-adder (0 or 1)
      .ALUMODEREG         (1                ),// Number of pipeline stages for ALUMODE (0 or 1)
      .AREG               (1                ),// Number of pipeline stages for A (0, 1 or 2)
      .BCASCREG           (1                ),// Number of pipeline stages between B/BCIN and BCOUT (0, 1 or 2)
      .BREG               (1                ),// Number of pipeline stages for B (0, 1 or 2)
      .CARRYINREG         (1                ),// Number of pipeline stages for CARRYIN (0 or 1)
      .CARRYINSELREG      (1                ),// Number of pipeline stages for CARRYINSEL (0 or 1)
      .CREG               (1                ),// Number of pipeline stages for C (0 or 1)
      .DREG               (1                ),// Number of pipeline stages for D (0 or 1)
      .INMODEREG          (1                ),// Number of pipeline stages for INMODE (0 or 1)
      .MREG               (1                ),// Number of multiplier pipeline stages (0 or 1)
      .OPMODEREG          (1                ),// Number of pipeline stages for OPMODE (0 or 1)
      .PREG               (PREG             ))// Number of pipeline stages for P (0 or 1)
   UU_DSP48E1 (
      // Cascade: 30-bit (each) output: Cascade Ports
      .ACOUT          (               ),// 30-bit output: A port cascade output
      .BCOUT          (               ),// 18-bit output: B port cascade output
      .CARRYCASCOUT   (               ),// 1-bit output: Cascade carry output
      .MULTSIGNOUT    (               ),// 1-bit output: Multiplier sign cascade output
      .PCOUT          (pcout          ),// 48-bit output: Cascade output
      .OVERFLOW       (               ),// 1-bit output: Overflow in add/acc output
      .PATTERNBDETECT (               ),// 1-bit output: Pattern bar detect output
      .PATTERNDETECT  (               ),// 1-bit output: Pattern detect output
      .UNDERFLOW      (               ),// 1-bit output: Underflow in add/acc output
      .CARRYOUT       (               ),// 4-bit output: Carry output
      .P              (p              ),// 48-bit output: Primary data output
      .ACIN           (30'h0          ),// 30-bit input: A cascade data input
      .BCIN           (18'h0          ),// 18-bit input: B cascade input
      .CARRYCASCIN    (1'b0           ),// 1-bit input: Cascade carry input
      .MULTSIGNIN     (1'b0           ),// 1-bit input: Multiplier sign input
      .PCIN           (pcin           ),// 48-bit input: P cascade input
      .ALUMODE        (4'h0           ),// 4-bit input: ALU control input
      .CARRYINSEL     (3'h0           ),// 3-bit input: Carry select input
      .CLK            (clk            ),// 1-bit input: Clock input
      .INMODE         (5'h15          ),// 5-bit input: INMODE control input
      .OPMODE         (OPMODE         ),// 7-bit input: Operation mode input
      .A              (a              ),// 30-bit input: A data input
      .B              (b              ),// 18-bit input: B data input
      .C              (c              ),// 48-bit input: C data input
      .CARRYIN        (1'b0           ),// 1-bit input: Carry input signal
      .D              (dreg           ),// 25-bit input: D data input
      .CEA1           (1'b1           ),// 1-bit input: Clock enable input for 1st stage AREG
      .CEA2           (1'b1           ),// 1-bit input: Clock enable input for 2nd stage AREG
      .CEAD           (1'b1           ),// 1-bit input: Clock enable input for ADREG
      .CEALUMODE      (1'b1           ),// 1-bit input: Clock enable input for ALUMODE
      .CEB1           (1'b1           ),// 1-bit input: Clock enable input for 1st stage BREG
      .CEB2           (1'b1           ),// 1-bit input: Clock enable input for 2nd stage BREG
      .CEC            (1'b1           ),// 1-bit input: Clock enable input for CREG
      .CECARRYIN      (1'b1           ),// 1-bit input: Clock enable input for CARRYINREG
      .CECTRL         (1'b1           ),// 1-bit input: Clock enable input for OPMODEREG and CARRYINSELREG
      .CED            (1'b1           ),// 1-bit input: Clock enable input for DREG
      .CEINMODE       (1'b1           ),// 1-bit input: Clock enable input for INMODEREG
      .CEM            (1'b1           ),// 1-bit input: Clock enable input for MREG
      .CEP            (1'b1           ),// 1-bit input: Clock enable input for PREG
      .RSTA           (rst_p          ),// 1-bit input: Reset input for AREG
      .RSTALLCARRYIN  (rst_p          ),// 1-bit input: Reset input for CARRYINREG
      .RSTALUMODE     (rst_p          ),// 1-bit input: Reset input for ALUMODEREG
      .RSTB           (rst_p          ),// 1-bit input: Reset input for BREG
      .RSTC           (rst_p          ),// 1-bit input: Reset input for CREG
      .RSTCTRL        (rst_p          ),// 1-bit input: Reset input for OPMODEREG and CARRYINSELREG
      .RSTD           (rst_p          ),// 1-bit input: Reset input for DREG and ADREG
      .RSTINMODE      (rst_p          ),// 1-bit input: Reset input for INMODEREG
      .RSTM           (rst_p          ),// 1-bit input: Reset input for MREG
      .RSTP           (rst_p          ));// 1-bit input: Reset input for PREG

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

