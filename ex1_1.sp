.title ex1_1

******************************
**     Library setting      **
******************************

.protect
.include ../../tech_file/7nm_TT.pm
.unprotect

******
******************************
**   Circuit Description    **
******************************
.global VDD GND

**DGSB
** Pull up PMOS
MP_PU1 q  gl VDD VDD pmos_sram m=1 
MP_PU2 qb gr VDD VDD pmos_sram m=1

** Pull down NMOS
MN_PD1 q  gl GND GND nmos_sram m=1
MN_PD2 qb gr GND GND nmos_sram m=1

** Access NMOS
MN_AX1 bl  wl q  x nmos_sram m=1
MN_AX2 blb wl qb x nmos_sram m=1

**CBL  bl  GND 1e-12
**CBLB blb GND 1e-12

******************************
**       Voltage Source     **
******************************
VDD  VDD GND 0.7V
VWL  wl  GND 0V		** Hold=0V, Read=0.7V

.ic V(bl) = 0.7V
.ic V(blb) = 0.7V

************************************
** Voltage Control Voltage Source **
************************************
ELi gl GND VCVS POLY(2) v1 GND u GND 0 '1/sqrt(2)' '1/sqrt(2)'
ERi gr GND VCVS POLY(2) v2 GND u GND 0 '1/sqrt(2)' '-1/sqrt(2)'
Ev1 v1 GND VCVS POLY(2) qb GND u GND 0 'sqrt(2)'    1
Ev2 v2 GND VCVS POLY(2) q  GND u GND 0 'sqrt(2)'    -1

Vu u GND 0V

.op
.dc Vu '-1/sqrt(2)' '1/sqrt(2)' 0.0001

.option post
.option probe
.probe V(q) V(qb)
.print V(q) V(qb)

.end
