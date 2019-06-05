`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: misrobot
// Engineer:tunringrc_2017@aliyun.com 
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: source_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: the image's source is generating...
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module stimulus_gen(
clk   ,
rst_b ,
hvalid,
vvalid,
dout  );

parameter
        cycle=10;

enum  logic [2:0] { S0 =3'h0,
                    S1 =3'h1,
                    S2 =3'h2,
                    S3 =3'h3,
                    S4 =3'h4,
                    S5 =3'h5}state;

input   bit           clk       ;
input   logic         rst_b     ;
output  logic         hvalid    ;
output  logic         vvalid    ;
output  logic [7:0]   dout      ;


logic  [1:0]    hvalid_reg;
logic  [1:0]    vvalid_reg;

logic   [20:0]  addr  ;
logic           ena   ;
logic   [2:0]   start ;

logic   [7:0]   mem[0:2073599];//1920*1080*1


/*
initial begin
    clk = 1'b0;
   #(cycle/2);
   forever
      #(cycle/2) clk = ~clk;
end

initial begin
        rst_b=1'b0;
#(10*cycle)rst_b=1'b1;end
*/

initial begin
        hvalid_reg[0]=1'b0;
repeat  (1080) begin
#(128*cycle)  hvalid_reg[0]=1'b1;
#(1920*cycle) hvalid_reg[0]=1'b0;end

end


initial begin
        vvalid_reg[0]=1'b0;
#(64*cycle)vvalid_reg[0]=1'b1;
#(2049*1080*cycle)vvalid_reg[0]=1'b0; end

//---------------------------------------------------------sigma signals-------------------------------------------------------------------
wl_regd #(.DW(2),.OREG(1))  uu_wl_regd(.clk(clk),.rst_b(rst_b),.din({hvalid_reg[0],vvalid_reg[0]}),.dout({hvalid_reg[1],vvalid_reg[1]}));
wl_regd #(.DW(2),.OREG(1))  uv_wl_regd(.clk(clk),.rst_b(rst_b),.din({hvalid_reg[1],vvalid_reg[1]}),.dout({hvalid,vvalid}));

//initial
//      $readmemh("D:/Xilinx/Vivado/myprj/vision_top/tb/image.dat", mem, 0, 2073599);
      

initial                                                                            
      $readmemh("D:/R2018a/work/hdlsrc/vision_top/tb/image.dat", mem, 0, 2073599);
     

assign
      ena=hvalid_reg[1] && vvalid_reg[1];

always  @(posedge clk)
if(~rst_b)
      addr<=21'd0;
else if(ena)
      addr<=addr + 1;

always @(posedge clk)
if (ena)
    dout <= mem[addr];



endmodule

