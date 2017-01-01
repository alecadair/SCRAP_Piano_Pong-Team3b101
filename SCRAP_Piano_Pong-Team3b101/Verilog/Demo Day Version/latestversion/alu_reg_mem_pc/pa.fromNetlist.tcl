
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name alu_reg_mem_pc -dir "C:/Users/u0376370/Desktop/alu_reg_mem_pc_control/alu_reg_mem_pc/planAhead_run_2" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/u0376370/Desktop/alu_reg_mem_pc_control/alu_reg_mem_pc/controller_alu_reg_mem_pc.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/u0376370/Desktop/alu_reg_mem_pc_control/alu_reg_mem_pc} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "controller_alu_reg_mem_pc.ucf" [current_fileset -constrset]
add_files [list {controller_alu_reg_mem_pc.ucf}] -fileset [get_property constrset [current_run]]
link_design
