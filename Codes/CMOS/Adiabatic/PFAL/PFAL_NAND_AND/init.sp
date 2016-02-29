init

.options POST
.options AUTOSTOP
.options INGOLD=2     DCON=1
.options GSHUNT=1e-12 RMIN=1e-15 
.options ABSTOL=1e-5  ABSVDC=1e-4 
.options RELTOL=1e-2  RELVDC=1e-2 
.options NUMDGT=4     PIVOT=1
*.options trcon=0

*library file*
C:\synopsys\hl\hp\ptm10hp.sp

.include "F:\MAJOR_PROJECT\Codes\CMOS\Adiabatic\PFAL\PFAL_NAND_AND\PFAL_NAND_AND.sp"
.param   TEMP=27

.global gnd


va va gnd pat (1 0 0 0.1n 0.1n 3n b101000 r=5) 
vab vab gnd pat (1 0 0 0.1n 0.1n 3n b000010 r=5)
vb vb gnd pat (1 0 0 0.1n 0.1n 3n b100010 r=5) 
vbb vbb gnd pat (1 0 0 0.1n 0.1n 3n b001000 r=5) 
v2 v2 gnd PULSE 0 1 1n 1n 1n 2n 6.0n


xand v2 va vb vab vbb y yb pfal_nand_and


* Transient analysis *
.op
.TRAN 1n 25n
*.print power
************total Power Calculation(op =High)*****************
.meas tran itotal AVG i(v2) FROM=1ns TO=25ns
.meas tran vtotal AVG v(v2) FROM=1ns TO=25ns
.meas Etotal PARAM='vtotal*itotal'
************************************************** ********
.meas tran p_avg2 avg p(v2) from=1n to=25n
.end 

