# Parse command line arguments
set main_file [lindex $argv 0]
set testbench_file [lindex $argv 1]
set project_dir [lindex $argv 2]
set part [lindex $argv 3]
set project_name "multiplexer"

# Create directory and move into it
file mkdir $project_dir
cd $project_dir

# Create project
create_project -force $project_name ./ -part $part

# Add source files
add_files [list $main_file]
add_files -fileset sim_1 [list $testbench_file]

# Set top module for synthesis
set_property top multiplexer [current_fileset]

# Run synthesis
synth_design -top multiplexer -part $part

# Generate reports
report_utilization -file ./utilization_synth.rpt
report_timing -file ./timing_synth.rpt

# Save checkpoint
write_checkpoint -force ./post_synth.dcp

close_project
exit