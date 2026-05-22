onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group Control -radix hexadecimal /top/pintf/clk
add wave -noupdate -group Control -radix hexadecimal /top/pintf/rst
add wave -noupdate -group Handshake -radix hexadecimal /top/pintf/valid
add wave -noupdate -group Handshake -radix hexadecimal /top/pintf/ready
add wave -noupdate -radix hexadecimal /top/pintf/wr_rd
add wave -noupdate -radix hexadecimal /top/pintf/addr
add wave -noupdate -radix hexadecimal /top/pintf/wdata
add wave -noupdate -radix hexadecimal /top/pintf/rdata
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {37 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {105 ns}
