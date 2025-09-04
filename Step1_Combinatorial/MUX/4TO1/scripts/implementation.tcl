# Parse command line arguments
set project_dir [lindex $argv 0]
set project_name "multiplexer"

# Open project and checkpoint
open_project $project_dir/$project_name.xpr
open_checkpoint $project_dir/post_synth.dcp

# Run implementation
opt_design
place_design
route_design

# Generate reports
report_utilization -file $project_dir/utilization_impl.rpt
report_timing -file $project_dir/timing_impl.rpt
report_clock_utilization -file $project_dir/clock_utilization.rpt

# Save checkpoint
write_checkpoint -force $project_dir/post_route.dcp

close_project
exit