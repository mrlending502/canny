quit -sim
cd D:/Xilinx/Vivado/myprj/vision_top/tb

vlib work
vmap work

vlog  +acc ../lib/wl_srl.v
vlog  +acc ../lib/parcomm.v
vlog  +acc ../lib/wl_regd.v
vlog  +acc ../lib/wl_regd2.v
vlog  +acc ../lib/wl_sram.v
vlog  +acc ../lib/wl_sdram.v
vlog  +acc ../lib/wl_round.v
vlog  +acc ../lib/wl_reset_box.v
vlog  +acc ../lib/wl_sat_round.v


vlog  +acc ../tb/sink_gen.sv
vlog  +acc ../tb/stimulus_gen.sv
vlog  +acc ../src/canny/line5_buffer.sv
vlog  +acc ../src/canny/gaussian_conv.sv
vlog  +acc ../src/canny/gaussian_filter.sv

vlog  +acc ../tb/tb_gaussian_filter.sv

vlog -work work "D:/Xilinx/Vivado/2015.4/data/verilog/src/glbl.v"

vopt +acc -L unisims_ver -L unimacro_ver -L secureip -L work -work work work.tb_gaussian_filter work.glbl -o tb_gaussian_filter_opt
vsim -t 1ps -lib work tb_gaussian_filter_opt

view wave

