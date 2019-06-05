`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: line5_buffer for image filter 
// Project Name:  
// Target Devices:
// Tool Versions: 
// Description: line buffer(style:5x5)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module  line5_buffer(
clk           ,//74.5MHz
rst_b         ,
vvalid        ,//frame synchronizer
hvalid        ,//1920x1080
din           ,
fsync         ,
hsync         ,
dout          ,
ini_row_dout  ,
ini_col_dout  ,
//
ini_row       ,
ini_column    );

parameter
    N=5  ,
    DW=8 ,
    AW=10;
    
enum  logic [4:0] { S0=5'h0,
                    S1=5'h1,
                    S2=5'h2,
                    S3=5'h3,
                    S4=5'h4,
                    S5=5'h5,
                    S6=5'h6,
                    S7=5'h7,
                    S8=5'h8,
                    S9=5'h9,
                   S10=5'ha,
                   S11=5'hb,
                   S12=5'hc,
                   S13=5'hd,
                   S14=5'he,
                   S15=5'hf,
                   S16=5'h10,
                   S17=5'h11,
                   S18=5'h12,
                   S19=5'h13,
                   S20=5'h14,
                   S21=5'h15,
                   S22=5'h16}state[1:0];

input   bit                 clk           ;
input   bit                 rst_b         ;

input   logic               vvalid        ;
input   logic               hvalid        ;
input   logic  [DW-1:0]     din           ;

output  logic               fsync         ;
output  logic               hsync         ;
output  logic   [N*DW-1:0]  dout          ;

output  logic   [DW-1:0]    ini_row_dout  ;
output  logic   [DW-1:0]    ini_col_dout  ;

output  logic   [3:0]       ini_row       ;
output  logic   [3:0]       ini_column    ;

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
logic   [3:0]               ini_row_reg   ;
logic   [3:0]               ini_column_reg;

ucdregr #(.width(10)) u0_ucdregr(.clk(clk),.r(rst_b),.d({vvalid,hvalid,din}),.q({vvalid_reg[0],hvalid_reg[0],din_reg[0]}));
ucdregr #(.width(10)) u1_ucdregr(.clk(clk),.r(rst_b),.d({vvalid_reg[0],hvalid_reg[0],din_reg[0]}),.q({vvalid_reg[1],hvalid_reg[1],din_reg[1]}));
ucdregr #(.width(10)) u2_ucdregr(.clk(clk),.r(rst_b),.d({vvalid_reg[1],hvalid_reg[1],din_reg[1]}),.q({vvalid_reg[2],hvalid_reg[2],din_reg[2]}));



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
 S12:if(hvalid_reg[1:0]==2'b10) state[0]<=S13;
 
 S13:if(vvalid_reg[2:1]==2'b10) state[0]<=S0;
     else if(hvalid_reg[1:0]==2'b01) state[0]<=S14;
 S14:if(hvalid_reg[1:0]==2'b10) state[0]<=S15;
 
 S15:if(vvalid_reg[2:1]==2'b10) state[0]<=S0;
     else if(hvalid_reg[1:0]==2'b01) state[0]<=S16;
 S16:if(hvalid_reg[1:0]==2'b10) state[0]<=S17;
 
 S17:if(vvalid_reg[2:1]==2'b10) state[0]<=S0;
     else if(hvalid_reg[1:0]==2'b01) state[0]<=S18;
 S18:if(hvalid_reg[1:0]==2'b10) state[0]<=S19;
 
 S19:if(vvalid_reg[2:1]==2'b10) state[0]<=S0;
     else if(hvalid_reg[1:0]==2'b01) state[0]<=S20;
 S20:if(hvalid_reg[1:0]==2'b10) state[0]<=S11;

 
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
else if((state[0]==S2 || state[0]==S12)&&(hvalid_reg[1]==1'b1)&&(clk_inv==1'b0))
    wea[0]<=1'b1;
else
    wea[0]<=1'b0;

always_ff  @(posedge  clk)
if(~rst_b)
    wea[1]<=1'b0;
else if((state[0]==S2 || state[0]==S12)&&(hvalid_reg[1]==1'b1)&&(clk_inv==1'b1))
    wea[1]<=1'b1;
else
    wea[1]<=1'b0;   

always_ff  @(posedge  clk)
if(~rst_b)
    wea[2]<=1'b0;
else if((state[0]==S4 || state[0]==S14)&&(hvalid_reg[1]==1'b1)&&(clk_inv==1'b0))
    wea[2]<=1'b1;
else
    wea[2]<=1'b0; 

always_ff  @(posedge  clk)
if(~rst_b)
    wea[3]<=1'b0;
else if((state[0]==S4 || state[0]==S14)&&(hvalid_reg[1]==1'b1)&&(clk_inv==1'b1))
    wea[3]<=1'b1;
else
    wea[3]<=1'b0; 

always_ff  @(posedge  clk)
if(~rst_b)
    wea[4]<=1'b0;
else if((state[0]==S6 || state[0]==S16)&&(hvalid_reg[1]==1'b1)&&(clk_inv==1'b0))
    wea[4]<=1'b1;
else
    wea[4]<=1'b0; 

always_ff  @(posedge  clk)
if(~rst_b)
    wea[5]<=1'b0;
else if((state[0]==S6 || state[0]==S16)&&(hvalid_reg[1]==1'b1)&&(clk_inv==1'b1))
    wea[5]<=1'b1;
else
    wea[5]<=1'b0; 

always_ff  @(posedge  clk)
if(~rst_b)
    wea[6]<=1'b0;
else if((state[0]==S8|| state[0]==S18)&&(hvalid_reg[1]==1'b1)&&(clk_inv==1'b0))
    wea[6]<=1'b1;
else
    wea[6]<=1'b0; 

always_ff  @(posedge  clk)
if(~rst_b)
    wea[7]<=1'b0;
else if((state[0]==S8|| state[0]==S18)&&(hvalid_reg[1]==1'b1)&&(clk_inv==1'b1))
    wea[7]<=1'b1;
else
    wea[7]<=1'b0; 

always_ff  @(posedge  clk)
if(~rst_b)
    wea[8]<=1'b0;
else if((state[0]==S10|| state[0]==S20)&&(hvalid_reg[1]==1'b1)&&(clk_inv==1'b0))
    wea[8]<=1'b1;
else
    wea[8]<=1'b0; 

always_ff  @(posedge  clk)
if(~rst_b)
    wea[9]<=1'b0;
else if((state[0]==S10|| state[0]==S20)&&(hvalid_reg[1]==1'b1)&&(clk_inv==1'b1))
    wea[9]<=1'b1;
else
    wea[9]<=1'b0; 

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
  S0:if(vvalid_reg[2:1]==2'b01) begin state[1]<=S1;cnt0<=11'd0;cnt1<=11'd0;end
  S1:if(hvalid_reg[2:1]==2'b10) begin state[1]<=S2;cnt0<=11'd0;cnt1<=11'd0;end
  S2:if(hvalid_reg[2:1]==2'b10) begin state[1]<=S3;cnt0<=11'd0;cnt1<=11'd0;end
  
  
  S3:if(hvalid_reg[2:1]==2'b10) begin state[1]<=S4;cnt0<=cnt0+11'd1;cnt1<=11'd0;end
  
  
  S4:if(cnt0==11'd1076) begin state[1]<=S5; cnt0<=cnt0;cnt1<=11'd0;end
     else begin state[1]<=S3;cnt0<=cnt0;cnt1<=cnt1;end
  
  S5:if(cnt1==11'd2047) begin state[1]<=S6;cnt0<=cnt0+11'd1;cnt1<=11'd0;end
     else begin  state[1]<=S5;cnt0<=cnt0;cnt1<=cnt1+11'd1;end
  
  
  S6:if(cnt0==11'd1077) begin state[1]<=S7; cnt0<=cnt0;cnt1<=11'd0;end
     else begin state[1]<=S6;cnt0<=cnt0;cnt1<=cnt1;end
  
  S7:if(cnt1==11'd2047) begin state[1]<=S8;cnt0<=cnt0+11'd1;cnt1<=11'd0;end
     else begin  state[1]<=S7;cnt0<=cnt0;cnt1<=cnt1+11'd1;end
  
  
  S8:if(cnt0==11'd1078) begin state[1]<=S9; cnt0<=cnt0;cnt1<=11'd0;end
     else begin state[1]<=S8;cnt0<=cnt0;cnt1<=cnt1;end
  
  S9:if(cnt1==11'd2047) begin state[1]<=S10;cnt0<=cnt0+11'd1;cnt1<=11'd0;end
     else begin  state[1]<=S9;cnt0<=cnt0;cnt1<=cnt1+11'd1;end
  
  
  S10:if(cnt0==11'd1079) begin state[1]<=S11; cnt0<=cnt0;cnt1<=11'd0;end
     else begin state[1]<=S10;cnt0<=cnt0;cnt1<=cnt1;end
  
  S11:if(cnt1==11'd2047) begin state[1]<=S12;cnt0<=cnt0+11'd1;cnt1<=11'd0;end
     else begin  state[1]<=S11;cnt0<=cnt0;cnt1<=cnt1+11'd1;end
  
  
  S12:if(cnt0==11'd1080) begin state[1]<=S13; cnt0<=cnt0;cnt1<=11'd0;end
     else begin state[1]<=S12;cnt0<=cnt0;cnt1<=cnt1;end
  
  S13:if(cnt1==11'd2047) begin state[1]<=S14;cnt0<=cnt0+11'd1;cnt1<=11'd0;end
     else begin  state[1]<=S13;cnt0<=cnt0;cnt1<=cnt1+11'd1;end
  
    
  S14:begin state[1]<=S0;cnt0<=11'd0;cnt1<=11'd0;end

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



ucdregr #(.width(11)) u3_ucdregr(.clk(clk),.r(rst_b),.d(cnt2),.q(cnt2_reg));

always_ff  @(posedge clk)
if(~rst_b)
    hvalid_reg[3]<=1'b0;
else if(cnt1>=11'd15 && cnt1<=11'd1934)
    hvalid_reg[3]<=1'b1;
else
    hvalid_reg[3]<=1'b0;



ucdregr #(.width(1))  u4_ucdregr(.clk(clk),.r(rst_b),.d(hvalid_reg[3]),.q(hvalid_reg[4]));

wl_srl  #(.DW(1),.NTAPS(5)) u5_ucdregr(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(hvalid_reg[4]),.dout(hvalid_reg[5]));



logic   [4:0]   state_reg[1:0];

wl_srl #(.DW(5),.NTAPS(2))  u0_wl_srl(.clk(clk),.rst_b(rst_b),.en(1'b1),.din(state[0]),.dout(state_reg[0]));

always_ff  @(posedge clk)
if(~rst_b)
    hsync_reg[0]<=1'b0;
else if(state_reg[0]==S8||state_reg[0]==S10 ||state_reg[0]==S12 ||state_reg[0]==S14||state_reg[0]==S16||state_reg[0]==S18||state_reg[0]==S20||state_reg[0]==S22)
    hsync_reg[0]<=1'b1;
else if(hvalid_reg[5])
    hsync_reg[0]<=1'b1;
else
    hsync_reg[0]<=1'b0;

ucdregr #(.width(1))  u6_ucdregr(.clk(clk),.r(rst_b),.d(hsync_reg[0]),.q(hsync_reg[1]));


wl_srl  #(.DW(1),.NTAPS(5)) u1_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(hsync_reg[0]),.dout(hsync_reg[2]));
wl_srl  #(.DW(1),.NTAPS(6)) u2_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(hsync_reg[2]),.dout(hsync));



always_ff  @(posedge clk)
if(~rst_b)
    fsync<=1'b0;
else if((state[1]==S2) && (hvalid_reg[2:1]==2'b10))
    fsync<=1'b1;
else if(state[1]==S10)
    fsync<=1'b0;
else
    fsync<=fsync;

ucdregr #(.width(5))  u7_ucdregr(.clk(clk),.r(rst_b),.d(state_reg[0]),.q(state_reg[1]));

assign
         dout_reg[DW-1:0]=clk_inv?sout[0]:sout[1],
      dout_reg[2*DW-1:DW]=clk_inv?sout[2]:sout[3],
    dout_reg[3*DW-1:2*DW]=clk_inv?sout[4]:sout[5],
    dout_reg[4*DW-1:3*DW]=clk_inv?sout[6]:sout[7],
    dout_reg[5*DW-1:4*DW]=clk_inv?sout[8]:sout[9];



wl_srl  #(.DW(N*DW),.NTAPS(11)) u3_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(dout_reg),.dout(dout_reg2));

always_ff @(posedge clk)
if(~rst_b)
    dout[N*DW-1:0]<={N*DW{1'b0}};
else if(state_reg[1]==S8)
    dout[N*DW-1:0]<={{DW{1'b0}},{DW{1'b0}},{DW{1'b0}},{DW{1'b0}},dout_reg[DW-1:0]};
else if(state_reg[1]==S10)
    dout[N*DW-1:0]<={{DW{1'b0}},{DW{1'b0}},{DW{1'b0}},dout_reg[2*DW-1:DW],{DW{1'b0}}};
else if(state_reg[1]==S12)
    dout[N*DW-1:0]<= {dout_reg[5*DW-1:4*DW],dout_reg[4*DW-1:3*DW],dout_reg[3*DW-1:2*DW],dout_reg[2*DW-1:DW],dout_reg[DW-1:0]};

else if(state_reg[1]==S14)
    dout[N*DW-1:0]<={dout_reg[DW-1:0],dout_reg[5*DW-1:4*DW],dout_reg[4*DW-1:3*DW],dout_reg[3*DW-1:2*DW],dout_reg[2*DW-1:DW]};



else if(state_reg[1]==S16)
    dout[N*DW-1:0]<={dout_reg[2*DW-1:DW],dout_reg[DW-1:0],dout_reg[5*DW-1:4*DW],dout_reg[4*DW-1:3*DW],dout_reg[3*DW-1:2*DW]};

else if(state_reg[1]==S18)
    dout[N*DW-1:0]<={dout_reg[3*DW-1:2*DW],dout_reg[2*DW-1:DW],dout_reg[DW-1:0],dout_reg[5*DW-1:4*DW],dout_reg[4*DW-1:3*DW]};

else if(state_reg[1]==S20)
    dout[N*DW-1:0]<={dout_reg[4*DW-1:3*DW],dout_reg[3*DW-1:2*DW],dout_reg[2*DW-1:DW],dout_reg[DW-1:0],dout_reg[5*DW-1:4*DW]};

else
    dout[N*DW-1:0]<={N*DW{1'b0}};




always_ff @(posedge clk)
if(~rst_b)
    ini_row_dout[DW-1:0]<={DW{1'b0}};
else if(ini_row[0])
    ini_row_dout[DW-1:0]<=dout_reg2[DW-1:0];
else if(ini_row[1])
    ini_row_dout[DW-1:0]<=dout_reg2[2*DW-1:DW];
else if(ini_row[2])
    ini_row_dout[DW-1:0]<=dout_reg2[4*DW-1:3*DW];
else if(ini_row[3])
    ini_row_dout[DW-1:0]<=dout_reg2[5*DW-1:4*DW];
else
    ini_row_dout[DW-1:0]<={DW{1'b0}};

//despose the large block circuit
logic   [DW-1:0]    ini_col_temp[1:0];

always_ff @(posedge  clk)
if(~rst_b)
    ini_col_temp[0]<={DW{1'b0}};
else if(state[0]==S12)
    ini_col_temp[0]<=dout_reg[4*DW-1:3*DW];
else if(state[0]==S14)
    ini_col_temp[0]<=dout_reg[5*DW-1:4*DW];
else if(state[0]==S16)
    ini_col_temp[0]<=dout_reg[DW-1:0];
else if(state[0]==S18)
    ini_col_temp[0]<=dout_reg[2*DW-1:DW];
else if((state[0]==S10) || (state[0]==S20))
    ini_col_temp[0]<=dout_reg[3*DW-1:2*DW];
else
    ini_col_temp[0]<={DW{1'b0}};


wl_srl  #(.DW(DW),.NTAPS(11))u4_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(ini_col_temp[0]),.dout(ini_col_temp[1]));


always_ff @(posedge clk)
if(~rst_b)
    ini_col_dout[DW-1:0]<={DW{1'b0}};
else if(ini_column[0]==1'b1)
    ini_col_dout[DW-1:0]<=ini_col_temp[1][DW-1:0];
else if(ini_column[1])
    ini_col_dout[DW-1:0]<=ini_col_temp[1][DW-1:0];
else if(ini_column[2])
    ini_col_dout[DW-1:0]<=ini_col_temp[1][DW-1:0];
else if(ini_column[3])
    ini_col_dout[DW-1:0]<=ini_col_temp[1][DW-1:0];
else
    ini_col_dout<={DW{1'b0}};



always_ff  @(posedge clk)  //the 1st row
if(~rst_b)
    ini_row_reg[0]<=1'b0;
else if((cnt0_reg==11'd1)&&(hsync_reg[2]==1'b1) )
    ini_row_reg[0]<=1'b1;
else
    ini_row_reg[0]<=1'b0;



always_ff  @(posedge clk)  //the 2nd row
if(~rst_b)
    ini_row_reg[1]<=1'b0;
else if((cnt0_reg==11'd2)&&(hsync_reg[2]==1'b1))
    ini_row_reg[1]<=1'b1;
else
    ini_row_reg[1]<=1'b0;







always_ff  @(posedge clk)  //the 1979th row
if(~rst_b)
    ini_row_reg[2]<=1'b0;
else if((cnt0_reg==11'd1079) &&(hsync_reg[2]==1'b1))
    ini_row_reg[2]<=1'b1;
else
    ini_row_reg[2]<=1'b0;


always_ff  @(posedge clk)  //the 1980th row
if(~rst_b)
    ini_row_reg[3]<=1'b0;
else if((cnt0_reg==11'd1080) &&(hsync_reg[2]==1'b1))
    ini_row_reg[3]<=1'b1;
else
    ini_row_reg[3]<=1'b0;


wl_srl  #(.DW(2),.NTAPS(5)) u5_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(ini_row_reg[1:0]),.dout(ini_row[1:0]));
wl_srl  #(.DW(2),.NTAPS(6)) u6_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(ini_row_reg[3:2]),.dout(ini_row[3:2]));

wl_srl  #(.DW(11),.NTAPS(7))u7_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(cnt0),.dout(cnt0_reg));



//-------------------------------------------------------------------------------------------------------------

assign
      ini_column[0]=(cnt2==11'd10  )?1'b1:1'b0,
      ini_column[1]=(cnt2==11'd11  )?1'b1:1'b0,
      ini_column[2]=(cnt2==11'd1928)?1'b1:1'b0,
      ini_column[3]=(cnt2==11'd1929)?1'b1:1'b0;

//----------------------------------------------------------------------------------------

//testpoint as follows
/*
logic [DW-1:0]  d0_reg;
logic [DW-1:0]  d1_reg;
logic [DW-1:0]  d2_reg;
logic [DW-1:0]  d3_reg;
logic [DW-1:0]  d4_reg;


logic [DW-1:0]  d5_reg;
logic [DW-1:0]  d6_reg;
logic [DW-1:0]  d7_reg;
logic [DW-1:0]  d8_reg;
logic [DW-1:0]  d9_reg;
*/


assign
    d0_reg=dout[DW-1:0],
    d1_reg=dout[2*DW-1:DW],
    d2_reg=dout[3*DW-1:2*DW],
    d3_reg=dout[4*DW-1:3*DW],
    d4_reg=dout[5*DW-1:4*DW];

//----------------------------------------------------------------------------------------

/*
assign
    d0_reg=sout[0],
    d1_reg=sout[1],
    d2_reg=sout[2],
    d3_reg=sout[3],
    d4_reg=sout[4],
    d5_reg=sout[5],
    
    d6_reg=sout[6],
    d7_reg=sout[7],
    d8_reg=sout[8],
    d9_reg=sout[9];

*/
endmodule
