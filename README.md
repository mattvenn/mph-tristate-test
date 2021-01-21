# Multi Project Wrapper v2

## Aim

* Allow many (<20) designers to combine their small design into a single application to the Google/Efabless/Skywater ASIC  shuttle.
* Compartmentalise the designs and allow them to be activated in turn.
* Each design should have access to all the I/O and [Caravel](https://github.com/efabless/caravel) wishbone bus.

## Version 1 issues

* The last version (submitted on first shuttle) used a MUX, which had a star topology. 
* Due to restrictions in the OpenLANE ASIC flow, all the designs had to be instantiated at the top level, then routed out to the MUX, then back to the IO.
* Each design had a different interface that required a unique instantiation. This was pretty ugly and prone to errors. 
* The MUX block had to be long and thin to fit all the pins (~3k) around the edges.

## Improvements

* Unify interface.
* Use bus topology with tristated outputs on each design, reducing routing congestion.
* Formal [proof of tristate](properties.v) that can be run as part of CI.

## Proposal

![schematic](docs/mph.jpg)

* Each project gets instantiated inside the [wrapper.v](wrapper.v)
* Wrapper provides unified interface with ~320 pins: all IO, all wishbone, reduced logic analyser (logic analyser is firmware controlled by [caravel harness picorv32](https://github.com/efabless/caravel)).
* Individual wrappers are activated by [logic analyser pins](https://github.com/mattvenn/tristate-test/blob/ee7369ed6f704a73b9106e8bdbadb4eda9e9325b/user_project_wrapper.v#L133) not connected to the wrapper.
* All the wrappers get instantiated by [user_project_wrapper.v](user_project_wrapper.v) (this is part of the Efabless harness and can't be changed.

## Individual wrapper results

* wrapper.v tested with simple 7 segment demo. 
* used [config](configs/wrapper/config.tcl) to make die size 200um x 200um

### wrapper : DESIGN=wrapper RUN_DATE=14-01_15-49

        tritonRoute_violations :                    0
              Short_violations :                    0
             MetSpc_violations :                    0
            OffGrid_violations :                    0
            MinHole_violations :                    0
              Other_violations :                    0
              Magic_violations :                    0
            antenna_violations :                    1
              lvs_total_errors :                    0
              cvc_total_errors :                    0

width x height 200 um

## Simulation

Simulation shows startup, no design active, 1st design active, 2nd design active.

    make sim # requires cocotb
    gtkwave user_project_wrapper.vcd  user_project_wrapper.gtkw

![simulation](docs/simulation.png)

## OpenLANE Results - user_project_wrapper with 16 projects 

Initial results look good. The OpenLANE flow was able to route 16 designs with only a few errors that are currently being investigated.

![gds](docs/gds.png)

Picture shows output pin connecting to an ebuf tristate cell.

![gds-ebuf](docs/ebuf-gds.png)

Yosys [cell usage report](docs/yosys_2.stat.rpt) includes 141 [sky130_fd_sc_hd__ebufn_2 tristate buffers](https://antmicro-skywater-pdk-docs.readthedocs.io/en/86-cell_cross_index/contents/libraries/sky130_fd_sc_hd/cells/ebufn/README.html) in use for individual wrapper macro.

Some [config](configs/user_project_wrapper) were created with Python [placer.py](configs/user_project_wrapper/placer.py) script.

## To resolve

* [Yosys report](docs/yosys_.chk.rpt) reports multiple conflicting drivers for all the tristated outputs.
* run a gate level simulation
* 25 DRC issues
* netlist match LVS issues

# Design Review

## Ahmed

* tristate hand placed (rather than inferred), to keep mindful, make it explicit
* better include tristate inside macro not outside to keep it the most similar as before
* use rc6 for testing
* cts outside and design uses external slow clock divider module
* ref for handplaced tristate https://github.com/shalan/DFFRAM/blob/main/Handcrafted/Models/DFFRAMBB.v#L205

## tnt

* ditch la, or most of it
* use opendb to do the bus routing and connections?
* esd diodes on inputs + buffers of tri block for protection and isolation
* looks good

# Log

## Wed 20 Jan 16:07:20 CET 2021

Trying to solve the 30->60 shorts I'm getting with tritonroute

* tried telling tritonroute to use less resources on the first 2 layers:
    set ::env(GLB_RT_L2_ADJUSTMENT) 0.2
    set ::env(GLB_RT_L3_ADJUSTMENT) 0.2
* tried setting pin order, made little difference
* tried increasing die size to 300um x 300um to increase distance between pins

## Thu 21 Jan 13:22:42 CET 2021

* made a minimal example in minimal branch, all contained in one module
* ran openlane and got no warnings
* Gate level simulation works, must provide power
* tried gatelevel sim of user_project_wrapper, works
* think that the warnings are because wrappers are already hardened and bboxed, so yosys doesn't know they are tristated outs
