quit -sim
cd D:/xilinx/Vivado/myprj/canny_tb/tb

vlib work
vmap work

vlog  +acc ../lib/wl_regd.v
vlog  +acc ../tb/sink_gen.sv

vlog -work work "D:/xilinx/Vivado/2014.4/data/verilog/src/glbl.v"

#vsim -L unisims_ver -L unimacro_ver -L secureip -lib work -voptargs=\"+acc\" -t 1ps work glbl 
vsim -voptargs=+acc work.sink_gen

view wave

#view structure
#view signals
log -r /*

add wave -noupdate /sink_gen/clk
add wave -noupdate /sink_gen/rst_b
add wave -noupdate -radix hexadecimal /sink_gen/cnt0
add wave -noupdate -radix hexadecimal /sink_gen/cnt1
#add wave -noupdate /sink_gen/hvalid_reg[0]
#add wave -noupdate /sink_gen/hvalid_reg[1]

#add wave -noupdate /sink_gen/vvalid_reg[0]
#add wave -noupdate /sink_gen/vvalid_reg[1]

add wave -noupdate -color Gold -itemcolor Gold -radix unsigned /sink_gen/state
add wave -noupdate -color Gold -itemcolor Gold /sink_gen/vvalid
add wave -noupdate -color Gold -itemcolor Gold /sink_gen/hvalid
add wave -noupdate -color Gold -itemcolor Gold -radix unsigned /sink_gen/dout
add wave -noupdate -radix unsigned /sink_gen/addr
add wave -noupdate /sink_gen/ena

run 100us
