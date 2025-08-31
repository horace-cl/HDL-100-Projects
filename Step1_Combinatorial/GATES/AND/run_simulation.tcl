# Set project variables
set project_name "and_gate_simulation"
set project_dir "vivado_project"
set main_file "../and_gate.vhdl"
set testbench_file "../tb_and_gate.vhdl"
set simulation_time "400ns"
set part "xc7a100tcsg324-1" 

# Create results directory
file mkdir $project_dir
cd $project_dir

# Remove existing project directory if it exists
file delete -force $project_dir 

# Create physical project directory
create_project -force $project_name ./ -part $part

# Add source files
add_files [list $main_file $testbench_file]

# Set simulation properties
set_property SOURCE_SET sources_1 [get_filesets sim_1]
set_property top tb_and_gate [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]

# Launch simulation
launch_simulation

# Add all signals to waveform
add_wave /tb_and_gate/*


# Log all signals in the testbench
open_vcd and_gate_waveform.vcd
log_vcd [get_objects -r /*]

# Run the simulation
run $simulation_time

# Save waveform
save_wave_config and_gate_waveform.wcfg

# Close vcd file
close_vcd

# Close simulation, project and exit
close_sim
close_project

exit