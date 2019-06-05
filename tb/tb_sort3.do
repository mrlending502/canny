quit -sim
cd D:/Xilinx/Vivado/myprj/vision_top/tb

vlib work
vmap work

vlog  +acc ../lib/wl_sort3.v
vlog  +acc ../tb/tb_sort3.v

vlog -work work "D:/Xilinx/Vivado/2015.4/data/verilog/src/glbl.v"

vopt +acc -L unisims_ver -L unimacro_ver -L secureip -L work -work work work.tb_sort3 work.glbl -o tb_sort3_opt
vsim -t 1ps -lib work tb_sort3_opt

view wave

#view structure
#view signals
log -r /*

quietly virtual function -install /tb_sort3 -env /tb_sort3 { &{/tb_sort3/din[7], /tb_sort3/din[6], /tb_sort3/din[5], /tb_sort3/din[4], /tb_sort3/din[3], /tb_sort3/din[2], /tb_sort3/din[1], /tb_sort3/din[0] }} a
quietly virtual function -install /tb_sort3 -env /tb_sort3 { &{/tb_sort3/din[15], /tb_sort3/din[14], /tb_sort3/din[13], /tb_sort3/din[12], /tb_sort3/din[11], /tb_sort3/din[10], /tb_sort3/din[9], /tb_sort3/din[8] }} b
quietly virtual function -install /tb_sort3 -env /tb_sort3 { &{/tb_sort3/din[23], /tb_sort3/din[22], /tb_sort3/din[21], /tb_sort3/din[20], /tb_sort3/din[19], /tb_sort3/din[18], /tb_sort3/din[17], /tb_sort3/din[16] }} c
quietly virtual signal -install /tb_sort3 { /tb_sort3/dout[7:0]} aa
quietly virtual signal -install /tb_sort3 { /tb_sort3/dout[15:8]} bb
quietly virtual signal -install /tb_sort3 { /tb_sort3/dout[23:16]} cc
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold -itemcolor Gold /tb_sort3/clk
add wave -noupdate -color Gold -itemcolor Gold /tb_sort3/rst_b
add wave -noupdate -radix unsigned /tb_sort3/a
add wave -noupdate -radix unsigned /tb_sort3/b
add wave -noupdate -radix unsigned /tb_sort3/c
add wave -noupdate -childformat {{{/tb_sort3/din[7]} -radix unsigned} {{/tb_sort3/din[6]} -radix unsigned} {{/tb_sort3/din[5]} -radix unsigned} {{/tb_sort3/din[4]} -radix unsigned} {{/tb_sort3/din[3]} -radix unsigned} {{/tb_sort3/din[2]} -radix unsigned} {{/tb_sort3/din[1]} -radix unsigned} {{/tb_sort3/din[0]} -radix unsigned}} -subitemconfig {{/tb_sort3/din[7]} {-radix unsigned} {/tb_sort3/din[6]} {-radix unsigned} {/tb_sort3/din[5]} {-radix unsigned} {/tb_sort3/din[4]} {-radix unsigned} {/tb_sort3/din[3]} {-radix unsigned} {/tb_sort3/din[2]} {-radix unsigned} {/tb_sort3/din[1]} {-radix unsigned} {/tb_sort3/din[0]} {-radix unsigned}} /tb_sort3/din
add wave -noupdate -color {Violet Red} -itemcolor {Violet Red} -radix unsigned /tb_sort3/aa
add wave -noupdate -color {Violet Red} -itemcolor {Violet Red} -radix unsigned /tb_sort3/bb
add wave -noupdate -color {Violet Red} -itemcolor {Violet Red} -radix unsigned /tb_sort3/cc
add wave -noupdate -expand /tb_sort3/dout
add wave -noupdate /glbl/GSR

add wave -noupdate /glbl/GSR

run 1us
