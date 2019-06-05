`timescale 1ns / 1ps
////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: gaussian_conv
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: convolution
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////

module gaussian_conv(
clk   ,
rst_b ,
dd    ,
coe   ,
dout  );


parameter
        N=5,
        DW=8,
        CW=8;
                
input   wire               clk     ;
input   wire               rst_b   ;

input   wire  [N*DW-1:0]   dd      ;
input   wire  [N*CW-1:0]   coe     ;
output  logic [DW-1:0]     dout    ;

logic   [DW-1:0]    d0_reg[4:0] ;
logic   [DW-1:0]    d1_reg[4:0] ;
logic   [DW-1:0]    d2_reg[4:0] ;
logic   [DW-1:0]    d3_reg[4:0] ;
logic   [DW-1:0]    d4_reg[4:0] ;
logic   [DW-0:0]    temp[12:0]  ;

logic   [CW-1:0]    coeff[4:0]  ;
assign
    coeff[0]=coe[CW-1:0],
    coeff[1]=coe[2*CW-1:CW],
    coeff[2]=coe[3*CW-1:2*CW],
    coeff[3]=coe[4*CW-1:3*CW],
    coeff[4]=coe[5*CW-1:4*CW];

ucdregr #(.width(DW))     u00_ucdregr(.clk(clk),.r(rst_b),.d(dd[DW-1:0]),.q(d0_reg[4]));
ucdregr #(.width(DW))     u01_ucdregr(.clk(clk),.r(rst_b),.d(d0_reg[4]),.q(d0_reg[3]));
ucdregr #(.width(DW))     u02_ucdregr(.clk(clk),.r(rst_b),.d(d0_reg[3]),.q(d0_reg[2]));
ucdregr #(.width(DW))     u03_ucdregr(.clk(clk),.r(rst_b),.d(d0_reg[2]),.q(d0_reg[1]));
ucdregr #(.width(DW))     u04_ucdregr(.clk(clk),.r(rst_b),.d(d0_reg[1]),.q(d0_reg[0]));

ucdregr #(.width(DW))     u05_ucdregr(.clk(clk),.r(rst_b),.d(dd[2*DW-1:DW]),.q(d1_reg[4]));
ucdregr #(.width(DW))     u06_ucdregr(.clk(clk),.r(rst_b),.d(d1_reg[4]),.q(d1_reg[3]));
ucdregr #(.width(DW))     u07_ucdregr(.clk(clk),.r(rst_b),.d(d1_reg[3]),.q(d1_reg[2]));
ucdregr #(.width(DW))     u08_ucdregr(.clk(clk),.r(rst_b),.d(d1_reg[2]),.q(d1_reg[1]));
ucdregr #(.width(DW))     u09_ucdregr(.clk(clk),.r(rst_b),.d(d1_reg[1]),.q(d1_reg[0]));

ucdregr #(.width(DW))     u0a_ucdregr(.clk(clk),.r(rst_b),.d(dd[3*DW-1:2*DW]),.q(d2_reg[4]));
ucdregr #(.width(DW))     u0b_ucdregr(.clk(clk),.r(rst_b),.d(d2_reg[4]),.q(d2_reg[3]));
ucdregr #(.width(DW))     u0c_ucdregr(.clk(clk),.r(rst_b),.d(d2_reg[3]),.q(d2_reg[2]));
ucdregr #(.width(DW))     u0d_ucdregr(.clk(clk),.r(rst_b),.d(d2_reg[2]),.q(d2_reg[1]));
ucdregr #(.width(DW))     u0e_ucdregr(.clk(clk),.r(rst_b),.d(d2_reg[1]),.q(d2_reg[0]));

ucdregr #(.width(DW))     u10_ucdregr(.clk(clk),.r(rst_b),.d(dd[4*DW-1:3*DW]),.q(d3_reg[4]));
ucdregr #(.width(DW))     u11_ucdregr(.clk(clk),.r(rst_b),.d(d3_reg[4]),.q(d3_reg[3]));
ucdregr #(.width(DW))     u12_ucdregr(.clk(clk),.r(rst_b),.d(d3_reg[3]),.q(d3_reg[2]));
ucdregr #(.width(DW))     u13_ucdregr(.clk(clk),.r(rst_b),.d(d3_reg[2]),.q(d3_reg[1]));
ucdregr #(.width(DW))     u14_ucdregr(.clk(clk),.r(rst_b),.d(d3_reg[1]),.q(d3_reg[0]));

ucdregr #(.width(DW))     u15_ucdregr(.clk(clk),.r(rst_b),.d(dd[5*DW-1:4*DW]),.q(d4_reg[4]));
ucdregr #(.width(DW))     u16_ucdregr(.clk(clk),.r(rst_b),.d(d4_reg[4]),.q(d4_reg[3]));
ucdregr #(.width(DW))     u17_ucdregr(.clk(clk),.r(rst_b),.d(d4_reg[3]),.q(d4_reg[2]));
ucdregr #(.width(DW))     u18_ucdregr(.clk(clk),.r(rst_b),.d(d4_reg[2]),.q(d4_reg[1]));
ucdregr #(.width(DW))     u19_ucdregr(.clk(clk),.r(rst_b),.d(d4_reg[1]),.q(d4_reg[0]));


always_ff @(posedge clk)
if(~rst_b)  begin
    temp[0]<={DW{1'b0}};
    temp[1]<={DW{1'b0}};
    temp[2]<={DW{1'b0}};
    temp[3]<={DW{1'b0}};
    temp[4]<={DW{1'b0}};
    temp[5]<={DW{1'b0}};
    temp[6]<={DW{1'b0}};
    temp[7]<={DW{1'b0}};
    temp[8]<={DW{1'b0}};
    temp[9]<={DW{1'b0}};
    temp[10]<={DW{1'b0}};
    temp[11]<={DW{1'b0}}; 
    temp[12]<={DW{1'b0}}; end
else  begin
    temp[0]<= d0_reg[0] + d0_reg[4];
    temp[1]<= d1_reg[0] + d1_reg[4];
    temp[2]<= d2_reg[0] + d2_reg[4];
    temp[3]<= d3_reg[0] + d3_reg[4];
    temp[4]<= d4_reg[0] + d4_reg[4];
    temp[5]<= d0_reg[1] + d0_reg[3];
    temp[6]<= d1_reg[1] + d1_reg[3];
    temp[7]<= d2_reg[1] + d2_reg[3];
    temp[8]<= d3_reg[1] + d3_reg[3];
    temp[9]<= d4_reg[1] + d4_reg[3];
    temp[10]<=d0_reg[2] + d4_reg[2];
    temp[11]<=d1_reg[2] + d3_reg[2];  
    temp[12]<={1'b0,d2_reg[2]}; end


//--------------------------------the 1st stage-----------------------------------
                                                                                                                                          
logic   [35:0]        pout[8:0]     ;                                                                                                                                                                      //
logic   [CW+DW:0]     pout_reg[5:0] ;                                                                                                                                                                                      //
logic   [CW+DW+1:0]   tmp_sum[2:0]  ;         


logic  [DW:0]          a0_reg,a1_reg,a2_reg,a3_reg,a4_reg,a5_reg,a6_reg,a7_reg,a8_reg;
logic  [DW:0]          b0_reg,b1_reg,b2_reg,b3_reg,b4_reg,b5_reg,b6_reg,b7_reg,b8_reg;
logic  [CW-1:0]        c0_reg,c1_reg,c2_reg,c3_reg,c4_reg,c5_reg,c6_reg,c7_reg,c8_reg;
logic  [DW+1:0]        add0_reg,add1_reg,add2_reg,add3_reg,add4_reg,add5_reg,add6_reg,add7_reg,add8_reg;

//(*use_dsp48="yes"*)
logic  [DW+CW+1:0]     m0_reg,m1_reg,m2_reg,m3_reg,m4_reg,m5_reg,m6_reg,m7_reg,m8_reg;
logic  [DW+CW+1:0]     p0_reg,p1_reg,p2_reg,p3_reg,p4_reg,p5_reg,p6_reg,p7_reg,p8_reg;

logic     dsp_en;


always_ff @(posedge clk)
if (~rst_b)
  begin
    a0_reg   <= 0;
    b0_reg   <= 0;
    c0_reg   <= 0;
    add0_reg <= 0;
    m0_reg   <= 0;
    p0_reg   <= 0;  end
 else if(dsp_en) begin
    a0_reg   <= temp[0];
    b0_reg   <= temp[4];
    c0_reg   <= coeff[0];
    add0_reg <= a0_reg + b0_reg;
    m0_reg   <= add0_reg * c0_reg;
    p0_reg   <= m0_reg;  end


always_ff @(posedge clk)
if (~rst_b)
  begin
    a1_reg   <= 0;
    b1_reg   <= 0;
    c1_reg   <= 0;
    add1_reg <= 0;
    m1_reg   <= 0;
    p1_reg   <= 0;  end
 else if(dsp_en) begin
    a1_reg   <= temp[5];
    b1_reg   <= temp[9];
    c1_reg   <= coeff[1];
    add1_reg <= a1_reg + b1_reg;
    m1_reg   <= add1_reg * c1_reg;
    p1_reg   <= m1_reg;  end


always_ff @(posedge clk)
if (~rst_b)
  begin
    a2_reg   <= 0;
    b2_reg   <= 0;
    c2_reg   <= 0;
    add2_reg <= 0;
    m2_reg   <= 0;
    p2_reg   <= 0;  end
 else if(dsp_en) begin
    a2_reg   <= temp[10];
    b2_reg   <= 0;
    c2_reg   <= coeff[2];
    add2_reg <= a2_reg + b2_reg;
    m2_reg   <= add2_reg * c2_reg;
    p2_reg   <= m2_reg;  end


assign
      dsp_en=1'b1,
      pout[0] = p0_reg,
      pout[1] = p1_reg,
      pout[2] = p2_reg;

always_ff @(posedge clk)
if(~rst_b)begin
    pout_reg[0]<={(CW+DW+1){1'b0}};
    pout_reg[1]<={(CW+DW+1){1'b0}};
    tmp_sum[0] <={(CW+DW+2){1'b0}};end
else begin
    pout_reg[1]<=pout[2][CW+DW:0];
    pout_reg[0]<=pout[0][CW+DW-1:0]  + pout[1][CW+DW-1:0];
    tmp_sum[0] <=pout_reg[0][CW+DW:0] + pout_reg[1][CW+DW-1:0];end
    

//-----------------------the 2nd stage--------------------------------

always_ff @(posedge clk)
if (~rst_b)
  begin
    a3_reg   <= 0;
    b3_reg   <= 0;
    c3_reg   <= 0;
    add3_reg <= 0;
    m3_reg   <= 0;
    p3_reg   <= 0;  end
 else if(dsp_en) begin
    a3_reg   <= temp[1];
    b3_reg   <= temp[3];
    c3_reg   <= coeff[0];
    add3_reg <= a3_reg + b3_reg;
    m3_reg   <= add3_reg * c3_reg;
    p3_reg   <= m3_reg;  end


always_ff @(posedge clk)
if (~rst_b)
  begin
    a4_reg   <= 0;
    b4_reg   <= 0;
    c4_reg   <= 0;
    add4_reg <= 0;
    m4_reg   <= 0;
    p4_reg   <= 0;  end
 else if(dsp_en) begin
    a4_reg   <= temp[6];
    b4_reg   <= temp[8];
    c4_reg   <= coeff[1];
    add4_reg <= a4_reg + b4_reg;
    m4_reg   <= add4_reg * c4_reg;
    p4_reg   <= m4_reg;  end


always_ff @(posedge clk)
if (~rst_b)
  begin
    a5_reg   <= 0;
    b5_reg   <= 0;
    c5_reg   <= 0;
    add5_reg <= 0;
    m5_reg   <= 0;
    p5_reg   <= 0;  end
 else if(dsp_en) begin
    a5_reg   <= temp[11];
    b5_reg   <= 0;
    c5_reg   <= coeff[2];
    add5_reg <= a5_reg + b5_reg;
    m5_reg   <= add5_reg * c5_reg;
    p5_reg   <= m5_reg;  end


assign
      pout[3] = p3_reg,
      pout[4] = p4_reg,
      pout[5] = p5_reg;


always_ff @(posedge clk)
if(~rst_b)begin
    pout_reg[2]<={(CW+DW+1){1'b0}};
    pout_reg[3]<={(CW+DW+1){1'b0}};
    tmp_sum[1] <={(CW+DW+2){1'b0}};end
else begin
    pout_reg[2]<=pout[5][CW+DW:0];
    pout_reg[3]<=pout[3][CW+DW-1:0]  + pout[4][CW+DW-1:0];
    tmp_sum[1] <=pout_reg[2][CW+DW:0] + pout_reg[3][CW+DW-1:0];end
                                                                                                                                           
//-------------------------------------------------------------------------------





//-----------------------------------the 3rd stage-------------------------------
always_ff @(posedge clk)
if (~rst_b)
  begin
    a6_reg   <= 0;
    b6_reg   <= 0;
    c6_reg   <= 0;
    add6_reg <= 0;
    m6_reg   <= 0;
    p6_reg   <= 0;  end
 else if(dsp_en) begin
    a6_reg   <= temp[2];
    b6_reg   <= 0;
    c6_reg   <= coeff[0];
    add6_reg <= a6_reg + b6_reg;
    m6_reg   <= add6_reg * c6_reg;
    p6_reg   <= m6_reg;  end


always_ff @(posedge clk)
if (~rst_b)
  begin
    a7_reg   <= 0;
    b7_reg   <= 0;
    c7_reg   <= 0;
    add7_reg <= 0;
    m7_reg   <= 0;
    p7_reg   <= 0;  end
 else if(dsp_en) begin
    a7_reg   <= temp[7];
    b7_reg   <= 0;
    c7_reg   <= coeff[1];
    add7_reg <= a7_reg + b7_reg;
    m7_reg   <= add7_reg * c7_reg;
    p7_reg   <= m7_reg;  end


always_ff @(posedge clk)
if (~rst_b)
  begin
    a8_reg   <= 0;
    b8_reg   <= 0;
    c8_reg   <= 0;
    add8_reg <= 0;
    m8_reg   <= 0;
    p8_reg   <= 0;  end
 else if(dsp_en) begin
    a8_reg   <= temp[12];
    b8_reg   <= 0;
    c8_reg   <= coeff[2];
    add8_reg <= a8_reg + b8_reg;
    m8_reg   <= add8_reg * c8_reg;
    p8_reg   <= m8_reg;  end


assign
      pout[6] = p6_reg,
      pout[7] = p7_reg,
      pout[8] = p8_reg;

always_ff @(posedge clk)
if(~rst_b)begin
    pout_reg[4]<={(CW+DW+1){1'b0}};
    pout_reg[5]<={(CW+DW+1){1'b0}};
    tmp_sum[2] <={(CW+DW+2){1'b0}};end
else begin
    pout_reg[4]<=pout[8][CW+DW:0];
    pout_reg[5]<=pout[6][CW+DW-1:0]  + pout[7][CW+DW-1:0];
    tmp_sum[2] <=pout_reg[4][CW+DW:0] + pout_reg[5][CW+DW-1:0];end
                                                                                                                                         
//----------------------------------------------------------------------------------------




//-------------------------Total multiplier and add algorithm-----------------------------
                                                                                                                                                                                 
//(*use_dsp48="yes"*)
logic   [CW+CW+DW+2:0]  mac_sum_reg[2:0];
logic   [DW-1:0]        mac_sum_reg2[2:0];//round processing... 
logic   [DW:0]          mac_sum_reg3[1:0];
logic   [DW+1:0]        mac_sum_reg4;

always_ff @(posedge clk)
if(~rst_b)begin
    mac_sum_reg[0]<=0;
    mac_sum_reg[1]<=0;
    mac_sum_reg[2]<=0;  end
else  begin
    mac_sum_reg[0]<=coeff[0]  * tmp_sum[0];
    mac_sum_reg[1]<=coeff[1]  * tmp_sum[1];
    mac_sum_reg[2]<=coeff[2]  * tmp_sum[2]; end

always_ff @(posedge clk)
if(~rst_b)begin
    mac_sum_reg2[0]<=0;
    mac_sum_reg2[1]<=0;
    mac_sum_reg2[2]<=0;  end
else  begin 
    mac_sum_reg2[0]<=mac_sum_reg[0][CW+CW+DW-2:CW+CW-1]+{{(DW-1){1'b0}},mac_sum_reg[0][CW+CW-2]};
    mac_sum_reg2[1]<=mac_sum_reg[1][CW+CW+DW-2:CW+CW-1]+{{(DW-1){1'b0}},mac_sum_reg[1][CW+CW-2]};
    mac_sum_reg2[2]<=mac_sum_reg[2][CW+CW+DW-2:CW+CW-1]+{{(DW-1){1'b0}},mac_sum_reg[2][CW+CW-2]}; end


always_ff @(posedge clk)
if(~rst_b)begin
      mac_sum_reg3[0]<={(DW+1){1'b0}};
      mac_sum_reg3[1]<={(DW+1){1'b0}};  end
else  begin
      mac_sum_reg3[0]<={1'b0,mac_sum_reg2[0]};
      mac_sum_reg3[1]<=mac_sum_reg2[1]  + mac_sum_reg2[2];  end



always_ff @(posedge clk)
if(~rst_b)  begin
    dout<={DW{1'b0}};
    mac_sum_reg4<={(DW+2){1'b0}}; end
else  begin
    dout[DW-1:0]<=mac_sum_reg4[DW+1:2]  + {{(DW-1){1'b0}},mac_sum_reg4[1]};
    mac_sum_reg4[DW+1:0]<=mac_sum_reg3[0] + mac_sum_reg3[1];end

                                                                                                                           
endmodule
