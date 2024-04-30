transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/CND/Digital/Projects/8-bit\ ALU\ Final\ Project/Behavioral\ ALU {D:/CND/Digital/Projects/8-bit ALU Final Project/Behavioral ALU/Arithmetic.v}
vlog -vlog01compat -work work +incdir+D:/CND/Digital/Projects/8-bit\ ALU\ Final\ Project/Behavioral\ ALU {D:/CND/Digital/Projects/8-bit ALU Final Project/Behavioral ALU/Logic.v}
vlog -vlog01compat -work work +incdir+D:/CND/Digital/Projects/8-bit\ ALU\ Final\ Project/Behavioral\ ALU {D:/CND/Digital/Projects/8-bit ALU Final Project/Behavioral ALU/Shifter.v}
vlog -vlog01compat -work work +incdir+D:/CND/Digital/Projects/8-bit\ ALU\ Final\ Project/Behavioral\ ALU {D:/CND/Digital/Projects/8-bit ALU Final Project/Behavioral ALU/ALU_TOP.v}
vlog -vlog01compat -work work +incdir+D:/CND/Digital/Projects/8-bit\ ALU\ Final\ Project/Behavioral\ ALU {D:/CND/Digital/Projects/8-bit ALU Final Project/Behavioral ALU/Control.v}
vlog -vlog01compat -work work +incdir+D:/CND/Digital/Projects/8-bit\ ALU\ Final\ Project/Behavioral\ ALU {D:/CND/Digital/Projects/8-bit ALU Final Project/Behavioral ALU/Register.v}

vlog -vlog01compat -work work +incdir+D:/CND/Digital/Projects/8-bit\ ALU\ Final\ Project/Behavioral\ ALU {D:/CND/Digital/Projects/8-bit ALU Final Project/Behavioral ALU/ALU_TOP_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  ALU_TOP_tb

add wave *
view structure
view signals
run -all
