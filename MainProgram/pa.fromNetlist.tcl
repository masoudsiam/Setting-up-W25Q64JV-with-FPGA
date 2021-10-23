
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name MainProgram -dir "M:/github/fpga/W25Q64JV/MainProgram/planAhead_run_3" -part xc6slx9tqg144-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "M:/github/fpga/W25Q64JV/MainProgram/MainModule.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {M:/github/fpga/W25Q64JV/MainProgram} }
set_property target_constrs_file "MainModule.ucf" [current_fileset -constrset]
add_files [list {MainModule.ucf}] -fileset [get_property constrset [current_run]]
link_design
