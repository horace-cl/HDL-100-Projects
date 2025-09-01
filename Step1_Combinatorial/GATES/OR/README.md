# OR Gate


- Vivado : 2023.2
- GTKWave: 3.3.104

This very simple project is used to introduce the VHDL syntax for entity, architecture and test bench definition, as well as TCL scripts and storing waveforms for latter visualization using GTKWave. 

Typically test-benches end in a `wait` (endless) statement so one can explore the waveforms in the GUI. However I saw problems when storing the waveform as `vcd` file. With this endless wait, the vcd file is empty, containing only the definitions of the signals.

Some weird behaviour is observed on the vcd file opened with GTKWave, it seems that the waveform is stored in a different statring point and continues until the whole simulation time is over by restaring the stimulus process. I explored `std.env.finish` and `std.env.stop` however both yield the same result, a truncated version of the waveform.

It seems to be a common problem with a possible solution like discussed in this [vivado question](https://adaptivesupport.amd.com/s/question/0D52E00006hpnBlSAI/issue-creating-vcd-file?language=en_US)

To run the simulation do:

`vivado -mode batch -source run_simulation.tcl`

Then, to open the waveform with GTKWave:

`gtkwave ./vivado_project/and_gate_simulation.sim/sim_1/behav/xsim/and_gate_waveform.vcd`

![Waveform](images/gtkwave_sim_or_gate.png "Screenshot from GTKWave")

To open the project with Vivado GUI:

`vivado vivado_project/and_gate_simulation.xpr`

![Waveform](images/vivado_sim_or_gate.png "Screenshot from GTKWave")