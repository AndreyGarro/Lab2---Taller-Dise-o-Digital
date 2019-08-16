transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/este0/Desktop/Esteban/TEC/2019\ -\ II\ Semestre/Taller\ de\ Diseno\ Digital/Lab2Ex1 {C:/Users/este0/Desktop/Esteban/TEC/2019 - II Semestre/Taller de Diseno Digital/Lab2Ex1/deco_7.sv}
vlog -sv -work work +incdir+C:/Users/este0/Desktop/Esteban/TEC/2019\ -\ II\ Semestre/Taller\ de\ Diseno\ Digital/Lab2Ex1 {C:/Users/este0/Desktop/Esteban/TEC/2019 - II Semestre/Taller de Diseno Digital/Lab2Ex1/hex7seg.sv}
vlog -sv -work work +incdir+C:/Users/este0/Desktop/Esteban/TEC/2019\ -\ II\ Semestre/Taller\ de\ Diseno\ Digital/Lab2Ex1 {C:/Users/este0/Desktop/Esteban/TEC/2019 - II Semestre/Taller de Diseno Digital/Lab2Ex1/deco_hex7seg_test.sv}

