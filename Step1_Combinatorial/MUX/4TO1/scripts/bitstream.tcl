# Parse command line arguments
set project_dir [lindex $argv 0]
set project_name "multiplexer"

# Open project and checkpoint
open_project $project_dir/$project_name.xpr
open_checkpoint $project_dir/post_route.dcp

# Generate bitstream
write_bitstream -force $project_dir/$project_name.bit

# Generate reports
report_timing_summary -file $project_dir/timing_summary.rpt
report_power -file $project_dir/power_analysis.rpt

echo "Bitstream generation completed: $project_dir/$project_name.bit"

close_project
exit