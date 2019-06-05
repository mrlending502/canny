`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 01/19/2018 05:45:15 PM
// Design Name: 
// Module Name: non maximum value supress module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: non maximum supress
// 
//////////////////////////////////////////////////////////////////
module non_max(
clk     ,
rst_b   ,
hvalid  ,
vvalid  ,
grad    ,
dx      ,
dy      ,
dout    ,

//threshold inputting
nThrLow ,
nThrHigh);

parameter 
        N=3,
        DW=8,
        IW0=8,
        IW1=24;
        

input   bit                   clk       ;
input   logic                 rst_b     ;
input   logic                 hvalid    ;
input   logic                 vvalid    ;


input   logic   [N*IW1-1:0]   grad      ;//来自于sobel3_filter模块中的梯度信号，经过缓存nlin3_buffer后形成
input   logic   [IW0-1:0]     dx        ;//偏导数dx
input   logic   [IW0-1:0]     dy        ;//偏导数dy

output  logic   [DW-1:0]      dout      ; //边缘信号输出

input   logic   [IW1-1:0]     nThrLow   ; //阈值输入，可根据不同的应用场景通过上层软件配置
input   logic   [IW1-1:0]     nThrHigh  ;




logic   [IW0-1:0]           dx_reg[2:0]       ;
logic   [IW0-1:0]           dy_reg[2:0]       ;

logic   [IW0-1:0]           abs_dx_reg[2:0]   ;
logic   [IW0-1:0]           abs_dy_reg[2:0]   ;

logic   [N*IW1-1:0]         grad_reg[3:0]     ;

logic   [DW-1:0]            dout_reg          ;


//matching with fixed point basedon opencv platform...
logic   [IW1-1:0]           g_reg             ;

logic   [1:0]              nlow_en            ;
logic   [1:0]              nlow_en_reg        ;
logic   [1:0]              nlow_en_reg2       ;

logic   [1:0]              dxy_signed         ;
logic   [1:0]              dx_dy_signed[2:0]  ;

logic   [IW0-1:0]          abs_dx             ;
logic   [IW0-1:0]          abs_dy             ;
logic                      abs_dxy_compare    ;
logic   [2:0]              abs_dx_dy_compare  ;



//nlow_en[1:0]区别强边缘区域、弱边缘区域、非边缘区域
always_ff @(posedge clk)
if(~rst_b)
    nlow_en<=2'd0;
else  if(grad[2*IW1-1:IW1]>=nThrHigh)
    nlow_en<=2'd1;      //识别为强边缘区域
else  if(grad[2*IW1-1:IW1]<=nThrLow)
    nlow_en<=2'd2;      //识别为非边缘区域
else
    nlow_en<=2'd3;    //识别为弱边缘区域（双阈值区域），相关信号要参与搜索到8个区间的搜索运算




//求绝对值
wl_abs  #(.DW(IW0),.OREG(1))    u00_wl_abs(.clk(clk),           .rst_b(rst_b),  .din(dx ),                    .dout(abs_dx));
wl_abs  #(.DW(IW0),.OREG(1))    u01_wl_abs(.clk(clk),           .rst_b(rst_b),  .din(dy ),                    .dout(abs_dy));

assign
      abs_dxy_compare=(abs_dx>abs_dy)?1'b1:1'b0,    //绝对值比较结果（预先计算出比机器结果形成一个单独的数据流，后续的弱边缘区域进行边缘搜索时可以资源共享该模块的结果）
      dxy_signed={dx_reg[2][DW-1],dy_reg[2][DW-1]}; //符号位拼接进入流水线，用于坐标轴中的象限子区间参与识别运算

//打一拍，用于流水记忆单元（即每个部件只存储一个数据），用于匹配Z^-1电路结果
ucdregr  #(.width(IW0))         u00_ucdregr(.clk(clk),          .r(rst_b),      .d(dx),                      .q(dx_reg[2])); //3级流水线
ucdregr  #(.width(IW0))         u01_ucdregr(.clk(clk),          .r(rst_b),      .d(dx_reg[2]),               .q(dx_reg[1]));
ucdregr  #(.width(IW0))         u02_ucdregr(.clk(clk),          .r(rst_b),      .d(dx_reg[1]),               .q(dx_reg[0]));

//-------------------------------------------------------------------------------------------------------------------------------------                                                                                              
ucdregr  #(.width(IW0))         u03_ucdregr(.clk(clk),          .r(rst_b),      .d(dy),                      .q(dy_reg[2]));
ucdregr  #(.width(IW0))         u04_ucdregr(.clk(clk),          .r(rst_b),      .d(dy_reg[2]),               .q(dy_reg[1]));
ucdregr  #(.width(IW0))         u05_ucdregr(.clk(clk),          .r(rst_b),      .d(dy_reg[1]),               .q(dy_reg[0]));

//-------------------------------------------------------------------------------------------------------------------------------------                                                            
wl_abs   #(.DW(IW0),.OREG(1))   u2_wl_abs (.clk(clk),           .rst_b(rst_b),  .din(dx),                    .dout(abs_dx_reg[2]));//绝对值，后置3级流水线
ucdregr  #(.width(IW0))         u06_ucdregr(.clk(clk),          .r(rst_b),      .d(abs_dx_reg[2]),           .q(abs_dx_reg[1]));
ucdregr  #(.width(IW0))         u07_ucdregr(.clk(clk),          .r(rst_b),      .d(abs_dx_reg[1]),           .q(abs_dx_reg[0]));

//-------------------------------------------------------------------------------------------------------------------------------------                                                        
wl_abs   #(.DW(IW0),.OREG(1))   u03_wl_abs (.clk(clk),          .rst_b(rst_b),  .din(dy),                    .dout(abs_dy_reg[2]));//绝对值，后置3级流水线
ucdregr  #(.width(IW0))         u08_ucdregr(.clk(clk),          .r(rst_b),      .d(abs_dy_reg[2]),           .q(abs_dy_reg[1]));
ucdregr  #(.width(IW0))         u09_ucdregr(.clk(clk),          .r(rst_b),      .d(abs_dy_reg[1]),           .q(abs_dy_reg[0]));

//-------------------------------------------------------------------------------------------------------------------------------------                                                              
ucdregr  #(.width(N*IW1))       u10_ucdregr(.clk(clk),         .r(rst_b),      .d(grad),                    .q(grad_reg[3]));//打一拍 1tap，共有4级流水线
ucdregr  #(.width(N*IW1))       u11_ucdregr(.clk(clk),         .r(rst_b),      .d(grad_reg[3]),             .q(grad_reg[2]));
ucdregr  #(.width(N*IW1))       u12_ucdregr(.clk(clk),         .r(rst_b),      .d(grad_reg[2]),             .q(grad_reg[1]));
ucdregr  #(.width(N*IW1))       u13_ucdregr(.clk(clk),         .r(rst_b),      .d(grad_reg[1]),             .q(grad_reg[0]));

//-------------------------------------------------------------------------------------------------------------------------------------
ucdregr #(.width(1))            u14_ucdregr(.clk(clk),        .r(rst_b),      .d(abs_dxy_compare     ),     .q(abs_dx_dy_compare[2]));//3级流水线   
ucdregr #(.width(1))            u15_ucdregr(.clk(clk),        .r(rst_b),      .d(abs_dx_dy_compare[2]),     .q(abs_dx_dy_compare[1]));   
ucdregr #(.width(1))            u16_ucdregr(.clk(clk),        .r(rst_b),      .d(abs_dx_dy_compare[1]),     .q(abs_dx_dy_compare[0]));

ucdregr #(.width(2))            u17_ucdregr(.clk(clk),        .r(rst_b),      .d(dxy_signed     ),          .q(dx_dy_signed[2]));//3级流水线                                                                                                                      
ucdregr #(.width(2))            u18_ucdregr(.clk(clk),        .r(rst_b),      .d(dx_dy_signed[2]),          .q(dx_dy_signed[1]));            
ucdregr #(.width(2))            u19_ucdregr(.clk(clk),        .r(rst_b),      .d(dx_dy_signed[1]),          .q(dx_dy_signed[0]));       
//-------------------------------------------------------------------------------------------------------------------------------------

wl_regd2  #(.DW(2),.OREG(1))  uu_wl_regd2(.clk(clk),.rst_b(rst_b),.din(nlow_en),.dout(nlow_en_reg));  //为了时序匹配，延迟2拍

ucdregr #(.width(2))          u24_ucdregr(.clk(clk),        .r(rst_b),      .d(nlow_en_reg),           .q(nlow_en_reg2));//为了时序匹配，延迟1拍


//弱边缘区域（双阈值区域）8个象限子区间的梯度方向，运用枚举法全部展开（不合并处理），方便理解；采用时序逻辑，插入一级流水线，优化时序
//从8个可能的梯度方向中找到最可能的那个方向（搜索的办法）
//梯度缓存元素为：grad_reg[3],grad_reg[2],grad_reg[1]

always_ff @(posedge clk)
if(~rst_b)
    g_reg<={IW1{1'b0}};
else if({dx_dy_signed[1],abs_dx_dy_compare[1]}==3'b00_1)  //第一象限子区间边界(0~pi/4)---->0
    g_reg<=grad_reg[3][2*IW1-1:IW1];
else if({dx_dy_signed[1],abs_dx_dy_compare[1]}==3'b00_0)  //第一象限子区间边界(pi/4~pi/2)---->pi/4
    g_reg<=grad_reg[3][IW1-1:0];
else if({dx_dy_signed[1],abs_dx_dy_compare[1]}==3'b10_0)  //第二象限子区间边界(pi/2~3pi/4)----->pi/2
    g_reg<=grad_reg[2][IW1-1:0];
else if({dx_dy_signed[1],abs_dx_dy_compare[1]}==3'b10_1)  //第二象限子区间边界(3pi/4~pi)------->3pi/4
    g_reg<=grad_reg[1][IW1-1:0];
else if({dx_dy_signed[1],abs_dx_dy_compare[1]}==3'b11_1)  //第三象限子区间边界(pi~5pi/4)------->pi
    g_reg<=grad_reg[1][2*IW1-1:IW1];
else if({dx_dy_signed[1],abs_dx_dy_compare[1]}==3'b11_0)  //第三象限子区间边界(5pi/4~3pi/2)------>5pi/4
    g_reg<=grad_reg[1][3*IW1-1:2*IW1];
else if({dx_dy_signed[1],abs_dx_dy_compare[1]}==3'b01_0)  //第四象限子区间边界(3pi/2~7pi/4)------->3pi/2
    g_reg<=grad_reg[2][3*IW1-1:2*IW1];
else if({dx_dy_signed[1],abs_dx_dy_compare[1]}==3'b01_1)  //第四象限子区间边界(7pi/4~2pi)----->7pi/4
    g_reg<=grad_reg[3][3*IW1-1:2*IW1];
else                              //如果不满足8个条件中的任何一个，那么本时刻的梯度值一定小于边界值，一定不是边缘信号
    g_reg<={IW1{1'b0}};
 
 




//根据找到的当前梯度方向再遍历搜索一次，
//从8个可能的梯度方向中搜索出最可能的梯度使用的是非阻塞电路，会产生一拍延迟，故
//再次定位3X3的梯度缓存时，需要往后再退一拍，即grad_reg[2],grad_reg[1],grad_reg[0]
always_ff @(posedge clk)
if(~rst_b)
    dout_reg<={DW{1'b0}};
else if(g_reg>nThrHigh)
    dout_reg<={DW{1'b1}}; //第一步：强边缘信号判定的信号一定为边缘信号
else if(g_reg>nThrHigh)
    dout_reg<={DW{1'b0}}; //第二步：非边缘信号判定的信号一定为非边缘信号
else if((g_reg<grad_reg[2][IW1-1:0]) &(g_reg<grad_reg[0][3*IW1-1:2*IW1]))
    dout_reg<={DW{1'b0}}; //对角线处理
else if(nlow_en_reg2==2'd3)begin  //弱边缘区域再搜索一次
    if(grad_reg[0][IW1-1:0]>nThrHigh) dout_reg<={DW{1'b1}};
    else if(grad_reg[1][IW1-1:0]>nThrHigh) dout_reg<={DW{1'b1}};
    else if(grad_reg[2][IW1-1:0]>nThrHigh) dout_reg<={DW{1'b1}};
    else if(grad_reg[2][2*IW1-1:IW1]>nThrHigh) dout_reg<={DW{1'b1}};
    else if(grad_reg[2][3*IW1-1:2*IW1]>nThrHigh) dout_reg<={DW{1'b1}};
    
    else if(grad_reg[1][3*IW1-1:2*IW1]>nThrHigh) dout_reg<={DW{1'b1}};
    else if(grad_reg[0][3*IW1-1:2*IW1]>nThrHigh) dout_reg<={DW{1'b1}};
    else if(grad_reg[0][2*IW1-1:1*IW1]>nThrHigh) dout_reg<={DW{1'b1}};
    else dout_reg<={DW{1'b0}};end
else
  dout_reg<={DW{1'b0}};//电路的完备性


//寄存器输出（方便调试设置为8bit，工程应用中设置为1bit即可）
always_ff @(posedge clk)
if(~rst_b)
    dout<={DW{1'b0}};
else
    dout<=dout_reg;


endmodule
