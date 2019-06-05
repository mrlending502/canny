`timescale 1ns / 1ps
///////////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: line3_buffer for image filter 
// Project Name:  
// Target Devices:
// Tool Versions: 
// Description: line buffer(style:3x3)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////

module  line3_buffer(
clk           ,//74.5MHz
rst_b         ,
vvalid        ,//frame synchronizer
hvalid        ,//1920x1080
din           ,
fsync         ,
hsync         ,
dout          ,
ini_row       ,
ini_column    );

parameter
    N=3  ,
    DW=8 ,
    AW=10;

enum  logic [3:0] { S0=4'h0,
                    S1=4'h1,
                    S2=4'h2,
                    S3=4'h3,
                    S4=4'h4,
                    S5=4'h5,
                    S6=4'h6,
                    S7=4'h7,
                    S8=4'h8,
                    S9=4'h9,
                   S10=4'ha,
                   S11=4'hb,
                   S12=4'hc}state[1:0];

input   bit                 clk           ;
input   bit                 rst_b         ;

input   logic               vvalid        ;
input   logic               hvalid        ;
input   logic  [DW-1:0]     din           ;

output  logic               fsync         ;
output  logic               hsync         ;
output  logic   [N*DW-1:0]  dout          ;

output  logic   [1:0]       ini_row       ;
output  logic   [1:0]       ini_column    ;

//internal variables:
logic   [2*N-1:0]           wea           ;
logic   [AW-1:0]            addra         ;

logic   [DW-1:0]            sout[2*N-1:0] ;
logic   [N*DW-1:0]          dout_reg      ;
logic   [N*DW-1:0]          dout_reg2     ;

logic                       clk_inv       ;
logic   [2:0]               vvalid_reg    ;
logic   [5:0]               hvalid_reg    ;
logic   [DW-1:0]            din_reg[2:0]  ;
logic   [2:0]               hsync_reg     ;
logic   [1:0]               ini_row_reg   ;

wl_regd #(.DW(10)) u0_wl_regd(.clk(clk),.rst_b(rst_b),.din({vvalid,hvalid,din}),.dout({vvalid_reg[0],hvalid_reg[0],din_reg[0]}));
wl_regd #(.DW(10)) u1_wl_regd(.clk(clk),.rst_b(rst_b),.din({vvalid_reg[0],hvalid_reg[0],din_reg[0]}),.dout({vvalid_reg[1],hvalid_reg[1],din_reg[1]}));
wl_regd #(.DW(10)) u2_wl_regd(.clk(clk),.rst_b(rst_b),.din({vvalid_reg[1],hvalid_reg[1],din_reg[1]}),.dout({vvalid_reg[2],hvalid_reg[2],din_reg[2]}));

genvar i;
generate

for(i=0;i<=2*N-1;i=i+1) begin

wl_sram #(.DW(DW),.AW(AW),.OREG(1))   uu_wl_sram(
.clk   (clk              ),
.rst_p (~rst_b           ),
.wea   (wea[i]           ),
.en    (1'b1             ),
.regce (1'b1             ),
.addr  (addra[9:0]       ),
.din   (din_reg[2]       ),
.dout  (sout[i][DW-1:0]  ));

end
endgenerate




always_ff  @(posedge clk)
if(~rst_b)
    state[0]<=S0;
else  begin
  case(state[0])
  S0:if(vvalid_reg[2:1]==2'b01) state[0]<=S1;
  
  S1:if(vvalid_reg[2:1]==2'b10) state[0]<=S0;
     else if(hvalid_reg[1:0]==2'b01) state[0]<=S2;
  S2:if(hvalid_reg[1:0]==2'b10) state[0]<=S3;
 
  S3:if(vvalid_reg[2:1]==2'b10) state[0]<=S0;
     else if(hvalid_reg[1:0]==2'b01)  state[0]<=S4;
  S4:if(hvalid_reg[1:0]==2'b10) state[0]<=S5;
  
  S5:if(vvalid_reg[2:1]==2'b10) state[0]<=S0;
     else if(hvalid_reg[1:0]==2'b01) state[0]<=S6;
  S6:if(hvalid_reg[1:0]==2'b10) state[0]<=S7;
  
  S7:if(vvalid_reg[2:1]==2'b10) state[0]<=S0;
     else if(hvalid_reg[1:0]==2'b01) state[0]<=S8;
  S8:if(hvalid_reg[1:0]==2'b10) state[0]<=S9;
  
  S9:if(vvalid_reg[2:1]==2'b10) state[0]<=S0;
     else if(hvalid_reg[1:0]==2'b01) state[0]<=S10;
 S10:if(hvalid_reg[1:0]==2'b10) state[0]<=S11;
 
 S11:if(vvalid_reg[2:1]==2'b10) state[0]<=S0;
     else if(hvalid_reg[1:0]==2'b01) state[0]<=S12;
 S12:if(hvalid_reg[1:0]==2'b10) state[0]<=S7;
  
default:state[0]<=S0;
  endcase
  end


always_ff  @(posedge clk)
if(~rst_b)
    clk_inv<=1'b0;
else if(hvalid_reg[1:0]==2'b01)
    clk_inv<=1'b0;
else if(hvalid_reg[5:4]==2'b01)
    clk_inv<=1'b1;
else
    clk_inv<=~clk_inv;
    

always_ff  @(posedge clk)
if(~rst_b)
    addra<=10'd0;
else if((hvalid_reg[2:1]==2'b01) || (hvalid_reg[5:4]==2'b01))
    addra<=10'd0;
else if(~clk_inv)begin
     if(addra==10'd959) addra<=10'd0;
     else addra<=addra+10'd1; end
else
    addra<=addra;



//improve timing closure performance with FLIP FLOPS
always_ff  @(posedge  clk)
if(~rst_b)
    wea[0]<=1'b0;
else if((state[0]==S2 || state[0]==S8)&&(hvalid_reg[1]==1'b1)&&(clk_inv==1'b0))
    wea[0]<=1'b1;
else
    wea[0]<=1'b0;

always_ff  @(posedge  clk)
if(~rst_b)
    wea[1]<=1'b0;
else if((state[0]==S2 || state[0]==S8)&&(hvalid_reg[1]==1'b1)&&(clk_inv==1'b1))
    wea[1]<=1'b1;
else
    wea[1]<=1'b0;   

always_ff  @(posedge  clk)
if(~rst_b)
    wea[2]<=1'b0;
else if((state[0]==S4 || state[0]==S10)&&(hvalid_reg[1]==1'b1)&&(clk_inv==1'b0))
    wea[2]<=1'b1;
else
    wea[2]<=1'b0; 

always_ff  @(posedge  clk)
if(~rst_b)
    wea[3]<=1'b0;
else if((state[0]==S4 || state[0]==S10)&&(hvalid_reg[1]==1'b1)&&(clk_inv==1'b1))
    wea[3]<=1'b1;
else
    wea[3]<=1'b0; 

always_ff  @(posedge  clk)
if(~rst_b)
    wea[4]<=1'b0;
else if((state[0]==S6 || state[0]==S12)&&(hvalid_reg[1]==1'b1)&&(clk_inv==1'b0))
    wea[4]<=1'b1;
else
    wea[4]<=1'b0; 

always_ff  @(posedge  clk)
if(~rst_b)
    wea[5]<=1'b0;
else if((state[0]==S6 || state[0]==S12)&&(hvalid_reg[1]==1'b1)&&(clk_inv==1'b1))
    wea[5]<=1'b1;
else
    wea[5]<=1'b0; 



//-----------------------------------------write end Here----------------------------------------------------------

















//-----------------------------------------Read Starting Here------------------------------------------------------

//extend the hsync signal with state-machine style...because the ram bufer's phase is delay two row period...
logic   [10:0]    cnt0;
logic   [10:0]    cnt1;
logic   [10:0]    cnt2;
logic   [10:0]    cnt0_reg;
logic   [10:0]    cnt2_reg;
logic   [1:0]     state_column;



always_ff  @(posedge clk) //one-hot style
if(~rst_b)begin
    cnt0<=11'd0;
    cnt1<=11'd0;
    state[1]<=S0;end
else  begin
  case(state[1])
  S0:if(vvalid_reg[2:1]==2'b01) begin state[1]<=S2;cnt0<=11'd0;cnt1<=11'd0;end
  S1:if(hvalid_reg[2:1]==2'b10) begin state[1]<=S2;cnt0<=11'd0;cnt1<=11'd0;end
  
  S2:if(hvalid_reg[2:1]==2'b10) begin state[1]<=S3;cnt0<=cnt0+11'd1;cnt1<=11'd0;end
  
  S3:if(cnt0==11'd1078) begin state[1]<=S4; cnt0<=cnt0;cnt1<=11'd0;end
     else begin state[1]<=S2;cnt0<=cnt0;cnt1<=cnt1;end
  
  S4:if(cnt1==11'd2047) begin state[1]<=S5;cnt0<=cnt0+11'd1;cnt1<=11'd0;end
     else begin  state[1]<=S4;cnt0<=cnt0;cnt1<=cnt1+11'd1;end
  
  S5:if(cnt0==11'd1079) begin state[1]<=S6; cnt0<=cnt0;cnt1<=11'd0;end
     else begin state[1]<=S5;cnt0<=cnt0;cnt1<=cnt1;end
  
  S6:if(cnt1==11'd2047) begin state[1]<=S7;cnt0<=cnt0+11'd1;cnt1<=11'd0;end
     else begin  state[1]<=S6;cnt0<=cnt0;cnt1<=cnt1+11'd1;end
  
  
  S7:if(cnt0==11'd1080) begin state[1]<=S8; cnt0<=cnt0;cnt1<=11'd0;end
     else begin state[1]<=S7;cnt0<=cnt0;cnt1<=cnt1;end
  
  S8:if(cnt1==11'd2047) begin state[1]<=S9;cnt0<=cnt0+11'd1;cnt1<=11'd0;end
     else begin  state[1]<=S8;cnt0<=cnt0;cnt1<=cnt1+11'd1;end
  
    
  S9:begin state[1]<=S0;cnt0<=11'd0;cnt1<=11'd0;end

default:begin state[1]<=S0;cnt0<=11'd0;cnt1<=11'd0;end
  endcase
  end






always_ff @(posedge clk)
if(~rst_b) begin
    cnt2<=11'd0;
    state_column<=2'd1; end
else  begin
  case(state_column)
  2'd1:if(hsync_reg[1:0]==2'b01)begin cnt2<=11'd0; state_column<=2'd2;end
  2'd2:if(cnt2==11'd2046)begin cnt2<=11'd0; state_column<=2'd1;end
       else begin cnt2<=cnt2+11'd1; state_column<=2'd2; end

default:begin cnt2<=11'd0; state_column<=2'd1; end
  endcase
  end



wl_regd #(.DW(11)) u3_wl_regd(.clk(clk),.rst_b(rst_b),.din(cnt2),.dout(cnt2_reg));




always_ff  @(posedge clk)
if(~rst_b)
    hvalid_reg[3]<=1'b0;
else if(cnt1>=11'd15 && cnt1<=11'd1934)
    hvalid_reg[3]<=1'b1;
else
    hvalid_reg[3]<=1'b0;



wl_regd #(.DW(1))  u4_wl_regd(.clk(clk),.rst_b(rst_b),.din(hvalid_reg[3]),.dout(hvalid_reg[4]));

wl_srl  #(.DW(1),.NTAPS(5)) u0_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(hvalid_reg[4]),.dout(hvalid_reg[5]));



logic   [3:0]   state_reg[1:0];

wl_srl #(.DW(4),.NTAPS(2))  u1_wl_srl(.clk(clk),.rst_b(rst_b),.en(1'b1),.din(state[0]),.dout(state_reg[0]));

always_ff  @(posedge clk)
if(~rst_b)
    hsync_reg[0]<=1'b0;
else if(state_reg[0]==S6||state_reg[0]==S8||state_reg[0]==S10||state_reg[0]==S12)
    hsync_reg[0]<=1'b1;
else if(hvalid_reg[5])
    hsync_reg[0]<=1'b1;
else
    hsync_reg[0]<=1'b0;

wl_regd #(.DW(1))  u5_wl_regd(.clk(clk),.rst_b(rst_b),.din(hsync_reg[0]),.dout(hsync_reg[1]));


wl_srl  #(.DW(1),.NTAPS(5)) u2_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(hsync_reg[0]),.dout(hsync_reg[2]));
wl_srl  #(.DW(1),.NTAPS(2)) u3_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(hsync_reg[2]),.dout(hsync));



always_ff  @(posedge clk)
if(~rst_b)
    fsync<=1'b0;
else if((state[1]==S2) && (hvalid_reg[2:1]==2'b10))
    fsync<=1'b1;
else if(state[1]==S9)
    fsync<=1'b0;
else
    fsync<=fsync;

wl_regd #(.DW(4))  u6_wl_regd(.clk(clk),.rst_b(rst_b),.din(state_reg[0]),.dout(state_reg[1]));

assign
         dout_reg[DW-1:0]=clk_inv?sout[0]:sout[1],
      dout_reg[2*DW-1:DW]=clk_inv?sout[2]:sout[3],
    dout_reg[3*DW-1:2*DW]=clk_inv?sout[4]:sout[5];

wl_srl  #(.DW(N*DW),.NTAPS(11)) u4_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(dout_reg),.dout(dout_reg2));



always_ff @(posedge clk)
if(~rst_b)
    dout[N*DW-1:0]<={N*DW{1'b0}};
else if(state_reg[1]==S6)
    dout[N*DW-1:0]<={{DW{1'b0}},dout_reg[2*DW-1:DW],dout_reg[DW-1:0]};
else if(state_reg[1]==S8)
    dout[N*DW-1:0]<= {dout_reg[3*DW-1:2*DW],dout_reg[2*DW-1:DW],dout_reg[DW-1:0]};
else if(state_reg[1]==S10)
    dout[N*DW-1:0]<={dout_reg[DW-1:0],dout_reg[3*DW-1:2*DW],dout_reg[2*DW-1:DW]};
else if(state_reg[1]==S12)
    dout[N*DW-1:0]<={dout_reg[2*DW-1:DW],dout_reg[DW-1:0],dout_reg[3*DW-1:2*DW]};
else
    dout[N*DW-1:0]<={N*DW{1'b0}};



always_ff  @(posedge clk)  //the 1st row
if(~rst_b)
    ini_row_reg[0]<=1'b0;
else if((cnt0_reg==11'd1)&&(hsync_reg[2]==1'b1) )
    ini_row_reg[0]<=1'b1;
else
    ini_row_reg[0]<=1'b0;



always_ff  @(posedge clk)  //the 1080th row
if(~rst_b)
    ini_row_reg[1]<=1'b0;
else if((cnt0_reg==11'd1080)&&(hsync_reg[2]==1'b1))
    ini_row_reg[1]<=1'b1;
else
    ini_row_reg[1]<=1'b0;


wl_srl  #(.DW(2),.NTAPS(5)) u5_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(ini_row_reg[1:0]),.dout(ini_row[1:0]));

wl_srl  #(.DW(11),.NTAPS(7))u6_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(cnt0),.dout(cnt0_reg));



//-------------------------------------------------------------------------------------------------------------------

assign
      ini_column[0]=(cnt2==11'd2  )?1'b1:1'b0,
      ini_column[1]=(cnt2==11'd1921)?1'b1:1'b0;

//--------------------------------------------------------------------------------------------------------------------

//testpoint as follows

logic [DW-1:0]  d0_reg;
logic [DW-1:0]  d1_reg;
logic [DW-1:0]  d2_reg;

assign
    d0_reg=dout[DW-1:0],
    d1_reg=dout[2*DW-1:DW],
    d2_reg=dout[3*DW-1:2*DW];
//----------------------------------------------------------------------------------------


endmodule
