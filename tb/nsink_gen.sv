`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: misrobot
// Engineer:tunringrc_2017@aliyun.com 
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: sink_gen 
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: the matched sink processing with matlab/opencv platform...
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module nsink_gen(
clka    ,
hvalid  ,
vvalid  ,
dx_in   ,
dy_in   ,
grad_in );


parameter
      IW0=8,
      IW1=8,
      AW=21,
      cycle=20;
      
localparam
      IW2=IW1+IW1+IW0;
      
parameter [1:0] S0=2'd1,S1=2'd2;


input   bit               clka      ;
input   logic             hvalid    ;
input   logic             vvalid    ;

input   logic [IW1-1:0]   dx_in     ;
input   logic [IW1-1:0]   dy_in     ;
input   logic [IW0-1:0]   grad_in   ;

logic   [IW1-1:0]         dx_out    ;
logic   [IW1-1:0]         dy_out    ;
logic   [IW0-1:0]         grad_out  ;



logic               clk;
logic               rst_b;
logic               rst_t;
logic   [2:0]       en;
logic               wea;

logic   [AW-1:0]    addra     ;
logic   [AW-1:0]    addrb     ;

logic   [1:0]       state     ;
logic               start     ;
logic   [2:0]       vvalid_reg;

initial begin
    clk = 1'b0;
   #(cycle/2);
   forever
      #(cycle/2) clk = ~clk;
end

initial begin
        rst_b=1'b0;
#(10*cycle)rst_b=1'b1;end


wl_reset_box  #(.OREG(1)) uu_wl_reset_box(.clk(clka),.rst_b_in(rst_b),.rst_b_out(rst_t));


assign
    wea=hvalid&&vvalid,
    en[0]=(state==S1)?1'b1:1'b0;

always_ff @(posedge clka)
if(~rst_t)
    addra<={AW{1'b0}};
else if(wea)
    addra<=addra  + 1;


always_ff @(posedge clk)
if(~rst_b)
    vvalid_reg<=3'h0;
else
    vvalid_reg<={vvalid_reg[1:0],vvalid};

always_ff @(posedge  clk)
if(~rst_b)
    start<=1'b0;
else  if(vvalid_reg[2:1]==2'b10)
    start<=1'b1;
else
    start<=1'b0;
    


always_ff @(posedge  clk)
if(~rst_b)begin
    state<=S0;
    addrb<=21'd0;end
else  begin
  case(state)
    S0:if(start)  begin state<=S1;addrb<=21'd0;end
    S1:if(addrb==21'd2073599)begin  addrb<=21'd0;state<=S0;end
       else begin addrb<=addrb+21'd1;state<=S1; end
default:begin addrb<=21'd0;state<=S0;end
  endcase
  end
  


wl_sdram  #(.AW(AW),.DW(IW2))  uu_wl_sdram(
.clka  (clka                      ), //rst_t
.dina  ({dx_in,dy_in,grad_in}     ),
.wea   (wea                       ),
.addra (addra                     ),

.clkb  (clk                       ),//rst_b
.rst_b (rst_b                     ),
.enb   (en[0]                     ),
.regceb(1'b1                      ),
.addrb (addrb                     ),
.doutb ({dx_out,dy_out,grad_out}  ));

wl_regd #(.DW(1),.OREG(1))  uu_wl_regd(.clk(clk),.rst_b(rst_b),.din(en[0]),.dout(en[1]));
wl_regd #(.DW(1),.OREG(1))  uv_wl_regd(.clk(clk),.rst_b(rst_b),.din(en[1]),.dout(en[2]));

integer fib;
integer fic;
integer fid;




initial begin
  fib =$fopen("D:/Xilinx/Vivado/myprj/vision_top/tb/dx.dat","w"); end
initial begin
  fic =$fopen("D:/Xilinx/Vivado/myprj/vision_top/tb/dy.dat","w"); end
initial begin
  fid =$fopen("D:/Xilinx/Vivado/myprj/vision_top/tb/grad.dat","w"); end




always_ff @(posedge clk)
if(en[2]==1'b1) 
    begin $fwrite(fib,"%h\n",dx_out); end


always_ff @(posedge clk)
if(en[2]==1'b1) 
    begin $fwrite(fic,"%h\n",dy_out); end


always_ff @(posedge clk)
if(en[2]==1'b1) 
    begin $fwrite(fid,"%3h\n",grad_out); end


endmodule

