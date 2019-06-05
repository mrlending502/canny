quit -sim
cd D:/Xilinx/Vivado/myprj/vision_top/tb




vlib work
vlib msim

vlib msim/xbip_utils_v3_0
vlib msim/c_reg_fd_v12_0
vlib msim/xbip_dsp48_wrapper_v3_0
vlib msim/xbip_pipe_v3_0
vlib msim/xbip_dsp48_addsub_v3_0
vlib msim/xbip_addsub_v3_0
vlib msim/c_addsub_v12_0
vlib msim/xbip_bram18k_v3_0
vlib msim/mult_gen_v12_0
vlib msim/axi_utils_v2_0
vlib msim/cordic_v6_0
vlib msim/xil_defaultlib
vlib msim/xbip_dsp48_macro_v3_0

vmap xbip_utils_v3_0 msim/xbip_utils_v3_0
vmap c_reg_fd_v12_0 msim/c_reg_fd_v12_0
vmap xbip_dsp48_wrapper_v3_0 msim/xbip_dsp48_wrapper_v3_0
vmap xbip_pipe_v3_0 msim/xbip_pipe_v3_0
vmap xbip_dsp48_addsub_v3_0 msim/xbip_dsp48_addsub_v3_0
vmap xbip_addsub_v3_0 msim/xbip_addsub_v3_0
vmap c_addsub_v12_0 msim/c_addsub_v12_0
vmap xbip_bram18k_v3_0 msim/xbip_bram18k_v3_0
vmap mult_gen_v12_0 msim/mult_gen_v12_0
vmap axi_utils_v2_0 msim/axi_utils_v2_0
vmap cordic_v6_0 msim/cordic_v6_0
vmap xil_defaultlib msim/xil_defaultlib
vmap xbip_dsp48_macro_v3_0 msim/xbip_dsp48_macro_v3_0

set origin_dir "."
set vlog_opts {-incr}
set vcom_opts {-93}

