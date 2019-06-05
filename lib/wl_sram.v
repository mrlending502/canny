`timescale 1ns / 1ps
////////////////////////////////////////////////////
// Company: misrobot
// Engineer: tunringrc_2017@aliyun.com
// 
// Create Date: 12/21/2017 05:45:15 PM
// Design Name: 
// Module Name: wl_sram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: single port ram
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////
module wl_sram(
clk   ,
rst_p ,
wea   ,//write enable
en    ,//read enable
regce ,
addr  ,
din   ,
dout  );

parameter
      DW=8,
      AW=10,
      OREG=0;

localparam
      RAM_DEPTH=2**AW;

input   wire                clk   ;
input   wire                rst_p ;
input   wire                wea   ;
input   wire                en    ;
input   wire                regce ;
input   wire  [AW-1:0]      addr  ;
input   wire  [DW-1:0]      din   ;
output  wire  [DW-1:0]      dout  ;

reg [DW-1:0] BRAM [RAM_DEPTH-1:0];
reg [DW-1:0] ram_data = {DW{1'b0}};




  // The following code either initializes the memory values to a specified file or to all zeros to match hardware
  generate
      integer ram_index;
      initial
        for (ram_index = 0; ram_index < RAM_DEPTH; ram_index = ram_index + 1)
          BRAM[ram_index] = {DW{1'b0}};
  endgenerate
  
  always @(posedge clk)
    if (en) begin
      if (wea)
        BRAM[addr] <= din;
      ram_data <= BRAM[addr];
    end

wl_regd #(.DW(DW),.OREG(OREG)) uu_wl_regd(.clk(clk),.rst_b(~rst_p),.din(ram_data),.dout(dout));

//----------------------------------------------------------------------------------------------------------
 









//----------------------------------------------------------------------------------------------------------
/*
always @(posedge clka)
  if (ena) begin
    if (wea)
      BRAM[addra] <= din;
    ram_data <= BRAM[addr];
  end


generate
  if (RAM_PERFORMANCE == "LOW_LATENCY") begin: no_output_register
     assign douta = ram_data;

  end else begin: output_register

    // The following is a 2 clock cycle read latency with improve clock-to-out timing

    reg [DW-1:0] douta_reg = {DW{1'b0}};

    always @(posedge clka)
      if (rst_p)
        dout_reg <= {DW{1'b0}};
      else if (regce)
        dout_reg <= ram_data;

    assign dout = dout_reg;

  end
endgenerate
*/

 
endmodule


