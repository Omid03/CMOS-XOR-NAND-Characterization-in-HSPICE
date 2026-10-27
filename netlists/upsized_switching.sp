CMOS XOR-NAND: upsized / switching
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

Vina A 0 PWL 0n 0, '15n-t' 0, 15n vdd, '35n-t' vdd, 35n 0, '50n-t' 0, 50n vdd, '52.5n-t' vdd, 52.5n 0, '55n-t' 0, 55n vdd, 
+ '57.5n-t' vdd, 57.5n 0, '60n-t' 0, 60n vdd, '62.5n-t' vdd, 62.5n 0, '65n-t' 0, 65n vdd, '67.5n-t' vdd, 67.5n 0,  
+ '80n-t' 0, 80n vdd, '100n-t' vdd, 100n 0, '102.5n-t' 0, 102.5n vdd, '105n-t' vdd, 105n 0, '107.5n-t' 0, 107.5n vdd, 
+ '110n-t' vdd, 110n 0, '112.5n-t' 0, 112.5n vdd, '115n-t' vdd, 115n 0, '117.5n-t' 0, 117.5n vdd, '125n-t' vdd, 125n 0,
+ '127.5n-t' 0, 127.5n vdd, '130n-t' vdd, 130n 0, '132.5n-t' 0, 132.5n vdd, '135n-t' vdd, 135n 0, '137.5n-t' 0, 137.5n vdd, 
+ '140n-t' vdd, 140n 0, '142.5n-t' 0, 142.5n vdd, '145n-t' vdd, 145n 0, '147.5n-t' 0, 147.5n vdd, '150n-t' vdd, 150n 0,
+ '152.5n-t' 0, 152.5n vdd, '155n-t' vdd, 155n 0, 162.5n 0


Vinb B 0 PWL 0n 0, '7.5n-t' 0, 7.5n vdd, '12.5n-t' vdd, 12.5n 0, '20n-t' 0, 20n vdd, '32.5n-t' vdd, 32.5n 0, '37.5n-t' 0, 37.5n vdd, 
+ '47.5n-t' vdd, 47.5n 0, '50n-t' 0, 50n vdd, '52.5n-t' vdd, 52.5n 0, '55n-t' 0, 55n vdd, '57.5n-t' vdd, 57.5n 0, 
+ '62.5n-t' 0, 62.5n vdd, '65n-t' vdd, 65n 0, '72.5n-t' 0, 72.5n vdd, '75n-t' vdd, 75n 0, '77.5n-t' 0, 77.5n vdd, 
+ '87.5n-t' vdd, 87.5n 0, '97.5n-t' 0, 97.5n vdd, '112.5n-t' vdd, 112.5n 0, '120n-t' 0, 120n vdd, '122.5n-t' vdd, 122.5n 0, 
+ '125n-t' 0, 125n vdd, '127.5n-t' vdd, 127.5n 0, '135n-t' 0, 135n vdd, '137.5n-t' vdd, 137.5n 0, '140n-t' 0, 140n vdd, 
+ '142.5n-t' vdd, 142.5n 0, '147.5n-t' 0, 147.5n vdd, '150n-t' vdd, 150n 0, '152.5n-t' 0, 152.5n vdd, 162.5n vdd


Vinc C 0 PWL 0n 0, '2.5n-t' 0, 2.5n vdd, '5n-t' vdd, 5n 0, '25n-t' 0, 25n vdd, '30n-t' vdd, 30n 0, '37.5n-t' 0, 37.5n vdd, 
+ '42.5n-t' vdd, 42.5n 0, '45n-t' 0, 45n vdd, '47.5n-t' vdd, 47.5n 0, '55n-t' 0, 55n vdd, '62.5n-t' vdd, 62.5n 0, 
+ '67.5n-t' 0, 67.5n vdd, '72.5n-t' vdd, 72.5n 0, '75n-t' 0, 75n vdd, '87.5n-t' vdd, 87.5n 0, '90n-t' 0, 90n vdd, 
+ '95n-t' vdd, 95n 0, '97.5n-t' 0, 97.5n vdd, '102.5n-t' vdd, 102.5n 0, '107.5n-t' 0, 107.5n vdd, '110n-t' vdd, 110n 0, 
+ '112.5n-t' 0, 112.5n vdd, '115n-t' vdd, 115n 0, '117.5n-t' 0, 117.5n vdd, '120n-t' vdd, 120n 0, '122.5n-t' 0, 122.5n vdd, 
+ '127.5n-t' vdd, 127.5n 0, '130n-t' 0, 130n vdd, '132.5n-t' vdd, 132.5n 0, '140n-t' 0, 140n vdd, '147.5n-t' vdd, 147.5n 0, 
+ '150n-t' 0, 150n vdd, '155n-t' vdd, 155n 0, 162.5n 0
*******************************PARAMETERS*******************************
.param  Lmin = 180n
+ vdd = 1.8V
+ Wmin = 220n
+ Wnmos = '2*Wmin'
+ Wpmos = '6*Wmin'
+ t = 10p
+ tpd = 130p
******************************SIMULATION********************************
.op
.tran	    1p	    162.5n
.print      V(out)  V(A)    V(B)    V(C)
.measure	tran	DynPow	AVG	power		from=tpd	to='155n+tpd'
.end