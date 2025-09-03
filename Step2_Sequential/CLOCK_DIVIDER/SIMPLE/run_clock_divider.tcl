# Definitions
set main_file "../simple_clock_divider.vhd"
set testbench_file "../tb_simple_clock_divider.vhd"
set part "xc7a100tcsg324-1"
set project_name "clock_divider"
set project_dir "vivado_clock"
set simulation_time "10us"

# Create directory
file mkdir $project_dir
cd $project_dir
 
# Create project
create_project -force $project_name ./ -part $part

# Add source files
add_files [list $main_file $testbench_file]

# Set simulation properties
set_property SOURCE_SET sources_1 [get_filesets sim_1]
set_property top tb_simple_clock_divider [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]

# Launch simulation
launch_simulation

# Add all signals to waveform
add_wave /tb_simple_clock_divider/*


# Log all signals in the testbench
open_vcd clock_divider.vcd
log_vcd [get_objects -r /*]

# Run the simulation
run $simulation_time

# Save waveform
save_wave_config clock_divider.wcfg

# Close vcd file
close_vcd

# Close simulation, project and exit
close_sim
close_project

exit