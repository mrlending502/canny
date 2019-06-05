quit -sim
cd D:/xilinx/Vivado/myprj/vision_top/tb

vlib work
vmap work

#vlog  +acc ../src/reg_wr.v
vlog  +acc ../lib/wl_srl.v
vlog  +acc ../lib/wl_regd.v
vlog  +acc ../lib/wl_sram.v
vlog  +acc ../lib/wl_regd2.v

vlog  +acc ../tb/stimulus_gen.sv
vlog  +acc ../src/canny/nline3_buffer.sv

vlog  +acc ../tb/tb_nline3_buffer.sv


vlog -work work "D:/Xilinx/Vivado/2015.4/data/verilog/src/glbl.v"

vopt +acc -L unisims_ver -L unimacro_ver -L secureip -L work -work work work.tb_nline3_buffer work.glbl -o tb_nline3_buffer_opt
vsim -t 1ps -lib work tb_nline3_buffer_opt

view wave

#view structure
#view signals
log -r /*

add wave -noupdate -height 32 -expand -group Stimulus -color Gold -itemcolor Gold /tb_nline3_buffer/clk
add wave -noupdate -height 32 -expand -group Stimulus -color Gold -itemcolor Gold /tb_nline3_buffer/rst_b
add wave -noupdate -height 32 -expand -group Stimulus -color Pink -itemcolor Pink /tb_nline3_buffer/uu_stimulus_gen/vvalid
add wave -noupdate -height 32 -expand -group Stimulus -color Pink -itemcolor Pink /tb_nline3_buffer/uu_stimulus_gen/hvalid
add wave -noupdate -height 32 -expand -group Stimulus -color Pink -itemcolor Pink -radix hexadecimal /tb_nline3_buffer/uu_stimulus_gen/dout
add wave -noupdate -height 32 -expand -group line3_buffer /tb_nline3_buffer/uu_nline3_buffer/vvalid
add wave -noupdate -height 32 -expand -group line3_buffer /tb_nline3_buffer/uu_nline3_buffer/hvalid
add wave -noupdate -height 32 -expand -group line3_buffer /tb_nline3_buffer/uu_nline3_buffer/dx
add wave -noupdate -height 32 -expand -group line3_buffer /tb_nline3_buffer/uu_nline3_buffer/dy
add wave -noupdate -height 32 -expand -group line3_buffer /tb_nline3_buffer/uu_nline3_buffer/grad



add wave -noupdate -height 32 -expand -group line3_buffer /tb_nline3_buffer/uu_nline3_buffer/fsync
add wave -noupdate -height 32 -expand -group line3_buffer /tb_nline3_buffer/uu_nline3_buffer/hsync
add wave -noupdate -height 32 -expand -group line3_buffer /tb_nline3_buffer/uu_nline3_buffer/dx_out
add wave -noupdate -height 32 -expand -group line3_buffer /tb_nline3_buffer/uu_nline3_buffer/dy_out
add wave -noupdate -height 32 -expand -group line3_buffer /tb_nline3_buffer/uu_nline3_buffer/grad_out



add wave -noupdate -height 32 -expand -group line3_buffer -expand -subitemconfig {{/tb_nline3_buffer/uu_nline3_buffer/ini_row[1]} {-color Magenta -height 15 -itemcolor Magenta} {/tb_nline3_buffer/uu_nline3_buffer/ini_row[0]} {-color {Medium Aquamarine} -height 15 -itemcolor {Medium Aquamarine}}} /tb_nline3_buffer/uu_nline3_buffer/ini_row
add wave -noupdate -height 32 -expand -group line3_buffer -expand -subitemconfig {{/tb_nline3_buffer/uu_nline3_buffer/ini_column[1]} {-color Magenta -height 15 -itemcolor Magenta} {/tb_nline3_buffer/uu_nline3_buffer/ini_column[0]} {-color {Medium Aquamarine} -height 15 -itemcolor {Medium Aquamarine}}} /tb_nline3_buffer/uu_nline3_buffer/ini_column
add wave -noupdate -height 32 -expand -group line3_buffer -expand /tb_nline3_buffer/uu_nline3_buffer/wea
add wave -noupdate -height 32 -expand -group line3_buffer -radix unsigned /tb_nline3_buffer/uu_nline3_buffer/addra
add wave -noupdate -height 32 -expand -group line3_buffer -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/sout
add wave -noupdate -height 32 -expand -group line3_buffer -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/dx_reg
add wave -noupdate -height 32 -expand -group line3_buffer -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/dy_reg
add wave -noupdate -height 32 -expand -group line3_buffer -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/grad_reg


add wave -noupdate -height 32 -expand -group line3_buffer -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/dx_reg2
add wave -noupdate -height 32 -expand -group line3_buffer -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/dy_reg2
add wave -noupdate -height 32 -expand -group line3_buffer -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/grad_reg2


add wave -noupdate -height 32 -expand -group line3_buffer /tb_nline3_buffer/uu_nline3_buffer/clk_inv
add wave -noupdate -height 32 -expand -group line3_buffer /tb_nline3_buffer/uu_nline3_buffer/vvalid_reg
add wave -noupdate -height 32 -expand -group line3_buffer /tb_nline3_buffer/uu_nline3_buffer/hvalid_reg
add wave -noupdate -height 32 -expand -group line3_buffer -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/dx_reg
add wave -noupdate -height 32 -expand -group line3_buffer -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/dy_reg
add wave -noupdate -height 32 -expand -group line3_buffer -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/grad_reg


add wave -noupdate -height 32 -expand -group line3_buffer /tb_nline3_buffer/uu_nline3_buffer/hsync_reg
add wave -noupdate -height 32 -expand -group line3_buffer /tb_nline3_buffer/uu_nline3_buffer/ini_row_reg

add wave -noupdate -height 32 -expand -group line3_buffer -color {Blue Violet} -itemcolor {Blue Violet} -radix unsigned /tb_nline3_buffer/uu_nline3_buffer/cnt0
add wave -noupdate -height 32 -expand -group line3_buffer -color Magenta -itemcolor Magenta -radix unsigned /tb_nline3_buffer/uu_nline3_buffer/cnt0_reg

add wave -noupdate -height 32 -expand -group line3_buffer -radix unsigned /tb_nline3_buffer/uu_nline3_buffer/cnt1
add wave -noupdate -height 32 -expand -group line3_buffer -radix unsigned /tb_nline3_buffer/uu_nline3_buffer/cnt2
add wave -noupdate -height 32 -expand -group line3_buffer -radix unsigned /tb_nline3_buffer/uu_nline3_buffer/cnt2_reg
add wave -noupdate -height 32 -expand -group line3_buffer -expand /tb_nline3_buffer/uu_nline3_buffer/state
add wave -noupdate -height 32 -expand -group line3_buffer -expand /tb_nline3_buffer/uu_nline3_buffer/state_column
add wave -noupdate -height 32 -expand -group line3_buffer -expand -subitemconfig {{/tb_nline3_buffer/uu_nline3_buffer/state_reg[0]} {-color Pink -height 15 -itemcolor Pink}} /tb_nline3_buffer/uu_nline3_buffer/state_reg
add wave -noupdate -height 32 -expand -group line3_buffer -color Pink -itemcolor Pink /tb_nline3_buffer/uu_nline3_buffer/fsync
add wave -noupdate -height 32 -expand -group line3_buffer -color {Violet Red} -itemcolor {Violet Red} /tb_nline3_buffer/uu_nline3_buffer/hsync
add wave -noupdate -height 32 -expand -group line3_buffer -color Pink -itemcolor Pink -radix unsigned /tb_nline3_buffer/uu_nline3_buffer/addra
add wave -noupdate -height 32 -expand -group line3_buffer -color {Medium Spring Green} -itemcolor {Medium Spring Green} -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/d2_xreg
add wave -noupdate -height 32 -expand -group line3_buffer -color {Medium Spring Green} -itemcolor {Medium Spring Green} -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/d1_xreg
add wave -noupdate -height 32 -expand -group line3_buffer -color {Medium Spring Green} -itemcolor {Medium Spring Green} -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/d0_xreg




add wave -noupdate -height 32 -expand -group line3_buffer -color {Medium Spring Green} -itemcolor {Medium Spring Green} -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/d2_yreg
add wave -noupdate -height 32 -expand -group line3_buffer -color {Medium Spring Green} -itemcolor {Medium Spring Green} -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/d1_yreg
add wave -noupdate -height 32 -expand -group line3_buffer -color {Medium Spring Green} -itemcolor {Medium Spring Green} -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/d0_yreg




add wave -noupdate -height 32 -expand -group line3_buffer -color {Medium Spring Green} -itemcolor {Medium Spring Green} -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/d2_greg
add wave -noupdate -height 32 -expand -group line3_buffer -color {Medium Spring Green} -itemcolor {Medium Spring Green} -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/d1_greg
add wave -noupdate -height 32 -expand -group line3_buffer -color {Medium Spring Green} -itemcolor {Medium Spring Green} -radix hexadecimal /tb_nline3_buffer/uu_nline3_buffer/d0_greg




run 125ms

