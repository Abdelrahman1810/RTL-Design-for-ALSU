vlib work
vlog {RTL\ALUS.v}
vlog {RTL\Register.v}
vlog {testbench\testbench.v}
vsim -voptargs=+acc work.testbench
add wave *
#add wave -r /*
run -all
# quit -sim