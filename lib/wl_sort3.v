 `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: sort3
// Project Name: 
// Target Devices: 
// Tool Versions: sort3 from maximum to minumn
// Description:
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module wl_sort3(
clk   ,
rst_b ,
din   ,
dout  );

parameter
        DW=8,
        OREG=1;

input   wire              clk   ;
input   wire              rst_b ;
input   wire  [3*DW-1:0]  din   ;
output  wire  [3*DW-1:0]  dout  ;


generate
if(OREG==1) begin
reg   [2:0]       flag;
reg   [3*DW-1:0]  dout_reg ;
wire  [3*DW-1:0]  din_reg;

always  @(posedge clk)
if(~rst_b)
    flag[0]<=1'b0;
else
    flag[0]<=(din[2*DW-1:DW]>din[DW-1:0])?1'b1:1'b0;

always  @(posedge clk)
if(~rst_b)
    flag[1]<=1'b0;
else
    flag[1]<=(din[3*DW-1:2*DW]>din[2*DW-1:DW])?1'b1:1'b0;

always  @(posedge clk)
if(~rst_b)
    flag[2]<=1'b0;
else
    flag[2]<=(din[3*DW-1:2*DW]>din[DW-1:0])?1'b1:1'b0;

wl_regd #(.DW(3*DW),.OREG(1)) uu_wl_regd(.clk(clk),.rst_b(rst_b),.din(din),.dout(din_reg));

always  @(posedge clk)
if(~rst_b)
    dout_reg[3*DW-1:0]  <={(3*DW){1'b0}};
else  if(flag[2:0]==3'b000)
    dout_reg<={din_reg[DW-1:0],din_reg[2*DW-1:DW],din_reg[3*DW-1:2*DW]};
else  if(flag[2:0]==3'b001)
    dout_reg<={din_reg[2*DW-1:DW],din_reg[DW-1:0],din_reg[3*DW-1:2*DW]};
else  if(flag[2:0]==3'b010)
    dout_reg<={din_reg[DW-1:0],din_reg[3*DW-1:2*DW],din_reg[2*DW-1:DW]};
else  if(flag[2:0]==3'b101)
    dout_reg<={din_reg[2*DW-1:DW],din_reg[3*DW-1:2*DW],din_reg[DW-1:0]};
else  if(flag[2:0]==3'b110)
    dout_reg<={din_reg[3*DW-1:2*DW],din_reg[DW-1:0],din_reg[2*DW-1:DW]};
else  if(flag[2:0]==3'b111)
    dout_reg<={din_reg[3*DW-1:2*DW],din_reg[2*DW-1:DW],din_reg[DW-1:0]};
else
    dout_reg[3*DW-1:0]  <={(3*DW){1'b0}};

assign
    dout=dout_reg;
end
else  begin
wire  [2:0]       flag;
reg   [3*DW-1:0]  dout_reg ;

assign
    flag[0]=(din[2*DW-1:DW]>din[DW-1:0])?1'b1:1'b0,
    flag[1]=(din[3*DW-1:2*DW]>din[2*DW-1:DW])?1'b1:1'b0,
    flag[2]=(din[3*DW-1:2*DW]>din[DW-1:0])?1'b1:1'b0;

always  @(posedge clk)
if(~rst_b)
    dout_reg[3*DW-1:0]  <={(3*DW){1'b0}};
else  if(flag[2:0]==3'b000)
    dout_reg<={din[DW-1:0],din[2*DW-1:DW],din[3*DW-1:2*DW]};
else  if(flag[2:0]==3'b010)
    dout_reg<={din[DW-1:0],din[3*DW-1:2*DW],din[2*DW-1:DW]};
else  if(flag[2:0]==3'b101)
    dout_reg<={din[2*DW-1:DW],din[3*DW-1:2*DW],din[DW-1:0]};
else  if(flag[2:0]==3'b110)
    dout_reg<={din[3*DW-1:2*DW],din[DW-1:0],din[2*DW-1:DW]};
else  if(flag[2:0]==3'b111)
    dout_reg<={din[3*DW-1:2*DW],din[2*DW-1:DW],din[DW-1:0]};
else
    dout_reg[3*DW-1:0]  <={(3*DW){1'b0}};

assign
      dout=dout_reg;
end
endgenerate

endmodule

