# Learning HDL by doing

Based on the project of [The Chip Maker](https://github.com/TheChipMaker/VHDL-100-Projects-List), the idea is to learn VHDL by building one step at a time.

Each project is self-contained unless otherwise stated Test-benches will be added to each project.

## Stage 1: Combinatorial Logic

### Gates
These beginner projects will serve me to explore TCL scripts and waveform storing. I will be storing `Vivado` projects and waveforms can be seen in later with `gtkwave`. 

 1. [AND](Step1_Combinatorial/GATES/AND)
 2. [OR](Step1_Combinatorial/GATES/OR)

 ### Multiplexers
 Probably multiplexers are simple enough to be created where needed. When simple MUX projects are creates, I will explore other tools and ways to work in batch mode.

 1. [4TO1](Step1_Combinatorial/MUX/4TO1)
 
## Stage 2: Sequential Logic

### Clock Divider
Here we use sequential counters to create slower clock domains from a fast source clock. `generic` ports, and `time` types are introduced.
 1. [SIMPLE CLOCK DIVIDER](Step2_Sequential/CLOCK_DIVIDER/SIMPLE/)


## Step 3: Finite State Machines

### FSM Moore
In this section we implement Finite State Machines (FSMs) using the Moore architecture, where outputs are determined solely by the current state.

1. [TRAFFIC LIGHTS](Step3_StateMachines/FSM_MOORE/SIMPLE_TRAFFIC_LIGHT)