quit -sim
cd D:/Xilinx/Vivado/myprj/vision_top/tb

vlib work
vmap work



vlog  +acc ../lib/parcomm.v
vlog  +acc ../lib/wl_srl.v
vlog  +acc ../lib/wl_regd.v
vlog  +acc ../lib/wl_sram.v
vlog  +acc ../lib/wl_sdram.v
vlog  +acc ../lib/wl_sort3.v
vlog  +acc ../lib/wl_reset_box.v



vlog  +acc ../tb/sink_gen.sv
vlog  +acc ../tb/stimulus_gen.sv
vlog  +acc ../src/canny/line3_buffer.sv
vlog  +acc ../src/canny/median_filter.sv
vlog  +acc ../tb/tb_median_filter.sv


vlog  +acc ../tb/tb_median_filter.sv

vlog -work work "D:/Xilinx/Vivado/2015.4/data/verilog/src/glbl.v"

vopt +acc -L unisims_ver -L unimacro_ver -L secureip -L work -work work work.tb_median_filter work.glbl -o tb_median_filter_opt
vsim -t 1ps -lib work tb_median_filter_opt

view wave

#view structure
#view signals
log -r /*

add wave -noupdate -height 32 -expand -group media_filter -color Gold -itemcolor Gold /tb_median_filter/uu_median_filter/clk
add wave -noupdate -height 32 -expand -group media_filter -color Gold -itemcolor Gold /tb_median_filter/uu_median_filter/rst_b
add wave -noupdate -height 32 -expand -group media_filter -color Yellow -itemcolor Yellow /tb_median_filter/uu_median_filter/hvalid
add wave -noupdate -height 32 -expand -group media_filter -color Yellow -itemcolor Yellow /tb_median_filter/uu_median_filter/vvalid
add wave -noupdate -height 32 -expand -group media_filter -radix hexadecimal /tb_median_filter/uu_median_filter/din
add wave -noupdate -height 32 -expand -group media_filter -color {Violet Red} -itemcolor {Violet Red} /tb_median_filter/uu_median_filter/fsync
add wave -noupdate -height 32 -expand -group media_filter -color {Violet Red} -itemcolor {Violet Red} /tb_median_filter/uu_median_filter/hsync
add wave -noupdate -height 32 -expand -group media_filter -color {Violet Red} -itemcolor {Violet Red} -radix hexadecimal /tb_median_filter/uu_median_filter/dout
add wave -noupdate -height 32 -expand -group media_filter /tb_median_filter/uu_median_filter/fsync_reg
add wave -noupdate -height 32 -expand -group media_filter /tb_median_filter/uu_median_filter/hsync_reg
add wave -noupdate -height 32 -expand -group media_filter -radix hexadecimal /tb_median_filter/uu_median_filter/dd_temp
add wave -noupdate -height 32 -expand -group media_filter -color {Violet Red} -itemcolor {Violet Red} /tb_median_filter/uu_median_filter/ini_row
add wave -noupdate -height 32 -expand -group media_filter -color {Violet Red} -itemcolor {Violet Red} /tb_median_filter/uu_median_filter/ini_column
add wave -noupdate -height 32 -expand -group media_filter -radix hexadecimal  -color Yellow -itemcolor Yellow /tb_median_filter/uu_median_filter/d0_out
add wave -noupdate -height 32 -expand -group media_filter -radix hexadecimal  -color Yellow -itemcolor Yellow /tb_median_filter/uu_median_filter/d1_out
add wave -noupdate -height 32 -expand -group media_filter -radix hexadecimal  -color Yellow -itemcolor Yellow /tb_median_filter/uu_median_filter/d2_out
add wave -noupdate -height 32 -expand -group media_filter -radix hexadecimal  -color {Orange Red} -itemcolor {Orange Red} /tb_median_filter/uu_median_filter/d0_reg
add wave -noupdate -height 32 -expand -group media_filter -radix hexadecimal  -color {Orange Red} -itemcolor {Orange Red} /tb_median_filter/uu_median_filter/d1_reg
add wave -noupdate -height 32 -expand -group media_filter -radix hexadecimal  -color {Orange Red} -itemcolor {Orange Red} /tb_median_filter/uu_median_filter/d2_reg
add wave -noupdate -height 32 -expand -group media_filter -radix hexadecimal  -color Maroon -itemcolor Maroon /tb_median_filter/uu_median_filter/dd_reg



add wave -noupdate -height 32 -group line3_buffer -color Gold -itemcolor Gold /tb_median_filter/uu_median_filter/uu_line3_buffer/clk
add wave -noupdate -height 32 -group line3_buffer -color Gold -itemcolor Gold /tb_median_filter/uu_median_filter/uu_line3_buffer/rst_b
add wave -noupdate -height 32 -group line3_buffer /tb_median_filter/uu_median_filter/uu_line3_buffer/state
add wave -noupdate -height 32 -group line3_buffer /tb_median_filter/uu_median_filter/uu_line3_buffer/vvalid
add wave -noupdate -height 32 -group line3_buffer /tb_median_filter/uu_median_filter/uu_line3_buffer/hvalid
add wave -noupdate -height 32 -group line3_buffer -radix hexadecimal /tb_median_filter/uu_median_filter/uu_line3_buffer/din
add wave -noupdate -height 32 -group line3_buffer /tb_median_filter/uu_median_filter/uu_line3_buffer/fsync
add wave -noupdate -height 32 -group line3_buffer /tb_median_filter/uu_median_filter/uu_line3_buffer/hsync

add wave -noupdate -height 32 -group line3_buffer -radix hexadecimal /tb_median_filter/uu_median_filter/uu_line3_buffer/d0_reg   
add wave -noupdate -height 32 -group line3_buffer -radix hexadecimal /tb_median_filter/uu_median_filter/uu_line3_buffer/d1_reg
add wave -noupdate -height 32 -group line3_buffer -radix hexadecimal /tb_median_filter/uu_median_filter/uu_line3_buffer/d2_reg

add wave -noupdate -height 32 -group line3_buffer -radix hexadecimal -childformat {{{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[23]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[22]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[21]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[20]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[19]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[18]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[17]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[16]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[15]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[14]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[13]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[12]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[11]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[10]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[9]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[8]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[7]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[6]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[5]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[4]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[3]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[2]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[1]} -radix hexadecimal} {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[0]} -radix hexadecimal}} -subitemconfig {{/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[23]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[22]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[21]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[20]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[19]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[18]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[17]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[16]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[15]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[14]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[13]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[12]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[11]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[10]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[9]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[8]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[7]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[6]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[5]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[4]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[3]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[2]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[1]} {-height 15 -radix hexadecimal} {/tb_median_filter/uu_median_filter/uu_line3_buffer/dout[0]} {-height 15 -radix hexadecimal}} /tb_median_filter/uu_median_filter/uu_line3_buffer/dout
add wave -noupdate -height 32 -group line3_buffer -color {Violet Red} -itemcolor {Violet Red} /tb_median_filter/uu_median_filter/uu_line3_buffer/ini_row
add wave -noupdate -height 32 -group line3_buffer -color {Violet Red} -itemcolor {Violet Red} /tb_median_filter/uu_median_filter/uu_line3_buffer/ini_column
add wave -noupdate -height 32 -group line3_buffer /tb_median_filter/uu_median_filter/uu_line3_buffer/wea
add wave -noupdate -height 32 -group line3_buffer -radix unsigned /tb_median_filter/uu_median_filter/uu_line3_buffer/addra
add wave -noupdate -height 32 -group line3_buffer -color Yellow -itemcolor Yellow -subitemconfig {{/tb_median_filter/uu_median_filter/uu_line3_buffer/sout[5]} {-color Yellow -height 15 -itemcolor Yellow} {/tb_median_filter/uu_median_filter/uu_line3_buffer/sout[4]} {-color Yellow -height 15 -itemcolor Yellow} {/tb_median_filter/uu_median_filter/uu_line3_buffer/sout[3]} {-color Yellow -height 15 -itemcolor Yellow} {/tb_median_filter/uu_median_filter/uu_line3_buffer/sout[2]} {-color Yellow -height 15 -itemcolor Yellow} {/tb_median_filter/uu_median_filter/uu_line3_buffer/sout[1]} {-color Yellow -height 15 -itemcolor Yellow} {/tb_median_filter/uu_median_filter/uu_line3_buffer/sout[0]} {-color Yellow -height 15 -itemcolor Yellow}} /tb_median_filter/uu_median_filter/uu_line3_buffer/sout
add wave -noupdate -height 32 -group line3_buffer -radix hexadecimal /tb_median_filter/uu_median_filter/uu_line3_buffer/dout_reg
add wave -noupdate -height 32 -group line3_buffer -radix hexadecimal /tb_median_filter/uu_median_filter/uu_line3_buffer/dout_reg2
add wave -noupdate -height 32 -group line3_buffer -color Yellow -itemcolor Yellow /tb_median_filter/uu_median_filter/uu_line3_buffer/clk_inv
add wave -noupdate -height 32 -group line3_buffer /tb_median_filter/uu_median_filter/uu_line3_buffer/vvalid_reg
add wave -noupdate -height 32 -group line3_buffer /tb_median_filter/uu_median_filter/uu_line3_buffer/hvalid_reg
add wave -noupdate -height 32 -group line3_buffer /tb_median_filter/uu_median_filter/uu_line3_buffer/din_reg
add wave -noupdate -height 32 -group line3_buffer /tb_median_filter/uu_median_filter/uu_line3_buffer/hsync_reg
add wave -noupdate -height 32 -group line3_buffer /tb_median_filter/uu_median_filter/uu_line3_buffer/ini_row_reg
add wave -noupdate -height 32 -group line3_buffer -radix unsigned /tb_median_filter/uu_median_filter/uu_line3_buffer/cnt0
add wave -noupdate -height 32 -group line3_buffer -radix unsigned /tb_median_filter/uu_median_filter/uu_line3_buffer/cnt1
add wave -noupdate -height 32 -group line3_buffer -radix unsigned /tb_median_filter/uu_median_filter/uu_line3_buffer/cnt2
add wave -noupdate -height 32 -group line3_buffer -radix unsigned /tb_median_filter/uu_median_filter/uu_line3_buffer/cnt0_reg
add wave -noupdate -height 32 -group line3_buffer -radix unsigned /tb_median_filter/uu_median_filter/uu_line3_buffer/cnt2_reg
add wave -noupdate -height 32 -group line3_buffer /tb_median_filter/uu_median_filter/uu_line3_buffer/state_column
add wave -noupdate -height 32 -group line3_buffer /tb_median_filter/uu_median_filter/uu_line3_buffer/state_reg






#run  3ms
run 120ms