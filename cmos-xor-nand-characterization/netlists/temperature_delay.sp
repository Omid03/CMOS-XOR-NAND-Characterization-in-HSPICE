CMOS XOR-NAND: temperature / delay
**********************************Libs**********************************
.lib '../models/mm018.l'	tt
*********************************Inverter*******************************
.SUBCKT	INV	in	out
M1	out	in	0	0	nmos	L=Lmin	W=Wmin
M2	out	in	Vdin	Vdin	pmos	L=Lmin	W='2*Wmin'
Vsupply	Vdin	0	vdd
.ENDS INV
********************************CIRCUIT*********************************
X1	A	A_bar	INV
X2	B	B_bar	INV
*******************************PMOS*******************************
*********STAGE1*********
M1	N1	A	Vd	Vd	pmos	L=Lmin	W=Wpmos
M2	N1	B	Vd	Vd	pmos	L=Lmin	W=Wpmos
M3	N2	A_bar	N1	N1	pmos	L=Lmin	W=Wpmos
M4	N2	B_bar	N1	N1	pmos	L=Lmin	W=Wpmos
*********STAGE2*********
M11	out	N2	Vd	Vd	pmos	L=Lmin	W=Wpmos
M13	out	C	Vd	Vd	pmos	L=Lmin	W=Wpmos 
*******************************NMOS*******************************
*********STAGE1*********
M6	N2	A	N3	N3	nmos	L=Lmin	W=Wnmos
M7	N3	B	gnd	gnd	nmos	L=Lmin	W=Wnmos
M8	N2	A_bar	N4	N4	nmos	L=Lmin	W=Wnmos
M9	N4	B_bar	gnd	gnd	nmos	L=Lmin	W=Wnmos
*********STAGE2*********
M12	out	N2	N6	N6	nmos	L=Lmin	W=Wnmos
M14	N6	C	gnd	gnd	nmos	L=Lmin	W=Wnmos

*********************************INPUTS*********************************
Vs  Vd gnd   vdd

VA	    A	    0	PWL	    0n      0,      20n     0,      '20n+t'     vdd,    40n     vdd,    '40n+t'     0,      60n     0,      '60n+t'
+vdd,   80n     vdd,   '80n+t'      0,      100n    0,      '100n+t'    vdd,    120n    vdd,    '120n+t'    0,      140n    0,      '140n+t'    vdd,    160n    vdd

VB	    B	    0	PWL	    0n      0,      40n     0,      '40n+t'     vdd,    80n     vdd,    '80n+t'     0,      120n    0,      '120n+t'    vdd,    160n    vdd 

VC	    C	    0	PWL	    0n      0,      80n     0,      '80n+t'     vdd,    160     vdd
*******************************PARAMETERS*******************************
.param  Lmin = 180n
+ vdd = 1.8V
+ Wmin = 220n
+ Wnmos = '2*Wmin'
+ Wpmos = '6*Wmin'
+ t = 10p
******************************SIMULATION********************************
.op
.tran	    1p	    160n
.temp	0
.print      V(out)  V(A)    V(B)    V(C)
.measure	tran	tpHL	    trig	        V(A)	    td=100n	    val='vdd/2'	    cross=1
+targ	    V(out)	td=100n	    val='vdd/2'	    cross=1
.measure	tran	tpLH	    trig	        V(A)	    td=140n	    val='vdd/2'	    cross=1
+targ	    V(out)	td=140n	    val='vdd/2'	    cross=1
.temp	100
.print      V(out)  V(A)    V(B)    V(C)
.measure	tran	tpHL	    trig	        V(A)	    td=100n	    val='vdd/2'	    cross=1
+targ	    V(out)	td=100n	    val='vdd/2'	    cross=1
.measure	tran	tpLH	    trig	        V(A)	    td=140n	    val='vdd/2'	    cross=1
+targ	    V(out)	td=140n	    val='vdd/2'	    cross=1
.end