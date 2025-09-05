set current_dir [pwd]

file delete -force vivado*
file mkdir vivado_clk_div
cd vivado_clk_div

create_project -force clk_div ./ 

# Add files
add_files [list ../clock_divider.vhd ../tb_simple_clock_divider.vhd]

# Set top level
set_property SOURCE_SET sources_1 [get_filesets sim_1]
set_property top tb_clock_divider [get_filesets sim_1]
set_property top_lib xil_default [get_filesets sim_1]

# launch simulation
launch_simulation
restart

# vcd files
open_vcd "$current_dir/waveform_clk_div.vcd"
log_vcd /*

run all

flush_vcd
close_vcd

# exit
close_sim
close_project
exit