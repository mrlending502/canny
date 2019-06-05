`timescale 1ns / 1ps
///////////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: line5_buffer for image filter 
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

module  nline3_buffer(
clk           ,//74.5MHz
rst_b         ,
vvalid        ,//frame synchronizer
hvalid        ,//1920x1080
dx            ,
dy            ,
grad          ,

fsync         ,
hsync         ,
dx_out        ,
dy_out        ,
grad_out      ,

ini_row       ,
ini_column    );

parameter
    N=3  ,
    DW=8,
    IW1=8,
    IW0=8,
    AW=10;

localparam IW2=2*IW0+IW1;

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
input   logic   [IW0-1:0]   dx            ;
input   logic   [IW0-1:0]   dy            ;
input   logic   [IW1-1:0]   grad          ;

output  logic               fsync         ;
output  logic               hsync         ;
output  logic   [IW0-1:0]   dx_out        ;
output  logic   [IW0-1:0]   dy_out        ;
output  logic   [N*IW1-1:0] grad_out      ;


output  logic   [1:0]       ini_row       ;
output  logic   [1:0]       ini_column    ;

//internal variables:
logic   [2*N-1:0]           wea           ;
logic   [AW-1:0]            addra         ;

logic   [IW2-1:0]           sout[2*N-1:0] ;

logic                       clk_inv       ;
logic   [2:0]               vvalid_reg    ;
logic   [5:0]               hvalid_reg    ;
logic   [IW0-1:0]           dx_reg[2:0]   ;
logic   [IW0-1:0]           dy_reg[2:0]   ;
logic   [IW1-1:0]           grad_reg[2:0] ;


logic   [N*IW0-1:0]         dx_reg2       ;
logic   [N*IW0-1:0]         dy_reg2       ;
logic   [N*IW1-1:0]         grad_reg2     ;

logic   [2:0]               hsync_reg     ;
logic   [1:0]               ini_row_reg   ;


//为了进行数字信号的边沿捕获而进行的时序匹配
ucdregr #(.width((IW2+2))) u0_ucdregr(.clk(clk),.r(rst_b),.d({vvalid,hvalid,dx,dy,grad}),.q({vvalid_reg[0],hvalid_reg[0],dx_reg[0],dy_reg[0],grad_reg[0]}));
ucdregr #(.width((IW2+2))) u1_ucdregr(.clk(clk),.r(rst_b),.d({vvalid_reg[0],hvalid_reg[0],dx_reg[0],dy_reg[0],grad_reg[0]}),.q({vvalid_reg[1],hvalid_reg[1],dx_reg[1],dy_reg[1],grad_reg[1]}));
ucdregr #(.width((IW2+2))) u2_ucdregr(.clk(clk),.r(rst_b),.d({vvalid_reg[1],hvalid_reg[1],dx_reg[1],dy_reg[1],grad_reg[1]}),.q({vvalid_reg[2],hvalid_reg[2],dx_reg[2],dy_reg[2],grad_reg[2]}));



//以奇、偶方式调用了2*N个小块存储器
genvar i;
generate

for(i=0;i<=2*N-1;i=i+1) begin

wl_sram #(.DW((IW2)),.AW(AW),.OREG(1))   uu_wl_sram(
.clk   (clk                                           ),
.rst_p (~rst_b                                        ),
.wea   (wea[i]                                        ),
.en    (1'b1                                          ),
.regce (1'b1                                          ),
.addr  (addra[9:0]                                    ),
.din   ({dx_reg[2],dy_reg[2],grad_reg[2]}  ),
.dout  (sout[i][IW2-1:0]                              ));

end
endgenerate



//以图像帧为完整单位，以行为操作单位对图像数据进行缓存；
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


  
//奇行、偶行识别信号clk_inv
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



//使用状态机变量计算每个小块缓存的写端口信号
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




//因为缓存的原因，所以要利用重建行信号
always_ff  @(posedge clk) //one-hot style
if(~rst_b)begin
    cnt0<=11'd0;
    cnt1<=11'd0;
    state[1]<=S0;end
else  begin
  case(state[1])
  S0:if(vvalid_reg[2:1]==2'b01) begin state[1]<=S1;cnt0<=11'd0;cnt1<=11'd0;end
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



logic   [3:0]   state_reg[1:0];
//表示一个4bits的变量被延迟2拍
wl_srl #(.DW(4),.NTAPS(2))  u0_wl_srl(.clk(clk),.rst_b(rst_b),.en(1'b1),.din(state[0]),.dout(state_reg[0]));

always_ff  @(posedge clk)
if(~rst_b)
    hsync_reg[0]<=1'b0;
else if(state_reg[0]==S6||state_reg[0]==S8||state_reg[0]==S10||state_reg[0]==S12)
    hsync_reg[0]<=1'b1;
else if(hvalid_reg[5])
    hsync_reg[0]<=1'b1;
else
    hsync_reg[0]<=1'b0;

ucdregr #(.width(1))  u6_ucdregr(.clk(clk),.r(rst_b),.d(hsync_reg[0]),.q(hsync_reg[1]));


wl_srl  #(.DW(1),.NTAPS(5)) u1_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(hsync_reg[0]),.dout(hsync_reg[2]));
wl_srl  #(.DW(1),.NTAPS(2)) u2_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(hsync_reg[2]),.dout(hsync));


//重建后的帧同步信号
always_ff  @(posedge clk)
if(~rst_b)
    fsync<=1'b0;
else if((state[1]==S2) && (hvalid_reg[2:1]==2'b10))
    fsync<=1'b1;
else if(state[1]==S9)   //重建完行同步信号后，帧同步信号被拉低
    fsync<=1'b0;
else
    fsync<=fsync;

ucdregr #(.width(4))  u7_ucdregr(.clk(clk),.r(rst_b),.d(state_reg[0]),.q(state_reg[1]));


assign
                      {dx_reg2[IW0-1:0],dy_reg2[IW0-1:0],grad_reg2[IW1-1:0]}=clk_inv?sout[0]:sout[1],
          {dx_reg2[2*IW0-1:IW0],dy_reg2[2*IW0-1:IW0],grad_reg2[2*IW1-1:IW1]}=clk_inv?sout[2]:sout[3],
    {dx_reg2[3*IW0-1:2*IW0],dy_reg2[3*IW0-1:2*IW0],grad_reg2[3*IW1-1:2*IW1]}=clk_inv?sout[4]:sout[5];


	
//取出缓存并行数据中的当前偏导数值，因为后续的运算模块中不需要对偏导数dx进行3x3缓存
always_ff @(posedge clk)
if(~rst_b)
    dx_out<={(IW0){1'b0}};
else if(state_reg[1]==S6)
    dx_out<=dx_reg2[IW0-1:0];
else if(state_reg[1]==S8)
    dx_out<= dx_reg2[2*IW0-1:IW0];
else if(state_reg[1]==S10)
    dx_out<=dx_reg2[3*IW0-1:2*IW0];
else if(state_reg[1]==S12)
    dx_out<=dx_reg2[2*IW0-1:IW0];
else
    dx_out<={(IW0){1'b0}};


	
//取出缓存并行数据中的当前偏导数值，因为后续的运算模块中不需要对偏导数dy进行3x3缓存
always_ff @(posedge clk)
if(~rst_b)
    dy_out<={IW0{1'b0}};
else if(state_reg[1]==S6)
    dy_out<=dy_reg2[IW0-1:0];
else if(state_reg[1]==S8)
    dy_out<= dy_reg2[2*IW0-1:IW0];
else if(state_reg[1]==S10)
    dy_out<=dy_reg2[3*IW0-1:2*IW0];
else if(state_reg[1]==S12)
    dy_out<=dy_reg2[IW0-1:0];
else
    dy_out<={IW0{1'b0}};



//缓存后输出的并行梯度值，有N=3个梯度信号拼接在一起并行输出
always_ff @(posedge clk)
if(~rst_b)
    grad_out<={(N*IW1){1'b0}};
else if(state_reg[1]==S6)
    grad_out<={{IW1{1'b0}},{IW1{1'b0}},grad_reg2[IW1-1:0]};
else if(state_reg[1]==S8)
    grad_out<= {grad_reg2[3*IW1-1:2*IW1],grad_reg2[2*IW1-1:IW1],grad_reg2[IW1-1:0]};
else if(state_reg[1]==S10)
    grad_out<={grad_reg2[IW1-1:0],grad_reg2[3*IW1-1:2*IW1],grad_reg2[2*IW1-1:IW1]};
else if(state_reg[1]==S12)
    grad_out<={grad_reg2[2*IW1-1:IW1],grad_reg2[IW1-1:0],grad_reg2[3*IW1-1:2*IW1]};
else
    grad_out<={(N*IW1){1'b0}};



//行初始化信号
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

wl_srl  #(.DW(11),.NTAPS(7))u7_wl_srl(.clk(clk),.en(1'b1),.rst_b(rst_b),.din(cnt0),.dout(cnt0_reg));



//-------------------------------------------------------------------------------------------------------------
//列初始化信号
assign
      ini_column[0]=(cnt2==11'd2  )?1'b1:1'b0,
      ini_column[1]=(cnt2==11'd1921)?1'b1:1'b0;

//----------------------------------------------------------------------------------------

//testpoint as follows 添加的测试点

/*
logic [IW0-1:0]  d0_xreg,d0_yreg,d0_greg;
logic [IW0-1:0]  d1_xreg,d1_yreg,d1_greg;
logic [IW0-1:0]  d2_xreg,d2_yreg,d2_greg;

assign
    d0_xreg=dx_out[IW0-1:0],
    d0_yreg=dy_out[IW0-1:0],
    d0_greg=grad_out[IW1-1:0],
    
    d1_xreg=dx_out[2*IW0-1:IW0],
    d1_yreg=dy_out[2*IW0-1:IW0],
    d1_greg=grad_out[2*IW1-1:IW1],
    
    d2_xreg=dx_out[3*IW0-1:2*IW0],
    d2_yreg=dy_out[3*IW0-1:2*IW0],
    d2_greg=grad_out[3*IW1-1:2*IW1];
//----------------------------------------------------------------------------------------
*/

endmodule
