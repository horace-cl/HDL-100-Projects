# Parse command line arguments
set main_file [lindex $argv 0]
set testbench_file [lindex $argv 1]
set project_dir [lindex $argv 2]
set part [lindex $argv 3]
set simulation_time [lindex $argv 4]
set vcd_path [lindex $argv 5]
set project_name "multiplexer"

# Cleaning 
file delete -force $project_dir
file delete -force vivado*

# Create directory and move into it
file mkdir $project_dir
cd $project_dir

# Create project
create_project -force $project_name ./ -part $part

# Add files
add_files [list $main_file $testbench_file]

# Set top for simulation
set_property top tb_multiplexer [get_filesets sim_1]

# Launch simulation
launch_simulation
restart

# VCD
open_vcd $vcd_path
log_vcd /*

# Run simulation
run $simulation_time

# Finalize VCD
flush_vcd
close_vcd

# Clean up
close_sim
close_project
exit