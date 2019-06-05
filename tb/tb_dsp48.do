quit -sim
cd D:/xilinx/Vivado/myprj/canny_tb/tb

vlib work
vmap work

vlog  +acc ../ipcore/dsp48_ip/dsp48_ip_funcsim.v
vlog  +acc ../tb/tb_dsp48.v


vlog -work work "D:/xilinx/Vivado/2014.4/data/verilog/src/glbl.v"

vopt +acc -L unisims_ver -L unimacro_ver -L secureip -L work -work work work.tb_dsp48 work.glbl -o tb_dsp48_opt
vsim -t 1ps -lib work tb_dsp48_opt

view wave

#view structure
#view signals
log -r /*

add wave -noupdate /tb_dsp48/clk
add wave -noupdate /tb_dsp48/rst_b
add wave -noupdate -radix unsigned /tb_dsp48/a
add wave -noupdate -radix unsigned /tb_dsp48/d
add wave -noupdate -radix unsigned /tb_dsp48/b
add wave -noupdate -radix unsigned /tb_dsp48/p


add wave -noupdate /glbl/GSR

run 1us
