.title ex1_1

******************************
**     Library setting      **
******************************

.protect
.include ../../tech_file/7nm_TT.pm
.unprotect

******************************
**   Circuit Description    **
******************************
.global VDD GND

**DGSB
** Pull up PMOS
MP_PU1 q  gl VDD x pmos_sram nfin=1 
MP_PU2 qb gr VDD x pmos_sram nfin=1

** Pull down NMOS
MN_PD1 q  gl GND x nmos_sram nfin=1
MN_PD2 qb gr GND x nmos_sram nfin=1

** Access NMOS
MN_AX1 bl  wl q  x nmos_sram nfin=1
MN_AX2 blb wl qb x nmos_sram nfin=1

CBL  bl  GND 1e-12
CBLB blb GND 1e-12

******************************
**       Voltage Source     **
******************************
VDD  VDD GND 0.7V
VWL  wl  GND 0V		** Hold=0V, Read=0.7V
VBL  bl  GND 0.7V
VBLB blb GND 0.7V

************************************
** Voltage Control Voltage Source **
************************************
ELi gl GND VCVS POLY(2) v1 GND u GND 0 '1/sqrt(2)' '1/sqrt(2)'
ERi gr GND VCVS POLY(2) v2 GND u GND 0 '1/sqrt(2)' '-1/sqrt(2)'
Ev1 v1 GND VCVS POLY(2) qb GND u GND 0 'sqrt(2)'    1
Ev2 v2 GND VCVS POLY(2) q  GND u GND 0 'sqrt(2)'    -1

Vu u GND 0V
.dc Vu '-1/sqrt(2)' '1/sqrt(2)' 0.01

.option post
.option probe
.probe v(*)
.print V(q) V(qb)