eval vcom $vcom_opts -work xbip_utils_v3_0          ../ipcore/wl_sqrt/xbip_utils_v3_0/hdl/xbip_utils_v3_0_vh_rfs.vhd
eval vcom $vcom_opts -work c_reg_fd_v12_0           ../ipcore/wl_sqrt/c_reg_fd_v12_0/hdl/c_reg_fd_v12_0_vh_rfs.vhd
eval vcom $vcom_opts -work c_reg_fd_v12_0           ../ipcore/wl_sqrt/c_reg_fd_v12_0/hdl/c_reg_fd_v12_0.vhd
eval vcom $vcom_opts -work xbip_dsp48_wrapper_v3_0  ../ipcore/wl_sqrt/xbip_dsp48_wrapper_v3_0/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd
eval vcom $vcom_opts -work xbip_pipe_v3_0           ../ipcore/wl_sqrt/xbip_pipe_v3_0/hdl/xbip_pipe_v3_0_vh_rfs.vhd
eval vcom $vcom_opts -work xbip_pipe_v3_0           ../ipcore/wl_sqrt/xbip_pipe_v3_0/hdl/xbip_pipe_v3_0.vhd
eval vcom $vcom_opts -work xbip_dsp48_addsub_v3_0   ../ipcore/wl_sqrt/xbip_dsp48_addsub_v3_0/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd
eval vcom $vcom_opts -work xbip_dsp48_addsub_v3_0   ../ipcore/wl_sqrt/xbip_dsp48_addsub_v3_0/hdl/xbip_dsp48_addsub_v3_0.vhd
eval vcom $vcom_opts -work xbip_addsub_v3_0  "      ../ipcore/wl_sqrt/xbip_addsub_v3_0/hdl/xbip_addsub_v3_0_vh_rfs.vhd
eval vcom $vcom_opts -work xbip_addsub_v3_0         ../ipcore/wl_sqrt/xbip_addsub_v3_0/hdl/xbip_addsub_v3_0.vhd
eval vcom $vcom_opts -work c_addsub_v12_0           ../ipcore/wl_sqrt/c_addsub_v12_0/hdl/c_addsub_v12_0_vh_rfs.vhd
eval vcom $vcom_opts -work c_addsub_v12_0           ../ipcore/wl_sqrt/c_addsub_v12_0/hdl/c_addsub_v12_0.vhd
eval vcom $vcom_opts -work xbip_bram18k_v3_0        ../ipcore/wl_sqrt/xbip_bram18k_v3_0/hdl/xbip_bram18k_v3_0_vh_rfs.vhd
eval vcom $vcom_opts -work xbip_bram18k_v3_0        ../ipcore/wl_sqrt/xbip_bram18k_v3_0/hdl/xbip_bram18k_v3_0.vhd
eval vcom $vcom_opts -work mult_gen_v12_0           ../ipcore/wl_sqrt/mult_gen_v12_0/hdl/mult_gen_v12_0_vh_rfs.vhd
eval vcom $vcom_opts -work mult_gen_v12_0           ../ipcore/wl_sqrt/mult_gen_v12_0/hdl/mult_gen_v12_0.vhd
eval vcom $vcom_opts -work axi_utils_v2_0           ../ipcore/wl_sqrt/axi_utils_v2_0/hdl/axi_utils_v2_0_vh_rfs.vhd
eval vcom $vcom_opts -work cordic_v6_0              ../ipcore/wl_sqrt/cordic_v6_0/hdl/cordic_v6_0_vh_rfs.vhd
eval vcom $vcom_opts -work cordic_v6_0              ../ipcore/wl_sqrt/cordic_v6_0/hdl/cordic_v6_0.vhd
eval vcom $vcom_opts -work xil_defaultlib           ../ipcore/wl_sqrt/sim/wl_sqrt.vhd
eval vcom $vcom_opts -work xil_defaultlib           ../ipcore/wl_sqrt/demo_tb/tb_wl_sqrt.vhd
eval vcom $vcom_opts -work xbip_dsp48_wrapper_v3_0  ../ipcore/dsp48_ip/xbip_dsp48_wrapper_v3_0/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd
eval vcom $vcom_opts -work xbip_utils_v3_0          ../ipcore/dsp48_ip/xbip_utils_v3_0/hdl/xbip_utils_v3_0_vh_rfs.vhd
eval vcom $vcom_opts -work xbip_pipe_v3_0           ../ipcore/dsp48_ip/xbip_pipe_v3_0/hdl/xbip_pipe_v3_0_vh_rfs.vhd
eval vcom $vcom_opts -work xbip_pipe_v3_0           ../ipcore/dsp48_ip/xbip_pipe_v3_0/hdl/xbip_pipe_v3_0.vhd
eval vcom $vcom_opts -work xbip_dsp48_macro_v3_0    ../ipcore/dsp48_ip/xbip_dsp48_macro_v3_0/hdl/xbip_dsp48_macro_v3_0_vh_rfs.vhd
eval vcom $vcom_opts -work xbip_dsp48_macro_v3_0    ../ipcore/dsp48_ip/xbip_dsp48_macro_v3_0/hdl/xbip_dsp48_macro_v3_0.vhd
eval vcom $vcom_opts -work xil_defaultlib           ../ipcore/dsp48_ip/sim/dsp48_ip.vhd
eval vlog $vlog_opts -work xil_defaultlib           ../lib/wl_regd.v
eval vlog $vlog_opts -work xil_defaultlib           ../lib/wl_regd2.v
eval vlog $vlog_opts -work xil_defaultlib           ../lib/wl_reset_box.v
eval vlog $vlog_opts -work xil_defaultlib           ../lib/wl_mac.v
eval vlog $vlog_opts -work xil_defaultlib           ../lib/wl_sdram.v
eval vlog $vlog_opts -sv -work xil_defaultlib       ../tb/tb_sobel3_filter.sv
eval vlog $vlog_opts -sv -work xil_defaultlib       ../tb/nsink_gen.sv
eval vlog $vlog_opts -sv -work xil_defaultlib       ../tb/stimulus_gen.sv
eval vlog $vlog_opts -work xil_defaultlib           ../lib/wl_round.v
eval vlog $vlog_opts -sv -work xil_defaultlib       ../src/line3_buffer.sv
eval vlog $vlog_opts -work xil_defaultlib           ../lib/wl_sram.v
eval vlog $vlog_opts -work xil_defaultlib           ../lib/wl_abs.v
eval vlog $vlog_opts -work xil_defaultlib           ../lib/wl_add.v
eval vlog $vlog_opts -work xil_defaultlib           ../lib/wl_srl.v
eval vlog $vlog_opts -sv -work xil_defaultlib       ../src/sobel3_conv.sv
eval vlog $vlog_opts -sv -work xil_defaultlib       ../src/sobel3_filter.sv
eval vlog $vlog_opts -sv -work xil_defaultlib       ../tb/tb_line3_buffer.sv


