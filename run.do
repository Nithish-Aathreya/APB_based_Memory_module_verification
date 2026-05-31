vlog -sv list.svh

vopt top +cover=fcbest -o test1

vsim -coverage -assertdebug test1 -sv_seed 5558978

coverage save -onexit test1.ucdb

add wave -position insertpoint -radix hex sim:/pintf/*
#add wave -assertion sim:/top/*

# do wave.do   

run -all
