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

.include "F:\MAJOR_PROJECT\Codes\CMOS\Adiabatic\PFAL\XOR_XNOR\pfal_xor_xnor.sp"
.param   TEMP=27

.global gnd



va va gnd pulse 0 1 2n 0.1n 0.1n 2n 10n
vab vab gnd pulse 0 1 6.5n 0.1n 0.1n 2.5n 10.5n
vb vb gnd pulse 0 1 6.5n .1n .1n 2.5n 10.5n 
vbb vbb gnd pulse 0 1 2n 0.1n 0.1n 2n 10n
v2 v2 0 PULSE 1 0 0 .5n .5n 2n 5.0n

xand v2 va vb vab vbb y yb pfal_xor_xnor


* Transient analysis *
.op
.TRAN 1n 25n
.print power
.end 