vlog -work work "D:/Xilinx/Vivado/2015.4/data/verilog/src/glbl.v"

vsim -t 1ps -lib work tb_sobel3_filter_opt

view wave

#view structure
#view signals
log -r /*

add wave -noupdate -height 32 -expand -group Stimulus /tb_sobel3_filter/uu_stimulus_gen/clk
add wave -noupdate -height 32 -expand -group Stimulus /tb_sobel3_filter/uu_stimulus_gen/rst_b
add wave -noupdate -height 32 -expand -group Stimulus -color {Violet Red} -itemcolor {Violet Red} /tb_sobel3_filter/uu_stimulus_gen/vvalid
add wave -noupdate -height 32 -expand -group Stimulus -color Pink -itemcolor Pink /tb_sobel3_filter/uu_stimulus_gen/hvalid
add wave -noupdate -height 32 -expand -group Stimulus -radix hexadecimal /tb_sobel3_filter/uu_stimulus_gen/dout
add wave -noupdate -height 32 -expand -group Line3_buffer /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/hvalid_reg
add wave -noupdate -height 32 -expand -group Line3_buffer /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/fsync
add wave -noupdate -height 32 -expand -group Line3_buffer -color Gold -itemcolor Gold /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/hsync
add wave -noupdate -height 32 -expand -group Line3_buffer -expand /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/ini_row
add wave -noupdate -height 32 -expand -group Line3_buffer -expand /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/ini_column
add wave -noupdate -height 32 -expand -group Line3_buffer -expand /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/wea
add wave -noupdate -height 32 -expand -group Line3_buffer -radix unsigned -childformat {{{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[9]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[8]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[7]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[6]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[5]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[4]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[3]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[2]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[1]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[0]} -radix unsigned}} -subitemconfig {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[9]} {-height 15 -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[8]} {-height 15 -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[7]} {-height 15 -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[6]} {-height 15 -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[5]} {-height 15 -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[4]} {-height 15 -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[3]} {-height 15 -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[2]} {-height 15 -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[1]} {-height 15 -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra[0]} {-height 15 -radix unsigned}} /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/addra
add wave -noupdate -height 32 -expand -group Line3_buffer -radix hexadecimal -childformat {{{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/sout[5]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/sout[4]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/sout[3]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/sout[2]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/sout[1]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/sout[0]} -radix hexadecimal}} -expand -subitemconfig {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/sout[5]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/sout[4]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/sout[3]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/sout[2]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/sout[1]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/sout[0]} {-height 15 -radix hexadecimal}} /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/sout
add wave -noupdate -height 32 -expand -group Line3_buffer /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/clk_inv
add wave -noupdate -height 32 -expand -group Line3_buffer /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/vvalid_reg
add wave -noupdate -height 32 -expand -group Line3_buffer /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/din_reg
add wave -noupdate -height 32 -expand -group Line3_buffer -radix unsigned /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/cnt0
add wave -noupdate -height 32 -expand -group Line3_buffer -color {Violet Red} -itemcolor {Violet Red} -radix unsigned /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/cnt0_reg
add wave -noupdate -height 32 -expand -group Line3_buffer -radix unsigned /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/cnt1
add wave -noupdate -height 32 -expand -group Line3_buffer -radix unsigned /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/cnt2
add wave -noupdate -height 32 -expand -group Line3_buffer -color {Violet Red} -itemcolor {Violet Red} -radix unsigned /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/cnt2_reg
add wave -noupdate -height 32 -expand -group Line3_buffer -radix hexadecimal -childformat {{{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/state_column[1]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/state_column[0]} -radix hexadecimal}} -expand -subitemconfig {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/state_column[1]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/state_column[0]} {-height 15 -radix hexadecimal}} /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/state_column
add wave -noupdate -height 32 -expand -group Line3_buffer -radix hexadecimal -childformat {{{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/state_reg[1]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/state_reg[0]} -radix hexadecimal}} -expand -subitemconfig {{/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/state_reg[1]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/state_reg[0]} {-height 15 -radix hexadecimal}} /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/state_reg
add wave -noupdate -height 32 -expand -group Line3_buffer /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/fsync
add wave -noupdate -height 32 -expand -group Line3_buffer -color Gold -itemcolor Gold /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/hsync
add wave -noupdate -height 32 -expand -group Line3_buffer -radix unsigned /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/cnt0
add wave -noupdate -height 32 -expand -group Line3_buffer -color {Violet Red} -itemcolor {Violet Red} -radix unsigned /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/cnt0_reg
add wave -noupdate -height 32 -expand -group Line3_buffer -color {Spring Green} -itemcolor {Spring Green} -radix unsigned /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/cnt1
add wave -noupdate -height 32 -expand -group Line3_buffer -color Khaki -itemcolor Khaki -radix unsigned /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/cnt2
add wave -noupdate -height 32 -expand -group Line3_buffer -color {Violet Red} -itemcolor {Violet Red} -radix unsigned /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/cnt2_reg
add wave -noupdate -height 32 -expand -group Line3_buffer -color {Spring Green} -itemcolor {Spring Green} -radix hexadecimal /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/d2_reg
add wave -noupdate -height 32 -expand -group Line3_buffer -color Magenta -itemcolor Magenta -radix hexadecimal /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/d1_reg
add wave -noupdate -height 32 -expand -group Line3_buffer -color {Spring Green} -itemcolor {Spring Green} -radix hexadecimal /tb_sobel3_filter/uu_sobel3_filter/uu_line3_buffer/d0_reg
add wave -noupdate -height 32 -expand -group Sobel3_conv -radix hexadecimal -childformat {{{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[23]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[22]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[21]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[20]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[19]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[18]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[17]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[16]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[15]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[14]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[13]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[12]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[11]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[10]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[9]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[8]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[7]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[6]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[5]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[4]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[3]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[2]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[1]} -radix hexadecimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[0]} -radix hexadecimal}} -subitemconfig {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[23]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[22]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[21]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[20]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[19]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[18]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[17]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[16]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[15]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[14]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[13]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[12]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[11]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[10]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[9]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[8]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[7]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[6]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[5]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[4]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[3]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[2]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[1]} {-height 15 -radix hexadecimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din[0]} {-height 15 -radix hexadecimal}} /tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/din
add wave -noupdate -height 32 -expand -group Sobel3_conv -color Magenta -itemcolor Magenta -radix decimal -childformat {{{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dx[7]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dx[6]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dx[5]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dx[4]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dx[3]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dx[2]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dx[1]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dx[0]} -radix unsigned}} -subitemconfig {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dx[7]} {-color Magenta -itemcolor Magenta -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dx[6]} {-color Magenta -itemcolor Magenta -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dx[5]} {-color Magenta -itemcolor Magenta -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dx[4]} {-color Magenta -itemcolor Magenta -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dx[3]} {-color Magenta -itemcolor Magenta -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dx[2]} {-color Magenta -itemcolor Magenta -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dx[1]} {-color Magenta -itemcolor Magenta -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dx[0]} {-color Magenta -itemcolor Magenta -radix unsigned}} /tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dx
add wave -noupdate -height 32 -expand -group Sobel3_conv -color Magenta -itemcolor Magenta -radix decimal /tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/dy
add wave -noupdate -height 32 -expand -group Sobel3_conv -color Magenta -itemcolor Magenta -radix decimal /tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/grad
add wave -noupdate -height 32 -expand -group Sobel3_conv -color Gold -itemcolor Gold -radix unsigned -childformat {{{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d0_reg[2]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d0_reg[1]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d0_reg[0]} -radix unsigned}} -expand -subitemconfig {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d0_reg[2]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d0_reg[1]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d0_reg[0]} {-color Gold -height 15 -itemcolor Gold -radix unsigned}} /tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d0_reg
add wave -noupdate -height 32 -expand -group Sobel3_conv -color Pink -itemcolor Pink -radix unsigned -childformat {{{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d1_reg[2]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d1_reg[1]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d1_reg[0]} -radix unsigned}} -expand -subitemconfig {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d1_reg[2]} {-color Pink -height 15 -itemcolor Pink -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d1_reg[1]} {-color Pink -height 15 -itemcolor Pink -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d1_reg[0]} {-color Pink -height 15 -itemcolor Pink -radix unsigned}} /tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d1_reg
add wave -noupdate -height 32 -expand -group Sobel3_conv -color Gold -itemcolor Gold -radix unsigned -childformat {{{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d2_reg[2]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d2_reg[1]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d2_reg[0]} -radix unsigned}} -expand -subitemconfig {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d2_reg[2]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d2_reg[1]} {-color Gold -height 15 -itemcolor Gold -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d2_reg[0]} {-color Gold -height 15 -itemcolor Gold -radix unsigned}} /tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/d2_reg
add wave -noupdate -height 32 -expand -group Sobel3_conv -color Blue -itemcolor Blue -radix decimal -childformat {{{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_reg[3]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_reg[2]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_reg[1]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_reg[0]} -radix decimal}} -expand -subitemconfig {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_reg[3]} {-color Blue -height 15 -itemcolor Blue -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_reg[2]} {-color Blue -height 15 -itemcolor Blue -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_reg[1]} {-color Blue -height 15 -itemcolor Blue -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_reg[0]} {-color Blue -height 15 -itemcolor Blue -radix decimal}} /tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_reg
add wave -noupdate -height 32 -expand -group Sobel3_conv -color Blue -itemcolor Blue -radix decimal -childformat {{{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[3]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[2]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[1]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0]} -radix decimal -childformat {{{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][8]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][7]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][6]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][5]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][4]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][3]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][2]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][1]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][0]} -radix unsigned}}}} -expand -subitemconfig {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[3]} {-color Blue -height 15 -itemcolor Blue -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[2]} {-color Blue -height 15 -itemcolor Blue -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[1]} {-color Blue -height 15 -itemcolor Blue -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0]} {-color Blue -height 15 -itemcolor Blue -radix decimal -childformat {{{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][8]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][7]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][6]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][5]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][4]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][3]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][2]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][1]} -radix unsigned} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][0]} -radix unsigned}}} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][8]} {-color Blue -itemcolor Blue -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][7]} {-color Blue -itemcolor Blue -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][6]} {-color Blue -itemcolor Blue -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][5]} {-color Blue -itemcolor Blue -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][4]} {-color Blue -itemcolor Blue -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][3]} {-color Blue -itemcolor Blue -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][2]} {-color Blue -itemcolor Blue -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][1]} {-color Blue -itemcolor Blue -radix unsigned} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg[0][0]} {-color Blue -itemcolor Blue -radix unsigned}} /tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_reg
add wave -noupdate -height 32 -expand -group Sobel3_conv -color Orange -itemcolor Orange -radix decimal -childformat {{{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1]} -radix decimal -childformat {{{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][10]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][9]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][8]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][7]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][6]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][5]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][4]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][3]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][2]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][1]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][0]} -radix decimal}}} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[0]} -radix decimal}} -expand -subitemconfig {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1]} {-color Orange -height 15 -itemcolor Orange -radix decimal -childformat {{{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][10]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][9]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][8]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][7]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][6]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][5]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][4]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][3]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][2]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][1]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][0]} -radix decimal}}} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][10]} {-color Orange -itemcolor Orange -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][9]} {-color Orange -itemcolor Orange -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][8]} {-color Orange -itemcolor Orange -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][7]} {-color Orange -itemcolor Orange -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][6]} {-color Orange -itemcolor Orange -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][5]} {-color Orange -itemcolor Orange -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][4]} {-color Orange -itemcolor Orange -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][3]} {-color Orange -itemcolor Orange -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][2]} {-color Orange -itemcolor Orange -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][1]} {-color Orange -itemcolor Orange -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[1][0]} {-color Orange -itemcolor Orange -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add[0]} {-color Orange -height 15 -itemcolor Orange -radix decimal}} /tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gx_add
add wave -noupdate -height 32 -expand -group Sobel3_conv -color Orange -itemcolor Orange -radix decimal -childformat {{{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_add[1]} -radix decimal} {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_add[0]} -radix decimal}} -expand -subitemconfig {{/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_add[1]} {-color Orange -height 15 -itemcolor Orange -radix decimal} {/tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_add[0]} {-color Orange -height 15 -itemcolor Orange -radix decimal}} /tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/gy_add

add wave -noupdate -height 32 -expand -group Sobel3_conv -color Magenta -itemcolor Magenta -radix decimal /tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/mac_temp0
add wave -noupdate -height 32 -expand -group Sobel3_conv -color Magenta -itemcolor Magenta -radix decimal /tb_sobel3_filter/uu_sobel3_filter/uu_sobel_conv/mac_temp1





run  120ms