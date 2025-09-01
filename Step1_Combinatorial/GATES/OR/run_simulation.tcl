# ============================================================
# Vivado Batch Simulation Script
# Usage: vivado -mode batch -source run_simulation.tcl
# ============================================================

# -----------------------------
# Definitions
# -----------------------------
set project_name "or_gate_simulation"
set project_dir  "vivado_project"
set main_file    "../or_gate.vhd"
set testbench_file "../tb_or_gate.vhd"
set part         "xc7a100tcsg324-1"
set simulation_time "1000ns"

# -----------------------------
# Project Setup
# -----------------------------

# Clean and prepare directory
file delete -force $project_dir
file mkdir $project_dir
cd $project_dir

# Create project
create_project -force $project_name ./ -part $part

# Add files
add_files [list $main_file $testbench_file]

# Mark testbench as top
set_property top tb_or_gate [get_filesets sim_1]

# -----------------------------
# Simulation Flow
# -----------------------------

launch_simulation

# Add all signals to Vivado waveform viewer (optional)
add_wave -r /*

# Open VCD for GTKWave
open_vcd or_gate_waveforms.vcd

# Log everything recursively
log_vcd [get_objects -r /*]

# Run simulation
# Note: If testbench uses 'std.env.stop', replace with 'run all'
# run $simulation_time
run all

# Finalize VCD
close_vcd

# Save Vivado waveform config (optional)
save_wave_config or_gate_waveform.wcfg

# Cleanup
close_sim
close_project
exit