#view structure
#view signals
log -r /*

add wave -noupdate -height 32 -expand -group tb_top /tb_gaussian_filter/clk
add wave -noupdate -height 32 -expand -group tb_top /tb_gaussian_filter/rst_b
add wave -noupdate -height 32 -expand -group stimulus /tb_gaussian_filter/hvalid
add wave -noupdate -height 32 -expand -group stimulus /tb_gaussian_filter/vvalid
add wave -noupdate -height 32 -expand -group stimulus -radix hexadecimal /tb_gaussian_filter/sen_dout
add wave -noupdate -height 32 -group gaussian_filter /tb_gaussian_filter/uu_gaussian_filter/vvalid
add wave -noupdate -height 32 -group gaussian_filter /tb_gaussian_filter/uu_gaussian_filter/hvalid
add wave -noupdate -height 32 -group gaussian_filter /tb_gaussian_filter/uu_gaussian_filter/fsync_reg
add wave -noupdate -height 32 -group gaussian_filter /tb_gaussian_filter/uu_gaussian_filter/hsync_reg
add wave -noupdate -height 32 -group gaussian_filter /tb_gaussian_filter/uu_gaussian_filter/fsync
add wave -noupdate -height 32 -group gaussian_filter /tb_gaussian_filter/uu_gaussian_filter/hsync
add wave -noupdate -height 32 -group gaussian_filter -color Gold -itemcolor Gold -radix hexadecimal /tb_gaussian_filter/uu_gaussian_filter/ini_row_dout_reg
add wave -noupdate -height 32 -group gaussian_filter -color Gold -itemcolor Gold -radix hexadecimal /tb_gaussian_filter/uu_gaussian_filter/ini_col_dout_reg
add wave -noupdate -height 32 -group gaussian_filter -expand /tb_gaussian_filter/uu_gaussian_filter/ini_column
add wave -noupdate -height 32 -group gaussian_filter /tb_gaussian_filter/uu_gaussian_filter/ini_row
add wave -noupdate -height 32 -group gaussian_filter /tb_gaussian_filter/uu_gaussian_filter/dd
add wave -noupdate -height 32 -group gaussian_filter -color {Violet Red} -itemcolor {Violet Red} -radix hexadecimal /tb_gaussian_filter/uu_gaussian_filter/d4_reg
add wave -noupdate -height 32 -group gaussian_filter -color {Violet Red} -itemcolor {Violet Red} -radix hexadecimal /tb_gaussian_filter/uu_gaussian_filter/d3_reg
add wave -noupdate -height 32 -group gaussian_filter -color {Violet Red} -itemcolor {Violet Red} -radix hexadecimal /tb_gaussian_filter/uu_gaussian_filter/d2_reg
add wave -noupdate -height 32 -group gaussian_filter -color {Violet Red} -itemcolor {Violet Red} -radix hexadecimal /tb_gaussian_filter/uu_gaussian_filter/d1_reg
add wave -noupdate -height 32 -group gaussian_filter -color {Violet Red} -itemcolor {Violet Red} -radix hexadecimal /tb_gaussian_filter/uu_gaussian_filter/d0_reg
add wave -noupdate -height 32 -expand -group gaussian_conv -radix hexadecimal /tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/dd
add wave -noupdate -height 32 -expand -group gaussian_conv -radix hexadecimal -childformat {{{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[39]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[38]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[37]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[36]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[35]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[34]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[33]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[32]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[31]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[30]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[29]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[28]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[27]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[26]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[25]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[24]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[23]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[22]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[21]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[20]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[19]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[18]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[17]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[16]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[15]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[14]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[13]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[12]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[11]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[10]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[9]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[8]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[7]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[6]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[5]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[4]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[3]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[2]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[1]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[0]} -radix hexadecimal}} -subitemconfig {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[39]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[38]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[37]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[36]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[35]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[34]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[33]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[32]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[31]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[30]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[29]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[28]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[27]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[26]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[25]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[24]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[23]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[22]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[21]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[20]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[19]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[18]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[17]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[16]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[15]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[14]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[13]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[12]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[11]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[10]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[9]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[8]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[7]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[6]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[5]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[4]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[3]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[2]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[1]} {-radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe[0]} {-radix hexadecimal}} /tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coe
add wave -noupdate -height 32 -expand -group gaussian_conv -radix unsigned /tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/dout
add wave -noupdate -height 32 -expand -group gaussian_conv -color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned -childformat {{{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d4_reg[4]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d4_reg[3]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d4_reg[2]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d4_reg[1]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d4_reg[0]} -radix unsigned}} -expand -subitemconfig {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d4_reg[4]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d4_reg[3]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d4_reg[2]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d4_reg[1]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d4_reg[0]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned}} /tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d4_reg
add wave -noupdate -height 32 -expand -group gaussian_conv -color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned -childformat {{{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d3_reg[4]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d3_reg[3]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d3_reg[2]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d3_reg[1]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d3_reg[0]} -radix unsigned}} -expand -subitemconfig {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d3_reg[4]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d3_reg[3]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d3_reg[2]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d3_reg[1]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d3_reg[0]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned}} /tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d3_reg
add wave -noupdate -height 32 -expand -group gaussian_conv -color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned -childformat {{{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d2_reg[4]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d2_reg[3]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d2_reg[2]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d2_reg[1]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d2_reg[0]} -radix unsigned}} -expand -subitemconfig {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d2_reg[4]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d2_reg[3]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d2_reg[2]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d2_reg[1]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d2_reg[0]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned}} /tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d2_reg
add wave -noupdate -height 32 -expand -group gaussian_conv -color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned -childformat {{{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d1_reg[4]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d1_reg[3]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d1_reg[2]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d1_reg[1]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d1_reg[0]} -radix unsigned}} -expand -subitemconfig {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d1_reg[4]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d1_reg[3]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d1_reg[2]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d1_reg[1]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d1_reg[0]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix unsigned}} /tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d1_reg
add wave -noupdate -height 32 -expand -group gaussian_conv -color {Dark Orchid} -itemcolor {Dark Orchid} -radix hexadecimal -childformat {{{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d0_reg[4]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d0_reg[3]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d0_reg[2]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d0_reg[1]} -radix hexadecimal} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d0_reg[0]} -radix hexadecimal}} -expand -subitemconfig {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d0_reg[4]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d0_reg[3]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d0_reg[2]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d0_reg[1]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix hexadecimal} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d0_reg[0]} {-color {Dark Orchid} -itemcolor {Dark Orchid} -radix hexadecimal}} /tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/d0_reg
add wave -noupdate -height 32 -expand -group gaussian_conv -radix unsigned -childformat {{{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[12]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[11]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[10]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[9]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[8]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[7]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[6]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[5]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[4]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[3]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[2]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[1]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[0]} -radix unsigned}} -expand -subitemconfig {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[12]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[11]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[10]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[9]} {-color Gold -itemcolor Gold -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[8]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[7]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[6]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[5]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[4]} {-color {Steel Blue} -itemcolor {Steel Blue} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[3]} {-color {Steel Blue} -itemcolor {Steel Blue} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[2]} {-color {Steel Blue} -itemcolor {Steel Blue} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[1]} {-color {Steel Blue} -itemcolor {Steel Blue} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp[0]} {-color {Steel Blue} -itemcolor {Steel Blue} -radix unsigned}} /tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/temp
add wave -noupdate -height 32 -expand -group gaussian_conv -color {Orange Red} -itemcolor {Orange Red} -radix unsigned -childformat {{{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coeff[4]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coeff[3]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coeff[2]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coeff[1]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coeff[0]} -radix unsigned}} -expand -subitemconfig {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coeff[4]} {-color {Orange Red} -itemcolor {Orange Red} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coeff[3]} {-color {Orange Red} -itemcolor {Orange Red} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coeff[2]} {-color {Orange Red} -itemcolor {Orange Red} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coeff[1]} {-color {Orange Red} -itemcolor {Orange Red} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coeff[0]} {-color {Orange Red} -itemcolor {Orange Red} -radix unsigned}} /tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/coeff
add wave -noupdate -height 32 -expand -group gaussian_conv -radix unsigned -childformat {{{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[8]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[7]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[6]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[5]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[4]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[3]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[2]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[1]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[0]} -radix unsigned}} -expand -subitemconfig {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[8]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[7]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[6]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[5]} {-color Orange -itemcolor Orange -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[4]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[3]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[2]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[1]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout[0]} {-radix unsigned}} /tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout
add wave -noupdate -height 32 -expand -group gaussian_conv -color {Orange Red} -itemcolor {Orange Red} -radix unsigned -childformat {{{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout_reg[5]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout_reg[4]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout_reg[3]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout_reg[2]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout_reg[1]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout_reg[0]} -radix unsigned}} -expand -subitemconfig {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout_reg[5]} {-color {Orange Red} -itemcolor {Orange Red} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout_reg[4]} {-color {Orange Red} -itemcolor {Orange Red} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout_reg[3]} {-color {Orange Red} -itemcolor {Orange Red} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout_reg[2]} {-color {Orange Red} -itemcolor {Orange Red} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout_reg[1]} {-color {Orange Red} -itemcolor {Orange Red} -radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout_reg[0]} {-color {Orange Red} -itemcolor {Orange Red} -radix unsigned}} /tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/pout_reg
add wave -noupdate -height 32 -expand -group gaussian_conv -radix unsigned -childformat {{{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3]} -radix unsigned -childformat {{{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][17]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][16]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][15]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][14]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][13]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][12]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][11]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][10]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][9]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][8]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][7]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][6]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][5]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][4]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][3]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][2]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][1]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][0]} -radix unsigned}}} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[2]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[1]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[0]} -radix unsigned}} -expand -subitemconfig {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3]} {-radix unsigned -childformat {{{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][17]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][16]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][15]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][14]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][13]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][12]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][11]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][10]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][9]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][8]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][7]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][6]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][5]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][4]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][3]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][2]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][1]} -radix unsigned} {{/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][0]} -radix unsigned}}} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][17]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][16]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][15]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][14]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][13]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][12]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][11]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][10]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][9]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][8]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][7]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][6]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][5]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][4]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][3]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][2]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][1]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[3][0]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[2]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[1]} {-radix unsigned} {/tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum[0]} {-radix unsigned}} /tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/tmp_sum
add wave -noupdate -height 32 -expand -group gaussian_conv -color {Orange Red} -itemcolor {Orange Red} -radix unsigned /tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/mac_sum_reg
add wave -noupdate -height 32 -expand -group gaussian_conv -radix unsigned /tb_gaussian_filter/uu_gaussian_filter/uu_gaussian_conv/mac_sum_reg2

#run  3ms
run 120ms