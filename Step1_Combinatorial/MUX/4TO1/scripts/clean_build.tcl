# Parse command line arguments
set project_dir [lindex $argv 0]
set project_name "multiplexer"

if {[file exists $project_dir/$project_name.xpr]} {
    open_project $project_dir/$project_name.xpr
    reset_project
    close_project
}

# Remove build artifacts but keep project structure
file delete -force $project_dir/*.dcp
file delete -force $project_dir/*.rpt
file delete -force $project_dir/*.bit
file delete -force $project_dir/*.bin
file delete -force $project_dir/*.ll
file delete -force $project_dir/.Xil

exit