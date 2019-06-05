quit -sim
cd D:/xilinx/Vivado/myprj/canny_tb/tb

vlib work
vmap work

vlog  +acc ../src/reg_wr.v
vlog  +acc ../lib/wl_srl.v
vlog  +acc ../lib/wl_regd.v
vlog  +acc ../lib/wl_sram.v

vlog  +acc ../tb/stimulus_gen.sv
vlog  +acc ../src/line7_buffer.sv

vlog  +acc ../tb/tb_line7_buffer.sv


vlog -work work "D:/xilinx/Vivado/2014.4/data/verilog/src/glbl.v"

vopt +acc -L unisims_ver -L unimacro_ver -L secureip -L work -work work work.tb_line7_buffer work.glbl -o tb_line7_buffer_opt
vsim -t 1ps -lib work tb_line7_buffer_opt

view wave

log -r /*


add wave -noupdate -color Gold -itemcolor Gold /tb_line7_buffer/clk
add wave -noupdate -color Gold -itemcolor Gold /tb_line7_buffer/vvalid
add wave -noupdate /tb_line7_buffer/rst_b
add wave -noupdate -color Gold -itemcolor Gold /tb_line7_buffer/hvalid
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /tb_line7_buffer/sen_dout
add wave -noupdate -expand /tb_line7_buffer/uu_line7_buffer/wea
add wave -noupdate /tb_line7_buffer/uu_line7_buffer/fsync
add wave -noupdate /tb_line7_buffer/uu_line7_buffer/hsync
add wave -noupdate -radix unsigned -childformat {{{/tb_line7_buffer/uu_line7_buffer/sout[9]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/sout[8]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/sout[7]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/sout[6]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/sout[5]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/sout[4]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/sout[3]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/sout[2]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/sout[1]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/sout[0]} -radix hexadecimal}} -expand -subitemconfig {{/tb_line7_buffer/uu_line7_buffer/sout[9]} {-color {Violet Red} -height 15 -itemcolor {Violet Red} -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/sout[8]} {-height 15 -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/sout[7]} {-color {Violet Red} -height 15 -itemcolor {Violet Red} -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/sout[6]} {-height 15 -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/sout[5]} {-color {Violet Red} -height 15 -itemcolor {Violet Red} -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/sout[4]} {-height 15 -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/sout[3]} {-color {Violet Red} -height 15 -itemcolor {Violet Red} -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/sout[2]} {-height 15 -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/sout[1]} {-color {Violet Red} -height 15 -itemcolor {Violet Red} -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/sout[0]} {-height 15 -radix hexadecimal}} /tb_line7_buffer/uu_line7_buffer/sout
add wave -noupdate /tb_line7_buffer/uu_line7_buffer/vvalid_reg
add wave -noupdate -expand /tb_line7_buffer/uu_line7_buffer/hvalid_reg
add wave -noupdate -radix unsigned -childformat {{{/tb_line7_buffer/uu_line7_buffer/din_reg[2]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/din_reg[1]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/din_reg[0]} -radix unsigned}} -expand -subitemconfig {{/tb_line7_buffer/uu_line7_buffer/din_reg[2]} {-height 15 -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/din_reg[1]} {-height 15 -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/din_reg[0]} {-height 15 -radix unsigned}} /tb_line7_buffer/uu_line7_buffer/din_reg
add wave -noupdate /tb_line7_buffer/uu_line7_buffer/fsync
add wave -noupdate /tb_line7_buffer/uu_line7_buffer/hsync
add wave -noupdate -color Gold -itemcolor Gold /tb_line7_buffer/uu_line7_buffer/clk_inv
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /tb_line7_buffer/uu_line7_buffer/state
add wave -noupdate -color Gold -itemcolor Gold /tb_line7_buffer/clk
add wave -noupdate -expand -subitemconfig {{/tb_line7_buffer/uu_line7_buffer/wea[7]} {-color {Violet Red} -height 15 -itemcolor {Violet Red}} {/tb_line7_buffer/uu_line7_buffer/wea[6]} {-color Goldenrod -height 15 -itemcolor Goldenrod}} /tb_line7_buffer/uu_line7_buffer/wea
add wave -noupdate -color {Violet Red} -itemcolor {Violet Red} {/tb_line7_buffer/uu_line7_buffer/wea[7]}
add wave -noupdate -color Goldenrod -itemcolor Goldenrod {/tb_line7_buffer/uu_line7_buffer/wea[6]}
add wave -noupdate -radix hexadecimal -childformat {{{/tb_line7_buffer/uu_line7_buffer/regce[9]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/regce[8]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/regce[7]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/regce[6]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/regce[5]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/regce[4]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/regce[3]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/regce[2]} -radix hexadecimal}} -expand -subitemconfig {{/tb_line7_buffer/uu_line7_buffer/regce[9]} {-height 15 -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/regce[8]} {-height 15 -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/regce[7]} {-height 15 -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/regce[6]} {-height 15 -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/regce[5]} {-height 15 -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/regce[4]} {-height 15 -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/regce[3]} {-height 15 -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/regce[2]} {-height 15 -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/regce[1]} {-color Gold -height 15 -itemcolor Gold} {/tb_line7_buffer/uu_line7_buffer/regce[0]} {-color Gold -height 15 -itemcolor Gold}} /tb_line7_buffer/uu_line7_buffer/regce
add wave -noupdate -color Gold -itemcolor Gold /tb_line7_buffer/uu_line7_buffer/clk_inv
add wave -noupdate -color Gold -itemcolor Gold -radix unsigned -childformat {{{/tb_line7_buffer/uu_line7_buffer/dout[39]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[38]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[37]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[36]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[35]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[34]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[33]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[32]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[31]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[30]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[29]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[28]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[27]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[26]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[25]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[24]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[23]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[22]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[21]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[20]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[19]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[18]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[17]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[16]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[15]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[14]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[13]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[12]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[11]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[10]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[9]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[8]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[7]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[6]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[5]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[4]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[3]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[2]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[1]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/dout[0]} -radix unsigned}} -subitemconfig {{/tb_line7_buffer/uu_line7_buffer/dout[39]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[38]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[37]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[36]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[35]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[34]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[33]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[32]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[31]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[30]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[29]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[28]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[27]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[26]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[25]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[24]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[23]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[22]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[21]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[20]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[19]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[18]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[17]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[16]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[15]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[14]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[13]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[12]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[11]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[10]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[9]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[8]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[7]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[6]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[5]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[4]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[3]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[2]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[1]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/dout[0]} {-color Gold -height 15 -itemcolor Gold -radix unsigned}} /tb_line7_buffer/uu_line7_buffer/dout
add wave -noupdate -color Gold -itemcolor Gold /tb_line7_buffer/uu_line7_buffer/ini_row
add wave -noupdate -color Gold -itemcolor Gold /tb_line7_buffer/uu_line7_buffer/ini_column
add wave -noupdate -color Gold -itemcolor Gold /tb_line7_buffer/clk
add wave -noupdate /tb_line7_buffer/uu_line7_buffer/fsync
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal -childformat {{{/tb_line7_buffer/uu_line7_buffer/state[1]} -radix hexadecimal} {{/tb_line7_buffer/uu_line7_buffer/state[0]} -radix hexadecimal}} -expand -subitemconfig {{/tb_line7_buffer/uu_line7_buffer/state[1]} {-color Gold -height 16 -itemcolor Gold -radix hexadecimal} {/tb_line7_buffer/uu_line7_buffer/state[0]} {-color Gold -height 16 -itemcolor Gold -radix hexadecimal}} /tb_line7_buffer/uu_line7_buffer/state
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /tb_line7_buffer/uu_line7_buffer/state_reg
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal {/tb_line7_buffer/uu_line7_buffer/state[0]}
add wave -noupdate /tb_line7_buffer/uu_line7_buffer/hsync
add wave -noupdate -color {Medium Violet Red} -itemcolor {Medium Violet Red} -radix hexadecimal /tb_line7_buffer/uu_line7_buffer/d4_reg
add wave -noupdate -color {Medium Violet Red} -itemcolor {Medium Violet Red} -radix hexadecimal /tb_line7_buffer/uu_line7_buffer/d3_reg
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /tb_line7_buffer/uu_line7_buffer/d2_reg
add wave -noupdate -color Salmon -itemcolor Salmon -radix hexadecimal /tb_line7_buffer/uu_line7_buffer/d1_reg
add wave -noupdate -color {Medium Violet Red} -itemcolor {Medium Violet Red} -radix hexadecimal /tb_line7_buffer/uu_line7_buffer/d0_reg
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal {/tb_line7_buffer/uu_line7_buffer/state[1]}
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -radix unsigned /tb_line7_buffer/uu_line7_buffer/cnt0
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -radix unsigned /tb_line7_buffer/uu_line7_buffer/cnt1
add wave -noupdate -color Gold -itemcolor Gold /tb_line7_buffer/uu_line7_buffer/clk_inv
add wave -noupdate {/tb_line7_buffer/uu_line7_buffer/hvalid_reg[5]}
add wave -noupdate {/tb_line7_buffer/uu_line7_buffer/hvalid_reg[4]}
add wave -noupdate {/tb_line7_buffer/uu_line7_buffer/hvalid_reg[3]}
add wave -noupdate -color {Violet Red} -itemcolor {Violet Red} /tb_line7_buffer/uu_line7_buffer/hsync
add wave -noupdate -color {Violet Red} -itemcolor {Violet Red} -radix unsigned -childformat {{{/tb_line7_buffer/uu_line7_buffer/addra[9]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/addra[8]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/addra[7]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/addra[6]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/addra[5]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/addra[4]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/addra[3]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/addra[2]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/addra[1]} -radix unsigned} {{/tb_line7_buffer/uu_line7_buffer/addra[0]} -radix unsigned}} -subitemconfig {{/tb_line7_buffer/uu_line7_buffer/addra[9]} {-color {Violet Red} -height 15 -itemcolor {Violet Red} -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/addra[8]} {-color {Violet Red} -height 15 -itemcolor {Violet Red} -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/addra[7]} {-color {Violet Red} -height 15 -itemcolor {Violet Red} -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/addra[6]} {-color {Violet Red} -height 15 -itemcolor {Violet Red} -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/addra[5]} {-color {Violet Red} -height 15 -itemcolor {Violet Red} -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/addra[4]} {-color {Violet Red} -height 15 -itemcolor {Violet Red} -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/addra[3]} {-color {Violet Red} -height 15 -itemcolor {Violet Red} -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/addra[2]} {-color {Violet Red} -height 15 -itemcolor {Violet Red} -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/addra[1]} {-color {Violet Red} -height 15 -itemcolor {Violet Red} -radix unsigned} {/tb_line7_buffer/uu_line7_buffer/addra[0]} {-color {Violet Red} -height 15 -itemcolor {Violet Red} -radix unsigned}} /tb_line7_buffer/uu_line7_buffer/addra
add wave -noupdate {/tb_line7_buffer/uu_line7_buffer/hvalid_reg[3]}


run 23ms

