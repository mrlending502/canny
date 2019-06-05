`timescale 1ns / 1ps
///////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 01/19/2018 05:45:15 PM
// Design Name: 
// Module Name: sobel_conv
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: edge detection  
/* X-Gradient Computation
 *
 * -------------
 * |-1  0 1|
 * |-2  0 2|
 * |-1  0 1|
 * -------------
 *
 * Y-Gradient Computation
 * -------------
 * | 1   2   1|
 * | 0   0   0|
 * |-1  -2  -1|
 * -------------
 ******************/

// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////

module sobel3_conv(
clk   ,
rst_b ,
din   ,
dx    ,
dy    ,
grad  );


parameter 
        N=3,
        IW=8,
        OW0=8,
        OW1=16;

input   bit                   clk   ;
input   logic                 rst_b ;

input   logic   [N*IW-1:0]    din   ;
output  logic   [OW0-1:0]     dx    ;
output  logic   [OW0-1:0]     dy    ;
output  logic   [OW1-1:0]     grad  ;



logic  unsigned [IW-1:0]         d0_reg[N-1:0];
logic  unsigned [IW-1:0]         d1_reg[N-1:0];
logic  unsigned [IW-1:0]         d2_reg[N-1:0];

logic signed    [IW-0:0]         gx_reg[3:0]  ;
logic signed    [IW-0:0]         gy_reg[3:0]  ;

logic signed    [IW+2:0]         gx_add[1:0]  ;//bit growth is=log2(sum(abs(-1,-2,-1,0,0,0,1,2,1)))=3
logic signed    [IW+2:0]         gy_add[1:0]  ;//bit growth is=log2(sum(abs(1,0,-1,2,0,-2,1,0,-1)))=3

logic signed    [OW0-1:0]        dx_reg       ;
logic signed    [OW0-1:0]        dy_reg       ;


ucdregr #(.width(IW))   u0_ucdregr(.clk(clk), .r(rst_b),  .d( din[IW-1:0]        ), .q(d0_reg[2][IW-1:0]));
ucdregr #(.width(IW))   u1_ucdregr(.clk(clk), .r(rst_b),  .d( d0_reg[2][IW-1:0]  ), .q(d0_reg[1][IW-1:0]));
ucdregr #(.width(IW))   u2_ucdregr(.clk(clk), .r(rst_b),  .d( d0_reg[1][IW-1:0]  ), .q(d0_reg[0][IW-1:0]));
                                                                                    
ucdregr #(.width(IW))   u3_ucdregr(.clk(clk), .r(rst_b),  .d( din[2*IW-1:IW]     ), .q(d1_reg[2][IW-1:0]));
ucdregr #(.width(IW))   u4_ucdregr(.clk(clk), .r(rst_b),  .d( d1_reg[2][IW-1:0]  ), .q(d1_reg[1][IW-1:0]));
ucdregr #(.width(IW))   u5_ucdregr(.clk(clk), .r(rst_b),  .d( d1_reg[1][IW-1:0]  ), .q(d1_reg[0][IW-1:0]));
                                                                                    
ucdregr #(.width(IW))   u6_ucdregr(.clk(clk), .r(rst_b),  .d( din[3*IW-1:2*IW]   ), .q(d2_reg[2][IW-1:0]));
ucdregr #(.width(IW))   u7_ucdregr(.clk(clk), .r(rst_b),  .d( d2_reg[2][IW-1:0]  ), .q(d2_reg[1][IW-1:0]));
ucdregr #(.width(IW))   u8_ucdregr(.clk(clk), .r(rst_b),  .d( d2_reg[1][IW-1:0]  ), .q(d2_reg[0][IW-1:0]));



//----------------------------------------------------------------------------------------------------------------//

//gx direction
assign
      gx_reg[0]={1'b0,d0_reg[2]}-{1'b0,d0_reg[0]},
      gx_reg[1]={1'b0,d1_reg[2]}-{1'b0,d1_reg[0]},
      gx_reg[2]={1'b0,d2_reg[2]}-{1'b0,d2_reg[0]};
      
      

always_ff @(posedge clk)
if(~rst_b)begin
      gx_reg[3]<={(IW+1){1'b0}};
      gx_add[0]<={(IW+3){1'b0}};
      gx_add[1]<={(IW+3){1'b0}};  end
else begin
      gx_reg[3]<=gx_reg[2];
      gx_add[0]<={gx_reg[0][IW],gx_reg[0][IW],gx_reg[0]} + {gx_reg[1][IW],gx_reg[1],1'b0}; //left shift 1bit because of 2x
      gx_add[1]<=gx_add[0] + {gx_reg[3][IW],gx_reg[3][IW],gx_reg[3]};     end

//-----------------------------------------------------------------------------------------------------------------------//





//----------------------------------------------------------------------------------------------------------------------//
//gy direction
assign
      gy_reg[0]={1'b0,d0_reg[2]}-{1'b0,d2_reg[2]},
      gy_reg[1]={1'b0,d0_reg[1]}-{1'b0,d2_reg[1]},
      gy_reg[2]={1'b0,d0_reg[0]}-{1'b0,d2_reg[0]};


always_ff @(posedge clk)
if(~rst_b)begin
      gy_reg[3]<={(IW+1){1'b0}};
      gy_add[0]<={(IW+3){1'b0}};
      gy_add[1]<={(IW+3){1'b0}};  end
else begin
      gy_reg[3]<=gy_reg[2];
      gy_add[0]<={gy_reg[0][IW],gy_reg[0][IW],gy_reg[0]} + {gy_reg[1][IW],gy_reg[1],1'b0};//left shift 1bit because of 2x
      gy_add[1]<=gy_add[0] + {gy_reg[3][IW],gy_reg[3][IW],gy_reg[3]};     end



//wl_srl  component of timing matching with grad signal...


wl_round  #(.IW(IW+2),.OW(OW0),.OREG(1)) u0_wl_round(.clk(clk),.rst_b(rst_b),.din(gx_add[1][IW+1:IW-OW0]),.dout(dx_reg)); //round processing...
wl_round  #(.IW(IW+2),.OW(OW0),.OREG(1)) u1_wl_round(.clk(clk),.rst_b(rst_b),.din(gy_add[1][IW+1:IW-OW0]),.dout(dy_reg));


wl_regd2  #(.DW(OW0),.OREG(1)) u0_wl_regd2(.clk(clk),.rst_b(rst_b),.din(dx_reg),.dout(dx));
wl_regd2  #(.DW(OW0),.OREG(1)) u1_wl_regd2(.clk(clk),.rst_b(rst_b),.din(dy_reg),.dout(dy));



logic unsigned   [2*IW+7:0]    mac_temp0 ;
logic unsigned   [2*IW+7:0]    mac_temp1 ;



// Declare registers for intermediate values
logic   [IW+3:0]      a0_reg,a1_reg,b0_reg,b1_reg,c0_reg,c1_reg;
logic   [IW+3:0]      add0_reg,add1_reg;
//(*use_dsp48="yes"*)
logic   [2*IW+7:0]    m0_reg,m1_reg,p0_reg,p1_reg;
logic     dsp_en;
assign  dsp_en=1'b1;

always @(posedge clk)
 if (~rst_b)
  begin
    a0_reg   <= 0;
    b0_reg   <= 0;
    c0_reg   <= 0;
    add0_reg <= 0;   
    m0_reg   <= 0;
    p0_reg   <= 0;
  end
 else if (dsp_en)
  begin
    a0_reg   <= {gx_add[1][IW+2],gx_add[1][IW+2:0]};
    b0_reg   <= 0;
    c0_reg   <= {gx_add[1][IW+2],gx_add[1][IW+2:0]};
    add0_reg <= a0_reg - b0_reg;        
    m0_reg   <= add0_reg * c0_reg;
    p0_reg   <= m0_reg;
  end

assign 
      mac_temp0 = p0_reg;

always @(posedge clk)
 if (~rst_b)
  begin
    a1_reg   <= 0;
    b1_reg   <= 0;
    c1_reg   <= 0;
    add1_reg <= 0;   
    m1_reg   <= 0;
    p1_reg   <= 0;
  end
 else if (dsp_en)
  begin
    a1_reg   <= {gy_add[1][IW+2],gy_add[1][IW+2:0]};
    b1_reg   <= 0;
    c1_reg   <= {gy_add[1][IW+2],gy_add[1][IW+2:0]};
    add1_reg <= a1_reg - b1_reg;        
    m1_reg   <= add1_reg * c1_reg;
    p1_reg   <= m1_reg;
  end

assign 
      mac_temp1 = p1_reg;





logic   [OW1-2:0]    grad_reg[1:0];

wl_round  #(.IW(2*IW+7),.OW(OW1-1),.OREG(1)) u2_wl_round(.clk(clk),.rst_b(rst_b),.din(mac_temp0[2*IW+6:0]),.dout(grad_reg[0]));
wl_round  #(.IW(2*IW+7),.OW(OW1-1),.OREG(1)) u3_wl_round(.clk(clk),.rst_b(rst_b),.din(mac_temp1[2*IW+6:0]),.dout(grad_reg[1]));

wl_add  #(.IW(OW1-1),.OREG(1)) uu_wl_add(.clk(clk),.rst_b(rst_b),.a(grad_reg[0]),.b(grad_reg[1]),.c(grad));


endmodule
