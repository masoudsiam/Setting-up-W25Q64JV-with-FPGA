
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name MainProgram -dir "M:/github/fpga/W25Q64JV/MainProgram/planAhead_run_1" -part xc6slx9tqg144-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "MainModule.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {UART_Receiver.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {BaudRate_Generator.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {MainModule.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top MainModule $srcset
add_files [list {MainModule.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9tqg144-2
